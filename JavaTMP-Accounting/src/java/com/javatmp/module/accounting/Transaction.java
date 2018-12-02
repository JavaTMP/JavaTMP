package com.javatmp.module.accounting;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
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
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;

/**
 *
 * @author JavaTMP
 */
@Entity
@Table(name = "transaction")
public class Transaction implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Long id;

    @Column(name = "referenceCode")
    private String referenceCode;

    @Basic(optional = false)
    @Column(name = "transactionDate")
    @Temporal(TemporalType.TIMESTAMP)
    private Date transactionDate;

    @Column(name = "description")
    private String description;

    @Column(name = "status")
    private Short status;

    @Basic(optional = false)
    @Column(name = "creationDate")
    @Temporal(TemporalType.TIMESTAMP)
    private Date creationDate;

    @Column(name = "transactionTypeId")
    private Integer transactionTypeId;

    @Column(name = "moduleId")
    private Long moduleId;

    @Transient
    private List<Accounttransaction> accounttransactionList;

    @Transient
    private Module module;

    @Transient
    private Transactiontype transactionType;

    public Transaction() {
    }

    public Transaction(Long id) {
        this.id = id;
    }

    public Transaction(Long id, Date transactionDate, Date creationDate) {
        this.id = id;
        this.transactionDate = transactionDate;
        this.creationDate = creationDate;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getReferenceCode() {
        return referenceCode;
    }

    public void setReferenceCode(String referenceCode) {
        this.referenceCode = referenceCode;
    }

    public Date getTransactionDate() {
        return transactionDate;
    }

    public void setTransactionDate(Date transactionDate) {
        this.transactionDate = transactionDate;
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

    public Date getCreationDate() {
        return creationDate;
    }

    public void setCreationDate(Date creationDate) {
        this.creationDate = creationDate;
    }

    public List<Accounttransaction> getAccounttransactionList() {
        return accounttransactionList;
    }

    public void setAccounttransactionList(List<Accounttransaction> accounttransactionList) {
        this.accounttransactionList = accounttransactionList;
    }

    public Module getModule() {
        return module;
    }

    public void setModule(Module module) {
        this.module = module;
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
        if (!(object instanceof Transaction)) {
            return false;
        }
        Transaction other = (Transaction) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.javatmp.module.accounting.Transaction[ id=" + id + " ]";
    }

    /**
     * @return the moduleId
     */
    public Long getModuleId() {
        return moduleId;
    }

    /**
     * @param moduleId the moduleId to set
     */
    public void setModuleId(Long moduleId) {
        this.moduleId = moduleId;
    }

    /**
     * @return the transactionTypeId
     */
    public Integer getTransactionTypeId() {
        return transactionTypeId;
    }

    /**
     * @param transactionTypeId the transactionTypeId to set
     */
    public void setTransactionTypeId(Integer transactionTypeId) {
        this.transactionTypeId = transactionTypeId;
    }

    /**
     * @return the transactionType
     */
    public Transactiontype getTransactionType() {
        return transactionType;
    }

    /**
     * @param transactionType the transactionType to set
     */
    public void setTransactionType(Transactiontype transactionType) {
        this.transactionType = transactionType;
    }

}
