package guid.examples;

import org.bouncycastle.asn1.ASN1Encodable;
import org.bouncycastle.asn1.ASN1Encoding;
import org.bouncycastle.asn1.DERBMPString;
import org.bouncycastle.asn1.nist.NISTObjectIdentifiers;
import org.bouncycastle.asn1.pkcs.Attribute;
import org.bouncycastle.asn1.pkcs.ContentInfo;
import org.bouncycastle.asn1.pkcs.PKCSObjectIdentifiers;
import org.bouncycastle.asn1.pkcs.PrivateKeyInfo;
import org.bouncycastle.asn1.x500.X500Name;
import org.bouncycastle.asn1.x500.X500NameBuilder;
import org.bouncycastle.asn1.x500.style.BCStyle;
import org.bouncycastle.asn1.x509.*;
import org.bouncycastle.cert.X509CertificateHolder;
import org.bouncycastle.cert.X509ExtensionUtils;
import org.bouncycastle.cert.X509v1CertificateBuilder;
import org.bouncycastle.cert.X509v3CertificateBuilder;
import org.bouncycastle.cert.jcajce.JcaX509CertificateConverter;
import org.bouncycastle.cert.jcajce.JcaX509ExtensionUtils;
import org.bouncycastle.cert.jcajce.JcaX509v1CertificateBuilder;
import org.bouncycastle.cert.jcajce.JcaX509v3CertificateBuilder;
import org.bouncycastle.crypto.AsymmetricCipherKeyPair;
import org.bouncycastle.crypto.generators.RSAKeyPairGenerator;
import org.bouncycastle.crypto.params.AsymmetricKeyParameter;
import org.bouncycastle.crypto.params.RSAKeyGenerationParameters;
import org.bouncycastle.crypto.util.SubjectPublicKeyInfoFactory;
import org.bouncycastle.jce.provider.BouncyCastleProvider;
import org.bouncycastle.operator.*;
import org.bouncycastle.operator.bc.BcDefaultDigestProvider;
import org.bouncycastle.operator.bc.BcRSAContentSignerBuilder;
import org.bouncycastle.operator.jcajce.JcaContentSignerBuilder;
import org.bouncycastle.pkcs.*;
import org.bouncycastle.pkcs.bc.BcPKCS10CertificationRequestBuilder;
import org.bouncycastle.pkcs.bc.BcPKCS12MacCalculatorBuilderProvider;
import org.bouncycastle.pkcs.jcajce.JcaPKCS12SafeBagBuilder;
import org.bouncycastle.pkcs.jcajce.JcePKCS12MacCalculatorBuilder;
import org.bouncycastle.pkcs.jcajce.JcePKCSPBEInputDecryptorProviderBuilder;
import org.bouncycastle.pkcs.jcajce.JcePKCSPBEOutputEncryptorBuilder;
import org.bouncycastle.util.io.Streams;

import javax.security.auth.x500.X500Principal;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.math.BigInteger;
import java.security.Certificate;
import java.security.*;
import java.security.cert.X509Certificate;
import java.security.spec.PKCS8EncodedKeySpec;
import java.util.*;

//*************************************************
// *MUST READ:* http://www.cryptoworkshop.com/guide/
// Download the guide (it was very helpful): http://www.cryptoworkshop.com/guide/cwguide-070313.pdf
// The source code is available here: http://www.cryptoworkshop.com/guide/cwcode-070313.zip
// Required libraries: bcmail-jdk15on-1.53.jar  bcpkix-jdk15on-1.53.jar  bcprov-ext-jdk15on-1.53.jar  bcprov-jdk15on-1.53.jar  commons-codec-1.10.jar
// keytool -genkey -keyalg RSA -alias opendaylight -keystore ctl.jks -storepass opendaylight -validity 360 -keysize 2048
// http://www.programcreek.com/java-api-examples/index.php?api=org.bouncycastle.crypto.AsymmetricCipherKeyPair
// Useful tool: https://certlogik.com/decoder/

public class Main3 {

    private static final int VALIDITY_PERIOD = 365;
    private static final int COLUMN_MAX = 64;
    private static final char[] ODL_KEYSTORE_PASS = "opendaylight".toCharArray();

