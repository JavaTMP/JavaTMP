package com.javatmp.demo.crypto.certificate.example;

import com.javatmp.demo.crypto.certificate.Utils;
import org.bouncycastle.asn1.ASN1ObjectIdentifier;
import org.bouncycastle.asn1.x500.X500Name;
import org.bouncycastle.asn1.x509.*;
import org.bouncycastle.cert.jcajce.JcaX509CertificateConverter;
import org.bouncycastle.cert.jcajce.JcaX509v3CertificateBuilder;
import org.bouncycastle.jce.provider.BouncyCastleProvider;
import org.bouncycastle.operator.ContentSigner;
import org.bouncycastle.operator.OperatorCreationException;
import org.bouncycastle.operator.jcajce.JcaContentSignerBuilder;
import org.bouncycastle.x509.X509V3CertificateGenerator;

import javax.security.auth.x500.X500Principal;
import java.io.IOException;
import java.math.BigInteger;
import java.security.*;
import java.security.cert.CertificateException;
import java.security.cert.X509Certificate;
import java.util.Calendar;
import java.util.Date;


/**
 * Basic X.509 V3 Certificate creation with TLS flagging.
 */
public class X509V3CreateExample {

    static {
        // https://stackoverflow.com/questions/40975510/spring-boot-and-jca-providers
        if (Security.getProvider(BouncyCastleProvider.PROVIDER_NAME) == null) {
            Security.addProvider(new BouncyCastleProvider());
        }
    }

    public static X509Certificate generateV3Certificate(KeyPair pair)
            throws InvalidKeyException, NoSuchProviderException, SignatureException {
        // generate the certificate
        X509V3CertificateGenerator certGen = new X509V3CertificateGenerator();

        certGen.setSerialNumber(BigInteger.valueOf(System.currentTimeMillis()));
        certGen.setIssuerDN(new X500Principal("CN=Test Certificate"));
        certGen.setNotBefore(new Date(System.currentTimeMillis() - 50000));
        certGen.setNotAfter(new Date(System.currentTimeMillis() + 50000));
        certGen.setSubjectDN(new X500Principal("CN=Test Certificate"));
        certGen.setPublicKey(pair.getPublic());
        certGen.setSignatureAlgorithm("SHA256WithRSAEncryption");

        certGen.addExtension(X509Extensions.BasicConstraints, true, new BasicConstraints(false));

        certGen.addExtension(X509Extensions.KeyUsage, true, new KeyUsage(KeyUsage.digitalSignature | KeyUsage.keyEncipherment));

        certGen.addExtension(X509Extensions.ExtendedKeyUsage, true, new ExtendedKeyUsage(KeyPurposeId.id_kp_serverAuth));

        certGen.addExtension(X509Extensions.SubjectAlternativeName, false,
                new GeneralNames(new GeneralName(GeneralName.rfc822Name, "test@test.test")));

        return certGen.generateX509Certificate(pair.getPrivate(), "BC");
    }

    // https://stackoverflow.com/questions/29852290/self-signed-x509-certificate-with-bouncy-castle-in-java
    public static X509Certificate selfSign(KeyPair keyPair,
                                           String subjectDN)
            throws OperatorCreationException, IOException, CertificateException {

        long now = System.currentTimeMillis();
        Date startDate = new Date(now);

        X500Name dnName = new X500Name(subjectDN);
        BigInteger certSerialNumber = new BigInteger(Long.toString(now)); // <-- Using the current timestamp as the certificate serial number

        Calendar calendar = Calendar.getInstance();
        calendar.setTime(startDate);
        calendar.add(Calendar.YEAR, 1); // <-- 1 Yr validity

        Date endDate = calendar.getTime();

        String signatureAlgorithm = "SHA256WithRSA"; // <-- Use appropriate signature algorithm based on your keyPair algorithm.

        ContentSigner contentSigner =
                new JcaContentSignerBuilder(signatureAlgorithm)
                        .build(keyPair.getPrivate());

        JcaX509v3CertificateBuilder certBuilder =
                new JcaX509v3CertificateBuilder(
                        dnName,
                        certSerialNumber,
                        startDate,
                        endDate,
                        dnName,
                        keyPair.getPublic()
                );

        // Extensions --------------------------

        // Basic Constraints
        BasicConstraints basicConstraints = new BasicConstraints(true); // <-- true for CA, false for EndEntity

        certBuilder.addExtension(new ASN1ObjectIdentifier("2.5.29.19"), true, basicConstraints); // Basic Constraints is usually marked as critical.

        // -------------------------------------

        return new JcaX509CertificateConverter()
                .setProvider(BouncyCastleProvider.PROVIDER_NAME)
                .getCertificate(certBuilder.build(contentSigner));
    }

    public static void main(String[] args) throws Exception {
        // create the keys
        KeyPair pair = Utils.generateRSAKeyPair();

        // generate the certificate
        X509Certificate cert = generateV3Certificate(pair);

        // show some basic validation
        cert.checkValidity(new Date());

        cert.verify(cert.getPublicKey());

        System.out.println("valid certificate generated");

        cert = selfSign(pair, "CN=Test Certificate");

        // show some basic validation
        cert.checkValidity(new Date());

        cert.verify(cert.getPublicKey());

        System.out.println("valid certificate generated");
    }
}
