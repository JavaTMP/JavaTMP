---
title: JavaTMP Front-end Frameworks And Plugins Files
---
# JavaTMP Front-end Frameworks And Plugins Files
The JavaTMP Front-end frameworks and plugins consist of the libraries used in the front-end part of the template like jQuery, Bootstrap and it is stored separately in `./web/components` folder with all its Javascript, CSS, and images files.

It is different to custom JS/CSS files specifically used in the template, which are stored in `./web/assets` folder.

We manage our front-end dependencies using Node NPM and gulp so the folder `./web/components` are dynamically generated when we run the gulp's task `copy-components`. Read more about our [Gulp build file](/pages/gulp-build-file "JavaTMP Gulp build file") and [managing front-end dependencies using Node.js And Gulp](/pages/manage-front-end-dependencies-using-node-js-and-gulp "Manage Front-end dependencies Using Node.js And Gulp").

Please see the complete list of front-end jquery and bootstrap libraries we used in our template in the following page: [JavaTMP Front-end Plugins And Frameworks](/pages/javatmp-front-end-plugins-and-frameworks "JavaTMP Front-end Plugins And Frameworks").

##### Plugins in `./JavaTMP/JavaTMP-Static-Ajax` Project

After we downloaded front-end plugins using Node's `npm` command , We copied only needed files like dist folder and images and we used them separately when we need them.

So it is your responsibilities to decide which plugins you need and if you want to merge them in one large js or css files.

We provide a CSS customization for some of the plugins styling to apply our styling to them. Those custom CSS files reside separately in `./web/assets/css/plugins` folder. the following page describes the front-end customization for some of the plugins: [JavaTMP Resources Customization](/pages/javatmp-frontend-resources-customization "JavaTMP Front-end Resources Customization").

The following is a sub high level folders structure of `./JavaTMP/JavaTMP-Static-Ajax/web/components` folder: 
```
./JavaTMP/JavaTMP-Static-Ajax/web/components
+---jquery
    +---dist
        |---jquery.min.js
+---bootstrap
    +---dist
        +---css
            |---bootstrap.min.css
        +---js
            |---bootstrap.min.js
+---autosize
+---blockui
+---bootstrap-colorselector
+---bootstrap-datepicker
+---bootstrap-daterangepicker
+---bootstrap-maxlength
+---bootstrap-slider
+---bootstrap-switch
+---bootstrap-tagsinput
+---cropper
+---datatables.net
+---datatables.net-bs4
+---datatables.net-fixedheader
+---datatables.net-fixedheader-bs4
+---datatables.net-responsive
+---datatables.net-responsive-bs4
+---datatables.net-select
+---datatables.net-select-bs4
+---dropzone
+---echarts
+---ekko-lightbox
+---font-awesome
+---material-design-icons
+---font-awesome-animation
+---fullcalendar
+---inputmask
+---ion-rangeslider
+---jquery-contextmenu
+---jquery-form
+---jquery-idletimer
+---jquery-knob
+---jquery-ui
+---jquery-ui-touch-punch
+---jquery-validation
+---jquery.counterup
+---jquery.fancytree
+---magnific-popup
+---malihu-custom-scrollbar-plugin
+---metismenu
+---moment
+---multiselect
+---nprogress
+---popper.js
+---quicksearch
+---scrollup
+---select2
+---select2-bootstrap-theme
+---slick-carousel
+---summernote
+---timeago
+---toastr
+---typeahead.js
+---waypoints
```