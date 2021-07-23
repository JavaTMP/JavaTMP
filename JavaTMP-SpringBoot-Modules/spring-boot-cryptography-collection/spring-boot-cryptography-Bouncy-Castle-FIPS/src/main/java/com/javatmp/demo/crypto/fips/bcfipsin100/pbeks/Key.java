package com.javatmp.demo.crypto.fips.bcfipsin100.pbeks;

import com.javatmp.demo.crypto.fips.bcfipsin100.base.Rsa;
import com.javatmp.demo.crypto.fips.bcfipsin100.base.Setup;
import org.bouncycastle.operator.OperatorCreationException;
import org.bouncycastle.pkcs.PKCSException;

import java.io.IOException;
import java.security.*;
import java.security.spec.PKCS8EncodedKeySpec;
import java.security.spec.X509EncodedKeySpec;

public class Key
{
    public static byte[] encodePublic(PublicKey publicKey)
    {
        return publicKey.getEncoded();
    }

    public static PublicKey producePublicKey(byte[] encoding)
        throws GeneralSecurityException
    {
        KeyFactory keyFact = KeyFactory.getInstance("RSA", "BCFIPS");

        return keyFact.generatePublic(new X509EncodedKeySpec(encoding));
    }

    public static byte[] encodePrivate(PrivateKey privateKey)
    {
        return privateKey.getEncoded();
    }

    public static PrivateKey producePrivateKey(byte[] encoding)
        throws GeneralSecurityException
    {
        KeyFactory keyFact = KeyFactory.getInstance("RSA", "BCFIPS");

        return keyFact.generatePrivate(new PKCS8EncodedKeySpec(encoding));
    }

    public static void main(String[] args)
        throws GeneralSecurityException, IOException, OperatorCreationException, PKCSException
    {
        Setup.installProvider();

        KeyPair keyPair = Rsa.generateKeyPair();

        System.err.println(keyPair.getPublic().equals(producePublicKey(encodePublic(keyPair.getPublic()))));
        System.err.println(keyPair.getPrivate().equals(producePrivateKey(encodePrivate(keyPair.getPrivate()))));
    }
}
