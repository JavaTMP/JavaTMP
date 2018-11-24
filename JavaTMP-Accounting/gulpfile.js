
var gulp = require('gulp');
var sass = require('gulp-sass');
var connect = require('gulp-connect');
var rename = require('gulp-rename');
var uglify = require('gulp-uglify');
var pump = require('pump');
var cleanCSS = require('gulp-clean-css');
var concat = require('gulp-concat');
var del = require('del');
var eslint = require('gulp-eslint');
var autoprefixer = require('gulp-autoprefixer');
var gulpif = require('gulp-if');
var async = require('async');
var config = {
    "sourceNodeLib": "./node_modules",
    "destComponentsLib": "./web/components",
    "destDist": "./web/assets/dist",
    "plugins": {
        "fontawesome-free": [
            {"from": "${sourceNodeLib}/@fortawesome/fontawesome-free/webfonts/**/*", "to": "${destComponentsLib}/fontawesome-free/webfonts"}
        ],
        "font-awesome-animation": [
            {"from": "${sourceNodeLib}/font-awesome-animation/dist/font-awesome-animation.min.css", "to": "${destComponentsLib}/font-awesome-animation/dist"}
        ],
        "jquery": [
            {"from": "${sourceNodeLib}/jquery/dist/jquery.min.js", "to": "${destComponentsLib}/jquery/dist"}
        ],
        "jquery-ui": [
            {"from": "${sourceNodeLib}/jquery-ui-dist/jquery-ui.min.css", "to": "${destComponentsLib}/jquery-ui-dist"},
            {"from": "${sourceNodeLib}/jquery-ui-dist/jquery-ui.min.js", "to": "${destComponentsLib}/jquery-ui-dist"}

        ],
        "jquery-ui-touch-punch": [
            {"from": "${sourceNodeLib}/jquery-ui-touch-punch/jquery.ui.touch-punch.min.js", "to": "${destComponentsLib}/jquery-ui-touch-punch"}
        ],
        "popper.js": [
            {"from": "${sourceNodeLib}/popper.js/dist/umd/popper.min.js", "to": "${destComponentsLib}/popper.js/dist/umd"}
        ],
        "bootstrap": [
            {"from": "${sourceNodeLib}/bootstrap/dist/css/bootstrap.min.css", "to": "${destComponentsLib}/bootstrap/dist/css"},
            {"from": "${sourceNodeLib}/bootstrap/dist/js/bootstrap.min.js", "to": "${destComponentsLib}/bootstrap/dist/js"}
        ],
        "metismenu": [
            {"from": "${sourceNodeLib}/metismenu/dist/metisMenu.min.js", "to": "${destComponentsLib}/metismenu/dist"},
            {"from": "${sourceNodeLib}/metismenu/dist/metisMenu.min.css", "to": "${destComponentsLib}/metismenu/dist"}
        ],
        "blockui": [
            {"from": "${sourceNodeLib}/blockui/jquery.blockUI.js", "to": "${destComponentsLib}/blockui", "processCSS": false, "processJS": true}
        ],
        "nprogress": [
            {"from": "${sourceNodeLib}/nprogress/nprogress.css", "to": "${destComponentsLib}/nprogress", processCSS: true},
            {"from": "${sourceNodeLib}/nprogress/nprogress.js", "to": "${destComponentsLib}/nprogress", processJS: true}
        ],
        "scrollup": [
            {"from": "${sourceNodeLib}/scrollup/dist/jquery.scrollUp.min.js", "to": "${destComponentsLib}/scrollup/dist"}
        ],
        /* All Above Plugins are considered Mandatory */
        "jquery.fancytree": [
            {"from": "${sourceNodeLib}/jquery.fancytree/dist/skin-bootstrap/ui.fancytree.min.css", "to": "${destComponentsLib}/jquery.fancytree/dist/skin-bootstrap"},
            {"from": "${sourceNodeLib}/jquery.fancytree/dist/jquery.fancytree-all.min.js", "to": "${destComponentsLib}/jquery.fancytree/dist"}
        ],
        "toastr": [
            {"from": "${sourceNodeLib}/toastr/build/toastr.min.css", "to": "${destComponentsLib}/toastr/build"},
            {"from": "${sourceNodeLib}/toastr/build/toastr.min.js", "to": "${destComponentsLib}/toastr/build"}
        ],
        "jquery-idletimer": [
            {"from": "${sourceNodeLib}/jquery-idletimer/dist/idle-timer.min.js", "to": "${destComponentsLib}/jquery-idletimer/dist"}
        ],
        "moment": [
            {"from": "${sourceNodeLib}/moment/min/moment.min.js", "to": "${destComponentsLib}/moment/min"},
            {"from": "${sourceNodeLib}/moment/min/locales.min.js", "to": "${destComponentsLib}/moment/min"}
//            {"from": "${sourceNodeLib}/moment/locale/ar.js", "to": "${destComponentsLib}/moment/locale", processJS: true},
//            {"from": "${sourceNodeLib}/moment/locale/en-gb.js", "to": "${destComponentsLib}/moment/locale", processJS: true}
        ],
        "bootstrap-daterangepicker": [
            {"from": "${sourceNodeLib}/bootstrap-daterangepicker/daterangepicker.css", "to": "${destComponentsLib}/bootstrap-daterangepicker", processCSS: true},
            {"from": "${sourceNodeLib}/bootstrap-daterangepicker/daterangepicker.js", "to": "${destComponentsLib}/bootstrap-daterangepicker", processJS: true}
        ],
        "bootstrap-colorselector": [
            {"from": "${sourceNodeLib}/bootstrap-colorselector/dist/bootstrap-colorselector.min.css", "to": "${destComponentsLib}/bootstrap-colorselector/dist"},
            {"from": "${sourceNodeLib}/bootstrap-colorselector/dist/bootstrap-colorselector.min.js", "to": "${destComponentsLib}/bootstrap-colorselector/dist"}
        ],
        "select2": [
            {"from": "${sourceNodeLib}/select2/dist/css/select2.min.css", "to": "${destComponentsLib}/select2/dist/css"},
            {"from": "${sourceNodeLib}/select2/dist/js/select2.full.min.js", "to": "${destComponentsLib}/select2/dist/js"}
        ],
        "select2-bootstrap-theme": [
            {"from": "${sourceNodeLib}/select2-bootstrap-theme/dist/select2-bootstrap.min.css", "to": "${destComponentsLib}/select2-bootstrap-theme/dist"}
        ],
        "bootstrap-maxlength": [
            {"from": "${sourceNodeLib}/bootstrap-maxlength/bootstrap-maxlength.min.js", "to": "${destComponentsLib}/bootstrap-maxlength"}
        ],
        "autosize": [
            {"from": "${sourceNodeLib}/autosize/dist/autosize.min.js", "to": "${destComponentsLib}/autosize/dist"}
        ],
        "summernote": [
            {"from": "${sourceNodeLib}/summernote/dist/font/**/*", "to": "${destComponentsLib}/summernote/dist/font"},
            {"from": "${sourceNodeLib}/summernote/dist/lang/**/*", "to": "${destComponentsLib}/summernote/dist/lang"},
            {"from": "${sourceNodeLib}/summernote/dist/summernote-bs4.min.js", "to": "${destComponentsLib}/summernote/dist"},
            {"from": "${sourceNodeLib}/summernote/dist/summernote-bs4.css", "to": "${destComponentsLib}/summernote/dist"}
        ],
        "ion-rangeslider": [
            {"from": "${sourceNodeLib}/ion-rangeslider/css/ion.rangeSlider.css", "to": "${destComponentsLib}/ion-rangeslider/css", processCSS: true},
            {"from": "${sourceNodeLib}/ion-rangeslider/css/ion.rangeSlider.skinHTML5.css", "to": "${destComponentsLib}/ion-rangeslider/css", processCSS: true},
            {"from": "${sourceNodeLib}/ion-rangeslider/js/ion.rangeSlider.min.js", "to": "${destComponentsLib}/ion-rangeslider/js"}
        ],
        "bootstrap-slider": [
            {"from": "${sourceNodeLib}/bootstrap-slider/dist/css/bootstrap-slider.min.css", "to": "${destComponentsLib}/bootstrap-slider/dist/css"},
            {"from": "${sourceNodeLib}/bootstrap-slider/dist/bootstrap-slider.min.js", "to": "${destComponentsLib}/bootstrap-slider/dist"}
        ],
        "fullcalendar": [
            {"from": "${sourceNodeLib}/fullcalendar/dist/fullcalendar.min.css", "to": "${destComponentsLib}/fullcalendar/dist"},
            {"from": "${sourceNodeLib}/fullcalendar/dist/fullcalendar.print.min.css", "to": "${destComponentsLib}/fullcalendar/dist"},
            {"from": "${sourceNodeLib}/fullcalendar/dist/fullcalendar.min.js", "to": "${destComponentsLib}/fullcalendar/dist"},
            {"from": "${sourceNodeLib}/fullcalendar/dist/locale/**/*", "to": "${destComponentsLib}/fullcalendar/dist/locale"}
        ],
        "cropperjs": [
            {"from": "${sourceNodeLib}/cropperjs/dist/cropper.min.css", "to": "${destComponentsLib}/cropperjs/dist"},
            {"from": "${sourceNodeLib}/cropperjs/dist/cropper.min.js", "to": "${destComponentsLib}/cropperjs/dist"}
        ],
        "jquery-cropper": [
            {"from": "${sourceNodeLib}/jquery-cropper/dist/jquery-cropper.min.js", "to": "${destComponentsLib}/jquery-cropper/dist"}
        ],
        "waypoints": [
            {"from": "${sourceNodeLib}/waypoints/lib/jquery.waypoints.min.js", "to": "${destComponentsLib}/waypoints/lib"}
        ],
        "jquery.counterup": [
            {"from": "${sourceNodeLib}/jquery.counterup/jquery.counterup.min.js", "to": "${destComponentsLib}/jquery.counterup"}
        ],
        "timeago": [
            {"from": "${sourceNodeLib}/timeago/jquery.timeago.js", "to": "${destComponentsLib}/timeago", processJS: true},
            {"from": "${sourceNodeLib}/timeago/locales/jquery.timeago.en.js", "to": "${destComponentsLib}/timeago/locales", processJS: true},
            {"from": "${sourceNodeLib}/timeago/locales/jquery.timeago.ar.js", "to": "${destComponentsLib}/timeago/locales", processJS: true}
        ],
        "jquery-validation": [
            {"from": "${sourceNodeLib}/jquery-validation/dist/jquery.validate.min.js", "to": "${destComponentsLib}/jquery-validation/dist"},
            {"from": "${sourceNodeLib}/jquery-validation/dist/additional-methods.js", "to": "${destComponentsLib}/jquery-validation/dist", processJS: true},
            {"from": "${sourceNodeLib}/jquery-validation/dist/localization/**/*", "to": "${destComponentsLib}/jquery-validation/dist/localization", processJS: true}
        ],
        "inputmask": [
            {"from": "${sourceNodeLib}/inputmask/dist/min/jquery.inputmask.bundle.min.js", "to": "${destComponentsLib}/inputmask/dist/min"},
            {"from": "${sourceNodeLib}/inputmask/dist/min/inputmask/bindings/inputmask.binding.min.js", "to": "${destComponentsLib}/inputmask/dist/min/inputmask/bindings"}
        ],
        "jquery-form": [
            {"from": "${sourceNodeLib}/jquery-form/dist/jquery.form.min.js", "to": "${destComponentsLib}/jquery-form/dist"}
        ],
        "datatables.net": [
            {"from": "${sourceNodeLib}/datatables.net/js/jquery.dataTables.js", "to": "${destComponentsLib}/datatables.net/js", processJS: true}
        ],
        "datatables.net-bs4": [
            {"from": "${sourceNodeLib}/datatables.net-bs4/css/dataTables.bootstrap4.css", "to": "${destComponentsLib}/datatables.net-bs4/css", processCSS: true},
            {"from": "${sourceNodeLib}/datatables.net-bs4/js/dataTables.bootstrap4.js", "to": "${destComponentsLib}/datatables.net-bs4/js", processJS: true}
        ],
        "datatables.net-fixedheader": [
            {"from": "${sourceNodeLib}/datatables.net-fixedheader/js/dataTables.fixedHeader.min.js", "to": "${destComponentsLib}/datatables.net-fixedheader/js"}
        ],
        "datatables.net-fixedheader-bs4": [
            {"from": "${sourceNodeLib}/datatables.net-fixedheader-bs4/css/fixedHeader.bootstrap4.min.css", "to": "${destComponentsLib}/datatables.net-fixedheader-bs4/css"}
        ],
        "datatables.net-responsive": [
            {"from": "${sourceNodeLib}/datatables.net-responsive/js/dataTables.responsive.min.js", "to": "${destComponentsLib}/datatables.net-responsive/js"}
        ],
        "datatables.net-responsive-bs4": [
            {"from": "${sourceNodeLib}/datatables.net-responsive-bs4/css/responsive.bootstrap4.min.css", "to": "${destComponentsLib}/datatables.net-responsive-bs4/css"},
            {"from": "${sourceNodeLib}/datatables.net-responsive-bs4/js/responsive.bootstrap4.min.js", "to": "${destComponentsLib}/datatables.net-responsive-bs4/js"}
        ],
        "datatables.net-select": [
            {"from": "${sourceNodeLib}/datatables.net-select/js/dataTables.select.min.js", "to": "${destComponentsLib}/datatables.net-select/js"}
        ],
        "datatables.net-select-bs4": [
            {"from": "${sourceNodeLib}/datatables.net-select-bs4/css/select.bootstrap4.min.css", "to": "${destComponentsLib}/datatables.net-select-bs4/css"}
        ],
        "datatables.net-keytable": [
            {"from": "${sourceNodeLib}/datatables.net-keytable/js/dataTables.keyTable.min.js", "to": "${destComponentsLib}/datatables.net-keytable/js"}
        ],
        "datatables.net-keytable-bs4": [
            {"from": "${sourceNodeLib}/datatables.net-keytable-bs4/css/keyTable.bootstrap4.min.css", "to": "${destComponentsLib}/datatables.net-keytable-bs4/css"},
            {"from": "${sourceNodeLib}/datatables.net-keytable-bs4/js/keyTable.bootstrap4.min.js", "to": "${destComponentsLib}/datatables.net-keytable-bs4/js"}
        ],
        "datatables.net-fixedcolumns": [
            {"from": "${sourceNodeLib}/datatables.net-fixedcolumns/js/dataTables.fixedColumns.min.js", "to": "${destComponentsLib}/datatables.net-fixedcolumns/js"}
        ],
        "datatables.net-fixedcolumns-bs4": [
            {"from": "${sourceNodeLib}/datatables.net-fixedcolumns-bs4/css/fixedColumns.bootstrap4.min.css", "to": "${destComponentsLib}/datatables.net-fixedcolumns-bs4/css"},
            {"from": "${sourceNodeLib}/datatables.net-fixedcolumns-bs4/js/fixedColumns.bootstrap4.min.js", "to": "${destComponentsLib}/datatables.net-fixedcolumns-bs4/js"}
        ],
        "datatables.net-rowgroup": [
            {"from": "${sourceNodeLib}/datatables.net-rowgroup/js/dataTables.rowGroup.min.js", "to": "${destComponentsLib}/datatables.net-rowgroup/js"}
        ],
        "datatables.net-rowgroup-bs4": [
            {"from": "${sourceNodeLib}/datatables.net-rowgroup-bs4/css/rowGroup.bootstrap4.min.css", "to": "${destComponentsLib}/datatables.net-rowgroup-bs4/css"},
            {"from": "${sourceNodeLib}/datatables.net-rowgroup-bs4/js/rowGroup.bootstrap4.min.js", "to": "${destComponentsLib}/datatables.net-rowgroup-bs4/js"}
        ],
        "echarts": [
            {"from": "${sourceNodeLib}/echarts/dist/echarts.min.js", "to": "${destComponentsLib}/echarts/dist"},
            {"from": "${sourceNodeLib}/echarts/map/js/world.js", "to": "${destComponentsLib}/echarts/map/js/"}
        ],
        "slick-carousel": [
            {"from": "${sourceNodeLib}/slick-carousel/slick/ajax-loader.gif", "to": "${destComponentsLib}/slick-carousel/slick"},
            {"from": "${sourceNodeLib}/slick-carousel/slick/fonts/**/*", "to": "${destComponentsLib}/slick-carousel/slick/fonts"},
            {"from": "${sourceNodeLib}/slick-carousel/slick/slick.css", "to": "${destComponentsLib}/slick-carousel/slick", processCSS: true},
            {"from": "${sourceNodeLib}/slick-carousel/slick/slick-theme.css", "to": "${destComponentsLib}/slick-carousel/slick", processCSS: true},
            {"from": "${sourceNodeLib}/slick-carousel/slick/slick.min.js", "to": "${destComponentsLib}/slick-carousel/slick"}
        ],
        "malihu-custom-scrollbar-plugin": [
            {"from": "${sourceNodeLib}/malihu-custom-scrollbar-plugin/jquery.mCustomScrollbar.concat.min.js", "to": "${destComponentsLib}/malihu-custom-scrollbar-plugin"},
            {"from": "${sourceNodeLib}/malihu-custom-scrollbar-plugin/jquery.mCustomScrollbar.css", "to": "${destComponentsLib}/malihu-custom-scrollbar-plugin", processCSS: true},
            {"from": "${sourceNodeLib}/malihu-custom-scrollbar-plugin/mCSB_buttons.png", "to": "${destComponentsLib}/malihu-custom-scrollbar-plugin"}
        ],
        "bootstrap-reverse": [
            {"from": "${sourceNodeLib}/bootstrap-reverse/dist/**/*", "to": "${destComponentsLib}/bootstrap-reverse/dist"},
            {"from": "${sourceNodeLib}/bootstrap-reverse/demo/**/*", "to": "${destComponentsLib}/bootstrap-reverse/demo"}
        ],
        "bootstrap-modal-wrapper": [
            {"from": "${sourceNodeLib}/bootstrap-modal-wrapper/dist/bootstrap-modal-wrapper-factory.min.js", "to": "${destComponentsLib}/bootstrap-modal-wrapper/dist"}
        ],
        "bootstrap-actionable": [
            {"from": "${sourceNodeLib}/bootstrap-actionable/dist/bootstrap-actionable.min.js", "to": "${destComponentsLib}/bootstrap-actionable/dist"}
        ],
        "bootstrap-card-extender": [
            {"from": "${sourceNodeLib}/bootstrap-card-extender/dist/bootstrap-card-extender.min.css", "to": "${destComponentsLib}/bootstrap-card-extender/dist"},
            {"from": "${sourceNodeLib}/bootstrap-card-extender/dist/bootstrap-card-extender.min.js", "to": "${destComponentsLib}/bootstrap-card-extender/dist"}
        ],
        "bootstrap-alert-wrapper": [
            {"from": "${sourceNodeLib}/bootstrap-alert-wrapper/dist/bootstrap-alert-wrapper.min.js", "to": "${destComponentsLib}/bootstrap-alert-wrapper/dist"}
        ],
        "Blob": [
            {"from": "${sourceNodeLib}/Blob/Blob.js", "to": "${destComponentsLib}/Blob", processJS: true}
        ],
        "canvas-toBlob": [
            {"from": "${sourceNodeLib}/canvas-toBlob/canvas-toBlob.js", "to": "${destComponentsLib}/canvas-toBlob", processJS: true}
        ],
        "file-saver": [
            {"from": "${sourceNodeLib}/file-saver/FileSaver.min.js", "to": "${destComponentsLib}/file-saver"}
        ],
        "numeral": [
            {"from": "${sourceNodeLib}/numeral/min/numeral.min.js", "to": "${destComponentsLib}/numeral/min"}
        ],
        "moment-timezone": [
            {"from": "${sourceNodeLib}/moment-timezone/**/*", "to": "${destComponentsLib}/moment-timezone"}
        ],
        "material-design-icons": [
            {"from": "${sourceNodeLib}/material-design-icons/iconfont/MaterialIcons-Regular.*", "to": "${destComponentsLib}/material-design-icons/iconfont"},
            {"from": "${sourceNodeLib}/material-design-icons/iconfont/material-icons.css", "to": "${destComponentsLib}/material-design-icons/iconfont", processCSS: true}
        ]
    }
};
var src = {
    "css": [
        "./web/components/font-awesome-animation/dist/font-awesome-animation.min.css",
        "./web/components/jquery-ui-dist/jquery-ui.min.css",
        "./web/components/metismenu/dist/metisMenu.min.css",
        "./web/components/nprogress/nprogress.css",
        "./web/components/jquery.fancytree/dist/skin-bootstrap/ui.fancytree.min.css",
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
        "./web/components/datatables.net-keytable-bs4/css/keyTable.bootstrap4.min.css",
        "./web/components/datatables.net-fixedcolumns-bs4/css/fixedColumns.bootstrap4.min.css",
        "./web/components/datatables.net-rowgroup-bs4/css/rowGroup.bootstrap4.min.css",
        "./web/components/slick-carousel/slick/slick.css",
        "./web/components/slick-carousel/slick/slick-theme.css",
        "./web/components/malihu-custom-scrollbar-plugin/jquery.mCustomScrollbar.css",
        "./web/components/bootstrap-card-extender/dist/bootstrap-card-extender.min.css"
    ],
    "cssForPrint": [
        "./web/components/fullcalendar/dist/fullcalendar.print.min.css"
    ],
    "fonts": [
        "./web/components/fontawesome-free/webfonts/**/*",
        "./web/components/summernote/dist/font/**/*",
        "./web/components/slick-carousel/slick/fonts/**/*",
        "./web/assets/src/fonts/open-sans/**/*",
        "./web/assets/src/fonts/droidarabickufi/**/*",
        "./web/components/material-design-icons/iconfont/**/*"
    ],
    "img": [
        "./web/components/slick-carousel/slick/ajax-loader.gif",
        "./web/components/malihu-custom-scrollbar-plugin/mCSB_buttons.png"
    ],
    "js": [
        "./web/components/jquery/dist/jquery.min.js",
        "./web/components/jquery-ui-dist/jquery-ui.min.js",
        "./web/components/jquery-ui-touch-punch/jquery.ui.touch-punch.min.js",
        "./web/components/popper.js/dist/umd/popper.min.js",
        "./web/components/bootstrap/dist/js/bootstrap.min.js",
        "./web/components/metismenu/dist/metisMenu.min.js",
        "./web/components/blockui/jquery.blockUI.js",
        "./web/components/nprogress/nprogress.js",
        "./web/components/scrollup/dist/jquery.scrollUp.min.js",
        "./web/components/jquery.fancytree/dist/jquery.fancytree-all.min.js",
        "./web/components/toastr/build/toastr.min.js",
        "./web/components/jquery-idletimer/dist/idle-timer.min.js",
        "./web/components/moment/min/moment.min.js",
        "./web/components/moment-timezone/builds/moment-timezone-with-data.min.js",
        "./web/components/bootstrap-daterangepicker/daterangepicker.js",
        "./web/components/bootstrap-colorselector/dist/bootstrap-colorselector.min.js",
        "./web/components/select2/dist/js/select2.full.min.js",
        "./web/components/bootstrap-maxlength/bootstrap-maxlength.min.js",
        "./web/components/autosize/dist/autosize.min.js",
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
        "./web/components/datatables.net-keytable/js/dataTables.keyTable.min.js",
        "./web/components/datatables.net-keytable-bs4/js/keyTable.bootstrap4.min.js",
        "./web/components/datatables.net-fixedcolumns/js/dataTables.fixedColumns.min.js",
        "./web/components/datatables.net-fixedcolumns-bs4/js/fixedColumns.bootstrap4.min.js",
        "./web/components/datatables.net-rowgroup/js/dataTables.rowGroup.min.js",
        "./web/components/datatables.net-rowgroup-bs4/js/rowGroup.bootstrap4.min.js",
        "./web/components/echarts/dist/echarts.min.js",
        "./web/components/echarts/map/js/world.js",
        "./web/components/slick-carousel/slick/slick.min.js",
        "./web/components/malihu-custom-scrollbar-plugin/jquery.mCustomScrollbar.concat.min.js",
        "./web/components/bootstrap-modal-wrapper/dist/bootstrap-modal-wrapper-factory.min.js",
        "./web/components/bootstrap-actionable/dist/bootstrap-actionable.min.js",
        "./web/components/bootstrap-card-extender/dist/bootstrap-card-extender.min.js",
        "./web/components/bootstrap-alert-wrapper/dist/bootstrap-alert-wrapper.min.js",
        "./web/components/numeral/min/numeral.min.js"
    ],
    "localeJS": {
        "en": [
            "./web/components/moment/min/locales.min.js",
            "./web/components/timeago/locales/jquery.timeago.en.js"
        ],
        "ar": [
            "./web/components/moment/min/locales.min.js",
            "./web/components/summernote/dist/lang/summernote-ar-AR.min.js",
            "./web/components/fullcalendar/dist/locale/ar.js",
            "./web/components/timeago/locales/jquery.timeago.ar.js",
            "./web/components/jquery-validation/dist/localization/messages_ar.js"
        ]
    },
    "fontFamilyFiles": {
        "en": [
            "./web/assets/src/sass/font-family/font-family-en.scss"
        ],
        "ar": [
            "./web/assets/src/sass/font-family/font-family-ar.scss"
        ]
    }
};
function getClass(object) {
    return Object.prototype.toString.call(object).slice(8, -1);
}

