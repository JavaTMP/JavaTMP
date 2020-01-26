package com.javatmp.module.user.repository;

import com.javatmp.fw.data.jpa.repository.ExtendedJpaRepository;
import com.javatmp.module.user.entity.Countrytranslation;
import com.javatmp.module.user.entity.CountrytranslationPK;
import java.util.List;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

/**
 *
 * @author JavaTMP
 */
public interface CountrytranslationRepository extends ExtendedJpaRepository<Countrytranslation, CountrytranslationPK> {

    @Query("select  new com.javatmp.module.user.entity.Countrytranslation("
            + "l.countryId, coalesce(lt1.countrytranslationPK.langId, lt2.countrytranslationPK.langId) , coalesce(lt1.countryName, lt2.countryName)"
            + ") from Country l "
            + "left outer join Countrytranslation lt1 on (lt1.countrytranslationPK.countryId = l.countryId and lt1.countrytranslationPK.langId = :langId) "
            + "left outer join Countrytranslation lt2 on (lt2.countrytranslationPK.countryId = l.countryId) "
            + "join Language deflan on deflan.languageId = lt2.countrytranslationPK.langId and deflan.isDefaultLang = 1")
    public List<Countrytranslation> listCountryTransalatedBylanguage(@Param("langId") String langId);

}
