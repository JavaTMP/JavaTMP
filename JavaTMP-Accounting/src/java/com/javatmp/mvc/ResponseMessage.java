/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.javatmp.mvc;

/**
 *
 * @author user
 */
public class ResponseMessage {
    
    
    private String overAllStatus;
    private String message;    
    private Integer statusCode;
    
    public ResponseMessage(String overAllStatus, String message, Integer statusCode) {
        this.overAllStatus = overAllStatus;
        this.message = message;
        this.statusCode = statusCode;
    }
    
    public ResponseMessage(String overAllStatus, Integer statusCode) {
        this.overAllStatus = overAllStatus;
        this.message = null;
        this.statusCode = statusCode;
    }
    
    /**
     * @return the overAllStatus
     */
    public String getOverAllStatus() {
        return overAllStatus;
    }

    /**
     * @param overAllStatus the overAllStatus to set
     */
    public void setOverAllStatus(String overAllStatus) {
        this.overAllStatus = overAllStatus;
    }

    /**
     * @return the message
     */
    public String getMessage() {
        return message;
    }

    /**
     * @param message the message to set
     */
    public void setMessage(String message) {
        this.message = message;
    }

    /**
     * @return the statusCode
     */
    public Integer getStatusCode() {
        return statusCode;
    }

    /**
     * @param statusCode the statusCode to set
     */
    public void setStatusCode(Integer statusCode) {
        this.statusCode = statusCode;
    }
    
}
