package test;


import org.junit.jupiter.api.Test;

public class AESTest {

    @Test
    public void shouldEncryptAndDecrypt() {

        final String strToEncrypt = "My text to encrypt";
		final String strKey = "53cr3t";

		AES.setKey(strKey);

        String encrypted = AES.encrypt(strToEncrypt.trim());

		System.out.println("String to Encrypt: " + strToEncrypt);
		System.out.println("Encrypted: " + encrypted);

		final String strToDecrypt = encrypted;
		String decrypted = AES.decrypt(strToDecrypt.trim());

		System.out.println("String To Decrypt: " + strToDecrypt);
		System.out.println("Decrypted : " + decrypted);

    }

}
