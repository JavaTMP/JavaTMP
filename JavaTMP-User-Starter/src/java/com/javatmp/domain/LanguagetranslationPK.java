package com.javatmp.domain;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Embeddable;

/**
 *
 * @author JavaTMP
 */
@Embeddable
public class LanguagetranslationPK implements Serializable {

    @Basic(optional = false)
    @Column(name = "languageId")
    private String languageId;
    @Basic(optional = false)
    @Column(name = "langId")
    private String langId;

    public LanguagetranslationPK() {
    }

    public LanguagetranslationPK(String languageId, String langId) {
        this.languageId = languageId;
        this.langId = langId;
    }

    public String getLanguageId() {
        return languageId;
    }

    public void setLanguageId(String languageId) {
        this.languageId = languageId;
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
        hash += (languageId != null ? languageId.hashCode() : 0);
        hash += (langId != null ? langId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof LanguagetranslationPK)) {
            return false;
        }
        LanguagetranslationPK other = (LanguagetranslationPK) object;
        if ((this.languageId == null && other.languageId != null) || (this.languageId != null && !this.languageId.equals(other.languageId))) {
            return false;
        }
        if ((this.langId == null && other.langId != null) || (this.langId != null && !this.langId.equals(other.langId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.javatmp.domain.LanguagetranslationPK[ languageId=" + languageId + ", langId=" + langId + " ]";
    }

}
