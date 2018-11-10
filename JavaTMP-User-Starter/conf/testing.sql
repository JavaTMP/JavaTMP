/**
 * Author:  JavaTMP
 * Created: Nov 10, 2018
 */
select language0_.languageId as col_0_0_, theme1_.themeId as col_1_0_, coalesce(themetrans2_.themeName, theme1_.themeName) as col_2_0_
from language language0_
join theme theme1_
left outer join Themetranslation themetrans2_ on (themetrans2_.langId=language0_.languageId and themetrans2_.themeId=theme1_.themeId)
where language0_.languageId= 'en';


select t.`themeId`, tt.themeName, t.`themeName`
from themetranslation tt
right outer join theme t on t.`themeId` = tt.`themeId`;