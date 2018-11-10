package com.javatmp.domain;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.Table;

@Entity
@Table(name = "theme")
@Inheritance(strategy = InheritanceType.JOINED) //Highly normalized
public class Theme implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    private String themeId;

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
}
