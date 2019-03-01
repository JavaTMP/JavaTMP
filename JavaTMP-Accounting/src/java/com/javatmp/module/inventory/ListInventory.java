package com.javatmp.module.inventory;

import com.javatmp.module.service.*;
import com.javatmp.mvc.domain.table.DataTableRequest;
import com.javatmp.mvc.domain.table.DataTableResults;
import com.javatmp.mvc.MvcHelper;
import com.javatmp.mvc.domain.ResponseMessage;
import com.javatmp.util.ServicesFactory;
import com.javatmp.util.Constants;
import java.io.IOException;
import java.text.ParseException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/inventory/ListInventorys")
public class ListInventory extends HttpServlet {

    private final Logger logger = Logger.getLogger(getClass().getName());

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            ResponseMessage responseMessage = new ResponseMessage();
            ServicesFactory sf = (ServicesFactory) request.getServletContext().getAttribute(Constants.SERVICES_FACTORY_ATTRIBUTE_NAME);
            InventoryService inventoryService = sf.getInventoryService();
            DataTableRequest tableRequest = (DataTableRequest) MvcHelper.readObjectFromRequest(request, DataTableRequest.class);
            logger.info("datatableRequest [" + MvcHelper.deepToString(tableRequest) + "]");

            DataTableResults<Inventory> dataTableResult = inventoryService.listAllInventorys(tableRequest);
            responseMessage.setOverAllStatus(true);
            responseMessage.setData(dataTableResult);

            MvcHelper.sendMessageAsJson(response, responseMessage);
        } catch (ParseException ex) {
            logger.log(Level.SEVERE, null, ex);
            throw new ServletException("@ListUsersController", ex);
        }

    }
}