applyParameters = function (jsonObj, p) {
    if (getClass(jsonObj) !== 'String') {
        for (var key in jsonObj) {
            if (jsonObj.hasOwnProperty(key)) {
                applyParameters(jsonObj[key], (p === "" ? "" : p + ".") + key);
            }
        }
    } else {
        solveParameters(jsonObj);
    }
};
solveParameters = function (path) {
    var regex = new RegExp(/\$\{(.*?)\}/);
    var dot = function (obj, i) {
        return obj[i];
    };
    var matched;
    if (getClass(path) === 'String') {
        while (matched = path.match(regex)) {
            var realpath = matched[1].split('.').reduce(dot, config);
            path = path.replace(matched[0], realpath);
        }
    }
    return path;
};
gulp.task('delete-components', function (cb) {
    return del([config.destComponentsLib], cb);
});
gulp.task('delete-dist', function (cb) {
    return del([config.destDist], cb);
});
gulp.task('copy-components', ["delete-components"], function () {
    for (var key in config.plugins) {
        if (config.plugins.hasOwnProperty(key)) {
            var componentConfig = config.plugins[key];
            for (var i = 0; i < componentConfig.length; i++) {
                var componentResource = componentConfig[i];
                var to = solveParameters(componentResource.to);
                var from = solveParameters(componentResource.from);
                console.log("copy resource from [" + from + "] to [" + to + "] processCSS [" + componentResource.processCSS + "], processJS [" + componentResource.processJS + "]");
                gulp.src(from)
                        .pipe(gulpif(componentResource.processJS === true, uglify({output: {comments: /^!/}})))
                        .pipe(gulpif(componentResource.processCSS === true, cleanCSS()))
                        .pipe(gulp.dest(to));
            }
        }
    }
});
gulp.task('generate-dist', ['copy-components', "delete-dist", "delete-css", "delete-js"], function (cb) {
    async.series([
        function (next) {
            console.log("Compile and generate sass/themes");
            gulp.src([
                './web/assets/src/sass/themes/javatmp-*.scss'])
                    .pipe(sass().on('error', sass.logError))
                    .pipe(autoprefixer({
                        browsers: ['last 2 versions'],
                        cascade: false
                    }))
                    .pipe(cleanCSS())
                    .pipe(rename({suffix: '.min'}))
                    .pipe(gulp.dest('./web/assets/dist/css'))
                    .on('end', next);
        },
        function (next) {
            console.log("Compile and generate sass-rtl/themes");
            gulp.src([
                './web/assets/src/sass-rtl/themes-rtl/javatmp-*.scss'])
                    .pipe(sass().on('error', sass.logError))
                    .pipe(autoprefixer({
                        browsers: ['last 2 versions'],
                        cascade: false
                    }))
                    .pipe(cleanCSS())
                    .pipe(rename({suffix: '.min'}))
                    .pipe(gulp.dest('./web/assets/dist/css'))
                    .on('end', next);
        },
        function (next) {
            console.log("Compile and generate javatmp-plugins-all.min.css");
            gulp.src(src.css)
                    .pipe(concat("javatmp-plugins-all.min.css", {newLine: '\n'}))
                    .pipe(gulp.dest("./web/assets/dist/css"))
                    .on('end', next);
        },
        function (next) {
            console.log("Compile and generate javatmp-plugins-print-all.min.css");
            gulp.src(src.cssForPrint)
                    .pipe(concat("javatmp-plugins-print-all.min.css", {newLine: '\n'}))
                    .pipe(gulp.dest("./web/assets/dist/css"))
                    .on('end', next);
        },
        function (next) {
            console.log("Compile and generate js-src");
            gulp.src([
                './web/assets/src/js-src/javatmp.init.js',
                './web/assets/src/js-src/javatmp.util.js',
                './web/assets/src/js-src/javatmp.ajax.js',
                './web/assets/src/js-src/javatmp.sidebar.js',
                './web/assets/src/js-src/index.js'
            ])
                    .pipe(eslint())
                    .pipe(eslint.format())
                    .pipe(uglify({output: {comments: /^!/}}))
                    .pipe(concat("javatmp.min.js", {newLine: '\n'}))
                    .pipe(gulp.dest('./web/assets/dist/js/'))
                    .on('end', next);
        },
        function (next) {
            console.log("Compile and generate javatmp-plugins-all.min.js");
            gulp.src(src.js)
                    .pipe(concat("javatmp-plugins-all.min.js", {newLine: '\n;'}))
                    .pipe(gulp.dest("./web/assets/dist/js"))
                    .on('end', next);
        },
        function (next) {
            console.log("Generating javatmp-plugins-all-locale-*.min.js files");
            var count = 0;
            for (var key in src.localeJS) {
                if (src.localeJS.hasOwnProperty(key)) {
                    count++;
                    var currentKey = key;
                    var langArray = src.localeJS[currentKey];

                    console.log("Generating javatmp-plugins-all-locale-" + currentKey + ".min.js");
                    gulp.src(langArray)
                            .pipe(concat("javatmp-plugins-all-locale-" + currentKey + ".min.js", {newLine: '\n;'}))
                            .pipe(gulp.dest("./web/assets/dist/js"))
                            .on('end', (function () {
                                var k = currentKey;
                                return function () {
                                    count--;
                                    console.log("Finish javatmp-plugins-all-locale-" + k + ".min.js");
                                    if (count === 0) {
                                        console.log("Finish javatmp-plugins-all-locale-*.min.js files");
                                        next();
                                    }
                                };
                            })());
                }
            }
        },
        function (next) {
            console.log("Generating font-family-*.min.css");
            var count = 0;
            for (var key in src.fontFamilyFiles) {
                if (src.fontFamilyFiles.hasOwnProperty(key)) {
                    count++;
                    var currentKey = key;
                    var array = src.fontFamilyFiles[currentKey];

                    console.log("Generating font-family-" + currentKey + ".min.css");
                    gulp.src(array)
                            .pipe(sass().on('error', sass.logError))
                            .pipe(cleanCSS())
                            .pipe(concat("font-family-" + currentKey + ".min.css", {newLine: '\n;'}))
                            .pipe(gulp.dest("./web/assets/dist/css"))
                            .on('end', (function () {
                                var k = currentKey;
                                return function () {
                                    count--;
                                    console.log("Finish font-family-" + k + ".min.css");
                                    if (count === 0) {
                                        console.log("Finish All font-family-*.min.css files");
                                        next();
                                    }
                                };
                            })());
                }
            }
        },
        function (next) {
            console.log("Copy plugins img to dist/img");
            gulp.src(src.img)
                    .pipe(gulp.dest("./web/assets/dist/img"))
                    .on('end', next);
        },
        function (next) {
            console.log("Copy plugins fonts to dist/fonts");
            gulp.src(src.fonts)
                    .pipe(gulp.dest("./web/assets/dist/fonts"))
                    .on('end', next);
        },
        function (next) {
            del.sync([config.destComponentsLib, "./web/assets/css", "./web/assets/js"], next);
        }
    ], cb);
});
gulp.task('run-local-web-server', function () {

    connect.server({
        root: 'web',
        port: 8888,
        livereload: true
    });
});
gulp.task('delete-css', function () {
    return del(['./web/assets/css/**/*']);
});
gulp.task('delete-js', function () {
    return del(['./web/assets/js/**/*']);
});
gulp.task('default', ['generate-dist'], function () {
    process.stdout.write("*** Finished @ [" + new Date() + "] ***");
});