package chapter1;

import java.security.Provider;
import java.security.Security;

/**
 * Basic class to confirm the Bouncy Castle provider is
 * installed.
 */
public class SimpleProviderTest {
    public static void main(String[] args) {
        String providerName = "BC";
        Provider bcProvider = Security.getProvider(providerName);
        if (bcProvider == null) {
            System.out.println(providerName + " provider not installed");
        } else {
            System.out.println(providerName + " is installed.");
            System.out.println("get name is = " + bcProvider.getName());
        }
    }
}
