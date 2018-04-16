package com.javatmp.web.controller;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.javatmp.domain.User;
import com.javatmp.mvc.ClassTypeAdapter;
import com.javatmp.mvc.ResponseMessage;
import com.javatmp.service.DBFaker;
import com.javatmp.mvc.MvcHelper;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/login")
public class LoginController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Create a fake user
        User user = new User();
        user.setId(DBFaker.getNextCounter());
        user.setUserName("user" + user.getId());
        user.setPassword(user.getUserName());
        user.setFullName(user.getUserName() + " with password " + user.getPassword());
        user.setStatus((short) 1);
        user.setCreationDate(new Date());
        user.setEmail(user.getUserName() + "@javatmp.com");
        user.setMobile("00987654321000");
        user.setLang("en");
        user.setTheme("default");
        DBFaker.addUser(user);

        System.out.println("User created [" + MvcHelper.deepToString(user) + "]");
        request.setAttribute("fakeUser", user);
        request.getRequestDispatcher("/WEB-INF/pages/custom-pages/login-pages/default-login-page.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        User user = new User();
        ResponseMessage responseMessage = new ResponseMessage();
        try {
            MvcHelper.populateBeanByRequestParameter(request, user);
            System.out.println("Check User [" + MvcHelper.deepToString(user) + "]");

            if ("admin".equals(user.getUserName()) && "admin".equals(user.getPassword())) {
                // Authenticated user
                HttpSession session = request.getSession();
                session.setAttribute("authenticated", new Boolean(true));

                responseMessage.setOverAllStatus(true);
                responseMessage.setMessage(request.getContextPath());
            } else {
                // un authenticated user
                responseMessage.setOverAllStatus(false);
                responseMessage.setMessage("kindly Check your username and password");
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
        }
    }

}
