package com.javatmp.demo.crypto.cms;

import org.bouncycastle.cms.*;
import org.bouncycastle.cms.jcajce.JceCMSContentEncryptorBuilder;
import org.bouncycastle.cms.jcajce.JceKeyTransEnvelopedRecipient;
import org.bouncycastle.cms.jcajce.JceKeyTransRecipientInfoGenerator;
import org.bouncycastle.jce.provider.BouncyCastleProvider;
import org.bouncycastle.operator.OutputEncryptor;

import java.io.*;
import java.nio.file.Files;
import java.security.KeyStore;
import java.security.PrivateKey;
import java.security.cert.CertificateEncodingException;
import java.security.cert.CertificateException;
import java.security.cert.CertificateFactory;
import java.security.cert.X509Certificate;
import java.util.Collection;
import java.util.Enumeration;
import java.util.Iterator;

public class EncryptAndDecryptFile {

	public static void decrypt(PrivateKey privateKey, File encrypted, File decryptedDestination) throws IOException, CMSException {

		byte[] encryptedData = Files.readAllBytes(encrypted.toPath());

		CMSEnvelopedDataParser parser = new CMSEnvelopedDataParser(encryptedData);

		RecipientInformation recInfo = getSingleRecipient(parser);
		Recipient recipient = new JceKeyTransEnvelopedRecipient(privateKey);

		try (InputStream decryptedStream = recInfo.getContentStream(recipient).getContentStream()) {
			Files.copy(decryptedStream, decryptedDestination.toPath());
		}

		System.out.println(String.format("Decrypted '%s' to '%s'", encrypted.getAbsolutePath(), decryptedDestination.getAbsolutePath()));
	}

	public static void encrypt(X509Certificate cert, File source, File destination) throws CertificateEncodingException, CMSException, IOException {

		CMSEnvelopedDataStreamGenerator gen = new CMSEnvelopedDataStreamGenerator();
		gen.addRecipientInfoGenerator(new JceKeyTransRecipientInfoGenerator(cert));
		OutputEncryptor encryptor = new JceCMSContentEncryptorBuilder(CMSAlgorithm.AES256_CBC).setProvider(BouncyCastleProvider.PROVIDER_NAME).build();

		try (FileOutputStream fileStream = new FileOutputStream(destination);
			 OutputStream encryptingStream = gen.open(fileStream, encryptor)) {

			byte[] unencryptedContent = Files.readAllBytes(source.toPath());
			encryptingStream.write(unencryptedContent);
		}

		System.out.println(String.format("Encrypted '%s' to '%s'", source.getAbsolutePath(), destination.getAbsolutePath()));
	}

	public static X509Certificate getX509Certificate(File certificate) throws IOException, CertificateException {
		try (InputStream inStream = new FileInputStream(certificate)) {
			CertificateFactory cf = CertificateFactory.getInstance("X.509");
			return (X509Certificate) cf.generateCertificate(inStream);
		}
	}

	public static PrivateKey getPrivateKey(File file, String password) throws Exception {
		KeyStore ks = KeyStore.getInstance("PKCS12");
		try (FileInputStream fis = new FileInputStream(file)) {
			ks.load(fis, password.toCharArray());
		}

		Enumeration<String> aliases = ks.aliases();
		String alias = aliases.nextElement();
		return (PrivateKey) ks.getKey(alias, password.toCharArray());
	}

	private static RecipientInformation getSingleRecipient(CMSEnvelopedDataParser parser) {
		Collection<RecipientInformation> recInfos = parser.getRecipientInfos().getRecipients();
		Iterator<RecipientInformation> recipientIterator = recInfos.iterator();
		if (!recipientIterator.hasNext()) {
			throw new RuntimeException("Could not find recipient");
		}
		return (RecipientInformation) recipientIterator.next();
	}
}
