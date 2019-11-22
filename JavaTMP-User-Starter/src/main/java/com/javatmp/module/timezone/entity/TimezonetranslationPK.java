package com.javatmp.module.timezone.entity;

import java.io.Serializable;
import javax.persistence.Embeddable;
import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(onlyExplicitlyIncluded = true)
@Embeddable
public class TimezonetranslationPK implements Serializable {

    private static final long serialVersionUID = 1L;

    @EqualsAndHashCode.Include
    private String timezoneId;
    @EqualsAndHashCode.Include
    private String langId;

    public TimezonetranslationPK() {
    }

    public TimezonetranslationPK(String timezoneId, String langId) {
        this.timezoneId = timezoneId;
        this.langId = langId;
    }
}
