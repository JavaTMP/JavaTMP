package com.javatmp.util;

import com.javatmp.module.accounting.service.AccountService;
import com.javatmp.module.activity.ActivityService;
import com.javatmp.module.content.service.ContentService;
import com.javatmp.module.country.CountryService;
import com.javatmp.module.dms.service.DocumentService;
import com.javatmp.module.event.service.EventService;
import com.javatmp.module.language.LanguageService;
import com.javatmp.module.message.service.MessageService;
import com.javatmp.module.stats.controller.UserStatsService;
import com.javatmp.module.theme.ThemeService;
import com.javatmp.module.timezone.TimezoneService;
import com.javatmp.module.user.service.UserService;
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
    private final UserStatsService userStatsService;
    private final ActivityService activityService;
    private final EventService eventService;
    private final MessageService messageService;
    private final ContentService contentService;
    private final AccountService accountService;

    public ServicesFactory(String persistentUnitName) {
        logger.info("*** Start ServicesFactory Constructor @ [" + new Date() + "]");
        this.jpaDaoHelper = new JpaDaoHelper(persistentUnitName);
        this.timezoneService = new TimezoneService(getJpaDaoHelper());
        this.themeService = new ThemeService(getJpaDaoHelper());
        this.languageService = new LanguageService(getJpaDaoHelper());
        this.countryService = new CountryService(getJpaDaoHelper());
        this.documentService = new DocumentService(getJpaDaoHelper());
        this.userService = new UserService(getJpaDaoHelper());
        this.userStatsService = new UserStatsService(getJpaDaoHelper());
        this.activityService = new ActivityService(getJpaDaoHelper());
        this.eventService = new EventService(getJpaDaoHelper());
        this.messageService = new MessageService(this.jpaDaoHelper, userService);
        this.contentService = new ContentService(this.jpaDaoHelper);
        this.accountService = new AccountService(this.jpaDaoHelper);
        this.logger.info("*** End ServicesFactory Constructor @ [" + new Date() + "]");
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

    /**
     * @return the userStatsService
     */
    public UserStatsService getUserStatsService() {
        return userStatsService;
    }

    /**
     * @return the activityService
     */
    public ActivityService getActivityService() {
        return activityService;
    }

    /**
     * @return the eventService
     */
    public EventService getEventService() {
        return eventService;
    }

    /**
     * @return the messageService
     */
    public MessageService getMessageService() {
        return messageService;
    }

    /**
     * @return the contentService
     */
    public ContentService getContentService() {
        return contentService;
    }

    /**
     * @return the jpaDaoHelper
     */
    public JpaDaoHelper getJpaDaoHelper() {
        return jpaDaoHelper;
    }

    /**
     * @return the accountService
     */
    public AccountService getAccountService() {
        return accountService;
    }
}
