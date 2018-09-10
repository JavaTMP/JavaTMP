---
title: JavaTMP Front-end Plugins And Frameworks
---
# JavaTMP Front-end Plugins And Frameworks
|Name|Description|Prerequisite|License|
|--- |--- |--- |--- |
|jQuery|jQuery is a fast, small, and feature-rich JavaScript library. It makes things like HTML document traversal and manipulation, event handling, animation, and Ajax much simpler with an easy-to-use API that works across a multitude of browsers. With a combination of versatility and extensibility, jQuery has changed the way that millions of people write JavaScript. Mandatory on all versions and templates. Merged and Moved in Starter Versions. RTL supported by default|JS|Copyright JS Foundation|
|Bootstrap|Bootstrap is an open source toolkit for developing with HTML, CSS, and JS. Quickly prototype your ideas or build your entire app with our Sass variables and mixins, responsive grid system, extensive prebuilt components, and powerful plugins built on jQuery. Mandatory on all versions and templates. Merged and Moved in Starter Versions. RTL supported by third-party plugin bootstrap-reverse|jQuery|MIT|
|Select2|Select2 is a jQuery based replacement for select boxes. It supports searching, remote data sets, and infinite scrolling of results. Mandatory on all versions and templates. Merged and Moved in Starter Versions. RTL supported by default using dir: "rtl" parameter or globally using: $.fn.select2.defaults.set("dir", "rtl");|jQuery|MIT|
|Select2 Bootstrap Theme|A Select2 v4 Theme for Bootstrap 3 & 4. Mandatory on all versions and templates. Merged and Moved in Starter Versions. RTL and Bootstrap 4 supported by default using dir:"rtl" and theme: "bootstrap" or globally using: $.fn.select2.defaults.set("theme", "bootstrap"); $.fn.select2.defaults.set("dir", "rtl"); .And a the following fork for Bootstrap 4 : https://github.com/angel-vladov/select2-bootstrap-theme and custom css file adjusting some RTL rules and classes: ./web/assets/src/sass/plugins/custom-bootstrap-select2-bootstrap-theme.scss|Bootstrap v4|MIT|
|Bootstrap Tagsinput|Bootstrap Tags Input is a jQuery plugin providing a Twitter Bootstrap user interface for managing tags.

NOT Merged nor Moved in Starter Versions. RTL supported by default but we leave it in favor of Select2 plugin with Bootstrap 4 theme|Bootstrap 4|MIT|
|Autosize|Autosize is a small, stand-alone script to automatically adjust textarea height to fit text.

Mandatory on all versions and templates. Merged and Moved in Starter Versions. RTL supported by default|JS|MIT|
|Bootstrap Summernote|Super simple WYSIWYG Editor. Summernote is a JavaScript library that helps you create WYSIWYG editors online.

Mandatory on all versions and templates. Merged and Moved in Starter Versions. RTL supported by default using direction: "rtl".|Bootstrap 4|MIT|
|Twitter Typeahead.js|typeahead.js is a fast and fully-featured autocomplete library.

NOT Merged nor Moved in Starter Versions in favor of select2 bootstrap 4 theme. RTL supported by default|jQuery|MIT|
|jQuery idle timer|provides you a way to monitor user activity with a page.

Mandatory on all versions and templates. Merged and Moved in Starter Versions. RTL supported by default|jQuery|MIT|
|jQuery contextMenu plugin|jQuery contextMenu plugin & polyfill.

Mandatory on all versions and templates. Merged and Moved in Starter Versions. RTL NOT supported by default and we should use a separate plugin jQuery-contextMenuRtl to make the plugin support RTL and use the rtl: true attribute too.|jQuery|MIT|
|jQuery-contextMenuRtl|jQuery-contextMenuRtl is rtl support for jQuery-contextMenu.

Mandatory on all versions and templates. Merged and Moved in Starter Versions. RTL supported by default|jQuery, jQuery contextMenu plugin|MIT|
|jQuery IonRange Slider|Ion.RangeSlider. Is an easy, flexible and responsive range slider with tons of options.

