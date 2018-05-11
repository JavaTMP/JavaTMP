package com.javatmp.web.controller.message;

import com.javatmp.web.controller.user.*;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.javatmp.domain.Message;
import com.javatmp.domain.User;
import com.javatmp.domain.table.DataTableRequest;
import com.javatmp.domain.table.DataTableResults;
import com.javatmp.mvc.ClassTypeAdapter;
import com.javatmp.mvc.DateTypeAdapter;
import com.javatmp.mvc.MvcHelper;
import com.javatmp.mvc.ResponseMessage;
import com.javatmp.service.MessageService;
import com.javatmp.service.ServicesFactory;
import com.javatmp.service.UserService;
import com.javatmp.util.Constants;
import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/user/ListMessagesController")
public class ListMessagesController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            Thread.sleep(1000);
        } catch (InterruptedException ex) {
            Logger.getLogger(ListMessagesController.class.getName()).log(Level.SEVERE, null, ex);
        }

        ResponseMessage responseMessage = new ResponseMessage();
        ServicesFactory sf = (ServicesFactory) request.getSession().getAttribute(Constants.SERVICES_FACTORY_ATTRIBUTE_NAME);
        MessageService cs = sf.getMessageService();

        System.out.println("Try to convert request to datatable request");

        DataTableRequest<Message> tableRequest = new DataTableRequest<>(request);

        System.out.println("datatableRequest [" + MvcHelper.deepToString(tableRequest) + "]");

        DataTableResults<Message> dataTableResult = cs.listMessages(tableRequest);

        List<Message> messages = dataTableResult.getListOfDataObjects();

        responseMessage.setOverAllStatus(true);
        responseMessage.setData(dataTableResult);
        Gson gson = new GsonBuilder()
                .registerTypeAdapter(Class.class, new ClassTypeAdapter())
                .registerTypeAdapter(Date.class, new DateTypeAdapter())
                .create();
        String json = gson.toJson(responseMessage);
//        System.out.println("response [" + json + "]");
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(json);

    }
}
