package com.javatmp;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.Statement;
import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

public class JdbcHelper {

    public static void checkData() throws Exception {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/appdb?zeroDateTimeBehavior=CONVERT_TO_NULL", "root", "mmmmmm");
        Statement st = conn.createStatement();
        String tableName = "user";
        List<Map<String, Object>> resultData = new LinkedList<>();
        System.out.println("Table Name: " + tableName);

        ResultSet rs = st.executeQuery("select * from " + tableName);
        ResultSetMetaData metadata = rs.getMetaData();
        while (rs.next()) {
            Map<String, Object> rowData = new LinkedHashMap<>();
            resultData.add(rowData);
            System.out.println("Row:");
            for (int i = 0; i < metadata.getColumnCount(); i++) {
                String columnName = metadata.getColumnLabel(i + 1);
                System.out.println("Column Name: " + columnName + ",  type [" + metadata.getColumnTypeName(i + 1)
                        + "], value [" + rs.getObject(i + 1) + "] java type [" + rs.getObject(i + 1).getClass().getName() + "]");
                rowData.put(columnName, rs.getObject(columnName));
            }
        }

        for (Map<String, Object> row : resultData) {
            System.out.println(row);
        }

    }

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) throws Exception {
        checkData();
    }

}
