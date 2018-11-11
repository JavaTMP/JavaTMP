package com.javatmp.domain;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.FetchType;
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
@Table(name = "languagetranslation")
public class Languagetranslation implements Serializable {

    private static final long serialVersionUID = 1L;

    @EmbeddedId
    protected LanguagetranslationPK languagetranslationPK;

    @Basic(optional = false)
    @Column(name = "languageName")
    private String languageName;

    @JoinColumn(name = "languageId", referencedColumnName = "languageId", insertable = false, updatable = false)
    @ManyToOne(optional = false, fetch = FetchType.LAZY)
    private Language language;

    @JoinColumn(name = "langId", referencedColumnName = "languageId", insertable = false, updatable = false)
    @ManyToOne(optional = false, fetch = FetchType.LAZY)
    private Language language1;

    public Languagetranslation() {
    }

    public Languagetranslation(LanguagetranslationPK languagetranslationPK) {
        this.languagetranslationPK = languagetranslationPK;
    }

    public Languagetranslation(LanguagetranslationPK languagetranslationPK, String languageName) {
        this.languagetranslationPK = languagetranslationPK;
        this.languageName = languageName;
    }

    public Languagetranslation(String languageId, String langId) {
        this.languagetranslationPK = new LanguagetranslationPK(languageId, langId);
    }

    public LanguagetranslationPK getLanguagetranslationPK() {
        return languagetranslationPK;
    }

    public void setLanguagetranslationPK(LanguagetranslationPK languagetranslationPK) {
        this.languagetranslationPK = languagetranslationPK;
    }

    public String getLanguageName() {
        return languageName;
    }

    public void setLanguageName(String languageName) {
        this.languageName = languageName;
    }

    public Language getLanguage() {
        return language;
    }

    public void setLanguage(Language language) {
        this.language = language;
    }

    public Language getLanguage1() {
        return language1;
    }

    public void setLanguage1(Language language1) {
        this.language1 = language1;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (languagetranslationPK != null ? languagetranslationPK.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Languagetranslation)) {
            return false;
        }
        Languagetranslation other = (Languagetranslation) object;
        if ((this.languagetranslationPK == null && other.languagetranslationPK != null) || (this.languagetranslationPK != null && !this.languagetranslationPK.equals(other.languagetranslationPK))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.javatmp.domain.Languagetranslation[ languagetranslationPK=" + languagetranslationPK + " ]";
    }

}
