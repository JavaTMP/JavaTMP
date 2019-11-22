package com.javatmp.module.theme.entity;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(onlyExplicitlyIncluded = true)
@Entity
@Table(name = "theme")
@Inheritance(strategy = InheritanceType.JOINED) //Highly normalized
public class Theme implements Serializable {

    private static final long serialVersionUID = 1L;

    @EqualsAndHashCode.Include
    @Id
    @Basic(optional = false)
    @Column(name = "themeId")
    private String themeId;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "theme")
    private List<Themetranslation> themetranslationList;

//    private String themeName;
    public Theme() {
    }

    public Theme(String themeId) {
        this.themeId = themeId;
    }

    public Theme(Theme theme) {
        this.themeId = theme.themeId;
//        this.themeName = theme.themeName;
    }
}
