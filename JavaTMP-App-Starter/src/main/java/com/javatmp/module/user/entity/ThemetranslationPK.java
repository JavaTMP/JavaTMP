package com.javatmp.module.user.entity;

import java.io.Serializable;
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
public class ThemetranslationPK implements Serializable {

    private static final long serialVersionUID = 1L;

    @EqualsAndHashCode.Include
    private String themeId;
    @EqualsAndHashCode.Include
    private String langId;

    public ThemetranslationPK() {
    }

    public ThemetranslationPK(String themeId, String langId) {
        this.themeId = themeId;
        this.langId = langId;
    }
}
