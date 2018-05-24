package com.javatmp.web.controller;

import com.javatmp.domain.User;
import com.javatmp.mvc.domain.ResponseMessage;
import com.javatmp.mvc.MvcHelper;
import com.javatmp.service.ServicesFactory;
import com.javatmp.util.Constants;
import com.javatmp.util.MD5Util;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.lang.reflect.InvocationTargetException;
import java.util.ResourceBundle;
import java.util.logging.Logger;
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

        ServicesFactory sf = (ServicesFactory) request.getSession().getAttribute(Constants.SERVICES_FACTORY_ATTRIBUTE_NAME);
        ResourceBundle bundle = (ResourceBundle) request.getSession().getAttribute(Constants.LANGUAGE_ATTR_KEY);
        logger.info("user bundle [" + bundle + "]");
        logger.info("user locale [" + bundle.getLocale() + "]");
        logger.info("user locale lang [" + bundle.getLocale().getLanguage() + "]");
        logger.info("user locale country [" + bundle.getLocale().getCountry() + "]");
        // Create a fake user
        request.getRequestDispatcher("/WEB-INF/pages/custom-pages/login-pages/default-login-page.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        ServicesFactory sf = (ServicesFactory) session.getAttribute(Constants.SERVICES_FACTORY_ATTRIBUTE_NAME);

        User user = new User();
        ResponseMessage responseMessage = new ResponseMessage();
        try {
            MvcHelper.populateBeanByRequestParameters(request, user);
            logger.info("Check User [" + MvcHelper.deepToString(user) + "]");
            logger.info("sf [" + sf + "]");
            User dbUser = sf.getUserService().readUserByUsername(user);

            if (dbUser != null && dbUser.getPassword().equals(MD5Util.convertToMD5(user.getPassword()))) {
                // Authenticated user
                session.setAttribute("user", dbUser);

                responseMessage.setOverAllStatus(true);
                responseMessage.setMessage(request.getContextPath() + "/");
            } else {
                // un authenticated user
                responseMessage.setOverAllStatus(false);
                responseMessage.setMessage("kindly Check your username and password");
            }

            MvcHelper.sendMessageAsJson(response, responseMessage);

        } catch (IllegalAccessException ex) {
            ex.printStackTrace();
            throw new ServletException(ex);
        } catch (InvocationTargetException ex) {
            ex.printStackTrace();
            throw new ServletException(ex);
        } catch (UnsupportedEncodingException ex) {
            ex.printStackTrace();
            throw new ServletException(ex);
        }
    }

}
