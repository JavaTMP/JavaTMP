package com.javatmp.module.country;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Embeddable;

/**
 *
 * @author JavaTMP
 */
@Embeddable
public class CountrytranslationPK implements Serializable {

    @Basic(optional = false)
    @Column(name = "countryId")
    private String countryId;
    @Basic(optional = false)
    @Column(name = "langId")
    private String langId;

    public CountrytranslationPK() {
    }

    public CountrytranslationPK(String countryId, String langId) {
        this.countryId = countryId;
        this.langId = langId;
    }

    public String getCountryId() {
        return countryId;
    }

    public void setCountryId(String countryId) {
        this.countryId = countryId;
    }

    public String getLangId() {
        return langId;
    }

    public void setLangId(String langId) {
        this.langId = langId;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (countryId != null ? countryId.hashCode() : 0);
        hash += (langId != null ? langId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof CountrytranslationPK)) {
            return false;
        }
        CountrytranslationPK other = (CountrytranslationPK) object;
        if ((this.countryId == null && other.countryId != null) || (this.countryId != null && !this.countryId.equals(other.countryId))) {
            return false;
        }
        if ((this.langId == null && other.langId != null) || (this.langId != null && !this.langId.equals(other.langId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.javatmp.module.country.CountrytranslationPK[ countryId=" + countryId + ", langId=" + langId + " ]";
    }

}
