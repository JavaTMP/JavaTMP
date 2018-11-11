package com.javatmp.domain;

import java.io.Serializable;
import javax.persistence.AttributeOverride;
import javax.persistence.AttributeOverrides;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.DiscriminatorValue;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.MappedSuperclass;
import javax.persistence.SecondaryTable;
import javax.persistence.InheritanceType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;

/**
 *
 * @author JavaTMP
 */
@Entity
@Table(name = "themetranslation")
public class Themetranslation implements Serializable {

    @Id
    private String themeId;

    @Column(name = "langId")
    private String langId;

    private String themeName;

    private Integer isDefaultLang;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(insertable = false, updatable = false, name = "themeId", referencedColumnName = "themeId")
    private Theme theme;

    public Themetranslation() {
    }

    public Themetranslation(String langId, String themeId, String themeName) {
        this.themeId = themeId;
        this.langId = langId;
        this.themeName = themeName;
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

    /**
     * @return the themeName
     */
    public String getThemeName() {
        return themeName;
    }

    /**
     * @param themeName the themeName to set
     */
    public void setThemeName(String themeName) {
        this.themeName = themeName;
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
     * @return the theme
     */
    public Theme getTheme() {
        return theme;
    }

    /**
     * @param theme the theme to set
     */
    public void setTheme(Theme theme) {
        this.theme = theme;
    }

    /**
     * @return the isDefaultLang
     */
    public Integer getIsDefaultLang() {
        return isDefaultLang;
    }

    /**
     * @param isDefaultLang the isDefaultLang to set
     */
    public void setIsDefaultLang(Integer isDefaultLang) {
        this.isDefaultLang = isDefaultLang;
    }

}
