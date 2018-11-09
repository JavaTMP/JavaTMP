package com.javatmp.domain;

import java.io.Serializable;
import javax.persistence.AttributeOverride;
import javax.persistence.AttributeOverrides;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.DiscriminatorValue;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.Inheritance;
import javax.persistence.MappedSuperclass;
import javax.persistence.SecondaryTable;
import javax.persistence.InheritanceType;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;

/**
 *
 * @author JavaTMP
 */
@Entity
@Table(name = "themetranslation")
public class Themetranslation extends Theme implements Serializable {

    @Column(name = "langId")
    private String langId;

    public Themetranslation() {
    }

    public Themetranslation(Theme theme) {
        super(theme);
    }

    public Themetranslation(String langId, String themeId, String themeName) {
        this.langId = langId;
        this.setThemeId(themeId);
        this.setThemeName(themeName);
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
