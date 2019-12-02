---
title: Bootstrap RTL support and modifications
---
# {{ page.title }}

We used the idea of overriding classes and rules on `sass` folder
to produce RTL folder `sass-rtl`. As you will see shortly we copied sass folder
as is and provide another folder sass-rtl for overriding classes and tags
that need a directional modification to support RTL.

We used [Bootstrap reverse Plugin](https://github.com/JavaTMP/bootstrap-reverse "Bootstrap 4
RTL plugin to support RTL template and skin theme") for overriding core bootstrap classes
to support Right to Left directional behavior instead of left to right.

We copied and overrode from `./web/assets/src/sass` only classes that need to be
flipped to support RTL and put them in `/web/assets/src/sass-rtl`.
So we should reference both of them for the same part to support RTL as we'll see later.

The `./web/assets/src/sass/common/variables.scss` file is still the central main variables file for LTR and RTL features.

The `main-rtl.scss` and file is the overriding for `main.scss` and should be referenced after `main.scss` in your theme RTL file.

For plugins we modified and add RTL modifications to custom LTR SASS version for the plugin,
because most Plugin RTL modification is a little and normally should be part of the plugin style itself.
keep in mind that most plugins support RTL by default.

Custom plugin RTL style rules are separated in `./web/assets/src/sass-rtl/plugins-rtl`
but for only [Datatables plugin](https://datatables.net/ "Datatables Plugin")
because Datatables plugin does not provide support for RTL pages so we overrode some of its rules and classes in these files:
*   custom-dataTables.bootstrap4-rtl.scss
*   custom-datatables.net-responsive-bs4-rtl.scss
*   custom-datatables.net-select-bs4-rtl.scss

The following is a high level folder structures of our `sass` and `sass-rtl`:
```
./JavaTMP/JavaTMP-User-Starter
+---web (Web Application Context Root Folder)
    +---assets (Specific Template JS,CSS,fonts, and images folders and files)
        +---src (Source folder of the JS/CSS files)
            +---sass (Default SASS' SCSS source folders)
            +---sass-rtl (RTL specific classes and rules)
```

## Steps we did to produce RTL version
1.  Create `./web/assets/src/sass-rtl/main-rtl.scss` file to reference all overriding RTL files. Which are:
    1.  Import Bootstrap RTL resetter `./node_modules/bootstrap-reverse/src/sass/bootstrap-reverse.scss`
    2.  Import JavaTMP Base RTL Tempalte `partials-rtl/*.scss`
    3.  Import Custom RTL Plugins `plugins-rtl/*.scss`
2.  Create a `./web/assets/src/sass-rtl/themes-rtl` folder which will contain
    the rtl themes of `./web/assets/src/sass/themes`
3.  For each theme in `./web/assets/src/sass/themes` folder create a similar one in `./web/assets/src/sass-rtl/themes-rtl` with adding suffix `-rtl` to its name
4.  For each theme in `./web/assets/src/sass-rtl/themes-rtl` reference the original LTR version of it
    in `./web/assets/src/sass/themes` and the above `./web/assets/src/sass-rtl/main-rtl.scss`.
    For example, The contents of `./web/assets/src/sass-rtl/themes-rtl/javatmp-default-rtl.scss` is:
```
    @import "../../sass/themes/javatmp-default.scss";
    @import "../main-rtl.scss";
```
    It is a design decision to include main-rtl.scss in each LTR theme instead of referencing it in html after the original one.
    Because we can override any variables or do any thing in the future and now we can reference only one file
    `javatmp-default.min.css` or `javatmp-default-rtl.min.css`
5.  Update the first step in gulp's task `generate-dist` by replacing `./web/assets/src/sass/themes/javatmp-*.scss` with `./web/assets/src/sass-rtl/themes-rtl/javatmp-*.scss`. Because RTL themes include LTR ones as described above.

    We will not repeat the description of gulp task `generate-dist` here again or how we manage front-end resource using node's npm and gulp, but for more information read the following pages:

    *   [Manage Front-end dependencies Using Node.js And Gulp](/pages/manage-front-end-dependencies-using-node-js-and-gulp "Manage Front-end dependencies Using Node.js And Gulp")

6.  Run `"gulp"` or `"gulp generate-dist"`.
The main different output here are mainly the generated css files as now become
`./src/main/webapp/assets/dist/css/javatmp-*-rtl.min.css` instead of `javatmp-*.min.css`.
7. Update `index.jsp` file by using `./src/main/webapp/assets/dist/css/javatmp-default-rtl.min.css` INSTEAD OF `javatmp-default.min.css` and NOT after it.
8. Update `index.jsp` file by setting `dir=rtl` and `lang=en`
9. Update `index.jsp` file by flipping textfield's clear button to left instead of right for sidebar search.
10. Update `index.jsp` by adding custom Javascript event handler for modifying dropdown's position. Because default behavior for popper.js is wrongly position it in RTL HTML pages with issues and problems.
11. Update `javatmp.init` invocation by setting `floatDefault: right`, `floatReverse: left`, `direction: rtl`, `isRTL: true`.
12. Update `package.json` by adding jQuery-contextmenuRTL plugin to `package.json` dependencies. Because jQuery-contextmenu is not support RTL by default and this extension will make it supported.
13. Update `gulpfile.js` by adding above `jQuery-contextmenuRTL` plugin reference to `config` and `src` object to fetch it and merge it with plugins js.
14. for each plugin that need custom RTL modifications , we should apply them to that plugin.
15. Update page Bootstrap multilevel dropdown hover.
16. Update page Dashboard stats update cursor icons and float.
17. Update page custom bootstrap nav item.
18. Update page Fancytree Plain/table /checkboxes/Radio/contextmenu/drag&drop/filter by applying Fancytree RTL modifications.
19. Update page toastr notification using rtl and show it on top left by default.
20. Update fullcalendar pages by `isRTL: true,` and might reverse some header buttons.
21. Update Rangedatepicker plugin page by `"opens": "right"` and use custom locale object.
22. Update jQuery Bootstrap select2 plugin page using `dir: "rtl",` or globally by `$.fn.select2.defaults.set("dir", "rtl");`
23. Update Bootstrap contextMenu plugin page by first adding `rtl: true,` and override position callback function. (remember that we use a special jQuery-contextMenuRtl plugin for RTL support).
24. Update Bootstrap summernote plugin editor by `direction: 'rtl',`.
25. Update Ion Range Slider by NOTHING as the plugin does not support RTL yet.
26. Update Dual-Select page by switching icons.
27. Update Datatables plugin footer/total label align to left.
28. Update Echarts demo page for all charts apply manual RTL modifications.
29. Update slick-carousel plugin page by `rtl: true`.
30. Update Login & 404 demo pages by applying same index.jsp modifications
31. The following plugins need modifications to support RTL:
    `fontawesome-free-webfonts`
    it is better to check your icons for LTR/RTL direction. so you could create
    a general icon and switch it in rtl version. also spinning might want to be
    round to left instead of clockwise

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

For more details information about custom plugins modifications and usages to support RTL and internationalization features
kindly see our [Front-end Plugins And Frameworks documentation page](/pages/reference/javatmp-front-end-plugins-and-frameworks).
