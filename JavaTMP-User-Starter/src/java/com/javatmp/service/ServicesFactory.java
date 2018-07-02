package com.javatmp.service;

import java.util.Date;
import java.util.logging.Logger;

public class ServicesFactory {

    private static final Logger logger = Logger.getLogger(ServicesFactory.class.getName());
    private final DBFaker dbFaker;
    private final JpaDaoHelper jpaDaoHelper;
    private final TimezoneService timezoneService;
    private final ThemeService themeService;
    private final LanguageService languageService;
    private final CountryService countryService;
    private final UserService userService;
    private final DocumentService documentService;

    public ServicesFactory(String persistentUnitName) {
        logger.info("*** Start ServicesFactory Constructor @ [" + new Date() + "]");
        this.dbFaker = new DBFaker();
        this.jpaDaoHelper = new JpaDaoHelper(persistentUnitName);
        this.timezoneService = new TimezoneService(dbFaker);
        this.themeService = new ThemeService(dbFaker);
        this.languageService = new LanguageService(dbFaker);
        this.countryService = new CountryService(dbFaker);
        this.documentService = new DocumentService(dbFaker, jpaDaoHelper);
        this.userService = new UserService(this.dbFaker, jpaDaoHelper, this.documentService);

        logger.info("*** End ServicesFactory Constructor @ [" + new Date() + "]");
    }

    public void destroy() {

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
