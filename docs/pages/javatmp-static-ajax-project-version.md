---
title: JavaTMP-Static-Ajax Project Version
---
# JavaTMP-Static-Ajax Project Version

`./JavaTMP/JavaTMP-Static-Ajax` Folder
----------------------------------------------

`JavaTMP-Static-Ajax` consists of combined resources of general static bootstrap LTR/RTL admin and dashboard components template.
Our [online starter demo](http://demo.javatmp.com/JavaTMP-Static-Ajax/ "Java Bootstrap Admin And Dashboard Components Template")
deploys and host this version of JavaTMP. It is a [Netbeans IDE 8.2](https://netbeans.org/ "Netbeans IDE") project,
so you can directly import and open it there. `JavaTMP-Static-Ajax` project is intended to start your custom project from.
It contains tested curated set of front-end resources and combined to simplify your development.

The following tree is a high level folder structures of our `JavaTMP-Static-Ajax` web application with its description and usage:
```
./JavaTMP/JAVATMP-STATIC-AJAX
|---.eslintrc
|---.gitignore
|---gulpfile.js
|---package.json
+---node_modules (Node.js's NPM local dependencies Folders)
+---nbproject (Netbeans IDE config folders and files)
+---web (Web Application Context Root Folder)
    |---index.html (Main LTR HTML Page references Front-end Libraries from assets/dist folder)
    |---index-rtl.html (Main RTL HTML Page references Front-end Libraries from assets/dist folder)
    +---assets (Combined front-end resources and specific Template JS,CSS,fonts, and images folders and files)
    +---pages (AJAX HTML Pages referenced from index.html sidebar menu)
```

### `./JavaTMP/JavaTMP-Static-Ajax/.gitignore` file
We stored our templates in a private github repository
so we add .gitignore file to exclude mainly `./node_modules`
and `./nbproject/private/` folders from versioning. 

### `./JavaTMP/JavaTMP-Static-Ajax/.gulpfile.js` file
This is a gulp's configuration file. `Gulp` is a toolkit for automating painful
or time-consuming tasks in your development workflow. We use gulp to automate
our building process like generating JS/CSS. 

The main important gulp tasks are `generate-dist` which copy resources
from node_module folder and combine them after compile and generate theme
and template Javascript and CSS files and folders.

The gulp's task `generate-dist` depends on task `copy-components` described in details in page
[Managing Front-end dependencies Using Node.js And Gulp](/pages/manage-front-end-dependencies-using-node-js-and-gulp "Manage Front-end dependencies Using Node.js And Gulp")
which copy all components defined in config object from `./node_modules` to `./web/components`

The gulp's task `generate-dist` depends too on `src` object that define wanted resources and plugins to be combined together,
kindly refer to `src` object in gulpfile.js for more information about it.

The Gulp's task `generate-dist` task makes the following things:
1.  Compile the SASS Bootstrap themes found in `./web/assets/src/sass/themes/javatmp-*.scss` and generate base template CSS file and move them to `./web/assets/dist/css` folder
2.  Concatenate all CSS files found in above `src.css` in order and put the concatenated file in `./web/assets/dist/css/javatmp-plugins-all.min.css`
3.  Concatenate all CSS files found in above `src.cssForPrint` in order and put the concatenated file in `./web/assets/dist/css/javatmp-plugins-print-all.min.css`
4.  Generate and uglify main JavaTMP template Javascript file `javatmp.min.js` in `./web/assets/src/js-src/javatmp.js` to `./web/assets/dist/js/javatmp.min.js`
5.  Concatenate all JS files found in above `src.js` in order and put the concatenated file `./web/assets/dist/js/javatmp-plugins-all.min.js`
6.  Compile and generate a minification version of `src.fontFamilyFiles` and put the css file in `./web/assets/dist/css`, in above case `./web/assets/dist/css/font-family-en.min.css`
7.  Copy `src.img` files needed by plugins to `./web/assets/dist/img` folder
8.  Copy binary fonts files needed by plugins and template from `src.fonts` to `./web/assets/dist/fonts folder`
9.  finally, remove `./web/components` folder as all front-end resources became combined and concatenated in TWO BIG LARGE MAIN files `javatmp-plugins-all.min.css` and `javatmp-plugins-all.min.js`

So, The main output of `generate-dist` task is folder `./web/assets/dist` which contains the following:
```
./JavaTMP/JavaTMP-Static-Ajax/web/assets/dist
+---css
    +---font-family-en.min.css
    +---javatmp-plugins-all.min.css
    +---javatmp-plugins-print-all.min.css
    +---javatmp-*.min.css (For each SASS theme files like javatmp-default.min.css)
    +---javatmp-*-rtl.min.css (For each SASS theme files like javatmp-default-rtl.min.css)
+---fonts
    +---context-menu-icons.eot
    +---fa-brands-400.eot
    +---open-sans-v15-latin-300.eot
    +---slick.eot
    +---summernote.eot
    +---...
+---img
    +---ajax-loader.gif
    +---mCSB_buttons.png
+---js
    +---javatmp-plugins-all-locale-*.min.js (For each Locale key defines `src.localeJS` object like `src.localeJS.en`)
    +---javatmp-plugins-all.min.js
    +---javatmp.min.js
```
### `./JavaTMP/JavaTMP-Static-Ajax/.eslintrc` file

ESLint plugin configuration file which contains directive and parameters to gulp-eslint gulp plugin. the following external links provide more information about the those configuration: [Configuring ESLint](https://eslint.org/docs/user-guide/configuring "Configuring ESLint"), [A sample .eslintrc file](https://gist.github.com/adrianhall/70d63d225e536b4563b2 "A sample .eslintrc file"), [A starter .eslintrc file](https://gist.github.com/cletusw/e01a85e399ab563b1236 "A starter .eslintrc file").

### `./JavaTMP/JavaTMP-Static-Ajax/package.json` file

A Node.js's NPM meta file. This file holds various metadata relevant to the project. This file is used to give information to npm that allows it to handle the project's dependencies. 

### `./JavaTMP/JavaTMP-Static-Ajax/node_modules` folder

This folder is automatically generated by NPM to store a local copy of dependency libraries needed in your project when you invoke the command `npm install`. NPM depends on `pakcage.json` file to know which plugins and libraries need to be installed in this folder.

### `./JavaTMP/JavaTMP-Static-Ajax/nbproject` folder

The `nbproject` folder contains all the netbeans metadata about our project. We include `./nbproject`, but not `./nbproject/private`. This folder is usually not required and If you were to check out our project using a different IDE, you would not require our `nbproject` directory. In other words: This directory is Netbeans IDE specific, not project specific.

### `./JavaTMP/JavaTMP-Static-Ajax/web` folder

It is a web application context root folder contains everything related to static behavior of the template like `Javascript`, `CSS`, `font`, `images`, and `HTML` files. The following is a high level folder structures of ./JavaTMP/JavaTMP-Static-Ajax/web folder with its description and usage:
```
./JavaTMP/JavaTMP-Static-Ajax/web
|---index.html (Main HTML Page references Front-end Libraries from assets/dist folder)
+---assets (Specific Template JS,CSS,fonts, and images folders and files)
    +---data (static json files used for ajax demos)
    +---dist (Combined and concatenated front-end resources described above in gulp task generate-dist)
    +---img (demo images and avatars used as a demo purposes)
    +---src (source JS/SASS files)
        +---fonts (binary fonts files moved to assets/dist through generate-dist gulp task above)
        +---js-src (Source Javascript folder)
        +---sass (all source SASS files with bootstrap themes and template files)
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
### Important Notes
*   `./JavaTMP/JavaTMP-Static-Ajax/web/index.html` above reference combined concatenated JS/CSS files generated
    in gulp's task `generate-dist` and based on the following starter HTML LTR page:
```HTML
    <!doctype html>
    <html lang="en" dir="ltr">
        <head>
            <link href="assets/dist/css/javatmp-plugins-all.min.css" rel="stylesheet" type="text/css"/>
            <link href='assets/dist/css/javatmp-plugins-print-all.min.css' rel='stylesheet' media='print' />
            <link href="assets/dist/css/javatmp-default.min.css" rel="stylesheet" type="text/css"/>
            <link href="assets/dist/css/font-family-en.min.css" rel="stylesheet" type="text/css"/>
        </head>
        <body>
            ...
            <script src="assets/dist/js/javatmp-plugins-all.min.js" type="text/javascript"></script>
            <script src="assets/dist/js/javatmp-plugins-all-locale-en.min.js" type="text/javascript"></script>
            <script src="assets/dist/js/javatmp.min.js" type="text/javascript"></script>
            ...
        </body>
    </html>
```
*   `./JavaTMP/JavaTMP-Static-Ajax/web/index-rtl.html` above reference combined concatenated JS/CSS files generated
    in gulp's task `generate-dist` and based on the following starter HTML RTL page:
```HTML
    <!doctype html>
    <html lang="en" dir="rtl">
        <head>
            <link href="assets/dist/css/javatmp-plugins-all.min.css" rel="stylesheet" type="text/css"/>
            <link href='assets/dist/css/javatmp-plugins-print-all.min.css' rel='stylesheet' media='print' />
            <link href="assets/dist/css/javatmp-default-rtl.min.css" rel="stylesheet" type="text/css"/>
            <link href="assets/dist/css/font-family-en.min.css" rel="stylesheet" type="text/css"/>
        </head>
        <body>
            ...
            <script src="assets/dist/js/javatmp-plugins-all.min.js" type="text/javascript"></script>
            <script src="assets/dist/js/javatmp-plugins-all-locale-en.min.js" type="text/javascript"></script>
            <script src="assets/dist/js/javatmp.min.js" type="text/javascript"></script>
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
            ...
        </body>
    </html>
```
*   The main sass file that include bootstrap and template sass file and override
    it is `./JavaTMP/*/web/assets/src/sass/main.scss` that was
    referenced by `./JavaTMP/*/web/assets/src/sass/themes/javatmp-default.scss`
    which the later referenced in all other theme files resided in `./web/assets/src/sass/themes`. This main.scss file includes and references the following resources:
    1.  Import JavaTMP Global Variables
    2.  Import original Bootstrap SCSS file
    3.  Import JavaTMP Base Tempalte SCSS files
    4.  Import Custom Plugins SCSS files that Override default plugins CSS rules
    5.  Import demo pages scss files

## `./JavaTMP/javatmp-static-ajax.zip` file
It is our online demo version of JavaTMP-Static-Ajax project. we provide it without any modification and we were deploying
our online demo [http://demo.javatmp.com/JavaTMP-Static-Ajax/](http://demo.javatmp.com/JavaTMP-Static-Ajax/ "Java Bootstrap Admin And Dashboard Components Template")
from this file. We generated it using the following special gulp's tasks:
```javascript
gulp.src('./JavaTMP-Static-Ajax/web/**/*', {dot: true})
        .pipe(gulp.dest("./online-static-demo"));
del.sync(['./online-static-demo/assets/src']);
gulp.src(['./online-static-demo/**/*.html'], {dot: true})
        .pipe(htmlmin({collapseWhitespace: true, minifyCSS: true, minifyJS: true, removeComments: true}))
        .pipe(gulp.dest("./online-static-demo"));
gulp.src(['./online-static-demo/**/*'], {dot: true})
        .pipe(chmod(0o644, true))
        .pipe(zip('javatmp-static-ajax.zip'))
        .pipe(gulp.dest('./'));
```
