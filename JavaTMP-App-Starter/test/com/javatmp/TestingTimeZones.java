/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.javatmp;

import java.util.TimeZone;

/**
 *
 * @author JavaTMP
 */
public class TestingTimeZones {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        for (String id : TimeZone.getAvailableIDs()) {
            System.out.println(id);
            System.out.println(TimeZone.getTimeZone(id).getDisplayName());
        }
    }

}
