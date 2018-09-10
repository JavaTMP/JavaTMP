---
title: JavaTMP CSS/SASS Template Files
---
# JavaTMP CSS/SASS Template Files
The main minificated CSS files for JavaTMP template are located in the `./web/assets/css` folder, And it is automatically generated from source SASS files reside in `./web/assets/src/sass` folder using a gulp's tasks called `"main-sass"`, `"plugins-sass"`, and `"pages-sass"` which each of those tasks will create a separate set of CSS files. we first start describing SASS folder and then generated CSS folder.

Kindly review [JavaTMP Front-end Resources Customization](/pages/javatmp-frontend-resources-customization "JavaTMP Front-end Resources Customization") page before proceeding to get more information about our front-end customization.

JavaTMP SASS folder `./web/assets/src/sass`
-------------------------------------------

We keep sass folder in the main assets of the template to simplify development and make any changes on the CSS happen through SASS files, and when generating production version of the template we remove `./web/assets/src` folder. The following is a high level folders structure of ./web/assets/src/sass with its description and usage:
```
./web/assets/src/sass
|---main.scss (JavaTMP's main SASS file)
+---common
    |---colors-variables.scss (Custom colors added as colors classes and buttons)
    |---variables.scss (JavaTMP SASS Global variables)
+---font-family
    |---font-family-en.scss
+---pages (SASS files for some of demo pages)
    |---color-classes-utils.scss
    |---color\_display.scss
    |---custom-bootstrap-nav-item.scss
    |---custom-steps.scss
    |---default\_timeline.scss
    |---dropdown-menu-extender.scss
    |---extended-buttons-color.scss
    |---icon-preview-block.scss
+---partials
    |---base.scss (Base styling for JavaTMP template layout)
    |---breadcrumb.scss (Custom JavaTMP's breadcrumb styling)
    |---footer.scss (JavaTMP's footer styling)
    |---navbar.scss (JavaTMP's navbar styling)
    |---sidebar.scss (JavaTMP's sidbar styling)
+---plugins (Some Plugins Customization to apply template styling)
    |---custom-bootstrap-colorselector.scss
    |---custom-bootstrap-datepicker.scss
    |---custom-bootstrap-daterangepicker.scss
    |---custom-bootstrap-select2-bootstrap-theme.scss
    |---custom-bootstrap-slider.scss
    |---custom-bootstrap-switch.scss
    |---custom-bootstrap-tagsinput.scss
    |---custom-dropzone.js.scss
    |---custom-fancytree-skin-bootstrap.scss
    |---custom-fullcalendar.scss
    |---custom-ion.rangeSlider.skinHTML5.scss
    |---custom-jQuery-ScrollUp.scss
    |---custom-jquery-steps.scss
    |---custom-jquery.bootstrap-touchspin.scss
    |---custom-jQuery.validation.scss
    |---custom-jquery.contextMenu.scss
    |---custom-jquery.mCustomScrollbar.scss
    |---custom-metisMenu.scss
    |---custom-multi-select.scss
    |---custom-custom-nprogress.scss
    |---custom-toastr.scss
    |---custom-typeahead.js.scss
```
The most important SASS files of those files are `main.scss` and `variables.scss`. and we describe them below:

`./web/assets/src/sass/main.scss` file
--------------------------------------

