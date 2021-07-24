package chapter9;

import org.bouncycastle.cert.jcajce.JcaCertStore;
import org.bouncycastle.cms.CMSProcessableByteArray;
import org.bouncycastle.cms.CMSSignedData;
import org.bouncycastle.cms.CMSSignedDataGenerator;
import org.bouncycastle.cms.CMSTypedData;
import org.bouncycastle.cms.jcajce.JcaSignerInfoGeneratorBuilder;
import org.bouncycastle.jce.provider.BouncyCastleProvider;
import org.bouncycastle.operator.ContentSigner;
import org.bouncycastle.operator.jcajce.JcaContentSignerBuilder;
import org.bouncycastle.operator.jcajce.JcaDigestCalculatorProviderBuilder;
import org.bouncycastle.util.Store;

import java.security.KeyStore;
import java.security.PrivateKey;
import java.security.cert.CertStore;
import java.security.cert.Certificate;
import java.security.cert.CollectionCertStoreParameters;
import java.security.cert.X509Certificate;
import java.util.Arrays;

/**
 * Example of generating a detached signature.
 */
public class SignedDataExample extends SignedDataProcessor {
    public static void main(String[] args) throws Exception {
        KeyStore credentials = Utils.createCredentials();

        PrivateKey key = (PrivateKey) credentials.getKey(Utils.END_ENTITY_ALIAS, Utils.KEY_PASSWD);
        Certificate[] chain = credentials.getCertificateChain(Utils.END_ENTITY_ALIAS);
        CollectionCertStoreParameters collectionCertStoreParameters = new CollectionCertStoreParameters(
                Arrays.asList(chain));
        CertStore certsAndCRLs = CertStore.getInstance("Collection",
                collectionCertStoreParameters, BouncyCastleProvider.PROVIDER_NAME);
        Store certs = new JcaCertStore(collectionCertStoreParameters.getCollection());
        X509Certificate cert = (X509Certificate) chain[0];

        // set up the generator
        CMSSignedDataGenerator gen = new CMSSignedDataGenerator();
        ContentSigner sha1Signer = new JcaContentSignerBuilder(
                "SHA1WithRSAEncryption")
                .setProvider(BouncyCastleProvider.PROVIDER_NAME)
                .build(key);

        gen.addSignerInfoGenerator(new JcaSignerInfoGeneratorBuilder(
                new JcaDigestCalculatorProviderBuilder()
                        .setProvider(BouncyCastleProvider.PROVIDER_NAME).build())
                .build(sha1Signer, cert));

        gen.addCertificates(certs);
//        gen.addCertificatesAndCRLs(certsAndCRLs);

        // create the signed-data object
//        CMSProcessable data =
        CMSTypedData data =
                new CMSProcessableByteArray("Hello World!".getBytes());

        CMSSignedData signed = gen.generate(data, false);

        // recreate
        signed = new CMSSignedData(data, signed.getEncoded());

        // verification step
        X509Certificate rootCert = (X509Certificate) credentials.getCertificate(Utils.ROOT_ALIAS);

        if (isValid(signed, rootCert)) {
            System.out.println("verification succeeded");
        } else {
            System.out.println("verification failed");
        }

    }
}
