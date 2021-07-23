package poc;

import org.apache.commons.io.IOUtils;
import org.apache.commons.lang.SystemUtils;
import org.bouncycastle.cms.*;
import org.bouncycastle.jce.provider.BouncyCastleProvider;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.security.GeneralSecurityException;
import java.security.KeyStore;
import java.security.PrivateKey;
import java.security.Security;
import java.security.cert.CertStore;
import java.security.cert.Certificate;
import java.security.cert.CollectionCertStoreParameters;
import java.security.cert.X509Certificate;
import java.util.ArrayList;

public class MyKeystoreProvider {

	private static final Logger logger = LoggerFactory.getLogger(MyKeystoreProvider.class);

	private String alias = "";
	private String password = "";
	private PrivateKey privateKey = null;

	static {
		// Add security provider
		if (Security.getProvider(BouncyCastleProvider.PROVIDER_NAME) == null) {
			Security.addProvider(new BouncyCastleProvider());
		}
	}

	public KeyStore getKeystore(char[] password) throws GeneralSecurityException, IOException {

		KeyStore keystore = KeyStore.getInstance("jks");
		InputStream input = new FileInputStream(SystemUtils.USER_HOME + File.separator + ".keystore");

		try {
			keystore.load(input, password);
		} catch (IOException e) {
		} finally {
			IOUtils.closeQuietly(input);
		}

		return keystore;
	}

	public byte[] sign(byte[] data) throws GeneralSecurityException, CMSException, IOException {

		CMSSignedDataGenerator generator = new CMSSignedDataGenerator();
		// generator.addSigner(getPrivateKey(), (X509Certificate) getCertificate(), CMSSignedDataGenerator.DIGEST_SHA1);
		generator.addSigners(null);
		// generator.addCertificatesAndCRLs(getCertStore());
		generator.addCertificates(null);
		CMSProcessable content = new CMSProcessableByteArray(data);
		// CMSSignedData signedData = generator.generate(content, true, "BC");
		CMSSignedData signedData = generator.generate(null, true);

		return signedData.getEncoded();
	}

	private X509Certificate getCertificate() {
		return null;
	}

	private CertStore getCertStore() throws Exception {

		ArrayList<Certificate> list = new ArrayList<Certificate>();
		Certificate[] certificates = getKeystore(password.toCharArray()).getCertificateChain(this.alias);
		for (int i = 0, length = certificates == null ? 0 : certificates.length; i < length; i++) {
			list.add(certificates[i]);
		}

		return CertStore.getInstance("Collection", new CollectionCertStoreParameters(list), "BC");
	}

	private PrivateKey getPrivateKey() throws Exception {

		if (this.privateKey == null) {
			this.privateKey = initalizePrivateKey();
		}

		return this.privateKey;
	}

	private PrivateKey initalizePrivateKey() throws Exception {

		KeyStore keystore = new MyKeystoreProvider().getKeystore(password.toCharArray());
		return (PrivateKey) keystore.getKey(this.alias, password.toCharArray());

	}
}
