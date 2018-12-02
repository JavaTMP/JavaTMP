package com.javatmp.module.accounting;

import com.javatmp.module.user.*;
import com.javatmp.module.country.Country;
import com.javatmp.module.country.Countrytranslation;
import com.javatmp.module.dms.Document;
import com.javatmp.module.language.Language;
import com.javatmp.module.language.Languagetranslation;
import com.javatmp.module.theme.Theme;
import com.javatmp.module.theme.Themetranslation;
import com.javatmp.module.timezone.Timezone;
import com.javatmp.mvc.MvcHelper;
import com.javatmp.mvc.domain.ResponseMessage;
import com.javatmp.module.dms.DocumentService;
import com.javatmp.module.timezone.Timezonetranslation;
import com.javatmp.util.ServicesFactory;
import com.javatmp.util.Constants;
import com.javatmp.util.MD5Util;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.lang.reflect.InvocationTargetException;
import java.math.BigDecimal;
import java.nio.file.Paths;
import java.util.Date;
import java.util.List;
import java.util.ResourceBundle;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.persistence.PersistenceException;
import javax.servlet.ServletContext;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@WebServlet("/accounting/AddNewAccountPopup")
public class AddNewAccountPopup extends HttpServlet {

    private final Logger logger = Logger.getLogger(getClass().getName());

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String requestPage = "/WEB-INF/pages/accounting/addNewAccountPopup.jsp";
        ServletContext context = request.getServletContext();
        ServicesFactory sf = (ServicesFactory) context.getAttribute(Constants.SERVICES_FACTORY_ATTRIBUTE_NAME);
        HttpSession session = request.getSession();
        User loggedInUser = (User) session.getAttribute("user");
        AccountService accountService = sf.getAccountService();
        List<Account> accounts = accountService.getChartOfAccounts();
        List<Accountgroup> accountGroups = accountService.getAccountGroups();
        request.setAttribute("accounts", accounts);
        request.setAttribute("accountGroups", accountGroups);
        request.getRequestDispatcher(requestPage).forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        ResponseMessage responseMessage = new ResponseMessage();
        ServicesFactory sf = (ServicesFactory) request.getServletContext().getAttribute(Constants.SERVICES_FACTORY_ATTRIBUTE_NAME);
        AccountService accountService = sf.getAccountService();
        HttpSession session = request.getSession();
        ResourceBundle labels = (ResourceBundle) session.getAttribute(Constants.LANGUAGE_ATTR_KEY);

        try {
            Account accountToBeCreated = new Account();
            MvcHelper.populateBeanByRequestParameters(request, accountToBeCreated);
            logger.info("User to be created is [" + MvcHelper.toString(accountToBeCreated) + "]");
            accountToBeCreated.setCreationDate(new Date());
            accountToBeCreated.setStatus((short) 1);
            accountToBeCreated.setDebit(BigDecimal.ZERO);
            accountToBeCreated.setCredit(BigDecimal.ZERO);
            accountService.createNewAccount(accountToBeCreated);
            responseMessage.setOverAllStatus(true);
            responseMessage.setMessage("Account created successfully");
            responseMessage.setData(accountToBeCreated);

        } catch (IllegalStateException e) {
            logger.info("ERROR : " + e.getMessage());
            responseMessage.setOverAllStatus(false);
            responseMessage.setMessage(labels.getString("action.createUser.wrongDocumentSize"));
            response.setStatus(HttpServletResponse.SC_REQUEST_ENTITY_TOO_LARGE);
            responseMessage.setStatusCode(HttpServletResponse.SC_REQUEST_ENTITY_TOO_LARGE);
        } catch (PersistenceException e) {
            Throwable t = e;
            while (t.getCause() != null) {
                t = t.getCause();
            }
            logger.log(Level.SEVERE, t.getMessage(), t);
            responseMessage.setOverAllStatus(false);
            responseMessage.setMessage(t.getMessage());
        } catch (IllegalAccessException | InvocationTargetException ex) {
            logger.log(Level.SEVERE, ex.getMessage(), ex);
            throw new ServletException(ex);
        }

        MvcHelper.sendMessageAsJson(response, responseMessage);

    }
}
