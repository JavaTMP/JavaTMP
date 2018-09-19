---
title: Front-end Resources Customization
---
# Front-end Resources Customization
You should read first : [Setting Up Development Environment](/pages/setting-up-development-environment) .

After we downloaded front-end plugins using Node's `npm` command , We remove many plugins unneeded files and kept only needed files like dist folder and images, but we use them separately when we need them.

So it is your responsibilities to decide which plugins you need and if you want to merge them in one large js or css files.

we provide a separate CSS customization file for each plugin, so it is simple to change and understand.

You should include custom CSS file after each plugin's main css file.

Main JavaTMP theme CSS file
---------------------------
The main css file for JavaTMP templates is `web/assets/css/main.min.css` and it is used in `index.html` file like this:

<link href="assets/css/main.min.css" rel="stylesheet"/>

This file `main.min.css` is generated from `web/assets/src/sass/main.scss`, using gulp task name `main-sass`.

the following is the gulp task that generates that file `main.min.css`:
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
Please refer to main JavaTMP-Static-Ajax's gulp file located in `./gulpfile.js` for more details.

Custom Plugins CSS
------------------

All plugins in JavaTMP template projects are located in the `./web/components` folder and their custom css files are located in `/web/assets/css/plugins` folder.

These custom css file should be called after the main plugin css. and it is generated from `/web/assets/src/sass/plugins` sass files through gulp task `plugins-sass`.

The following is the definiation of the `plugins-sass` gulp task:
```
gulp.task('plugins-sass', \["main-sass"\], function () {
    return gulp.src(\['./web/assets/src/sass/plugins/\*\*/\*.scss'\])
            .pipe(sass().on('error', sass.logError))
            .pipe(autoprefixer({
                browsers: \['last 2 versions'\],
                cascade: false
            }))
            .pipe(cleanCSS())
            .pipe(rename({suffix: '.min'}))
            .pipe(gulp.dest('./web/assets/css/plugins/'));
});
```
Kindly see the [JavaTMP Front-end Plugins And Frameworks](/pages/javatmp-front-end-plugins-and-frameworks) used in JavaTMP template before you continue reading about customizing most of them.

NProgress Plugin
----------------

Slim progress bars for Ajax'y applications. Inspired by Google, YouTube, and Medium.

We use NProgress plugin in `index.html` page to provide a global monitoring for all JavaTMP AJAX requests. We use it like this:
```
<link href="components/nprogress/nprogress.css" rel="stylesheet" type="text/css"/>
<link href="assets/css/plugins/custom-nprogress.min.css" rel="stylesheet" type="text/css"/>
<script src="components/nprogress/nprogress.js" type="text/javascript"></script>
```
malihu-custom-scrollbar-plugin Plugin
-------------------------------------

Highly customizable custom scrollbar jQuery plugin, featuring vertical/horizontal scrollbars, scrolling momentum, mouse-wheel, keyboard and touch support etc.

We use malihu-custom-scrollbar-plugin plugin in `index.html` page to provide a custom scrollbar for sidebar and navbar's dropdown menus.

JavaTMP Demo Page : `pages/plugins/malihu-custom-scrollbar-plugin.html`

Plugin's usage with custom css file:
```
<link href="components/malihu-custom-scrollbar-plugin/jquery.mCustomScrollbar.css" rel="stylesheet" type="text/css"/>
<link href="assets/css/plugins/custom-jquery.mCustomScrollbar.min.css" rel="stylesheet" type="text/css"/>
<script src="components/malihu-custom-scrollbar-plugin/jquery.mCustomScrollbar.concat.min.js" type="text/javascript"></script>
```
Bootstrap Colorselector
-----------------------

A colorselector for Twitter Bootstrap with which you can select a color from a predefined set of colors

JavaTMP Demo Page : `pages/plugins/bootstrap-colorselector.html`

