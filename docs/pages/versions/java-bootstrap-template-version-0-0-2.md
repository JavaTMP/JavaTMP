---
title: Java Bootstrap Template Version 0.0.2 (published on 27th of August, 2018)
---
# {{ page.title }}
### Main Modifications and Updates:
*   Refactor main JavaTMP navbar dropdown menus by moving custom profile dropdown items style to custom-bootstrap-dropdown.scss.
*   Refactor projects by cleaning and replacing most px to rem.
*   Updating breadcrumb by aligning its item to the middle to adapt changing main font size.
*   Replace "@fortawesome/fontawesome-free-webfonts": "^1.0.9" with "@fortawesome/fontawesome-free": "^5.2.0" and update gulp.js file to adapt this chanage.
*   Update Dashboard Stats page by adding more block and summary cards. and Adding a new Dashboard Chart Stats page for charts stats cards using echart plugins.
*   Add a new custom page "Users Analytics Dashboard" for User Management Dashboard statistics and chart cards.
*   Solve the bug regarding disabling global blockUI using parameter \_ajaxGlobalBlockUI by setting it to false.
*   Solve the bug in sidebar when deactivate auto sidebar by navbar toggle button after it becomes shown it immediately hide. we solved it by clear the time that was responsible for hiding the sidebar when mouse leave it before deactivate this feature.
*   Update ./web/assets/src/sass/plugins/custom-metisMenu.scss file to support rotating cursor in RTL directions to down instead of above after update to version 2.7.8. Run gulp copy-components on JavaTMP-Static-Ajax and JavaTMP-Static-Ajax-RTL that will generate new ./web/components folder with new metismenu files.
*   Run gulp on JavaTMP-Static-Ajax-Starter, JavaTMP-Static-Ajax-Starter-RTL, JavaTMP-Java-Ajax-Starter and JavaTMP-User-Starter that will generate new ./web/assets/dist/css, ./web/assets/dist/js folders with new metismenu files.
*   Develop a new project JavaTMP-User-Starter, Which is an advanced dynamic Java Bootstrap User Management Web application derived from JavaTMP-Java-Ajax-Starter project with support for persistent using Mysql Database Management System through java Persistent API and hibernate JPA implementation.
*   Update date alias for inputmask plugin demo page from data-inputmask="'alias': 'date'" to data-inputmask="'alias': 'datetime', 'inputformat' : 'dd/mm/yyyy'" , then run commands "npm install" then "gulp copy-components" for JavaTMP-Static-Ajax/-RTL or default for JavaTMP-Static-Ajax-Starter/-RTL and JavaTMP-Java-Ajax-Starter.
*   Run commands "gulp copy-components" & "gulp sass" & "gulp".
*   Update the following packages and dependencies:
    *   bootstrap from 4.1.1 to 4.1.3
    *   bootstrap-reverse from 1.0.9 to 1.0.10
    *   bootstrap-slider from 10.0.2 to 10.2.0
    *   cropperjs from 1.3.6 to 1.4.1
    *   datatables.net from 1.10.16 to 1.10.19
    *   datatables.net-bs4 from 1.10.16 to 1.10.19
    *   datatables.net-fixedheader from 3.1.3 to 3.1.5
    *   datatables.net-fixedheader-bs4 from 3.1.3 to 3.1.5
    *   datatables.net-responsive from 2.2.0 to 2.2.3
    *   datatables.net-responsive-bs4 from 2.2.0 to 2.2.3
    *   datatables.net-select from 1.2.5 to 1.2.7
    *   datatables.net-select-bs4 from 1.2.5 to 1.2.7
    *   dropzone from 5.4.0 to 5.5.1
    *   gulp-clean-css from 3.9.4 to 3.10.0
    *   gulp-eslint from 4.0.2 to 5.0.0
    *   gulp-rename from 1.2.3 to 1.4.0
    *   gulp-uglify from 3.0.0 to 3.0.1
    *   jquery-contextmenu from 2.6.4 to 2.7.0
    *   jquery.fancytree from 2.28.1 to 2.29.1
    *   metismenu from 2.7.7 to 2.7.9
    *   popper.js from 1.14.3 to 1.14.4
    *   moment-timezone from 0.5.17 to 0.5.21
    *   gulp-git from 2.7.0 to 2.8.0
    *   gulp-zip from 4.1.0 to 4.2.0
    *   inputmask from 3.3.11 to 4.0.0
    *   moment from 2.22.1 to 2.22.2

73fcdf8 on Aug 26, 2018, 2:25 AM GMT+4
--------------------------------------
Refactor main JavaTMP navbar dropdown menus by separating the custom profile dropdown item to custom-bootstrap-dropdown.scss

Refactor projects by cleaning and replacing most px to rem

e8720fa on Aug 19, 2018, 10:35 AM GMT+3
---------------------------------------
Update the following packages and dependencies:

