package com.javatmp.module.customer;

import com.javatmp.module.accounting.*;
import com.javatmp.module.user.*;
import com.javatmp.mvc.MvcHelper;
import com.javatmp.mvc.domain.ResponseMessage;
import com.javatmp.module.dms.DocumentService;
import com.javatmp.util.ServicesFactory;
import com.javatmp.util.Constants;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.text.MessageFormat;
import java.util.ResourceBundle;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.persistence.PersistenceException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/customer/DeleteCustomer")
public class DeleteCustomer extends HttpServlet {

    private final Logger logger = Logger.getLogger(getClass().getName());

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        ResponseMessage responseMessage = new ResponseMessage();
        ServicesFactory sf = (ServicesFactory) request.getServletContext().getAttribute(Constants.SERVICES_FACTORY_ATTRIBUTE_NAME);
        CustomerService customerService = sf.getCustomerService();
        HttpSession session = request.getSession();
        ResourceBundle labels = (ResourceBundle) session.getAttribute(Constants.LANGUAGE_ATTR_KEY);

        try {

            Customer reqObject = (Customer) MvcHelper.readObjectFromRequest(request, Customer.class);

            int updateStatus = customerService.deleteCustomer(reqObject);

            responseMessage.setOverAllStatus(true);
            responseMessage.setTitle("Deleted");
            responseMessage.setMessage("Object deleted successfully with status " + updateStatus);
            responseMessage.setData(reqObject);
        } catch (PersistenceException e) {
            Throwable t = e;
            while (t.getCause() != null) {
                t = t.getCause();
            }
            responseMessage.setOverAllStatus(false);
            responseMessage.setMessage(t.getMessage());
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            responseMessage.setStatusCode(HttpServletResponse.SC_BAD_REQUEST);
        } catch (IllegalArgumentException e) {
            logger.log(Level.SEVERE, e.getMessage(), e);
            responseMessage.setOverAllStatus(false);
            responseMessage.setMessage(e.getMessage());
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            responseMessage.setStatusCode(HttpServletResponse.SC_BAD_REQUEST);
        }
        MvcHelper.sendMessageAsJson(response, responseMessage);

    }
}
