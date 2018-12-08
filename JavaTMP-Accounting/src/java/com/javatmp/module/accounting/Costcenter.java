package com.javatmp.module.accounting;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
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
@Table(name = "costcenter")
public class Costcenter implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Long id;

    @Basic(optional = false)
    @Column(name = "name")
    private String name;

    @Column(name = "description")
    private String description;

    @Column(name = "status")
    private Short status;

    @Basic(optional = false)
    @Column(name = "creationDate")
    @Temporal(TemporalType.TIMESTAMP)
    private Date creationDate;

    @Transient
    private List<Accounttransaction> accounttransactionList;

    @Transient
    private List<Costcenter> costcenterList;

    @Column(name = "parentId")
    private Long costcenterParentId;

    public Costcenter() {
    }

    public Costcenter(Long id) {
        this.id = id;
    }

    public Costcenter(Long id, String name, Date creationDate) {
        this.id = id;
        this.name = name;
        this.creationDate = creationDate;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
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

    public List<Costcenter> getCostcenterList() {
        return costcenterList;
    }

    public void setCostcenterList(List<Costcenter> costcenterList) {
        this.costcenterList = costcenterList;
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
        if (!(object instanceof Costcenter)) {
            return false;
        }
        Costcenter other = (Costcenter) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.javatmp.module.accounting.Costcenter[ id=" + id + " ]";
    }

    /**
     * @return the costcenterParentId
     */
    public Long getCostcenterParentId() {
        return costcenterParentId;
    }

    /**
     * @param costcenterParentId the costcenterParentId to set
     */
    public void setCostcenterParentId(Long costcenterParentId) {
        this.costcenterParentId = costcenterParentId;
    }

}
