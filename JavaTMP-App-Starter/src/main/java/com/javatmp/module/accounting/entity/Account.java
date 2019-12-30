package com.javatmp.module.accounting.entity;

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
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 *
 * @author JavaTMP
 */
@Data
@EqualsAndHashCode(onlyExplicitlyIncluded = true)
@Entity
@Table(name = "account")
public class Account implements Serializable {

    private static final long serialVersionUID = 1L;

    @EqualsAndHashCode.Include
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
    private Integer accountGroupId;
    @Column(name = "parentAccountId")
    private Long parentAccountId;
    @Column(name = "cashFlowId")
    private Integer cashFlowId;
    @Column(name = "status")
    private Short status;
    @Transient
    private List<AccountTransaction> accounttransactionList;
    @Transient
    private AccountGroup accountGroup;
    @Transient
    private List<Account> accountList;
    @Transient
    private Account parentAccount;

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

    public Account(Long id, String accountCode, String name, Integer accountGroupId) {
        this.id = id;
        this.accountCode = accountCode;
        this.name = name;
        this.accountGroupId = accountGroupId;
    }

    public Account(Long accountId, String accountCode, String accountName,
            String accountDescription, BigDecimal debit, BigDecimal credit,
            BigDecimal balance, Short status, Date creationDate, Integer accountGroupId, Long parentAccountId,
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
        this.accountGroupId = accountGroupId;
        this.parentAccountId = parentAccountId;
        this.cashFlowId = cashFlowId;
    }

    public Account(Long id, String accountCode, String name, Long parentAccountId, BigDecimal debit, BigDecimal credit,
            BigDecimal balance, Integer accountGroupId, Integer cashFlowId, String accountGroupName, String rootTypeName,
            Integer debitSign, Integer creditSign, Integer reportTypeId) {
        this.id = id;
        this.accountCode = accountCode;
        this.name = name;
        this.parentAccountId = parentAccountId;
        this.debit = debit;
        this.credit = credit;
        this.balance = balance;
        this.accountGroupId = accountGroupId;
        this.cashFlowId = cashFlowId;

        this.accountGroup = new AccountGroup(accountGroupId, accountGroupName);
        AccountType type = new AccountType(0, rootTypeName, debitSign, creditSign, reportTypeId);
        this.accountGroup.setType(type);
    }
}
