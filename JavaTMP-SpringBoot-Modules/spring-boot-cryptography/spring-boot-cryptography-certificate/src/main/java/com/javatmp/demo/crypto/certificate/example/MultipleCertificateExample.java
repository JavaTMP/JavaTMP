package com.javatmp.demo.crypto.certificate.example;

import com.javatmp.demo.crypto.certificate.Utils;
import org.bouncycastle.jce.provider.BouncyCastleProvider;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.security.KeyPair;
import java.security.Security;
import java.security.cert.CertificateFactory;
import java.security.cert.X509Certificate;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;

/**
 * Basic example of using a CertificateFactory.
 */
public class MultipleCertificateExample {
    static {
        // https://stackoverflow.com/questions/40975510/spring-boot-and-jca-providers
        if (Security.getProvider(BouncyCastleProvider.PROVIDER_NAME) == null) {
            Security.addProvider(new BouncyCastleProvider());
        }
    }
    public static void main(String[] args) throws Exception {
        // create the keys
        KeyPair pair = Utils.generateRSAKeyPair();

        // create the input stream
        ByteArrayOutputStream bOut = new ByteArrayOutputStream();

        bOut.write(X509V1CreateExampleNew.generateV1Certificate(pair,
                "CN=Test Certificate",
                "CN=Test Certificate",
                100,
                "SHA256WithRSAEncryption").getEncoded());
        bOut.write(X509V3CreateExampleNew.selfSign(pair).getEncoded());

        bOut.close();

        InputStream in = new ByteArrayInputStream(bOut.toByteArray());

        // create the certificate factory
        CertificateFactory fact = CertificateFactory.getInstance("X.509", "BC");

//        Collection collection = fact.generateCertificates(in);

        // read the certificates
        X509Certificate x509Cert;
        Collection collection = new ArrayList();

        while ((x509Cert = (X509Certificate) fact.generateCertificate(in)) != null) {
            collection.add(x509Cert);
        }

        Iterator it = collection.iterator();
        while (it.hasNext()) {
            System.out.println("version: " + ((X509Certificate) it.next()).getVersion());
        }
    }
}
