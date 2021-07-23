package chapter7;

import org.bouncycastle.asn1.ASN1ObjectIdentifier;
import org.bouncycastle.asn1.ocsp.OCSPObjectIdentifiers;
import org.bouncycastle.asn1.x509.CRLReason;
import org.bouncycastle.asn1.x509.Extension;
import org.bouncycastle.asn1.x509.Extensions;
import org.bouncycastle.asn1.x509.SubjectPublicKeyInfo;
import org.bouncycastle.cert.X509CertificateHolder;
import org.bouncycastle.cert.jcajce.JcaX509CertificateHolder;
import org.bouncycastle.cert.ocsp.*;
import org.bouncycastle.jce.provider.BouncyCastleProvider;
import org.bouncycastle.operator.ContentSigner;
import org.bouncycastle.operator.ContentVerifierProvider;
import org.bouncycastle.operator.DigestCalculator;
import org.bouncycastle.operator.OperatorCreationException;
import org.bouncycastle.operator.jcajce.JcaContentSignerBuilder;
import org.bouncycastle.operator.jcajce.JcaContentVerifierProviderBuilder;
import org.bouncycastle.operator.jcajce.JcaDigestCalculatorProviderBuilder;

import java.io.IOException;
import java.math.BigInteger;
import java.security.*;
import java.security.cert.CertificateEncodingException;
import java.security.cert.X509Certificate;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

/**
 * Example of OCSP response generation.
 */
public class OCSPResponderExample {
    static {
        // https://stackoverflow.com/questions/40975510/spring-boot-and-jca-providers
        if (Security.getProvider(BouncyCastleProvider.PROVIDER_NAME) == null) {
            Security.addProvider(new BouncyCastleProvider());
        }
    }
    public static OCSPResp generateOCSPResponse(
//            X509Certificate caCert,
            OCSPReq request, PrivateKey responderKey, PublicKey pubKey,
            CertificateID revokedID)
            throws NoSuchProviderException, OCSPException, OperatorCreationException, CertificateEncodingException, IOException {
        DigestCalculator digestCalculator =
                new JcaDigestCalculatorProviderBuilder().build()
                        .get(CertificateID.HASH_SHA1);
        SubjectPublicKeyInfo keyInfo =
                new SubjectPublicKeyInfo(CertificateID.HASH_SHA1,
                        pubKey.getEncoded());
        BasicOCSPRespBuilder builder =
                new BasicOCSPRespBuilder(keyInfo, digestCalculator);

        List<ASN1ObjectIdentifier> reqExtensions =
                (List<ASN1ObjectIdentifier>) request.getExtensionOIDs();
        // print all exts:
        for (ASN1ObjectIdentifier extId : reqExtensions) {
            Extension ext = request.getExtension(extId);
            System.out.println("ext id = " + ext.getExtnId().toString());
        }
        Extension extension = request.getExtension(OCSPObjectIdentifiers.id_pkix_ocsp_nonce);

        if (extension != null) {
            builder.setResponseExtensions(
                    new Extensions(
                            new Extension[]{extension}));
        }

        Req[] requests = request.getRequestList();

        for (int i = 0; i != requests.length; i++) {
            CertificateID certID = requests[i].getCertID();

            // this would normally be a lot more general!
            if (certID.equals(revokedID)) {
                builder.addResponse(certID, new RevokedStatus(new Date(), CRLReason.privilegeWithdrawn));
            } else {
                builder.addResponse(certID, CertificateStatus.GOOD);
            }
        }
        X509CertificateHolder[] certs = request.getCerts(); // or CA Certificate
//        certs = new X509CertificateHolder[]{new X509CertificateHolder(caCert.getEncoded())};
        ContentSigner contentSigner = /*new BufferingContentSigner(*/
                new JcaContentSignerBuilder("SHA1WithRSAEncryption")
                        .setProvider(BouncyCastleProvider.PROVIDER_NAME)
                        .build(responderKey); // , 20480);
        BasicOCSPResp basicResp = builder.build(contentSigner, certs, new Date());
//        BasicOCSPResp basicResp = builder.generate( responderKey, null, new Date(), "BC");

        OCSPRespBuilder respGen = new OCSPRespBuilder();

        return respGen.build(OCSPRespBuilder.SUCCESSFUL, basicResp);
    }

    public static String getStatusMessage(
            KeyPair responderPair, X509Certificate caCert,
            BigInteger revokedSerialNumber, X509Certificate cert)
            throws Exception {
        OCSPReq request = OCSPClientExample.generateOCSPRequest(caCert, cert.getSerialNumber());

        DigestCalculator digestCalculator =
                new JcaDigestCalculatorProviderBuilder().build()
                        .get(CertificateID.HASH_SHA1);

        // Generate the id for the certificate we are looking for
        CertificateID revokedID = new CertificateID(
                digestCalculator, new JcaX509CertificateHolder(caCert),
                revokedSerialNumber);

        OCSPResp response = generateOCSPResponse(
//                caCert,
                request, responderPair.getPrivate(), responderPair.getPublic(), revokedID);

        BasicOCSPResp basicResponse = (BasicOCSPResp) response.getResponseObject();

        // verify the response
        ContentVerifierProvider verifierProvider = new JcaContentVerifierProviderBuilder()
                .setProvider(BouncyCastleProvider.PROVIDER_NAME)
                .build(responderPair.getPublic());
        if (basicResponse.isSignatureValid(verifierProvider)) {
            SingleResp[] responses = basicResponse.getResponses();

            Extension extension = request.getExtension(OCSPObjectIdentifiers.id_pkix_ocsp_nonce);
            byte[] reqNonce = extension.getEncoded();
            Extension basicResponseExtension = basicResponse.getExtension(OCSPObjectIdentifiers.id_pkix_ocsp_nonce);
            byte[] respNonce = basicResponseExtension.getEncoded();

            // validate the nonce if it is present
            if (reqNonce == null || Arrays.equals(reqNonce, respNonce)) {
                String message = "";
                for (int i = 0; i != responses.length; i++) {
                    message += " certificate number " + responses[i].getCertID().getSerialNumber();
                    if (responses[i].getCertStatus() == CertificateStatus.GOOD) {
                        return message + " status: good";
                    } else {
                        return message + " status: revoked";
                    }
                }

                return message;
            } else {
                return "response nonce failed to validate";
            }
        } else {
            return "response failed to verify";
        }
    }

    public static void main(
            String[] args)
            throws Exception {
        KeyPair rootPair = Utils.generateRSAKeyPair();
        KeyPair interPair = Utils.generateRSAKeyPair();

        X509Certificate rootCert = Utils.generateRootCert(rootPair);
        X509Certificate interCert = Utils.generateIntermediateCert(interPair.getPublic(), rootPair.getPrivate(), rootCert);

        System.out.println(getStatusMessage(rootPair, rootCert,
                BigInteger.valueOf(1), interCert));
        System.out.println(getStatusMessage(rootPair, rootCert,
                BigInteger.valueOf(2), interCert));
    }
}