This SASS file provides main structure for JavaTMP template, and compiled separately using gulp's task "main-sass" to produce `./web/assets/css/main.min.css` file.  The following is the content of the `main.scss` file:
```
@import "common/variables.scss";

// Include Optional parts of Bootstrap
// un-comment if you provide a customization for main bootstrap variables
// in common/variables.scss file
/\*@import "../../../../../node\_modules/bootstrap/scss/root";
@import "../../../../../node\_modules/bootstrap/scss/print";
@import "../../../../../node\_modules/bootstrap/scss/reboot";
@import "../../../../../node\_modules/bootstrap/scss/type";
@import "../../../../../node\_modules/bootstrap/scss/images";
@import "../../../../../node\_modules/bootstrap/scss/code";
@import "../../../../../node\_modules/bootstrap/scss/grid";
@import "../../../../../node\_modules/bootstrap/scss/tables";
@import "../../../../../node\_modules/bootstrap/scss/forms";
@import "../../../../../node\_modules/bootstrap/scss/buttons";
@import "../../../../../node\_modules/bootstrap/scss/transitions";
@import "../../../../../node\_modules/bootstrap/scss/dropdown";
@import "../../../../../node\_modules/bootstrap/scss/button-group";
@import "../../../../../node\_modules/bootstrap/scss/input-group";
@import "../../../../../node\_modules/bootstrap/scss/custom-forms";
@import "../../../../../node\_modules/bootstrap/scss/nav";
@import "../../../../../node\_modules/bootstrap/scss/navbar";
@import "../../../../../node\_modules/bootstrap/scss/card";
@import "../../../../../node\_modules/bootstrap/scss/breadcrumb";
@import "../../../../../node\_modules/bootstrap/scss/pagination";
@import "../../../../../node\_modules/bootstrap/scss/badge";
@import "../../../../../node\_modules/bootstrap/scss/jumbotron";
@import "../../../../../node\_modules/bootstrap/scss/alert";
@import "../../../../../node\_modules/bootstrap/scss/progress";
@import "../../../../../node\_modules/bootstrap/scss/media";
@import "../../../../../node\_modules/bootstrap/scss/list-group";
@import "../../../../../node\_modules/bootstrap/scss/close";
@import "../../../../../node\_modules/bootstrap/scss/modal";
@import "../../../../../node\_modules/bootstrap/scss/tooltip";
@import "../../../../../node\_modules/bootstrap/scss/popover";
@import "../../../../../node\_modules/bootstrap/scss/carousel";
@import "../../../../../node\_modules/bootstrap/scss/utilities";\*/

@import "partials/base.scss";
@import "partials/navbar.scss";
@import "partials/sidebar.scss";
@import "partials/breadcrumb.scss";
@import "partials/footer.scss";
```
The following code provides gulp's task called "main-sass":
```
gulp.task('main-sass', \["delete-css"\], function () {
    return gulp.src(\['./web/assets/src/sass/main.scss'\])
            .pipe(sass().on('error', sass.logError))
            .pipe(autoprefixer({
                browsers: \['last 2 versions'\],
                cascade: false
            }))
            .pipe(cleanCSS())
            .pipe(rename({suffix: '.min'}))
            .pipe(gulp.dest('./web/assets/css/'));
});
```
This task could be invoked separately like `gulp main-sass` or through tasks called `sass`. Anyway, It will compile the `main.scss` file and update it to support last 2 version of latest browsers and then clean its contents and finally rename it with suffix .min before saving it to `./web/assets/css/main.min.css` file.

The main CSS file `main.min.css` using in our template index.html page at the beginning after bootstrap main css file:
```html
...
<!-- Bootstrap CSS -->
<link href="components/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
<!-- JavaTMP Main CSS files -->
<link href="assets/css/main.min.css" rel="stylesheet"/>
...
```
We don't change default bootstrap styling here, so we include the distributed `bootstrap.min.css` file as is before `main.min.css` file. Later we show you how we merge the two files when we change and customize default bootstrap theme.

`./web/assets/src/sass/common/variables.scss` file
--------------------------------------------------

This is the common main variables file used in all other SASS files and contains variable parameters for JavaTMP styling and override default bootstrap styling. The following is the contents of `variables.scss` file:  
```
$font-family-base: "Open Sans", "Helvetica Neue", Helvetica, Arial, sans-serif;

// Add And Customize any default Bootstrap here. but remember to
// un-comment Optional parts of bootstrap in main.scss file
// to apply the customization:
/\*$primary : #000;\*/

// Include Required parts of Bootstrap
@import "../../../../../node\_modules/bootstrap/scss/functions";
@import "../../../../../node\_modules/bootstrap/scss/variables";
@import "../../../../../node\_modules/bootstrap/scss/mixins";
$default-sidebar-width: 325px;
$javatmp-primary-color: $primary;
$javatmp-primary-color-dark: darken($javatmp-primary-color, 10%);
$javatmp-secondary-bg: $gray-100;
$javatmp-secondary-text-gray: $gray-600;
$javatmp-secondary-text: $gray-900;
$javatmp-secondary-border: $gray-400;
```
As you see we don't override or include default bootstrap theme, So we should include default `bootstrap.min.css` file like we did above in `index.html` page. This file provides global variables for all other SASS files and allow us to customize bootstrap and apply those customization to all SASS file too.

For example if we provide a simple customization here, by uncommenting `/*$primary : #000;*/` line to `primary : #000;` and uncommenting all the optional parts of the bootstrap in main.scss file and then run gulp task `sass` or `default` to get a `main.min.css` file that contains customized Bootstrap theme merged to our JavaTMP styling in one file. and we can simply include it without default bootstrap theme `bootstrap.min.css` file:
```HTML
<!-- Bootstrap CSS -->
<!--<link href="components/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>-->
<!-- JavaTMP Main CSS files -->
<link href="assets/css/main.min.css" rel="stylesheet"/>
```
The following screen show you the output of the above customization:

![Simple Customizing Java Bootstrap Admin And Dashboard Components template ](/assets/img/JavaTMP-Java-Bootstrap-Dashboard-Admin-Template-Simple-Customization.jpg)

As a final note if you want to see the compiled CSS files for all SASS files without minification, then simply comments `.pipe(cleanCSS())` line from corresponding gulp's task like `main-sass`, `plugins-sass`, and `pages-sass` tasks.

Note that we separate the import of the bootstrap main sass file `./node_modules/bootstrap/scss/bootstrap.scss` to two location, required reside in `common/variables.scss` file and optional reside in `main.scss` file. because we provide separate css file for all plugins and pages and we don't want to include custom bootstrap in every generated CSS files. In the future we provide a custom SASS file that include all needed features instead of separate files.
