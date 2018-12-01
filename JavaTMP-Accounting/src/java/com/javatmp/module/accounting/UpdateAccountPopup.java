package com.javatmp.module.accounting;

import com.javatmp.module.user.*;
import com.javatmp.module.country.Country;
import com.javatmp.module.country.Countrytranslation;
import com.javatmp.module.language.Language;
import com.javatmp.module.language.Languagetranslation;
import com.javatmp.module.theme.Theme;
import com.javatmp.module.theme.Themetranslation;
import com.javatmp.module.timezone.Timezone;
import com.javatmp.module.timezone.Timezonetranslation;
import com.javatmp.mvc.MvcHelper;
import com.javatmp.mvc.domain.ResponseMessage;
import com.javatmp.util.ServicesFactory;
import com.javatmp.util.Constants;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.persistence.PersistenceException;
import javax.servlet.ServletContext;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/accounting/UpdateAccountPopup")
public class UpdateAccountPopup extends HttpServlet {

    private final Logger logger = Logger.getLogger(getClass().getName());

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String requestPage = "/WEB-INF/pages/accounting/updateAccountPopup.jsp";

            ServletContext context = request.getServletContext();
            ServicesFactory sf = (ServicesFactory) context.getAttribute(Constants.SERVICES_FACTORY_ATTRIBUTE_NAME);
            AccountService accountService = sf.getAccountService();
            Account account = new Account();
            MvcHelper.populateBeanByRequestParameters(request, account);
            logger.info("request account is [" + MvcHelper.deepToString(account) + "]");
            Account dbAccount = accountService.readAccountById(account);
            logger.info("DB account to be Updated is [" + MvcHelper.deepToString(dbAccount) + "]");

            HttpSession session = request.getSession();
            User loggedInUser = (User) session.getAttribute("user");
            List<Account> accounts = accountService.getChartOfAccounts();
            List<Accountgroup> accountGroups = accountService.getAccountGroups();
            request.setAttribute("accounts", accounts);
            request.setAttribute("accountGroups", accountGroups);
            request.setAttribute("account", dbAccount);

            request.getRequestDispatcher(requestPage).forward(request, response);

        } catch (IllegalAccessException ex) {
            logger.log(Level.SEVERE, null, ex);
            throw new ServletException(ex);
        } catch (InvocationTargetException ex) {
            logger.log(Level.SEVERE, null, ex);
            throw new ServletException(ex);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        ResponseMessage responseMessage = new ResponseMessage();
        ServicesFactory sf = (ServicesFactory) request.getServletContext().getAttribute(Constants.SERVICES_FACTORY_ATTRIBUTE_NAME);
        AccountService accountService = sf.getAccountService();
        try {

            Account accountToBeUpdated = new Account();
            MvcHelper.populateBeanByRequestParameters(request, accountToBeUpdated);
            logger.info("account to be Updated is [" + MvcHelper.toString(accountToBeUpdated) + "]");
            int updateStatus = accountService.updateAccount(accountToBeUpdated);
            responseMessage.setOverAllStatus(Boolean.TRUE);
            responseMessage.setMessage("Account Updated successfully");
            responseMessage.setData(accountToBeUpdated);
        } catch (PersistenceException e) {
            Throwable t = e;
            while (t.getCause() != null) {
                t = t.getCause();
            }
            responseMessage.setOverAllStatus(false);
            responseMessage.setMessage(t.getMessage());
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            responseMessage.setStatusCode(HttpServletResponse.SC_BAD_REQUEST);

        } catch (IllegalArgumentException | IllegalAccessException | InvocationTargetException e) {
            logger.info("ERROR : " + e.getMessage());
            responseMessage.setOverAllStatus(false);
            responseMessage.setMessage(e.getMessage());
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            responseMessage.setStatusCode(HttpServletResponse.SC_BAD_REQUEST);
            throw new ServletException(e);
        }
        MvcHelper.sendMessageAsJson(response, responseMessage);

    }

}
