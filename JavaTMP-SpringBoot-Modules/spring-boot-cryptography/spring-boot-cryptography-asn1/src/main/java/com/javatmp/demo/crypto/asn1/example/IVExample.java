package com.javatmp.demo.crypto.asn1.example;

import org.bouncycastle.asn1.ASN1InputStream;
import org.bouncycastle.asn1.util.ASN1Dump;
import org.bouncycastle.jce.provider.BouncyCastleProvider;

import javax.crypto.spec.IvParameterSpec;
import java.security.AlgorithmParameters;
import java.security.Security;

/**
 * Example showing IV encoding
 */
public class IVExample {
    static {
        // https://stackoverflow.com/questions/40975510/spring-boot-and-jca-providers
        if (Security.getProvider(BouncyCastleProvider.PROVIDER_NAME) == null) {
            Security.addProvider(new BouncyCastleProvider());
        }
    }
    public static void main(String[] args) throws Exception {
        // set up the parameters object
        AlgorithmParameters params = AlgorithmParameters.getInstance("AES", "BC");
        IvParameterSpec ivSpec = new IvParameterSpec(new byte[16]);

        params.init(ivSpec);

        // look at the ASN.1 encodng.
        ASN1InputStream aIn = new ASN1InputStream(params.getEncoded("ASN.1"));

        System.out.println(ASN1Dump.dumpAsString(aIn.readObject()));
    }
}
