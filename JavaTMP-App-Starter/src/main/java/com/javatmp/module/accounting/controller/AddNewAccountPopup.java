package com.javatmp.module.accounting.controller;

import com.javatmp.fw.domain.ResponseMessage;
import com.javatmp.fw.mvc.MvcHelper;
import com.javatmp.module.accounting.entity.Account;
import com.javatmp.module.accounting.entity.AccountGroup;
import com.javatmp.module.accounting.service.AccountGroupService;
import com.javatmp.module.accounting.service.AccountService;
import com.javatmp.util.Constants;
import java.math.BigDecimal;
import java.util.Date;
import java.util.List;
import java.util.ResourceBundle;
import javax.persistence.PersistenceException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Slf4j
@Controller
public class AddNewAccountPopup {

    @Autowired
    private AccountService accountService;

    @Autowired
    private AccountGroupService accountGroupService;

    @GetMapping(value = "/accounting/AddNewAccountPopup")
    public ModelAndView doGet(ModelAndView modelAndView) {
        String requestPage = "/pages/accounting/addNewAccountPopup.jsp";
        List<Account> accounts = accountService.findAll(0, Integer.MAX_VALUE);
        List<AccountGroup> accountGroups = accountGroupService.findAll(0, Integer.MAX_VALUE);
        modelAndView.addObject("accounts", accounts);
        modelAndView.addObject("accountGroups", accountGroups);
        modelAndView.setViewName(requestPage);
        return modelAndView;
    }

    @PostMapping(value = "/accounting/AddNewAccountPopup")
    public @ResponseBody
    ResponseMessage doPost(Account accountToBeCreated, ResponseMessage responseMessage,
            HttpServletRequest request, HttpServletResponse response) {

        HttpSession session = request.getSession();
        ResourceBundle labels = (ResourceBundle) session.getAttribute(Constants.LANGUAGE_ATTR_KEY);

        try {
            log.info("User to be created is [" + MvcHelper.toString(accountToBeCreated) + "]");
            accountToBeCreated.setCreationDate(new Date());
            accountToBeCreated.setStatus((short) 1);
            accountToBeCreated.setDebit(BigDecimal.ZERO);
            accountToBeCreated.setCredit(BigDecimal.ZERO);
            accountService.save(accountToBeCreated);
            responseMessage.setOverAllStatus(true);
            responseMessage.setMessage("Account created successfully");
            responseMessage.setData(accountToBeCreated);

        } catch (IllegalStateException e) {
            log.error("ERROR : " + e.getMessage());
            responseMessage.setOverAllStatus(false);
            responseMessage.setMessage(labels.getString("action.createUser.wrongDocumentSize"));
            response.setStatus(HttpServletResponse.SC_REQUEST_ENTITY_TOO_LARGE);
            responseMessage.setStatusCode(HttpServletResponse.SC_REQUEST_ENTITY_TOO_LARGE);
        } catch (PersistenceException e) {
            Throwable t = e;
            while (t.getCause() != null) {
                t = t.getCause();
            }
            log.error(t.getMessage(), t);
            responseMessage.setOverAllStatus(false);
            responseMessage.setMessage(t.getMessage());
        }

        return responseMessage;
    }
}
