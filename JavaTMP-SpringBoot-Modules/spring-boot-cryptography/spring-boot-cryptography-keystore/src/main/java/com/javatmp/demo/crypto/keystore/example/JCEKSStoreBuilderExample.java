package com.javatmp.demo.crypto.keystore.example;

import com.javatmp.demo.crypto.keystore.Utils;
import org.bouncycastle.jce.provider.BouncyCastleProvider;

import java.security.KeyStore;
import java.security.Security;

/**
 * Basic example of use of KeyStore.Builder to create an object that
 * can be used recover a private key.
 */
public class JCEKSStoreBuilderExample {
    static {
        // https://stackoverflow.com/questions/40975510/spring-boot-and-jca-providers
        if (Security.getProvider(BouncyCastleProvider.PROVIDER_NAME) == null) {
            Security.addProvider(new BouncyCastleProvider());
        }
    }
    public static void main(String[] args) throws Exception {
        KeyStore store = JCEKSStoreEntryExample.createKeyStore();

        char[] password = "storePassword".toCharArray();

        // create the builder
        KeyStore.Builder builder = KeyStore.Builder.newInstance(store,
                new KeyStore.PasswordProtection(JCEKSStoreEntryExample.keyPassword));

        // use the builder to recover the KeyStore and obtain the key
        store = builder.getKeyStore();

        KeyStore.ProtectionParameter param = builder.getProtectionParameter(Utils.END_ENTITY_ALIAS);

        KeyStore.Entry entry = store.getEntry(Utils.END_ENTITY_ALIAS, param);

        System.out.println("recovered " + entry.getClass());
    }
}