bootstrap from 4.1.1 to 4.1.3 bootstrap-reverse from 1.0.9 to 1.0.10 bootstrap-slider from 10.0.2 to 10.2.0 cropperjs from 1.4.0 to 1.4.1 datatables.net from 1.10.18 to 1.10.19 datatables.net-bs4 from 1.10.18 to 1.10.19 datatables.net-fixedheader from 3.1.4 to 3.1.5 datatables.net-fixedheader-bs4 from 3.1.4 to 3.1.5 datatables.net-responsive from 2.2.2 to 2.2.3 datatables.net-responsive-bs4 from 2.2.2 to 2.2.3 datatables.net-select from 1.2.6 to 1.2.7 datatables.net-select-bs4 from 1.2.6 to 1.2.7 dropzone from 5.4.0 to 5.5.1 gulp-clean-css from 3.9.4 to 3.10.0 gulp-eslint from 4.0.2 to 5.0.0 gulp-rename from 1.3.0 to 1.4.0 gulp-uglify from 3.0.0 to 3.0.1 jquery-contextmenu from 2.6.4 to 2.7.0 jquery.fancytree from 2.29.0 to 2.29.1 metismenu from 2.7.8 to 2.7.9 popper.js from 1.14.3 to 1.14.4 moment-timezone from 0.5.17 to 0.5.21 gulp-git from 2.7.0 to 2.8.0 gulp-zip from 4.1.0 to 4.2.0

Replace "@fortawesome/fontawesome-free-webfonts": "^1.0.9" with "@fortawesome/fontawesome-free": "^5.2.0" and update gulp.js file to adapt this chanage.

e561bdd on Aug 4, 2018, 9:54 AM GMT+4
-------------------------------------
updating breadcrumb by aligning its item to the middle to adapt changing main font size.

c7e46e9 on Jul 18, 2018, 9:54 PM GMT+4
--------------------------------------
Update Dashboard Stats page by adding more block and summary cards. and Adding a new Dashboard Chart Stats page for charts stats cards using echart plugins. Add a new custom page "Users Analytics Dashboard" for User Management Dashboard statistics and chart cards.

0c9f52d on Jun 27, 2018, 6:54 PM GMT+4
--------------------------------------
Solve the bug regarding disabling global blockUI using parameter `_ajaxGlobalBlockUI` by setting it to false

c50b321 on Jun 22, 2018, 4:53 PM GMT+4
--------------------------------------
Update the following plugins: datatables.net from 1.10.16 to 1.10.18, datatables.net-bs4 from 1.10.16 to 1.10.18, datatables.net-fixedheader from 3.1.3 to 3.1.4, datatables.net-fixedheader-bs4 from 3.1.3 to 3.1.4, datatables.net-responsive from 2.2.0 to 2.2.2, datatables.net-responsive-bs4 from 2.2.0 to 2.2.2, datatables.net-select from 1.2.5 to 1.2.6, datatables.net-select-bs4 from 1.2.5 to 1.2.6

5ac2e1b on Jun 21, 2018, 5:20 PM GMT+4
--------------------------------------
`BUG` Solve the bug in sidebar when deactivate auto sidebar by navbar toggle button after it becomes shown it immediately hide. we solved it by clear the time that was responsible for hiding the sidebar when mouse leave it before deactivate this feature.

3c184a1 on Jun 18, 2018, 5:30 AM GMT+4
--------------------------------------
update jquery.fancytree from 2.28.1 to 2.29.0 then gulp copy-components & gulp sass & gulp.

e1fc02f on Jun 18, 2018, 3:06 AM GMT+4
--------------------------------------
Rename Project JavaTMP-App-Starter to JavaTMP-User-Starter. Which is an advanced dynamic Java Bootstrap User Management Web application Starter derived from JavaTMP-Java-Ajax-Starter project with support for persistent using Database Management System like MySql through java Persistent API and hibernate JPA implementation.

ac22ba1 on Jun 16, 2018, 1:26 AM GMT+4
--------------------------------------
Update metismenu plugin from 2.7.7 ==> 2.7.8

Update `./web/assets/src/sass/plugins/custom-metisMenu.scss` file to support rotating cursor in `RTL` directions to down instead of above.

Run `gulp copy-components` on `JavaTMP-Static-Ajax` and `JavaTMP-Static-Ajax-RTL` that will generate new `./web/components` folder with new metismenu files.

Run `gulp` on `JavaTMP-Static-Ajax-Starter`, `JavaTMP-Static-Ajax-Starter-RTL`, `JavaTMP-Java-Ajax-Starter` and `JavaTMP-App-Starter` that will generate new `./web/assets/dist/css`, `./web/assets/dist/js` folders with new metismenu files.

214bf6b on Jun 12, 2018, 11:46 PM GMT+4
---------------------------------------
Update front end development dependency gulp-rename package from 1.2.3 ==> 1.3.0

3c815e2 on Jun 10, 2018, 1:59 AM GMT+4
--------------------------------------
Removing unwanted front-end pages and backend classes from JavaTMP-App-Starter to make it specific for only Java Bootstrap User Management Web Application

454e2f5 on Jun 8, 2018, 9:19 PM GMT+4
-------------------------------------
introduce new project version: JavaTMP-App-Starter. Which is a advanced dynamic Java Bootstrap User Management Web application derived from JavaTMP-Java-Ajax-Starter project with support for persistent using Database Management System like MySql through java Persistent API and hibernate JPA implementation.

192b45e on Jun 7, 2018, 12:04 AM GMT+4
--------------------------------------
Update Front end plugins in package.json

cropperjs from 1.3.6 => 1.4.0,

inputmask from 3.3.11 => 4.0.0,

moment from 2.22.1 => 2.22.2

Then run commands npm install then copy-components for JavaTMP-Static-Ajax/-RTL or default for JavaTMP-Static-Ajax-Starter/-RTL and JavaTMP-Java-Ajax-Starter.

Update date alias for inputmask plugin demo page from data-inputmask="'alias': 'date'" to data-inputmask="'alias': 'datetime', 'inputformat' : 'dd/mm/yyyy'"