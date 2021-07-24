package chapter9;

import org.bouncycastle.asn1.x500.X500Name;
import org.bouncycastle.cms.*;
import org.bouncycastle.cms.jcajce.JceCMSContentEncryptorBuilder;
import org.bouncycastle.cms.jcajce.JceKeyTransEnvelopedRecipient;
import org.bouncycastle.cms.jcajce.JceKeyTransRecipientInfoGenerator;
import org.bouncycastle.jce.provider.BouncyCastleProvider;
import org.bouncycastle.mail.smime.SMIMEEnveloped;
import org.bouncycastle.mail.smime.SMIMEEnvelopedGenerator;
import org.bouncycastle.mail.smime.SMIMEUtil;
import org.bouncycastle.operator.OutputEncryptor;

import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import java.security.KeyStore;
import java.security.PrivateKey;
import java.security.cert.Certificate;
import java.security.cert.X509Certificate;

/**
 * a simple example that creates and processes an enveloped mail message.
 */
public class EnvelopedMailExample {
    public static void main(String[] args) throws Exception {
        KeyStore credentials = Utils.createCredentials();
        PrivateKey key = (PrivateKey) credentials.getKey(Utils.END_ENTITY_ALIAS, Utils.KEY_PASSWD);
        Certificate[] chain = credentials.getCertificateChain(Utils.END_ENTITY_ALIAS);
        X509Certificate cert = (X509Certificate) chain[0];

        // Most clients expect the MimeBodyPart to be
        // in a MimeMultipart when it's sent.
        // create the message we want encrypted
        MimeBodyPart dataPart = new MimeBodyPart();

        dataPart.setText("Hello world!");

        // set up the generator
        SMIMEEnvelopedGenerator gen = new SMIMEEnvelopedGenerator();

        RecipientInfoGenerator recipientInfoGenerator =
                new JceKeyTransRecipientInfoGenerator(cert)
                        .setProvider("BC");
        gen.addRecipientInfoGenerator(recipientInfoGenerator);

        // "SHA1WithRSAEncryption"
        OutputEncryptor outputEncryptor = new JceCMSContentEncryptorBuilder(CMSAlgorithm.RC2_CBC)
                .setProvider("BC").build();

        // generate the enveloped message
        MimeBodyPart envPart = gen.generate(dataPart, outputEncryptor);

        // create the mail message
        MimeMessage mail = Utils
                .createMimeMessage("example enveloped message", envPart.getContent(),
                        envPart.getContentType());

        // create the enveloped object from the mail message
        SMIMEEnveloped enveloped = new SMIMEEnveloped(mail);

        // look for our recipient identifier
        RecipientId recId = new KeyTransRecipientId(key.getEncoded());
        recId = new KeyTransRecipientId(
                new X500Name(cert.getIssuerX500Principal().getName())
                , cert.getSerialNumber());
//

        RecipientInformationStore recipients = enveloped.getRecipientInfos();

        RecipientInformation recipient = recipients.get(recId);

        if (recipient != null) {
            // decryption step
            byte[] recovered = recipient.getContent(new JceKeyTransEnvelopedRecipient(key)
                    .setProvider(BouncyCastleProvider.PROVIDER_NAME));

            MimeBodyPart recoveredPart = SMIMEUtil.toMimeBodyPart(recovered);

            // content display step
            System.out.print("Content: ");
            System.out.println(recoveredPart.getContent());
        } else {
            System.out.println("could not find a matching recipient");
        }
    }
}
