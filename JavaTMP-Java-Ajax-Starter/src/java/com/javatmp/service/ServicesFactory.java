package com.javatmp.service;

import java.util.Date;
import java.util.logging.Logger;

public class ServicesFactory {

    private final Logger logger = Logger.getLogger(getClass().getName());
    private DBFaker dbFaker;
    private UserService userService;
    private AccountService accountService;
    private DiaryEventService diaryEventService;
    private DocumentService documentService;
    private CountryService countryService;
    private ContentService contentService;
    private MessageService messageService;

    public ServicesFactory() {
        logger.info("*** Start ServicesFactory Constructor @ [" + new Date() + "]");
        this.dbFaker = new DBFaker();
        this.userService = new UserService(this.dbFaker);
        this.accountService = new AccountService(dbFaker);
        this.diaryEventService = new DiaryEventService(dbFaker);
        this.documentService = new DocumentService(dbFaker);
        this.countryService = new CountryService(dbFaker);
        this.contentService = new ContentService(dbFaker);
        this.messageService = new MessageService(dbFaker, this.userService);
        logger.info("*** End ServicesFactory Constructor @ [" + new Date() + "]");
    }

    public void destroy() {
        this.documentService = null;
        this.diaryEventService = null;
        this.accountService = null;
        this.userService = null;
        this.countryService = null;
        this.contentService = null;
        this.dbFaker = null;
    }

    /**
     * @return the userService
     */
    public UserService getUserService() {
        return userService;
    }

    /**
     * @return the accountService
     */
    public AccountService getAccountService() {
        return accountService;
    }

    /**
     * @return the diaryEventService
     */
    public DiaryEventService getDiaryEventService() {
        return diaryEventService;
    }

    /**
     * @return the documentService
     */
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
     * @return the contentService
     */
    public ContentService getContentService() {
        return contentService;
    }

    /**
     * @return the messageService
     */
    public MessageService getMessageService() {
        return messageService;
    }

    /**
     * @param messageService the messageService to set
     */
    public void setMessageService(MessageService messageService) {
        this.messageService = messageService;
    }
}