    public static void main(String[] args) throws Exception {
        Security.addProvider(new BouncyCastleProvider());
        RSAKeyPairGenerator generator = new RSAKeyPairGenerator();
        // RSAKeyGenerationParameters: public exponent, random, strength (suggested 2048), certainty
        // certainty: http://www.keylength.com/
        RSAKeyGenerationParameters kgp = new RSAKeyGenerationParameters(BigInteger.valueOf(65537),
                createFixedRandom(),
                2048,
                83);
        generator.init(kgp);
        AsymmetricCipherKeyPair akp = generator.generateKeyPair();
        X509CertificateHolder publicKey = buildRootPubCertLightV3(akp);
        X509CertificateHolder privateKey = buildRootPrivCertLightV3(akp);
        System.out.println("Public key: ");
        printOneLineCert(publicKey);
        System.out.println("\nPrivate key: ");
        printOneLineCert(privateKey);
        System.out.println("\nCsr: ");
        generatePkcs10Csr(akp);
    }

    private static void generatePkcs10Csr(AsymmetricCipherKeyPair akp) throws
            NoSuchAlgorithmException,
            NoSuchProviderException,
            IOException,
            OperatorCreationException,
            PKCSException {
        AlgorithmIdentifier sigAlg = new DefaultSignatureAlgorithmIdentifierFinder().find("md5WithRSAEncryption");
        AlgorithmIdentifier digAlg = new DefaultDigestAlgorithmIdentifierFinder().find(sigAlg);
        X500NameBuilder x500NameBld = new X500NameBuilder(BCStyle.INSTANCE);
        x500NameBld.addRDN(BCStyle.C, "CA");
        x500NameBld.addRDN(BCStyle.ST, "Quebec");
        x500NameBld.addRDN(BCStyle.L, "Montreal");
        x500NameBld.addRDN(BCStyle.O, "Dev");
        x500NameBld.addRDN(BCStyle.CN, "Inocybe");
        X500Name subject = x500NameBld.build();
        // This one should take the public key as per the javadoc
        PKCS10CertificationRequestBuilder requestBuilder = new BcPKCS10CertificationRequestBuilder(subject, akp.getPublic());
        ExtensionsGenerator extGen = new ExtensionsGenerator();
        extGen.addExtension(Extension.subjectAlternativeName, false,
                new GeneralNames(new GeneralName(GeneralName.rfc822Name, "grmontpetit@inocybe.com")));
        requestBuilder.addAttribute(PKCSObjectIdentifiers.pkcs_9_at_extensionRequest, extGen.generate());
        // This one takes the private key as per the javadoc
        PKCS10CertificationRequest req1 = requestBuilder.build(new BcRSAContentSignerBuilder(sigAlg, digAlg).build(akp.getPrivate()));
        System.out.println(
                new String(Base64.getEncoder().encode(req1.getEncoded()))
        );
    }

    private static X509CertificateHolder buildRootPrivCertLightV3(AsymmetricCipherKeyPair keyPair) throws IOException, OperatorCreationException {
        X500NameBuilder x500IssuerBld = new X500NameBuilder(BCStyle.INSTANCE);
        x500IssuerBld.addRDN(BCStyle.C, "CA");
        x500IssuerBld.addRDN(BCStyle.ST, "Quebec");
        x500IssuerBld.addRDN(BCStyle.L, "Montreal");
        x500IssuerBld.addRDN(BCStyle.O, "Dev");
        x500IssuerBld.addRDN(BCStyle.CN, "Inocybe");
        X500Name issuer = x500IssuerBld.build();
        X500NameBuilder x500SubjectBld = new X500NameBuilder(BCStyle.INSTANCE);
        x500SubjectBld.addRDN(BCStyle.C, "CA");
        x500SubjectBld.addRDN(BCStyle.ST, "Quebec");
        x500SubjectBld.addRDN(BCStyle.L, "Montreal");
        x500SubjectBld.addRDN(BCStyle.O, "Dev");
        x500SubjectBld.addRDN(BCStyle.CN, "Inocybe");
        X500Name subject = x500IssuerBld.build();
        X509v3CertificateBuilder certBldr = new X509v3CertificateBuilder(issuer,
                BigInteger.valueOf(1),
                new Date(System.currentTimeMillis()),
                new Date(System.currentTimeMillis() + VALIDITY_PERIOD),
                subject,
                SubjectPublicKeyInfoFactory
                        .createSubjectPublicKeyInfo(keyPair.getPrivate()));
        AlgorithmIdentifier sigAlg = new DefaultSignatureAlgorithmIdentifierFinder().find("md5WithRSAEncryption");
        AlgorithmIdentifier digAlg = new DefaultDigestAlgorithmIdentifierFinder().find(sigAlg);
        ContentSigner signer = new BcRSAContentSignerBuilder(sigAlg, digAlg).build(keyPair.getPrivate());
        return certBldr.build(signer);
    }

