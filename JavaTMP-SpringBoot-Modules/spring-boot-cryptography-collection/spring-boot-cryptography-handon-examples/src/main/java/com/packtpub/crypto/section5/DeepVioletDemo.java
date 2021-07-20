package com.packtpub.crypto.section5;

import com.mps.deepviolet.api.DVException;
import com.mps.deepviolet.api.DVFactory;
import com.mps.deepviolet.api.IDVCipherSuite;
import com.mps.deepviolet.api.IDVEng;
import com.mps.deepviolet.api.IDVSession;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.HashMap;

/**
 * Code copied from https://github.com/spoofzu/DeepViolet/blob/master/src/main/java/com/mps/deepviolet/api/samples/PrintServerCiphersuites.java
 * @author Erik Costlow
 */
public class DeepVioletDemo {

    public static void main(String[] args) throws MalformedURLException, DVException {
        URL url = new URL("https://www.wikipedia.org/");
        IDVSession session = DVFactory.initializeSession(url);
        IDVEng eng = DVFactory.getDVEng(session);
        IDVCipherSuite[] ciphers = eng.getCipherSuites();
        HashMap<IDVCipherSuite, IDVCipherSuite> tmap = new HashMap<IDVCipherSuite, IDVCipherSuite>();

        // Print out a list of ciphersuites supported by the server.
        System.out.println("Ciphers supported by host " + url.toString());
        for (IDVCipherSuite cipher : ciphers) {
            // If cipher's in the map then skip since we already printed it.  We only want a unique
            // list of ciphers.  API will return ciphers enumerated by handshake protocol (TLS1.0,TLS1.1,etc)
            // Handy if you need to know cipher suite support by protocol.
            if (!tmap.containsKey(cipher)) {
                StringBuffer buff = new StringBuffer();
                buff.append(cipher.getSuiteName());
                buff.append('(');
                buff.append(cipher.getStrengthEvaluation());
                buff.append(',');
                buff.append(cipher.getHandshakeProtocol());
                buff.append(')');
                System.out.println(buff.toString());
                tmap.put(cipher, cipher);
            }
        }

        System.out.flush();
    }
}
