package com.javatmp.web.filter;

import com.javatmp.domain.User;
import com.javatmp.mvc.MvcHelper;
import com.javatmp.service.ServicesFactory;
import com.javatmp.util.Constants;
import java.io.IOException;
import java.util.Collection;
import java.util.ResourceBundle;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ServiceFactoryInjector implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response,
            FilterChain chain) throws IOException, ServletException {
        long startTime = System.currentTimeMillis();

        String ipAddress = request.getRemoteAddr();

        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;

        HttpSession session = httpRequest.getSession();
        ServicesFactory sf;
        if ((sf = (ServicesFactory) session.getAttribute(Constants.SERVICES_FACTORY_ATTRIBUTE_NAME)) == null) {
            synchronized (session) {
                if ((sf = (ServicesFactory) session.getAttribute(Constants.SERVICES_FACTORY_ATTRIBUTE_NAME)) == null) {
                    sf = new ServicesFactory();
                    session.setAttribute(Constants.SERVICES_FACTORY_ATTRIBUTE_NAME, sf);
                    User fakeUserLogging = new User("user1", "user1");
                    User dbUser = sf.getUserService().readUserByUsername(fakeUserLogging);

                    // update locale for this user:
                    ResourceBundle finalBundle = (ResourceBundle) httpRequest.getSession().getAttribute(Constants.LANGUAGE_ATTR_KEY);
                    dbUser.setLang(finalBundle.getLocale().getLanguage());
                    System.out.println("db user is [" + MvcHelper.toString(dbUser) + "]");

                    // Auto Authenticated user for demo purposes.
                    session.setAttribute("user", dbUser);
                }
            }
        }
        System.out.println("ServiceFactory Instance [" + sf + "]");
        chain.doFilter(request, response);

    }

    @Override
    public void destroy() {
    }
}
