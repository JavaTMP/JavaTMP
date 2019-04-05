package com.javatmp.web.controller.message;

import com.github.mustachejava.DefaultMustacheFactory;
import com.github.mustachejava.Mustache;
import com.github.mustachejava.MustacheFactory;
import com.javatmp.mvc.MvcHelper;
import com.javatmp.mvc.domain.ResponseMessage;
import com.javatmp.service.ServicesFactory;
import com.javatmp.util.Constants;
import java.io.IOException;
import java.io.StringReader;
import java.io.StringWriter;
import java.util.Arrays;
import java.util.List;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/message/ViewMustacheMessageController")
public class ViewMustacheMessageController extends HttpServlet {

    private final Logger logger = Logger.getLogger(getClass().getName());

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ServicesFactory sf = (ServicesFactory) request.getSession().getAttribute(Constants.SERVICES_FACTORY_ATTRIBUTE_NAME);

        HttpSession session = request.getSession();
        ResponseMessage responseMessage = new ResponseMessage();

        String template = "{{#items}}\n"
                + "Name: {{name}}\n"
                + "Price: {{price}}\n"
                + "  {{#features}}\n"
                + "  Feature: {{description}}\n"
                + "  {{/features}}\n"
                + "{{/items}}";

        String output;

        StringWriter sw = new StringWriter();
        MustacheFactory mf = new DefaultMustacheFactory();
        Mustache mustache = mf.compile(new StringReader(template), "demo1");
        mustache.execute(sw, new Context()).flush();
        output = sw.toString();
        responseMessage.setOverAllStatus(true);
        responseMessage.setData(output);

        MvcHelper.sendMessageAsJson(response, responseMessage);

    }
}

class Context {

    List<Item> items() {
        return Arrays.asList(
                new Item("Item 1", "$19.99", Arrays.asList(new Feature("New!"), new Feature("Awesome!"))),
                new Item("Item 2", "$29.99", Arrays.asList(new Feature("Old."), new Feature("Ugly.")))
        );
    }

    static class Item {

        Item(String name, String price, List<Feature> features) {
            this.name = name;
            this.price = price;
            this.features = features;
        }
        String name, price;
        List<Feature> features;
    }

    static class Feature {

        Feature(String description) {
            this.description = description;
        }
        String description;
    }
}
