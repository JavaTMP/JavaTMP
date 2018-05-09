package com.javatmp.service;

import com.javatmp.domain.Content;
import com.javatmp.mvc.Page;
import java.util.LinkedList;
import java.util.List;

public class MessageService {

    private final DBFaker dBFaker;

    public MessageService(DBFaker dBFaker) {
        this.dBFaker = dBFaker;
    }

    public Long getAllCount() {
        return Long.valueOf(this.dBFaker.getContents().size());
    }

    public List<Content> getContents() {
        return this.dBFaker.getContents();
    }

    public Boolean updateContentText(Content content) {
        Boolean updatedStatus = false;
        List<Content> db = this.dBFaker.getContents();
        for (Content row : db) {
            if (row.getContentId().equals(content.getContentId())) {
                row.setContentText(content.getContentText());
                updatedStatus = true;
            }
        }
        return updatedStatus;
    }

    public Content readContentById(Content content) {
        List<Content> db = this.dBFaker.getContents();
        for (Content row : db) {
            if (row.getContentId().equals(content.getContentId())) {
                return row;
            }
        }
        throw new IllegalArgumentException("Record id [" + content.getContentId() + "] Not found");
    }

    public Page<Content> listContent(Page<Content> page) {
        List<Content> retList = new LinkedList<>();
        List<Content> db = this.dBFaker.getContents();
        for (int i = (page.getRequestedPageNum() - 1) * page.getNumOfRowsPerPage();
                i < db.size() && i < (page.getRequestedPageNum()) * page.getNumOfRowsPerPage(); i++) {
            retList.add(db.get(i));
        }
        page.setRecords(retList);

        page.setAllCount(this.getAllCount());

        return page;
    }

}
