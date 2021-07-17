package test;

import org.apache.commons.codec.binary.Hex;
import org.bouncycastle.crypto.BlockCipher;
import org.bouncycastle.crypto.DataLengthException;
import org.bouncycastle.crypto.InvalidCipherTextException;
import org.bouncycastle.crypto.engines.AESEngine;
import org.bouncycastle.crypto.paddings.BlockCipherPadding;
import org.bouncycastle.crypto.paddings.PKCS7Padding;
import org.bouncycastle.crypto.paddings.PaddedBufferedBlockCipher;
import org.bouncycastle.crypto.params.KeyParameter;
import org.junit.jupiter.api.Test;

import javax.crypto.KeyGenerator;
import javax.crypto.SecretKey;
import javax.xml.bind.DatatypeConverter;
import java.math.BigInteger;

/**
 * http://www.mytechnotes.biz/2012/08/aes-256-symmetric-encryption-with.html
 * http://aesencryption.net/
 * http://aes.online-domain-tools.com/
 *
 */
public class AESBouncyCastleTest {

	private final BlockCipher AESCipher = new AESEngine();

	private PaddedBufferedBlockCipher pbbc;

	public void setPadding(BlockCipherPadding bcp) {
		this.pbbc = new PaddedBufferedBlockCipher(AESCipher, bcp);
	}

	public byte[] encrypt(byte[] input, byte[] key) throws DataLengthException, InvalidCipherTextException {
		return processing(input, true, key);
	}

	public byte[] decrypt(byte[] input, byte[] key) throws DataLengthException, InvalidCipherTextException {
		return processing(input, false, key);
	}

	private byte[] processing(byte[] input, boolean encrypt, byte[] keybytes)
			throws DataLengthException, InvalidCipherTextException {

		KeyParameter key = new KeyParameter(keybytes);
		pbbc.init(encrypt, key);

		byte[] output = new byte[pbbc.getOutputSize(input.length)];
		int bytesWrittenOut = pbbc.processBytes(input, 0, input.length, output, 0);

		pbbc.doFinal(output, bytesWrittenOut);

		return output;

	}

	public static String bytesToString(byte[] b) {
	    byte[] b2 = new byte[b.length + 1];
	    b2[0] = 1;
	    System.arraycopy(b, 0, b2, 1, b.length);
	    return new BigInteger(b2).toString(36);
	}

	//@Test
	public void shouldEncryptAndDecrypt() throws Exception {

		KeyGenerator kg = KeyGenerator.getInstance("AES");
		kg.init(128);

		SecretKey secretKey = kg.generateKey();

		AESBouncyCastleTest abc = new AESBouncyCastleTest();
		abc.setPadding(new PKCS7Padding());
		byte[] sc = secretKey.getEncoded();

		// TODO:
		//System.out.println("SecretKey : " + bytesToString(sc));
		System.out.println("SecretKey : " + Hex.encodeHexString(sc));

		String message = "This is a secret message! foo bar";
		System.out.println("Message : " + message);
		byte[] ba = message.getBytes("UTF-8");

		byte[] encr = abc.encrypt(ba, sc);
		System.out.println("Encrypted : " + Hex.encodeHexString(encr));

		byte[] retr = abc.decrypt(encr, sc);

		if (retr.length == ba.length) {
			ba = retr;
		} else {
			System.arraycopy(retr, 0, ba, 0, ba.length);
		}

		String decrypted = new String(ba, "UTF-8");
		System.out.println(decrypted);
	}

	@Test
	public void shouldDecrypt() throws Exception {

		String secretKey = "4C3999AE56352653CC33F9521B3BEE75A5C36A52F628AB2644DB968B46C8D373";
		//String encMessage = "F7C45B0BFC04C56B80F782DC9890D502"; // -> Hello world!!
		String encMessage = "27385E349F14AB1DEAAE621A58C50DB4"; // -> {aaa:"123"}

		AESBouncyCastleTest abc = new AESBouncyCastleTest();
		abc.setPadding(new PKCS7Padding());

		byte[] sc = DatatypeConverter.parseHexBinary(secretKey);
		//byte[] sc = Hex.decodeHex(secretKey.toCharArray());
		byte[] encr = Hex.decodeHex(encMessage.toCharArray());

		byte[] retr = abc.decrypt(encr, sc);
		System.out.println("Decrypted : " + Hex.encodeHexString(retr));

		String decrypted = new String(retr, "UTF-8");
		System.out.println(decrypted);

	}

}
