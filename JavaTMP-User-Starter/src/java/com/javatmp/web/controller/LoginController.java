package com.javatmp.web.controller;

import com.javatmp.domain.User;
import com.javatmp.mvc.domain.ResponseMessage;
import com.javatmp.mvc.MvcHelper;
import com.javatmp.service.ServicesFactory;
import com.javatmp.util.Constants;
import com.javatmp.util.MD5Util;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.Locale;
import java.util.ResourceBundle;
import java.util.logging.Logger;
import javax.persistence.NoResultException;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/login")
public class LoginController extends HttpServlet {

    private final Logger logger = Logger.getLogger(getClass().getName());

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/pages/system/default-login-page.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        ServletContext context = request.getServletContext();
        ServicesFactory sf = (ServicesFactory) context.getAttribute(Constants.SERVICES_FACTORY_ATTRIBUTE_NAME);
        ResourceBundle labels = (ResourceBundle) session.getAttribute(Constants.LANGUAGE_ATTR_KEY);

        User user = new User();
        ResponseMessage responseMessage = new ResponseMessage();
        try {
            MvcHelper.populateBeanByRequestParameters(request, user);
            logger.info("Check User [" + MvcHelper.deepToString(user) + "]");
            User dbUser = sf.getUserService().readUserByUsername(user);

            if (dbUser.getPassword().equals(MD5Util.convertToMD5(user.getPassword()))) {
                // Authenticated user
                logger.info("User found [" + MvcHelper.deepToString(dbUser) + "]");

                Locale locale = Locale.forLanguageTag(dbUser.getLang());
                ResourceBundle bundle = ResourceBundle.getBundle(Constants.RESOURCE_BUNDLE_BASE_NAME, locale);
                session.setAttribute(Constants.LANGUAGE_ATTR_KEY, bundle);
                session.setAttribute("user", dbUser);

                sf.getUserService().updateLastUserAccess(dbUser);

                responseMessage.setOverAllStatus(true);
                responseMessage.setMessage(request.getContextPath() + "/");
            } else {
                // un authenticated user
                responseMessage.setOverAllStatus(false);
                responseMessage.setMessage(labels.getString("action.login.wrongUserOrPassword"));
            }
        } catch (NoResultException ex) {
            // un authenticated user
            responseMessage.setOverAllStatus(false);
            responseMessage.setMessage(labels.getString("action.login.wrongUserOrPassword"));
        } catch (IllegalAccessException | InvocationTargetException ex) {
            ex.printStackTrace();
            responseMessage.setOverAllStatus(false);
            responseMessage.setMessage(labels.getString("action.login.exception"));
            throw new ServletException(ex);
        }

        MvcHelper.sendMessageAsJson(response, responseMessage);
    }

}
