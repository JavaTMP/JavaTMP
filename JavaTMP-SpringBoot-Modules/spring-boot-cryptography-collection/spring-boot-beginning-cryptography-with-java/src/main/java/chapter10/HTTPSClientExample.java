package chapter10;

import javax.net.ssl.*;
import javax.security.auth.x500.X500Principal;
import java.io.InputStream;
import java.net.URL;

/**
 * SSL Client with client side authentication.
 */
public class HTTPSClientExample extends SSLClientWithClientAuthTrustExample {
    public static void main(String[] args) throws Exception {
        SSLContext sslContext = createSSLContext();
        SSLSocketFactory fact = sslContext.getSocketFactory();

        // specify the URL and connection attributes
        URL url = new URL("https://" + Utils.HOST + ":" + Utils.PORT_NO);

        HttpsURLConnection connection = (HttpsURLConnection) url.openConnection();

        connection.setSSLSocketFactory(fact);
        connection.setHostnameVerifier(new Validator());

        connection.connect();

        // read the response
        InputStream in = connection.getInputStream();

        int ch = 0;
        while ((ch = in.read()) >= 0) {
            System.out.print((char) ch);
        }
    }

    /**
     * Verifier to check host has identified itself using "Test CA Certificate".
     */
    private static class Validator
            implements HostnameVerifier {
        public boolean verify(String hostName, SSLSession session) {
            try {
                X500Principal hostID = (X500Principal) session.getPeerPrincipal();

                return hostID.getName().equals("CN=Test CA Certificate");
            } catch (Exception e) {
                return false;
            }
        }
    }
}
