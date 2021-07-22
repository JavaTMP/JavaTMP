package com.javatmp.demo.crypto.certificate.example;

import com.javatmp.demo.crypto.certificate.Utils;
import org.bouncycastle.jce.PKCS10CertificationRequest;
import org.bouncycastle.jce.provider.BouncyCastleProvider;
import org.bouncycastle.util.io.pem.PemObject;
import org.bouncycastle.util.io.pem.PemWriter;

import javax.security.auth.x500.X500Principal;
import java.io.OutputStreamWriter;
import java.security.KeyPair;
import java.security.KeyPairGenerator;
import java.security.Security;

/**
 * Generation of a basic PKCS #10 request.
 */
public class PKCS10CertRequestExample {
    static {
        // https://stackoverflow.com/questions/40975510/spring-boot-and-jca-providers
        if (Security.getProvider(BouncyCastleProvider.PROVIDER_NAME) == null) {
            Security.addProvider(new BouncyCastleProvider());
        }
    }
    public static PKCS10CertificationRequest generateRequest(KeyPair pair)
            throws Exception {
        return new PKCS10CertificationRequest(
                "SHA256withRSA",
                new X500Principal("CN=Requested Test Certificate"),
                pair.getPublic(),
                null,
                pair.getPrivate());
    }

    public static void main(String[] args) throws Exception {
        // create the keys
        KeyPairGenerator kpGen = KeyPairGenerator.getInstance("RSA", "BC");

        kpGen.initialize(1024, Utils.createFixedRandom());

        KeyPair pair = kpGen.generateKeyPair();

        PKCS10CertificationRequest request = generateRequest(pair);

        PemWriter pemWrt = new PemWriter(new OutputStreamWriter(System.out));

        pemWrt.writeObject(
                new PemObject("CERTIFICATE REQUEST",
                        request.getEncoded()));
        pemWrt.close();
    }
}
