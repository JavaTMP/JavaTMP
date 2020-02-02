package com.javatmp.jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.Statement;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

public class HTMLFormGenerator {

    public static void generateForm(String tableName) throws Exception {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/appdb?zeroDateTimeBehavior=CONVERT_TO_NULL", "root", "mmmmmm");
        Statement st = conn.createStatement();
        List<Map<String, Object>> resultData = new LinkedList<>();
        System.out.println("Table Name: " + tableName);
        ResultSet rs = st.executeQuery("select * from " + tableName);
        ResultSetMetaData metadata = rs.getMetaData();

        String filedTemplate
                = "<div class=\"form-group form-row\">\n"
                + "    <label class=\"text-sm-right control-label col-sm-5 col-form-label\">##l##</label>\n"
                + "    <div class=\"col-sm-7\">\n"
                + "        <input class=\"form-control\" type=\"text\" placeholder=\"\"\n name=\"##fn##\" value=\"\" \ndata-rule-required=\"true\"\n>\n"
                + "    </div>\n"
                + "</div>\n";

        String outputForm = "";
        outputForm
                += "<form accept-charset=\"UTF-8\" autocomplete=\"off\" id=\"\" class=\"form\" action=\"${pageContext.request.contextPath}/\" method=\"post\" novalidate=\"novalidate\">\n"
                + "     <div class=\"form-row\">\n"
                + "         <div class=\"col-lg-12\">\n";

        for (int i = 0; i < metadata.getColumnCount(); i++) {
            String columnName = metadata.getColumnLabel(i + 1);
            System.out.println("Column Name: " + columnName + ",  type [" + metadata.getColumnTypeName(i + 1) + "] Class [" + metadata.getColumnClassName(i + 1) + "]");
            outputForm += filedTemplate.replace("##l##", columnName).replace("##fn##", columnName);
        }

        outputForm += "</div>\n</div>\n</form>";
        System.out.println(outputForm);
    }

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) throws Exception {
        generateForm("transaction");
    }

}
