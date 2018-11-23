package com.javatmp.module.timezone;

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
import javax.persistence.Transient;

@Entity
@Table(name = "timezone")
public class Timezone implements Serializable {

    @Id
    @Basic(optional = false)
    @Column(name = "timezoneId")
    private String timezoneId;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "timezone", fetch = FetchType.LAZY)
    private List<Timezonetranslation> timezonetranslationList;

    private static final long serialVersionUID = 1L;

    @Transient
    private String timezoneName;

    @Transient
    private String timezoneDescription;

    @Transient
    private String idName;

    @Transient
    private String offsetDescription;

    public Timezone() {
    }

    public Timezone(String timezoneId, String idName, String offsetDescription, String timezoneName, String timezoneDescription) {
        this.timezoneId = timezoneId;
        this.idName = idName;
        this.offsetDescription = offsetDescription;
        this.timezoneName = timezoneName;
        this.timezoneDescription = timezoneDescription;
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
     * @return the timezoneDescription
     */
    public String getTimezoneDescription() {
        return timezoneDescription;
    }

    /**
     * @param timezoneDescription the timezoneDescription to set
     */
    public void setTimezoneDescription(String timezoneDescription) {
        this.timezoneDescription = timezoneDescription;
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

    /**
     * @return the idName
     */
    public String getIdName() {
        return idName;
    }

    /**
     * @param idName the idName to set
     */
    public void setIdName(String idName) {
        this.idName = idName;
    }

    /**
     * @return the offsetDescription
     */
    public String getOffsetDescription() {
        return offsetDescription;
    }

    /**
     * @param offsetDescription the offsetDescription to set
     */
    public void setOffsetDescription(String offsetDescription) {
        this.offsetDescription = offsetDescription;
    }

    public Timezone(String timezoneId) {
        this.timezoneId = timezoneId;
    }

    public List<Timezonetranslation> getTimezonetranslationList() {
        return timezonetranslationList;
    }

    public void setTimezonetranslationList(List<Timezonetranslation> timezonetranslationList) {
        this.timezonetranslationList = timezonetranslationList;
    }

    @Override
    public String toString() {
        return "com.javatmp.module.timezone.Timezone[ timezoneId=" + timezoneId + " ]";
    }
}
