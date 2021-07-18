package com.javatmp.demo.crypto.tls.example;

import com.javatmp.demo.crypto.tls.Utils;

import javax.net.ssl.*;
import javax.security.auth.x500.X500Principal;
import java.io.FileInputStream;
import java.security.KeyStore;
import java.security.Principal;

/**
 * Basic SSL Server with client authentication and id checking.
 */
public class SSLServerWithClientAuthIdExample
    extends SSLServerExample
{
    /**
     * Check that the principal we have been given is for the end entity.
     */
    static boolean isEndEntity(
        SSLSession session)
        throws SSLPeerUnverifiedException
    {
        Principal id = session.getPeerPrincipal();
        if (id instanceof X500Principal)
        {
            X500Principal x500 = (X500Principal)id;

            return x500.getName().equals("CN=Test End Certificate");
        }

        return false;
    }

    /**
     * Create an SSL context with identity and trust stores in place
     */
    static SSLContext createSSLContext()
        throws Exception
    {
        // set up a key manager for our local credentials
		KeyManagerFactory mgrFact = KeyManagerFactory.getInstance("SunX509");
		KeyStore serverStore = KeyStore.getInstance("JKS");

		serverStore.load(new FileInputStream("server.jks"), Utils.SERVER_PASSWORD);

		mgrFact.init(serverStore, Utils.SERVER_PASSWORD);

		// set up a trust manager so we can recognize the server
		TrustManagerFactory trustFact = TrustManagerFactory.getInstance("SunX509");
		KeyStore            trustStore = KeyStore.getInstance("JKS");

		trustStore.load(new FileInputStream("trustStore.jks"), Utils.TRUST_STORE_PASSWORD);

		trustFact.init(trustStore);

		// create a context and set up a socket factory
		SSLContext sslContext = SSLContext.getInstance("TLS");

		sslContext.init(mgrFact.getKeyManagers(), trustFact.getTrustManagers(), null);

		return sslContext;
    }

    public static void main(
        String[] args)
        throws Exception
    {
		// create a context and set up a socket factory
		SSLContext sslContext = createSSLContext();

		// create the server socket
        SSLServerSocketFactory fact = sslContext.getServerSocketFactory();
        SSLServerSocket        sSock = (SSLServerSocket)fact.createServerSocket(Utils.PORT_NO);

        sSock.setNeedClientAuth(true);

        SSLSocket sslSock = (SSLSocket)sSock.accept();

        sslSock.startHandshake();

        // process if principal checks out
        if (isEndEntity(sslSock.getSession()))
        {
            doProtocol(sslSock);
        }
    }
}
