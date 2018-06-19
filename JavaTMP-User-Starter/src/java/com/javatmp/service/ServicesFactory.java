package com.javatmp.service;

import java.util.Date;
import java.util.logging.Logger;

public class ServicesFactory {

    private final Logger logger = Logger.getLogger(getClass().getName());
    private DBFaker dbFaker;
    private CountryService countryService;
    private UserService userService;
    private DocumentService documentService;

    public ServicesFactory() {
        logger.info("*** Start ServicesFactory Constructor @ [" + new Date() + "]");
        this.dbFaker = new DBFaker();
        this.countryService = new CountryService(dbFaker);
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

    /**
     * @return the countryService
     */
    public CountryService getCountryService() {
        return countryService;
    }

    /**
     * @param countryService the countryService to set
     */
    public void setCountryService(CountryService countryService) {
        this.countryService = countryService;
    }
}
