package com.javatmp.handlebars;


import com.github.jknack.handlebars.Context;
import com.github.jknack.handlebars.Handlebars;
import com.github.jknack.handlebars.Template;
import com.github.jknack.handlebars.context.FieldValueResolver;
import com.github.jknack.handlebars.context.JavaBeanValueResolver;
import com.github.jknack.handlebars.context.MapValueResolver;
import java.io.IOException;
import java.util.Arrays;
import java.util.List;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author JavaTMP
 */
public class TestHandlebarsTemplateEngine {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) throws IOException {
        // TODO code application logic here
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

        System.out.println(template.apply(context));
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
