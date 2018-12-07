package com.javatmp.module.accounting;

import java.io.Serializable;
import java.math.BigDecimal;
import java.math.BigInteger;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Transient;

/**
 *
 * @author JavaTMP
 */
@Entity
@Table(name = "accounttransaction")
@NamedQueries({
    @NamedQuery(name = "Accounttransaction.findAll", query = "SELECT a FROM Accounttransaction a")})
public class Accounttransaction implements Serializable {

    @Column(name = "moduleRefId")
    private BigInteger moduleRefId;

    @JoinColumn(name = "moduleId", referencedColumnName = "id")
    @ManyToOne(fetch = FetchType.LAZY)
    private Module module;
    @JoinColumn(name = "moduleTypeId", referencedColumnName = "id")
    @ManyToOne(fetch = FetchType.LAZY)
    private Moduletype moduletype;

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Long id;
    @Column(name = "status")
    private Short status;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Column(name = "amount")
    private BigDecimal amount;

    @Transient
    private BigDecimal debit;
    @Transient
    private BigDecimal credit;

    @Column(name = "accountId")
    private Long accountId;

    @Column(name = "transactionId")
    private Long transactionId;

    @Transient
    private Account account;

    @Transient
    private Transaction transaction;

    public Accounttransaction() {
    }

    public Accounttransaction(Long id) {
        this.id = id;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Short getStatus() {
        return status;
    }

    public void setStatus(Short status) {
        this.status = status;
    }

    public BigDecimal getAmount() {
        return amount;
    }

    public void setAmount(BigDecimal amount) {
        this.amount = amount;
    }

    public Account getAccount() {
        return account;
    }

    public void setAccount(Account account) {
        this.account = account;
    }

    public Transaction getTransaction() {
        return transaction;
    }

    public void setTransaction(Transaction transaction) {
        this.transaction = transaction;
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
        if (!(object instanceof Accounttransaction)) {
            return false;
        }
        Accounttransaction other = (Accounttransaction) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.javatmp.module.accounting.Accounttransaction[ id=" + id + " ]";
    }

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
     * @return the transactionId
     */
    public Long getTransactionId() {
        return transactionId;
    }

    /**
     * @param transactionId the transactionId to set
     */
    public void setTransactionId(Long transactionId) {
        this.transactionId = transactionId;
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

    public BigInteger getModuleRefId() {
        return moduleRefId;
    }

    public void setModuleRefId(BigInteger moduleRefId) {
        this.moduleRefId = moduleRefId;
    }

    public Module getModule() {
        return module;
    }

    public void setModule(Module module) {
        this.module = module;
    }

    public Moduletype getModuletype() {
        return moduletype;
    }

    public void setModuletype(Moduletype moduletype) {
        this.moduletype = moduletype;
    }

}
