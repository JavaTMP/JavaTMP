package com.javatmp.module.message.controller;

import com.github.jknack.handlebars.Context;
import com.github.jknack.handlebars.Handlebars;
import com.github.jknack.handlebars.Template;
import com.github.jknack.handlebars.context.FieldValueResolver;
import com.github.jknack.handlebars.context.JavaBeanValueResolver;
import com.github.jknack.handlebars.context.MapValueResolver;
import com.javatmp.fw.domain.ResponseMessage;
import java.io.IOException;
import java.util.Arrays;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Slf4j
@Controller
public class ViewHandlebarsMessageController {

    @GetMapping("/message/ViewHandlebarsMessageController")
    public @ResponseBody
    ResponseMessage doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {

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

        log.info("generated output from view and model is [" + output + "]");

        responseMessage.setOverAllStatus(true);
        responseMessage.setData(output);

        return responseMessage;

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
