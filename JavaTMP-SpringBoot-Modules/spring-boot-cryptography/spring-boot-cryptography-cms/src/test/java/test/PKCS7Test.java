package test;

import org.bouncycastle.util.encoders.Base64;
import org.junit.jupiter.api.Test;
import sun.security.pkcs.ContentInfo;
import sun.security.pkcs.PKCS7;
import sun.security.pkcs.SignerInfo;
import sun.security.util.DerOutputStream;
import sun.security.util.DerValue;
import sun.security.x509.AlgorithmId;
import sun.security.x509.X500Name;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.math.BigInteger;
import java.security.KeyStore;
import java.security.PrivateKey;
import java.security.Signature;
import java.security.cert.X509Certificate;
import java.util.Enumeration;

@SuppressWarnings("restriction")
public class PKCS7Test {

	static final String STORENAME = "keystore.p12";
	static final String STOREPASS = "Qwer12345";

	@Test
	public void shouldGenPKCS7() throws Exception {

		String KEYSTORE_PATH = new File("./" + STORENAME).getCanonicalPath();

		// First load the keystore object by providing the p12 file path
		KeyStore clientStore = KeyStore.getInstance("PKCS12");
		// replace testPass with the p12 password/pin
		clientStore.load(new FileInputStream(KEYSTORE_PATH), STOREPASS.toCharArray());

		Enumeration<String> aliases = clientStore.aliases();
		String aliaz = "";
		while (aliases.hasMoreElements()) {
			aliaz = aliases.nextElement();
			if (clientStore.isKeyEntry(aliaz)) {
				break;
			}
		}

		X509Certificate c = (X509Certificate) clientStore.getCertificate(aliaz);

		// Data to sign
		byte[] dataToSign = "SigmaWorld".getBytes();
		// compute signature:
		Signature signature = Signature.getInstance("Sha1WithRSA");
		signature.initSign((PrivateKey) clientStore.getKey(aliaz, STOREPASS.toCharArray()));
		signature.update(dataToSign);
		byte[] signedData = signature.sign();

		// load X500Name
		X500Name xName = X500Name.asX500Name(c.getSubjectX500Principal());
		// load serial number
		BigInteger serial = c.getSerialNumber();
		// laod digest algorithm
		AlgorithmId digestAlgorithmId = new AlgorithmId(AlgorithmId.SHA_oid);
		// load signing algorithm
		AlgorithmId signAlgorithmId = new AlgorithmId(AlgorithmId.RSAEncryption_oid);

		// Create SignerInfo:
		SignerInfo sInfo = new SignerInfo(xName, serial, digestAlgorithmId, signAlgorithmId, signedData);
		// Create ContentInfo:
		ContentInfo cInfo = new ContentInfo(ContentInfo.DIGESTED_DATA_OID,
				new DerValue(DerValue.tag_OctetString, dataToSign));
		// Create PKCS7 Signed data
		PKCS7 p7 = new PKCS7(new AlgorithmId[] { digestAlgorithmId }, cInfo, new X509Certificate[] { c },
				new SignerInfo[] { sInfo });
		// Write PKCS7 to bYteArray
		ByteArrayOutputStream bOut = new DerOutputStream();
		p7.encodeSignedData(bOut);

		byte[] encodedPKCS7 = bOut.toByteArray();

		System.out.println(new String(Base64.encode(encodedPKCS7)));

	}
}
