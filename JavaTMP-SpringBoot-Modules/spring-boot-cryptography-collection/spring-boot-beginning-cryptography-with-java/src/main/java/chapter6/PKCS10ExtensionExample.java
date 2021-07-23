package chapter6;

import org.bouncycastle.asn1.DEROctetString;
import org.bouncycastle.asn1.DERSet;
import org.bouncycastle.asn1.pkcs.Attribute;
import org.bouncycastle.asn1.pkcs.PKCSObjectIdentifiers;
import org.bouncycastle.asn1.x500.X500Name;
import org.bouncycastle.asn1.x500.X500NameBuilder;
import org.bouncycastle.asn1.x500.style.BCStyle;
import org.bouncycastle.asn1.x509.*;
import org.bouncycastle.jce.PKCS10CertificationRequest;
import org.bouncycastle.jce.provider.BouncyCastleProvider;
import org.bouncycastle.operator.ContentSigner;
import org.bouncycastle.operator.OperatorCreationException;
import org.bouncycastle.operator.jcajce.JcaContentSignerBuilder;
import org.bouncycastle.operator.jcajce.JcaContentVerifierProviderBuilder;
import org.bouncycastle.pkcs.PKCS10CertificationRequestBuilder;
import org.bouncycastle.pkcs.jcajce.JcaPKCS10CertificationRequestBuilder;
import org.bouncycastle.util.io.pem.PemObject;
import org.bouncycastle.util.io.pem.PemWriter;
import org.springframework.util.Base64Utils;

import javax.security.auth.x500.X500Principal;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.StringWriter;
import java.nio.charset.StandardCharsets;
import java.security.KeyPair;
import java.security.KeyPairGenerator;
import java.security.NoSuchAlgorithmException;
import java.util.Vector;

/**
 * Generation of a basic PKCS #10 request with an extension.
 */
public class PKCS10ExtensionExample {

    private static String csr() throws NoSuchAlgorithmException, IOException, OperatorCreationException {
        KeyPairGenerator keyGen = KeyPairGenerator.getInstance("RSA");
        keyGen.initialize(2048);
        KeyPair keyPair = keyGen.generateKeyPair();
        X500Principal subject =
                new X500Principal(
                        "CN = edea87b4-034d-48dc-94dd-e7cdcfdde370/10562468, OU = fgdfgretertgdfg, O = VW, L = US");
        ContentSigner signer =
                new JcaContentSignerBuilder("SHA1withRSA")
                        .build(keyPair.getPrivate());
        PKCS10CertificationRequestBuilder builder =
                new JcaPKCS10CertificationRequestBuilder(
                        subject, keyPair.getPublic());
        org.bouncycastle.pkcs.PKCS10CertificationRequest csr = builder.build(signer);

        String type = "CERTIFICATE REQUEST";
        PemObject pem = new PemObject(type, csr.getEncoded());
        StringWriter str = new StringWriter();
        PemWriter pemWriter = new PemWriter(str);
        pemWriter.writeObject(pem);
        pemWriter.close();
        str.close();
        return Base64Utils.encodeToString(
                str.toString().getBytes(StandardCharsets.UTF_8));

    }

    public static org.bouncycastle.pkcs.PKCS10CertificationRequest generateRequestV2(KeyPair kp) throws Exception {
        String sigName = "SHA256withRSA";

        X500NameBuilder x500NameBld = new X500NameBuilder(BCStyle.INSTANCE);
//        x500NameBld.addRDN(BCStyle.C, "AU");
        x500NameBld.addRDN(BCStyle.CN, "Requested Test Certificate");
//        x500NameBld.addRDN(BCStyle.ST, "Victoria");
//        x500NameBld.addRDN(BCStyle.L, "Melbourne");
//        x500NameBld.addRDN(BCStyle.O, "The Legion of the Bouncy Castle");

        X500Name subject = x500NameBld.build();

        PKCS10CertificationRequestBuilder requestBuilder =
                new JcaPKCS10CertificationRequestBuilder(subject, kp.getPublic());

        ExtensionsGenerator extGen = new ExtensionsGenerator();
        extGen.addExtension(
                Extension.subjectAlternativeName,
                false,
                new GeneralNames(
                        new GeneralName(GeneralName.rfc822Name,
                                "feedback-crypto@bouncycastle.org")));

        requestBuilder.addAttribute(
                PKCSObjectIdentifiers.pkcs_9_at_extensionRequest,
                extGen.generate());

        org.bouncycastle.pkcs.PKCS10CertificationRequest p10 =
                requestBuilder.build(
                        new JcaContentSignerBuilder(sigName)
                                .setProvider(BouncyCastleProvider.PROVIDER_NAME)
                                .build(kp.getPrivate()));

        if (!p10.isSignatureValid(
                new JcaContentVerifierProviderBuilder()
                        .setProvider(BouncyCastleProvider.PROVIDER_NAME)
                        .build(kp.getPublic()))
        ) {
            System.out.println(sigName + ": Failed verify check.");
        } else {
            System.out.println(sigName + ": PKCS#10 request verified.");
        }
        return p10;
    }

    public static PKCS10CertificationRequest generateRequest(KeyPair pair)
            throws Exception {
        // create a SubjectAlternativeName extension value
        GeneralNames subjectAltNames = new GeneralNames(
                new GeneralName(GeneralName.rfc822Name, "test@test.test"));

        // create the extensions object and add it as an attribute
        Vector oids = new Vector();
        Vector values = new Vector();

        oids.add(X509Extensions.SubjectAlternativeName);
        values.add(new X509Extension(false, new DEROctetString(subjectAltNames)));

        X509Extensions extensions = new X509Extensions(oids, values);

        Attribute attribute = new Attribute(
                PKCSObjectIdentifiers.pkcs_9_at_extensionRequest,
                new DERSet(extensions));

        return new PKCS10CertificationRequest(
                "SHA256withRSA",
                new X500Principal("CN=Requested Test Certificate"),
                pair.getPublic(),
                new DERSet(attribute),
                pair.getPrivate());
    }

    public static void main(String[] args) throws Exception {
        // create the keys
        KeyPairGenerator kpGen = KeyPairGenerator.getInstance("RSA", "BC");

        kpGen.initialize(1024, Utils.createFixedRandom());

        KeyPair pair = kpGen.generateKeyPair();

        PKCS10CertificationRequest request = generateRequest(pair);

        PemWriter pemWrt = new PemWriter(new OutputStreamWriter(System.out));

        pemWrt.writeObject(
                new PemObject("CERTIFICATE REQUEST",
                        request.getEncoded()));
        pemWrt.close();

        org.bouncycastle.pkcs.PKCS10CertificationRequest request1 = generateRequestV2(pair);

        pemWrt = new PemWriter(new OutputStreamWriter(System.out));

        pemWrt.writeObject(
                new PemObject("CERTIFICATE REQUEST",
                        request1.getEncoded()));
        pemWrt.close();

        System.out.println("*******************************");
        System.out.println(csr());
    }
}
