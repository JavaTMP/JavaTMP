package com.javatmp.module.timezone;

import com.javatmp.module.language.Language;
import java.io.Serializable;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 *
 * @author JavaTMP
 */
@Data
@EqualsAndHashCode(onlyExplicitlyIncluded = true)
@Entity
@Table(name = "timezoneTranslation")
public class Timezonetranslation implements Serializable {

    private static final long serialVersionUID = 1L;
    @EqualsAndHashCode.Include
    @EmbeddedId
    protected TimezonetranslationPK timezonetranslationPK;
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
}