Plugin's usage with custom css file:
```
<link href="components/bootstrap-colorselector/dist/bootstrap-colorselector.min.css" rel="stylesheet">
<link href="assets/css/plugins/custom-bootstrap-colorselector.min.css" rel="stylesheet" type="text/css"/>
<script src="components/bootstrap-colorselector/dist/bootstrap-colorselector.min.js"></script>
```
Bootstrap Datepicker
--------------------

A datepicker for twitter bootstrap

JavaTMP Demo Page : `pages/plugins/bootstrap-datepicker.html`

Plugin's usage with custom css file:
```
<link href="components/bootstrap-datepicker/dist/css/bootstrap-datepicker3.min.css" rel="stylesheet">
<link href="assets/css/plugins/custom-bootstrap-datepicker.min.css" rel="stylesheet" type="text/css"/>
<script src="components/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js"></script>
<!-- if you need extra locale like arabic you should include them too -->
<script src="components/bootstrap-datepicker/dist/locales/bootstrap-datepicker.ar.min.js" type="text/javascript"></script>
```
Bootstrap Daterangepicker
-------------------------

Date range picker component for Bootstrap

JavaTMP Demo Page : `pages/plugins/bootstrap-date-range-picker.html`

Plugin's usage with custom css file:
```
<link href="components/bootstrap-daterangepicker/daterangepicker.css" rel="stylesheet">
<link href="assets/css/plugins/custom-bootstrap-daterangepicker.min.css" rel="stylesheet" type="text/css"/>
<script src="components/moment/min/moment-with-locales.min.js"></script>
<script src="components/bootstrap-daterangepicker/daterangepicker.js"></script>
```
Select2 Bootstrap Theme
-----------------------

Select2 is a jQuery based replacement for select boxes. It supports searching, remote data sets, and infinite scrolling of results

JavaTMP Demo Page : `pages/plugins/jQuery-select2-bootstrap.html`

Plugin's usage with custom css file:
```
<link href="components/select2/dist/css/select2.min.css" rel="stylesheet">
<link href="components/select2-bootstrap-theme/dist/select2-bootstrap.min.css" rel="stylesheet">
<link href="assets/css/plugins/custom-bootstrap-select2-bootstrap-theme.min.css" rel="stylesheet" type="text/css"/>
<script src="components/select2/dist/js/select2.full.min.js"></script>
```
Bootstrap Slider
----------------

Slider view component for Twitter Bootstrap

JavaTMP Demo Page : `pages/plugins/bootstrap-slider.html`

Plugin's usage with custom css file:
```
<link href="components/seiyria-bootstrap-slider/dist/css/bootstrap-slider.min.css" rel="stylesheet">
<link href="assets/css/plugins/custom-bootstrap-slider.min.css" rel="stylesheet" type="text/css"/>
<script src="components/seiyria-bootstrap-slider/dist/bootstrap-slider.min.js"></script>
```

jQuery Fancytree
----------------

jQuery tree view / tree grid plugin with support for keyboard, inline editing, filtering, checkboxes, drag'n'drop, and lazy loading

JavaTMP Demo Page : `pages/plugins/tree/fancytree/plain_fancytree.html`

Plugin's usage with custom css file:
```
<link href="components/jquery.fancytree/dist/skin-bootstrap/ui.fancytree.min.css" rel="stylesheet">
<link href="assets/css/plugins/custom-fancytree-skin-bootstrap.min.css" rel="stylesheet" type="text/css"/>
<script src="components/jquery.fancytree/dist/jquery.fancytree-all.min.js"></script>
```
jQuery FullCalendar
-------------------

A full-sized drag & drop event calendar

JavaTMP Demo Pages : `pages/plugins/calendar`

Plugin's usage with custom css file:
```
<script src="components/moment/min/moment-with-locales.min.js"></script>
<link href='components/fullcalendar/dist/fullcalendar.min.css' rel='stylesheet' />
<link href='components/fullcalendar/dist/fullcalendar.print.min.css' rel='stylesheet' media='print' />
<link href="assets/css/plugins/custom-fullcalendar.min.css" rel="stylesheet" type="text/css"/>
<script src='components/fullcalendar/dist/fullcalendar.min.js'></script>
```
jQuery IonRange Slider
----------------------

