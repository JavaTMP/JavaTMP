package com.javatmp.module.accounting;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.reflect.TypeToken;
import com.javatmp.module.customer.Customer;
import com.javatmp.module.employee.Employee;
import com.javatmp.module.fixedAsset.FixedAsset;
import com.javatmp.module.service.Service;
import com.javatmp.module.supplier.Supplier;
import com.javatmp.mvc.MvcHelper;
import com.javatmp.mvc.domain.ResponseMessage;
import com.javatmp.util.Constants;
import com.javatmp.util.ServicesFactory;
import java.io.IOException;
import java.lang.reflect.Type;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/entity/moduleItemList")
public class ModuleItemList extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ServicesFactory sf = (ServicesFactory) request.getServletContext().getAttribute(Constants.SERVICES_FACTORY_ATTRIBUTE_NAME);
        AccountService accountService = sf.getAccountService();

        Type type = new TypeToken<Map<String, String>>() {
        }.getType();
        Map<String, String> myMap = MvcHelper.getGson().fromJson(request.getReader(), type);

        String moduleIdStr = myMap.get("moduleId");
        Integer moduleId = Integer.parseInt(moduleIdStr == null ? "0" : moduleIdStr);
        ResponseMessage responseMessage = new ResponseMessage();
        responseMessage.setOverAllStatus(true);

        if (moduleId == 1) { // customer
            List<Customer> customers = accountService.getAllList(Customer.class);
            responseMessage.setData(customers);
        } else if (moduleId == 2) { // customer
            List<Supplier> suppliers = accountService.getAllList(Supplier.class);
            responseMessage.setData(suppliers);
        } else if (moduleId == 3) { // employee
            List<Employee> employees = accountService.getAllList(Employee.class);
            responseMessage.setData(employees);
        } else if (moduleId == 4) { // fixedAsset
            List<FixedAsset> fixedAssets = accountService.getAllList(FixedAsset.class);
            responseMessage.setData(fixedAssets);
        } else if (moduleId == 5) { // inventory
            List<Service> inventorys = accountService.getAllList(Service.class);
            responseMessage.setData(inventorys);
        } else if (moduleId == 6) { // inventory
            List<Service> services = accountService.getAllList(Service.class);
            responseMessage.setData(services);
        }

        MvcHelper.sendMessageAsJson(response, responseMessage);

    }

}
