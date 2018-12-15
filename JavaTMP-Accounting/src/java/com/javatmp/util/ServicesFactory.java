package com.javatmp.util;

import com.javatmp.module.accounting.AccountService;
import com.javatmp.module.timezone.TimezoneService;
import com.javatmp.module.activity.ActivityService;
import com.javatmp.module.theme.ThemeService;
import com.javatmp.module.language.LanguageService;
import com.javatmp.module.country.CountryService;
import com.javatmp.module.customer.CustomerService;
import com.javatmp.module.user.UserService;
import com.javatmp.module.stats.UserStatsService;
import com.javatmp.module.dms.DocumentService;
import com.javatmp.module.employee.EmployeeService;
import com.javatmp.module.fixedAsset.FixedAssetService;
import com.javatmp.module.inventory.InventoryService;
import com.javatmp.module.supplier.SupplierService;
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
    private final AccountService accountService;
    private final CustomerService customerService;
    private final SupplierService supplierService;
    private final EmployeeService employeeService;
    private final FixedAssetService fixedAssetService;
    private final InventoryService inventoryService;

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
        this.accountService = new AccountService(getJpaDaoHelper());
        this.customerService = new CustomerService(getJpaDaoHelper());
        this.supplierService = new SupplierService(getJpaDaoHelper());
        this.employeeService = new EmployeeService(getJpaDaoHelper());
        this.fixedAssetService = new FixedAssetService(getJpaDaoHelper());
        this.inventoryService = new InventoryService(getJpaDaoHelper());

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
     * @return the accountService
     */
    public AccountService getAccountService() {
        return accountService;
    }

    /**
     * @return the customerService
     */
    public CustomerService getCustomerService() {
        return customerService;
    }

    /**
     * @return the supplierService
     */
    public SupplierService getSupplierService() {
        return supplierService;
    }

    /**
     * @return the employeeService
     */
    public EmployeeService getEmployeeService() {
        return employeeService;
    }

    /**
     * @return the fixedAssetService
     */
    public FixedAssetService getFixedAssetService() {
        return fixedAssetService;
    }

    /**
     * @return the inventoryService
     */
    public InventoryService getInventoryService() {
        return inventoryService;
    }

    /**
     * @return the jpaDaoHelper
     */
    public JpaDaoHelper getJpaDaoHelper() {
        return jpaDaoHelper;
    }
}
