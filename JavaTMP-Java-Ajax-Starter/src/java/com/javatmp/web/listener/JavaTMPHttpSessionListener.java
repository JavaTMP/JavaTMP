package com.javatmp.web.listener;

import com.javatmp.service.ServicesFactory;
import com.javatmp.util.CacheEntry;
import com.javatmp.util.Constants;
import java.util.Date;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

@WebListener
public class JavaTMPHttpSessionListener implements HttpSessionListener {

    @Override
    public void sessionCreated(HttpSessionEvent se) {
        System.out.println("*** Session Creation @ [" + new Date() + "]");
        System.out.println("created id [" + se.getSession().getId() + "]");
        Map<String, CacheEntry> cache = new ConcurrentHashMap<>();
        se.getSession().setAttribute(Constants.SERVICES_FACTORY_ATTRIBUTE_NAME, new ServicesFactory());
        se.getSession().setAttribute("cache", cache);
    }

    @Override
    public void sessionDestroyed(HttpSessionEvent se) {
        System.out.println("*** Session Destroyed @ [" + new Date() + "]");
        System.out.println("Destroyed id [" + se.getSession().getId() + "]");
        ServicesFactory sf = (ServicesFactory) se.getSession().getAttribute(Constants.SERVICES_FACTORY_ATTRIBUTE_NAME);
        sf.destroy();
        Map<String, CacheEntry> cache = (Map<String, CacheEntry>) se.getSession().getAttribute("cache");
        cache.clear();
        se.getSession().setAttribute(Constants.SERVICES_FACTORY_ATTRIBUTE_NAME, null);
        se.getSession().removeAttribute(Constants.SERVICES_FACTORY_ATTRIBUTE_NAME);
        se.getSession().setAttribute("cache", null);
        se.getSession().removeAttribute("cache");
    }
}