Mandatory on all versions and templates. Merged and Moved in Starter Versions. RTL NOTsupported YET SO if you want a RTL slider use bootstrap-slider instead, but this plugin is better than bootstrap-slider in features.|jQuery|MIT|
|jQuery Toastr Notifications|toastr is a Javascript library for non-blocking notifications. jQuery is required. The goal is to create a simple core library that can be customized and extended.

Mandatory on all versions and templates. Merged and Moved in Starter Versions. RTL supported by changing parameters and location of the toaster.|jQuery|MIT|
|Bootstrap Switch|Turn checkboxes and radio buttons in toggle switches.

NOT Merged nor Moved in Starter Versions. RTL NOT supported by default|Bootstrap 3.3.7|MIT|
|jQuery Input Mask|Inputmask is a javascript library which creates an input mask. Inputmask can run against vanilla javascript or jQuery. An inputmask helps the user with the input by ensuring a predefined format. This can be useful for dates, numerics, phone numbers.

Mandatory on all versions and templates. Merged and Moved in Starter Versions. RTL supported by default|jQuery|MIT|
|jQuery BlockUI|The jQuery BlockUI Plugin lets you simulate synchronous behavior when using AJAX, without locking the browser[1]. When activated, it will prevent user activity with the page (or part of the page) until it is deactivated. BlockUI adds elements to the DOM to give it both the appearance and behavior of blocking user interaction.

Mandatory on all versions and templates. Merged and Moved in Starter Versions. RTL supported by default|jQuery|MIT & GPL|
|Bootstrap Datepicker|A datepicker for twitter bootstrap.

NOT Merged nor Moved in Starter Versions in favor of bootstrap-daterangepicker plugin below. RTL is semi-supported|jQuery|Apache License Version 2.0|
|Bootstrap Daterangepicker|Date range picker component for Bootstrap. It creates a dropdown menu from which a user can select a range of dates. Features include limiting the selectable date range, localizable strings and date formats, a single date picker mode, optional time picker (for e.g. making appointments or reservations).

Mandatory on all versions and templates. Merged and Moved in Starter Versions. RTL is supported by default using opens: "right" and locale.direction: "rtl"|Bootstrap|MIT|
|jQuery DataTables Plugin|DataTables is a plug-in for the jQuery Javascript library. It is a highly flexible tool, based upon the foundations of progressive enhancement, and will add advanced interaction controls to any HTML table.

Mandatory on all versions and templates. Merged and Moved in Starter Versions. RTL is supported by default using custom style rules to override classes|jQuery|MIT|
|Bootstrap 4 DataTables|DataTables can integrate seamlessly with Bootstrap 4 using Bootstrap's table styling options to present an interface with a uniform design, based on Bootstrap, for your site / app.

Mandatory on all versions and templates. Merged and Moved in Starter Versions. RTL is supported by default using custom style rules to override classes|Bootstrap 4|MIT|
|Responsive DataTables|Responsive is an extension for DataTables that resolves that problem by optimising the table's layout for different screen sizes through the dynamic insertion and removal of columns from the table.

Mandatory on all versions and templates. Merged and Moved in Starter Versions. RTL is supported by default using custom style rules to override classes|Bootstrap 3, Bootstrap 4|MIT|
|FixedHeader DataTables|FixedHeader provides the ability to make the DataTables table's header fixed to the top of the scrolling window.

Mandatory on all versions and templates. Merged and Moved in Starter Versions. RTL is supported by default using custom style rules to override classes|Bootstrap 3, Bootstrap 4|MIT|
|Select DataTables|Select extension adds item selection capabilities to a DataTable. Items can be rows, columns or cells, which can be selected independently, or together. Item selection can be particularly useful in interactive tables where users can perform some action on the table, such as editing rows or marking items to perform an action on.

Mandatory on all versions and templates. Merged and Moved in Starter Versions. RTL is supported by default using custom style rules to override classes|Bootstrap 4|MIT|
|Checkboxes DataTables|Checkboxes is an extension for the jQuery DataTables library that provides universal solution for working with checkboxes in a table.

