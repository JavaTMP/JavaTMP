package com.javatmp.domain;

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

@Entity
@Table(name = "theme")
@Inheritance(strategy = InheritanceType.JOINED) //Highly normalized
public class Theme implements Serializable {

    private static final long serialVersionUID = 1L;

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

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (this.getThemeId() != null ? this.getThemeId().hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Theme)) {
            return false;
        }
        Theme other = (Theme) object;
        if ((this.getThemeId() == null && other.getThemeId() != null) || (this.getThemeId() != null && !this.themeId.equals(other.themeId))) {
            return false;
        }
        return true;
    }

    /**
     * @return the themeId
     */
    public String getThemeId() {
        return themeId;
    }

    /**
     * @param themeId the themeId to set
     */
    public void setThemeId(String themeId) {
        this.themeId = themeId;
    }

    public List<Themetranslation> getThemetranslationList() {
        return themetranslationList;
    }

    public void setThemetranslationList(List<Themetranslation> themetranslationList) {
        this.themetranslationList = themetranslationList;
    }

    @Override
    public String toString() {
        return "com.javatmp.domain.Theme[ themeId=" + themeId + " ]";
    }
}
