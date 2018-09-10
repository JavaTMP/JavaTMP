---
title: Manage Front-end dependencies Using Node.js And Gulp
---
# Manage Front-end dependencies Using Node.js And Gulp
We manage all front-end plugins and framework dependencies like jQuery, Bootstrap using Node NPM and gulp tools. 

We add the dependencies using two methods:

We could add jQuery as npm dependency by invoking:
```
`npm install --save jquery`
```
Or by updating the package.json file and add the following entry to dependencies key:
```
`"jquery": "^3.2.1"`
```
And Then, invoking the following command:
```
`npm install`
```
NPM loads jquery into your local node\_modules folder, and stores relevant metadata to package.json. We Repeated this for all of the dependencies that are available on NPM and we ended up with something like:
```
...
  "dependencies": {
    "autosize": "^4.0.2",
    "bootstrap": "^4.1.1",
    "bootstrap-colorselector": "^0.1.0",
    "bootstrap-datepicker": "^1.8.0",
    "bootstrap-daterangepicker": "^3.0.2",
    "bootstrap-maxlength": "^1.6.0",
    "bootstrap-modal-wrapper": "^1.0.13",
    "bootstrap-reverse": "^1.0.8",
    "bootstrap-slider": "^10.0.2",
    "bootstrap-switch": "^3.3.4",
    "chart.js": "^2.7.2",
    "cropperjs": "^1.3.6",
    "jquery-cropper": "^1.0.0",
    "datatables.net": "^1.10.16",
    "datatables.net-bs4": "^1.10.16",
    "datatables.net-fixedheader": "^3.1.3",
    "datatables.net-fixedheader-bs4": "^3.1.3",
    "datatables.net-responsive": "^2.2.0",
    "datatables.net-responsive-bs4": "^2.2.0",
    "datatables.net-select": "^1.2.5",
    "datatables.net-select-bs4": "^1.2.5",
    "dropzone": "^5.4.0",
    "echarts": "^4.1.0",
    "ekko-lightbox": "^5.3.0",
    "font-awesome-animation": "^0.2.0",
    "fullcalendar": "^3.9.0",
    "inputmask": "^3.3.11",
    "ion-rangeslider": "^2.2.0",
    "jquery": "^3.3.1",
    "jquery-contextmenu": "^2.6.4",
    "jquery-form": "^4.2.2",
    "jquery-knob": "^1.2.11",
    "jquery-ui-dist": "^1.12.1",
    "jquery-validation": "^1.17.0",
    "jquery.counterup": "^2.1.0",
    "magnific-popup": "^1.1.0",
    "malihu-custom-scrollbar-plugin": "^3.1.5",
    "metismenu": "^2.7.7",
    "moment": "^2.22.1",
    "multiselect": "^0.9.12",
    "nprogress": "^0.2.0",
    "popper.js": "^1.14.3",
    "select2": "^4.0.6-rc.1",
    "slick-carousel": "^1.8.1",
    "summernote": "^0.8.10",
    "timeago": "^1.6.3",
    "toastr": "^2.1.2",
    "typeahead.js": "^0.11.1",
    "waypoints": "^4.0.1",
    "bootstrap-actionable": "^1.0.4",
    "bootstrap-card-extender": "^1.0.1",
    "bootstrap-alert-wrapper": "^1.0.3",
    "material-design-icons": "^3.0.1",
    "jquery.fancytree": "^2.28.1",
    "file-saver": "^1.3.8",
    "numeral" : "2.0.6",
    "@fortawesome/fontawesome-free-webfonts": "^1.0.9"
  },
  ...
```
Fix Issues for non node.js NPM package modules
----------------------------------------------

There were mainly Three issues raised using above method:

1.  Not all our front-end libraries were node packages. Some of our front-end libraries exist in github repositories but were not registered in NPM repository.
2.  We need complete github repositories for some libraries, not just what their authors published in NPM repository.
3.  Not all front-end libraries resources are production ready. Some of them are still raw text and need a minification and cleaning.

For those issues we used a npm's package called `napa` which is a helper for installing repositories without a package.json with `npm`