Mandatory on all versions and templates. Merged and Moved in Starter Versions. RTL is supported by default using custom style rules to override classes|Bootstrap 4|MIT|
|jQuery FullCalendar|A full-sized drag & drop event calendar.

Mandatory on all versions and templates. Merged and Moved in Starter Versions. RTL supported by default using isRTL: true parameter.|jQuery, jQuery UI|MIT|
|jQuery UI|A curated set of user interface interactions, effects, widgets, and themes built on top of the jQuery JavaScript Library. We use it to support sortable DOM elements through drag and drop.

Mandatory on all versions and templates. Merged and Moved Completely in Starter Versions. RTL not supported by default but we don't use it unless for some plugins that need Draggable feature from it.|jQuery|Copyright JS Foundation|
|jQuery UI Touch Punch|jQuery UI Touch Punch is a small hack that enables the use of touch events on sites using the jQuery UI user interface library.

Mandatory on all versions and templates that use jQueryUI. Merged and Moved in Starter Versions. RTL supported by default.|jQuery UI|MIT or GPL|
|jQuery Validation Plugin|The jQuery Validation Plugin provides drop-in validation for your existing forms, while making all kinds of customizations to fit your application really easy.

Mandatory on all versions and templates. Merged and Moved in Starter Versions. RTL supported by default|jQuery|MIT|
|Font Awesome|The iconic font and CSS toolkit. Font Awesome is a full suite of 675 pictographic icons for easy scalable vector graphics on websites, created and maintained by Dave Gandy.

Mandatory on all versions and templates. Merged and Moved in Starter Versions. RTL supported by default|CSS|SIL OFL|
|FontAwesome Animation|Simple animations using FontAwesome and some CSS3.

Mandatory on all versions and templates. Merged and Moved in Starter Versions. RTL supported by default. note that although the name state for FontAwesome icons, it could be used for material design icons set too or any icons.|FontAwesome|MIT|
|Open Sans Font|Open Sans is a humanist sans serif typeface designed by Steve Matteson, Type Director of Ascender Corp.

Mandatory on all versions and templates. Merged and Moved in Starter Versions. RTL supported by default|CSS|Apache License Version 2.0|
|jQuery Knob|Nice, downward compatible, touchable, jQuery dial.

NOT Merged nor Moved in Starter Versions in favor of eCharts library. RTL supported by default|jQuery|MIT|
|Bootstrap MaxLength|This plugin integrates by default with Twitter bootstrap using badges to display the maximum lenght of the field where the user is inserting text. Uses the HTML5 attribute "maxlength" to work.

Mandatory on all versions and templates. Merged and Moved in Starter Versions. RTL supported by default|Bootstrap 3|MIT|
|Bootstrap Colorselector|A colorselector for Twitter Bootstrap with which you can select a color from a predefined set of colors.

Mandatory on all versions and templates. Merged and Moved in Starter Versions. RTL supported by default|Bootstrap|MIT|
|Chart.js|Simple yet flexible JavaScript charting for designers & developers.

NOT Merged nor Moved in Starter Versions in favor of eCharts library. RTL NOT supported by default too|JS|MIT|
|ECharts|ECharts is a free, powerful charting and visualization library offering an easy way of adding intuitive, interactive, and highly customizable charts to your commercial products. It is written in pure JavaScript and based on zrender, which is a whole new lightweight canvas library.

Mandatory on all versions and templates. Merged and Moved in Starter Versions. RTL supported by default using a little modification regarding direction and data arrays flip.|JS|BSD|
|Bootstrap Slider|Slider view component for Twitter Bootstrap.

NOT Mandatory on LTR versions and templates. Merged and Moved in RTL Starter Versions. RTL supported by default. note that because ion.slider is not suppported RTL yet this plugin win for RTL slider but if your project is LTR only it is better to use ion.slider instead.|Bootstrap 4|MIT|
|Cropper.js|JavaScript image cropper

