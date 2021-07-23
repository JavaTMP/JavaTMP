package poc;

import org.bouncycastle.cms.CMSEnvelopedData;
import org.bouncycastle.cms.CMSEnvelopedDataGenerator;
import org.bouncycastle.cms.CMSProcessableByteArray;
import org.bouncycastle.jce.provider.BouncyCastleProvider;

import java.io.*;
import java.security.Security;
import java.security.cert.CertificateFactory;
import java.security.cert.X509Certificate;

/* Create Enveloped pkcs #7 signature using BC provider
			     M. Gallant  06/30/2003  */

public class EnvelopFile {

	public static void main(String args[]) {
		if (args.length < 2)
			usage();

		// Plug the Provider into the JCA/JCE
		Security.addProvider(new BouncyCastleProvider());

		FileInputStream freader = null;
		File f = null;
		X509Certificate cert = null;

		// ------ Get the content data from file -------------
		f = new File(args[0]);
		int sizecontent = ((int) f.length());
		byte[] contentbytes = new byte[sizecontent];

		try {
			freader = new FileInputStream(f);
			System.out.print("\nContent Bytes: " + freader.read(contentbytes, 0, sizecontent));
			freader.close();
		} catch (IOException ioe) {
			System.out.println(ioe.toString());
			return;
		}

		// ------ Get recipient certificate from file -------------

		try {
			InputStream inStream = new FileInputStream(args[1]);
			CertificateFactory cf = CertificateFactory.getInstance("X.509");
			cert = (X509Certificate) cf.generateCertificate(inStream);
			inStream.close();
		} catch (Exception exc) {
			System.out.println("Couldn't instantiate X.509 certificate");
			return;
		}

		// --- Use Bouncy Castle provider to create enveloped message ---
//		String algorithm = CMSEnvelopedDataGenerator.RC2_CBC;
//		int keysize = 128; // bits
		CMSEnvelopedDataGenerator fact = new CMSEnvelopedDataGenerator();
		// TODO: fact.addKeyTransRecipient(cert);
		CMSProcessableByteArray content = new CMSProcessableByteArray(contentbytes);

		try {

			// TODO: CMSEnvelopedData envdata = fact.generate(content, algorithm, keysize, "BC");
			CMSEnvelopedData envdata = fact.generate(null, null);
			byte[] enveloped = envdata.getEncoded();
			System.out.println("Got encoded pkcs7 bytes " + enveloped.length + " bytes");
			FileOutputStream envfos = new FileOutputStream("BCenveloped.p7");
			envfos.write(enveloped);
			envfos.close();
		} catch (Exception ex) {
			System.out.println("COuldn't generate enveloped signature");
		}
	}

	private static void usage() {
		System.out.println("Usage:\n java EnvelopFile  <contentfile> <certfile> ");
		System.exit(1);
	}
}
