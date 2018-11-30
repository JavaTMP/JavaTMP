package com.javatmp.module.accounting;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 *
 * @author JavaTMP
 */
@Entity
@Table(name = "account")
public class Account implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Long id;
    @Basic(optional = false)
    @Column(name = "accountCode")
    private String accountCode;
    @Basic(optional = false)
    @Column(name = "name")
    private String name;
    @Column(name = "description")
    private String description;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Column(name = "debit")
    private BigDecimal debit;
    @Column(name = "credit")
    private BigDecimal credit;
    @Column(name = "balance")
    private BigDecimal balance;
    @Column(name = "status")
    private Integer accountStatus;

    @Basic(optional = false)
    @Column(name = "creationDate")
    @Temporal(TemporalType.TIMESTAMP)
    private Date creationDate;

    @Column(name = "accountGroup")
    private Integer accountType;

    @Column(name = "parentAccount")
    private Long parentAccountId;

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

    public Account(Long accountId, String accountCode, String accountName,
            String accountDescription, BigDecimal debit, BigDecimal credit,
            BigDecimal balance, Integer accountType, Long parentAccountId,
            Integer accountStatus) {
        this.id = accountId;
        this.accountCode = accountCode;
        this.name = accountName;
        this.description = accountDescription;
        this.debit = debit;
        this.credit = credit;
        this.balance = balance;
        this.accountType = accountType;
        this.parentAccountId = parentAccountId;
        this.accountStatus = accountStatus;
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
        return "com.javatmp.module.accounting.Account_1[ id=" + id + " ]";
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

}
