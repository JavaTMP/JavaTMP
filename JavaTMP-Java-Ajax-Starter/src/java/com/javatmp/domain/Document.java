/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.javatmp.domain;

import java.util.Date;

/**
 *
 * @author Mohamed
 */
public class Document {

    public Long documentId;
    public String documentName;
    public long documentSize;
    public String contentType;
    public byte[] documentContent;
    public Date creationDate;
    public Long randomHash;

}
