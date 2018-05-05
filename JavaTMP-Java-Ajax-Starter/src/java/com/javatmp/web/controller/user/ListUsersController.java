package com.javatmp.web.controller.user;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.javatmp.domain.User;
import com.javatmp.mvc.ClassTypeAdapter;
import com.javatmp.mvc.MvcHelper;
import com.javatmp.mvc.Page;
import com.javatmp.mvc.ResponseMessage;
import com.javatmp.service.ServicesFactory;
import com.javatmp.service.UserService;
import com.javatmp.util.Constants;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/user/ListUsersController")
public class ListUsersController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        ResponseMessage responseMessage = new ResponseMessage();
        ServicesFactory sf = (ServicesFactory) request.getSession().getAttribute(Constants.SERVICES_FACTORY_ATTRIBUTE_NAME);
        UserService cs = sf.getUserService();

        Page<User> requestedPage = new Page<>(User.class);
//        try {

//            MvcHelper.populateBeanByRequestParameters(request, requestedPage);
        String startStr = request.getParameter("start");
        String lengthStr = request.getParameter("length");
        System.out.println("startStr [" + startStr + "], lengthStr [" + lengthStr + "]");
        if (lengthStr != null) {
            requestedPage.setNumOfRowsPerPage(Integer.parseInt(lengthStr));
        } else {
            requestedPage.setNumOfRowsPerPage(10);
        }
        if (startStr != null) {
            Integer start = Integer.parseInt(startStr);
            requestedPage.setRequestedPageNum((start * requestedPage.getNumOfRowsPerPage()) / requestedPage.getNumOfRowsPerPage() + 1);
        } else {
            requestedPage.setRequestedPageNum(1);
        }
        System.out.println("numOfRow [" + requestedPage.getNumOfRowsPerPage() + "], requestedPageNum[" + requestedPage.getRequestedPageNum() + "]");
        requestedPage = cs.listUsers(requestedPage);

        responseMessage.setOverAllStatus(true);
        responseMessage.setData(requestedPage);
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
