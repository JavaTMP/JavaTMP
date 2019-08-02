/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package javatmp.processing;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

/**
 *
 * @author JavaTMP
 */
public class CleanHtml {

    public static void main(String[] args) {

        String html = "";

        Document doc = Jsoup.parse(html);
        Elements elements = doc.select("*");
        for (Element element : elements) {
            String block = "";
//            System.out.println(element.toString());
            String heading = element.select(".menu__category").first().text().toLowerCase();
            heading = firstCap(heading);
            block += "<h5><strong>" + heading + "</strong></h5>\n";
            Elements features = element.select(".menu__sub > li > a");
            block += "<ul class=\"list-unstyled\">\n";
            for (Element feature : features) {
                String item = feature.text();
                block += "<li><a href=\"javascript:;\">" + item + "</a></li>\n";
            }
            block += "</ul>\n";
            System.out.print(block);
        }
    }

    public static String firstCap(String str) {

        StringBuilder capitalizedString = new StringBuilder();
        String[] splited = str.trim().split("\\s+");

        for (String string : splited) {
            String s1 = string.substring(0, 1).toUpperCase();
            String nameCapitalized = s1 + string.substring(1);

            capitalizedString.append(nameCapitalized);
            capitalizedString.append(" ");
        }
        return capitalizedString.toString().trim();
    }

}
