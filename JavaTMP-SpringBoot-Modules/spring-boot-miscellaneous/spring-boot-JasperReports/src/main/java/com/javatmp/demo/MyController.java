package com.javatmp.demo;

import net.sf.jasperreports.engine.*;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

@Controller
public class MyController {

    @RequestMapping(path = "/pdf", method = RequestMethod.GET)
    public ResponseEntity<byte[]> report() throws JRException {
        InputStream employeeReportStream
                = getClass().getResourceAsStream("/report2.jrxml");
        JasperReport jasperReport
                = JasperCompileManager.compileReport(employeeReportStream);

        List<Product> products = new LinkedList<>();

        for(int i = 1; i <= 10; i++) {
            Product product = new Product(i * 1L, "name " + i, i * i);
            products.add(product);
        }

        Map<String, Object> parameters = new HashMap<>();
        parameters.put("title", "Employee Report");
        parameters.put("minSalary", 15000.0);
        parameters.put("condition", " LAST_NAME ='Smith' ORDER BY FIRST_NAME");

        JRBeanCollectionDataSource studentDS = new JRBeanCollectionDataSource(products);

        JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, parameters, studentDS);

        final ByteArrayOutputStream outStream = new ByteArrayOutputStream();
        JasperExportManager.exportReportToPdfStream(jasperPrint, outStream);

        HttpHeaders headers = new HttpHeaders();

        headers.setContentType(MediaType.parseMediaType("application/pdf"));
        String filename = "report.pdf";

        headers.add("content-disposition", "inline;filename=" + filename);

        return new ResponseEntity<byte[]>(outStream.toByteArray(), headers, HttpStatus.OK);


    }
}
