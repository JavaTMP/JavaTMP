
package com.briansdevblog.accounts;

import java.net.MalformedURLException;
import java.net.URL;
import java.util.logging.Logger;
import javax.xml.namespace.QName;
import javax.xml.ws.Service;
import javax.xml.ws.WebEndpoint;
import javax.xml.ws.WebServiceClient;
import javax.xml.ws.WebServiceFeature;


/**
 * This class was generated by the JAX-WS RI.
 * JAX-WS RI 2.1.4-b01-
 * Generated source version: 2.1
 * 
 */
@WebServiceClient(name = "AccountService", targetNamespace = "http://www.briansdevblog.com/Accounts/", wsdlLocation = "classpath:META-INF\\wsdl\\Accounts.wsdl")
public class AccountService_Service
    extends Service
{

    private final static URL ACCOUNTSERVICE_WSDL_LOCATION;
    private final static Logger logger = Logger.getLogger(com.briansdevblog.accounts.AccountService_Service.class.getName());

    static {
        URL url = null;
        try {
            URL baseUrl;
            baseUrl = com.briansdevblog.accounts.AccountService_Service.class.getResource(".");
            url = new URL(baseUrl, "classpath:META-INF\\wsdl\\Accounts.wsdl");
        } catch (MalformedURLException e) {
            logger.warning("Failed to create URL for the wsdl Location: 'classpath:META-INF\\wsdl\\Accounts.wsdl', retrying as a local file");
            logger.warning(e.getMessage());
        }
        ACCOUNTSERVICE_WSDL_LOCATION = url;
    }

    public AccountService_Service(URL wsdlLocation, QName serviceName) {
        super(wsdlLocation, serviceName);
    }

    public AccountService_Service() {
        super(ACCOUNTSERVICE_WSDL_LOCATION, new QName("http://www.briansdevblog.com/Accounts/", "AccountService"));
    }

    /**
     * 
     * @return
     *     returns AccountService
     */
    @WebEndpoint(name = "AccountsPort")
    public AccountService getAccountsPort() {
        return super.getPort(new QName("http://www.briansdevblog.com/Accounts/", "AccountsPort"), AccountService.class);
    }

    /**
     * 
     * @param features
     *     A list of {@link javax.xml.ws.WebServiceFeature} to configure on the proxy.  Supported features not in the <code>features</code> parameter will have their default values.
     * @return
     *     returns AccountService
     */
    @WebEndpoint(name = "AccountsPort")
    public AccountService getAccountsPort(WebServiceFeature... features) {
        return super.getPort(new QName("http://www.briansdevblog.com/Accounts/", "AccountsPort"), AccountService.class, features);
    }

}