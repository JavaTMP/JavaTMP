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
@Table(name = "languageTranslation")
public class Languagetranslation implements Serializable {

    private static final long serialVersionUID = 1L;

    @EqualsAndHashCode.Include
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

    public Languagetranslation(String languageId, String langId, String languageName) {
        this.languagetranslationPK = new LanguagetranslationPK(languageId, langId);
        this.languageName = languageName;
    }
}
