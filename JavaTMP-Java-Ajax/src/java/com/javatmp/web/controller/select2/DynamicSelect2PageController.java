package com.javatmp.web.controller.select2;

import com.javatmp.domain.Country;
import com.javatmp.service.CountryService;
import com.javatmp.service.ServicesFactory;
import com.javatmp.util.Constants;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/DynamicSelect2PageController")
public class DynamicSelect2PageController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        ServicesFactory sf = (ServicesFactory) request.getSession().getAttribute(Constants.SERVICES_FACTORY_ATTRIBUTE_NAME);
        CountryService countryService = sf.getCountryService();
        List<Country> countries = countryService.getCountries();
        request.setAttribute("countries", countries);

        request.getRequestDispatcher("/WEB-INF/pages/plugins/dynamic-jQuery-select2-bootstrap.jsp").forward(request, response);

    }
}