    /**
     * Create a keystore file under pkcs12 format.
     *
     * @param pfxIn
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unused")
    private static PKCS12PfxPdu readPKCS12File(InputStream pfxIn) throws Exception {
        PKCS12PfxPdu pfx = new PKCS12PfxPdu(Streams.readAll(pfxIn));
        if (!pfx.isMacValid(new BcPKCS12MacCalculatorBuilderProvider(BcDefaultDigestProvider.INSTANCE),
                JcaUtils.KEY_PASSWD)) {
            System.err.println("PKCS#12 MAC test failed!");
        }
        ContentInfo[] infos = pfx.getContentInfos();
        Map<String, X509Certificate> certMap = new HashMap<String, X509Certificate>();
        Map<ASN1Encodable, X509Certificate> certKeyIds = new HashMap<ASN1Encodable, X509Certificate>();
        Map<String, PrivateKey> privKeyMap = new HashMap<String, PrivateKey>();
        Map<PrivateKey, ASN1Encodable> privKeyIds = new HashMap<PrivateKey, ASN1Encodable>();

        InputDecryptorProvider inputDecryptorProvider = new JcePKCSPBEInputDecryptorProviderBuilder().setProvider("BC")
                .build(JcaUtils.KEY_PASSWD);
        JcaX509CertificateConverter jcaConverter = new JcaX509CertificateConverter().setProvider("BC");
        for (int i = 0; i != infos.length; i++) {
            if (infos[i].getContentType().equals(PKCSObjectIdentifiers.encryptedData)) {
                PKCS12SafeBagFactory dataFact = new PKCS12SafeBagFactory(infos[i], inputDecryptorProvider);
                PKCS12SafeBag[] bags = dataFact.getSafeBags();
                for (int b = 0; b != bags.length; b++) {
                    PKCS12SafeBag bag = bags[b];
                    X509CertificateHolder certHldr = (X509CertificateHolder) bag.getBagValue();
                    X509Certificate cert = jcaConverter.getCertificate(certHldr);
                    Attribute[] attributes = bag.getAttributes();
                    for (int a = 0; a != attributes.length; a++) {
                        Attribute attr = attributes[a];
                        if (attr.getAttrType().equals(PKCS12SafeBag.friendlyNameAttribute)) {
                            certMap.put(((DERBMPString) attr.getAttributeValues()[0]).getString(), cert);
                        } else if (attr.getAttrType().equals(PKCS12SafeBag.localKeyIdAttribute)) {
                            certKeyIds.put(attr.getAttributeValues()[0], cert);
                        }
                    }
                }
            } else {
                PKCS12SafeBagFactory dataFact = new PKCS12SafeBagFactory(infos[i]);
                PKCS12SafeBag[] bags = dataFact.getSafeBags();
                PKCS8EncryptedPrivateKeyInfo encInfo = (PKCS8EncryptedPrivateKeyInfo) bags[0].getBagValue();
                PrivateKeyInfo info = encInfo.decryptPrivateKeyInfo(inputDecryptorProvider);
                KeyFactory keyFact = KeyFactory.getInstance(info.getPrivateKeyAlgorithm().getAlgorithm().getId(), "BC");
                PrivateKey privKey = keyFact.generatePrivate(new PKCS8EncodedKeySpec(info.getEncoded()));
                Attribute[] attributes = bags[0].getAttributes();
                for (int a = 0; a != attributes.length; a++) {
                    Attribute attr = attributes[a];
                    if (attr.getAttrType().equals(PKCS12SafeBag.friendlyNameAttribute)) {
                        privKeyMap.put(((DERBMPString) attr.getAttributeValues()[0]).getString(), privKey);
                    } else if (attr.getAttrType().equals(PKCS12SafeBag.localKeyIdAttribute)) {
                        privKeyIds.put(privKey, attr.getAttributeValues()[0]);
                    }
                }
            }
        }
        System.out.println("########## PFX Dump");
        for (@SuppressWarnings("rawtypes")
             Iterator it = privKeyMap.keySet().iterator(); it.hasNext(); ) {
            String alias = (String) it.next();
            System.out.println("Key Entry: " + alias + ", Subject: "
                    + (certKeyIds.get(privKeyIds.get(privKeyMap.get(alias))).getSubjectDN()));
        }
        for (@SuppressWarnings("rawtypes")
             Iterator it = certMap.keySet().iterator(); it.hasNext(); ) {
            String alias = (String) it.next();
            System.out.println("Certificate Entry: " + alias + ", Subject: "
                    + (certMap.get(alias).getSubjectDN()));
        }
        System.out.println();
        return pfx;
    }

    @SuppressWarnings("unused")
    private static void createPKCS12File(OutputStream pfxOut, PrivateKey key, Certificate[] chain) throws Exception {
        OutputEncryptor encOut = new JcePKCSPBEOutputEncryptorBuilder(NISTObjectIdentifiers.id_aes256_CBC)
                .setProvider("BC").build(ODL_KEYSTORE_PASS);
        PKCS12SafeBagBuilder taCertBagBuilder = new JcaPKCS12SafeBagBuilder((X509Certificate) chain[2]);
        taCertBagBuilder.addBagAttribute(PKCS12SafeBag.friendlyNameAttribute,
                new DERBMPString("opendaylight"));
        PKCS12SafeBagBuilder caCertBagBuilder = new JcaPKCS12SafeBagBuilder((X509Certificate) chain[1]);
        caCertBagBuilder.addBagAttribute(PKCS12SafeBag.friendlyNameAttribute,
                new DERBMPString("opendaylight"));
        JcaX509ExtensionUtils extUtils = new JcaX509ExtensionUtils();
        PKCS12SafeBagBuilder eeCertBagBuilder = new JcaPKCS12SafeBagBuilder((X509Certificate) chain[0]);
        eeCertBagBuilder.addBagAttribute(PKCS12SafeBag.friendlyNameAttribute, new DERBMPString("opendaylight"));
        @SuppressWarnings("deprecation")
        SubjectKeyIdentifier pubKeyId = extUtils.createSubjectKeyIdentifier(chain[0].getPublicKey());
        eeCertBagBuilder.addBagAttribute(PKCS12SafeBag.localKeyIdAttribute, pubKeyId);
        PKCS12SafeBagBuilder keyBagBuilder = new JcaPKCS12SafeBagBuilder(key, encOut);
        keyBagBuilder.addBagAttribute(PKCS12SafeBag.friendlyNameAttribute, new DERBMPString("opendaylight"));
        keyBagBuilder.addBagAttribute(PKCS12SafeBag.localKeyIdAttribute, pubKeyId);
        PKCS12PfxPduBuilder builder = new PKCS12PfxPduBuilder();
        builder.addData(keyBagBuilder.build());
        builder.addEncryptedData(
                new JcePKCSPBEOutputEncryptorBuilder(PKCSObjectIdentifiers.pbeWithSHAAnd128BitRC2_CBC).setProvider("BC")
                        .build(ODL_KEYSTORE_PASS),
                new PKCS12SafeBag[]{eeCertBagBuilder.build(), caCertBagBuilder.build(), taCertBagBuilder.build()});
        PKCS12PfxPdu pfx = builder.build(new JcePKCS12MacCalculatorBuilder(NISTObjectIdentifiers.id_sha256),
                JcaUtils.KEY_PASSWD);
        // make sure we don't include indefinite length encoding
        pfxOut.write(pfx.getEncoded(ASN1Encoding.DL));
        pfxOut.close();
    }

    /**
     * Build a sample V3 certificate to use as a CA root certificate
     */
    public static X509CertificateHolder buildRootPubCertLightV3(AsymmetricCipherKeyPair keyPair) throws Exception {
        X500NameBuilder x500IssuerBld = new X500NameBuilder(BCStyle.INSTANCE);
        x500IssuerBld.addRDN(BCStyle.C, "CA");
        x500IssuerBld.addRDN(BCStyle.ST, "Quebec");
        x500IssuerBld.addRDN(BCStyle.L, "Montreal");
        x500IssuerBld.addRDN(BCStyle.O, "Dev");
        x500IssuerBld.addRDN(BCStyle.CN, "Inocybe");
        X500Name issuer = x500IssuerBld.build();
        X500NameBuilder x500SubjectBld = new X500NameBuilder(BCStyle.INSTANCE);
        x500SubjectBld.addRDN(BCStyle.C, "CA");
        x500SubjectBld.addRDN(BCStyle.ST, "Quebec");
        x500SubjectBld.addRDN(BCStyle.L, "Montreal");
        x500SubjectBld.addRDN(BCStyle.O, "Dev");
        x500SubjectBld.addRDN(BCStyle.CN, "Inocybe");
        X500Name subject = x500IssuerBld.build();
        X509v3CertificateBuilder certBldr = new X509v3CertificateBuilder(issuer,
                BigInteger.valueOf(1),
                new Date(System.currentTimeMillis()),
                new Date(System.currentTimeMillis() + VALIDITY_PERIOD),
                subject,
                SubjectPublicKeyInfoFactory
                        .createSubjectPublicKeyInfo(keyPair.getPublic()));
        AlgorithmIdentifier sigAlg = new DefaultSignatureAlgorithmIdentifierFinder().find("md5WithRSAEncryption");
        AlgorithmIdentifier digAlg = new DefaultDigestAlgorithmIdentifierFinder().find(sigAlg);
        ContentSigner signer = new BcRSAContentSignerBuilder(sigAlg, digAlg).build(keyPair.getPrivate());
        return certBldr.build(signer);
    }

