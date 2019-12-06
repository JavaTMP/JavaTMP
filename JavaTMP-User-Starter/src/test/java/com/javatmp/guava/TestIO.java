/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.javatmp.guava;

import com.google.common.io.Files;
import java.io.File;
import java.io.IOException;

/**
 *
 * @author Mohamed
 */
public class TestIO {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) throws IOException {
        byte[] data = Files.toByteArray(new File("C:\\Users\\Mohamed\\output.txt"));
        System.out.println("file lenght [" + data.length + "]");

    }

}
