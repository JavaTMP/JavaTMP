package com.javatmp.module.accounting.controller;

import com.javatmp.fw.domain.ResponseMessage;
import com.javatmp.module.accounting.entity.Account;
import com.javatmp.module.accounting.entity.Transaction;
import com.javatmp.module.accounting.service.AccountService;
import com.javatmp.util.Constants;
import com.javatmp.util.ServicesFactory;
import java.io.IOException;
import java.util.Date;
import java.util.List;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Slf4j
@Controller
public class CreateTransaction {

    @GetMapping("/accounting/CreateTransaction")
    public String doGet(HttpServletRequest request, HttpServletResponse response) {
        String requestPage = "/pages/accounting/createTransaction.jsp";
        ServletContext context = request.getServletContext();
        ServicesFactory sf = (ServicesFactory) context.getAttribute(Constants.SERVICES_FACTORY_ATTRIBUTE_NAME);
        AccountService accountService = sf.getAccountService();
        List<Account> accounts = accountService.getLeafAccounts();
        request.setAttribute("accounts", accounts);
        return requestPage;
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        ResponseMessage responseMessage = new ResponseMessage();
        ServicesFactory sf = (ServicesFactory) request.getServletContext().getAttribute(Constants.SERVICES_FACTORY_ATTRIBUTE_NAME);
        AccountService accountService = sf.getAccountService();
        Transaction toBe = (Transaction) MvcHelper.readObjectFromRequest(request, Transaction.class);
        logger.info("Transaction to be Created [" + (toBe) + "]");

        toBe.setCreationDate(new Date());
        toBe.setStatus((short) 1);
        accountService.createNewTransaction(toBe);
        responseMessage.setOverAllStatus(true);
        responseMessage.setTitle("Success Creation");
        responseMessage.setMessage("Transaction created successfully");
        responseMessage.setData(toBe);

        return responseMessage;

    }

}
