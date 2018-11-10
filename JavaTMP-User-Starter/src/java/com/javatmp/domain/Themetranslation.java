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
@PrimaryKeyJoinColumn(name = "themeId")
public class Themetranslation extends Theme implements Serializable {

    private String themeName;

    @Column(name = "langId")
    private String langId;

    public Themetranslation() {
    }

    public Themetranslation(String langId, String themeId, String themeName) {
        super(themeId);
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

}
