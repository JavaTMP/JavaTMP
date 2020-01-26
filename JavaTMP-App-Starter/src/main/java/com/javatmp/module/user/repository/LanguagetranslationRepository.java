package com.javatmp.module.user.repository;

import com.javatmp.fw.data.jpa.repository.ExtendedJpaRepository;
import com.javatmp.module.user.entity.Languagetranslation;
import com.javatmp.module.user.entity.LanguagetranslationPK;
import java.util.List;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

/**
 *
 * @author JavaTMP
 */
public interface LanguagetranslationRepository extends ExtendedJpaRepository<Languagetranslation, LanguagetranslationPK> {

    @Query("select new com.javatmp.module.user.entity.Languagetranslation("
            + "l.languageId, coalesce(lt1.languagetranslationPK.langId, lt2.languagetranslationPK.langId), coalesce(lt1.languageName, lt2.languageName)"
            + ") from Language l "
            + "left outer join Languagetranslation lt1 on (lt1.languagetranslationPK.languageId = l.languageId and lt1.languagetranslationPK.langId = :langId ) "
            + "left outer join Languagetranslation lt2 on (lt2.languagetranslationPK.languageId = l.languageId) "
            + "join Language deflan on deflan.languageId = lt2.languagetranslationPK.langId and deflan.isDefaultLang = 1")
    public List<Languagetranslation> listLanguageTransalatedBylanguage(@Param("langId") String langId);

}
