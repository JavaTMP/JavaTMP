package chapter9;

import org.bouncycastle.cms.*;
import org.bouncycastle.cms.jcajce.JceCMSContentEncryptorBuilder;
import org.bouncycastle.cms.jcajce.JceKEKEnvelopedRecipient;
import org.bouncycastle.cms.jcajce.JceKEKRecipientInfoGenerator;
import org.bouncycastle.jce.provider.BouncyCastleProvider;
import org.bouncycastle.operator.OutputEncryptor;
import org.bouncycastle.util.encoders.Base64;

import javax.crypto.KeyGenerator;
import javax.crypto.SecretKey;
import java.nio.charset.StandardCharsets;
import java.util.Arrays;

/**
 * Demonstrate creation and processing a key-encrypted key enveloped-message.
 */
public class KEKEnvelopedDataExample {
    public static void main(String[] args)
            throws Exception {
        KeyGenerator keyGen = KeyGenerator.getInstance("DESEDE", "BC");
        SecretKey key = keyGen.generateKey();

        // set up the generator
        CMSEnvelopedDataGenerator edGen = new CMSEnvelopedDataGenerator();

        byte[] kekID = new byte[]{1, 2, 3, 4, 5};

        JceKEKRecipientInfoGenerator jceKEKRecipientInfoGenerator =
                new JceKEKRecipientInfoGenerator(kekID, key);
        edGen.addRecipientInfoGenerator (jceKEKRecipientInfoGenerator);

        // create the enveloped-data object
        String msg = "Hello World!";
        CMSProcessable data = new CMSProcessableByteArray(msg.getBytes());
        CMSTypedData content = new CMSProcessableByteArray(msg.getBytes(StandardCharsets.UTF_8));
        OutputEncryptor encryptor =
                new JceCMSContentEncryptorBuilder(CMSAlgorithm.AES128_CBC)
                        .setProvider(BouncyCastleProvider.PROVIDER_NAME)
                        .build();

        CMSEnvelopedData enveloped = edGen.generate(content, encryptor);
        String encryptedMessage = new String(Base64.encode(enveloped.getEncoded()));

        // recreate
        enveloped = new CMSEnvelopedData(enveloped.getEncoded());
        // look for our recipient
        RecipientId recId = new KEKRecipientId(kekID);

        RecipientInformationStore recipients = enveloped.getRecipientInfos();
        RecipientInformation recipient = recipients.get(recId);

        if (recipient != null) {
            // decrypt the data
            byte[] recData = recipient.getContent(
                    new JceKEKEnvelopedRecipient(key)
                            .setProvider(BouncyCastleProvider.PROVIDER_NAME));

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
