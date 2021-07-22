package com.javatmp.demo.crypto.crl.example;

import com.javatmp.demo.crypto.crl.Utils;
import org.bouncycastle.jce.provider.BouncyCastleProvider;

import java.io.ByteArrayInputStream;
import java.math.BigInteger;
import java.security.KeyPair;
import java.security.Security;
import java.security.cert.CertificateFactory;
import java.security.cert.X509CRL;
import java.security.cert.X509CRLEntry;
import java.security.cert.X509Certificate;

/**
 * Reading a CRL with a CertificateFactory
 */
public class CRLCertFactoryExample {
    static {
        // https://stackoverflow.com/questions/40975510/spring-boot-and-jca-providers
        if (Security.getProvider(BouncyCastleProvider.PROVIDER_NAME) == null) {
            Security.addProvider(new BouncyCastleProvider());
        }
    }

    public static void main(String[] args) throws Exception {
        // create CA keys and certificate
        KeyPair caPair = Utils.generateRSAKeyPair();
        X509Certificate caCert = Utils.generateRootCert(caPair);
        BigInteger revokedSerialNumber = BigInteger.valueOf(2);

        // create a CRL revoking certificate number 2
        X509CRL crl = X509CRLExample.createCRL(caCert, caPair.getPrivate(), revokedSerialNumber);

        // encode it and reconstruct it
        ByteArrayInputStream bIn =
                new ByteArrayInputStream(crl.getEncoded());
        CertificateFactory fact =
                CertificateFactory.getInstance("X.509", "BC");

        crl = (X509CRL) fact.generateCRL(bIn);

        // verify the CRL
        crl.verify(caCert.getPublicKey(), "BC");

        // check if the CRL revokes certificate number 2
        X509CRLEntry entry = crl.getRevokedCertificate(revokedSerialNumber);
        System.out.println("Revocation Details:");
        System.out.println("  Certificate number: " + entry.getSerialNumber());
        System.out.println("  Issuer            : " + crl.getIssuerX500Principal());

        System.out.println("by while loop");
        bIn = new ByteArrayInputStream(crl.getEncoded());
        while ((crl = (X509CRL) fact.generateCRL(bIn)) != null) {
            entry = crl.getRevokedCertificate(revokedSerialNumber);
            System.out.println("Revocation Details:");
            System.out.println("  Certificate number: " + entry.getSerialNumber());
            System.out.println("  Issuer            : " + crl.getIssuerX500Principal());
        }

    }
}
