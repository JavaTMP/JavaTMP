package chapter9;

import org.bouncycastle.asn1.x500.X500Name;
import org.bouncycastle.cert.jcajce.JcaCertStore;
import org.bouncycastle.cms.*;
import org.bouncycastle.cms.jcajce.JceCMSContentEncryptorBuilder;
import org.bouncycastle.cms.jcajce.JceKeyTransEnvelopedRecipient;
import org.bouncycastle.cms.jcajce.JceKeyTransRecipientInfoGenerator;
import org.bouncycastle.jce.provider.BouncyCastleProvider;
import org.bouncycastle.mail.smime.SMIMEEnveloped;
import org.bouncycastle.mail.smime.SMIMEEnvelopedGenerator;
import org.bouncycastle.mail.smime.SMIMESigned;
import org.bouncycastle.mail.smime.SMIMEUtil;
import org.bouncycastle.operator.OutputEncryptor;
import org.bouncycastle.util.Store;

import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import java.security.KeyStore;
import java.security.PrivateKey;
import java.security.cert.CertStore;
import java.security.cert.Certificate;
import java.security.cert.CollectionCertStoreParameters;
import java.security.cert.X509Certificate;
import java.util.Arrays;

/**
 * a simple example that creates and processes an enveloped signed mail message.
 */
public class EnvelopedSignedMailExample
        extends SignedDataProcessor {
    public static void main(String[] args) throws Exception {
        KeyStore credentials = Utils.createCredentials();
        PrivateKey key = (PrivateKey) credentials.getKey(Utils.END_ENTITY_ALIAS, Utils.KEY_PASSWD);
        Certificate[] chain = credentials.getCertificateChain(Utils.END_ENTITY_ALIAS);
        CertStore certsAndCRLs = CertStore.getInstance("Collection",
                new CollectionCertStoreParameters(Arrays.asList(chain)), "BC");
        Store certs = new JcaCertStore(new CollectionCertStoreParameters(Arrays.asList(chain)).getCollection());
        X509Certificate cert = (X509Certificate) chain[0];

        // create the message we want signed
        MimeBodyPart dataPart = new MimeBodyPart();

        dataPart.setText("Hello world!");

        // create the signed message
        MimeMultipart signedMultipart = SignedMailExample
                .createMultipartWithSignature(key, cert, certsAndCRLs, dataPart, certs);

        // create the body part containing the signed message
        MimeBodyPart signedPart = new MimeBodyPart();

        signedPart.setContent(signedMultipart);

        // set up the enveloped message generator
        SMIMEEnvelopedGenerator gen = new SMIMEEnvelopedGenerator();
        RecipientInfoGenerator recipientInfoGenerator =
                new JceKeyTransRecipientInfoGenerator(cert)
                        .setProvider(BouncyCastleProvider.PROVIDER_NAME);
        gen.addRecipientInfoGenerator(recipientInfoGenerator);

        // "SHA1WithRSAEncryption"
        OutputEncryptor outputEncryptor =
                new JceCMSContentEncryptorBuilder(CMSAlgorithm.RC2_CBC)
                .setProvider(BouncyCastleProvider.PROVIDER_NAME)
                .build();
        // generate the enveloped message
        MimeBodyPart envPart = gen.generate(signedPart, outputEncryptor);

        // create the mail message
        MimeMessage mail = Utils
                .createMimeMessage("example signed and enveloped message", envPart.getContent(),
                        envPart.getContentType());

        // create the enveloped object from the mail message
        SMIMEEnveloped enveloped = new SMIMEEnveloped(mail);

        // look for our recipient identifier
        RecipientId recId = new KeyTransRecipientId(key.getEncoded());
        recId = new KeyTransRecipientId(
                new X500Name(cert.getIssuerX500Principal().getName())
                , cert.getSerialNumber());

        RecipientInformationStore recipients = enveloped.getRecipientInfos();
        RecipientInformation recipient = recipients.get(recId);

        // decryption step
        MimeBodyPart res = SMIMEUtil.toMimeBodyPart(
                recipient.getContent(
                        new JceKeyTransEnvelopedRecipient(key)
                        .setProvider(BouncyCastleProvider.PROVIDER_NAME)
                )
        );

        // extract the multi-part from the body part.
        if (res.getContent() instanceof MimeMultipart) {
            SMIMESigned signed = new SMIMESigned(
                    (MimeMultipart) res.getContent());

            // verification step
            X509Certificate rootCert = (X509Certificate) credentials
                    .getCertificate(Utils.ROOT_ALIAS);

            if (isValid(signed, rootCert)) {
                System.out.println("verification succeeded");
            } else {
                System.out.println("verification failed");
            }

            // content display step
            MimeBodyPart content = signed.getContent();

            System.out.print("Content: ");
            System.out.println(content.getContent());
        } else {
            System.out.println("wrong content found");
        }
    }
}
