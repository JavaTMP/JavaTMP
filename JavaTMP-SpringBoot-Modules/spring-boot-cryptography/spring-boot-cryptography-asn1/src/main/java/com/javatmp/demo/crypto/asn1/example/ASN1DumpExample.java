package com.javatmp.demo.crypto.asn1.example;

import org.bouncycastle.asn1.ASN1InputStream;
import org.bouncycastle.asn1.util.ASN1Dump;
import org.bouncycastle.jce.provider.BouncyCastleProvider;

import java.security.Security;
import java.util.Date;


/**
 * Example for ASN1Dump using MyStructure.
 */
public class ASN1DumpExample {
    static {
        // https://stackoverflow.com/questions/40975510/spring-boot-and-jca-providers
        if(Security.getProvider(BouncyCastleProvider.PROVIDER_NAME) == null) {
            Security.addProvider(new BouncyCastleProvider());
        }
    }
    public static void main(String[] args) throws Exception {
        byte[] baseData = new byte[5];
        Date created = new Date(0); // 1/1/1970

        MyStructure structure = new MyStructure(0, created, baseData, "hello", "world");

        System.out.println(ASN1Dump.dumpAsString(structure));

        structure = new MyStructure(1, created, baseData, "hello", "world");
        System.out.println(ASN1Dump.dumpAsString(structure));
        ASN1InputStream aIn = new ASN1InputStream(structure.toASN1Object().getEncoded());
        System.out.println(ASN1Dump.dumpAsString(aIn.readObject()));
    }
}
