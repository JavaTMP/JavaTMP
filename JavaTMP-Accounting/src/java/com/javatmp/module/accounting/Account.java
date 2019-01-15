package com.javatmp.module.accounting;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;

/**
 *
 * @author JavaTMP
 */
@Entity
@Table(name = "account")
public class Account implements Serializable {

    @Transient
    private List<Accounttransaction> accounttransactionList;
    @Transient
    private Accountgroup accountgroup;
    @Transient
    private List<Account> accountList;

    @Column(name = "status")
    private Short status;

    @Transient
    private Account parentAccount;

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long id;

    @Column(name = "accountCode")
    private String accountCode;

    @Column(name = "name")
    private String name;

    @Column(name = "description")
    private String description;

    @Column(name = "debit")
    private BigDecimal debit;

    @Column(name = "credit")
    private BigDecimal credit;

    @Column(name = "balance")
    private BigDecimal balance;

    @Column(name = "creationDate")
    @Temporal(TemporalType.TIMESTAMP)
    private Date creationDate;

    @Column(name = "accountGroup")
    private Integer accountGroup;

    @Column(name = "parentAccountId")
    private Long parentAccountId;

    @Column(name = "cashFlowId")
    private Integer cashFlowId;

    public Account() {
    }

    public Account(Long id) {
        this.id = id;
    }

    public Account(Long id, String accountCode, String name, Date creationDate) {
        this.id = id;
        this.accountCode = accountCode;
        this.name = name;
        this.creationDate = creationDate;
    }

    public Account(Long id, String accountCode, String name, Integer accountGroup) {
        this.id = id;
        this.accountCode = accountCode;
        this.name = name;
        this.accountGroup = accountGroup;
    }

    public Account(Long accountId, String accountCode, String accountName,
            String accountDescription, BigDecimal debit, BigDecimal credit,
            BigDecimal balance, Short status, Date creationDate, Integer accountGroup, Long parentAccountId,
            Integer cashFlowId) {
        this.id = accountId;
        this.accountCode = accountCode;
        this.name = accountName;
        this.description = accountDescription;
        this.debit = debit;
        this.credit = credit;
        this.balance = balance;
        this.status = status;
        this.creationDate = creationDate;
        this.accountGroup = accountGroup;
        this.parentAccountId = parentAccountId;
        this.cashFlowId = cashFlowId;
    }

    public Account(Long id, String accountCode, String name, Long parentAccountId, BigDecimal debit, BigDecimal credit,
            BigDecimal balance, Integer accountGroup, Integer cashFlowId, String accountGroupName, String rootTypeName,
            Integer debitSign, Integer creditSign, Integer reportTypeId) {
        this.id = id;
        this.accountCode = accountCode;
        this.name = name;
        this.parentAccountId = parentAccountId;
        this.debit = debit;
        this.credit = credit;
        this.balance = balance;
        this.accountGroup = accountGroup;
        this.cashFlowId = cashFlowId;

        this.accountgroup = new Accountgroup(accountGroup, accountGroupName);
        Accounttype type = new Accounttype(0, rootTypeName, debitSign, creditSign, reportTypeId);
        this.accountgroup.setType(type);
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getAccountCode() {
        return accountCode;
    }

    public void setAccountCode(String accountCode) {
        this.accountCode = accountCode;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
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

    public Date getCreationDate() {
        return creationDate;
    }

    public void setCreationDate(Date creationDate) {
        this.creationDate = creationDate;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Account)) {
            return false;
        }
        Account other = (Account) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.javatmp.module.accounting.Account[ id=" + id + " ]";
    }

    /**
     * @return the accountType
     */
    public Integer getAccountGroup() {
        return accountGroup;
    }

    /**
     * @param accountGroup the accountGroup to set
     */
    public void setAccountGroup(Integer accountGroup) {
        this.accountGroup = accountGroup;
    }

    public Short getStatus() {
        return status;
    }

    public void setStatus(Short status) {
        this.status = status;
    }

    public List<Accounttransaction> getAccounttransactionList() {
        return accounttransactionList;
    }

    public void setAccounttransactionList(List<Accounttransaction> accounttransactionList) {
        this.accounttransactionList = accounttransactionList;
    }

    public Accountgroup getAccountgroup() {
        return accountgroup;
    }

    public void setAccountgroup(Accountgroup accountgroup) {
        this.accountgroup = accountgroup;
    }

    public List<Account> getAccountList() {
        return accountList;
    }

    public void setAccountList(List<Account> accountList) {
        this.accountList = accountList;
    }

    /**
     * @return the parentAccount
     */
    public Account getParentAccount() {
        return parentAccount;
    }

    /**
     * @param parentAccount the parentAccount to set
     */
    public void setParentAccount(Account parentAccount) {
        this.parentAccount = parentAccount;
    }

    /**
     * @return the parentAccountId
     */
    public Long getParentAccountId() {
        return parentAccountId;
    }

    /**
     * @param parentAccountId the parentAccountId to set
     */
    public void setParentAccountId(Long parentAccountId) {
        this.parentAccountId = parentAccountId;
    }

    /**
     * @return the cashFlowId
     */
    public Integer getCashFlowId() {
        return cashFlowId;
    }

    /**
     * @param cashFlowId the cashFlowId to set
     */
    public void setCashFlowId(Integer cashFlowId) {
        this.cashFlowId = cashFlowId;
    }

}
