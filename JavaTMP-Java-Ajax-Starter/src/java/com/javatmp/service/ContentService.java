package com.javatmp.service;

import com.javatmp.domain.Content;
import java.util.LinkedList;
import java.util.List;

public class ContentService {

    private final DBFaker dBFaker;

    public ContentService(DBFaker dBFaker) {
        this.dBFaker = dBFaker;
    }

    public Long getAllCount() {
        return Long.valueOf(this.dBFaker.getContents().size());
    }

    public List<Content> getContents() {
        return this.dBFaker.getContents();
    }
}
