
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
    "destComponentsLib": "./public_html/components",
    "destDist": "./public_html/assets/dist",
    "plugins": {
        "font-awesome": [
            {"from": "${sourceNodeLib}/font-awesome/web-fonts-with-css/css/fontawesome-all.min.css", "to": "${destComponentsLib}/font-awesome/web-fonts-with-css/css"},
            {"from": "${sourceNodeLib}/font-awesome/web-fonts-with-css/webfonts/*", "to": "${destComponentsLib}/font-awesome/web-fonts-with-css/webfonts"}
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
        "jquery-contextmenu": [
            {"from": "${sourceNodeLib}/jquery-contextmenu/dist/font/**/*", "to": "${destComponentsLib}/jquery-contextmenu/dist/font"},
            {"from": "${sourceNodeLib}/jquery-contextmenu/dist/jquery.contextMenu.min.css", "to": "${destComponentsLib}/jquery-contextmenu/dist"},
            {"from": "${sourceNodeLib}/jquery-contextmenu/dist/jquery.contextMenu.min.js", "to": "${destComponentsLib}/jquery-contextmenu/dist"}
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
//            {"from": "${sourceNodeLib}/summernote/dist/**/*", "to": "${destComponentsLib}/summernote/dist"},
            {"from": "${sourceNodeLib}/summernote/dist/font/**/*", "to": "${destComponentsLib}/summernote/dist/font"},
//            {"from": "${sourceNodeLib}/summernote/dist/lang/**/*", "to": "${destComponentsLib}/summernote/dist/lang"},
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
            {"from": "${sourceNodeLib}/fullcalendar/dist/fullcalendar.min.js", "to": "${destComponentsLib}/fullcalendar/dist"}
        ],
        "cropper": [
            {"from": "${sourceNodeLib}/cropper/dist/cropper.min.css", "to": "${destComponentsLib}/cropper/dist"},
            {"from": "${sourceNodeLib}/cropper/dist/cropper.min.js", "to": "${destComponentsLib}/cropper/dist"}
        ],
        "waypoints": [
            {"from": "${sourceNodeLib}/waypoints/lib/jquery.waypoints.min.js", "to": "${destComponentsLib}/waypoints/lib"}
        ],
        "jquery.counterup": [
            {"from": "${sourceNodeLib}/jquery.counterup/jquery.counterup.min.js", "to": "${destComponentsLib}/jquery.counterup"}
        ],
        "timeago": [
            {"from": "${sourceNodeLib}/timeago/jquery.timeago.js", "to": "${destComponentsLib}/timeago", processJS: true}
        ],
        "jquery-validation": [
            {"from": "${sourceNodeLib}/jquery-validation/dist/jquery.validate.min.js", "to": "${destComponentsLib}/jquery-validation/dist"},
            {"from": "${sourceNodeLib}/jquery-validation/dist/additional-methods.js", "to": "${destComponentsLib}/jquery-validation/dist", processJS: true}
        ],
        "inputmask": [
            {"from": "${sourceNodeLib}/inputmask/dist/min/jquery.inputmask.bundle.min.js", "to": "${destComponentsLib}/inputmask/dist/min"},
            {"from": "${sourceNodeLib}/inputmask/dist/min/inputmask/phone-codes/phone.min.js", "to": "${destComponentsLib}/inputmask/dist/min/inputmask/phone-codes"},
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
        "echarts": [
            {"from": "${sourceNodeLib}/echarts/dist/echarts.min.js", "to": "${destComponentsLib}/echarts/dist"}
        ],
        "magnific-popup": [
            {"from": "${sourceNodeLib}/magnific-popup/dist/magnific-popup.css", "to": "${destComponentsLib}/magnific-popup/dist", processCSS: true},
            {"from": "${sourceNodeLib}/magnific-popup/dist/jquery.magnific-popup.min.js", "to": "${destComponentsLib}/magnific-popup/dist"}
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
        ]
    }
};
var src = {
    "css": [
        "./public_html/components/font-awesome/web-fonts-with-css/css/fontawesome-all.min.css",
        "./public_html/components/font-awesome-animation/dist/font-awesome-animation.min.css",
        "./public_html/components/jquery-ui-dist/jquery-ui.min.css",
//        "./public_html/components/bootstrap/dist/css/bootstrap.min.css",
        "./public_html/components/metismenu/dist/metisMenu.min.css",
        "./public_html/components/nprogress/nprogress.css",
        "./public_html/components/jquery.fancytree/dist/skin-bootstrap/ui.fancytree.min.css",
        "./public_html/components/jquery-contextmenu/dist/jquery.contextMenu.min.css",
        "./public_html/components/toastr/build/toastr.min.css",
        "./public_html/components/bootstrap-daterangepicker/daterangepicker.css",
        "./public_html/components/bootstrap-colorselector/dist/bootstrap-colorselector.min.css",
        "./public_html/components/select2/dist/css/select2.min.css",
        "./public_html/components/select2-bootstrap-theme/dist/select2-bootstrap.min.css",
        "./public_html/components/summernote/dist/summernote-bs4.css",
        "./public_html/components/ion-rangeslider/css/ion.rangeSlider.css",
        "./public_html/components/ion-rangeslider/css/ion.rangeSlider.skinHTML5.css",
        "./public_html/components/bootstrap-slider/dist/css/bootstrap-slider.min.css",
        "./public_html/components/fullcalendar/dist/fullcalendar.min.css",
        "./public_html/components/cropper/dist/cropper.min.css",
        "./public_html/components/datatables.net-bs4/css/dataTables.bootstrap4.css",
        "./public_html/components/datatables.net-fixedheader-bs4/css/fixedHeader.bootstrap4.min.css",
        "./public_html/components/datatables.net-responsive-bs4/css/responsive.bootstrap4.min.css",
        "./public_html/components/datatables.net-select-bs4/css/select.bootstrap4.min.css",
        "./public_html/components/magnific-popup/dist/magnific-popup.css",
        "./public_html/components/slick-carousel/slick/slick.css",
        "./public_html/components/slick-carousel/slick/slick-theme.css",
        "./public_html/components/malihu-custom-scrollbar-plugin/jquery.mCustomScrollbar.css",
//        "./public_html/components/bootstrap-reverse/dist/**/*",
        "./public_html/components/bootstrap-card-extender/dist/bootstrap-card-extender.min.css"
    ],
    "cssForPrint": [
        "./public_html/components/fullcalendar/dist/fullcalendar.print.min.css"
    ],
    "fonts": [
        "./public_html/components/font-awesome/web-fonts-with-css/webfonts/**/*",
        "./public_html/components/jquery-contextmenu/dist/font/**/*",
        "./public_html/components/summernote/dist/font/**/*",
        "./public_html/components/slick-carousel/slick/fonts/**/*",
        "./public_html/assets/src/fonts/**/*"
    ],
    "img": [
        "./public_html/components/slick-carousel/slick/ajax-loader.gif",
        "./public_html/components/malihu-custom-scrollbar-plugin/mCSB_buttons.png"
    ],
    "js": ["./public_html/components/jquery/dist/jquery.min.js",
        "./public_html/components/jquery-ui-dist/jquery-ui.min.js",
        "./public_html/components/jquery-ui-touch-punch/jquery.ui.touch-punch.min.js",
        "./public_html/components/popper.js/dist/umd/popper.min.js",
        "./public_html/components/bootstrap/dist/js/bootstrap.min.js",
        "./public_html/components/metismenu/dist/metisMenu.min.js",
        "./public_html/components/blockui/jquery.blockUI.js",
        "./public_html/components/nprogress/nprogress.js",
        "./public_html/components/scrollup/dist/jquery.scrollUp.min.js",
        "./public_html/components/jquery.fancytree/dist/jquery.fancytree-all.min.js",
        "./public_html/components/jquery-contextmenu/dist/jquery.contextMenu.min.js",
        "./public_html/components/toastr/build/toastr.min.js",
        "./public_html/components/jquery-idletimer/dist/idle-timer.min.js",
        "./public_html/components/moment/min/moment.min.js",
        "./public_html/components/moment/min/locales.min.js",
        "./public_html/components/bootstrap-daterangepicker/daterangepicker.js",
        "./public_html/components/bootstrap-colorselector/dist/bootstrap-colorselector.min.js",
        "./public_html/components/select2/dist/js/select2.full.min.js",
        "./public_html/components/bootstrap-maxlength/bootstrap-maxlength.min.js",
        "./public_html/components/autosize/dist/autosize.min.js",
        "./public_html/components/summernote/dist/lang/**/*",
        "./public_html/components/summernote/dist/summernote-bs4.min.js",
        "./public_html/components/ion-rangeslider/js/ion.rangeSlider.min.js",
        "./public_html/components/bootstrap-slider/dist/bootstrap-slider.min.js",
        "./public_html/components/fullcalendar/dist/fullcalendar.min.js",
        "./public_html/components/cropper/dist/cropper.min.js",
        "./public_html/components/waypoints/lib/jquery.waypoints.min.js",
        "./public_html/components/jquery.counterup/jquery.counterup.min.js",
        "./public_html/components/timeago/jquery.timeago.js",
        "./public_html/components/jquery-validation/dist/jquery.validate.min.js",
        "./public_html/components/jquery-validation/dist/additional-methods.js",
        "./public_html/components/inputmask/dist/min/jquery.inputmask.bundle.min.js",
        "./public_html/components/inputmask/dist/min/inputmask/phone-codes/phone.min.js",
        "./public_html/components/inputmask/dist/min/inputmask/bindings/inputmask.binding.min.js",
        "./public_html/components/jquery-form/dist/jquery.form.min.js",
        "./public_html/components/datatables.net/js/jquery.dataTables.js",
        "./public_html/components/datatables.net-bs4/js/dataTables.bootstrap4.js",
        "./public_html/components/datatables.net-fixedheader/js/dataTables.fixedHeader.min.js",
        "./public_html/components/datatables.net-responsive/js/dataTables.responsive.min.js",
        "./public_html/components/datatables.net-responsive-bs4/js/responsive.bootstrap4.min.js",
        "./public_html/components/datatables.net-select/js/dataTables.select.min.js",
        "./public_html/components/echarts/dist/echarts.min.js",
        "./public_html/components/magnific-popup/dist/jquery.magnific-popup.min.js",
        "./public_html/components/slick-carousel/slick/slick.min.js",
        "./public_html/components/malihu-custom-scrollbar-plugin/jquery.mCustomScrollbar.concat.min.js",
        "./public_html/components/bootstrap-modal-wrapper/dist/bootstrap-modal-wrapper-factory.min.js",
        "./public_html/components/bootstrap-actionable/dist/bootstrap-actionable.min.js",
        "./public_html/components/bootstrap-card-extender/dist/bootstrap-card-extender.min.js",
        "./public_html/components/bootstrap-alert-wrapper/dist/bootstrap-alert-wrapper.min.js"
    ]
}
;
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
gulp.task('generate-dist', ['copy-components', "delete-dist", "delete-css", "delete-js", "compress-js"], function (cb) {
    async.series([
        function (next) {
            gulp.src([
                './public_html/assets/src/sass/javatmp-*.scss'])
                    .pipe(sass().on('error', sass.logError))
                    .pipe(autoprefixer({
                        browsers: ['last 2 versions'],
                        cascade: false
                    }))
                    .pipe(cleanCSS())
                    .pipe(rename({suffix: '.min'}))
                    .pipe(gulp.dest('./public_html/assets/dist/css'))
                    .on('end', next);
        },
        function (next) {
            gulp.src(src.css)
                    .pipe(concat("javatmp-plugins-all.min.css", {newLine: '\n'}))
                    .pipe(gulp.dest("./public_html/assets/dist/css"))
                    .on('end', next);
        },
        function (next) {
            gulp.src(src.cssForPrint)
                    .pipe(concat("javatmp-plugins-print-all.min.css", {newLine: '\n'}))
                    .pipe(gulp.dest("./public_html/assets/dist/css"))
                    .on('end', next);
        },
        function (next) {
            gulp.src('./public_html/assets/src/js-src/**/*')
                    .pipe(eslint())
                    .pipe(eslint.format())
                    .pipe(uglify({output: {comments: /^!/}}))
                    .pipe(rename({suffix: '.min'}))
                    .pipe(gulp.dest('./public_html/assets/dist/js/'))
                    .on('end', next);
        },
        function (next) {
            gulp.src(src.js)
                    .pipe(concat("javatmp-plugins-all.min.js", {newLine: '\n;'}))
                    .pipe(gulp.dest("./public_html/assets/dist/js"))
                    .on('end', next);
        },
        function (next) {
            gulp.src(src.img)
                    .pipe(gulp.dest("./public_html/assets/dist/img"))
                    .on('end', next);
        },
        function (next) {
            gulp.src(src.fonts)
                    .pipe(gulp.dest("./public_html/assets/dist/fonts"))
                    .on('end', next);
        },
        function (next) {
            del.sync([config.destComponentsLib, "./public_html/assets/css", "./public_html/assets/js"], next);
        }
    ], cb);
});
gulp.task('run-local-web-server', function () {

    connect.server({
        root: 'public_html',
        port: 8888,
        livereload: true
    });
});
gulp.task('delete-css', function () {
    return del(['./public_html/assets/css/**/*']);
});
gulp.task('delete-js', function () {
    return del(['./public_html/assets/js/**/*']);
});
//gulp.task('main-sass', ["delete-css"], function () {
//    return gulp.src(['./public_html/assets/src/sass/main.scss'])
//            .pipe(sass().on('error', sass.logError))
//            .pipe(autoprefixer({
//                browsers: ['last 2 versions'],
//                cascade: false
//            }))
//            .pipe(cleanCSS())
//            .pipe(rename({suffix: '.min'}))
//            .pipe(gulp.dest('./public_html/assets/css/'));
//});
//gulp.task('plugins-sass', ["main-sass"], function () {
//    return gulp.src(['./public_html/assets/src/sass/plugins/**/*.scss'])
//            .pipe(sass().on('error', sass.logError))
//            .pipe(autoprefixer({
//                browsers: ['last 2 versions'],
//                cascade: false
//            }))
//            .pipe(cleanCSS())
//            .pipe(rename({suffix: '.min'}))
//            .pipe(gulp.dest('./public_html/assets/css/plugins/'));
//});
//gulp.task('pages-sass', ["plugins-sass"], function () {
//    return gulp.src(['./public_html/assets/src/sass/pages/**/*.scss'])
//            .pipe(sass().on('error', sass.logError))
//            .pipe(autoprefixer({
//                browsers: ['last 2 versions'],
//                cascade: false
//            }))
//            .pipe(cleanCSS())
//            .pipe(rename({suffix: '.min'}))
//            .pipe(gulp.dest('./public_html/assets/css/pages/'));
//});
gulp.task('sass', ["main-sass"], function () {
    console.log("sass generate css files successfully");
});
gulp.task('compress-js', ["delete-js"], function (cb) {
    pump([
        gulp.src('./public_html/assets/src/js-src/**/*'),
        eslint(),
        eslint.format(),
        uglify({output: {comments: /^!/}}),
        rename({suffix: '.min'}),
        gulp.dest('./public_html/assets/js/')
    ], cb);
});
gulp.task('watch-sass-and-js', ["delete-css", "delete-js", "sass", "compress-js"], function () {
    console.log("watching scss & js files changing");
    gulp.watch('./public_html/assets/src/sass/**/*.scss', ['sass']);
    gulp.watch('./public_html/assets/src/js-src/**/*', ['compress-js']);
});
gulp.task('default', ['watch-sass-and-js'], function () {
    process.stdout.write("*** Finished @ [" + new Date() + "] ***");
});

