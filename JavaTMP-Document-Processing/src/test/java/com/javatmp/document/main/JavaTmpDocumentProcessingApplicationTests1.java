package com.javatmp.document.main;

import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.HashSet;
import java.util.LinkedList;
import java.util.List;
import java.util.Set;

@SpringBootTest
class JavaTmpDocumentProcessingApplicationTests1 {

    List<String> lines = new LinkedList<>();

    Set<String> cache = new HashSet<>();

    void printWords(String str) {

        int space = str.indexOf(' ');
        int lastSpace = str.lastIndexOf(' ');

        this.lines.add(str);

        System.out.println("process = [" + str + "], first [" + space + "], last[" + lastSpace + "]");
        if (space != -1) {
            System.out.println("fw = [" + str.substring(0, space) + "]");
            printWords(str.substring(space + 1));
        }

        if(lastSpace != -1) {
            System.out.println("lw = [" + str.substring(lastSpace + 1) + "]");
            printWords(str.substring(0, lastSpace));
        }

        System.out.println("Finish Processing str [" + str + "]");
    }

    @Test
    void contextLoads() {
        this.printWords("mohamed darim wasif sulibi bomb");
        System.out.println("**** print all ***");
        this.lines.forEach(l -> {
            System.out.println("[" + l + "]");
        });
    }

}
