---
title: JavaTMP-Static-Ajax-Starter-RTL Project Version
---
# JavaTMP-Static-Ajax-Starter-RTL Project Version

`JavaTMP-Static-Ajax-Starter-RTL` project is a mirror copy from `JavaTMP-Static-Ajax-Starter` project with a little modifications to support RTL. It consists of curated set of general static bootstrap RTL admin and dashboard components template. Our [online Starter RTL demo](http://demo.javatmp.com/JavaTMP-Static-Ajax-Starter-RTL/ "Java Bootstrap RTL Admin And Dashboard Components Template") deploys and host this version of JavaTMP.

`JavaTMP-Static-Ajax-Starter-RTL` is a front-end static project that intended to start your Bootstrap Admin or Dashboard RTL system from it. It is a [Netbeans IDE 8.2](https://netbeans.org/ "Netbeans IDE") project, so you can directly import and open it there.

`JavaTMP-Static-Ajax-Starter-RTL` project is intended to start your custom RTL project from. It contains tested curated set of RTL front-end resources and combined to simplify your development.

Kindly Read more about Bootstrap RTL modifications and customizations made in `JavatMP-Static-Ajax-RTL` to support RTL in this page [JavaTMP-Static-Ajax-RTL Project Version](/pages/javatmp-static-ajax-rtl-project-version "JavaTMP-Static-Ajax-RTL Bootstrap Admin And Dashboard RTL Template Project ")

Steps we did to produce a starter RTL version
---------------------------------------------

1.  Copy project [JavaTMP-Static-Ajax-Starter](/pages/javatmp-static-ajax-starter-project-version "Java Bootstrap Admin And Dashboard Starter Template") as is to `JavaTMP-Static-Ajax-Starter-RTL`
2.  Run `npm install` from `JavaTMP-Static-Ajax-Starter-RTL`
3.  Copy `sass-rtl` folder from `JavaTMP-Static-Ajax-RTL/web/assets/src` to `JavaTMP-Static-Ajax-Starter-RTL/web/assets/src`
4.  Update `JavaTMP-Static-Ajax-Starter-RTL/web/assets/src/sass-rtl/main-rtl.scss` file to become referencing all overriding RTL files which are:
    1.  Import Bootstrap RTL resetter `node_modules/bootstrap-reverse/src/sass/bootstrap-reverse.scss`
    2.  Import JavaTMP Base RTL Tempalte `partials-rtl/*.scss`
    3.  Import Custom RTL Plugins `plugins-rtl/*.scss`
5.  Create a `JavaTMP-Static-Ajax-Starter-RTL/web/assets/src/sass-rtl/themes-rtl` folder which will contain the rtl themes of `JavaTMP-Static-Ajax-Starter-RTL/web/assets/src/sass/themes`
6.  For each theme in `JavaTMP-Static-Ajax-Starter-RTL/web/assets/src/sass/themes` folder create a similar one in `JavaTMP-Static-Ajax-Starter-RTL/web/assets/src/sass-rtl/themes-rtl` with adding suffix `-rtl` to its name
7.  For each theme in `JavaTMP-Static-Ajax-Starter-RTL/web/assets/src/sass-rtl/themes-rtl` reference the original LTR version of it in `JavaTMP-Static-Ajax-Starter-RTL/web/assets/src/sass/themes` and the above `JavaTMP-Static-Ajax-Starter-RTL/web/assets/src/sass-rtl/main-rtl.scss`. For example, The contents of `JavaTMP-Static-Ajax-Starter-RTL/web/assets/src/sass-rtl/themes-rtl/javatmp-default-rtl.scss` is:
```
    @import "../../sass/themes/javatmp-default.scss";
    @import "../main-rtl.scss";
```
    It is a design decision to include main-rtl.scss in each LTR theme instead of reference it in html after the original one. Because we can override any variables or do any thing in the future and now we can reference only one file `javatmp-default.min.css` or `javatmp-default-rtl.min.css`

8.  Update the first step in gulp's task `generate-dist` by replacing `./web/assets/src/sass/themes/javatmp-*.scss` with `./web/assets/src/sass-rtl/themes-rtl/javatmp-*.scss`. Because RTL themes include LTR ones as described above.

    We will not repeat the description of gulp task `generate-dist` here again or how we manage front-end resource using node's npm and gulp, but for more information read the following pages:

    *   [Manage Front-end dependencies Using Node.js And Gulp](/pages/manage-front-end-dependencies-using-node-js-and-gulp "Manage Front-end dependencies Using Node.js And Gulp")
    *   [Implement gulp's task generate-dist](/pages/javatmp-static-ajax-starter-project-version#generate-dist-gulp-task "Gulp Task for create a concatenated file of all javascript and CSS files")

9.  Run `"gulp"` or `"gulp generate-dist"` from `JavaTMP-Static-Ajax-Starter-RTL`. The main different output here are mainly the generated css files as now become `./web/assets/dist/css/javatmp-*-rtl.min.css` instead of `javatmp-*.min.css`.
10.  Update index.html file by using `./web/assets/dist/css/javatmp-default-rtl.min.css` INSTEAD OF `javatmp-default.min.css` and NOT after it.
11.  Update `index.html` file by setting `dir=rtl` and `lang=en`
12.  Update `index.html` file by flipping textfield's clear button to left instead of right for sidebar search.
13.  Update `javatmp.init` invocation by setting `floatDefault: right`, `floatReverse: left`, `direction: rtl`, `isRTL: true`.
14.  Update `package.json` by adding jQuery-contextmenuRTL plugin to `package.json` dependencies. Because jQuery-contextmenu is not support RTL by default and this extension will make it supported.
15.  Update `gulpfile.js` by adding above `jQuery-contextmenuRTL` plugin reference to `config` and `src` object to fetch it and merge it with plugins js.
16.  for each plugin that need custom RTL modifications , we should apply them to that plugin.
17.  Update page Bootstrap multilevel dropdown hover.
18.  Update page Dashboard stats update cursor icons and float.
19.  Update page custom bootstrap nav item.
20.  Update page Fancytree Plain/table /checkboxes/Radio/contextmenu/drag&drop/filter by applying Fancytree RTL modifications.
21.  Update page toastr notification using rtl and show it on top left by default.
22.  Update fullcalendar pages by `isRTL: true,` and might reverse some header buttons.
23.  Update Rangedatepicker plugin page by `"opens": "right"` and use custom locale object.
24.  Update jQuery Bootstrap select2 plugin page using `dir: "rtl",` or globally by `$.fn.select2.defaults.set("dir", "rtl");`
25.  Update Bootstrap contextMenu plugin page by first adding `rtl: true,` and override position callback function. (remember that we use a special jQuery-contextMenuRtl plugin for RTL support).
26.  Update Bootstrap summernote plugin editor by `direction: 'rtl',`.
27.  Update Ion Range Slider by NOTHING as the plugin does not support RTL yet.
28.  Update Dual-Select page by switching icons.
29.  Update Datatables plugin footer/total label align to left.
30.  Update Echarts demo page for all charts apply manual RTL modifications.
31.  Update slick-carousel plugin page by `rtl: true`.
32.  Update Login & 404 demo pages by applying same index.html modifications
33.  The following plugins need modifications to support RTL:

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


`./JavaTMP/JavaTMP-Static-Ajax-Starter-RTL` Folder
--------------------------------------------------

The following tree is a high level folder structures of our `JavaTMP-Static-Ajax-Starter-RTL` web application with its description and usage:
```
./JavaTMP/JavaTMP-Static-Ajax-Starter-RTL
|---.gitignore
|---gulpfile.js
|---.eslintrc
|---package.json
+---node\_modules (Node.js's NPM local dependencies Folders)
+---nbproject (Netbeans IDE config folders and files)
+---web (Web Application Context Root Folder)
    |---index.html (Main HTML Page references Front-end Libraries from assets/dist folder)
    +---assets (Combined front-end resources and specific Template JS,CSS,fonts, and images folders and files)
    +---pages (AJAX HTML Pages referenced from index.html sidebar menu)
```
### `./JavaTMP/JavaTMP-Static-Ajax-Starter-RTL/.gitignore` file

We stored our templates in a private github repository so we add .gitignore file to exclude mainly `./node_modules` and `./nbproject/private/` folders from versioning. 

### `./JavaTMP/JavaTMP-Static-Ajax-Starter-RTL/.gulpfile.js` file

This is a gulp's configuration file. gulp is a toolkit for automating painful or time-consuming tasks in your development workflow. We use gulp to automate our building process like generating JS/CSS. The main important gulp's task in JavaTMP-Static-Ajax-Starter-RTL project is generate-dist task which described in details above and in [JavaTMP-Static-Ajax-Starter Project Version documentation page](/pages/javatmp-static-ajax-starter-project-version "Java Bootstrap Admin and Dashboard RTL Starter template documentation Page")

### `./JavaTMP/JavaTMP-Static-Ajax-Starter-RTL/.eslintrc` file

ESLint plugin configuration file which contains directive and parameters to gulp-eslint gulp plugin. the following external links provide more information about the those configuration: [Configuring ESLint](https://eslint.org/docs/user-guide/configuring "Configuring ESLint"), [A sample .eslintrc file](https://gist.github.com/adrianhall/70d63d225e536b4563b2 "A sample .eslintrc file"), [A starter .eslintrc file](https://gist.github.com/cletusw/e01a85e399ab563b1236 "A starter .eslintrc file").

### `./JavaTMP/JavaTMP-Static-Ajax-Starter-RTL/package.json` file

A Node.js's NPM meta file. This file holds various metadata relevant to the project. This file is used to give information to npm that allows it to handle the project's dependencies. 

### `./JavaTMP/JavaTMP-Static-Ajax-Starter-RTL/node_modules` folder

This folder is automatically generated by NPM to store a local copy of dependency libraries needed in your project when you invoke the command `npm install`. NPM depends on `pakcage.json` file to know which plugins and libraries need to be installed in this folder.

### `./JavaTMP/JavaTMP-Static-Ajax-Starter-RTL/nbproject` folder

The `nbproject` folder contains all the netbeans metadata about our project. We include `./nbproject`, but not `./nbproject/private`. This folder is usually not required and If you were to check out our project using a different IDE, you would not require our `nbproject` directory. In other words: This directory is Netbeans IDE specific, not project specific.

### `./JavaTMP/JavaTMP-Static-Ajax-Starter-RTL/web` folder

It is a web application context root folder contains everything related to static behavior of the template like `Javascript`, `CSS`, `font`, `images`, and `HTML` files. The following is a high level folder structures of ./JavaTMP/JavaTMP-Static-Ajax-Starter-RTL/web folder with its description and usage:
```
./JavaTMP/JavaTMP-Static-Ajax-Starter-RTL/web
|---index.html (Main HTML RTL Page references Front-end Libraries from assets/dist folder)
+---assets (Specific Template JS,CSS,fonts, and images folders and files)
    +---data (static json files used for ajax demos)
    +---dist (Combined and concatenated front-end resources described above in gulp task generate-dist)
    +---img (demo images and avatars used as a demo purposes)
    +---src (source JS/SASS files)
        +---fonts (binary fonts files moved to assets/dist through generate-dist gulp task above)
        +---js-src (Source Javascript folder)
        +---sass (all source SASS files with bootstrap themes and template files)
        +---sass-rtl (all source SASS RTL files with bootstrap themes and template files)
+---pages (AJAX HTML snippets for template pages)
    |---home.html
    +---bootstrap
    +---chart
    +---custom-components
    +---custom-pages
    +---form
    +---gallery
    +---plugins
    +---table
    +---themes
    +---wizard
```
The following HTML page code provide the main referenced resources in `./JavaTMP/JavaTMP-Static-Ajax-Starter-RTL/web/index.html` file:
```html
<!doctype html>
<html lang="en" dir="rtl">
    <head>
        <title>JavaTMP Bootstrap Admin and Dashboard RTL Starter Template</title>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link href="assets/dist/css/javatmp-plugins-all.min.css" rel="stylesheet" type="text/css"/>
        <link href='assets/dist/css/javatmp-plugins-print-all.min.css' rel='stylesheet' media='print' />
        <link id="themeStyleSheet" href="assets/dist/css/javatmp-default-rtl.min.css" rel="stylesheet" type="text/css"/>
        <link href="assets/dist/css/font-family-en.min.css" rel="stylesheet" type="text/css"/>
    </head>
    <body class="sidebar-active">
        ...
        <script src="assets/dist/js/javatmp-plugins-all.min.js" type="text/javascript"></script>
        <script src="assets/dist/js/javatmp.min.js" type="text/javascript"></script>
        ...
    </body>
</html>
```
## `./JavaTMP/JavaTMP-Static-Ajax-Starter-RTL.zip` file

It is our Starter RTL online demo version of JavaTMP-Static-Ajax-Starter-RTL project. we provide it without any modification and we were deploying our online demo at [http://demo.javatmp.com/JavaTMP-Static-Ajax-Starter-RTL/](http://demo.javatmp.com/JavaTMP-Static-Ajax-Starter-RTL/ "RTL Java Bootstrap Admin And Dashboard Components Template") from this file. We generated it using the following special gulp's tasks:
```js
gulp.src('./JavaTMP-Static-Ajax-Starter-RTL/web/\*\*/\*', {dot: true})
        .pipe(gulp.dest("./online-static-demo-rtl"));
del.sync(\['./online-static-demo-rtl/assets/src'\]);
gulp.src(\['./online-static-demo-rtl/\*\*/\*.html'\], {dot: true})
        .pipe(htmlmin({collapseWhitespace: true, minifyCSS: true, minifyJS: true, removeComments: true}))
        .pipe(gulp.dest("./online-static-demo-rtl"));
gulp.src(\['./online-static-demo-rtl/\*\*/\*'\], {dot: true})
        .pipe(chmod(0o644, true))
        .pipe(zip('JavaTMP-Static-Ajax-Starter-RTL.zip'))
        .pipe(gulp.dest('./'));
```