package com.javatmp.module.accounting.entity;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import javax.persistence.Basic;
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
@Table(name = "transaction")
public class Transaction implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Long id;

    @Column(name = "code")
    private String code;

    @Basic(optional = false)
    @Column(name = "transactionDate")
    @Temporal(TemporalType.TIMESTAMP)
    private Date transactionDate;

    @Column(name = "note")
    private String note;

    @Column(name = "specialNumber")
    private String specialNumber;

    @Column(name = "entity")
    private String entity;

    @Column(name = "status")
    private Short status;

    @Basic(optional = false)
    @Column(name = "creationDate")
    @Temporal(TemporalType.TIMESTAMP)
    private Date creationDate;

    @Transient
    private List<AccountTransaction> accounttransactionList;

    @Transient
    private Vouchertype vouchertype;

    @Column(name = "voucherTypeId")
    private Integer voucherTypeId;

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

    public Transaction(Long id, String code, Date transactionDate, String note, String specialNumber,
            String entity, Short status, Date creationDate, Integer voucherTypeId) {
        this.id = id;
        this.code = code;
        this.transactionDate = transactionDate;
        this.note = note;
        this.specialNumber = specialNumber;
        this.entity = entity;
        this.status = status;
        this.creationDate = creationDate;
        this.voucherTypeId = voucherTypeId;

    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Date getTransactionDate() {
        return transactionDate;
    }

    public void setTransactionDate(Date transactionDate) {
        this.transactionDate = transactionDate;
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

    public List<AccountTransaction> getAccounttransactionList() {
        return accounttransactionList;
    }

    public void setAccounttransactionList(List<AccountTransaction> accounttransactionList) {
        this.accounttransactionList = accounttransactionList;
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

    public Vouchertype getVouchertype() {
        return vouchertype;
    }

    public void setVouchertype(Vouchertype vouchertype) {
        this.vouchertype = vouchertype;
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

    /**
     * @return the note
     */
    public String getNote() {
        return note;
    }

    /**
     * @param note the note to set
     */
    public void setNote(String note) {
        this.note = note;
    }

    /**
     * @return the specialNumber
     */
    public String getSpecialNumber() {
        return specialNumber;
    }

    /**
     * @param specialNumber the specialNumber to set
     */
    public void setSpecialNumber(String specialNumber) {
        this.specialNumber = specialNumber;
    }

    /**
     * @return the entity
     */
    public String getEntity() {
        return entity;
    }

    /**
     * @param entity the entity to set
     */
    public void setEntity(String entity) {
        this.entity = entity;
    }

    /**
     * @return the voucherTypeId
     */
    public Integer getVoucherTypeId() {
        return voucherTypeId;
    }

    /**
     * @param voucherTypeId the voucherTypeId to set
     */
    public void setVoucherTypeId(Integer voucherTypeId) {
        this.voucherTypeId = voucherTypeId;
    }

}
