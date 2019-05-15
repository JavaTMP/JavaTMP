package com.javatmp.module.event;

import com.javatmp.module.content.Content;
import com.javatmp.module.dms.Document;
import com.javatmp.module.message.Message;
import com.javatmp.module.user.User;
import com.javatmp.util.MD5Util;
import java.math.BigDecimal;
import java.util.Calendar;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;
import java.util.Random;
import java.util.concurrent.ThreadLocalRandom;
import java.util.logging.Logger;

public class DBFaker {

    private final Logger logger = Logger.getLogger(getClass().getName());

    private List<Document> documents = new LinkedList<>();

    private static Long counter = 0L;

    public static synchronized Long getNextCounter() {
        return ++counter;
    }

    public DBFaker() {
    }

    /**
     * @return the documents
     */
    public List<Document> getDocuments() {
        return documents;
    }

}