Ion.RangeSlider. Is an easy, flexible and responsive range slider with tons of options.

JavaTMP Demo Page : `pages/plugins/ion-rangeSlider.html`

Plugin's usage with custom css file:
```
<link rel="stylesheet" href="components/ion.rangeSlider/css/ion.rangeSlider.css" />
<link href="components/ion.rangeSlider/css/ion.rangeSlider.skinHTML5.css" rel="stylesheet" type="text/css"/>
<link href="assets/css/plugins/custom-ion.rangeSlider.skinHTML5.min.css" rel="stylesheet" type="text/css"/>
<script src="components/ion.rangeSlider/js/ion.rangeSlider.min.js"></script>
```
jQuery contextMenu plugin
-------------------------

jQuery contextMenu plugin & polyfill

JavaTMP Demo Page : `pages/plugins/bootstrap-context-menu.html`

Plugin's usage with custom css file:
```
<link href="components/jQuery-contextMenu/dist/jquery.contextMenu.min.css" rel="stylesheet">
<link href="assets/css/plugins/custom-jquery.contextMenu.min.css" rel="stylesheet" type="text/css"/>
<script src="components/jQuery-contextMenu/dist/jquery.contextMenu.min.js"></script>
```
jQuery Toastr Notifications
---------------------------

toastr is a Javascript library for non-blocking notifications

JavaTMP Demo Page : `pages/plugins/alert-notification/jQuery-toastr-notification.html`

Plugin's usage with custom css file:
```
<link href="components/toastr/toastr.min.css" rel="stylesheet">
<link href="assets/css/plugins/custom-toastr.min.css" rel="stylesheet" type="text/css"/>
<script src="components/toastr/toastr.min.js"></script>
```
jQuery ScrollUp Plugin
----------------------

A jQuery plugin to create a customisable 'Scroll to top' feature that will work with any website

JavaTMP Demo Page : `pages/plugins/jQuery-ScrollUp.html`

Plugin's usage with custom css file:
```
<link href="assets/css/plugins/custom-jQuery-ScrollUp.min.css" rel="stylesheet" type="text/css"/>
<script src="components/scrollup/dist/jquery.scrollUp.min.js" type="text/javascript"></script>
```

jQuery metisMenu Plugin
-----------------------

Easy menu jQuery plugin for Twitter Bootstrap

JavaTMP Demo Page : `index.html`

Plugin's usage with custom css file:
```
<link href="components/metismenu/dist/metisMenu.min.css" rel="stylesheet" type="text/css"/>
<link href="assets/css/plugins/custom-metisMenu.min.css" rel="stylesheet" type="text/css"/>
<script src="components/metismenu/dist/metisMenu.min.js" type="text/javascript"></script>
```
Bootstrap Summernote Editor
---------------------------

Summernote is a JavaScript library that helps you create WYSIWYG editors online.

JavaTMP Demo Page : `pages/plugins/bootstrap-summernote-editor.html`

Plugin's usage with custom css file:
```
<link href="components/summernote/dist/summernote-bs4.css" rel="stylesheet">
<link href="assets/css/plugins/custom-bootstrap-summernote.min.css" rel="stylesheet" type="text/css"/>
<script src="components/summernote/dist/summernote-bs4.js"></script>
```
Responsive Datatables Bootstrap 4 theme
---------------------------------------

Responsive is an extension for DataTables that optimizes the table's layout for different screen sizes through the dynamic insertion and removal of columns from the table.

JavaTMP Demo Page : `pages/table/datatable/responsive-datatables-bootstrap-4.html`

