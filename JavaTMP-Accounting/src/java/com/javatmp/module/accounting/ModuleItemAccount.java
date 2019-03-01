package com.javatmp.module.accounting;

import com.google.gson.reflect.TypeToken;
import com.javatmp.mvc.MvcHelper;
import com.javatmp.mvc.domain.ResponseMessage;
import com.javatmp.util.Constants;
import com.javatmp.util.ServicesFactory;
import java.io.IOException;
import java.lang.reflect.Type;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/entity/ModuleItemAccount")
public class ModuleItemAccount extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ServicesFactory sf = (ServicesFactory) request.getServletContext().getAttribute(Constants.SERVICES_FACTORY_ATTRIBUTE_NAME);
        AccountService accountService = sf.getAccountService();

        Type type = new TypeToken<Map<String, String>>() {
        }.getType();
        Map<String, String> myMap = MvcHelper.getGson().fromJson(request.getReader(), type);

        String moduleIdStr = myMap.get("moduleId");
        String moduleTypeIdStr = myMap.get("moduleTypeId");
        String moduleRefIdStr = myMap.get("moduleTypeId");
        Integer moduleId = Integer.parseInt(moduleIdStr == null ? "0" : moduleIdStr);
        Integer moduleTypeId = Integer.parseInt(moduleTypeIdStr == null ? "0" : moduleTypeIdStr);
        Integer moduleRefId = Integer.parseInt(moduleRefIdStr == null ? "0" : moduleRefIdStr);

        List<Account> acctsForType = accountService.getAccountForModuleTypeId(new Moduletype(moduleTypeId));

        ResponseMessage responseMessage = new ResponseMessage();
        responseMessage.setOverAllStatus(true);

        responseMessage.setData(acctsForType);

        MvcHelper.sendMessageAsJson(response, responseMessage);

    }

}
