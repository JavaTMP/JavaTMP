package com.javatmp.module.timezone;

import com.javatmp.module.language.Language;
import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

/**
 *
 * @author JavaTMP
 */
@Entity
@Table(name = "timezonetranslation")
@NamedQueries({
    @NamedQuery(name = "Timezonetranslation.findAll", query = "SELECT t FROM Timezonetranslation t")})
public class Timezonetranslation implements Serializable {

    private static final long serialVersionUID = 1L;
    @EmbeddedId
    protected TimezonetranslationPK timezonetranslationPK;
    @Basic(optional = false)
    @Column(name = "timezoneName")
    private String timezoneName;
    @JoinColumn(name = "langId", referencedColumnName = "languageId", insertable = false, updatable = false)
    @ManyToOne(optional = false, fetch = FetchType.LAZY)
    private Language language;
    @JoinColumn(name = "timezoneId", referencedColumnName = "timezoneId", insertable = false, updatable = false)
    @ManyToOne(optional = false, fetch = FetchType.LAZY)
    private Timezone timezone;

    public String getTimezoneNameDescription() {
        return "(" + this.timezone.getOffsetDescription() + ") " + this.timezoneName + " (" + this.timezone.getIdName() + ")";
    }

    public Timezonetranslation() {
    }

    public Timezonetranslation(TimezonetranslationPK timezonetranslationPK) {
        this.timezonetranslationPK = timezonetranslationPK;
    }

    public Timezonetranslation(TimezonetranslationPK timezonetranslationPK, String timezoneName) {
        this.timezonetranslationPK = timezonetranslationPK;
        this.timezoneName = timezoneName;
    }

    public Timezonetranslation(String timezoneId, String langId) {
        this.timezonetranslationPK = new TimezonetranslationPK(timezoneId, langId);
    }

    public Timezonetranslation(String timezoneId, String langId, String timezoneName) {
        this.timezonetranslationPK = new TimezonetranslationPK(timezoneId, langId);
        this.timezoneName = timezoneName;
    }

    public TimezonetranslationPK getTimezonetranslationPK() {
        return timezonetranslationPK;
    }

    public void setTimezonetranslationPK(TimezonetranslationPK timezonetranslationPK) {
        this.timezonetranslationPK = timezonetranslationPK;
    }

    public String getTimezoneName() {
        return timezoneName;
    }

    public void setTimezoneName(String timezoneName) {
        this.timezoneName = timezoneName;
    }

    public Language getLanguage() {
        return language;
    }

    public void setLanguage(Language language) {
        this.language = language;
    }

    public Timezone getTimezone() {
        return timezone;
    }

    public void setTimezone(Timezone timezone) {
        this.timezone = timezone;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (timezonetranslationPK != null ? timezonetranslationPK.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Timezonetranslation)) {
            return false;
        }
        Timezonetranslation other = (Timezonetranslation) object;
        if ((this.timezonetranslationPK == null && other.timezonetranslationPK != null) || (this.timezonetranslationPK != null && !this.timezonetranslationPK.equals(other.timezonetranslationPK))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.javatmp.module.timezone.Timezonetranslation[ timezonetranslationPK=" + timezonetranslationPK + " ]";
    }

}
