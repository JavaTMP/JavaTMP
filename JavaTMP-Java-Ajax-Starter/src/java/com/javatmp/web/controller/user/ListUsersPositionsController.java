package com.javatmp.web.controller.user;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.javatmp.mvc.ClassTypeAdapter;
import com.javatmp.mvc.ResponseMessage;
import com.javatmp.service.ServicesFactory;
import com.javatmp.service.UserService;
import com.javatmp.util.Constants;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/user/ListUsersPositionsController")
public class ListUsersPositionsController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        ResponseMessage responseMessage = new ResponseMessage();
        ServicesFactory sf = (ServicesFactory) request.getSession().getAttribute(Constants.SERVICES_FACTORY_ATTRIBUTE_NAME);
        UserService cs = sf.getUserService();

        List<String> positions = cs.listUsersPositions();

        responseMessage.setOverAllStatus(true);
        responseMessage.setData(positions);
        Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'")
                .registerTypeAdapter(Class.class, new ClassTypeAdapter())
                .create();
        String json = gson.toJson(responseMessage);
        System.out.println("response [" + json + "]");
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(json);

    }
}
