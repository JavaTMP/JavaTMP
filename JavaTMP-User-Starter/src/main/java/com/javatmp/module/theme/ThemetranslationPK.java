package com.javatmp.module.theme;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Embeddable;

/**
 *
 * @author JavaTMP
 */
@Embeddable
public class ThemetranslationPK implements Serializable {

    private static final long serialVersionUID = 1L;

    @Basic(optional = false)
    @Column(name = "themeId")
    private String themeId;

    @Basic(optional = false)
    @Column(name = "langId")
    private String langId;

    public ThemetranslationPK() {
    }

    public ThemetranslationPK(String themeId, String langId) {
        this.themeId = themeId;
        this.langId = langId;
    }

    /**
     * @return the themeId
     */
    public String getThemeId() {
        return themeId;
    }

    /**
     * @param themeId the themeId to set
     */
    public void setThemeId(String themeId) {
        this.themeId = themeId;
    }

    /**
     * @return the langId
     */
    public String getLangId() {
        return langId;
    }

    /**
     * @param langId the langId to set
     */
    public void setLangId(String langId) {
        this.langId = langId;
    }
}
