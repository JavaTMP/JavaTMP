package com.javatmp.web.controller.user;

import com.javatmp.domain.Country;
import com.javatmp.domain.Language;
import com.javatmp.domain.Theme;
import com.javatmp.domain.Timezone;
import com.javatmp.domain.User;
import com.javatmp.mvc.MvcHelper;
import com.javatmp.service.ServicesFactory;
import com.javatmp.util.Constants;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletContext;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/user/GetUsersLookupPopupPage")
public class GetUsersLookupPopupPage extends HttpServlet {

    private final Logger logger = Logger.getLogger(getClass().getName());

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String requestPage = "/WEB-INF/pages/user/usersLookupPopup.jsp";
        request.getRequestDispatcher(requestPage).forward(request, response);
    }
}
