---
title: Bootstrap RTL support and modifications
---
# Bootstrap RTL support and modifications

We used the idea of overriding classes and rules on `sass` folder
to produce RTL folder `sass-rtl`. As you will see shortly we copied sass folder
as is and provide another folder sass-rtl for overriding classes and tags
that need a directional modification to support RTL.

We used [Bootstrap reverse Plugin](https://github.com/JavaTMP/bootstrap-reverse "Bootstrap 4
RTL plugin to support RTL template and skin theme") for overriding core bootstrap classes
to support Right to Left directional behavior instead of left to right.

We copied and overrode from `./JavaTMP/*/web/assets/src/sass` only classes that need to be
flipped to support RTL and put them in `/JavaTMP/*/web/assets/src/sass-rtl`.
So we should reference both of them for the same part to support RTL as we'll see later.

The `./JavaTMP/*/web/assets/src/sass/common/variables.scss` file is still the central main variables file for LTR and RTL features.

The `main-rtl.scss` and its compiled version `main-rtl.min.css` file is the overriding
for `main.scss` and should be referenced after `main.min.css`.

For plugins we modified and add RTL modifications to custom LTR SASS version for the plugin,
because most Plugin RTL modification is a little and normally should be part of the plugin style itself.
keep in mind that most plugins support RTL by default.

Custom plugin RTL style rules are separated in `./JavaTMP/*/web/assets/src/sass-rtl/plugins-rtl`
for [Datatables plugin](https://datatables.net/ "Datatables Plugin")
because Datatables plugin does not provide support for RTL pages so we overrode some of its rules and classes in these files:
*   custom-dataTables.bootstrap4-rtl.scss
*   custom-datatables.net-responsive-bs4-rtl.scss
*   custom-datatables.net-select-bs4-rtl.scss

The following is a high level folder structures of our `sass` and `sass-rtl`:
```
./JavaTMP/JAVATMP-Static-Ajax,JAVATMP-Java-Ajax,JAVATMP-User-Starter
+---web (Web Application Context Root Folder)
    +---assets (Specific Template JS,CSS,fonts, and images folders and files)
        +---src (Source folder of the JS/CSS files)
            +---sass (Default SASS' SCSS source folders)
            +---sass-rtl (RTL specific classes and rules)
```

## Steps we did to produce a starter RTL version
---------------------------------------------
1.  Copy project [JavaTMP-Static-Ajax](/pages/javatmp-static-ajax-project-version "Java Bootstrap Admin And Dashboard Template")
as is to `JavaTMP-Static-Ajax-RTL`
2.  Run `npm install` from `JavaTMP-Static-Ajax-RTL`
3.  Copy `sass-rtl` folder from `JavaTMP-Static-Ajax-RTL/web/assets/src` to `JavaTMP-Static-Ajax-RTL/web/assets/src`
4.  Update `JavaTMP-Static-Ajax-RTL/web/assets/src/sass-rtl/main-rtl.scss` file to become referencing all overriding RTL files
which are:
    1.  Import Bootstrap RTL resetter `./node_modules/bootstrap-reverse/src/sass/bootstrap-reverse.scss`
    2.  Import JavaTMP Base RTL Tempalte `partials-rtl/*.scss`
    3.  Import Custom RTL Plugins `plugins-rtl/*.scss`
5.  Create a `JavaTMP-Static-Ajax-RTL/web/assets/src/sass-rtl/themes-rtl` folder which will contain the rtl themes of `JavaTMP-Static-Ajax-RTL/web/assets/src/sass/themes`
6.  For each theme in `JavaTMP-Static-Ajax-RTL/web/assets/src/sass/themes` folder create a similar one in `JavaTMP-Static-Ajax-RTL/web/assets/src/sass-rtl/themes-rtl` with adding suffix `-rtl` to its name
7.  For each theme in `JavaTMP-Static-Ajax-RTL/web/assets/src/sass-rtl/themes-rtl` reference the original LTR version of it in `JavaTMP-Static-Ajax-RTL/web/assets/src/sass/themes` and the above `JavaTMP-Static-Ajax-RTL/web/assets/src/sass-rtl/main-rtl.scss`. For example, The contents of `JavaTMP-Static-Ajax-RTL/web/assets/src/sass-rtl/themes-rtl/javatmp-default-rtl.scss` is:
```
    @import "../../sass/themes/javatmp-default.scss";
    @import "../main-rtl.scss";
```
    It is a design decision to include main-rtl.scss in each LTR theme instead of reference it in html after the original one. Because we can override any variables or do any thing in the future and now we can reference only one file `javatmp-default.min.css` or `javatmp-default-rtl.min.css`

8.  Update the first step in gulp's task `generate-dist` by replacing `./web/assets/src/sass/themes/javatmp-*.scss` with `./web/assets/src/sass-rtl/themes-rtl/javatmp-*.scss`. Because RTL themes include LTR ones as described above.

    We will not repeat the description of gulp task `generate-dist` here again or how we manage front-end resource using node's npm and gulp, but for more information read the following pages:

    *   [Manage Front-end dependencies Using Node.js And Gulp](/pages/manage-front-end-dependencies-using-node-js-and-gulp "Manage Front-end dependencies Using Node.js And Gulp")
    *   [Implement gulp's task generate-dist](/pages/javatmp-static-ajax-project-version#generate-dist-gulp-task "Gulp Task for create a concatenated file of all javascript and CSS files")

9.  Run `"gulp"` or `"gulp generate-dist"` from `JavaTMP-Static-Ajax-RTL`. The main different output here are mainly the generated css files as now become `./web/assets/dist/css/javatmp-*-rtl.min.css` instead of `javatmp-*.min.css`.
10. Update index.html file by using `./web/assets/dist/css/javatmp-default-rtl.min.css` INSTEAD OF `javatmp-default.min.css` and NOT after it.
11. Update `index.html` file by setting `dir=rtl` and `lang=en`
12. Update `index.html` file by flipping textfield's clear button to left instead of right for sidebar search.
13. Update `javatmp.init` invocation by setting `floatDefault: right`, `floatReverse: left`, `direction: rtl`, `isRTL: true`.
14. Update `package.json` by adding jQuery-contextmenuRTL plugin to `package.json` dependencies. Because jQuery-contextmenu is not support RTL by default and this extension will make it supported.
15. Update `gulpfile.js` by adding above `jQuery-contextmenuRTL` plugin reference to `config` and `src` object to fetch it and merge it with plugins js.
16. for each plugin that need custom RTL modifications , we should apply them to that plugin.
17. Update page Bootstrap multilevel dropdown hover.
18. Update page Dashboard stats update cursor icons and float.
19. Update page custom bootstrap nav item.
20. Update page Fancytree Plain/table /checkboxes/Radio/contextmenu/drag&drop/filter by applying Fancytree RTL modifications.
21. Update page toastr notification using rtl and show it on top left by default.
22. Update fullcalendar pages by `isRTL: true,` and might reverse some header buttons.
23. Update Rangedatepicker plugin page by `"opens": "right"` and use custom locale object.
24. Update jQuery Bootstrap select2 plugin page using `dir: "rtl",` or globally by `$.fn.select2.defaults.set("dir", "rtl");`
25. Update Bootstrap contextMenu plugin page by first adding `rtl: true,` and override position callback function. (remember that we use a special jQuery-contextMenuRtl plugin for RTL support).
26. Update Bootstrap summernote plugin editor by `direction: 'rtl',`.
27. Update Ion Range Slider by NOTHING as the plugin does not support RTL yet.
28. Update Dual-Select page by switching icons.
29. Update Datatables plugin footer/total label align to left.
30. Update Echarts demo page for all charts apply manual RTL modifications.
31. Update slick-carousel plugin page by `rtl: true`.
32. Update Login & 404 demo pages by applying same index.html modifications
33. The following plugins need modifications to support RTL:
    `fontawesome-free-webfonts`
    it is better to check your icons for LTR/RTL direction. so you could create a general icon and switch it in rtl version. also spinning might want to be round to left instead of clockwise

    `font-awesome-animation`
    You might want the icons to animation with respect to left instead of right in RTL version.

    `metismenu`
    the cursor icons should be switch in RTL version.

    `nprogress`
    should start from right and end at left in RTL version.

    `jquery.fancytree`
    should apply rtl options to work properly.

    `jquery-contextmenu`
    should apply rtl plugin and options to work properly

    `toastr`
    should apply rtl option and make it shown on top left instead of top right in RTL version.

    `moment`
    for each locale you should reference its specific js file or include moment all locales js file `moment/min/locales.min.js`

    `bootstrap-daterangepicker`
    apply rtl custom options and could override locale values.

    `select2`
    apply rtl direction option

    `summernote`
    apply rtl option and include locale file

    `fullcalendar`
    apply rtl option and include locale file

    `jquery-validation`
    add custom localization file for each desire language and locale.

## `./JavaTMP/JavaTMP-Static-Ajax/web/index-rtl.html` file

The following list provides the main modifications applied for `index.html` to support RTL:
*   Modified `HTML` tag by adding `dir="rtl"` and `lang="en"`.
*   Reference `-rtl` version instead of normal one for javatmp style used:
    ```
    <link id="themeStyleSheet" href="assets/dist/css/javatmp-default-rtl.min.css" rel="stylesheet" type="text/css"/>
    ```
*   Added custom Javascript event handler for modifying dropdown's position. Because default behavior for popper.js is wrongly position it in RTL HTML pages with issues and problems.
*   Initialize JavaTMP Javascript by calling javatmp.init method and explicitly override the languages and directional attributes : `direction:"rtl"`,
`isRTL=true`, `floatDefault="right"`, and `floatReverse="left"`
    ```Javascript
    <script type="text/javascript">
        jQuery(function ($) {
            var defaults = {
                    floatDefault: 'right',
                    floatReverse: 'left',
                    direction: "rtl",
                    isRTL: true
                };
            index.init(defaults);
        });
    </script>
    ```
*   For more details information about custom plugins modifications and usages to support RTL and internationalization features kindly see our [Front-end Plugins And Frameworks documentation page](/pages/javatmp-front-end-plugins-and-frameworks "JavaTMP Front-end Plugins And Frameworks").
