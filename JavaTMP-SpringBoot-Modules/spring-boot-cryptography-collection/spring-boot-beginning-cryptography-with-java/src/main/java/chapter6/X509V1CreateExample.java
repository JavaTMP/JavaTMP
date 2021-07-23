package chapter6;

import org.bouncycastle.asn1.x500.X500Name;
import org.bouncycastle.asn1.x509.AlgorithmIdentifier;
import org.bouncycastle.asn1.x509.SubjectPublicKeyInfo;
import org.bouncycastle.cert.X509CertificateHolder;
import org.bouncycastle.cert.X509v1CertificateBuilder;
import org.bouncycastle.cert.jcajce.JcaX509CertificateConverter;
import org.bouncycastle.cert.jcajce.JcaX509v1CertificateBuilder;
import org.bouncycastle.crypto.params.AsymmetricKeyParameter;
import org.bouncycastle.crypto.util.PrivateKeyFactory;
import org.bouncycastle.jce.provider.BouncyCastleProvider;
import org.bouncycastle.operator.ContentSigner;
import org.bouncycastle.operator.DefaultDigestAlgorithmIdentifierFinder;
import org.bouncycastle.operator.DefaultSignatureAlgorithmIdentifierFinder;
import org.bouncycastle.operator.OperatorCreationException;
import org.bouncycastle.operator.bc.BcRSAContentSignerBuilder;
import org.bouncycastle.operator.jcajce.JcaContentSignerBuilder;
import org.bouncycastle.x509.X509V1CertificateGenerator;

import javax.security.auth.x500.X500Principal;
import java.io.IOException;
import java.math.BigInteger;
import java.security.*;
import java.security.cert.CertificateException;
import java.security.cert.X509Certificate;
import java.util.Date;

/**
 * Basic X.509 V1 Certificate creation.
 */
public class X509V1CreateExample {
    static {
        // https://stackoverflow.com/questions/40975510/spring-boot-and-jca-providers
        if (Security.getProvider(BouncyCastleProvider.PROVIDER_NAME) == null) {
            Security.addProvider(new BouncyCastleProvider());
        }
    }
    public static X509Certificate generateV1Certificate(KeyPair pair)
            throws InvalidKeyException, NoSuchProviderException, SignatureException {
        // generate the certificate

        X509V1CertificateGenerator certGen = new X509V1CertificateGenerator();

        certGen.setSerialNumber(BigInteger.valueOf(System.currentTimeMillis()));
        certGen.setIssuerDN(new X500Principal("CN=Test Certificate"));
        certGen.setNotBefore(new Date(System.currentTimeMillis() - 50000));
        certGen.setNotAfter(new Date(System.currentTimeMillis() + 50000));
        certGen.setSubjectDN(new X500Principal("CN=Test Certificate"));
        certGen.setPublicKey(pair.getPublic());
        certGen.setSignatureAlgorithm("SHA256WithRSAEncryption");
//        x509v1CertificateBuilder.
        return certGen.generateX509Certificate(pair.getPrivate(), "BC");
    }

    public static X509Certificate generateV1CertificateV2(KeyPair pair)
            throws CertificateException, OperatorCreationException, IOException {

        String algorithm = "SHA256WithRSAEncryption";
        Date startDate = new Date(System.currentTimeMillis() - 50000);
        Date endDate = new Date(System.currentTimeMillis() + 50000);
        new X500Principal("CN=Test Certificate");
        X500Name name = new X500Name("CN=Test Certificate");
        BigInteger sn = new BigInteger(64, new SecureRandom());

        AlgorithmIdentifier sigAlgId = new DefaultSignatureAlgorithmIdentifierFinder()
                .find(algorithm);
        AlgorithmIdentifier digAlgId = new DefaultDigestAlgorithmIdentifierFinder().find(sigAlgId);

        AsymmetricKeyParameter privateKeyAsymKeyParam =
                PrivateKeyFactory.createKey(
                        pair.getPrivate().getEncoded()
                );

        SubjectPublicKeyInfo subPubKeyInfo = SubjectPublicKeyInfo
                .getInstance(pair.getPublic().getEncoded());

        ContentSigner sigGen = new BcRSAContentSignerBuilder(
                sigAlgId, digAlgId)
                .build(privateKeyAsymKeyParam);

        X509v1CertificateBuilder v1CertGen =
                new X509v1CertificateBuilder(
                        name, sn, startDate, endDate, name, subPubKeyInfo);

        X509CertificateHolder certificateHolder = v1CertGen.build(sigGen);

        return new JcaX509CertificateConverter()
                .setProvider(BouncyCastleProvider.PROVIDER_NAME)
                .getCertificate(certificateHolder);

    }

    public static X509Certificate generateV1CertificateV3(
            final KeyPair keyPair) throws CertificateException, NoSuchAlgorithmException, NoSuchProviderException, SignatureException, InvalidKeyException, OperatorCreationException {

        String subject = "CN=Test Certificate";
        String issuer = "CN=Test Certificate";
        int validityDays = 100;
        String signatureAlgorithm = "SHA256WithRSAEncryption";

        Date from = new Date();
        Date to = new Date(from.getTime() + validityDays * 86400000L);
        BigInteger sn = new BigInteger(64, new SecureRandom());

        final X509v1CertificateBuilder certBuilder =
                new JcaX509v1CertificateBuilder(
                        new X500Name(issuer), sn, from, to,
                        new X500Name(subject), keyPair.getPublic());
        final ContentSigner signer =
                new JcaContentSignerBuilder(signatureAlgorithm)
                        .setProvider(BouncyCastleProvider.PROVIDER_NAME)
                        .build(keyPair.getPrivate());
        final X509CertificateHolder certHolder = certBuilder.build(signer);
        return new JcaX509CertificateConverter()
                .setProvider(BouncyCastleProvider.PROVIDER_NAME)
                .getCertificate(certHolder);
    }

    public static void main(String[] args) throws Exception {
        // create the keys
        KeyPair pair = Utils.generateRSAKeyPair();

        // generate the certificate
        X509Certificate cert = generateV1Certificate(pair);

        // show some basic validation
        cert.checkValidity(new Date());

        cert.verify(cert.getPublicKey());

        System.out.println("valid certificate generated");

        // generate the certificate
        cert = generateV1CertificateV2(pair);

        // show some basic validation
        cert.checkValidity(new Date());

        cert.verify(cert.getPublicKey());

        System.out.println("valid certificate generated");

        // generate the certificate
        cert = generateV1CertificateV3(pair);

        // show some basic validation
        cert.checkValidity(new Date());

        cert.verify(cert.getPublicKey());

        System.out.println("valid certificate generated");
    }
}
