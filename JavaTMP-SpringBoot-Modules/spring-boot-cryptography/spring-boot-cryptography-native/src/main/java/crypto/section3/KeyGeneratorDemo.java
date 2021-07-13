package crypto.section3;


import crypto.Util;

import javax.crypto.KeyGenerator;
import javax.crypto.SecretKey;
import java.security.NoSuchAlgorithmException;

/**
 * KeyGenerator (this one) is for symmetric, but lots of people use passwords.
 *
 * @author Erik Costlow
 */
public class KeyGeneratorDemo {

    public static void main(String[] args) throws NoSuchAlgorithmException {
        final KeyGenerator kg = KeyGenerator.getInstance("AES");
        kg.init(256);
        final SecretKey secret = kg.generateKey();

        System.out.println("Hex-encoded Secret key is: " + Util.bytesToHex(secret.getEncoded()));
    }
}
