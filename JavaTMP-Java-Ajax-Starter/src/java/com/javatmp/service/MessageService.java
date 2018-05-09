package com.javatmp.service;

import com.javatmp.domain.Content;
import com.javatmp.domain.Message;
import com.javatmp.mvc.Page;
import java.util.LinkedList;
import java.util.List;

public class MessageService {

    private final DBFaker dBFaker;

    public MessageService(DBFaker dBFaker) {
        this.dBFaker = dBFaker;
    }

    public Long getAllCount() {
        return Long.valueOf(this.dBFaker.getMessages().size());
    }

    public List<Message> getContents() {
        return this.dBFaker.getMessages();
    }

    public Message readMessageById(Message message) {
        List<Message> db = this.dBFaker.getMessages();
        for (Message row : db) {
            if (row.getMessageId().equals(message.getMessageId())) {
                return row;
            }
        }
        throw new IllegalArgumentException("Record id [" + message.getMessageId() + "] Not found");
    }

    public Page<Message> listContent(Page<Message> page) {
        List<Message> retList = new LinkedList<>();
        List<Message> db = this.dBFaker.getMessages();
        for (int i = (page.getRequestedPageNum() - 1) * page.getNumOfRowsPerPage();
                i < db.size() && i < (page.getRequestedPageNum()) * page.getNumOfRowsPerPage(); i++) {
            retList.add(db.get(i));
        }
        page.setRecords(retList);

        page.setAllCount(this.getAllCount());

        return page;
    }

}
