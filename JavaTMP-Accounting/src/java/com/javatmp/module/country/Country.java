package com.javatmp.module.country;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "country")
public class Country implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @Basic(optional = false)
    @Column(name = "countryId")
    private String countryId;

    @OneToMany(cascade = CascadeType.ALL, mappedBy = "country")
    private List<Countrytranslation> countrytranslationList;

    public Country() {
    }

    public Country(String countryId) {
        this.countryId = countryId;
    }

    public String getCountryId() {
        return countryId;
    }

    public void setCountryId(String countryId) {
        this.countryId = countryId;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (countryId != null ? countryId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Country)) {
            return false;
        }
        Country other = (Country) object;
        if ((this.countryId == null && other.countryId != null) || (this.countryId != null && !this.countryId.equals(other.countryId))) {
            return false;
        }
        return true;
    }

    public List<Countrytranslation> getCountrytranslationList() {
        return countrytranslationList;
    }

    public void setCountrytranslationList(List<Countrytranslation> countrytranslationList) {
        this.countrytranslationList = countrytranslationList;
    }

    @Override
    public String toString() {
        return "com.javatmp.module.country.Country[ countryId=" + countryId + " ]";
    }

}
