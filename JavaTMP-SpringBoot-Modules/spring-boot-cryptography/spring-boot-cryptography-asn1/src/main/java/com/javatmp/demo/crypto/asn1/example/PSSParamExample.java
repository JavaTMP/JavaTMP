package com.javatmp.demo.crypto.asn1.example;

import org.bouncycastle.asn1.ASN1InputStream;
import org.bouncycastle.asn1.util.ASN1Dump;
import org.bouncycastle.jce.provider.BouncyCastleProvider;

import java.security.AlgorithmParameters;
import java.security.Security;
import java.security.Signature;
import java.security.spec.PSSParameterSpec;

/**
 * Example showing PSS parameter recovery and encoding
 */
public class PSSParamExample {
    static {
        // https://stackoverflow.com/questions/40975510/spring-boot-and-jca-providers
        if(Security.getProvider(BouncyCastleProvider.PROVIDER_NAME) == null) {
            Security.addProvider(new BouncyCastleProvider());
        }
    }
    public static void main(String[] args) throws Exception {
        Signature signature = Signature.getInstance("SHA1withRSAandMGF1", "BC");

        // set the default parameters
        signature.setParameter(PSSParameterSpec.DEFAULT);

        // get the default parameters
        AlgorithmParameters params = signature.getParameters();

        // look at the ASN.1 encodng.
        ASN1InputStream aIn = new ASN1InputStream(params.getEncoded("ASN.1"));

        System.out.println(ASN1Dump.dumpAsString(aIn.readObject()));
    }
}
