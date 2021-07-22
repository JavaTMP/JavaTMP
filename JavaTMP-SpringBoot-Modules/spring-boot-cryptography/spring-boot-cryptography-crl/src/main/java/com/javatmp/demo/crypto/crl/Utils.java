package com.javatmp.demo.crypto.crl;

import com.javatmp.demo.crypto.certificate.example.X509V1CreateExampleNew;
import org.bouncycastle.asn1.x509.BasicConstraints;
import org.bouncycastle.asn1.x509.Extension;
import org.bouncycastle.asn1.x509.KeyUsage;
import org.bouncycastle.cert.jcajce.JcaX509CertificateConverter;
import org.bouncycastle.cert.jcajce.JcaX509ExtensionUtils;
import org.bouncycastle.cert.jcajce.JcaX509v3CertificateBuilder;
import org.bouncycastle.jce.provider.BouncyCastleProvider;
import org.bouncycastle.operator.ContentSigner;
import org.bouncycastle.operator.jcajce.JcaContentSignerBuilder;

import javax.security.auth.x500.X500Principal;
import java.math.BigInteger;
import java.security.KeyPair;
import java.security.PrivateKey;
import java.security.PublicKey;
import java.security.cert.X509Certificate;
import java.util.Date;

/**
 * Chapter 7 Utils
 */
public class Utils extends com.javatmp.demo.crypto.certificate.Utils {
    private static final int VALIDITY_PERIOD = 7 * 24 * 60 * 60 * 1000; // one week

    /**
     * Generate a sample V1 certificate to use as a CA root certificate
     */
    public static X509Certificate generateRootCert(KeyPair pair)
            throws Exception {
        return X509V1CreateExampleNew.generateV1Certificate(pair,"CN=Test CA Certificate", "CN=Test CA Certificate",
                VALIDITY_PERIOD / 24 * 60 * 60 * 1000, "SHA1WithRSAEncryption");
    }

    /**
     * Generate a sample V3 certificate to use as an intermediate CA certificate
     */
    public static X509Certificate generateIntermediateCert(
            PublicKey intKey, PrivateKey caKey, X509Certificate caCert)
            throws Exception {

        JcaX509v3CertificateBuilder certBuilder =
                new JcaX509v3CertificateBuilder(
                        caCert.getSubjectX500Principal(),
                        BigInteger.valueOf(1),
                        new Date(System.currentTimeMillis()),
                        new Date(System.currentTimeMillis() + VALIDITY_PERIOD),
                        new X500Principal("CN=Test Intermediate Certificate"),
                        intKey
                );
        JcaX509ExtensionUtils utils = new JcaX509ExtensionUtils();
        certBuilder.addExtension(Extension.authorityKeyIdentifier,
                false, utils.createAuthorityKeyIdentifier(caCert));
        certBuilder.addExtension(Extension.subjectKeyIdentifier,
                false, utils.createSubjectKeyIdentifier(intKey));
        certBuilder.addExtension(Extension.basicConstraints, true, new BasicConstraints(0));
        certBuilder.addExtension(Extension.keyUsage, true,
                new KeyUsage(KeyUsage.digitalSignature | KeyUsage.keyCertSign | KeyUsage.cRLSign));

        String issuerSignatureAlgorithm = "SHA256WithRSAEncryption"; // <-- Use appropriate signature algorithm based on your keyPair algorithm.
        ContentSigner issuerContentSigner =
                new JcaContentSignerBuilder(issuerSignatureAlgorithm)
                        .build(caKey);

        return new JcaX509CertificateConverter()
                .setProvider(BouncyCastleProvider.PROVIDER_NAME)
                .getCertificate(certBuilder.build(issuerContentSigner));
    }

    /**
     * Generate a sample V3 certificate to use as an end entity certificate
     */
    public static X509Certificate generateEndEntityCert(
            PublicKey entityKey, PrivateKey caKey, X509Certificate caCert)
            throws Exception {

        JcaX509v3CertificateBuilder certBuilder =
                new JcaX509v3CertificateBuilder(
                        caCert.getSubjectX500Principal(),
                        BigInteger.valueOf(1),
                        new Date(System.currentTimeMillis()),
                        new Date(System.currentTimeMillis() + VALIDITY_PERIOD),
                        new X500Principal("CN=Test End Certificate"),
                        entityKey
                );
        JcaX509ExtensionUtils utils = new JcaX509ExtensionUtils();
        certBuilder.addExtension(Extension.authorityKeyIdentifier,
                false, utils.createAuthorityKeyIdentifier(caCert));
        certBuilder.addExtension(Extension.subjectKeyIdentifier,
                false, utils.createSubjectKeyIdentifier(entityKey));
        certBuilder.addExtension(Extension.basicConstraints, true, new BasicConstraints(false));
        certBuilder.addExtension(Extension.keyUsage, true,
                new KeyUsage(KeyUsage.digitalSignature | KeyUsage.keyEncipherment));

        String issuerSignatureAlgorithm = "SHA256WithRSAEncryption"; // <-- Use appropriate signature algorithm based on your keyPair algorithm.
        ContentSigner issuerContentSigner =
                new JcaContentSignerBuilder(issuerSignatureAlgorithm)
                        .build(caKey);

        return new JcaX509CertificateConverter()
                .setProvider(BouncyCastleProvider.PROVIDER_NAME)
                .getCertificate(certBuilder.build(issuerContentSigner));
    }
}
