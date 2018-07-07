package com.javatmp.service;

import com.javatmp.db.JpaDaoHelper;
import java.util.Date;
import java.util.logging.Logger;

public class ServicesFactory {

    private static final Logger logger = Logger.getLogger(ServicesFactory.class.getName());
    private final JpaDaoHelper jpaDaoHelper;
    private final TimezoneService timezoneService;
    private final ThemeService themeService;
    private final LanguageService languageService;
    private final CountryService countryService;
    private final UserService userService;
    private final DocumentService documentService;

    public ServicesFactory(String persistentUnitName) {
        logger.info("*** Start ServicesFactory Constructor @ [" + new Date() + "]");
        this.jpaDaoHelper = new JpaDaoHelper(persistentUnitName);
        this.timezoneService = new TimezoneService(jpaDaoHelper);
        this.themeService = new ThemeService(jpaDaoHelper);
        this.languageService = new LanguageService(jpaDaoHelper);
        this.countryService = new CountryService(jpaDaoHelper);
        this.documentService = new DocumentService(jpaDaoHelper);
        this.userService = new UserService(jpaDaoHelper);

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
