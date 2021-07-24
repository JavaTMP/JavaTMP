package chapter9;

import org.bouncycastle.cert.jcajce.JcaCertStoreBuilder;
import org.bouncycastle.cms.*;
import org.bouncycastle.cms.jcajce.JcaSimpleSignerInfoVerifierBuilder;
import org.bouncycastle.cms.jcajce.JcaX509CertSelectorConverter;
import org.bouncycastle.jce.provider.BouncyCastleProvider;

import java.security.cert.CertStore;
import java.security.cert.PKIXCertPathBuilderResult;
import java.security.cert.X509CertSelector;
import java.security.cert.X509Certificate;
import java.util.Iterator;

/**
 * Base class for signed examples.
 */
public class SignedDataProcessor {
    /**
     * Return a boolean array representing keyUsage with digitalSignature set.
     */
    static boolean[] getKeyUsageForSignature() {
        boolean[] val = new boolean[9];
        val[0] = true;
        return val;
    }

    /**
     * Take a CMS SignedData message and a trust anchor and determine if
     * the message is signed with a valid signature from a end entity
     * entity certificate recognized by the trust anchor rootCert.
     */
    public static boolean isValid(
            CMSSignedData signedData,
            X509Certificate rootCert)
            throws Exception {

        CertStore certsAndCRLs = new JcaCertStoreBuilder()
                .setProvider(BouncyCastleProvider.PROVIDER_NAME)
                .addCertificates(signedData.getCertificates())
                .build();

        SignerInformationStore signers = signedData.getSignerInfos();
        Iterator<SignerInformation> it = signers.getSigners().iterator();
        if (it.hasNext()) {
            SignerInformation signer = it.next();
            SignerId signerId = signer.getSID();

            X509CertSelector signerConstraints = new X509CertSelector();
            signerConstraints.setIssuer(signerId.getIssuer().getEncoded());
            signerConstraints.setSerialNumber(signerId.getSerialNumber());
            signerConstraints.setKeyUsage(getKeyUsageForSignature());

            // or simply by using :
            signerConstraints = new JcaX509CertSelectorConverter()
                    .getCertSelector(signer.getSID());

            PKIXCertPathBuilderResult result = Utils.buildPath(
                    rootCert, signerConstraints, certsAndCRLs);

            SignerInformationVerifier signerInformationVerifier =
                    new JcaSimpleSignerInfoVerifierBuilder()
                    .setProvider(BouncyCastleProvider.PROVIDER_NAME)
                    .build(
//                            (X509Certificate) result.getCertPath().getCertificates().get(0)
                            result.getPublicKey()
                    );

            return signer.verify(signerInformationVerifier);
        }

        return false;
    }
}
