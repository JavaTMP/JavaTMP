package com.javatmp.module.timezone;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name = "timezone")
public class Timezone implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    private String timezoneId;

    @Transient
    private String timezoneName;

    public Timezone() {
    }

    public Timezone(String timezoneId, String timezoneName) {
        this.timezoneId = timezoneId;
        this.timezoneName = timezoneName;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (this.getTimezoneId() != null ? this.getTimezoneId().hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Timezone)) {
            return false;
        }
        Timezone other = (Timezone) object;
        if ((this.getTimezoneId() == null && other.getTimezoneId() != null) || (this.getTimezoneId() != null && !this.timezoneId.equals(other.timezoneId))) {
            return false;
        }
        return true;
    }

    /**
     * @return the timezoneId
     */
    public String getTimezoneId() {
        return timezoneId;
    }

    /**
     * @param timezoneId the timezoneId to set
     */
    public void setTimezoneId(String timezoneId) {
        this.timezoneId = timezoneId;
    }

    /**
     * @return the timezoneName
     */
    public String getTimezoneName() {
        return timezoneName;
    }

    /**
     * @param timezoneName the timezoneName to set
     */
    public void setTimezoneName(String timezoneName) {
        this.timezoneName = timezoneName;
    }
}
