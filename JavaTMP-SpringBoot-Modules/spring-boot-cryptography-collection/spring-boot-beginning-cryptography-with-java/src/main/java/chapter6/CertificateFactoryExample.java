package chapter6;

import org.bouncycastle.jce.provider.BouncyCastleProvider;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.security.KeyPair;
import java.security.Security;
import java.security.cert.CertificateFactory;
import java.security.cert.X509Certificate;

/**
 * Basic example of using a CertificateFactory.
 */
public class CertificateFactoryExample {
    static {
        // https://stackoverflow.com/questions/40975510/spring-boot-and-jca-providers
        if (Security.getProvider(BouncyCastleProvider.PROVIDER_NAME) == null) {
            Security.addProvider(new BouncyCastleProvider());
        }
    }

    public static void main(String[] args) throws Exception {
        // create the keys
        KeyPair pair = Utils.generateRSAKeyPair();

        // create the certificate factory
        CertificateFactory fact = CertificateFactory.getInstance("X.509", "BC");

        // create the input stream
        ByteArrayOutputStream bOut = null;
        InputStream in = null;
        X509Certificate x509Cert = null;
        X509Certificate x509CertificateSrc = null;

        x509CertificateSrc =
                X509V1CreateExample.generateV1Certificate(pair);
        bOut = new ByteArrayOutputStream();
        bOut.write(x509CertificateSrc.getEncoded());
        bOut.close();
        in = new ByteArrayInputStream(bOut.toByteArray());
        // read the certificate
        x509Cert = (X509Certificate) fact.generateCertificate(in);

        System.out.println("issuer: " + x509Cert.getIssuerX500Principal());

        // create the keys
        pair = Utils.generateRSAKeyPair();

        // create the certificate factory
        fact = CertificateFactory.getInstance("X.509", "BC");

        // create the input stream
        bOut = null;
        in = null;
        x509Cert = null;
        x509CertificateSrc = null;

        x509CertificateSrc =
                X509V1CreateExample.generateV1CertificateV3(pair);
        bOut = new ByteArrayOutputStream();
        bOut.write(x509CertificateSrc.getEncoded());
        bOut.close();
        in = new ByteArrayInputStream(bOut.toByteArray());
        // read the certificate
        x509Cert = (X509Certificate) fact.generateCertificate(in);

        System.out.println("issuer: " + x509Cert.getIssuerX500Principal());

        x509CertificateSrc =
                X509V1CreateExample.generateV1CertificateV2(pair);

        bOut = new ByteArrayOutputStream();
        bOut.write(x509CertificateSrc.getEncoded());
        bOut.close();
        in = new ByteArrayInputStream(bOut.toByteArray());
        // read the certificate
        x509Cert = (X509Certificate) fact.generateCertificate(in);

        System.out.println("issuer: " + x509Cert.getIssuerX500Principal());
    }
}