    /**
     * Build a sample V3 certificate to use as an intermediate CA certificate
     */
    public static X509CertificateHolder buildIntermediateCert(AsymmetricKeyParameter intKey,
                                                              AsymmetricKeyParameter caKey, X509CertificateHolder caCert) throws Exception {
        SubjectPublicKeyInfo intKeyInfo = SubjectPublicKeyInfoFactory.createSubjectPublicKeyInfo(intKey);
        X509v3CertificateBuilder certBldr = new X509v3CertificateBuilder(caCert.getSubject(), BigInteger.valueOf(1),
                new Date(System.currentTimeMillis()), new Date(System.currentTimeMillis() + VALIDITY_PERIOD),
                new X500Name("CN=Test CA Certificate"), intKeyInfo);
        X509ExtensionUtils extUtils = new X509ExtensionUtils(new SHA1DigestCalculator());
        certBldr.addExtension(Extension.authorityKeyIdentifier, false, extUtils.createAuthorityKeyIdentifier(caCert))
                .addExtension(Extension.subjectKeyIdentifier, false, extUtils.createSubjectKeyIdentifier(intKeyInfo))
                .addExtension(Extension.basicConstraints, true, new BasicConstraints(0))
                .addExtension(Extension.keyUsage, true,
                        new KeyUsage(KeyUsage.digitalSignature | KeyUsage.keyCertSign | KeyUsage.cRLSign));
        AlgorithmIdentifier sigAlg = new DefaultSignatureAlgorithmIdentifierFinder().find("SHA1withRSA");
        AlgorithmIdentifier digAlg = new DefaultDigestAlgorithmIdentifierFinder().find(sigAlg);
        ContentSigner signer = new BcRSAContentSignerBuilder(sigAlg, digAlg).build(caKey);
        return certBldr.build(signer);
    }

