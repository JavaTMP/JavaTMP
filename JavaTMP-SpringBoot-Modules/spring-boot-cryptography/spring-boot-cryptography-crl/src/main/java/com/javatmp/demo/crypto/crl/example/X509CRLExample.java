package com.javatmp.demo.crypto.crl.example;

import com.javatmp.demo.crypto.crl.Utils;
import org.bouncycastle.asn1.ASN1Enumerated;
import org.bouncycastle.asn1.x509.CRLNumber;
import org.bouncycastle.asn1.x509.CRLReason;
import org.bouncycastle.asn1.x509.Extension;
import org.bouncycastle.cert.X509v2CRLBuilder;
import org.bouncycastle.cert.jcajce.JcaX509CRLConverter;
import org.bouncycastle.cert.jcajce.JcaX509ExtensionUtils;
import org.bouncycastle.cert.jcajce.JcaX509v2CRLBuilder;
import org.bouncycastle.jce.provider.BouncyCastleProvider;
import org.bouncycastle.operator.ContentSigner;
import org.bouncycastle.operator.jcajce.JcaContentSignerBuilder;

import java.math.BigInteger;
import java.security.KeyPair;
import java.security.PrivateKey;
import java.security.Security;
import java.security.cert.X509CRL;
import java.security.cert.X509CRLEntry;
import java.security.cert.X509Certificate;
import java.util.Date;

/**
 * Basic Example of generating and using a CRL.
 */
public class X509CRLExample {
    static {
        // https://stackoverflow.com/questions/40975510/spring-boot-and-jca-providers
        if (Security.getProvider(BouncyCastleProvider.PROVIDER_NAME) == null) {
            Security.addProvider(new BouncyCastleProvider());
        }
    }

    public static X509CRL createCRL(X509Certificate caCert,
                                    PrivateKey caKey,
                                    BigInteger revokedSerialNumber)
            throws Exception {
        Date now = new Date();
//        X509v2CRLBuilder crlGen = new X509v2CRLBuilder(
//                new X500Name(caCert.getSubjectX500Principal().getName()),
//                now
//        );
        X509v2CRLBuilder crlGen = new JcaX509v2CRLBuilder(
                caCert.getSubjectX500Principal(),
                now
        );

        crlGen.setNextUpdate(new Date(now.getTime() + 100000));

        ContentSigner signer =
                new JcaContentSignerBuilder("SHA256WithRSAEncryption")
                        .build(caKey);

        crlGen.addCRLEntry(revokedSerialNumber, now, CRLReason.privilegeWithdrawn);
        JcaX509ExtensionUtils utils = new JcaX509ExtensionUtils();
        crlGen.addExtension(Extension.authorityKeyIdentifier, false,
                utils.createAuthorityKeyIdentifier(caCert));
        crlGen.addExtension(Extension.cRLNumber, false, new CRLNumber(BigInteger.valueOf(1)));

        return new JcaX509CRLConverter().getCRL(crlGen.build(signer));
    }

    public static void main(String[] args)
            throws Exception {
        // create CA keys and certificate
        KeyPair caPair = Utils.generateRSAKeyPair();
        X509Certificate caCert = Utils.generateRootCert(caPair);
        BigInteger revokedSerialNumber = BigInteger.valueOf(2);

        // create a CRL revoking certificate number 2
        X509CRL crl = createCRL(caCert, caPair.getPrivate(), revokedSerialNumber);

        // verify the CRL
        crl.verify(caCert.getPublicKey(), "BC");

        // check if the CRL revokes certificate number 2
        X509CRLEntry entry = crl.getRevokedCertificate(revokedSerialNumber);
        System.out.println("Revocation Details:");
        System.out.println("  Certificate number: " + entry.getSerialNumber());
        System.out.println("  Issuer            : " + crl.getIssuerX500Principal());

        if (entry.hasExtensions()) {
            byte[] ext = entry.getExtensionValue(Extension.reasonCode.getId());

            if (ext != null) {
                ASN1Enumerated reasonCode = (ASN1Enumerated) JcaX509ExtensionUtils.parseExtensionValue(ext);

                System.out.println("  Reason Code       : " + reasonCode.getValue());
            }
        }
    }
}
