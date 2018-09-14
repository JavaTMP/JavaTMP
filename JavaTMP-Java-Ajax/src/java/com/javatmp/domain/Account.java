package com.javatmp.domain;

import java.math.BigDecimal;
import java.util.List;

public class Account {

    private Long accountId;
    private String accountCode;
    private String accountName;
    private String accountDescription;
    private BigDecimal debit;
    private BigDecimal credit;
    private BigDecimal balance;
    private Integer accountType;
    private Long parentAccountId;
    private Account parentAccount;
    private Integer accountStatus;
    private List<Account> children;

    public Account(Long accountId, String accountCode, String accountName,
            String accountDescription, BigDecimal debit, BigDecimal credit,
            BigDecimal balance, Integer accountType, Long parentAccountId,
            Account parentAccount, Integer accountStatus, List<Account> children) {
        this.accountId = accountId;
        this.accountCode = accountCode;
        this.accountName = accountName;
        this.accountDescription = accountDescription;
        this.debit = debit;
        this.credit = credit;
        this.balance = balance;
        this.accountType = accountType;
        this.parentAccountId = parentAccountId;
        this.parentAccount = parentAccount;
        this.accountStatus = accountStatus;
        this.children = children;
    }

    public Long getAccountId() {
        return accountId;
    }

    public void setAccountId(Long accountId) {
        this.accountId = accountId;
    }

    public String getAccountCode() {
        return accountCode;
    }

    public void setAccountCode(String accountCode) {
        this.accountCode = accountCode;
    }

    public String getAccountName() {
        return accountName;
    }

    public void setAccountName(String accountName) {
        this.accountName = accountName;
    }

    public BigDecimal getDebit() {
        return debit;
    }

    public void setDebit(BigDecimal debit) {
        this.debit = debit;
    }

    public BigDecimal getCredit() {
        return credit;
    }

    public void setCredit(BigDecimal credit) {
        this.credit = credit;
    }

    public BigDecimal getBalance() {
        return balance;
    }

    public void setBalance(BigDecimal balance) {
        this.balance = balance;
    }

    public Integer getAccountType() {
        return accountType;
    }

    public void setAccountType(Integer accountType) {
        this.accountType = accountType;
    }

    public Long getParentAccountId() {
        return parentAccountId;
    }

    public void setParentAccountId(Long parentAccountId) {
        this.parentAccountId = parentAccountId;
    }

    public Integer getAccountStatus() {
        return accountStatus;
    }

    public void setAccountStatus(Integer accountStatus) {
        this.accountStatus = accountStatus;
    }

    public String getAccountDescription() {
        return accountDescription;
    }

    public void setAccountDescription(String accountDescription) {
        this.accountDescription = accountDescription;
    }

    public Account getParentAccount() {
        return parentAccount;
    }

    public void setParentAccount(Account parentAccount) {
        this.parentAccount = parentAccount;
    }

    /**
     * @return the children
     */
    public List<Account> getChildren() {
        return children;
    }

    /**
     * @param children the children to set
     */
    public void setChildren(List<Account> children) {
        this.children = children;
    }

}
