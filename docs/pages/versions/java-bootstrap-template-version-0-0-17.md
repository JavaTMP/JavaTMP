---
title: Java Bootstrap Template Version 0.0.17 (Current Development Version)
---
# {{ page.title }}

## df92b0f on Jun 25, 2020, 9:37 PM GMT+4
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
