package com.javatmp.demo.crypto.provider.example;

import org.bouncycastle.jce.provider.BouncyCastleProvider;

import java.security.Provider;
import java.security.Security;

/**
 * Basic class to confirm the Bouncy Castle provider is
 * installed.
 */
public class SimpleProviderTest {
    public static void main(String[] args) {
        Security.addProvider(new BouncyCastleProvider());
        String providerName = BouncyCastleProvider.PROVIDER_NAME;
        Provider bcProvider = Security.getProvider(providerName);
        if (bcProvider == null) {
            System.out.println(providerName + " provider not installed");
        } else {
            System.out.println(providerName + " is installed.");
            System.out.println("get name is = " + bcProvider.getName());
        }
    }
}