    /**
     * Build a sample V3 certificate to use as an end entity certificate
     */
    public static X509CertificateHolder buildEndEntityCert(AsymmetricKeyParameter entityKey,
                                                           AsymmetricKeyParameter caKey,
                                                           X509CertificateHolder caCert) throws Exception {
        SubjectPublicKeyInfo entityKeyInfo = SubjectPublicKeyInfoFactory.createSubjectPublicKeyInfo(entityKey);
        X500NameBuilder x500NameBld = new X500NameBuilder(BCStyle.INSTANCE);
        x500NameBld.addRDN(BCStyle.C, "CA");
        x500NameBld.addRDN(BCStyle.ST, "Quebec");
        x500NameBld.addRDN(BCStyle.L, "Montreal");
        x500NameBld.addRDN(BCStyle.O, "Dev");
        x500NameBld.addRDN(BCStyle.CN, "Inocybe");
        X500Name subject = x500NameBld.build();
        X509v3CertificateBuilder certBldr = new X509v3CertificateBuilder(caCert.getSubject(), BigInteger.valueOf(1),
                new Date(System.currentTimeMillis()), new Date(System.currentTimeMillis() + VALIDITY_PERIOD),
                subject, entityKeyInfo);
        X509ExtensionUtils extUtils = new X509ExtensionUtils(new SHA1DigestCalculator());
        certBldr.addExtension(Extension.authorityKeyIdentifier, false, extUtils.createAuthorityKeyIdentifier(caCert))
                .addExtension(Extension.subjectKeyIdentifier, false, extUtils.createSubjectKeyIdentifier(entityKeyInfo))
                .addExtension(Extension.basicConstraints, true, new BasicConstraints(false)).addExtension(
                Extension.keyUsage, true, new KeyUsage(KeyUsage.digitalSignature | KeyUsage.keyEncipherment));
        AlgorithmIdentifier sigAlg = new DefaultSignatureAlgorithmIdentifierFinder().find("SHA1withRSA");
        AlgorithmIdentifier digAlg = new DefaultDigestAlgorithmIdentifierFinder().find(sigAlg);
        ContentSigner signer = new BcRSAContentSignerBuilder(sigAlg, digAlg).build(caKey);
        return certBldr.build(signer);
    }

