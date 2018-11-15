package com.javatmp.module.language;

import com.javatmp.module.country.Countrytranslation;
import com.javatmp.module.theme.Themetranslation;
import java.io.Serializable;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "language")
public class Language implements Serializable {

    @OneToMany(cascade = CascadeType.ALL, mappedBy = "language")
    private List<Countrytranslation> countrytranslationList;

    @OneToMany(cascade = CascadeType.ALL, mappedBy = "language")
    private List<Themetranslation> themetranslationList;

    private static final long serialVersionUID = 1L;

    @Id
    @Basic(optional = false)
    @Column(name = "languageId")
    private String languageId;

    @Column(name = "isDefaultLang")
    private Short isDefaultLang;

    @OneToMany(cascade = CascadeType.ALL, mappedBy = "language", fetch = FetchType.LAZY)
    private List<Languagetranslation> languagetranslationList;

    public Language() {
    }

    public Language(String languageId) {
        this.languageId = languageId;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (getLanguageId() != null ? getLanguageId().hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Language)) {
            return false;
        }
        Language other = (Language) object;
        if ((this.getLanguageId() == null && other.getLanguageId() != null) || (this.getLanguageId() != null && !this.languageId.equals(other.languageId))) {
            return false;
        }
        return true;
    }

    /**
     * @return the languageId
     */
    public String getLanguageId() {
        return languageId;
    }

    /**
     * @param languageId the languageId to set
     */
    public void setLanguageId(String languageId) {
        this.languageId = languageId;
    }

    public Short getIsDefaultLang() {
        return isDefaultLang;
    }

    public void setIsDefaultLang(Short isDefaultLang) {
        this.isDefaultLang = isDefaultLang;
    }

    public List<Languagetranslation> getLanguagetranslationList() {
        return languagetranslationList;
    }

    public void setLanguagetranslationList(List<Languagetranslation> languagetranslationList) {
        this.languagetranslationList = languagetranslationList;
    }

    @Override
    public String toString() {
        return "[ languageId=" + languageId + " ]";
    }

    public List<Themetranslation> getThemetranslationList() {
        return themetranslationList;
    }

    public void setThemetranslationList(List<Themetranslation> themetranslationList) {
        this.themetranslationList = themetranslationList;
    }

    public List<Countrytranslation> getCountrytranslationList() {
        return countrytranslationList;
    }

    public void setCountrytranslationList(List<Countrytranslation> countrytranslationList) {
        this.countrytranslationList = countrytranslationList;
    }

}
