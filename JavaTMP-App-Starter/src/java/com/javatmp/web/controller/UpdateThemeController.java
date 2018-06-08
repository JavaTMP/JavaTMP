package com.javatmp.web.controller;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.javatmp.domain.User;
import com.javatmp.mvc.adapter.ClassTypeAdapter;
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

@WebServlet("/updateTheme")
public class UpdateThemeController extends HttpServlet {

    private final Logger logger = Logger.getLogger(getClass().getName());

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            ServicesFactory sf = (ServicesFactory) request.getSession().getAttribute(Constants.SERVICES_FACTORY_ATTRIBUTE_NAME);
            ResourceBundle bundle = (ResourceBundle) request.getSession().getAttribute(Constants.LANGUAGE_ATTR_KEY);
            logger.info("user bundle [" + bundle + "]");
            logger.info("user locale [" + bundle.getLocale() + "]");
            logger.info("user locale lang [" + bundle.getLocale().getLanguage() + "]");
            logger.info("user locale country [" + bundle.getLocale().getCountry() + "]");
            // Create a fake user
            User user = new User();
            ResponseMessage responseMessage = new ResponseMessage();

            MvcHelper.populateBeanByRequestParameters(request, user);
            logger.info("Theme requested [" + MvcHelper.deepToString(user) + "]");

            // get current login user in session
            User loginUser = (User) request.getSession().getAttribute("user");
            logger.info("Logged In User [" + MvcHelper.deepToString(user) + "]");
            loginUser.setTheme(user.getTheme());
            logger.info("Logged In User [" + MvcHelper.deepToString(user) + "]");
            responseMessage.setOverAllStatus(true);
            responseMessage.setRedirect(true);
            responseMessage.setRedirectURL(request.getContextPath() + "/");
            responseMessage.setMessage("Theme Updated successfully");

            MvcHelper.sendMessageAsJson(response, responseMessage);

        } catch (IllegalAccessException ex) {
            ex.printStackTrace();
            throw new ServletException(ex);
        } catch (InvocationTargetException ex) {
            ex.printStackTrace();
            throw new ServletException(ex);
        }

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
            User dbUser = sf.getUserService().readUserByUsername(user);

            if (dbUser != null && dbUser.getPassword().equals(MD5Util.convertToMD5(user.getPassword()))) {
                // Authenticated user
                session.setAttribute("user", dbUser);

                responseMessage.setOverAllStatus(true);
                responseMessage.setMessage(request.getContextPath() + "/");
            } else {
                // un authenticated user
                responseMessage.setOverAllStatus(false);
                responseMessage.setMessage("kindly Check your username and password or Refresh current page");
            }

            Gson gson = new GsonBuilder().serializeNulls()
                    .registerTypeAdapter(Class.class, new ClassTypeAdapter())
                    .create();
            String json = gson.toJson(responseMessage);
            logger.info("loginController response [" + json + "]");
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(json);
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
