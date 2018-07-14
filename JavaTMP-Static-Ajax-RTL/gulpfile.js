
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
var config = {
    "sourceNodeLib": "./node_modules",
    "destComponentsLib": "./web/components",
    "plugins": {
        "material-design-icons": [
            {"from": "${sourceNodeLib}/material-design-icons/iconfont/MaterialIcons-Regular.*", "to": "${destComponentsLib}/material-design-icons/iconfont"},
            {"from": "${sourceNodeLib}/material-design-icons/iconfont/material-icons.css", "to": "${destComponentsLib}/material-design-icons/iconfont", processCSS: true}
        ],
        "fontawesome-free-webfonts": [
            {"from": "${sourceNodeLib}/@fortawesome/fontawesome-free-webfonts/css/**/*", "to": "${destComponentsLib}/fontawesome-free-webfonts/css", processCSS: true},
            {"from": "${sourceNodeLib}/@fortawesome/fontawesome-free-webfonts/webfonts/**/*", "to": "${destComponentsLib}/fontawesome-free-webfonts/webfonts"}
        ],
        "font-awesome-animation": [
            {"from": "${sourceNodeLib}/font-awesome-animation/dist/font-awesome-animation.min.css", "to": "${destComponentsLib}/font-awesome-animation/dist"}
        ],
        "jquery": [
            {"from": "${sourceNodeLib}/jquery/dist/jquery.min.js", "to": "${destComponentsLib}/jquery/dist"}
        ],
        "jquery-ui": [
            {"from": "${sourceNodeLib}/jquery-ui-dist/jquery-ui.min.css", "to": "${destComponentsLib}/jquery-ui"},
            {"from": "${sourceNodeLib}/jquery-ui-dist/jquery-ui.min.js", "to": "${destComponentsLib}/jquery-ui"}

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
        "bootstrap-datepickerr": [
            {"from": "${sourceNodeLib}/bootstrap-datepicker/dist/css/bootstrap-datepicker3.min.css", "to": "${destComponentsLib}/bootstrap-datepicker/dist/css"},
            {"from": "${sourceNodeLib}/bootstrap-datepicker/dist/locales/bootstrap-datepicker.ar.min.js", "to": "${destComponentsLib}/bootstrap-datepicker/dist/locales"},
            {"from": "${sourceNodeLib}/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js", "to": "${destComponentsLib}/bootstrap-datepicker/dist/js"}
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
        "typeahead.js": [
            {"from": "${sourceNodeLib}/typeahead.js/dist/typeahead.bundle.min.js", "to": "${destComponentsLib}/typeahead.js/dist"}
        ],
        "bootstrap-tagsinput": [
            {"from": "${sourceNodeLib}/bootstrap-tagsinput/dist/bootstrap-tagsinput.css", "to": "${destComponentsLib}/bootstrap-tagsinput/dist", processCSS: true},
            {"from": "${sourceNodeLib}/bootstrap-tagsinput/dist/bootstrap-tagsinput.min.js", "to": "${destComponentsLib}/bootstrap-tagsinput/dist"}
        ],
        "bootstrap-switch": [
            {"from": "${sourceNodeLib}/bootstrap-switch/dist/css/bootstrap3/bootstrap-switch.min.css", "to": "${destComponentsLib}/bootstrap-switch/dist/css/bootstrap3"},
            {"from": "${sourceNodeLib}/bootstrap-switch/dist/js/bootstrap-switch.min.js", "to": "${destComponentsLib}/bootstrap-switch/dist/js"}

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
        "jquery-knob": [
            {"from": "${sourceNodeLib}/jquery-knob/dist/jquery.knob.min.js", "to": "${destComponentsLib}/jquery-knob/dist"}
        ],
        "fullcalendar": [
            {"from": "${sourceNodeLib}/fullcalendar/dist/fullcalendar.min.css", "to": "${destComponentsLib}/fullcalendar/dist"},
            {"from": "${sourceNodeLib}/fullcalendar/dist/fullcalendar.print.min.css", "to": "${destComponentsLib}/fullcalendar/dist"},
            {"from": "${sourceNodeLib}/fullcalendar/dist/fullcalendar.min.js", "to": "${destComponentsLib}/fullcalendar/dist"}
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
        "multiselect": [
            {"from": "${sourceNodeLib}/multiselect/css/multi-select.css", "to": "${destComponentsLib}/multiselect/css", processCSS: true},
            {"from": "${sourceNodeLib}/multiselect/img/switch.png", "to": "${destComponentsLib}/multiselect/img"},
            {"from": "${sourceNodeLib}/multiselect/js/jquery.multi-select.js", "to": "${destComponentsLib}/multiselect/js", processJS: true}
        ],
        "timeago": [
            {"from": "${sourceNodeLib}/timeago/jquery.timeago.js", "to": "${destComponentsLib}/timeago", processJS: true}
        ],
        "quicksearch": [
            {"from": "${sourceNodeLib}/quicksearch/jquery.quicksearch.js", "to": "${destComponentsLib}/quicksearch", processJS: true}
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
        "dropzone": [
            {"from": "${sourceNodeLib}/dropzone/dist/min/dropzone.min.css", "to": "${destComponentsLib}/dropzone/dist/min"},
            {"from": "${sourceNodeLib}/dropzone/dist/min/dropzone.min.js", "to": "${destComponentsLib}/dropzone/dist/min"}
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
        "chart.js": [
            {"from": "${sourceNodeLib}/chart.js/dist/Chart.min.js", "to": "${destComponentsLib}/chart.js/dist"}
        ],
        "echarts": [
            {"from": "${sourceNodeLib}/echarts/dist/echarts.min.js", "to": "${destComponentsLib}/echarts/dist"},
            {"from": "${sourceNodeLib}/echarts/map/js/world.js", "to": "${destComponentsLib}/echarts/map/js/"}
        ],
        "ekko-lightbox": [
            {"from": "${sourceNodeLib}/ekko-lightbox/dist/ekko-lightbox.css", "to": "${destComponentsLib}/ekko-lightbox/dist"},
            {"from": "${sourceNodeLib}/ekko-lightbox/dist/ekko-lightbox.min.js", "to": "${destComponentsLib}/ekko-lightbox/dist"}
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
        ],
        "jquery-contextmenurtl": [
            {"from": "${sourceNodeLib}/jquery-contextmenurtl/dist/css/jquery.contextMenuRtl.min.css", "to": "${destComponentsLib}/jquery-contextmenurtl/dist/css"},
            {"from": "${sourceNodeLib}/jquery-contextmenurtl/dist/js/jquery.contextMenuRtl.min.js", "to": "${destComponentsLib}/jquery-contextmenurtl/dist/js"}
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
gulp.task('main-sass', ["delete-css"], function () {
    return gulp.src([
        './web/assets/src/sass/main.scss',
        './web/assets/src/sass-rtl/main-rtl.scss'
    ])
            .pipe(sass().on('error', sass.logError))
            .pipe(autoprefixer({
                browsers: ['last 2 versions'],
                cascade: false
            }))
            .pipe(cleanCSS())
            .pipe(rename({suffix: '.min'}))
            .pipe(gulp.dest('./web/assets/css/'));
});
gulp.task('plugins-sass', ["main-sass"], function () {
    return gulp.src([
        './web/assets/src/sass/plugins/**/*.scss',
        './web/assets/src/sass-rtl/plugins-rtl/**/*.scss'
    ])
            .pipe(sass().on('error', sass.logError))
            .pipe(autoprefixer({
                browsers: ['last 2 versions'],
                cascade: false
            }))
            .pipe(cleanCSS())
            .pipe(rename({suffix: '.min'}))
            .pipe(gulp.dest('./web/assets/css/plugins/'));
});
gulp.task('pages-sass', ["plugins-sass"], function () {
    return gulp.src([
        './web/assets/src/sass/pages/**/*.scss',
        './web/assets/src/sass-rtl/pages-rtl/**/*.scss'
    ])
            .pipe(sass().on('error', sass.logError))
            .pipe(autoprefixer({
                browsers: ['last 2 versions'],
                cascade: false
            }))
            .pipe(cleanCSS())
            .pipe(rename({suffix: '.min'}))
            .pipe(gulp.dest('./web/assets/css/pages/'));
});
gulp.task('font-family', ["pages-sass"], function () {
    return gulp.src(['./web/assets/src/sass/font-family/**/*.scss'])
            .pipe(sass().on('error', sass.logError))
            .pipe(autoprefixer({
                browsers: ['last 2 versions'],
                cascade: false
            }))
            .pipe(cleanCSS())
            .pipe(rename({suffix: '.min'}))
            .pipe(gulp.dest('./web/assets/css/font-family/'));
});
gulp.task('sass', ["font-family"], function () {
    console.log("sass generate css files successfully");
});
gulp.task('compress-js', ["delete-js"], function (cb) {
    pump([
        gulp.src('./web/assets/src/js-src/**/*'),
        eslint(),
        eslint.format(),
        uglify({output: {comments: /^!/}}),
        rename({suffix: '.min'}),
        gulp.dest('./web/assets/js/')
    ], cb);
});
gulp.task('watch-sass-and-js', ["delete-css", "delete-js", "sass", "compress-js"], function () {
    console.log("watching scss & js files changing");
    gulp.watch('./web/assets/src/sass/**/*.scss', ['sass']);
    gulp.watch('./web/assets/src/sass-rtl/**/*.scss', ['sass']);
    gulp.watch('./web/assets/src/js-src/**/*', ['compress-js']);
});
gulp.task('default', ['watch-sass-and-js'], function () {
    process.stdout.write("*** Finished @ [" + new Date() + "] ***");
});