    /**
     * Build a sample V1 certificate to use as a CA root certificate
     */
    public static X509CertificateHolder buildRootCertLightV1(AsymmetricCipherKeyPair keyPair) throws Exception {
        X509v1CertificateBuilder certBldr = new X509v1CertificateBuilder(new X500Name("CN=Test Root Certificate"),
                BigInteger.valueOf(1), new Date(System.currentTimeMillis()),
                new Date(System.currentTimeMillis() + VALIDITY_PERIOD), new X500Name("CN=Test Root Certificate"),
                SubjectPublicKeyInfoFactory.createSubjectPublicKeyInfo(keyPair.getPublic()));
        AlgorithmIdentifier sigAlg = new DefaultSignatureAlgorithmIdentifierFinder().find("MD5withRSA");
        AlgorithmIdentifier digAlg = new DefaultDigestAlgorithmIdentifierFinder().find(sigAlg);
        ContentSigner signer = new BcRSAContentSignerBuilder(sigAlg, digAlg).build(keyPair.getPrivate());
        return certBldr.build(signer);
    }

    /**
     * Build a sample V1 certificate to use as a CA root certificate
     */
    public static X509Certificate buildRootCert(KeyPair keyPair) throws Exception {
        X509v1CertificateBuilder certBldr = new JcaX509v1CertificateBuilder(new X500Name("CN=Test Root Certificate"),
                BigInteger.valueOf(1000), new Date(System.currentTimeMillis()),
                new Date(System.currentTimeMillis() + VALIDITY_PERIOD), new X500Name("CN=Test Root Certificate"),
                keyPair.getPublic());
        ContentSigner signer = new JcaContentSignerBuilder("MD5withRSA").setProvider("BC").build(keyPair.getPrivate());
        return new JcaX509CertificateConverter().setProvider("BC").getCertificate(certBldr.build(signer));
    }

    /**
     * Build a sample V3 certificate to use as an intermediate CA certificate
     */
    public static X509Certificate buildIntermediateCert(PublicKey intKey, PrivateKey caKey, X509Certificate caCert)
            throws Exception {
        X509v3CertificateBuilder certBldr = new JcaX509v3CertificateBuilder(caCert.getSubjectX500Principal(),
                BigInteger.valueOf(1), new Date(System.currentTimeMillis()),
                new Date(System.currentTimeMillis() + VALIDITY_PERIOD), new X500Principal("CN=Test CA Certificate"),
                intKey);
        JcaX509ExtensionUtils extUtils = new JcaX509ExtensionUtils();
        certBldr.addExtension(Extension.authorityKeyIdentifier, false, extUtils.createAuthorityKeyIdentifier(caCert))
                .addExtension(Extension.subjectKeyIdentifier, false, extUtils.createSubjectKeyIdentifier(intKey))
                .addExtension(Extension.basicConstraints, true, new BasicConstraints(0))
                .addExtension(Extension.keyUsage, true,
                        new KeyUsage(KeyUsage.digitalSignature | KeyUsage.keyCertSign | KeyUsage.cRLSign));
        ContentSigner signer = new JcaContentSignerBuilder("MD5withRSA").setProvider("BC").build(caKey);
        return new JcaX509CertificateConverter().setProvider("BC").getCertificate(certBldr.build(signer));
    }

