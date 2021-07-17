package com.javatmp.demo.crypto.asn1.example;

import com.javatmp.demo.crypto.asn1.Utils;
import org.bouncycastle.asn1.ASN1InputStream;
import org.bouncycastle.asn1.pkcs.PrivateKeyInfo;
import org.bouncycastle.asn1.util.ASN1Dump;

import javax.crypto.Cipher;
import javax.crypto.EncryptedPrivateKeyInfo;
import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.PBEKeySpec;
import java.nio.charset.StandardCharsets;
import java.security.*;
import java.security.spec.PKCS8EncodedKeySpec;

/**
 * Simple example showing how to use PBE and an EncryptedPrivateKeyInfo object.
 */
public class EncryptedPrivateKeyInfoExample {
    public static void main(String[] args) throws Exception {
        // generate a key pair
        KeyPairGenerator kpg = KeyPairGenerator.getInstance("RSA", "BC");
        kpg.initialize(128, Utils.createFixedRandom());

        KeyPair pair = kpg.generateKeyPair();

        // wrapping step
        char[] password = "hello".toCharArray();
        byte[] salt = "hello".getBytes(StandardCharsets.UTF_8);
        int iCount = 100;
        String pbeAlgorithm = "PBEWithSHAAnd3-KeyTripleDES-CBC";
        pbeAlgorithm = "PBEWithSHAAnd3KeyTripleDES";
        pbeAlgorithm = "PBEWITHMD5andDES";
        PBEKeySpec pbeKeySpec = new PBEKeySpec(password, salt, iCount);
        SecretKeyFactory secretKeyFact = SecretKeyFactory.getInstance(pbeAlgorithm, "BC");
        Cipher cipher = Cipher.getInstance(pbeAlgorithm, "BC");

        cipher.init(Cipher.WRAP_MODE, secretKeyFact.generateSecret(pbeKeySpec));

        byte[] wrappedKey = cipher.wrap(pair.getPrivate());

        AlgorithmParameters ap = cipher.getParameters();
        System.out.println("is algorithm parameters is null ? " + (ap == null));

        if(true) return;

        byte[] encodedAp = ap.getEncoded("ASN.1");
        System.out.println(ASN1Dump.dumpAsString(new ASN1InputStream(encodedAp).readObject()));

        // create carrier
        EncryptedPrivateKeyInfo pInfo = new EncryptedPrivateKeyInfo(cipher.getParameters(), wrappedKey);

        // unwrapping step - note we only use the password
        pbeKeySpec = new PBEKeySpec(password);

        cipher = Cipher.getInstance(pInfo.getAlgName(), "BC");

        cipher.init(Cipher.DECRYPT_MODE, secretKeyFact.generateSecret(pbeKeySpec), pInfo.getAlgParameters());

        PKCS8EncodedKeySpec pkcs8Spec = pInfo.getKeySpec(cipher);
        KeyFactory keyFact = KeyFactory.getInstance("RSA", "BC");
        PrivateKey privKey = keyFact.generatePrivate(pkcs8Spec);

        ASN1InputStream aIn = new ASN1InputStream(pkcs8Spec.getEncoded());
        PrivateKeyInfo info = PrivateKeyInfo.getInstance(aIn.readObject());

        System.out.println(ASN1Dump.dumpAsString(info));
        System.out.println(ASN1Dump.dumpAsString(info.getPrivateKey()));

        if (privKey.equals(pair.getPrivate())) {
            System.out.println("key recovery successful");
        } else {
            System.out.println("key recovery failed");
        }
    }
}
