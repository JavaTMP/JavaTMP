package com.javatmp.web.controller.user;

import com.javatmp.domain.User;
import com.javatmp.domain.table.DataTableRequest;
import com.javatmp.domain.table.DataTableResults;
import com.javatmp.mvc.MvcHelper;
import com.javatmp.mvc.ResponseMessage;
import com.javatmp.service.ServicesFactory;
import com.javatmp.service.UserService;
import com.javatmp.util.Constants;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/user/ListAllUsersController")
public class ListAllUsersController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        ResponseMessage responseMessage = new ResponseMessage();
        ServicesFactory sf = (ServicesFactory) request.getSession().getAttribute(Constants.SERVICES_FACTORY_ATTRIBUTE_NAME);
        UserService cs = sf.getUserService();

        DataTableRequest tableRequest = (DataTableRequest) MvcHelper.readObjectFromRequest(request, DataTableRequest.class);
        System.out.println("datatableRequest [" + MvcHelper.deepToString(tableRequest) + "]");

        DataTableResults<User> dataTableResult = cs.listAllUsers(tableRequest);

        responseMessage.setOverAllStatus(true);
        responseMessage.setData(dataTableResult);
        MvcHelper.sendMessageAsJson(response, responseMessage);

    }
}
