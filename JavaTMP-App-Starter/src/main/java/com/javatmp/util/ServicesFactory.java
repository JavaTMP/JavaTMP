package com.javatmp.util;

import com.javatmp.module.accounting.service.AccountGroupService;
import com.javatmp.module.accounting.service.AccountService;
import com.javatmp.module.accounting.service.TransactionEntryService;
import com.javatmp.module.accounting.service.TransactionService;
import com.javatmp.module.activity.ActivityService;
import com.javatmp.module.content.service.ContentService;
import com.javatmp.module.country.service.CountryService;
import com.javatmp.module.dms.service.DocumentService;
import com.javatmp.module.event.service.EventService;
import com.javatmp.module.language.service.LanguageService;
import com.javatmp.module.message.service.MessageService;
import com.javatmp.module.stats.controller.UserStatsService;
import com.javatmp.module.theme.service.ThemeService;
import com.javatmp.module.timezone.service.TimezoneService;
import com.javatmp.module.user.service.UserService;
import java.util.Date;
import java.util.logging.Logger;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import lombok.Getter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Getter
@Service
public class ServicesFactory {

    private static final Logger logger = Logger.getLogger(ServicesFactory.class.getName());
    private final TimezoneService timezoneService;
    private final ThemeService themeService;
    private final LanguageService languageService;
    private final CountryService countryService;
    private final UserService userService;
    private final DocumentService documentService;
    private final UserStatsService userStatsService;
    @Autowired
    private ActivityService activityService;
    private final EventService eventService;
    private final MessageService messageService;
    private final ContentService contentService;
    private final AccountService accountService;
    private final TransactionService transactionService;
    private final AccountGroupService accountGroupService;
    private final TransactionEntryService transactionEntryService;

    public ServicesFactory() {
    }

    public ServicesFactory(String persistentUnitName) {
        this(Persistence.createEntityManagerFactory(persistentUnitName));
    }

    public ServicesFactory(EntityManagerFactory emf) {
        logger.info("*** Start ServicesFactory Constructor @ [" + new Date() + "]");
        this.timezoneService = new TimezoneService(emf);
        this.themeService = new ThemeService(emf);
        this.languageService = new LanguageService(emf);
        this.countryService = new CountryService(emf);
        this.documentService = new DocumentService(emf);
        this.userService = new UserService(emf);
        this.userStatsService = new UserStatsService(emf);
//        this.activityService = new ActivityService(emf);
        this.eventService = new EventService(emf);
        this.messageService = new MessageService(emf, userService);
        this.contentService = new ContentService(emf);
        this.accountService = new AccountService(emf);
        this.transactionService = new TransactionService(emf);
        this.accountGroupService = new AccountGroupService(emf);
        this.transactionEntryService = new TransactionEntryService(emf);
        this.logger.info("*** End ServicesFactory Constructor @ [" + new Date() + "]");
    }

    public void destroy() {

    }
}
