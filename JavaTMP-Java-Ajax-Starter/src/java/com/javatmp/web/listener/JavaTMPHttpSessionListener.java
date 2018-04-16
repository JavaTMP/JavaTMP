package com.javatmp.web.listener;

import com.javatmp.service.ServicesFactory;
import com.javatmp.util.Constants;
import java.util.Date;
import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

@WebListener
public class JavaTMPHttpSessionListener implements HttpSessionListener {

    @Override
    public void sessionCreated(HttpSessionEvent se) {
        System.out.println("*** Session Creation @ [" + new Date() + "]");
        se.getSession().setAttribute(Constants.SERVICES_FACTORY_ATTRIBUTE_NAME, new ServicesFactory());
    }

    @Override
    public void sessionDestroyed(HttpSessionEvent se) {
        System.out.println("*** Session Destroyed @ [" + new Date() + "]");
        ServicesFactory sf = (ServicesFactory) se.getSession().getAttribute(Constants.SERVICES_FACTORY_ATTRIBUTE_NAME);
        sf.destroy();
        se.getSession().setAttribute(Constants.SERVICES_FACTORY_ATTRIBUTE_NAME, null);
        se.getSession().removeAttribute(Constants.SERVICES_FACTORY_ATTRIBUTE_NAME);

    }
}
