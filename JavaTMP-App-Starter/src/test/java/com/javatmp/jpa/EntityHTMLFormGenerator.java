package com.javatmp.jpa;

import com.javatmp.module.user.entity.User;

import java.lang.reflect.Field;

public class EntityHTMLFormGenerator {

    public static void generateForm(Class clz) throws Exception {

        String filedTemplate
                = "<div class=\"form-group form-row\">\n"
                + "    <label class=\"text-sm-right control-label col-sm-5 col-form-label\">##l##</label>\n"
                + "    <div class=\"col-sm-7\">\n"
                + "        <input javaDataType=\"##javaDataType##\" class=\"form-control\" type=\"text\" placeholder=\"\" name=\"##fn##\" value=\"\" \ndata-rule-required=\"true\"\n>\n"
                + "    </div>\n"
                + "</div>\n";

        String outputForm = "";
        outputForm
                += "<form accept-charset=\"UTF-8\" autocomplete=\"off\" id=\"\" class=\"form\" action=\"${pageContext.request.contextPath}/\" method=\"post\" novalidate=\"novalidate\">\n"
                + "     <div class=\"form-row\">\n"
                + "         <div class=\"col-lg-12\">\n";

        for(Field field : EntityUtil.getFields(clz)) {
            System.out.println(field.getName() + " " + field.getType().getSimpleName());
            String columnName = field.getName();
            String dataType = field.getType().getSimpleName();
            outputForm += filedTemplate
                    .replace("##l##", columnName)
                    .replace("##fn##", columnName)
                    .replace("##javaDataType##", dataType);
        }

        outputForm += "</div>\n</div>\n</form>";
        System.out.println(outputForm);
    }

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) throws Exception {
        generateForm(User.class);
    }

}
