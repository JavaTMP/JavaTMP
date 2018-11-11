Multi language database, with default fallback

for theme table we create another themetranslation which hold language specific columns

- the following query will return the theme name for specific id ('cyborg') and lang id ('en')
```
select t.`themeId`, coalesce(th1.themeName, th2.themeName) as col_2_0_
from theme t
left outer join themetranslation th1 on (t.themeId = th1.themeId and th1.`langId` = 'en')
left outer join themetranslation th2
on (t.themeId = th2.themeId and th2.`langId` = (select `languageId` from `language` where `isDefaultLang` = 1))
where t.`themeId` = 'cyborg'
```
- The following query will show all themetranslation rows with duplicate name:
```
select t.`themeId`, coalesce(th1.themeName, th2.themeName) as col_2_0_
from theme t
left outer join themetranslation th1 on (t.themeId = th1.themeId)
left outer join themetranslation th2
on (t.themeId = th2.themeId and th2.`langId` = (select `languageId` from `language` where `isDefaultLang` = 1))
```
- The following query show all language theme rows with default value for not existing record:
```
select lan.`languageId`, t.`themeId`, coalesce(th1.themeName, th2.themeName) as col_2_0_
from `language`lan
left outer join theme t on 1=1
left outer join themetranslation th1 on (t.themeId = th1.themeId and th1.`langId` = lan.`languageId`)
left outer join themetranslation th2
on (t.themeId = th2.themeId and th2.`langId` = (select `languageId` from `language` where `isDefaultLang` = 1))
-- where t.`themeId` = 'cyborg'
```

- The following query show all records:
```
select lanTr.`languageName`, t.`themeId`, coalesce(th1.themeName, th2.themeName) as col_2_0_
from `language` lan
join languagetranslation lanTr on lanTr.`languageId` = lan.`languageId` and lanTr.`langId` = lan.`languageId`
left outer join theme t on 1 = 1
left outer join themetranslation th1 on (t.themeId = th1.themeId and th1.`langId` = lan.`languageId`)
left outer join themetranslation th2 on (t.themeId = th2.themeId)
join `language` reflan on reflan.`languageId` = th2.`langId` and reflan.`isDefaultLang` = 1;
```
it is implemented in jpql like following:
```
TypedQuery<Object[]> query = em.createQuery(
                "select lanTr.languageName, t.themeId, coalesce(th1.themeName, th2.themeName) "
                + "from Language lan "
                + "join lan.languagetranslationList lanTr "
                + "on lanTr.languagetranslationPK.languageId = lan.languageId "
                + "and lanTr.languagetranslationPK.langId = 'ar' "
                + "left outer join Theme t on (1=1) "
                + "left outer join Themetranslation th1 "
                + "on (t.themeId = th1.themetranslationPK.themeId and th1.themetranslationPK.langId = lan.languageId)"
                + "left outer join Themetranslation th2 "
                + "on (t.themeId = th2.themetranslationPK.themeId)"
                + "join Language reflan "
                + "on reflan.languageId = th2.themetranslationPK.langId and reflan.isDefaultLang = 1 "
                + "where th1.themetranslationPK.langId = lan.languageId"
                //                + "where lanTr.language1 = :la"
                //                + "left outer join Theme th on th.themeId = t.themeId "
                //                + "where l.languageId = :la", Themetranslation.class);
                + "", Object[].class
        );
```