Mandatory on all versions and templates. Merged and Moved in Starter Versions. RTL supported by default|JS|MIT|
|jquery-cropper|A jQuery plugin wrapper for Cropper.js

Mandatory on all versions and templates. Merged and Moved in Starter Versions. RTL supported by default|jQuery, Cropper.js|MIT|
|jQuery Fancytree|jQuery tree view / tree grid plugin with support for keyboard, inline editing, filtering, checkboxes, drag'n'drop, and lazy loading.

Mandatory on all versions and templates. Merged and Moved in Starter Versions. RTL supported by default using rtl: true parameter and manually change icons and reverse arrow keys.|jQuery, jQuery UI|MIT|
|jQuery Form Plugin|The jQuery Form Plugin allows you to easily and unobtrusively upgrade HTML forms to use AJAX. The main methods, ajaxForm and ajaxSubmit, gather information from the form element to determine how to manage the submit process. Both of these methods support numerous options which allows you to have full control over how the data is submitted.

Mandatory on all versions and templates. Merged and Moved in Starter Versions. RTL supported by default|jQuery|MIT and LGPL|
|Metis Menu|Easy menu jQuery plugin for Twitter Bootstrap 3.

Mandatory on all versions and templates. Merged and Moved in Starter Versions. RTL supported by default|jQuery|MIT|
|Moment|Parse, validate, manipulate, and display dates.

Mandatory on all versions and templates. Merged and Moved in Starter Versions. RTL supported by default using custom locale js file|JS|MIT|
|ScrollUp|A jQuery plugin to create a customisable 'Scroll to top' feature that will work with any website.

Mandatory on all versions and templates. Merged and Moved in Starter Versions. RTL supported by default|jQuery|MIT|
|jquery.counterup|jquery.counterup is a lightweight jQuery plugin that counts up to a targeted number when the number becomes visible.

Mandatory on all versions and templates. Merged and Moved in Starter Versions. RTL supported by default|jQuery|GPL v2|
|Waypoints|Waypoints is a library that makes it easy to execute a function whenever you scroll to an element.

Mandatory on all versions and templates. Merged and Moved in Starter Versions. RTL supported by default|jQuery|MIT|
|jquery multi-select.js|A user-friendlier drop-in replacement for the standard select with multiple attribute activated.

NOT Merged nor Moved in Starter Versions in favor of manually write multi select feature that provide your exact requirements. RTL supported by default|jQuery|MIT|
|jQuery quicksearch|A jQuery plugin for searching through tables, lists, etc quickly.

NOT Merged nor Moved in Starter Versions in favor of server side filtering and searching. it was used to support filter for above multi-select that we decided to leave it.|jQuery|Copyright JS Foundation|
|Dropzone.js|DropzoneJS is an open source library that provides drag’n’drop file uploads with image previews and shows nice progress bars. It’s lightweight, doesn’t depend on any other library (like jQuery) and is highly customizable.

NOT Mandatory on all versions and templates. NOT Merged and Moved in Starter Versions. RTL supported by default. we think the native bootstrap 4 and jquery.form plugins enough to implement any custom file uploader.|JS|MIT|
|jQuery timeago plugin|Timeago is a jQuery plugin that makes it easy to support automatically updating fuzzy timestamps (e.g. "4 minutes ago" or "about 1 day ago") from ISO 8601 formatted dates and times embedded in your HTML or dynamically using javascript.

Mandatory on all versions and templates. Merged and Moved in Starter Versions. RTL supported by default|jQuery|MIT|
|Bootstrap Lightbox|A lightbox module for Bootstrap that supports images, YouTube videos, and galleries - built around Bootstrap's Modal plugin.

NOT Mandatory on all versions and templates. NOT Merged nor Moved in Starter Versions.|Bootstrap 4|MIT|
|jQuery Magnific Popup Gallery|Light and responsive lightbox script with focus on performance.

