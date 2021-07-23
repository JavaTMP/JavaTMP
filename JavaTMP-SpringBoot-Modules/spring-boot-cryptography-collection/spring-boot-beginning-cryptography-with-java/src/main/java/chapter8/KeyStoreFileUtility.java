package chapter8;

import org.bouncycastle.jce.provider.BouncyCastleProvider;

import java.io.FileOutputStream;
import java.security.KeyStore;
import java.security.Security;

/**
 * Create some keystore files in the current directory.
 */
public class KeyStoreFileUtility {
    static {
        // https://stackoverflow.com/questions/40975510/spring-boot-and-jca-providers
        if (Security.getProvider(BouncyCastleProvider.PROVIDER_NAME) == null) {
            Security.addProvider(new BouncyCastleProvider());
        }
    }
    public static void main(String[] args) throws Exception {
        char[] password = "storePassword".toCharArray();

        // create and save a JKS store
        KeyStore store = JKSStoreExample.createKeyStore();

        store.store(new FileOutputStream("keystore.jks"), password);

        // create and save a PKCS #12 store
        store = PKCS12StoreExample.createKeyStore();

        store.store(new FileOutputStream("keystore.p12"), password);
    }
}
