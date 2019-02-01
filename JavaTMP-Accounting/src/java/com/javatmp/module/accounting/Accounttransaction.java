package com.javatmp.module.accounting;

import java.io.Serializable;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

/**
 *
 * @author JavaTMP
 */
@Entity
@Table(name = "accountTransaction")
public class Accounttransaction implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Long id;

// @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Column(name = "amount")
    private BigDecimal amount;

    @Column(name = "accountId")
    private Long accountId;

    @Column(name = "transactionId")
    private Long transactionId;

    @Column(name = "description")
    private String description;

    @Column(name = "moduleId")
    private Integer moduleId;

    @Column(name = "moduleRefId")
    private BigInteger moduleRefId;

    @Column(name = "moduleTypeId")
    private Integer moduleTypeId;

    @Column(name = "status")
    private Short status;

    @Transient
    private BigDecimal debit;

    @Transient
    private BigDecimal credit;

    @Transient
    private Account account;

    @Transient
    private Transaction transaction;

    @Transient
    private List<Costcenter> costcenterList;

    @Transient
    private Module module;

    @Transient
    private Moduletype moduletype;

    public Accounttransaction() {
    }

    public Accounttransaction(Long id) {
        this.id = id;
    }

    public Accounttransaction(Long id, BigDecimal amount, Long accountId, Long transactionId, String description, Integer moduleId,
            BigInteger moduleRefId, Integer moduleTypeId, Short status) {
//id, amount, accountId,  transactionId, description, moduleId,
//             moduleRefId, moduleTypeId, status
        this.id = id;
        this.amount = amount;
        this.accountId = accountId;
        this.transactionId = transactionId;
        this.description = description;
        this.moduleId = moduleId;
        this.moduleRefId = moduleRefId;
        this.moduleTypeId = moduleTypeId;
        this.status = status;
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

    /**
     * @return the moduleId
     */
    public Integer getModuleId() {
        return moduleId;
    }

    /**
     * @param moduleId the moduleId to set
     */
    public void setModuleId(Integer moduleId) {
        this.moduleId = moduleId;
    }

    /**
     * @return the moduleTypeId
     */
    public Integer getModuleTypeId() {
        return moduleTypeId;
    }

    /**
     * @param moduleTypeId the moduleTypeId to set
     */
    public void setModuleTypeId(Integer moduleTypeId) {
        this.moduleTypeId = moduleTypeId;
    }

    /**
     * @return the description
     */
    public String getDescription() {
        return description;
    }

    /**
     * @param description the description to set
     */
    public void setDescription(String description) {
        this.description = description;
    }

    public List<Costcenter> getCostcenterList() {
        return costcenterList;
    }

    public void setCostcenterList(List<Costcenter> costcenterList) {
        this.costcenterList = costcenterList;
    }

}
