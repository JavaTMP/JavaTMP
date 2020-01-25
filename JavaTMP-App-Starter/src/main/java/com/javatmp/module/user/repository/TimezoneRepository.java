package com.javatmp.module.user.repository;

import com.javatmp.fw.data.jpa.repository.ExtendedJpaRepository;
import com.javatmp.module.user.entity.Timezone;
import com.javatmp.module.user.entity.Timezonetranslation;
import java.util.List;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

/**
 *
 * @author JavaTMP
 */
public interface TimezoneRepository extends ExtendedJpaRepository<Timezone, Long> {

    @Query("select new com.javatmp.module.user.entity.Timezonetranslation("
            + "l.timezoneId, coalesce(lt1.timezonetranslationPK.langId, lt2.timezonetranslationPK.langId) , coalesce(lt1.timezoneName, lt2.timezoneName)"
            + ") from Timezone l "
            + "left outer join Timezonetranslation lt1 on (lt1.timezonetranslationPK.timezoneId = l.timezoneId and lt1.timezonetranslationPK.langId = :langId)"
            + "left outer join Timezonetranslation lt2 on lt2.timezonetranslationPK.timezoneId = l.timezoneId "
            + "join Language deflan on deflan.languageId=lt2.timezonetranslationPK.langId and deflan.isDefaultLang = 1")
    public List<Timezonetranslation> getTimezones(@Param("langId") String langId);

}
