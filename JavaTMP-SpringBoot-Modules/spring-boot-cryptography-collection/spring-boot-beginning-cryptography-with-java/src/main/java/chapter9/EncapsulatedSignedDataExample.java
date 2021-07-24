package chapter9;

import org.bouncycastle.cert.jcajce.JcaCertStore;
import org.bouncycastle.cms.*;
import org.bouncycastle.cms.jcajce.JcaSignerInfoGeneratorBuilder;
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

public class EncapsulatedSignedDataExample
        extends SignedDataExample {
    public static void main(String[] args)
            throws Exception {
        KeyStore credentials = Utils.createCredentials();
        PrivateKey key = (PrivateKey) credentials.getKey(Utils.END_ENTITY_ALIAS, Utils.KEY_PASSWD);
        Certificate[] chain = credentials.getCertificateChain(Utils.END_ENTITY_ALIAS);
        CertStore certsAndCRLs = CertStore.getInstance("Collection",
                new CollectionCertStoreParameters(Arrays.asList(chain)), "BC");

        CMSSignedDataGenerator gen = new CMSSignedDataGenerator();

        ContentSigner sha1Signer =
                new JcaContentSignerBuilder("SHA1WithRSAEncryption")
                        .build(key);

        gen.addSignerInfoGenerator(
                new JcaSignerInfoGeneratorBuilder(
                new JcaDigestCalculatorProviderBuilder().setProvider("BC")
                        .build()).build(sha1Signer,
                        (X509Certificate) chain[0]));

//        gen.addSigner(key, (X509Certificate) chain[0],
//                CMSSignedDataGenerator.DIGEST_SHA224);

//        gen.addCertificatesAndCRLs(certsAndCRLs);
        Store certs = new JcaCertStore(Arrays.asList(chain));
        gen.addCertificates((Store) certs);
        gen.addCRLs(certs);

        // create the signed-data object
//        CMSProcessable data = new CMSProcessableByteArray("Hello World!".getBytes());

        CMSTypedData cmsTypedData = new CMSProcessableByteArray("Hello World!".getBytes());
        CMSSignedData signed = gen.generate(cmsTypedData, true);

        // recreate
        signed = new CMSSignedData(signed.getEncoded());

        // verification step
        X509Certificate rootCert = (X509Certificate) credentials.getCertificate(Utils.ROOT_ALIAS);

        if (isValid(signed, rootCert)) {
            System.out.println("signed-data verification succeeded");
        } else {
            System.out.println("signed-data verification failed");
        }
    }
}
