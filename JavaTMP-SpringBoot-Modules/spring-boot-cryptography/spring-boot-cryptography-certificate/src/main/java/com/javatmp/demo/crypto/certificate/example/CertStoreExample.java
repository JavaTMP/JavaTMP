package com.javatmp.demo.crypto.certificate.example;

import org.bouncycastle.asn1.x500.X500NameBuilder;
import org.bouncycastle.asn1.x500.style.BCStyle;
import org.bouncycastle.jce.provider.BouncyCastleProvider;

import javax.security.auth.x500.X500Principal;
import java.security.Security;
import java.security.cert.CertStore;
import java.security.cert.CollectionCertStoreParameters;
import java.security.cert.X509CertSelector;
import java.security.cert.X509Certificate;
import java.util.Arrays;
import java.util.Iterator;

/**
 * Example using a CertStore and a CertSelector
 */
public class CertStoreExample {
    static {
        // https://stackoverflow.com/questions/40975510/spring-boot-and-jca-providers
        if (Security.getProvider(BouncyCastleProvider.PROVIDER_NAME) == null) {
            Security.addProvider(new BouncyCastleProvider());
        }
    }

    public static void main(String[] args) throws Exception {
        X509Certificate[] chain = PKCS10CertCreateExample.buildChain();

        // create the store
        CollectionCertStoreParameters params = new CollectionCertStoreParameters(Arrays.asList(chain));
        CertStore store = CertStore.getInstance("Collection",
                params, BouncyCastleProvider.PROVIDER_NAME);

        // create the selector
        X509CertSelector selector = new X509CertSelector();
        selector.setSubject(new X500Principal("CN=Requested Test Certificate").getEncoded());

        // print the subjects of the results
        Iterator certsIt = store.getCertificates(selector).iterator();
        while (certsIt.hasNext()) {
            X509Certificate cert = (X509Certificate) certsIt.next();
            System.out.println(cert.getSubjectX500Principal());
        }

        X500NameBuilder x500NameBld = new X500NameBuilder(BCStyle.INSTANCE);
        x500NameBld.addRDN(BCStyle.CN, "Requested Test Certificate");
        selector = new X509CertSelector();
        selector.setSubject(x500NameBld.build().getEncoded());

        certsIt = store.getCertificates(selector).iterator();
        while (certsIt.hasNext()) {
            X509Certificate cert = (X509Certificate) certsIt.next();
            System.out.println(cert.getSubjectX500Principal());
        }
    }
}
