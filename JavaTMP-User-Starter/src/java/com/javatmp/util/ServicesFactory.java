package com.javatmp.util;

import com.javatmp.module.timezone.TimezoneService;
import com.javatmp.module.activity.ActivityService;
import com.javatmp.module.content.ContentService;
import com.javatmp.module.theme.ThemeService;
import com.javatmp.module.language.LanguageService;
import com.javatmp.module.country.CountryService;
import com.javatmp.module.user.UserService;
import com.javatmp.module.stats.UserStatsService;
import com.javatmp.module.dms.DocumentService;
import com.javatmp.module.event.DBFaker;
import com.javatmp.module.event.DiaryEventService;
import com.javatmp.module.message.MessageService;
import java.util.Date;
import java.util.logging.Logger;

public class ServicesFactory {

    private static final Logger logger = Logger.getLogger(ServicesFactory.class.getName());
    private final JpaDaoHelper jpaDaoHelper;
    private final DBFaker dBFaker;
    private final TimezoneService timezoneService;
    private final ThemeService themeService;
    private final LanguageService languageService;
    private final CountryService countryService;
    private final UserService userService;
    private final DocumentService documentService;
    private final UserStatsService userStatsService;
    private final ActivityService activityService;
    private final DiaryEventService diaryEventService;
    private final MessageService messageService;
    private final ContentService contentService;

    public ServicesFactory(String persistentUnitName) {
        logger.info("*** Start ServicesFactory Constructor @ [" + new Date() + "]");
        this.jpaDaoHelper = new JpaDaoHelper(persistentUnitName);
        this.dBFaker = new DBFaker();
        this.timezoneService = new TimezoneService(getJpaDaoHelper());
        this.themeService = new ThemeService(getJpaDaoHelper());
        this.languageService = new LanguageService(getJpaDaoHelper());
        this.countryService = new CountryService(getJpaDaoHelper());
        this.documentService = new DocumentService(dBFaker, getJpaDaoHelper());
        this.userService = new UserService(this.dBFaker, getJpaDaoHelper());
        this.userStatsService = new UserStatsService(getJpaDaoHelper());
        this.activityService = new ActivityService(getJpaDaoHelper());
        this.diaryEventService = new DiaryEventService(this.dBFaker, getJpaDaoHelper());
        this.messageService = new MessageService(dBFaker, userService);
        this.contentService = new ContentService(dBFaker);
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
     * @return the diaryEventService
     */
    public DiaryEventService getDiaryEventService() {
        return diaryEventService;
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
}
