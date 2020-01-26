package com.javatmp.module.user.repository;

import com.javatmp.fw.data.jpa.repository.ExtendedJpaRepository;
import com.javatmp.module.user.entity.Themetranslation;
import com.javatmp.module.user.entity.ThemetranslationPK;
import java.util.List;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

/**
 *
 * @author JavaTMP
 */
public interface ThemetranslationRepository extends ExtendedJpaRepository<Themetranslation, ThemetranslationPK> {

    @Query("select new com.javatmp.module.user.entity.Themetranslation(t.themeId, lan.languageId, coalesce(th1.themeName, th2.themeName)) "
            + "from Language lan "
            + "join lan.languagetranslationList lanTr "
            + "on (lanTr.languagetranslationPK.languageId = lan.languageId and lanTr.languagetranslationPK.languageId = :langId) "
            + "and lanTr.languagetranslationPK.langId = lan.languageId "
            + "left outer join Theme t on (1=1) "
            + "left outer join Themetranslation th1 "
            + "on (t.themeId = th1.themetranslationPK.themeId and th1.themetranslationPK.langId = lan.languageId)"
            + "left outer join Themetranslation th2 "
            + "on (t.themeId = th2.themetranslationPK.themeId)"
            + "join Language reflan "
            + "on reflan.languageId = th2.themetranslationPK.langId and reflan.isDefaultLang = 1 "
            + "where th1.themetranslationPK.langId = lan.languageId")
    public List<Themetranslation> listThemeTransalatedBylanguage(@Param("langId") String langId);

}
