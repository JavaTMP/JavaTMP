package com.javatmp.demo.crypto.crl.example;

import com.javatmp.demo.crypto.crl.Utils;
import org.bouncycastle.asn1.DEROctetString;
import org.bouncycastle.asn1.ocsp.OCSPObjectIdentifiers;
import org.bouncycastle.asn1.x509.Extension;
import org.bouncycastle.asn1.x509.Extensions;
import org.bouncycastle.cert.jcajce.JcaX509CertificateHolder;
import org.bouncycastle.cert.ocsp.*;
import org.bouncycastle.cert.ocsp.jcajce.JcaCertificateID;
import org.bouncycastle.jce.provider.BouncyCastleProvider;
import org.bouncycastle.operator.DigestCalculator;
import org.bouncycastle.operator.OperatorCreationException;
import org.bouncycastle.operator.jcajce.JcaDigestCalculatorProviderBuilder;

import java.math.BigInteger;
import java.security.KeyPair;
import java.security.Security;
import java.security.cert.CertificateEncodingException;
import java.security.cert.X509Certificate;

/**
 * Example of unsigned OCSP request generation.
 */
public class OCSPClientExample {
    static {
        // https://stackoverflow.com/questions/40975510/spring-boot-and-jca-providers
        if (Security.getProvider(BouncyCastleProvider.PROVIDER_NAME) == null) {
            Security.addProvider(new BouncyCastleProvider());
        }
    }
    public static OCSPReq generateOCSPRequest(X509Certificate issuerCert, BigInteger serialNumber)
            throws OCSPException, OperatorCreationException, CertificateEncodingException {

        DigestCalculator digestCalculator =
                new JcaDigestCalculatorProviderBuilder().build()
                        .get(CertificateID.HASH_SHA1);

        // Generate the id for the certificate we are looking for
        CertificateID id = new CertificateID(
                digestCalculator, new JcaX509CertificateHolder(issuerCert),
                serialNumber);
        id = new JcaCertificateID(
                digestCalculator, issuerCert,
                serialNumber);

        // basic request generation with nonce
        OCSPReqBuilder gen = new OCSPReqBuilder();

        gen.addRequest(id);

        // create details for nonce extension
        BigInteger nonce = BigInteger.valueOf(System.currentTimeMillis());
        Extension ext = new Extension(OCSPObjectIdentifiers.id_pkix_ocsp_nonce,
                true, new DEROctetString(nonce.toByteArray()));
        gen.setRequestExtensions(new Extensions(new Extension[] { ext }));
        return gen.build();
    }

    public static void main(String[] args) throws Exception {
        // create certificates and CRLs
        KeyPair rootPair = Utils.generateRSAKeyPair();
        KeyPair interPair = Utils.generateRSAKeyPair();

        X509Certificate rootCert = Utils.generateRootCert(rootPair);
        X509Certificate interCert = Utils.generateIntermediateCert(interPair.getPublic(), rootPair.getPrivate(), rootCert);

        OCSPReq request = generateOCSPRequest(rootCert, interCert.getSerialNumber());

        Req[] requests = request.getRequestList();

        for (int i = 0; i != requests.length; i++) {
            CertificateID certID = requests[i].getCertID();

            System.out.println("OCSP Request to check certificate number " + certID.getSerialNumber());
        }
    }
}
