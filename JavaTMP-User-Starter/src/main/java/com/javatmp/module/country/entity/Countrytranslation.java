package com.javatmp.module.country.entity;

import com.javatmp.module.language.entity.Language;
import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
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
@Table(name = "countryTranslation")
public class Countrytranslation implements Serializable {

    private static final long serialVersionUID = 1L;
    @EqualsAndHashCode.Include
    @EmbeddedId
    protected CountrytranslationPK countrytranslationPK;
    @Basic(optional = false)
    @Column(name = "countryName")
    private String countryName;
    @JoinColumn(name = "countryId", referencedColumnName = "countryId", insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private Country country;
    @JoinColumn(name = "langId", referencedColumnName = "languageId", insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private Language language;

    public Countrytranslation() {
    }

    public Countrytranslation(CountrytranslationPK countrytranslationPK) {
        this.countrytranslationPK = countrytranslationPK;
    }

    public Countrytranslation(CountrytranslationPK countrytranslationPK, String countryName) {
        this.countrytranslationPK = countrytranslationPK;
        this.countryName = countryName;
    }

    public Countrytranslation(String countryId, String langId) {
        this.countrytranslationPK = new CountrytranslationPK(countryId, langId);
    }

    public Countrytranslation(String countryId, String langId, String countryName) {
        this.countrytranslationPK = new CountrytranslationPK(countryId, langId);
        this.countryName = countryName;
    }
}
