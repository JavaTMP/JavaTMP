package com.javatmp.demo.crypto.certificate.example;

import com.javatmp.demo.crypto.certificate.Utils;
import org.bouncycastle.asn1.x509.*;
import org.bouncycastle.jce.provider.BouncyCastleProvider;
import org.bouncycastle.x509.X509V3CertificateGenerator;

import javax.security.auth.x500.X500Principal;
import java.math.BigInteger;
import java.security.*;
import java.security.cert.X509Certificate;
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

        certGen.addExtension(X509Extensions.BasicConstraints,
                true, new BasicConstraints(false));

        certGen.addExtension(X509Extensions.KeyUsage, true,
                new KeyUsage(
                        KeyUsage.digitalSignature |
                                KeyUsage.keyEncipherment));

        certGen.addExtension(X509Extensions.ExtendedKeyUsage, true,
                new ExtendedKeyUsage(KeyPurposeId.id_kp_serverAuth));

        certGen.addExtension(X509Extensions.SubjectAlternativeName, false,
                new GeneralNames(new GeneralName(GeneralName.rfc822Name,
                        "test@test.test")));

        return certGen.generateX509Certificate(pair.getPrivate(), "BC");
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

    }
}
