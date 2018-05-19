package com.javatmp.service;

import com.javatmp.domain.Content;
import com.javatmp.mvc.domain.table.DataTableRequest;
import com.javatmp.mvc.domain.table.DataTableResults;
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

    public DataTableResults<Content> listContent(DataTableRequest page) {
        List<Content> retList = new LinkedList<>();
        List<Content> db = this.dBFaker.getContents();
        for (int i = page.getStart();
                i < db.size() && i < (page.getStart() + page.getLength()); i++) {
            retList.add(db.get(i));
        }
        DataTableResults<Content> dataTableResult = new DataTableResults<>();
        dataTableResult.setData(retList);
        dataTableResult.setRecordsTotal(Long.valueOf(db.size()));
        dataTableResult.setRecordsFiltered(Long.valueOf(db.size()));
        dataTableResult.setDraw(page.getDraw());

        return dataTableResult;
    }

}
