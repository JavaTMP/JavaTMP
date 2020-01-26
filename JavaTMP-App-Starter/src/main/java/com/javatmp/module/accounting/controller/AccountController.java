package com.javatmp.module.accounting.controller;

import com.javatmp.fw.domain.ResponseMessage;
import com.javatmp.fw.domain.table.DataTableRequest;
import com.javatmp.fw.domain.table.DataTableResults;
import com.javatmp.module.accounting.entity.Account;
import com.javatmp.module.accounting.entity.Transaction;
import com.javatmp.module.accounting.entity.TransactionEntry;
import com.javatmp.module.accounting.service.AccountService;
import com.javatmp.module.accounting.service.TransactionEntryService;
import com.javatmp.module.accounting.service.TransactionService;
import java.text.ParseException;
import java.util.Date;
import java.util.List;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

@Slf4j
@RestController
public class AccountController {

    @Autowired
    AccountService accountService;

    @Autowired
    TransactionService transactionService;

    @Autowired
    TransactionEntryService transactionEntryService;

    @PostMapping("/accounting/AccountLedger")
    public DataTableResults<Account> AccountLedger(@RequestBody DataTableRequest tableRequest) {
        List<Account> generalLedgerAccounts = accountService.getGeneralLedgerAccounts();
        DataTableResults<Account> dataTableResult = new DataTableResults<>();
        dataTableResult.setData(generalLedgerAccounts);
        dataTableResult.setRecordsTotal(Long.valueOf(generalLedgerAccounts.size()));
        dataTableResult.setRecordsFiltered(Long.valueOf(generalLedgerAccounts.size()));
        dataTableResult.setDraw(tableRequest.getDraw());
        return dataTableResult;

    }

    @PostMapping(value = "/accounting/chartOfAccounts")
    public List<Account> chartOfAccounts() {
        List<Account> chartOfAccounts = accountService.getChartOfAccounts();
        return chartOfAccounts;
    }

    @PostMapping(value = "/accounting/AddNewAccountPopup")
    public ResponseMessage AddNewAccountPopup(Account accountToBeCreated, ResponseMessage responseMessage) {

        log.info("Account to be created is [" + (accountToBeCreated) + "]");
        accountService.save(accountToBeCreated);
        responseMessage.setOverAllStatus(true);
        responseMessage.setMessage("Account created successfully");
        responseMessage.setData(accountToBeCreated);

        return responseMessage;
    }

    @PostMapping("/accounting/DeleteAccountController")
    public ResponseMessage DeleteAccountController(@RequestBody Account accountToBeDeleted, ResponseMessage responseMessage) {

        log.info("Account to be deleted is [" + (accountToBeDeleted) + "]");

        int updateStatus = this.accountService.deleteAccount(accountToBeDeleted);

        responseMessage.setOverAllStatus(true);
        responseMessage.setTitle("Accounting Deleted");
        responseMessage.setMessage("Account deleted successfully with status " + updateStatus);
        responseMessage.setData(accountToBeDeleted);

        return responseMessage;
    }

    @PostMapping("/accounting/ListEntries")
    public DataTableResults<TransactionEntry> ListEntries(@RequestBody DataTableRequest tableRequest) throws ParseException {

        DataTableResults<TransactionEntry> dataTableResult = transactionEntryService.listAllTransactionEntry(tableRequest);
        return dataTableResult;
    }

    @PostMapping("/accounting/listTransactions")
    public DataTableResults<Transaction> listTransactions(@RequestBody DataTableRequest tableRequest) throws ParseException {

        DataTableResults<Transaction> dataTableResult = transactionService.listAllTransactions(tableRequest);
        return dataTableResult;
    }

    @PostMapping(value = "/accounting/UpdateAccountPopup")
    public ResponseMessage UpdateAccountPopup(Account accountToBeUpdated, ResponseMessage responseMessage) {

        log.info("account to be Updated is [" + (accountToBeUpdated) + "]");
        int updateStatus = accountService.updateAccount(accountToBeUpdated);
        responseMessage.setOverAllStatus(Boolean.TRUE);
        responseMessage.setMessage("Account Updated successfully");
        responseMessage.setData(accountToBeUpdated);
        return responseMessage;

    }

    @PostMapping("/accounting/ViewBalanceSheet")
    public List<Account> ViewBalanceSheet() {

        List<Account> chartOfAccounts = accountService.getChartOfAccountsReport(1);
        return chartOfAccounts;
    }

    @PostMapping("/accounting/GeneralLedger")
    public DataTableResults<Account> GeneralLedger(@RequestBody DataTableRequest tableRequest) {

        List<Account> generalLedgerAccounts = accountService.getGeneralLedgerAccounts();
        DataTableResults<Account> dataTableResult = new DataTableResults<>();

        dataTableResult.setData(generalLedgerAccounts);
        dataTableResult.setRecordsTotal(Long.valueOf(generalLedgerAccounts.size()));
        dataTableResult.setRecordsFiltered(Long.valueOf(generalLedgerAccounts.size()));
        dataTableResult.setDraw(tableRequest.getDraw());
        return dataTableResult;

    }

    @PostMapping("/accounting/ViewProfitLossIncome")
    public List<Account> ViewProfitLossIncome() {
        List<Account> chartOfAccounts = accountService.getChartOfAccountsReport(2);
        return chartOfAccounts;

    }

    @PostMapping("/accounting/CreateTransaction")
    public ResponseMessage CreateTransaction(@RequestBody Transaction toBe, ResponseMessage responseMessage) {

        log.info("Transaction to be Created [" + (toBe) + "]");
        toBe.setCreationDate(new Date());
        toBe.setStatus((short) 1);
        accountService.createNewTransaction(toBe);
        responseMessage.setOverAllStatus(true);
        responseMessage.setTitle("Success Creation");
        responseMessage.setMessage("Transaction created successfully");
        responseMessage.setData(toBe);
        return responseMessage;
    }
}
