package com.javatmp.module.country;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Embeddable;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 *
 * @author JavaTMP
 */
@Data
@EqualsAndHashCode(onlyExplicitlyIncluded = true)
@Embeddable
public class CountrytranslationPK implements Serializable {

    @EqualsAndHashCode.Include
    @Basic(optional = false)
    @Column(name = "countryId")
    private String countryId;
    @EqualsAndHashCode.Include
    @Basic(optional = false)
    @Column(name = "langId")
    private String langId;

    public CountrytranslationPK() {
    }

    public CountrytranslationPK(String countryId, String langId) {
        this.countryId = countryId;
        this.langId = langId;
    }
}
