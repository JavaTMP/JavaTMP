package com.javatmp.module.language;

import com.javatmp.module.country.Countrytranslation;
import com.javatmp.module.theme.Themetranslation;
import com.javatmp.module.timezone.Timezonetranslation;
import java.io.Serializable;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(onlyExplicitlyIncluded = true)
@Entity
@Table(name = "language")
public class Language implements Serializable {

    private static final long serialVersionUID = 1L;
    @EqualsAndHashCode.Include
    @Id
    @Basic(optional = false)
    @Column(name = "languageId")
    private String languageId;
    @Column(name = "isDefaultLang")
    private Short isDefaultLang;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "language", fetch = FetchType.LAZY)
    private List<Languagetranslation> languagetranslationList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "language", fetch = FetchType.LAZY)
    private List<Timezonetranslation> timezonetranslationList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "language")
    private List<Countrytranslation> countrytranslationList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "language")
    private List<Themetranslation> themetranslationList;

    public Language() {
    }

    public Language(String languageId) {
        this.languageId = languageId;
    }
}
