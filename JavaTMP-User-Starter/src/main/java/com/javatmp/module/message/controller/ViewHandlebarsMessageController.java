package com.javatmp.module.message.controller;

import com.github.jknack.handlebars.Context;
import com.github.jknack.handlebars.Handlebars;
import com.github.jknack.handlebars.Template;
import com.github.jknack.handlebars.context.FieldValueResolver;
import com.github.jknack.handlebars.context.JavaBeanValueResolver;
import com.github.jknack.handlebars.context.MapValueResolver;
import com.javatmp.mvc.MvcHelper;
import com.javatmp.mvc.domain.ResponseMessage;
import com.javatmp.util.Constants;
import com.javatmp.util.ServicesFactory;
import java.io.IOException;
import java.util.Arrays;
import java.util.List;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/message/ViewHandlebarsMessageController")
public class ViewHandlebarsMessageController extends HttpServlet {

    private final Logger logger = Logger.getLogger(getClass().getName());

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ServicesFactory sf = (ServicesFactory) request.getServletContext().getAttribute(Constants.SERVICES_FACTORY_ATTRIBUTE_NAME);

        HttpSession session = request.getSession();
        ResponseMessage responseMessage = new ResponseMessage();

        String view = "{{#items}}\n"
                + "Name: {{name}}\n"
                + "Price: {{price}}\n"
                + "  {{#features}}\n"
                + "  Feature: {{description}}\n"
                + "  {{/features}}\n"
                + "{{/items}}";

        Handlebars handlebars = new Handlebars();

        Template template = handlebars.compileInline(view);

        Model model = new Model();
        Context context = Context
                .newBuilder(model)
                .resolver(MapValueResolver.INSTANCE,
                        JavaBeanValueResolver.INSTANCE,
                        FieldValueResolver.INSTANCE)
                .build();

        String output = template.apply(context);

        logger.info("generated output from view and model is [" + output + "]");

        responseMessage.setOverAllStatus(true);
        responseMessage.setData(output);

        MvcHelper.sendMessageAsJson(response, responseMessage);

    }
}

class Model {

    public List<Item> getItems() {
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
        public String name, price;
        public List<Feature> features;
    }

    static class Feature {

        Feature(String description) {
            this.description = description;
        }
        String description;
    }
}
