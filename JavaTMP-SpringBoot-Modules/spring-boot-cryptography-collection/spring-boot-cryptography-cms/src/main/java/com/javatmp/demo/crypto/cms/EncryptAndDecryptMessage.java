package com.javatmp.demo.crypto.cms;

import org.bouncycastle.cms.*;
import org.bouncycastle.cms.jcajce.JceCMSContentEncryptorBuilder;
import org.bouncycastle.cms.jcajce.JceKeyTransEnvelopedRecipient;
import org.bouncycastle.cms.jcajce.JceKeyTransRecipientInfoGenerator;
import org.bouncycastle.jce.provider.BouncyCastleProvider;
import org.bouncycastle.operator.OutputEncryptor;
import org.bouncycastle.util.encoders.Base64;

import java.security.PrivateKey;
import java.security.cert.X509Certificate;
import java.util.Collection;
import java.util.Iterator;

public class EncryptAndDecryptMessage {

	public static String encryptMessage(String message, X509Certificate cert) throws Exception {

		// create CMS envelope data;
		// check http://www.ietf.org/rfc/rfc3852.txt pages 15-16 for details
		CMSEnvelopedDataGenerator gen = new CMSEnvelopedDataGenerator();
		gen.addRecipientInfoGenerator(new JceKeyTransRecipientInfoGenerator(cert));

		OutputEncryptor encryptor = new JceCMSContentEncryptorBuilder(CMSAlgorithm.AES128_CBC).setProvider(BouncyCastleProvider.PROVIDER_NAME).build();
		CMSTypedData content = new CMSProcessableByteArray(message.getBytes("UTF-8"));
		CMSEnvelopedData data = gen.generate(content, encryptor);
		String encryptedMessage = new String(Base64.encode(data.getEncoded()));

		return encryptedMessage;
	}

	public static String decryptMessage(String encryptedMessage, PrivateKey privateKey) throws Exception {

		byte[] encryptedData = Base64.decode(encryptedMessage);

		// parse CMS envelope data
		CMSEnvelopedDataParser parser = new CMSEnvelopedDataParser(encryptedData);

		Collection<RecipientInformation> recInfos = parser.getRecipientInfos().getRecipients();
		Iterator<RecipientInformation> recipientIterator = recInfos.iterator();

		if (! recipientIterator.hasNext()) {
			throw new RuntimeException("Could not find recipient");
		}

		// retrieve recipient and decode it
		RecipientInformation recInfo = (RecipientInformation) recipientIterator.next();
		Recipient recipient = new JceKeyTransEnvelopedRecipient(privateKey);
		byte[] decryptedData = recInfo.getContent(recipient);

		return new String(decryptedData);
	}

}