    /**
     * Build a sample V3 certificate to use as an end entity certificate
     */
    public static X509Certificate buildEndEntityCert(PublicKey entityKey, PrivateKey caKey, X509Certificate caCert)
            throws Exception {
        X509v3CertificateBuilder certBldr = new JcaX509v3CertificateBuilder(caCert.getSubjectX500Principal(),
                BigInteger.valueOf(1), new Date(System.currentTimeMillis()),
                new Date(System.currentTimeMillis() + VALIDITY_PERIOD),
                new X500Principal("CN=Test End Entity Certificate"), entityKey);
        JcaX509ExtensionUtils extUtils = new JcaX509ExtensionUtils();
        certBldr.addExtension(Extension.authorityKeyIdentifier, false, extUtils.createAuthorityKeyIdentifier(caCert))
                .addExtension(Extension.subjectKeyIdentifier, false, extUtils.createSubjectKeyIdentifier(entityKey))
                .addExtension(Extension.basicConstraints, true, new BasicConstraints(false)).addExtension(
                Extension.keyUsage, true, new KeyUsage(KeyUsage.digitalSignature | KeyUsage.keyEncipherment));
        ContentSigner signer = new JcaContentSignerBuilder("MD5withRSA").setProvider("BC").build(caKey);
        return new JcaX509CertificateConverter().setProvider("BC").getCertificate(certBldr.build(signer));
    }

    @SuppressWarnings("unused")
    private static KeyPair generateKeyPair() throws NoSuchAlgorithmException, NoSuchProviderException {
        KeyPairGenerator kpg = KeyPairGenerator.getInstance("RSA", "BC");
        kpg.initialize(2048);

        KeyPair kp = kpg.genKeyPair();
        return kp;
    }

    @SuppressWarnings("unused")
    private static void printCert(X509Certificate cert) {
        byte[] encodedPubKey =
                Base64.getEncoder().encode(
                        cert.getPublicKey().getEncoded());
        byte[] formattedPubKey = formatKey(encodedPubKey);
        String stringPubKey = new String(formattedPubKey).replace(";", "\n");
        System.out.println(stringPubKey);
    }

    private static void printOneLineCert(X509CertificateHolder caCert2) throws IOException {
        System.out.print("\n");
        byte[] encodedKey = Base64.getEncoder().encode(caCert2.getEncoded());
        System.out.println(new String(encodedKey));
    }

    @SuppressWarnings("unused")
    private static void printCert(X509CertificateHolder cert) throws IOException {
        System.out.print("\n");
        byte[] encodedPubKey = Base64.getEncoder().encode(cert.getEncoded());
        System.out.println(new String(encodedPubKey));
        System.out.print("\n");
        byte[] formattedPubKey = formatKey(encodedPubKey);
        String stringPubKey = new String(formattedPubKey).replace(";", "\n");
        System.out.println(stringPubKey);
    }

    /**
     * This method is supposed to add carriage returns
     * at every 64 characters but it mess everything up...
     * Many hours wasted.
     *
     * @param encodedKey
     * @return
     */
    @Deprecated
    private static byte[] formatKey(byte[] encodedKey) {
        // 64 character lines
        int nbLines = (encodedKey.length / COLUMN_MAX) + 1;
        byte[] newKey = new byte[encodedKey.length + nbLines];
        int j = 0;
        for (int i = 0; i < newKey.length; i++) {
            if (j == encodedKey.length) {
                break;
            }
            newKey[i] = encodedKey[j];
            if (i != 0 && i % 63 == 0) {
                newKey[i] = 59;
            }
            j++;
        }
        return newKey;
    }

    public static SecureRandom createFixedRandom() {
        return new FixedRand();
    }

    private static class FixedRand extends SecureRandom {
        /**
         *
         */
        private static final long serialVersionUID = 3619077188182373998L;
        MessageDigest sha;
        byte[] state;

        FixedRand() {
            try {
                this.sha = MessageDigest.getInstance("SHA-1");
                this.state = sha.digest();
            } catch (NoSuchAlgorithmException e) {
                throw new RuntimeException("can't find SHA-1!");
            }
        }

        public void nextBytes(byte[] bytes) {

            int off = 0;

            sha.update(state);

            while (off < bytes.length) {
                state = sha.digest();

                if (bytes.length - off > state.length) {
                    System.arraycopy(state, 0, bytes, off, state.length);
                } else {
                    System.arraycopy(state, 0, bytes, off, bytes.length - off);
                }

                off += state.length;

                sha.update(state);
            }
        }
    }
}
