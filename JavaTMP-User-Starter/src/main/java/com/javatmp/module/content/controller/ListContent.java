package com.javatmp.module.content.controller;

import com.javatmp.module.content.service.ContentService;
import com.javatmp.module.content.entity.Content;
import com.javatmp.mvc.MvcHelper;
import com.javatmp.mvc.domain.ResponseMessage;
import com.javatmp.mvc.domain.table.DataTableRequest;
import com.javatmp.mvc.domain.table.DataTableResults;
import com.javatmp.util.Constants;
import com.javatmp.util.ServicesFactory;
import java.io.IOException;
import java.text.ParseException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/cms/ListContent")
public class ListContent extends HttpServlet {

    private final Logger logger = Logger.getLogger(getClass().getName());

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            ResponseMessage responseMessage = new ResponseMessage();
            ServicesFactory sf = (ServicesFactory) request.getServletContext().getAttribute(Constants.SERVICES_FACTORY_ATTRIBUTE_NAME);
            ContentService cs = sf.getContentService();

            DataTableRequest tableRequest = (DataTableRequest) MvcHelper.readObjectFromRequest(request, DataTableRequest.class);
            DataTableResults<Content> results = cs.listContent(tableRequest);

            responseMessage.setOverAllStatus(true);
            responseMessage.setMessage("Content Read successfully");
            responseMessage.setData(results);
            MvcHelper.sendMessageAsJson(response, responseMessage);

        } catch (ParseException ex) {
            Logger.getLogger(ListContent.class.getName()).log(Level.SEVERE, null, ex);
        }

    }
}
