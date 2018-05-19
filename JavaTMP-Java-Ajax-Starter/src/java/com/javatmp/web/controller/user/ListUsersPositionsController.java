package com.javatmp.web.controller.user;

import com.javatmp.mvc.MvcHelper;
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

        MvcHelper.sendMessageAsJson(response, responseMessage);

    }
}
