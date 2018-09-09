---
title: JavaTMP-Static-Ajax-Starter Project Version
---
# JavaTMP-Static-Ajax-Starter Project Version

`./JavaTMP/JavaTMP-Static-Ajax-Starter` Folder
----------------------------------------------

`JavaTMP-Static-Ajax-Starter` consists of combined resources of general static bootstrap admin and dashboard components template. Our [online starter demo](http://demo.javatmp.com/JavaTMP-Static-Ajax-Starter/ "Java Bootstrap Admin And Dashboard Starter Components Template") deploys and host this version of JavaTMP.

JavaTMP-Static-Ajax-Starter is a front-end static project copied from `JavaTMP-Static-Ajax` project after removing from it unwanted plugins and resources and finally combined the Javascript and CSS resources. It is a [Netbeans IDE 8.2](https://netbeans.org/ "Netbeans IDE") project, so you can directly import and open it there.

`JavaTMP-Static-Ajax-Starter` project is intended to start your custom project from. It contains tested curated set of front-end resources and combined to simplify your development.

The following tree is a high level folder structures of our `JavaTMP-Static-Ajax-Starter` web application with its description and usage:
```
./JavaTMP/JAVATMP-STATIC-AJAX-STARTER
|---.eslintrc
|---.gitignore
|---gulpfile.js
|---package.json
+---node\_modules (Node.js's NPM local dependencies Folders)
+---nbproject (Netbeans IDE config folders and files)
+---web (Web Application Context Root Folder)
    |---index.html (Main HTML Page references Front-end Libraries from assets/dist folder)
    +---assets (Combined front-end resources and specific Template JS,CSS,fonts, and images folders and files)
    +---pages (AJAX HTML Pages referenced from index.html sidebar menu)
```
### `./JavaTMP/JavaTMP-Static-Ajax-Starter/.gitignore` file

We stored our templates in a private github repository so we add .gitignore file to exclude mainly `./node_modules` and `./nbproject/private/` folders from versioning. 

### `./JavaTMP/JavaTMP-Static-Ajax-Starter/.gulpfile.js` file

This is a gulp's configuration file. gulp is a toolkit for automating painful or time-consuming tasks in your development workflow. We use gulp to automate our building process like generating JS/CSS. The main important gulp tasks are `generate-dist` which copy resources from node\_module folders and combine then and compile and generate theme and template Javascript and CSS files and folders.

#### Important Gulp's task `generate-dist`

The following code is the source code of the gulp task `generate-dist`:
```JS
gulp.task('generate-dist', \['copy-components', "delete-dist", "delete-css", "delete-js"\], function (cb) {
    async.series(\[
        function (next) {
            gulp.src(\[
                './web/assets/src/sass/themes/javatmp-\*.scss'\])
                    .pipe(sass().on('error', sass.logError))
                    .pipe(autoprefixer({
                        browsers: \['last 2 versions'\],
                        cascade: false
                    }))
                    .pipe(cleanCSS())
                    .pipe(rename({suffix: '.min'}))
                    .pipe(gulp.dest('./web/assets/dist/css'))
                    .on('end', next);
        },
        function (next) {
            gulp.src(src.css)
                    .pipe(concat("javatmp-plugins-all.min.css", {newLine: '\\n'}))
                    .pipe(gulp.dest("./web/assets/dist/css"))
                    .on('end', next);
        },
        function (next) {
            gulp.src(src.cssForPrint)
                    .pipe(concat("javatmp-plugins-print-all.min.css", {newLine: '\\n'}))
                    .pipe(gulp.dest("./web/assets/dist/css"))
                    .on('end', next);
        },
        function (next) {
            gulp.src('./web/assets/src/js-src/\*\*/\*')
                    .pipe(eslint())
                    .pipe(eslint.format())
                    .pipe(uglify({output: {comments: /^!/}}))
                    .pipe(rename({suffix: '.min'}))
                    .pipe(gulp.dest('./web/assets/dist/js/'))
                    .on('end', next);
        },
        function (next) {
            gulp.src(src.js)
                    .pipe(concat("javatmp-plugins-all.min.js", {newLine: '\\n;'}))
                    .pipe(gulp.dest("./web/assets/dist/js"))
                    .on('end', next);
        },
        function (next) {
            console.log("Generating font-family-\*.min.css");
            var count = 0;
            for (var key in src.fontFamilyFiles) {
                if (src.fontFamilyFiles.hasOwnProperty(key)) {
                    count++;
                    var currentKey = key;
                    var array = src.fontFamilyFiles\[currentKey\];

                    console.log("Generating font-family-" + currentKey + ".min.css");
                    gulp.src(array)
                            .pipe(sass().on('error', sass.logError))
                            .pipe(cleanCSS())
                            .pipe(concat("font-family-" + currentKey + ".min.css", {newLine: '\\n;'}))
                            .pipe(gulp.dest("./web/assets/dist/css"))
                            .on('end', (function () {
                                var k = currentKey;
                                return function () {
                                    count--;
                                    console.log("Finish font-family-" + k + ".min.css");
                                    if (count === 0) {
                                        console.log("Finish All font-family-\*.min.css files");
                                        next();
                                    }
                                };
                            })());
                }
            }
        },
        function (next) {
            gulp.src(src.img)
                    .pipe(gulp.dest("./web/assets/dist/img"))
                    .on('end', next);
        },
        function (next) {
            gulp.src(src.fonts)
                    .pipe(gulp.dest("./web/assets/dist/fonts"))
                    .on('end', next);
        },
        function (next) {
            del.sync(\[config.destComponentsLib, "./web/assets/css", "./web/assets/js"\], next);
        }
    \], cb);
});
```
The gulp's task `generate-dist` depends on task `copy-components` described in details in page [Managing Front-end dependencies Using Node.js And Gulp](/pages/manage-front-end-dependencies-using-node-js-and-gulp "Manage Front-end dependencies Using Node.js And Gulp") which copy all components defined in config object from `./node_modules` to `./web/components`

The gulp's task `generate-dist` depends too on `src` object that define wanted resources and plugins to be combined together, The definition of the `src` object is:
```JS
var src = {
    "css": \[
//        "./web/components/font-awesome/web-fonts-with-css/css/fontawesome-all.min.css",
        "./web/components/font-awesome-animation/dist/font-awesome-animation.min.css",
        "./web/components/jquery-ui-dist/jquery-ui.min.css",
//        "./web/components/bootstrap/dist/css/bootstrap.min.css",
        "./web/components/metismenu/dist/metisMenu.min.css",
        "./web/components/nprogress/nprogress.css",
        "./web/components/jquery.fancytree/dist/skin-bootstrap/ui.fancytree.min.css",
        "./web/components/jquery-contextmenu/dist/jquery.contextMenu.min.css",
        "./web/components/toastr/build/toastr.min.css",
        "./web/components/bootstrap-daterangepicker/daterangepicker.css",
        "./web/components/bootstrap-colorselector/dist/bootstrap-colorselector.min.css",
        "./web/components/select2/dist/css/select2.min.css",
        "./web/components/select2-bootstrap-theme/dist/select2-bootstrap.min.css",
        "./web/components/summernote/dist/summernote-bs4.css",
        "./web/components/ion-rangeslider/css/ion.rangeSlider.css",
        "./web/components/ion-rangeslider/css/ion.rangeSlider.skinHTML5.css",
        "./web/components/bootstrap-slider/dist/css/bootstrap-slider.min.css",
        "./web/components/fullcalendar/dist/fullcalendar.min.css",
        "./web/components/cropperjs/dist/cropper.min.css",
        "./web/components/datatables.net-bs4/css/dataTables.bootstrap4.css",
        "./web/components/datatables.net-fixedheader-bs4/css/fixedHeader.bootstrap4.min.css",
        "./web/components/datatables.net-responsive-bs4/css/responsive.bootstrap4.min.css",
        "./web/components/datatables.net-select-bs4/css/select.bootstrap4.min.css",
        "./web/components/slick-carousel/slick/slick.css",
        "./web/components/slick-carousel/slick/slick-theme.css",
        "./web/components/malihu-custom-scrollbar-plugin/jquery.mCustomScrollbar.css",
//        "./web/components/bootstrap-reverse/dist/\*\*/\*",
        "./web/components/bootstrap-card-extender/dist/bootstrap-card-extender.min.css"
    \],
    "cssForPrint": \[
        "./web/components/fullcalendar/dist/fullcalendar.print.min.css"
    \],
    "fonts": \[
        "./web/components/fontawesome-free-webfonts/webfonts/\*\*/\*",
        "./web/components/jquery-contextmenu/dist/font/\*\*/\*",
        "./web/components/summernote/dist/font/\*\*/\*",
        "./web/components/slick-carousel/slick/fonts/\*\*/\*",
        "./web/assets/src/fonts/open-sans/\*\*/\*"
    \],
    "img": \[
        "./web/components/slick-carousel/slick/ajax-loader.gif",
        "./web/components/malihu-custom-scrollbar-plugin/mCSB\_buttons.png"
    \],
    "js": \["./web/components/jquery/dist/jquery.min.js",
        "./web/components/jquery-ui-dist/jquery-ui.min.js",
        "./web/components/jquery-ui-touch-punch/jquery.ui.touch-punch.min.js",
        "./web/components/popper.js/dist/umd/popper.min.js",
        "./web/components/bootstrap/dist/js/bootstrap.min.js",
        "./web/components/metismenu/dist/metisMenu.min.js",
        "./web/components/blockui/jquery.blockUI.js",
        "./web/components/nprogress/nprogress.js",
        "./web/components/scrollup/dist/jquery.scrollUp.min.js",
        "./web/components/jquery.fancytree/dist/jquery.fancytree-all.min.js",
        "./web/components/jquery-contextmenu/dist/jquery.contextMenu.min.js",
        "./web/components/toastr/build/toastr.min.js",
        "./web/components/jquery-idletimer/dist/idle-timer.min.js",
        "./web/components/moment/min/moment.min.js",
        "./web/components/moment/min/locales.min.js",
        "./web/components/moment-timezone/builds/moment-timezone-with-data.min.js",
        "./web/components/bootstrap-daterangepicker/daterangepicker.js",
        "./web/components/bootstrap-colorselector/dist/bootstrap-colorselector.min.js",
        "./web/components/select2/dist/js/select2.full.min.js",
        "./web/components/bootstrap-maxlength/bootstrap-maxlength.min.js",
        "./web/components/autosize/dist/autosize.min.js",
        "./web/components/summernote/dist/lang/\*\*/\*",
        "./web/components/summernote/dist/summernote-bs4.min.js",
        "./web/components/ion-rangeslider/js/ion.rangeSlider.min.js",
        "./web/components/bootstrap-slider/dist/bootstrap-slider.min.js",
        "./web/components/fullcalendar/dist/fullcalendar.min.js",
        "./web/components/Blob/Blob.js",
        "./web/components/canvas-toBlob/canvas-toBlob.js",
        "./web/components/file-saver/FileSaver.min.js",
        "./web/components/cropperjs/dist/cropper.min.js",
        "./web/components/jquery-cropper/dist/jquery-cropper.min.js",
        "./web/components/waypoints/lib/jquery.waypoints.min.js",
        "./web/components/jquery.counterup/jquery.counterup.min.js",
        "./web/components/timeago/jquery.timeago.js",
        "./web/components/jquery-validation/dist/jquery.validate.min.js",
        "./web/components/jquery-validation/dist/additional-methods.js",
        "./web/components/inputmask/dist/min/jquery.inputmask.bundle.min.js",
        "./web/components/inputmask/dist/min/inputmask/phone-codes/phone.min.js",
        "./web/components/inputmask/dist/min/inputmask/bindings/inputmask.binding.min.js",
        "./web/components/jquery-form/dist/jquery.form.min.js",
        "./web/components/datatables.net/js/jquery.dataTables.js",
        "./web/components/datatables.net-bs4/js/dataTables.bootstrap4.js",
        "./web/components/datatables.net-fixedheader/js/dataTables.fixedHeader.min.js",
        "./web/components/datatables.net-responsive/js/dataTables.responsive.min.js",
        "./web/components/datatables.net-responsive-bs4/js/responsive.bootstrap4.min.js",
        "./web/components/datatables.net-select/js/dataTables.select.min.js",
        "./web/components/echarts/dist/echarts.min.js",
        "./web/components/slick-carousel/slick/slick.min.js",
        "./web/components/malihu-custom-scrollbar-plugin/jquery.mCustomScrollbar.concat.min.js",
        "./web/components/bootstrap-modal-wrapper/dist/bootstrap-modal-wrapper-factory.min.js",
        "./web/components/bootstrap-actionable/dist/bootstrap-actionable.min.js",
        "./web/components/bootstrap-card-extender/dist/bootstrap-card-extender.min.js",
        "./web/components/bootstrap-alert-wrapper/dist/bootstrap-alert-wrapper.min.js",
        "./web/components/numeral/min/numeral.min.js"
    \],
    "fontFamilyFiles": {
        "en": \[
            "./web/assets/src/sass/font-family/font-family-en.scss"
        \]
    }
};
```
Now, returning to definition of `generate-dist` task it makes the following things:

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
./JavaTMP/JavaTMP-Static-Ajax-Starter/web/assets/dist
+---css
    +---font-family-en.min.css
    +---javatmp-plugins-all.min.css
    +---javatmp-plugins-print-all.min.css
    +---javatmp-\*.min.css (For each SASS theme files like javatmp-default.min.css)
+---fonts
    +---context-menu-icons.eot
    +---fa-brands-400.eot
    +---open-sans-v15-latin-300.eot
    +---slick.eot
    +---summernote.eot
    +---...
+---img
    +---ajax-loader.gif
    +---mCSB\_buttons.png
+---js
    +---javatmp-plugins-all.min.js
    +---javatmp.min.js
```
### `./JavaTMP/JavaTMP-Static-Ajax-Starter/.eslintrc` file

ESLint plugin configuration file which contains directive and parameters to gulp-eslint gulp plugin. the following external links provide more information about the those configuration: [Configuring ESLint](https://eslint.org/docs/user-guide/configuring "Configuring ESLint"), [A sample .eslintrc file](https://gist.github.com/adrianhall/70d63d225e536b4563b2 "A sample .eslintrc file"), [A starter .eslintrc file](https://gist.github.com/cletusw/e01a85e399ab563b1236 "A starter .eslintrc file").

### `./JavaTMP/JavaTMP-Static-Ajax-Starter/package.json` file

A Node.js's NPM meta file. This file holds various metadata relevant to the project. This file is used to give information to npm that allows it to handle the project's dependencies. 

### `./JavaTMP/JavaTMP-Static-Ajax-Starter/node_modules` folder

This folder is automatically generated by NPM to store a local copy of dependency libraries needed in your project when you invoke the command `npm install`. NPM depends on `pakcage.json` file to know which plugins and libraries need to be installed in this folder.

### `./JavaTMP/JavaTMP-Static-Ajax-Starter/nbproject` folder

The `nbproject` folder contains all the netbeans metadata about our project. We include `./nbproject`, but not `./nbproject/private`. This folder is usually not required and If you were to check out our project using a different IDE, you would not require our `nbproject` directory. In other words: This directory is Netbeans IDE specific, not project specific.

### `./JavaTMP/JavaTMP-Static-Ajax-Starter/web` folder

It is a web application context root folder contains everything related to static behavior of the template like `Javascript`, `CSS`, `font`, `images`, and `HTML` files. The following is a high level folder structures of ./JavaTMP/JavaTMP-Static-Ajax-Starter/web folder with its description and usage:
```
./JavaTMP/JavaTMP-Static-Ajax-Starter/web
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

*   `./JavaTMP/JavaTMP-Static-Ajax-Starter/web/index.html` above reference combined concatenated JS/CSS files generated in gulp's task `generate-dist` like following:
```HTML
    <!doctype html>
    <html lang="en" dir="ltr">
        <head>
            <link href="assets/dist/css/javatmp-plugins-all.min.css" rel="stylesheet" type="text/css"/>
            <link href='assets/dist/css/javatmp-plugins-print-all.min.css' rel='stylesheet' media='print' />
            <link id="themeStyleSheet" href="assets/dist/css/javatmp-default.min.css" rel="stylesheet" type="text/css"/>
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
*   The main sass file that include bootstrap and template sass file and override it is `./JavaTMP/JavaTMP-Static-Ajax-Starter/web/assets/src/sass/main.scss` that was referenced by `./JavaTMP/JavaTMP-Static-Ajax-Starter/web/assets/src/sass/themes/javatmp-default.scss` which the later referenced in all other theme files resided in `./JavaTMP/JavaTMP-Static-Ajax-Starter/web/assets/src/sass/themes`. This main.scss file includes and references the following resources:
    1.  Import JavaTMP Global Variables
    2.  Import original Bootstrap SCSS file
    3.  Import JavaTMP Base Tempalte SCSS files
    4.  Import Custom Plugins SCSS files that Override default plugins CSS rules
    5.  Import demo pages scss files

`./JavaTMP/javatmp-static-ajax-starter.zip` file
------------------------------------------------

It is our online demo version of JavaTMP-Static-Ajax-Starter project. we provide it without any modification and we were deploying our online demo [http://demo.javatmp.com/JavaTMP-Static-Ajax-Starter/](http://demo.javatmp.com/JavaTMP-Static-Ajax-Starter/ "Java Bootstrap Admin And Dashboard Components Template") from this file. We generated it using the following special gulp's tasks:
```JS
gulp.src('./JavaTMP-Static-Ajax-Starter/web/\*\*/\*', {dot: true})
        .pipe(gulp.dest("./online-static-demo"));
del.sync(\['./online-static-demo/assets/src'\]);
gulp.src(\['./online-static-demo/\*\*/\*.html'\], {dot: true})
        .pipe(htmlmin({collapseWhitespace: true, minifyCSS: true, minifyJS: true, removeComments: true}))
        .pipe(gulp.dest("./online-static-demo"));
gulp.src(\['./online-static-demo/\*\*/\*'\], {dot: true})
        .pipe(chmod(0o644, true))
        .pipe(zip('javatmp-static-ajax-starter.zip'))
        .pipe(gulp.dest('./'));
```
