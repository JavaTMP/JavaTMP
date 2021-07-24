package chapter9;

import org.bouncycastle.cms.*;
import org.bouncycastle.cms.jcajce.JceCMSContentEncryptorBuilder;
import org.bouncycastle.cms.jcajce.JceKeyTransEnvelopedRecipient;
import org.bouncycastle.cms.jcajce.JceKeyTransRecipientInfoGenerator;
import org.bouncycastle.jce.provider.BouncyCastleProvider;
import org.bouncycastle.operator.OutputEncryptor;

import java.security.KeyStore;
import java.security.PrivateKey;
import java.security.cert.*;
import java.util.Arrays;
import java.util.Collection;
import java.util.Collections;
import java.util.Iterator;

/**
 * Demonstrate creation and processing a public key recipient enveloped-message
 * with matching of the RID to a certificate to make sure we have the right recipient.
 */
public class KeyTransEnvelopedDataWithCertMatchExample {
    public static void main(String[] args)
            throws Exception {
        KeyStore credentials = Utils.createCredentials();
        PrivateKey key = (PrivateKey) credentials.getKey(Utils.END_ENTITY_ALIAS, Utils.KEY_PASSWD);
        Certificate[] chain = credentials.getCertificateChain(Utils.END_ENTITY_ALIAS);
        X509Certificate cert = (X509Certificate) chain[0];

        // set up the generator
        CMSEnvelopedDataGenerator gen = new CMSEnvelopedDataGenerator();

        gen.addRecipientInfoGenerator(new JceKeyTransRecipientInfoGenerator(cert));

        // create the enveloped-data object
        CMSTypedData data = new CMSProcessableByteArray("Hello World!".getBytes());
        OutputEncryptor encryptor =
                new JceCMSContentEncryptorBuilder(CMSAlgorithm.AES128_CBC)
                        .setProvider(BouncyCastleProvider.PROVIDER_NAME)
                        .build();
        CMSEnvelopedData enveloped = gen.generate(data, encryptor);

        // recreate
        enveloped = new CMSEnvelopedData(enveloped.getEncoded());

        // set up to iterate through the recipients
        RecipientInformationStore recipients = enveloped.getRecipientInfos();
        CertStore certStore = CertStore.getInstance("Collection",
                new CollectionCertStoreParameters(Collections.singleton(cert)), "BC");
        Iterator it = recipients.getRecipients().iterator();
        RecipientInformation recipient = null;

        while (it.hasNext()) {
            recipient = (RecipientInformation) it.next();
            if (recipient instanceof KeyTransRecipientInformation) {
                // match the recipient ID
                RecipientInformation finalRecipient = recipient;

                CertSelector certSelector = new CertSelector() {
                    @Override
                    public boolean match(Certificate cert) {
                        return finalRecipient.getRID().match(cert);
                    }
                    @Override
                    public Object clone() {
                        return null;
                    }
                };
                // todo: fix logical error as certificate can not be found
                Collection matches = certStore.getCertificates(certSelector);

                if (!matches.isEmpty()) {
                    // decrypt the data
                    byte[] recData = recipient.getContent(new JceKeyTransEnvelopedRecipient(key));

                    // compare recovered data to the original data
                    if (Arrays.equals((byte[]) data.getContent(), recData)) {
                        System.out.println("data recovery succeeded");
                        break;
                    } else {
                        System.out.println("data recovery failed");
                        break;
                    }
                }
            }
        }

        if (recipient == null) {
            System.out.println("could not find a matching recipient");
        }
    }
}
