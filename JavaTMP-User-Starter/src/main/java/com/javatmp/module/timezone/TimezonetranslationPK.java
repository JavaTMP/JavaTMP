package com.javatmp.module.timezone;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Embeddable;

/**
 *
 * @author JavaTMP
 */
@Embeddable
public class TimezonetranslationPK implements Serializable {

    @Basic(optional = false)
    @Column(name = "timezoneId")
    private String timezoneId;
    @Basic(optional = false)
    @Column(name = "langId")
    private String langId;

    public TimezonetranslationPK() {
    }

    public TimezonetranslationPK(String timezoneId, String langId) {
        this.timezoneId = timezoneId;
        this.langId = langId;
    }

    public String getTimezoneId() {
        return timezoneId;
    }

    public void setTimezoneId(String timezoneId) {
        this.timezoneId = timezoneId;
    }

    public String getLangId() {
        return langId;
    }

    public void setLangId(String langId) {
        this.langId = langId;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (timezoneId != null ? timezoneId.hashCode() : 0);
        hash += (langId != null ? langId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof TimezonetranslationPK)) {
            return false;
        }
        TimezonetranslationPK other = (TimezonetranslationPK) object;
        if ((this.timezoneId == null && other.timezoneId != null) || (this.timezoneId != null && !this.timezoneId.equals(other.timezoneId))) {
            return false;
        }
        if ((this.langId == null && other.langId != null) || (this.langId != null && !this.langId.equals(other.langId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.javatmp.module.timezone.TimezonetranslationPK[ timezoneId=" + timezoneId + ", langId=" + langId + " ]";
    }

}
