package com.javatmp.demo.crypto.certificate.example;

import com.javatmp.demo.crypto.certificate.Utils;
import org.bouncycastle.asn1.ASN1EncodableVector;
import org.bouncycastle.asn1.ASN1ObjectIdentifier;
import org.bouncycastle.asn1.DERSequence;
import org.bouncycastle.asn1.x500.X500Name;
import org.bouncycastle.asn1.x500.X500NameBuilder;
import org.bouncycastle.asn1.x500.style.BCStyle;
import org.bouncycastle.asn1.x500.style.RFC4519Style;
import org.bouncycastle.asn1.x509.BasicConstraints;
import org.bouncycastle.asn1.x509.Extension;
import org.bouncycastle.asn1.x509.GeneralName;
import org.bouncycastle.asn1.x509.GeneralNames;
import org.bouncycastle.cert.CertException;
import org.bouncycastle.cert.CertIOException;
import org.bouncycastle.cert.X509CertificateHolder;
import org.bouncycastle.cert.X509v3CertificateBuilder;
import org.bouncycastle.cert.jcajce.JcaX509CertificateConverter;
import org.bouncycastle.cert.jcajce.JcaX509ExtensionUtils;
import org.bouncycastle.cert.jcajce.JcaX509v3CertificateBuilder;
import org.bouncycastle.jce.provider.BouncyCastleProvider;
import org.bouncycastle.operator.ContentSigner;
import org.bouncycastle.operator.ContentVerifierProvider;
import org.bouncycastle.operator.OperatorCreationException;
import org.bouncycastle.operator.jcajce.JcaContentSignerBuilder;
import org.bouncycastle.operator.jcajce.JcaContentVerifierProviderBuilder;

import java.io.IOException;
import java.math.BigInteger;
import java.security.*;
import java.security.cert.CertificateException;
import java.security.cert.X509Certificate;
import java.util.*;


/**
 * Basic X.509 V3 Certificate creation with TLS flagging.
 */
public class X509V3CreateExampleNew {

    static {
        // https://stackoverflow.com/questions/40975510/spring-boot-and-jca-providers
        if (Security.getProvider(BouncyCastleProvider.PROVIDER_NAME) == null) {
            Security.addProvider(new BouncyCastleProvider());
        }
    }

    // https://stackoverflow.com/questions/29852290/self-signed-x509-certificate-with-bouncy-castle-in-java
    public static X509Certificate selfSign(KeyPair keyPair)
            throws OperatorCreationException, IOException, CertificateException {

        X500Name dnName = new X500Name("CN=Test Certificate");

        long now = System.currentTimeMillis();
        Date startDate = new Date(now);
        BigInteger certSerialNumber = new BigInteger(Long.toString(now)); // <-- Using the current timestamp as the certificate serial number

        Calendar calendar = Calendar.getInstance();
        calendar.setTime(startDate);
        calendar.add(Calendar.YEAR, 1); // <-- 1 Yr validity
        Date endDate = calendar.getTime();

        String signatureAlgorithm = "SHA256WithRSA"; // <-- Use appropriate signature algorithm based on your keyPair algorithm.

        ContentSigner contentSigner =
                new JcaContentSignerBuilder(signatureAlgorithm)
                        .build(keyPair.getPrivate());

        JcaX509v3CertificateBuilder certBuilder =
                new JcaX509v3CertificateBuilder(
                        dnName,
                        certSerialNumber,
                        startDate,
                        endDate,
                        dnName,
                        keyPair.getPublic()
                );

        // Extensions --------------------------

        // Basic Constraints
        BasicConstraints basicConstraints = new BasicConstraints(true); // <-- true for CA, false for EndEntity

        certBuilder.addExtension(new ASN1ObjectIdentifier("2.5.29.19"), true, basicConstraints); // Basic Constraints is usually marked as critical.

        // -------------------------------------

        return new JcaX509CertificateConverter()
                .setProvider(BouncyCastleProvider.PROVIDER_NAME)
                .getCertificate(certBuilder.build(contentSigner));
    }

