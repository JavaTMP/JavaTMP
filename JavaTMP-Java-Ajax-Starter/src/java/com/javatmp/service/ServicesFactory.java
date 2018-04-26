package com.javatmp.service;

public class ServicesFactory {

    private DBFaker dbFaker;
    private UserService userService;
    private AccountService accountService;
    private DiaryEventService diaryEventService;
    private DocumentService documentService;

    public ServicesFactory() {
        this.dbFaker = new DBFaker();
        this.userService = new UserService(this.dbFaker);
        this.accountService = new AccountService(dbFaker);
        this.diaryEventService = new DiaryEventService(dbFaker);
        this.documentService = new DocumentService(dbFaker);
    }

    public void destroy() {
        this.documentService = null;
        this.diaryEventService = null;
        this.accountService = null;
        this.userService = null;
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
}
