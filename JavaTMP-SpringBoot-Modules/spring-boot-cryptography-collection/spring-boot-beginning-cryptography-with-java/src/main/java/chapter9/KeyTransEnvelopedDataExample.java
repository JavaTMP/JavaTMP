package chapter9;

import org.bouncycastle.cms.*;
import org.bouncycastle.cms.jcajce.JceCMSContentEncryptorBuilder;
import org.bouncycastle.cms.jcajce.JceKeyTransEnvelopedRecipient;
import org.bouncycastle.cms.jcajce.JceKeyTransRecipientInfoGenerator;
import org.bouncycastle.jce.provider.BouncyCastleProvider;
import org.bouncycastle.operator.OutputEncryptor;
import org.bouncycastle.util.encoders.Base64;

import java.nio.charset.StandardCharsets;
import java.security.KeyStore;
import java.security.PrivateKey;
import java.security.cert.Certificate;
import java.security.cert.X509Certificate;
import java.util.Arrays;
import java.util.Collection;
import java.util.Iterator;

/**
 * Demonstrate creation and processing a public key recipient enveloped-message.
 */
public class KeyTransEnvelopedDataExample {
    public static void main(String[] args)
            throws Exception {
        KeyStore credentials = Utils.createCredentials();
        PrivateKey privateKey = (PrivateKey) credentials.getKey(Utils.END_ENTITY_ALIAS, Utils.KEY_PASSWD);
        Certificate[] chain = credentials.getCertificateChain(Utils.END_ENTITY_ALIAS);
        X509Certificate cert = (X509Certificate) chain[0];

        // set up the generator
        CMSEnvelopedDataGenerator gen = new CMSEnvelopedDataGenerator();

        gen.addRecipientInfoGenerator(
                new JceKeyTransRecipientInfoGenerator(cert));

        // create the enveloped-data object
        String msg = "Hello World!";
        CMSProcessable data = new CMSProcessableByteArray(msg.getBytes());
        CMSTypedData content = new CMSProcessableByteArray(msg.getBytes(StandardCharsets.UTF_8));

        OutputEncryptor encryptor =
                new JceCMSContentEncryptorBuilder(CMSAlgorithm.AES128_CBC)
                        .setProvider(BouncyCastleProvider.PROVIDER_NAME)
                        .build();

        CMSEnvelopedData enveloped = gen.generate(content, encryptor);
        String encryptedMessage = new String(Base64.encode(enveloped.getEncoded()));

        // recreate
        enveloped = new CMSEnvelopedData(enveloped.getEncoded());

        // look for our recipient identifier
        Recipient recipient = new JceKeyTransEnvelopedRecipient(privateKey);
//        recipient.setSerialNumber(cert.getSerialNumber());
//        recipient.setIssuer(cert.getIssuerX500Principal().getEncoded());
        RecipientInformationStore recipientInfos = enveloped.getRecipientInfos();
        Collection<RecipientInformation> recipients = recipientInfos.getRecipients();
        Iterator<RecipientInformation> recipientIterator = recipients.iterator();

        if (recipientIterator != null && recipientIterator.hasNext()) {
            RecipientInformation recInfo = recipientIterator.next();
            System.out.println("recInfo class = " + recInfo.getClass().getName());
            RecipientId rid = recInfo.getRID();
            System.out.println("rid is = " + rid.getClass().getName());
            if(rid instanceof KeyTransRecipientId) {
                KeyTransRecipientId keyTransRecipientId = (KeyTransRecipientId) rid;
                byte[] d = keyTransRecipientId.getSubjectKeyIdentifier();
                System.out.println("subject key array = " + d);
//                System.out.println("key to str = " + new DEROctetString(d).toString());
            }
//            credentials.getCertificate(rid);
            byte[] recData = recInfo.getContent(recipient);
            // compare recovered data to the original data
            if (Arrays.equals((byte[]) data.getContent(), recData)) {
                System.out.println("data recovery succeeded");
            } else {
                System.out.println("data recovery failed");
            }
        } else {
            System.out.println("could not find a matching recipient");
        }
    }
}
