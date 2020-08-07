---
title: Java Bootstrap Template Version 0.0.17 (Current Development Version)
---
# {{ page.title }}

## on
- Update the following dependencies in package.json:
    - gulp-markdown from 5.0.1 to 5.1.0
    - gulp-zip from 5.0.1 to 5.0.2
    - @fortawesome/fontawesome-free from 5.13.1 to 5.14.0
    - bootstrap from 4.5.0 to 4.5.2
    - bootstrap-input-spinner from 1.13.9 to 1.13.19
    - bootswatch from 4.5.0 to 4.5.1
    - inputmask from 5.0.3 to 5.0.5
    - jquery.fancytree from 2.35.0 to 2.36.1
    - yargs from 15.3.1 to 15.4.1
- Run gulp default to regenerate dist folders.

## df92b0f on Jun 25, 2020, 9:37 PM GMT+4
- Make English is a default language for fall back.
- Update copyright year for some static pages
- Add Devextreme `Blazing Berry` bootstrap theme and thumbnail image in `src\main\resources\static\assets\img\themes\blazing-berry.png`
and add a new record for it in theme and themeTranslation tables.
- Add `useTimezone=true&serverTimezone=UTC` parameters to mysql `spring.datasource.url` URL
- solve the bug in `src\main\webapp\WEB-INF\pages\static\chart\echarts-cardlet\map\WorldMapWithScatterCardlet.jsp`
 when run in ie11 due to error in option object.
- Update the following dependencies in package.json:
    - @fortawesome/fontawesome-free from 5.13.0 to 5.13.1
    - bootstrap-input-spinner from 1.13.5 to 1.13.9
    - bootstrap-slider from 10.6.2 to 11.0.2
    - formdata-polyfill from 3.0.19 to 3.0.20
    - jquery-form from 4.2.2 to 4.3.0
    - moment from 2.26.0 to 2.27.0
