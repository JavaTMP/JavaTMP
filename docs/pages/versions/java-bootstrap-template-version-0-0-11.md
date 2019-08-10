---
title: Java Bootstrap Template Version 0.0.11 (Current Development Version)
---
# {{ page.title }}

## a25ce0e on Aug 10, 2019, 7:42 PM GMT+4
- Create a landing Empty starter page `./JavaTMP-Static-Ajax/web/pages/custom-pages/landing-pages/landing-empty-starter.html`
- Create a landing RTL Arabic Empty starter page `./JavaTMP-Static-Ajax/web/pages/custom-pages/landing-pages/landing-empty-starter-ar.html`
to start public web site pages from.
- Create a landing Section starter page `./JavaTMP-Static-Ajax/web/pages/custom-pages/landing-pages/landing-sections-starter.html`
- Update copyright year.
- override `$text-muted` variable by setting it to `$gray-800` instead of default `$gray-600` in javatmp-schooly theme

## 9f101ef on Aug 9, 2019, 9:03 PM GMT+4
- Make the JavaTMP schooly style (javatmp-schooly.min.css or javatmp-schooly-rtl.min.css) default style for our templates
- Create a default admin layout by including all partials scss file inside `html.javatmp-default-admin-layout` selector. So
you should add a class `javatmp-default-admin-layout` to html tag to use the default admin layout style.
- Update all html pages that use javatmp-default.min.css to use javatmp-schooly.min.css
- Update all html pages that use javatmp-default-rtl.min.css to use javatmp-schooly-rtl.min.css
- Update all admin dashboard html pages index-rtl.html/index.html that use `javatmp-default-admin-layout` class in html tag.
- Update `/web/pages/plugins/metisMenu.html` page to reference www.javatmp.com site for links.
- Update `\src\java\com\javatmp\i18n\*.properties` files by setting `global.defaultThemeName=schooly` to make default
theme for public and login pages.
- Update base.scss by style element `.main-body-content-container` by padding-top only if it is only adjacent sibling
of `.main-breadcrumb-bar`. So you remove tag `.main-breadcrumb-bar` element `.main-body-content-container` will have zero
top padding.
- Update the following dependencies:
    - @fortawesome/fontawesome-free from 5.10.0 to 5.10.1
    - cropperjs from 1.5.4 to 1.5.5
- Run gulp default to regenerate dist folders.

## d55d911 on Aug 5, 2019, 9:09 PM GMT+4
- Remove alert comments from JSP pages.
- rename javatmp.plugins.js to javatmp.plugins.wrapper.js and reference new file in pages.

## f86590d on Aug 2, 2019, 7:47 PM GMT+4
- Update the following dependencies
    - gulp-header from 2.0.7 to 2.0.9
    - gulp-if from 2.0.2 to 3.0.0
    - @fortawesome/fontawesome-free from 5.9.0 to 5.10.0
    - bootstrap-slider from 10.6.1 to 10.6.2
    - cropperjs from 1.5.2 to 1.5.4
    - moment-timezone from 0.5.25 to 0.5.26
    - select2 from 4.0.7 to 4.0.8
- Run gulp default to regenerate dist folders.

## 3752ee3 on Jul 12, 2019, 11:31 PM GMT+4
- update `\web\assets\app\js\javatmp.plugins.js` file to use local settings.

## 88482b0 on Jul 5, 2019, 11:41 PM GMT+4
- Update the following dependencies
    - bootstrap-modal-wrapper from 1.0.18 to 2.0.0
    - bootstrap-actionable from 1.0.11 to 1.0.12
    - @fortawesome/fontawesome-free from 5.8.2 to 5.9.0
- Update demo page for `bootstrap-modal-wrapper` `pages/plugins/bootstrap-modal-wrapper.html`
- Update demo page for modal ajax response `pages/custom-pages/inbox/ajax/blank-ajax-response.html`
- Update all demo pages that use `bootstrap-modal-wrapper` with new features.
- Update most of JavaTMP-User-Starter pages that use `bootstrap-modal-wrapper` with new features.
- Run gulp default to regenerate dist folders.

## fdeb573 on Jul 4, 2019, 3:08 PM GMT+4
- Update the following dependencies
    - del from 4.1.1 to 5.0.0
    - gulp-eslint from 5.0.0 to 6.0.0
    - async from 3.0.1 to 3.1.0
    - bootstrap-modal-wrapper from 1.0.16 to 1.0.18
    - cropperjs from 1.5.1 to 1.5.2
    - jquery-validation from 1.19.0 to 1.19.1
- Update demo page for `bootstrap-modal-wrapper` `pages/plugins/bootstrap-modal-wrapper.html`
- Run gulp default to regenerate dist folders.
