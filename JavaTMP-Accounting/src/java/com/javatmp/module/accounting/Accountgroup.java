package com.javatmp.module.accounting;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

/**
 *
 * @author JavaTMP
 */
@Entity
@Table(name = "accountgroup")
@NamedQueries({
    @NamedQuery(name = "Accountgroup.findAll", query = "SELECT a FROM Accountgroup a")})
public class Accountgroup implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Basic(optional = false)
    @Column(name = "name")
    private String name;
    @Column(name = "description")
    private String description;
    @JoinColumn(name = "accountType", referencedColumnName = "id")
    @ManyToOne(fetch = FetchType.LAZY)
    private Accounttype accounttype;

    public Accountgroup() {
    }

    public Accountgroup(Integer id) {
        this.id = id;
    }

    public Accountgroup(Integer id, String name) {
        this.id = id;
        this.name = name;
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

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Accounttype getAccounttype() {
        return accounttype;
    }

    public void setAccounttype(Accounttype accounttype) {
        this.accounttype = accounttype;
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
        if (!(object instanceof Accountgroup)) {
            return false;
        }
        Accountgroup other = (Accountgroup) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.javatmp.module.accounting.Accountgroup[ id=" + id + " ]";
    }

}
