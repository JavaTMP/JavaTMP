package chapter8;

import org.bouncycastle.jce.provider.BouncyCastleProvider;

import javax.security.auth.x500.X500PrivateCredential;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.security.KeyStore;
import java.security.Security;
import java.security.cert.Certificate;
import java.util.Enumeration;

/**
 * Example of the creation of a PKCS #12 store
 */
public class PKCS12StoreExample {
    static {
        // https://stackoverflow.com/questions/40975510/spring-boot-and-jca-providers
        if (Security.getProvider(BouncyCastleProvider.PROVIDER_NAME) == null) {
            Security.addProvider(new BouncyCastleProvider());
        }
    }
    public static KeyStore createKeyStore() throws Exception {
        KeyStore store = KeyStore.getInstance("PKCS12", "BC");

        // initialize
        store.load(null, null);

        X500PrivateCredential rootCredential =
                Utils.createRootCredential();
        X500PrivateCredential interCredential =
                Utils.createIntermediateCredential(
                        rootCredential.getPrivateKey(),
                        rootCredential.getCertificate());
        X500PrivateCredential endCredential =
                Utils.createEndEntityCredential(
                        interCredential.getPrivateKey(),
                        interCredential.getCertificate());

        Certificate[] chain = new Certificate[3];

        chain[0] = endCredential.getCertificate();
        chain[1] = interCredential.getCertificate();
        chain[2] = rootCredential.getCertificate();

        // set the entries
        store.setCertificateEntry(rootCredential.getAlias(), rootCredential.getCertificate());
        store.setKeyEntry(endCredential.getAlias(), endCredential.getPrivateKey(), null, chain);

        return store;
    }

    public static void main(String[] args) throws Exception {
        KeyStore store = createKeyStore();
        char[] password = "storePassword".toCharArray();

        ByteArrayOutputStream bOut = new ByteArrayOutputStream();

        store.store(bOut, password);

        store = KeyStore.getInstance("PKCS12"
                , BouncyCastleProvider.PROVIDER_NAME
        );

        store.load(new ByteArrayInputStream(bOut.toByteArray()), password);

        Enumeration en = store.aliases();
        while (en.hasMoreElements()) {
            String alias = (String) en.nextElement();
            System.out.println(
                    "found " + alias + ", isCertificate? " + store.isCertificateEntry(alias));
        }
    }
}
