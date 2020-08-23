package com.javatmp.demo;

import com.itextpdf.io.font.constants.StandardFonts;
import com.itextpdf.io.image.ImageDataFactory;
import com.itextpdf.kernel.colors.ColorConstants;
import com.itextpdf.kernel.font.PdfFont;
import com.itextpdf.kernel.font.PdfFontFactory;
import com.itextpdf.kernel.pdf.PdfDocument;
import com.itextpdf.kernel.pdf.PdfPage;
import com.itextpdf.kernel.pdf.PdfWriter;
import com.itextpdf.layout.Document;
import com.itextpdf.layout.Style;
import com.itextpdf.layout.element.*;
import com.itextpdf.layout.property.HorizontalAlignment;
import com.itextpdf.layout.property.ListNumberingType;
import com.itextpdf.layout.property.TextAlignment;
import com.itextpdf.layout.property.UnitValue;
import lombok.extern.slf4j.Slf4j;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.net.URI;
import java.net.URISyntaxException;
import java.nio.file.Files;
import java.nio.file.Paths;

@Slf4j
public class PDFGenerator {

    public static ByteArrayInputStream main() {

        ByteArrayOutputStream out = new ByteArrayOutputStream();
        PdfWriter writer;
        try {
            writer = new PdfWriter(out);
            PdfDocument pdf = new PdfDocument(writer);
            Document document = new Document(pdf);

            PdfFont font = PdfFontFactory.createFont(StandardFonts.TIMES_ROMAN);
            Text text = new Text("Hello World PDF created using iText")
                    .setFont(font)
                    .setFontSize(15)
                    .setFontColor(ColorConstants.MAGENTA)
                    .setHorizontalAlignment(HorizontalAlignment.CENTER);
            //Add paragraph to the document
            document.add(new Paragraph(text));

            font = PdfFontFactory.createFont(StandardFonts.COURIER);
            Style style = new Style().setFont(font)
                    .setFontSize(14)
                    .setFontColor(ColorConstants.RED)
                    .setBackgroundColor(ColorConstants.YELLOW);

            document.add(new Paragraph()
                    .add("In this PDF, ")
                    .add(new Text("Text is styled").addStyle(style))
                    .add(" using iText ")
                    .add(new Text("Style").addStyle(style))
                    .add("."));

            PdfFont headerFont = PdfFontFactory.createFont(StandardFonts.TIMES_BOLD);
            PdfFont cellFont = PdfFontFactory.createFont(StandardFonts.TIMES_ROMAN);
            Table table = new Table(3);
            table.setWidth(UnitValue.createPercentValue(100));
            // adding header
            table.addHeaderCell(new Cell(1, 3)
                    .setTextAlignment(TextAlignment.CENTER)
                    .setBackgroundColor(ColorConstants.LIGHT_GRAY)
                    .add(new Paragraph("Employee Information")
                            .setFont(headerFont)));
            table.addHeaderCell(new Cell()
                    .add(new Paragraph("Name")
                            .setFont(headerFont)));
            table.addHeaderCell(new Cell()
                    .add(new Paragraph("Dept")
                            .setFont(headerFont)));
            table.addHeaderCell(new Cell()
                    .add(new Paragraph("Salary")
                            .setFont(headerFont)));
            // adding rows
            for(int i = 1; i < 20; i++) {
                table.addCell(new Cell()
                        .add(new Paragraph("Name " + i)
                                .setFont(cellFont)));
                table.addCell(new Cell()
                        .add(new Paragraph("Department" + i)
                                .setFont(cellFont)));
                table.addCell(new Cell()
                        .add(new Paragraph(Integer.toString(i))
                                .setFont(cellFont)));
            }

            document.add(table);
            URI resource = ClassLoader.getSystemClassLoader().getResource("javatmp-logo.png").toURI();
            log.info("resource : ", resource);
            byte[] file = Files.readAllBytes(Paths.get(resource));
            Image image = new Image(ImageDataFactory.create(file));
            document.add(new Paragraph("In this PDF which is created using iText an image is added"));
            // adding image
            document.add(image);

            List list = new List()
                    .setSymbolIndent(8) // space from the left)
                    .setListSymbol(ListNumberingType.ROMAN_LOWER);
            document.add(new Paragraph("List with Roman symbols"));
            // Add ListItem objects
            list.add(new ListItem("Item1"))
                    .add(new ListItem("Item2"))
                    .add(new ListItem("Item3"));
            // Add the list
            document.add(list);
            // List items using English Alphabets
            list = new List()
                    .setSymbolIndent(8) // space from the left)
                    .setListSymbol(ListNumberingType.ENGLISH_UPPER);
            document.add(new Paragraph("List with English letter symbols"));
            // Add ListItem objects
            list.add(new ListItem("Item1"))
                    .add(new ListItem("Item2"))
                    .add(new ListItem("Item3"));
            // Add the list
            document.add(list);
            // List items using English Alphabets
            list = new List()
                    .setSymbolIndent(8) // space from the left)
                    .setListSymbol(ListNumberingType.GREEK_LOWER);
            document.add(new Paragraph("List with Greek letter symbols"));
            // Add ListItem objects
            list.add(new ListItem("Item1"))
                    .add(new ListItem("Item2"))
                    .add(new ListItem("Item3"));
            // Add the list
            document.add(list);

            document.close();
        } catch (IOException | URISyntaxException e) {
            log.error("error", e);
        }
        return new ByteArrayInputStream(out.toByteArray());
    }

    public static ByteArrayInputStream emptyPages() {

        ByteArrayOutputStream out = new ByteArrayOutputStream();
        PdfWriter writer;
        writer = new PdfWriter(out);
        PdfDocument pdf = new PdfDocument(writer);
        Document document = new Document(pdf);

        PdfPage page1 = pdf.addNewPage();
        PdfPage page2 = pdf.addNewPage();
        PdfPage page3 = pdf.addNewPage();

        document.close();
        return new ByteArrayInputStream(out.toByteArray());
    }

}
