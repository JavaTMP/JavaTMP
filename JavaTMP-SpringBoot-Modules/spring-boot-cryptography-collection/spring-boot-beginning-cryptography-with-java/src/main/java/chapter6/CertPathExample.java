package chapter6;

import org.bouncycastle.jce.provider.BouncyCastleProvider;

import java.io.ByteArrayInputStream;
import java.security.Security;
import java.security.cert.CertPath;
import java.security.cert.CertificateFactory;
import java.security.cert.X509Certificate;
import java.util.Arrays;

/**
 * Basic example of creating and encoding a CertPath.
 */
public class CertPathExample {
    static {
        // https://stackoverflow.com/questions/40975510/spring-boot-and-jca-providers
        if (Security.getProvider(BouncyCastleProvider.PROVIDER_NAME) == null) {
            Security.addProvider(new BouncyCastleProvider());
        }
    }
    public static void main(String[] args) throws Exception {

        X509Certificate[] chain = PKCS10CertCreateExample.buildChain();

        // create the factory and path object
        CertificateFactory fact = CertificateFactory
                .getInstance("X.509",
                        BouncyCastleProvider.PROVIDER_NAME);
        CertPath certPath = fact.generateCertPath(Arrays.asList(chain));

        byte[] encoded = certPath.getEncoded("PEM");

        System.out.println(toString(encoded));

        // re-read the CertPath
        CertPath newCertPath = fact.generateCertPath(
                new ByteArrayInputStream(encoded), "PEM");

        if (newCertPath.equals(certPath)) {
            System.out.println("CertPath recovered correctly");
        }
    }
}
