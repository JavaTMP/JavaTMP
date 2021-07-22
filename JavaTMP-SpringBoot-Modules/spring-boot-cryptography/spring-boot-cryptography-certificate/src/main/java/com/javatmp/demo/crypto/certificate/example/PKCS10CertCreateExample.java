package com.javatmp.demo.crypto.certificate.example;

import com.javatmp.demo.crypto.certificate.Utils;
import org.bouncycastle.asn1.ASN1ObjectIdentifier;
import org.bouncycastle.asn1.pkcs.Attribute;
import org.bouncycastle.asn1.pkcs.PKCSObjectIdentifiers;
import org.bouncycastle.asn1.x500.X500Name;
import org.bouncycastle.asn1.x500.X500NameBuilder;
import org.bouncycastle.asn1.x500.style.BCStyle;
import org.bouncycastle.asn1.x509.*;
import org.bouncycastle.cert.jcajce.JcaX509CertificateConverter;
import org.bouncycastle.cert.jcajce.JcaX509ExtensionUtils;
import org.bouncycastle.cert.jcajce.JcaX509v3CertificateBuilder;
import org.bouncycastle.jce.provider.BouncyCastleProvider;
import org.bouncycastle.openssl.jcajce.JcaPEMKeyConverter;
import org.bouncycastle.operator.ContentSigner;
import org.bouncycastle.operator.ContentVerifierProvider;
import org.bouncycastle.operator.jcajce.JcaContentSignerBuilder;
import org.bouncycastle.operator.jcajce.JcaContentVerifierProviderBuilder;
import org.bouncycastle.pkcs.PKCS10CertificationRequest;
import org.bouncycastle.util.io.pem.PemObject;
import org.bouncycastle.util.io.pem.PemWriter;

import java.io.OutputStreamWriter;
import java.math.BigInteger;
import java.security.KeyPair;
import java.security.PublicKey;
import java.security.Security;
import java.security.cert.X509Certificate;
import java.util.Date;
import java.util.Enumeration;

/**
 * An example of a basic CA.
 */
public class PKCS10CertCreateExample {
    static {
        // https://stackoverflow.com/questions/40975510/spring-boot-and-jca-providers
        if (Security.getProvider(BouncyCastleProvider.PROVIDER_NAME) == null) {
            Security.addProvider(new BouncyCastleProvider());
        }
    }

    public static X509Certificate[] buildChain() throws Exception {
        // create the certification request
        KeyPair pair = Utils.generateRSAKeyPair();

        PKCS10CertificationRequest request = PKCS10ExtensionExampleNew.generateRequest(pair);

        // create a root certificate
        KeyPair rootPair = Utils.generateRSAKeyPair();
        X509Certificate rootCert = X509V1CreateExampleNew.generateV1Certificate(
                rootPair,
                "CN=Test Certificate",
                "CN=Test Certificate",
                100,
                "SHA256WithRSAEncryption"
        );

        ContentVerifierProvider contentVerifierProvider =
                new JcaContentVerifierProviderBuilder()
                        .setProvider(BouncyCastleProvider.PROVIDER_NAME)
                        .build(pair.getPublic());

        // validate the certification request
        if (!request.isSignatureValid(contentVerifierProvider)) {
            System.out.println("request failed to verify!");
            System.exit(1);
        }

        // https://stackoverflow.com/questions/11028932/how-to-get-publickey-from-pkcs10certificationrequest-using-new-bouncy-castle-lib
        PublicKey publicKey = new JcaPEMKeyConverter()
                .getPublicKey(request.getSubjectPublicKeyInfo());

        X500NameBuilder issuerBuilder =
                new X500NameBuilder(X500Name.getDefaultStyle());
        issuerBuilder.addRDN(BCStyle.CN, rootCert.getSubjectX500Principal().getName());

        JcaX509v3CertificateBuilder certBuilder =
                new JcaX509v3CertificateBuilder(
                        issuerBuilder.build(),
                        BigInteger.valueOf(System.currentTimeMillis()),
                        new Date(System.currentTimeMillis()),
                        new Date(System.currentTimeMillis() + 50000),
                        request.getSubject(),
                        publicKey
                );
        // create the certificate using the information in the request


        JcaX509ExtensionUtils utils = new JcaX509ExtensionUtils();

        certBuilder.addExtension(Extension.authorityKeyIdentifier, false,
                utils.createAuthorityKeyIdentifier(publicKey));
        certBuilder.addExtension(Extension.subjectKeyIdentifier, false,
                utils.createSubjectKeyIdentifier(publicKey));
        certBuilder.addExtension(Extension.basicConstraints, true,
                new BasicConstraints(false));
        certBuilder.addExtension(Extension.keyUsage, true,
                new KeyUsage(KeyUsage.digitalSignature
                        | KeyUsage.keyEncipherment));
        certBuilder.addExtension(Extension.extendedKeyUsage, true,
                new ExtendedKeyUsage(KeyPurposeId.id_kp_serverAuth));

        // extract the extension request attribute
        Attribute[] attributes = request.getAttributes();

        for (int i = 0; i != attributes.length; i++) {
            Attribute attr = Attribute.getInstance(attributes[i]);

            // process extension request
            if (attr.getAttrType().equals(PKCSObjectIdentifiers.pkcs_9_at_extensionRequest)) {
                Extensions extensions = Extensions.getInstance(attr.getAttrValues().getObjectAt(0));

                Enumeration e = extensions.oids();
                while (e.hasMoreElements()) {
                    ASN1ObjectIdentifier oid = (ASN1ObjectIdentifier) e.nextElement();
                    Extension ext = extensions.getExtension(oid);
                    certBuilder.addExtension(oid, ext.isCritical(), ext.getExtnValue().getOctets());
                }
            }
        }
        String signatureAlgorithm = "SHA256WithRSAEncryption"; // <-- Use appropriate signature algorithm based on your keyPair algorithm.
        ContentSigner rootContentSigner =
                new JcaContentSignerBuilder(signatureAlgorithm)
                        .build(rootPair.getPrivate());

        X509Certificate issuedCert = new JcaX509CertificateConverter()
                .setProvider(BouncyCastleProvider.PROVIDER_NAME)
                .getCertificate(certBuilder.build(rootContentSigner));

        return new X509Certificate[]{issuedCert, rootCert};
    }

    public static void main(String[] args) throws Exception {

        X509Certificate[] chain = buildChain();

        PemWriter pemWrt = new PemWriter(new OutputStreamWriter(System.out));

        pemWrt.writeObject(new PemObject("CERTIFICATE", chain[0].getEncoded()));
        pemWrt.writeObject(new PemObject("CERTIFICATE", chain[1].getEncoded()));

        pemWrt.close();
    }
}
