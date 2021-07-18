package guid.examples;

import javax.xml.bind.DatatypeConverter;
import java.io.*;
import java.security.KeyStore;
import java.security.KeyStoreException;
import java.security.NoSuchAlgorithmException;
import java.security.cert.Certificate;
import java.security.cert.CertificateException;
import java.security.cert.CertificateFactory;
import java.security.cert.X509Certificate;
import java.util.Base64;


public class Main {

    public static void main(String[] args) throws KeyStoreException, NoSuchAlgorithmException, CertificateException, IOException {
        //Security.addProvider(new BouncyCastleProvider());
        //System.out.println(Constants.publicKey);
        addKeyInTrustStore(CertificateConstants.publicKey);
    }

    public static void addKeyInTrustStore(String certificate)
            throws KeyStoreException, NoSuchAlgorithmException, CertificateException, IOException {
        //FileInputStream is = new FileInputStream("configuration/ssl/ctl.jks");
       // KeyStore keystore = KeyStore.getInstance(KeyStore.getDefaultType());
        KeyStore keystore = readKeyStore();
        //InputStream pemStream = new ByteArrayInputStream(certificate.getBytes());
        byte[] der;
        if (certificate.contains("-----BEGIN CERTIFICATE-----")) {
            der = Base64.getDecoder().decode(certificate.replaceAll("-----(BEGIN|END) CERTIFICATE-----\n{0,1}","").replaceAll("\n","").trim());
        } else {
            der = Base64.getDecoder().decode(certificate);
        }

        //keystore.load(is, "opendaylight".toCharArray());
        InputStream bis = new ByteArrayInputStream(der);
        CertificateFactory cf = CertificateFactory.getInstance("X.509");
        while (bis.available() > 0) {
            Certificate cert = cf.generateCertificate(bis);
            // We overwrite the alias if it already exist
            System.out.println("Adding into keystore");
            keystore.setCertificateEntry("abcd", cert);
        }
        bis.close();
        //is.close();
    }

    public static KeyStore readKeyStore() throws KeyStoreException,
                                         NoSuchAlgorithmException,
                                         CertificateException,
                                         IOException {
        KeyStore keystore = KeyStore.getInstance(KeyStore.getDefaultType());
        keystore.load(null, "opendaylight".toCharArray());
        File keystoreFile = new File("configuration/ssl/ctl.jks");
        // Should not be needed, just in case
        if (!keystoreFile.exists()) {
            keystoreFile.createNewFile();
        }
        FileOutputStream fileOutputStream = new FileOutputStream(keystoreFile);
        keystore.store(fileOutputStream, "opendaylight".toCharArray());
        return keystore;
    }

    private static byte[] parseDERFromPEM(byte[] pem, String beginDelimiter, String endDelimiter) {
        String data = new String(pem);
        String[] tokens = data.split(beginDelimiter);
        tokens = tokens[1].split(endDelimiter);
        return DatatypeConverter.parseBase64Binary(tokens[0]);
    }

    protected static X509Certificate generateCertificateFromDER(byte[] certBytes) throws CertificateException {
        CertificateFactory factory = CertificateFactory.getInstance("X.509");
        return (X509Certificate)factory.generateCertificate(new ByteArrayInputStream(certBytes));
    }
}
