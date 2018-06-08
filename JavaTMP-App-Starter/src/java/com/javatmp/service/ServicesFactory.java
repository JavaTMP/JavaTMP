package com.javatmp.service;

import java.util.Date;
import java.util.logging.Logger;

public class ServicesFactory {

    private final Logger logger = Logger.getLogger(getClass().getName());
    private DBFaker dbFaker;
    private UserService userService;
    private DocumentService documentService;

    public ServicesFactory() {
        logger.info("*** Start ServicesFactory Constructor @ [" + new Date() + "]");
        this.dbFaker = new DBFaker();
        this.userService = new UserService(this.dbFaker);
        this.documentService = new DocumentService(dbFaker);
        logger.info("*** End ServicesFactory Constructor @ [" + new Date() + "]");
    }

    public void destroy() {
        this.userService = null;
        this.dbFaker = null;
    }

    public UserService getUserService() {
        return userService;
    }

    public DocumentService getDocumentService() {
        return documentService;
    }
}
