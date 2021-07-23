package chapter8;

import org.bouncycastle.asn1.x509.*;
import org.bouncycastle.jce.PKCS10CertificationRequest;
import org.bouncycastle.openssl.PEMParser;
import org.bouncycastle.x509.X509V3CertificateGenerator;
import org.bouncycastle.x509.extension.AuthorityKeyIdentifierStructure;

import javax.security.auth.x500.X500PrivateCredential;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStreamReader;
import java.math.BigInteger;
import java.security.cert.CertPath;
import java.security.cert.Certificate;
import java.security.cert.CertificateFactory;
import java.security.cert.X509Certificate;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

/**
 * Example showing the processing of a PEM encoded PKCS #10 encoded request
 * in a file called "pkcs10.req". A PKCS7 certificate path is generated as a
 * response in the file "pkcs7.pth".
 * <p>
 * The certificate and its chain will be valid for 50 seconds.
 */
public class CertReqSolution
{
    public static void main(String[] args)
        throws Exception
    {
        // create the CA certificates
        X500PrivateCredential rootCredential = Utils.createRootCredential();
        X500PrivateCredential interCredential = Utils.createIntermediateCredential(
                rootCredential.getPrivateKey(), rootCredential.getCertificate());

        // parse the request
        PEMParser   pRd = new PEMParser(
                                 new InputStreamReader(
                                         new FileInputStream("pkcs10.req")));

        PKCS10CertificationRequest request = (PKCS10CertificationRequest)pRd.readObject();

        // get our validation certificate
        X509Certificate caCert = interCredential.getCertificate();

        X509V3CertificateGenerator  certGen = new X509V3CertificateGenerator();

        certGen.setSerialNumber(BigInteger.valueOf(System.currentTimeMillis()));
        certGen.setIssuerDN(caCert.getSubjectX500Principal());
        certGen.setNotBefore(new Date(System.currentTimeMillis()));
        certGen.setNotAfter(new Date(System.currentTimeMillis() + 50000));
        certGen.setSubjectDN(X509Name.getInstance(request.getCertificationRequestInfo().getSubject()));
        certGen.setPublicKey(request.getPublicKey("BC"));
        certGen.setSignatureAlgorithm("SHA256WithRSAEncryption");

        // provide some basic extensions and mark the certificate as appropriate for signing and encipherment
        certGen.addExtension(X509Extensions.AuthorityKeyIdentifier, false, new AuthorityKeyIdentifierStructure(caCert));

        certGen.addExtension(X509Extensions.SubjectKeyIdentifier, false, new SubjectKeyIdentifier(request.getPublicKey("BC").getEncoded()));

        certGen.addExtension(X509Extensions.BasicConstraints, true, new BasicConstraints(false));

        certGen.addExtension(X509Extensions.KeyUsage, true, new KeyUsage(KeyUsage.digitalSignature | KeyUsage.keyEncipherment));

        // create the chain
        List chain = Arrays.asList(
                new Certificate[] {
                        certGen.generateX509Certificate(interCredential.getPrivateKey(), "BC"),
                        interCredential.getCertificate(),
                        rootCredential.getCertificate() });

        // create the CertPath
        CertificateFactory fact = CertificateFactory.getInstance("X.509", "BC");

        CertPath path = fact.generateCertPath(chain);

        // write it out
        FileOutputStream fOut = new FileOutputStream("pkcs7.pth");

        fOut.write(path.getEncoded("PKCS7"));

        fOut.close();
    }
}
