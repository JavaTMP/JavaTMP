package com.javatmp.web.controller;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.javatmp.domain.User;
import com.javatmp.mvc.ClassTypeAdapter;
import com.javatmp.mvc.ResponseMessage;
import com.javatmp.mvc.MvcHelper;
import com.javatmp.service.ServicesFactory;
import com.javatmp.util.Constants;
import com.javatmp.util.MD5Util;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.lang.reflect.InvocationTargetException;
import java.security.NoSuchAlgorithmException;
import java.util.ResourceBundle;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/updateLanguage")
public class UpdateLanguageController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            ServicesFactory sf = (ServicesFactory) request.getSession().getAttribute(Constants.SERVICES_FACTORY_ATTRIBUTE_NAME);
            ResourceBundle bundle = (ResourceBundle) request.getSession().getAttribute(Constants.LANGUAGE_ATTR_KEY);
            System.out.println("user bundle [" + bundle + "]");
            System.out.println("user locale [" + bundle.getLocale() + "]");
            System.out.println("user locale lang [" + bundle.getLocale().getLanguage() + "]");
            System.out.println("user locale country [" + bundle.getLocale().getCountry() + "]");
            // Create a fake user
            User user = new User();
            MvcHelper.populateBeanByRequestParameters(request, user);
            System.out.println("User created [" + MvcHelper.deepToString(user) + "]");

            // get current login user in session
            User loginUser = (User) request.getSession().getAttribute("user");
            loginUser.setLang(user.getLang());

            response.sendRedirect(request.getContextPath() + "/");

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
            System.out.println("Check User [" + MvcHelper.deepToString(user) + "]");
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
            System.out.println("loginController response [" + json + "]");
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
