package com.javatmp.demo.crypto.keystore.example;

import org.bouncycastle.crypto.params.RSAKeyParameters;
import org.bouncycastle.crypto.util.PublicKeyFactory;
import org.bouncycastle.pkcs.PKCS10CertificationRequest;
import org.bouncycastle.util.io.pem.PemObject;
import org.bouncycastle.util.io.pem.PemReader;
import org.bouncycastle.util.io.pem.PemWriter;

import java.io.FileReader;
import java.io.IOException;
import java.io.StringWriter;

public class GetPublicKeyCSRfile {
    // https://stackoverflow.com/questions/14995711/getting-public-key-from-the-csr-file-using-bouncy-castle-in-java
    public static void main(String[] args) throws IOException {
        // Read the CSR
        String csrFilePath = "/path/to/your.csr";
        FileReader fileReader = new FileReader(csrFilePath);
        PemReader pemReader = new PemReader(fileReader);

        PKCS10CertificationRequest csr =
                new PKCS10CertificationRequest(pemReader.readPemObject().getContent());

        pemReader.close();
        fileReader.close();

// Write the Public Key as a PEM-File
        StringWriter output = new StringWriter();
        PemWriter pemWriter = new PemWriter(output);

        PemObject pkPemObject = new PemObject("PUBLIC KEY",
                csr.getSubjectPublicKeyInfo().getEncoded());

        pemWriter.writeObject(pkPemObject);
        pemWriter.close();

        System.out.println(output.getBuffer());

// Extract the Public Key as "RSAKeyParameters" so you can use for
// encryption/signing operations.
        RSAKeyParameters pubkey =
                (RSAKeyParameters) PublicKeyFactory.createKey(csr.getSubjectPublicKeyInfo());
        System.out.println("public key = " + pubkey.toString());
    }
}
