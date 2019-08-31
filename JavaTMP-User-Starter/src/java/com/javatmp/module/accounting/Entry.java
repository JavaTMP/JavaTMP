package com.javatmp.module.accounting;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 *
 * @author JavaTMP
 */
@Entity
@Table(name = "Entry")
public class Entry implements Serializable {

    private static final long serialVersionUID = 1L;
    @Column(name = "id")
    @Id
    private Long id;

    @Column(name = "transactionId")
    private Long transactionId;

    @Column(name = "moduleId")
    private Long moduleId;

    @Column(name = "moduleTypeId")
    private Integer moduleTypeId;

    @Column(name = "moduleRefId")
    private Long moduleRefId;

    @Column(name = "accountId")
    private Long accountId;

    @Column(name = "description")
    private String description;

    @Column(name = "status")
    private Short status;

    @Column(name = "entryDate")
    @Temporal(TemporalType.TIMESTAMP)
    private Date entryDate;

    @Column(name = "amount")
    private BigDecimal amount;

    @Column(name = "debit")
    private BigDecimal debit;

    @Column(name = "credit")
    private BigDecimal credit;

    @Column(name = "entryAmount")
    private BigDecimal entryAmount;

    @Column(name = "accountBalance")
    private BigDecimal accountBalance;

    @Column(name = "sourceDocument")
    private Integer sourceDocument;

    @Column(name = "code")
    private String code;

    public Entry() {
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getTransactionId() {
        return transactionId;
    }

    public void setTransactionId(Long transactionId) {
        this.transactionId = transactionId;
    }

    public Long getModuleId() {
        return moduleId;
    }

    public void setModuleId(Long moduleId) {
        this.moduleId = moduleId;
    }

    public Integer getModuleTypeId() {
        return moduleTypeId;
    }

    public void setModuleTypeId(Integer moduleTypeId) {
        this.moduleTypeId = moduleTypeId;
    }

    public Long getModuleRefId() {
        return moduleRefId;
    }

    public void setModuleRefId(Long moduleRefId) {
        this.moduleRefId = moduleRefId;
    }

    public Long getAccountId() {
        return accountId;
    }

    public void setAccountId(Long accountId) {
        this.accountId = accountId;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Short getStatus() {
        return status;
    }

    public void setStatus(Short status) {
        this.status = status;
    }

    public Date getEntryDate() {
        return entryDate;
    }

    public void setEntryDate(Date entryDate) {
        this.entryDate = entryDate;
    }

    public BigDecimal getAmount() {
        return amount;
    }

    public void setAmount(BigDecimal amount) {
        this.amount = amount;
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

    public BigDecimal getEntryAmount() {
        return entryAmount;
    }

    public void setEntryAmount(BigDecimal entryAmount) {
        this.entryAmount = entryAmount;
    }

    public BigDecimal getAccountBalance() {
        return accountBalance;
    }

    public void setAccountBalance(BigDecimal accountBalance) {
        this.accountBalance = accountBalance;
    }

    /**
     * @return the sourceDocument
     */
    public Integer getSourceDocument() {
        return sourceDocument;
    }

    /**
     * @param sourceDocument the sourceDocument to set
     */
    public void setSourceDocument(Integer sourceDocument) {
        this.sourceDocument = sourceDocument;
    }

    /**
     * @return the code
     */
    public String getCode() {
        return code;
    }

    /**
     * @param code the code to set
     */
    public void setCode(String code) {
        this.code = code;
    }

}
