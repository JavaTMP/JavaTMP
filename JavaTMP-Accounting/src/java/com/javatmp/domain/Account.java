/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.javatmp.domain;

import java.math.BigDecimal;

/**
 *
 * @author m_dar
 */
public class Account {

    private Long accountId;
    private String accountCode;
    private String accountName;
    private String accountDescription;
    private BigDecimal debit;
    private BigDecimal credit;
    private BigDecimal balance;
    private Integer accountType;
    private Long parentAccount;
    private Integer accountStatus;

    /**
     * @return the accountId
     */
    public Long getAccountId() {
        return accountId;
    }

    /**
     * @param accountId the accountId to set
     */
    public void setAccountId(Long accountId) {
        this.accountId = accountId;
    }

    /**
     * @return the accountCode
     */
    public String getAccountCode() {
        return accountCode;
    }

    /**
     * @param accountCode the accountCode to set
     */
    public void setAccountCode(String accountCode) {
        this.accountCode = accountCode;
    }

    /**
     * @return the accountName
     */
    public String getAccountName() {
        return accountName;
    }

    /**
     * @param accountName the accountName to set
     */
    public void setAccountName(String accountName) {
        this.accountName = accountName;
    }

    /**
     * @return the debit
     */
    public BigDecimal getDebit() {
        return debit;
    }

    /**
     * @param debit the debit to set
     */
    public void setDebit(BigDecimal debit) {
        this.debit = debit;
    }

    /**
     * @return the credit
     */
    public BigDecimal getCredit() {
        return credit;
    }

    /**
     * @param credit the credit to set
     */
    public void setCredit(BigDecimal credit) {
        this.credit = credit;
    }

    /**
     * @return the balance
     */
    public BigDecimal getBalance() {
        return balance;
    }

    /**
     * @param balance the balance to set
     */
    public void setBalance(BigDecimal balance) {
        this.balance = balance;
    }

    /**
     * @return the accountType
     */
    public Integer getAccountType() {
        return accountType;
    }

    /**
     * @param accountType the accountType to set
     */
    public void setAccountType(Integer accountType) {
        this.accountType = accountType;
    }

    /**
     * @return the parentAccount
     */
    public Long getParentAccount() {
        return parentAccount;
    }

    /**
     * @param parentAccount the parentAccount to set
     */
    public void setParentAccount(Long parentAccount) {
        this.parentAccount = parentAccount;
    }

    /**
     * @return the accountStatus
     */
    public Integer getAccountStatus() {
        return accountStatus;
    }

    /**
     * @param accountStatus the accountStatus to set
     */
    public void setAccountStatus(Integer accountStatus) {
        this.accountStatus = accountStatus;
    }

    /**
     * @return the accountDescription
     */
    public String getAccountDescription() {
        return accountDescription;
    }

    /**
     * @param accountDescription the accountDescription to set
     */
    public void setAccountDescription(String accountDescription) {
        this.accountDescription = accountDescription;
    }

}