[napa NPM's package link](https://www.npmjs.com/package/napa "napa npm package") and [napa npm's github.com repository](https://github.com/shama/napa "napa npm package github.com repository")

We installed napa package using command:

`npm install napa --save-dev`

This command will install napa package and update main ./package.json file by adding an entry for napa package in devDependencies key:
```
...
"devDependencies": {
    ...
    "napa": "^3.0.0",
    ...
},
...
```
We configured napa package by updating our package.json file like:

1\. Using new napa entry in package.json file to hold repositories:
```
{
  ...
  "napa": {
    "blockui": "git+https://github.com/malsup/blockui.git",
    "scrollup": "git+https://github.com/markgoodyear/scrollup.git",
    "jquery-idletimer": "git+https://github.com/thorst/jquery-idletimer.git",
    "select2-bootstrap-theme": "git+https://github.com/angel-vladov/select2-bootstrap-theme.git",
    "quicksearch": "git+https://github.com/riklomas/quicksearch.git",
    "jquery-ui-touch-punch": "git+https://github.com/furf/jquery-ui-touch-punch.git",
    "bootstrap-tagsinput": "git+https://github.com/bootstrap-tagsinput/bootstrap-tagsinput.git",
    "canvas-toBlob": "git+https://github.com/eligrey/canvas-toBlob.js.git",
    "Blob": "git+https://github.com/eligrey/Blob.js"
  }
}
```
2\. Adding scripts entries in package.json file to let `napa` run when we invoke `npm install`,`npm update`, and `npm run napa` commands: 
```
{
  ...
  "scripts": {
    "install": "napa",
    "update": "napa",
    "napa": "napa"
  },
  ...
}
```
3\. Adding custom napa's `napa-config` configuration options entry, mainly to disable repositories caching:
```
{
  ...
  "napa-config": {
    "cache": false,
    "log-level": "debug"
  },
  ...
}
```
Now, whenever we invoke `npm install` command, all our front-end dependencies will be downloaded and installed in local `./node_modules` folder by `node.js` and `napa` tools. The following is our complete package.json file updated with all dependencies, devDependencies, and napa entries:
```
{
  "name": "JavaTMP-Static-Ajax",
  "version": "0.0.1",
  "private": true,
  "description": "JavaTMP Bootstrap Admin And Dashboard Template",
  "keywords": \[
    "jquery",
    "bootstrap",
    "admin",
    "template",
    "dashboard"
  \],
  "author": "javatmp",
  "licenses": "JavaTMP License",
  "contributors": \[\],
  "dependencies": {
    "autosize": "^4.0.2",
    "bootstrap": "^4.1.1",
    "bootstrap-colorselector": "^0.1.0",
    "bootstrap-datepicker": "^1.8.0",
    "bootstrap-daterangepicker": "^3.0.2",
    "bootstrap-maxlength": "^1.6.0",
    "bootstrap-modal-wrapper": "^1.0.13",
    "bootstrap-reverse": "^1.0.8",
    "bootstrap-slider": "^10.0.2",
    "bootstrap-switch": "^3.3.4",
    "chart.js": "^2.7.2",
    "cropperjs": "^1.3.6",
    "jquery-cropper": "^1.0.0",
    "datatables.net": "^1.10.16",
    "datatables.net-bs4": "^1.10.16",
    "datatables.net-fixedheader": "^3.1.3",
    "datatables.net-fixedheader-bs4": "^3.1.3",
    "datatables.net-responsive": "^2.2.0",
    "datatables.net-responsive-bs4": "^2.2.0",
    "datatables.net-select": "^1.2.5",
    "datatables.net-select-bs4": "^1.2.5",
    "dropzone": "^5.4.0",
    "echarts": "^4.1.0",
    "ekko-lightbox": "^5.3.0",
    "font-awesome-animation": "^0.2.0",
    "fullcalendar": "^3.9.0",
    "inputmask": "^3.3.11",
    "ion-rangeslider": "^2.2.0",
    "jquery": "^3.3.1",
    "jquery-contextmenu": "^2.6.4",
    "jquery-form": "^4.2.2",
    "jquery-knob": "^1.2.11",
    "jquery-ui-dist": "^1.12.1",
    "jquery-validation": "^1.17.0",
    "jquery.counterup": "^2.1.0",
    "magnific-popup": "^1.1.0",
    "malihu-custom-scrollbar-plugin": "^3.1.5",
    "metismenu": "^2.7.7",
    "moment": "^2.22.1",
    "multiselect": "^0.9.12",
    "nprogress": "^0.2.0",
    "popper.js": "^1.14.3",
    "select2": "^4.0.6-rc.1",
    "slick-carousel": "^1.8.1",
    "summernote": "^0.8.10",
    "timeago": "^1.6.3",
    "toastr": "^2.1.2",
    "typeahead.js": "^0.11.1",
    "waypoints": "^4.0.1",
    "bootstrap-actionable": "^1.0.4",
    "bootstrap-card-extender": "^1.0.1",
    "bootstrap-alert-wrapper": "^1.0.3",
    "material-design-icons": "^3.0.1",
    "jquery.fancytree": "^2.28.1",
    "file-saver": "^1.3.8",
    "numeral" : "2.0.6",
    "@fortawesome/fontawesome-free-webfonts": "^1.0.9"
  },
  "devDependencies": {
    "del": "^3.0.0",
    "gulp": "^3.9.1",
    "gulp-autoprefixer": "^5.0.0",
    "gulp-clean-css": "^3.9.4",
    "gulp-concat": "^2.6.1",
    "gulp-connect": "^5.5.0",
    "gulp-eslint": "^4.0.2",
    "gulp-if": "^2.0.2",
    "gulp-rename": "^1.2.3",
    "gulp-sass": "^4.0.1",
    "gulp-uglify": "^3.0.0",
    "napa": "^3.0.0",
    "pump": "^3.0.0"
  },
  "scripts": {
    "install": "napa",
    "update": "napa",
    "napa": "napa"
  },
  "napa-config": {
    "cache": true,
    "log-level": "debug"
  },
  "napa": {
    "blockui": "git+https://github.com/malsup/blockui.git",
    "scrollup": "git+https://github.com/markgoodyear/scrollup.git",
    "jquery-idletimer": "git+https://github.com/thorst/jquery-idletimer.git",
    "select2-bootstrap-theme": "git+https://github.com/angel-vladov/select2-bootstrap-theme.git",
    "quicksearch": "git+https://github.com/riklomas/quicksearch.git",
    "jquery-ui-touch-punch": "git+https://github.com/furf/jquery-ui-touch-punch.git",
    "bootstrap-tagsinput": "git+https://github.com/bootstrap-tagsinput/bootstrap-tagsinput.git",
    "canvas-toBlob": "git+https://github.com/eligrey/canvas-toBlob.js.git",
    "Blob": "git+https://github.com/eligrey/Blob.js"
  }
}
```
Moving Required libraries Files to our web application folders
--------------------------------------------------------------

We can now reference the dependencies straight from `./node_modules` folder just like we did on Bower components from `./web/components` folder. but our node\_modules folder is outside context root folder `./web` and normally it is not a good idea to make node\_modules folder inside your context root folder, indeed not all files and directories are needed in node\_modules folder. The following is a high level folder structures of our JavaTMP-Static-Ajax web application:
```
JAVATMP-STATIC-AJAX
|   .gitignore
|   gulpfile.js
|   package.json
|---node_modules (Source Front-end Folders)
+---nbproject (Netbeans IDE config folders and files)
+---web (Web Application Context Root Folder)
    |---index.html (Main HTML Page references Front-end Libraries from components folder)
    +---assets (Specific Template JS,CSS,fonts, and images folders and files)
    +---components (Destination Front-end Folders)
    \---pages (HTML Pages reference Front-end Libraries from components folder)
```
So we need a simple process that chooses and moves required and needed plugins and frameworks from `./node_modules` to `./web/components` folders and processes them if they need any minification or cleaning before move them. 

We used Gulp to automate our building process. So, we created a simple gulp task that implements our requirements above by first creating an object that hold need libraries. the following object hold our required libraries:
```
var config = {
    "sourceNodeLib": "./node\_modules",
    "destComponentsLib": "./web/components",
    "plugins": {
        "material-design-icons": \[
            {"from": "${sourceNodeLib}/material-design-icons/iconfont/MaterialIcons-Regular.\*", "to": "${destComponentsLib}/material-design-icons/iconfont"},
            {"from": "${sourceNodeLib}/material-design-icons/iconfont/material-icons.css", "to": "${destComponentsLib}/material-design-icons/iconfont", processCSS: true}
        \],
        "fontawesome-free-webfonts": \[
            {"from": "${sourceNodeLib}/@fortawesome/fontawesome-free-webfonts/css/\*\*/\*", "to": "${destComponentsLib}/fontawesome-free-webfonts/css", processCSS: true},
            {"from": "${sourceNodeLib}/@fortawesome/fontawesome-free-webfonts/webfonts/\*\*/\*", "to": "${destComponentsLib}/fontawesome-free-webfonts/webfonts"}
        \],
        "font-awesome-animation": \[
            {"from": "${sourceNodeLib}/font-awesome-animation/dist/font-awesome-animation.min.css", "to": "${destComponentsLib}/font-awesome-animation/dist"}
        \],
        "jquery": \[
            {"from": "${sourceNodeLib}/jquery/dist/jquery.min.js", "to": "${destComponentsLib}/jquery/dist"}
        \],
        "jquery-ui": \[
            {"from": "${sourceNodeLib}/jquery-ui-dist/jquery-ui.min.css", "to": "${destComponentsLib}/jquery-ui"},
            {"from": "${sourceNodeLib}/jquery-ui-dist/jquery-ui.min.js", "to": "${destComponentsLib}/jquery-ui"}

        \],
        "jquery-ui-touch-punch": \[
            {"from": "${sourceNodeLib}/jquery-ui-touch-punch/jquery.ui.touch-punch.min.js", "to": "${destComponentsLib}/jquery-ui-touch-punch"}
        \],
        "popper.js": \[
            {"from": "${sourceNodeLib}/popper.js/dist/umd/popper.min.js", "to": "${destComponentsLib}/popper.js/dist/umd"}
        \],
        "bootstrap": \[
            {"from": "${sourceNodeLib}/bootstrap/dist/css/bootstrap.min.css", "to": "${destComponentsLib}/bootstrap/dist/css"},
            {"from": "${sourceNodeLib}/bootstrap/dist/js/bootstrap.min.js", "to": "${destComponentsLib}/bootstrap/dist/js"}
        \],
        "metismenu": \[
            {"from": "${sourceNodeLib}/metismenu/dist/metisMenu.min.js", "to": "${destComponentsLib}/metismenu/dist"},
            {"from": "${sourceNodeLib}/metismenu/dist/metisMenu.min.css", "to": "${destComponentsLib}/metismenu/dist"}
        \],
        "blockui": \[
            {"from": "${sourceNodeLib}/blockui/jquery.blockUI.js", "to": "${destComponentsLib}/blockui", "processCSS": false, "processJS": true}
        \],
        "nprogress": \[
            {"from": "${sourceNodeLib}/nprogress/nprogress.css", "to": "${destComponentsLib}/nprogress", processCSS: true},
            {"from": "${sourceNodeLib}/nprogress/nprogress.js", "to": "${destComponentsLib}/nprogress", processJS: true}
        \],
        "scrollup": \[
            {"from": "${sourceNodeLib}/scrollup/dist/jquery.scrollUp.min.js", "to": "${destComponentsLib}/scrollup/dist"}
        \],
        /\* All Above Plugins are considered Mandatory \*/
        "jquery.fancytree": \[
            {"from": "${sourceNodeLib}/jquery.fancytree/dist/skin-bootstrap/ui.fancytree.min.css", "to": "${destComponentsLib}/jquery.fancytree/dist/skin-bootstrap"},
            {"from": "${sourceNodeLib}/jquery.fancytree/dist/jquery.fancytree-all.min.js", "to": "${destComponentsLib}/jquery.fancytree/dist"}
        \],
        "jquery-contextmenu": \[
            {"from": "${sourceNodeLib}/jquery-contextmenu/dist/font/\*\*/\*", "to": "${destComponentsLib}/jquery-contextmenu/dist/font"},
            {"from": "${sourceNodeLib}/jquery-contextmenu/dist/jquery.contextMenu.min.css", "to": "${destComponentsLib}/jquery-contextmenu/dist"},
            {"from": "${sourceNodeLib}/jquery-contextmenu/dist/jquery.contextMenu.min.js", "to": "${destComponentsLib}/jquery-contextmenu/dist"}
        \],
        "toastr": \[
            {"from": "${sourceNodeLib}/toastr/build/toastr.min.css", "to": "${destComponentsLib}/toastr/build"},
            {"from": "${sourceNodeLib}/toastr/build/toastr.min.js", "to": "${destComponentsLib}/toastr/build"}
        \],
        "jquery-idletimer": \[
            {"from": "${sourceNodeLib}/jquery-idletimer/dist/idle-timer.min.js", "to": "${destComponentsLib}/jquery-idletimer/dist"}
        \],
        "bootstrap-datepickerr": \[
            {"from": "${sourceNodeLib}/bootstrap-datepicker/dist/css/bootstrap-datepicker3.min.css", "to": "${destComponentsLib}/bootstrap-datepicker/dist/css"},
            {"from": "${sourceNodeLib}/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js", "to": "${destComponentsLib}/bootstrap-datepicker/dist/js"}
        \],
        "moment": \[
            {"from": "${sourceNodeLib}/moment/min/moment.min.js", "to": "${destComponentsLib}/moment/min"},
            {"from": "${sourceNodeLib}/moment/min/locales.min.js", "to": "${destComponentsLib}/moment/min"}
        \],
        "bootstrap-daterangepicker": \[
            {"from": "${sourceNodeLib}/bootstrap-daterangepicker/daterangepicker.css", "to": "${destComponentsLib}/bootstrap-daterangepicker", processCSS: true},
            {"from": "${sourceNodeLib}/bootstrap-daterangepicker/daterangepicker.js", "to": "${destComponentsLib}/bootstrap-daterangepicker", processJS: true}
        \],
        "bootstrap-colorselector": \[
            {"from": "${sourceNodeLib}/bootstrap-colorselector/dist/bootstrap-colorselector.min.css", "to": "${destComponentsLib}/bootstrap-colorselector/dist"},
            {"from": "${sourceNodeLib}/bootstrap-colorselector/dist/bootstrap-colorselector.min.js", "to": "${destComponentsLib}/bootstrap-colorselector/dist"}
        \],
        "select2": \[
            {"from": "${sourceNodeLib}/select2/dist/css/select2.min.css", "to": "${destComponentsLib}/select2/dist/css"},
            {"from": "${sourceNodeLib}/select2/dist/js/select2.full.min.js", "to": "${destComponentsLib}/select2/dist/js"}
        \],
        "select2-bootstrap-theme": \[
            {"from": "${sourceNodeLib}/select2-bootstrap-theme/dist/select2-bootstrap.min.css", "to": "${destComponentsLib}/select2-bootstrap-theme/dist"}
        \],
        "typeahead.js": \[
            {"from": "${sourceNodeLib}/typeahead.js/dist/typeahead.bundle.min.js", "to": "${destComponentsLib}/typeahead.js/dist"}
        \],
        "bootstrap-tagsinput": \[
            {"from": "${sourceNodeLib}/bootstrap-tagsinput/dist/bootstrap-tagsinput.css", "to": "${destComponentsLib}/bootstrap-tagsinput/dist", processCSS: true},
            {"from": "${sourceNodeLib}/bootstrap-tagsinput/dist/bootstrap-tagsinput.min.js", "to": "${destComponentsLib}/bootstrap-tagsinput/dist"}
        \],
        "bootstrap-switch": \[
            {"from": "${sourceNodeLib}/bootstrap-switch/dist/css/bootstrap3/bootstrap-switch.min.css", "to": "${destComponentsLib}/bootstrap-switch/dist/css/bootstrap3"},
            {"from": "${sourceNodeLib}/bootstrap-switch/dist/js/bootstrap-switch.min.js", "to": "${destComponentsLib}/bootstrap-switch/dist/js"}

        \],
        "bootstrap-maxlength": \[
            {"from": "${sourceNodeLib}/bootstrap-maxlength/bootstrap-maxlength.min.js", "to": "${destComponentsLib}/bootstrap-maxlength"}
        \],
        "autosize": \[
            {"from": "${sourceNodeLib}/autosize/dist/autosize.min.js", "to": "${destComponentsLib}/autosize/dist"}
        \],
        "summernote": \[
//            {"from": "${sourceNodeLib}/summernote/dist/\*\*/\*", "to": "${destComponentsLib}/summernote/dist"},
            {"from": "${sourceNodeLib}/summernote/dist/font/\*\*/\*", "to": "${destComponentsLib}/summernote/dist/font"},
//            {"from": "${sourceNodeLib}/summernote/dist/lang/\*\*/\*", "to": "${destComponentsLib}/summernote/dist/lang"},
            {"from": "${sourceNodeLib}/summernote/dist/summernote-bs4.min.js", "to": "${destComponentsLib}/summernote/dist"},
            {"from": "${sourceNodeLib}/summernote/dist/summernote-bs4.css", "to": "${destComponentsLib}/summernote/dist"}
        \],
        "ion-rangeslider": \[
            {"from": "${sourceNodeLib}/ion-rangeslider/css/ion.rangeSlider.css", "to": "${destComponentsLib}/ion-rangeslider/css", processCSS: true},
            {"from": "${sourceNodeLib}/ion-rangeslider/css/ion.rangeSlider.skinHTML5.css", "to": "${destComponentsLib}/ion-rangeslider/css", processCSS: true},
            {"from": "${sourceNodeLib}/ion-rangeslider/js/ion.rangeSlider.min.js", "to": "${destComponentsLib}/ion-rangeslider/js"}
        \],
        "bootstrap-slider": \[
            {"from": "${sourceNodeLib}/bootstrap-slider/dist/css/bootstrap-slider.min.css", "to": "${destComponentsLib}/bootstrap-slider/dist/css"},
            {"from": "${sourceNodeLib}/bootstrap-slider/dist/bootstrap-slider.min.js", "to": "${destComponentsLib}/bootstrap-slider/dist"}
        \],
        "jquery-knob": \[
            {"from": "${sourceNodeLib}/jquery-knob/dist/jquery.knob.min.js", "to": "${destComponentsLib}/jquery-knob/dist"}
        \],
        "fullcalendar": \[
            {"from": "${sourceNodeLib}/fullcalendar/dist/fullcalendar.min.css", "to": "${destComponentsLib}/fullcalendar/dist"},
            {"from": "${sourceNodeLib}/fullcalendar/dist/fullcalendar.print.min.css", "to": "${destComponentsLib}/fullcalendar/dist"},
            {"from": "${sourceNodeLib}/fullcalendar/dist/fullcalendar.min.js", "to": "${destComponentsLib}/fullcalendar/dist"}
        \],
        "cropperjs": \[
            {"from": "${sourceNodeLib}/cropperjs/dist/cropper.min.css", "to": "${destComponentsLib}/cropperjs/dist"},
            {"from": "${sourceNodeLib}/cropperjs/dist/cropper.min.js", "to": "${destComponentsLib}/cropperjs/dist"}
        \],
        "jquery-cropper": \[
            {"from": "${sourceNodeLib}/jquery-cropper/dist/jquery-cropper.min.js", "to": "${destComponentsLib}/jquery-cropper/dist"}
        \],
        "waypoints": \[
            {"from": "${sourceNodeLib}/waypoints/lib/jquery.waypoints.min.js", "to": "${destComponentsLib}/waypoints/lib"}
        \],
        "jquery.counterup": \[
            {"from": "${sourceNodeLib}/jquery.counterup/jquery.counterup.min.js", "to": "${destComponentsLib}/jquery.counterup"}
        \],
        "multiselect": \[
            {"from": "${sourceNodeLib}/multiselect/css/multi-select.css", "to": "${destComponentsLib}/multiselect/css", processCSS: true},
            {"from": "${sourceNodeLib}/multiselect/img/switch.png", "to": "${destComponentsLib}/multiselect/img"},
            {"from": "${sourceNodeLib}/multiselect/js/jquery.multi-select.js", "to": "${destComponentsLib}/multiselect/js", processJS: true}
        \],
        "timeago": \[
            {"from": "${sourceNodeLib}/timeago/jquery.timeago.js", "to": "${destComponentsLib}/timeago", processJS: true}
        \],
        "quicksearch": \[
            {"from": "${sourceNodeLib}/quicksearch/jquery.quicksearch.js", "to": "${destComponentsLib}/quicksearch", processJS: true}
        \],
        "jquery-validation": \[
            {"from": "${sourceNodeLib}/jquery-validation/dist/jquery.validate.min.js", "to": "${destComponentsLib}/jquery-validation/dist"},
            {"from": "${sourceNodeLib}/jquery-validation/dist/additional-methods.js", "to": "${destComponentsLib}/jquery-validation/dist", processJS: true}
        \],
        "inputmask": \[
            {"from": "${sourceNodeLib}/inputmask/dist/min/jquery.inputmask.bundle.min.js", "to": "${destComponentsLib}/inputmask/dist/min"},
            {"from": "${sourceNodeLib}/inputmask/dist/min/inputmask/phone-codes/phone.min.js", "to": "${destComponentsLib}/inputmask/dist/min/inputmask/phone-codes"},
            {"from": "${sourceNodeLib}/inputmask/dist/min/inputmask/bindings/inputmask.binding.min.js", "to": "${destComponentsLib}/inputmask/dist/min/inputmask/bindings"}
        \],
        "jquery-form": \[
            {"from": "${sourceNodeLib}/jquery-form/dist/jquery.form.min.js", "to": "${destComponentsLib}/jquery-form/dist"}
        \],
        "dropzone": \[
            {"from": "${sourceNodeLib}/dropzone/dist/min/dropzone.min.css", "to": "${destComponentsLib}/dropzone/dist/min"},
            {"from": "${sourceNodeLib}/dropzone/dist/min/dropzone.min.js", "to": "${destComponentsLib}/dropzone/dist/min"}
        \],
        "datatables.net": \[
            {"from": "${sourceNodeLib}/datatables.net/js/jquery.dataTables.js", "to": "${destComponentsLib}/datatables.net/js", processJS: true}
        \],
        "datatables.net-bs4": \[
            {"from": "${sourceNodeLib}/datatables.net-bs4/css/dataTables.bootstrap4.css", "to": "${destComponentsLib}/datatables.net-bs4/css", processCSS: true},
            {"from": "${sourceNodeLib}/datatables.net-bs4/js/dataTables.bootstrap4.js", "to": "${destComponentsLib}/datatables.net-bs4/js", processJS: true}
        \],
        "datatables.net-fixedheader": \[
            {"from": "${sourceNodeLib}/datatables.net-fixedheader/js/dataTables.fixedHeader.min.js", "to": "${destComponentsLib}/datatables.net-fixedheader/js"}
        \],
        "datatables.net-fixedheader-bs4": \[
            {"from": "${sourceNodeLib}/datatables.net-fixedheader-bs4/css/fixedHeader.bootstrap4.min.css", "to": "${destComponentsLib}/datatables.net-fixedheader-bs4/css"}
        \],
        "datatables.net-responsive": \[
            {"from": "${sourceNodeLib}/datatables.net-responsive/js/dataTables.responsive.min.js", "to": "${destComponentsLib}/datatables.net-responsive/js"}
        \],
        "datatables.net-responsive-bs4": \[
            {"from": "${sourceNodeLib}/datatables.net-responsive-bs4/css/responsive.bootstrap4.min.css", "to": "${destComponentsLib}/datatables.net-responsive-bs4/css"},
            {"from": "${sourceNodeLib}/datatables.net-responsive-bs4/js/responsive.bootstrap4.min.js", "to": "${destComponentsLib}/datatables.net-responsive-bs4/js"}
        \],
        "datatables.net-select": \[
            {"from": "${sourceNodeLib}/datatables.net-select/js/dataTables.select.min.js", "to": "${destComponentsLib}/datatables.net-select/js"}
        \],
        "datatables.net-select-bs4": \[
            {"from": "${sourceNodeLib}/datatables.net-select-bs4/css/select.bootstrap4.min.css", "to": "${destComponentsLib}/datatables.net-select-bs4/css"}
        \],
        "chart.js": \[
            {"from": "${sourceNodeLib}/chart.js/dist/Chart.min.js", "to": "${destComponentsLib}/chart.js/dist"}
        \],
        "echarts": \[
            {"from": "${sourceNodeLib}/echarts/dist/echarts.min.js", "to": "${destComponentsLib}/echarts/dist"}
        \],
        "ekko-lightbox": \[
            {"from": "${sourceNodeLib}/ekko-lightbox/dist/ekko-lightbox.css", "to": "${destComponentsLib}/ekko-lightbox/dist"},
            {"from": "${sourceNodeLib}/ekko-lightbox/dist/ekko-lightbox.min.js", "to": "${destComponentsLib}/ekko-lightbox/dist"}
        \],
        "magnific-popup": \[
            {"from": "${sourceNodeLib}/magnific-popup/dist/magnific-popup.css", "to": "${destComponentsLib}/magnific-popup/dist", processCSS: true},
            {"from": "${sourceNodeLib}/magnific-popup/dist/jquery.magnific-popup.min.js", "to": "${destComponentsLib}/magnific-popup/dist"}
        \],
        "slick-carousel": \[
            {"from": "${sourceNodeLib}/slick-carousel/slick/ajax-loader.gif", "to": "${destComponentsLib}/slick-carousel/slick"},
            {"from": "${sourceNodeLib}/slick-carousel/slick/fonts/\*\*/\*", "to": "${destComponentsLib}/slick-carousel/slick/fonts"},
            {"from": "${sourceNodeLib}/slick-carousel/slick/slick.css", "to": "${destComponentsLib}/slick-carousel/slick", processCSS: true},
            {"from": "${sourceNodeLib}/slick-carousel/slick/slick-theme.css", "to": "${destComponentsLib}/slick-carousel/slick", processCSS: true},
            {"from": "${sourceNodeLib}/slick-carousel/slick/slick.min.js", "to": "${destComponentsLib}/slick-carousel/slick"}
        \],
        "malihu-custom-scrollbar-plugin": \[
            {"from": "${sourceNodeLib}/malihu-custom-scrollbar-plugin/jquery.mCustomScrollbar.concat.min.js", "to": "${destComponentsLib}/malihu-custom-scrollbar-plugin"},
            {"from": "${sourceNodeLib}/malihu-custom-scrollbar-plugin/jquery.mCustomScrollbar.css", "to": "${destComponentsLib}/malihu-custom-scrollbar-plugin", processCSS: true},
            {"from": "${sourceNodeLib}/malihu-custom-scrollbar-plugin/mCSB\_buttons.png", "to": "${destComponentsLib}/malihu-custom-scrollbar-plugin"}
        \],
        "bootstrap-reverse": \[
            {"from": "${sourceNodeLib}/bootstrap-reverse/dist/\*\*/\*", "to": "${destComponentsLib}/bootstrap-reverse/dist"},
            {"from": "${sourceNodeLib}/bootstrap-reverse/demo/\*\*/\*", "to": "${destComponentsLib}/bootstrap-reverse/demo"}
        \],
        "bootstrap-modal-wrapper": \[
            {"from": "${sourceNodeLib}/bootstrap-modal-wrapper/dist/bootstrap-modal-wrapper-factory.min.js", "to": "${destComponentsLib}/bootstrap-modal-wrapper/dist"}
        \],
        "bootstrap-actionable": \[
            {"from": "${sourceNodeLib}/bootstrap-actionable/dist/bootstrap-actionable.min.js", "to": "${destComponentsLib}/bootstrap-actionable/dist"}
        \],
        "bootstrap-card-extender": \[
            {"from": "${sourceNodeLib}/bootstrap-card-extender/dist/bootstrap-card-extender.min.css", "to": "${destComponentsLib}/bootstrap-card-extender/dist"},
            {"from": "${sourceNodeLib}/bootstrap-card-extender/dist/bootstrap-card-extender.min.js", "to": "${destComponentsLib}/bootstrap-card-extender/dist"}
        \],
        "bootstrap-alert-wrapper": \[
            {"from": "${sourceNodeLib}/bootstrap-alert-wrapper/dist/bootstrap-alert-wrapper.min.js", "to": "${destComponentsLib}/bootstrap-alert-wrapper/dist"}
        \],
        "Blob": \[
            {"from": "${sourceNodeLib}/Blob/Blob.js", "to": "${destComponentsLib}/Blob", processJS: true}
        \],
        "canvas-toBlob": \[
            {"from": "${sourceNodeLib}/canvas-toBlob/canvas-toBlob.js", "to": "${destComponentsLib}/canvas-toBlob", processJS: true}
        \],
        "file-saver": \[
            {"from": "${sourceNodeLib}/file-saver/FileSaver.min.js", "to": "${destComponentsLib}/file-saver"}
        \],
        "numeral": \[
            {"from": "${sourceNodeLib}/numeral/min/numeral.min.js", "to": "${destComponentsLib}/numeral/min"}
        \]
    }
};
```
Actually it is not a standard nor optimal, but give us need functionality and flexibility to select only wanted file and decide what we could do with them before moving or merging them . The following is the gulp's task called `copy-components` that use the above configuration to copy folders and files and processes them from `./node_modules` to `./web/components` :
```
function getClass(object) {
    return Object.prototype.toString.call(object).slice(8, -1);
}

applyParameters = function (jsonObj, p) {
    if (getClass(jsonObj) !== 'String') {
        for (var key in jsonObj) {
            if (jsonObj.hasOwnProperty(key)) {
                applyParameters(jsonObj\[key\], (p === "" ? "" : p + ".") + key);
            }
        }
    } else {
        solveParameters(jsonObj);
    }
};
solveParameters = function (path) {
    var regex = new RegExp(/\\$\\{(.\*?)\\}/);
    var dot = function (obj, i) {
        return obj\[i\];
    };
    var matched;
    if (getClass(path) === 'String') {
        while (matched = path.match(regex)) {
            var realpath = matched\[1\].split('.').reduce(dot, config);
            path = path.replace(matched\[0\], realpath);
        }
    }
    return path;
};
gulp.task('delete-components', function (cb) {
    return del(\[config.destComponentsLib\], cb);
});
gulp.task('copy-components', \["delete-components"\], function () {
    for (var key in config.plugins) {
        if (config.plugins.hasOwnProperty(key)) {
            var componentConfig = config.plugins\[key\];
            for (var i = 0; i < componentConfig.length; i++) {
                var componentResource = componentConfig\[i\];
                var to = solveParameters(componentResource.to);
                var from = solveParameters(componentResource.from);
                console.log("copy resource from \[" + from + "\] to \[" + to + "\] processCSS \[" + componentResource.processCSS + "\], processJS \[" + componentResource.processJS + "\]");
                gulp.src(from)
                        .pipe(gulpif(componentResource.processJS === true, uglify({output: {comments: /^!/}})))
                        .pipe(gulpif(componentResource.processCSS === true, cleanCSS()))
                        .pipe(gulp.dest(to));
            }
        }
    }
});
```
We used `gulp-if` plugins to check if the resource need any preprocessing. So if it is a Javascript file we apply `gulp-uglify` plugin on the resource and if it is CSS file we apply `gulp-clean-css` plugin on the resource before move them.

We can simply update or add another gulp's task that improve above technique to accomplish your requirements.
