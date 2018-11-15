package com.javatmp.module.country;

import com.javatmp.module.language.Language;
import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
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
@Table(name = "countrytranslation")
public class Countrytranslation implements Serializable {

    private static final long serialVersionUID = 1L;
    @EmbeddedId
    protected CountrytranslationPK countrytranslationPK;
    @Basic(optional = false)
    @Column(name = "countryName")
    private String countryName;
    @JoinColumn(name = "countryId", referencedColumnName = "countryId", insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private Country country;
    @JoinColumn(name = "langId", referencedColumnName = "languageId", insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private Language language;

    public Countrytranslation() {
    }

    public Countrytranslation(CountrytranslationPK countrytranslationPK) {
        this.countrytranslationPK = countrytranslationPK;
    }

    public Countrytranslation(CountrytranslationPK countrytranslationPK, String countryName) {
        this.countrytranslationPK = countrytranslationPK;
        this.countryName = countryName;
    }

    public Countrytranslation(String countryId, String langId) {
        this.countrytranslationPK = new CountrytranslationPK(countryId, langId);
    }

    public Countrytranslation(String countryId, String langId, String countryName) {
        this.countrytranslationPK = new CountrytranslationPK(countryId, langId);
        this.countryName = countryName;
    }

    public CountrytranslationPK getCountrytranslationPK() {
        return countrytranslationPK;
    }

    public void setCountrytranslationPK(CountrytranslationPK countrytranslationPK) {
        this.countrytranslationPK = countrytranslationPK;
    }

    public String getCountryName() {
        return countryName;
    }

    public void setCountryName(String countryName) {
        this.countryName = countryName;
    }

    public Country getCountry() {
        return country;
    }

    public void setCountry(Country country) {
        this.country = country;
    }

    public Language getLanguage() {
        return language;
    }

    public void setLanguage(Language language) {
        this.language = language;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (countrytranslationPK != null ? countrytranslationPK.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Countrytranslation)) {
            return false;
        }
        Countrytranslation other = (Countrytranslation) object;
        if ((this.countrytranslationPK == null && other.countrytranslationPK != null) || (this.countrytranslationPK != null && !this.countrytranslationPK.equals(other.countrytranslationPK))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.javatmp.module.country.Countrytranslation[ countrytranslationPK=" + countrytranslationPK + " ]";
    }

}
