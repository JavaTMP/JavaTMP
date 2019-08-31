package com.javatmp.module.accounting;

import com.javatmp.mvc.MvcHelper;
import com.javatmp.mvc.domain.ResponseMessage;
import com.javatmp.util.ServicesFactory;
import com.javatmp.util.Constants;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;
import java.util.logging.Logger;
import javax.persistence.PersistenceException;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/accounting/CreateTransaction")
public class CreateTransaction extends HttpServlet {

    private final Logger logger = Logger.getLogger(getClass().getName());

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String requestPage = "/WEB-INF/pages/accounting/createTransaction.jsp";

        ServletContext context = request.getServletContext();
        ServicesFactory sf = (ServicesFactory) context.getAttribute(Constants.SERVICES_FACTORY_ATTRIBUTE_NAME);
        AccountService accountService = sf.getAccountService();
        List<Account> accounts = accountService.getLeafAccounts();
        List<Module> modules = accountService.getModules();
        List<Costcenter> costcenters = accountService.getAllCostCenterList();
        request.setAttribute("accounts", accounts);
        request.setAttribute("modules", modules);
        request.setAttribute("costcenters", costcenters);
        request.getRequestDispatcher(requestPage).forward(request, response);

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        ResponseMessage responseMessage = new ResponseMessage();
        ServicesFactory sf = (ServicesFactory) request.getServletContext().getAttribute(Constants.SERVICES_FACTORY_ATTRIBUTE_NAME);
        AccountService accountService = sf.getAccountService();
        try {
            Transaction toBe = (Transaction) MvcHelper.readObjectFromRequest(request, Transaction.class);
            logger.info("Transaction to be Created [" + MvcHelper.deepToString(toBe) + "]");

            toBe.setCreationDate(new Date());
            toBe.setStatus((short) 1);
            accountService.createNewTransaction(toBe);
            responseMessage.setOverAllStatus(true);
            responseMessage.setTitle("Success Creation");
            responseMessage.setMessage("Transaction created successfully");
            responseMessage.setData(toBe);
        } catch (PersistenceException e) {
            Throwable t = e;
            while (t.getCause() != null) {
                t = t.getCause();
            }
            responseMessage.setOverAllStatus(false);
            responseMessage.setMessage(t.getMessage());
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            responseMessage.setStatusCode(HttpServletResponse.SC_BAD_REQUEST);
        }
        MvcHelper.sendMessageAsJson(response, responseMessage);

    }

}
