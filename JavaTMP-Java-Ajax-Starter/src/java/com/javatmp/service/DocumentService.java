/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.javatmp.service;

import com.javatmp.domain.DiaryEvent;
import com.javatmp.domain.Document;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.concurrent.ThreadLocalRandom;

/**
 *
 * @author m_dar
 */
public class DocumentService {

    private DBFaker dBFaker;

    public DocumentService(DBFaker dBFaker) {
        this.dBFaker = dBFaker;
    }

    public Document createNewDocument(Document document) {
        document.documentId = DBFaker.getNextCounter();
        this.dBFaker.getDocuments().add(document);
        return document;
    }

}
