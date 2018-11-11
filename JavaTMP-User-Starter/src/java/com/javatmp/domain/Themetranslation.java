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

    @EmbeddedId
    protected ThemetranslationPK themetranslationPK;

    @Basic(optional = false)
    @Column(name = "themeName")
    private String themeName;

    @ManyToOne(optional = false)
    @JoinColumn(insertable = false, updatable = false, name = "langId", referencedColumnName = "languageId")
    private Language language;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(insertable = false, updatable = false, name = "themeId", referencedColumnName = "themeId")
    private Theme theme;

    public Themetranslation() {
    }

    public Themetranslation(String themeId, String langId) {
        this.themetranslationPK = new ThemetranslationPK(themeId, langId);
    }

    public Themetranslation(ThemetranslationPK pk) {
        this.themetranslationPK = pk;
    }

    public Themetranslation(ThemetranslationPK pk, String themeName) {
        this(pk);
        this.themeName = themeName;
    }

    public Themetranslation(String themeId, String langId, String themeName) {
        this(themeId, langId);
        this.themeName = themeName;
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

    public ThemetranslationPK getThemetranslationPK() {
        return themetranslationPK;
    }

    public void setThemetranslationPK(com.javatmp.domain.ThemetranslationPK themetranslationPK) {
        this.themetranslationPK = themetranslationPK;
    }

    public Language getLanguage() {
        return language;
    }

    public void setLanguage(Language language) {
        this.language = language;
    }

}