    public static X509Certificate createX509V3Certificate(
            KeyPair kp, int days, X500NameBuilder issuerBuilder,
            X500NameBuilder subjectBuilder, String domain, String signAlgoritm,
            Set<String> sanDnsNames) throws GeneralSecurityException, IOException, CertException, OperatorCreationException {
        PublicKey pubKey = kp.getPublic();
        PrivateKey privKey = kp.getPrivate();
        byte[] serno = new byte[8];
        SecureRandom random = SecureRandom.getInstance("SHA1PRNG");
        random.setSeed((new Date().getTime()));
        random.nextBytes(serno);
        BigInteger serial = (new java.math.BigInteger(serno)).abs();
        X500Name issuerDN = issuerBuilder.build();
        X500Name subjectDN = subjectBuilder.build();
        // builder
        JcaX509v3CertificateBuilder certBuilder = new JcaX509v3CertificateBuilder( //
                issuerDN, //
                serial, //
                new Date(), //
                new Date(System.currentTimeMillis() + days * (1000L * 60 * 60 * 24)), //
                subjectDN, //
                pubKey //
        );
        // add subjectAlternativeName extension that includes all relevant names.
        final GeneralNames subjectAlternativeNames = getSubjectAlternativeNames(sanDnsNames);
        final boolean critical = subjectDN.getRDNs().length == 0;
        certBuilder.addExtension(Extension.subjectAlternativeName, critical,
                subjectAlternativeNames);
        // add keyIdentifiers extensions
        JcaX509ExtensionUtils utils = new JcaX509ExtensionUtils();
        certBuilder.addExtension(Extension.subjectKeyIdentifier,
                false, utils.createSubjectKeyIdentifier(pubKey));
        certBuilder.addExtension(Extension.authorityKeyIdentifier,
                false, utils.createAuthorityKeyIdentifier(pubKey));
        // build the certificate
        ContentSigner signer = new JcaContentSignerBuilder(signAlgoritm).build(privKey);
        X509CertificateHolder cert = certBuilder.build(signer);
        // verify the validity
        if (!cert.isValidOn(new Date())) {
            throw new GeneralSecurityException("Certificate validity not valid");
        }
        // verify the signature (self-signed)
        ContentVerifierProvider verifierProvider = new JcaContentVerifierProviderBuilder().build(pubKey);
        if (!cert.isSignatureValid(verifierProvider)) {
            throw new GeneralSecurityException("Certificate signature not valid");
        }
        return new JcaX509CertificateConverter().getCertificate(cert);

    }

    private static X509Certificate createRootCACertificate(
            final KeyPair keyPair, final String dn,
            final Integer validDay) throws CertIOException, NoSuchAlgorithmException, OperatorCreationException, CertificateException {


        long now = System.currentTimeMillis();
        Date startDate = new Date(now);
        BigInteger certSerialNumber = new BigInteger(Long.toString(now)); // <-- Using the current timestamp as the certificate serial number

        Calendar calendar = Calendar.getInstance();
        calendar.setTime(startDate);
        calendar.add(Calendar.YEAR, 1); // <-- 1 Yr validity
        Date endDate = calendar.getTime();

        final X509v3CertificateBuilder builder = new JcaX509v3CertificateBuilder(
                new X500Name(RFC4519Style.INSTANCE, dn),
                certSerialNumber,
                startDate,
                endDate,
                new X500Name(RFC4519Style.INSTANCE, dn),
                keyPair.getPublic());
        JcaX509ExtensionUtils utils = new JcaX509ExtensionUtils();
        builder.addExtension(Extension.basicConstraints, false, new BasicConstraints(true));
        builder.addExtension(Extension.subjectKeyIdentifier,
                false, utils.createSubjectKeyIdentifier(keyPair.getPublic()));
        builder.addExtension(Extension.authorityKeyIdentifier,
                false, utils.createAuthorityKeyIdentifier(keyPair.getPublic()));
        ContentSigner contentSigner = new JcaContentSignerBuilder("SHA256WithRSA")
                .setProvider(BouncyCastleProvider.PROVIDER_NAME)
                .build(keyPair.getPrivate());
        return new JcaX509CertificateConverter().getCertificate(builder.build(contentSigner));

    }

    protected static GeneralNames getSubjectAlternativeNames(Set<String> sanDnsNames) {
        final ASN1EncodableVector subjectAlternativeNames = new ASN1EncodableVector();
        if (sanDnsNames != null) {
            for (final String dnsNameValue : sanDnsNames) {
                subjectAlternativeNames.add(
                        new GeneralName(GeneralName.dNSName, dnsNameValue)
                );
            }
        }

        return GeneralNames.getInstance(
                new DERSequence(subjectAlternativeNames)
        );
    }

    public static void main(String[] args) throws Exception {
        // create the keys
        KeyPair pair = Utils.generateRSAKeyPair();
        X509Certificate cert = null;
        // generate the certificate

        cert = selfSign(pair);

        // show some basic validation
        cert.checkValidity(new Date());

        cert.verify(cert.getPublicKey());

        System.out.println("valid certificate generated");

        X500NameBuilder issuerBuilder =
                new X500NameBuilder(X500Name.getDefaultStyle());
        issuerBuilder.addRDN(BCStyle.CN, "Test Certificate");
        X500NameBuilder subjectBuilder =
                new X500NameBuilder(X500Name.getDefaultStyle());
        subjectBuilder.addRDN(BCStyle.CN, "Test Certificate");

        cert = createX509V3Certificate(pair, 100, issuerBuilder, subjectBuilder,
                "text.com", "SHA256WithRSA", new HashSet<>(Arrays.asList("test1", "test2")));

        // show some basic validation
        cert.checkValidity(new Date());

        cert.verify(cert.getPublicKey());

        System.out.println("valid certificate generated");

        cert = createRootCACertificate(pair,subjectBuilder.build().toString(), 100);

        // show some basic validation
        cert.checkValidity(new Date());

        cert.verify(cert.getPublicKey());

        System.out.println("valid certificate generated");
    }
}
