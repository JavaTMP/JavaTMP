package test;

import org.apache.commons.codec.binary.Base64;

import javax.crypto.Cipher;
import javax.crypto.spec.SecretKeySpec;
import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Arrays;

/**
 * Aes encryption
 */
public class AES {

	private static SecretKeySpec secretKey;
	private static byte[] key;

	public static void setKey(String myKey) {

		MessageDigest sha = null;

		try {
			key = myKey.getBytes("UTF-8");
			sha = MessageDigest.getInstance("SHA-1");
			key = sha.digest(key);
			key = Arrays.copyOf(key, 16); // use only first 128 bit
			secretKey = new SecretKeySpec(key, "AES");
		}
		catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}

	}

	public static String encrypt(String strToEncrypt) {

		String encrypted = "";

		try {
			Cipher cipher = Cipher.getInstance("AES/ECB/PKCS5Padding");
			cipher.init(Cipher.ENCRYPT_MODE, secretKey);
			encrypted = Base64.encodeBase64String(cipher.doFinal(strToEncrypt.getBytes("UTF-8")));
		}
		catch (Exception e) {
			e.printStackTrace();
		}

		return encrypted;
	}

	public static String decrypt(String strToDecrypt) {

		String decrypted = "";

		try {
			Cipher cipher = Cipher.getInstance("AES/ECB/PKCS5PADDING");
			cipher.init(Cipher.DECRYPT_MODE, secretKey);
			decrypted = new String(cipher.doFinal(Base64.decodeBase64(strToDecrypt)));
		}
		catch (Exception e) {
			e.printStackTrace();
		}

		return decrypted;
	}
}
