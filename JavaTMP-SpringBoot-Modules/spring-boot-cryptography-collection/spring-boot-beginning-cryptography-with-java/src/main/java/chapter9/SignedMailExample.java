package chapter9;

import org.bouncycastle.asn1.ASN1EncodableVector;
import org.bouncycastle.asn1.cms.AttributeTable;
import org.bouncycastle.asn1.smime.SMIMECapabilitiesAttribute;
import org.bouncycastle.asn1.smime.SMIMECapability;
import org.bouncycastle.asn1.smime.SMIMECapabilityVector;
import org.bouncycastle.asn1.smime.SMIMEEncryptionKeyPreferenceAttribute;
import org.bouncycastle.cert.jcajce.JcaCertStore;
import org.bouncycastle.cms.SignerInfoGenerator;
import org.bouncycastle.cms.jcajce.JcaSimpleSignerInfoGeneratorBuilder;
import org.bouncycastle.jce.provider.BouncyCastleProvider;
import org.bouncycastle.mail.smime.SMIMESigned;
import org.bouncycastle.mail.smime.SMIMESignedGenerator;
import org.bouncycastle.mail.smime.SMIMEUtil;
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
 * a simple example that creates and processes a signed mail message.
 */
public class SignedMailExample
        extends SignedDataProcessor {
    public static MimeMultipart createMultipartWithSignature(
            PrivateKey key,
            X509Certificate cert,
            CertStore certsAndCRLs,
            MimeBodyPart dataPart,
            Store certs)
            throws Exception {

        // create some smime capabilities in case someone wants to respond
        ASN1EncodableVector signedAttrs = new ASN1EncodableVector();
        SMIMECapabilityVector caps = new SMIMECapabilityVector();

        caps.addCapability(SMIMECapability.aES256_CBC);
        caps.addCapability(SMIMECapability.dES_EDE3_CBC);
        caps.addCapability(SMIMECapability.rC2_CBC, 128);

        signedAttrs.add(new SMIMECapabilitiesAttribute(caps));
        signedAttrs.add(new SMIMEEncryptionKeyPreferenceAttribute(
                SMIMEUtil.createIssuerAndSerialNumberFor(cert)));

        // set up the generator
        SMIMESignedGenerator gen = new SMIMESignedGenerator();

        SignerInfoGenerator signer = new JcaSimpleSignerInfoGeneratorBuilder()
                .setProvider(BouncyCastleProvider.PROVIDER_NAME)
                .setSignedAttributeGenerator(new AttributeTable(signedAttrs))
                .build("SHA1withRSA", key, cert);
        gen.addSignerInfoGenerator(signer);

        gen.addCertificates(certs);

        // create the signed message
        return gen.generate(dataPart);
    }

    public static void main(
            String[] args)
            throws Exception {
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
        MimeMultipart multiPart = createMultipartWithSignature(
                key, cert, certsAndCRLs, dataPart, certs);

        // create the mail message
        MimeMessage mail = Utils
                .createMimeMessage("example signed message", multiPart, multiPart.getContentType());

        // extract the message from the mail message
        if (mail.isMimeType("multipart/signed")) {
            SMIMESigned signed = new SMIMESigned(
                    (MimeMultipart) mail.getContent());

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
