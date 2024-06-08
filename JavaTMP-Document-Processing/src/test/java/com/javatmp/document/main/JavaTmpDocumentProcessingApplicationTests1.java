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

    void printWords(String str, int start, int end) {

        int space = str.indexOf(' ');
        int lastSpace = str.lastIndexOf(' ');
        String keyStr = str + "-" + start + "-" + end;
        if(this.cache.contains(keyStr)) {
            return;
        }
        this.cache.add(keyStr);
        this.lines.add(str);

        System.out.println("process = [" + str + "], first [" + space + "], last[" + lastSpace + "]");
        if (space != -1) {
            System.out.println("fw = [" + str.substring(0, space) + "]");
            String fp = str.substring(space + 1);
            printWords(fp, start + space + 1, space + 1 + fp.length());
        }

        if(lastSpace != -1) {
            System.out.println("lw = [" + str.substring(lastSpace + 1) + "]");
            String lp = str.substring(0, lastSpace);
            printWords(lp, start, start + lp.length());
        }

        System.out.println("Finish Processing str [" + start + "][" + end + "][" + str + "]");
    }

    @Test
    void contextLoads() {
        String str = "Crypto mining data center company Compute North is the latest casualty in the ongoing harsh crypto winter that has of late forced some of the biggest crypto companies to close shop";
        this.printWords(str, 0, str.length());
        System.out.println("**** print all ***");
        this.lines.forEach(l -> {
            System.out.println("[" + l + "]");
        });
    }

}
