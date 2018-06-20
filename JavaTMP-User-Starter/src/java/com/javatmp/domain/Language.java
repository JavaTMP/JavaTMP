package com.javatmp.domain;

import java.io.Serializable;

public class Language implements Serializable {

    private static final long serialVersionUID = 1L;
    private String languageId;
    private String languageName;

    public Language() {
    }

    public Language(String languageId, String languageName) {
        this.languageId = languageId;
        this.languageName = languageName;
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

    /**
     * @return the languageName
     */
    public String getLanguageName() {
        return languageName;
    }

    /**
     * @param languageName the languageName to set
     */
    public void setLanguageName(String languageName) {
        this.languageName = languageName;
    }

}