Plugin's usage with custom css file:
```
<link href="components/datatables.net-bs4/css/dataTables.bootstrap4.css" rel="stylesheet" type="text/css"/>
<script src="components/datatables.net/js/jquery.dataTables.js" type="text/javascript"></script>
<script src="components/datatables.net-bs4/js/dataTables.bootstrap4.js" type="text/javascript"></script>
<script src="components/datatables.net-responsive/js/dataTables.responsive.min.js" type="text/javascript"></script>
<link href="components/datatables.net-responsive-bs4/css/responsive.bootstrap4.min.css" rel="stylesheet" type="text/css"/>
<link href="assets/css/plugins/custom-datatables.net-responsive-bs4.min.css" rel="stylesheet" type="text/css"/>
<script src="components/datatables.net-responsive-bs4/js/responsive.bootstrap4.min.js" type="text/javascript"></script>
```
Selectable Datatables Bootstrap 4 theme
---------------------------------------

Select adds item selection capabilities to a DataTable. Items can be rows, columns or cells, which can be selected independently, or together. Item selection can be particularly useful in interactive tables where users can perform some action on the table, such as editing rows or marking items to perform an action on.

JavaTMP Demo Pages :

`pages/table/datatable/selectable-datatables-bootstrap-4.html`

`pages/table/datatable/row-selection-using-checkboxes.html`

`pages/table/datatable/checkbox-selection-datatables-bootstrap-4.html`

Plugin's usage with custom css file:
```
<link href="components/datatables.net-bs4/css/dataTables.bootstrap4.css" rel="stylesheet" type="text/css"/>
<script src="components/datatables.net/js/jquery.dataTables.js" type="text/javascript"></script>
<script src="components/datatables.net-bs4/js/dataTables.bootstrap4.js" type="text/javascript"></script>
<link href="components/datatables.net-select-bs4/css/select.bootstrap4.min.css" rel="stylesheet" type="text/css"/>
<link href="assets/css/plugins/custom-datatables.net-select-bs4.min.css" rel="stylesheet" type="text/css"/>
<script src="components/datatables.net-select/js/dataTables.select.min.js" type="text/javascript"></script>
```
typeahead.js
------------

A flexible JavaScript library that provides a strong foundation for building robust typeaheads.

JavaTMP Demo Page : `pages/plugins/typeahead.js.html`

Plugin's usage with custom css file:
```
<link href="assets/css/plugins/custom-typeahead.js.min.css" rel="stylesheet" type="text/css"/>
<script src="components/typeahead.js/dist/typeahead.bundle.min.js"></script>
```
jQuery Validation Plugin
------------------------

The jQuery Validation Plugin provides drop-in validation for your existing forms, while making all kinds of customizations to fit your application really easy.

JavaTMP Demo Page : `pages/form/jQuery-form-validation.html`

Plugin's usage with custom css file:
```
<link href="assets/css/plugins/custom-jQuery.validation.min.css" rel="stylesheet" type="text/css"/>
<script src="components/jquery-validation/dist/jquery.validate.min.js"></script>
<script src="components/jquery-validation/dist/additional-methods.js"></script>
```
Slick Carousel
--------------

Fully responsive. Scales with its container. Separate settings per breakpoint Uses CSS3 when available. Fully functional when not. Swipe enabled. Or disabled, if you prefer. Desktop mouse dragging Infinite looping. Fully accessible with arrow key navigation Add, remove, filter & unfilter slides Autoplay, dots, arrows, callbacks, etc..

JavaTMP Demo Page : `pages/gallery/carousel/slick-carousel.html`

Plugin's usage with custom css file:
```
<link href="components/slick-carousel/slick/slick.css" rel="stylesheet" type="text/css"/>
<link href="components/slick-carousel/slick/slick-theme.css" rel="stylesheet" type="text/css"/>
<link href="assets/css/plugins/custom-slick-carousel.min.css" rel="stylesheet" type="text/css"/>
<script src="components/slick-carousel/slick/slick.min.js" type="text/javascript"></script>
```
