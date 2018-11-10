package com.javatmp.db;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.javatmp.mvc.adapter.ByteArrayToBase64TypeAdapter;
import com.javatmp.mvc.adapter.ClassTypeAdapter;
import com.javatmp.mvc.adapter.OrderDirTypeAdapter;
import com.javatmp.mvc.domain.table.OrderDir;
import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
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
        String tableName = "document";
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
                System.out.println("Column Name: " + columnName + ",  type [" + metadata.getColumnTypeName(i + 1) + "] Class [" + metadata.getColumnClassName(i + 1) + "] value [" + rs.getObject(i + 1) + "]");
                rowData.put(columnName, rs.getObject(columnName));
            }
        }

        for (Map<String, Object> row : resultData) {
            System.out.println(row);
        }

        Gson gson = new GsonBuilder()
                .setDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSSXXX").serializeNulls()
                .registerTypeAdapter(Class.class, new ClassTypeAdapter())
                .registerTypeAdapter(OrderDir.class, new OrderDirTypeAdapter())
                .registerTypeHierarchyAdapter(byte[].class, new ByteArrayToBase64TypeAdapter())
                .create();

        String json = gson.toJson(resultData);

        System.out.println("********");
        System.out.println(json);

    }

    public static void getPrimarykey() throws SQLException, ClassNotFoundException {

        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/appdb?zeroDateTimeBehavior=CONVERT_TO_NULL", "root", "mmmmmm");
        DatabaseMetaData meta = conn.getMetaData();
        // meta.getTables(null, null, "%", new String[]{"TABLE"})
        try (ResultSet tables = meta.getTables("sakila", null, "%", new String[]{"TABLE"})) {
            while (tables.next()) {
                String catalog = tables.getString("TABLE_CAT");
                String schema = tables.getString("TABLE_SCHEM");
                String tableName = tables.getString("TABLE_NAME");
                System.out.println("Table: " + tableName);
                try (ResultSet primaryKeys = meta.getPrimaryKeys(catalog, schema, tableName)) {
                    while (primaryKeys.next()) {
                        System.out.println("Primary key: " + primaryKeys.getString("COLUMN_NAME"));
                    }
                }
                //Get Foreign Keys
                ResultSet FK = meta.getImportedKeys(null, null, tableName);
                System.out.println("------------FOREIGN KEYS-------------");
                while (FK.next()) {
                    System.out.println(FK.getString("PKTABLE_NAME") + " --- " + FK.getString("PKCOLUMN_NAME") + " === " + FK.getString("FKTABLE_NAME") + " --- " + FK.getString("FKCOLUMN_NAME"));
                }
                System.out.println("-------------------------");
                // similar for exportedKeys
            }
        }
    }

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) throws Exception {
//        checkData();
        getPrimarykey();
    }

}