NOT Mandatory on all versions and templates. NOT Merged nor Moved in Starter Versions.|jQuery|MIT|
|jQuery slick Carousel Plugin|the last carousel you'll ever need.

Mandatory on all versions and templates. Merged and Moved in Starter Versions. RTL supported by default|jQuery|MIT|
|nprogress|For slim progress bars like on YouTube, Medium.

Mandatory on all versions and templates. Merged and Moved in Starter Versions. RTL NOT supported by default yet|JS|MIT|
|malihu custom scrollbar plugin|Highly customizable custom scrollbar jQuery plugin, featuring vertical/horizontal scrollbars, scrolling momentum, mouse-wheel, keyboard and touch support etc.

Mandatory on all versions and templates. Merged and Moved in Starter Versions. RTL supported by default|jQuery,jquery-mousewheel|MIT|
|Bootstrap Modal Wrapper Plugin|Bootstrap modal wrapper factory for creating dynamic and nested stacked dialog instances.

Mandatory on all versions and templates. Merged and Moved in Starter Versions. RTL supported by default|jQuery,Bootstrap|MIT|
|Bootstrap Actionable Plugin|A small Javascript code that help implement click event actions for a and button tags by declarative way and provide functionalities to load AJAX content in Bootstrap Modal Wrapper instance.

Mandatory on all versions and templates. Merged and Moved in Starter Versions. RTL supported by default|jQuery,Bootstrap|MIT|
|Bootstrap Alert Wrapper Plugin|Bootstrap alert wrapper factory for creating dynamic alert instances.

Mandatory on all versions and templates. Merged and Moved in Starter Versions. RTL supported by default|jQuery,Bootstrap|MIT|
|Bootstrap Card Extender Plugin|Extending bootstrap card by adding option buttons that help make Bootstrap Card more responsive and interactive.

Mandatory on all versions and templates. Merged and Moved in Starter Versions. RTL supported by default|jQuery,Bootstrap|MIT|
|bootstrap-reverse Plugin|Bootstrap 4 RTL for Right to left directional languages like Arabic,Persian,Hebrew and Urdu.

Mandatory on all RTL versions and templates only. Merged and Moved in Starter Versions. It is a Bootstrap RTL fork|jQuery,Bootstrap|MIT|
|Material Design icons by Google|Material design system icons are simple, modern, friendly, and sometimes quirky.

NOT Mandatory on all versions and templates. NOT Merged nor Moved in Starter Versions in favor of FontAwesome icons set. RTL supported by default|NONE|Apache License Version 2.0|
|Bootswatch themes|Bootswatch is a collection of open source themes for Bootstrap that are easy to install and customize.

NOT Mandatory on all versions and templates. We use theme to produce standard Bootstrap 4 themes in starter and Java versions. RTL might be supported by default|Bootstrap 4|MIT|
|Blob.js|Blob.js implements the W3C Blob interface in browsers that do not natively support it.

Used before cropper plugin to support him. Mainly used in JavaTMP-Java-Ajax-Starter Project|JS enabled|MIT|
|canvas-toBlob.js|A canvas.toBlob() implementation. canvas-toBlob.js implements the standard HTML5 canvas.toBlob() and canvas.toBlobHD() methods in browsers that do not natively support it. canvas-toBlob.js requires Blob support to function, which is not present in all browsers. Blob.js is a cross-browser Blob implementation that solves this.

Used before cropper plugin to support him. Mainly used in JavaTMP-Java-Ajax-Starter Project|JS enabled|MIT|
|FileSaver.js|An HTML5 saveAs() FileSaver implementation.

Used before cropper plugin to support him. Mainly used in JavaTMP-Java-Ajax-Starter Project|JS enabled|MIT|
|Numeral.js|A javascript library for formatting and manipulating numbers.

Mandatory on all versions and templates. Merged and Moved in Starter Versions. Different locales provided|JS enabled|MIT|
|Moment Timezone|Timezone support for moment.js

Mandatory on all Starter versions and templates. Merged and Moved in Starter Versions. RTL supported by default|Moment.js|MIT|
