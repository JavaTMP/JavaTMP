package test.crypto;

import com.javatmp.demo.crypto.cms.EncryptAndDecryptFile;
import com.javatmp.demo.crypto.cms.EncryptAndDecryptMessage;
import org.bouncycastle.jce.provider.BouncyCastleProvider;
import org.junit.jupiter.api.Test;

import java.io.File;
import java.nio.file.Files;
import java.security.PrivateKey;
import java.security.Security;
import java.security.cert.X509Certificate;

public class EncryptAndDecryptTest {

	private static String WORK_DIR;

	static {
		// Add security provider
		if (Security.getProvider(BouncyCastleProvider.PROVIDER_NAME) == null) {
			Security.addProvider(new BouncyCastleProvider());
		}

		try {
			WORK_DIR = new File("D:\\work\\JavaTMP\\JavaTMP-SpringBoot-Modules\\spring-boot-cryptography\\spring-boot-cryptography-cms").getCanonicalPath();
			System.out.println("WORK_DIR: " + WORK_DIR);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private static final File SOURCE_FILE = new File(WORK_DIR, "source.xml");
	private static final File DESTINATION_FILE = new File(WORK_DIR, "encrypted.xml");
	private static final File DECRYPTED_FILE = new File(WORK_DIR, "decrypted.xml");

	public static final String SIGNATURE_ALGORITHM = "SHA1withRSA";

	@Test
	//@Ignore
	public void shouldEncryptAndDecryptFile() throws Exception {

		if (!new File(WORK_DIR).exists()) {
			throw new RuntimeException(WORK_DIR + " not exist.");
		}

		Files.deleteIfExists(DESTINATION_FILE.toPath());
		Files.deleteIfExists(DECRYPTED_FILE.toPath());

		X509Certificate certificate = EncryptAndDecryptFile.getX509Certificate(new File(WORK_DIR, "certificate.pem"));
		EncryptAndDecryptFile.encrypt(certificate, SOURCE_FILE, DESTINATION_FILE);

		PrivateKey privateKey = EncryptAndDecryptFile.getPrivateKey(new File(WORK_DIR, "keystore.p12"), "Qwer12345");
		EncryptAndDecryptFile.decrypt(privateKey, DESTINATION_FILE, DECRYPTED_FILE);
	}

	@Test
	public void shouldEncryptAndDecryptMessage() throws Exception {

		X509Certificate certificate = EncryptAndDecryptFile.getX509Certificate(new File(WORK_DIR, "certificate.pem"));
		String encryptedMessage = EncryptAndDecryptMessage.encryptMessage("<InitRequest></InitRequest>", certificate);
		System.out.println("----- encryptedMessage -----");
		System.out.println(encryptedMessage);

		PrivateKey privateKey = EncryptAndDecryptFile.getPrivateKey(new File(WORK_DIR, "keystore.p12"), "Qwer12345");
		String decryptedMessage = EncryptAndDecryptMessage.decryptMessage(encryptedMessage, privateKey);
		System.out.println("----- decryptedMessage -----");
		System.out.println(decryptedMessage);
	}

}
