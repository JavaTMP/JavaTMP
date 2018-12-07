package com.javatmp.module.accounting;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;

/**
 *
 * @author JavaTMP
 */
@Entity
@Table(name = "accounttype")
public class Accounttype implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Basic(optional = false)
    @Column(name = "name")
    private String name;
    @Basic(optional = false)
    @Column(name = "debitSign")
    private int debitSign;
    @Basic(optional = false)
    @Column(name = "creditSign")
    private int creditSign;

    @Transient
    private List<Accountgroup> accountgroupList;

    public Accounttype() {
    }

    public Accounttype(Integer id) {
        this.id = id;
    }

    public Accounttype(Integer id, String name, int debitSign, int creditSign) {
        this.id = id;
        this.name = name;
        this.debitSign = debitSign;
        this.creditSign = creditSign;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getDebitSign() {
        return debitSign;
    }

    public void setDebitSign(int debitSign) {
        this.debitSign = debitSign;
    }

    public int getCreditSign() {
        return creditSign;
    }

    public void setCreditSign(int creditSign) {
        this.creditSign = creditSign;
    }

    public List<Accountgroup> getAccountgroupList() {
        return accountgroupList;
    }

    public void setAccountgroupList(List<Accountgroup> accountgroupList) {
        this.accountgroupList = accountgroupList;
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
        if (!(object instanceof Accounttype)) {
            return false;
        }
        Accounttype other = (Accounttype) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.javatmp.module.accounting.Accounttype[ id=" + id + " ]";
    }

}
