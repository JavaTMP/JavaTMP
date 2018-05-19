package com.javatmp.web.controller.country;

import com.javatmp.domain.Country;
import com.javatmp.mvc.MvcHelper;
import com.javatmp.mvc.Page;
import com.javatmp.mvc.ResponseMessage;
import com.javatmp.service.CountryService;
import com.javatmp.service.ServicesFactory;
import com.javatmp.util.Constants;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.LinkedList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/country/ListCountryController")
public class ListCountryController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            ServicesFactory sf = (ServicesFactory) request.getSession().getAttribute(Constants.SERVICES_FACTORY_ATTRIBUTE_NAME);
            CountryService countryService = sf.getCountryService();

            Country requestCountry = new Country();
            MvcHelper.populateBeanByRequestParameters(request, requestCountry);
            System.out.println("Country to look for [" + MvcHelper.deepToString(requestCountry) + "]");

            String requestedPageStr = request.getParameter("page");
            int requestedPage = 1;
            if (requestedPageStr != null) {
                requestedPage = Integer.valueOf(requestedPageStr);
            }

            List<Country> foundCountries = new LinkedList<Country>();
            List<Country> all = countryService.findCountriesByName(requestCountry);
            for (int i = (requestedPage - 1) * 10; i < all.size() && i < (requestedPage) * 10; i++) {
                foundCountries.add(all.get(i));
            }

            ResponseMessage responseMessage = new ResponseMessage();

            responseMessage.setOverAllStatus(true);
            responseMessage.setMessage(this.getClass().getCanonicalName());

            Page<Country> page = new Page<>(Country.class);
            page.setAllCount(Long.valueOf(all.size()));
            page.setNumOfRowsPerPage(10);
            page.setRecords(foundCountries);
            responseMessage.setData(page);

            MvcHelper.sendMessageAsJson(response, responseMessage);

        } catch (IllegalAccessException ex) {
            Logger.getLogger(ListCountryController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (InvocationTargetException ex) {
            Logger.getLogger(ListCountryController.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

}
