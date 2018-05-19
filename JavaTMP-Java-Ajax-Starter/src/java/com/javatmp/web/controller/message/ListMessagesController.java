package com.javatmp.web.controller.message;

import com.javatmp.domain.Message;
import com.javatmp.mvc.domain.table.DataTableRequest;
import com.javatmp.mvc.domain.table.DataTableResults;
import com.javatmp.mvc.MvcHelper;
import com.javatmp.mvc.domain.ResponseMessage;
import com.javatmp.service.MessageService;
import com.javatmp.service.ServicesFactory;
import com.javatmp.util.Constants;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/user/ListMessagesController")
public class ListMessagesController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        ResponseMessage responseMessage = new ResponseMessage();
        ServicesFactory sf = (ServicesFactory) request.getSession().getAttribute(Constants.SERVICES_FACTORY_ATTRIBUTE_NAME);
        MessageService cs = sf.getMessageService();

        DataTableRequest tableRequest = (DataTableRequest) MvcHelper.readObjectFromRequest(request, DataTableRequest.class);
        System.out.println("datatableRequest [" + MvcHelper.deepToString(tableRequest) + "]");

        DataTableResults<Message> dataTableResult = cs.listMessages(tableRequest);

        responseMessage.setOverAllStatus(true);
        responseMessage.setData(dataTableResult);

        MvcHelper.sendMessageAsJson(response, responseMessage);

    }
}
