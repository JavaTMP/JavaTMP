package com.javatmp.module.user.entity;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 *
 * @author JavaTMP
 */
@Data
@EqualsAndHashCode(onlyExplicitlyIncluded = true)
@Entity
@Table(name = "themeTranslation")
public class Themetranslation implements Serializable {

    @EqualsAndHashCode.Include
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

    public Themetranslation(String themeId, String langId, String themeName) {
        this(themeId, langId);
        this.themeName = themeName;
    }
}
