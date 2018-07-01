package com.javatmp.service;

import java.util.Date;
import java.util.logging.Logger;

public class ServicesFactory {

    private final Logger logger = Logger.getLogger(getClass().getName());
    private DBFaker dbFaker;
    private JpaDaoHelper jpaDaoHelper;

    private TimezoneService timezoneService;
    private ThemeService themeService;
    private LanguageService languageService;
    private CountryService countryService;
    private UserService userService;
    private DocumentService documentService;

    public ServicesFactory(String persistentUnitName) {
        logger.info("*** Start ServicesFactory Constructor @ [" + new Date() + "]");
        this.dbFaker = new DBFaker();
        this.jpaDaoHelper = new JpaDaoHelper(persistentUnitName);
        this.timezoneService = new TimezoneService(dbFaker);
        this.themeService = new ThemeService(dbFaker);
        this.languageService = new LanguageService(dbFaker);
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
     * @return the languageService
     */
    public LanguageService getLanguageService() {
        return languageService;
    }

    /**
     * @return the themeService
     */
    public ThemeService getThemeService() {
        return themeService;
    }

    /**
     * @return the timezoneService
     */
    public TimezoneService getTimezoneService() {
        return timezoneService;
    }
}
