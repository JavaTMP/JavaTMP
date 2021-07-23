package chapter7;

import org.bouncycastle.jce.provider.BouncyCastleProvider;

import java.math.BigInteger;
import java.security.KeyPair;
import java.security.Security;
import java.security.cert.*;
import java.util.Collections;
import java.util.Iterator;

/**
 * Using the X509CRLSelector and the CertStore classes.
 */
public class CRLCertStoreExample {
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
        X509CRL crl = X509CRLExample.createCRL(caCert,
                caPair.getPrivate(), revokedSerialNumber);

        // place the CRL into a CertStore
        CollectionCertStoreParameters params =
                new CollectionCertStoreParameters(Collections.singleton(crl));
        CertStore store = CertStore.getInstance("Collection",
                params, "BC");
        X509CRLSelector selector = new X509CRLSelector();

        selector.addIssuerName(caCert.getSubjectX500Principal().getEncoded());

        Iterator it = store.getCRLs(selector).iterator();

        while (it.hasNext()) {
            crl = (X509CRL) it.next();

            // verify the CRL
            crl.verify(caCert.getPublicKey(), "BC");

            // check if the CRL revokes certificate number 2
            X509CRLEntry entry = crl.getRevokedCertificate(revokedSerialNumber);
            System.out.println("Revocation Details:");
            System.out.println("  Certificate number: " + entry.getSerialNumber());
            System.out.println("  Issuer            : " + crl.getIssuerX500Principal());
        }
    }
}
