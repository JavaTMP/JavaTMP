
var gulp = require('gulp');
var git = require('gulp-git');
var fs = require('fs');
var del = require('del');
var gulpif = require('gulp-if');
var pump = require('pump');
var runSequence = require('run-sequence');
var zip = require('gulp-zip');
var processhtml = require('gulp-processhtml');
var uglify = require('gulp-uglify');
var rename = require('gulp-rename');
var chmod = require('gulp-chmod');
var htmlmin = require('gulp-htmlmin');
var connect = require('gulp-connect');
var header = require('gulp-header');
var pkg = require('./package.json');
var eslint = require('gulp-eslint');

var banner = ['/*!',
    ' * <%= pkg.description %>',
    ' *',
    ' * @version <%= pkg.version %>',
    ' * @link <%= pkg.homepage %>',
    ' * @copyright 2018 JavaTMP',
    ' * @license <%= pkg.license %>',
    ' */',
    ''].join('\n');

gulp.task('update-version', function (cb) {
//    pkg.version = "v" + pkg.version;
    var versionParts = pkg.version.split('.');
    var vArray = {
        vMajor: versionParts[0],
        vMinor: versionParts[1],
        vPatch: versionParts[2]
    };

    vArray.vPatch = parseFloat(vArray.vPatch) + 1;
    var periodString = ".";

    pkg.version = vArray.vMajor + periodString +
            vArray.vMinor + periodString +
            vArray.vPatch;
    console.log(JSON.stringify(pkg));
    fs.writeFile('./package.json', JSON.stringify(pkg, null, 4), 'utf8', function (err) {
        if (err)
            throw err;
        pkg.version = "v" + pkg.version;
        console.log("Package Version updated [" + pkg.version + "]");
        cb();
    });
});

gulp.task('clean', function (cb) {
    del.sync(['./temp', './dist']);
    cb();
});

gulp.task('copy-JavaTMP-Static-Ajax', function (cb) {
    return gulp
            .src([
                'JavaTMP-Static-Ajax/**/*',
                '!**/node_modules{,/**}',
                '!**/nbproject/private{,/**}'
            ], {dot: true, read: false})
            .pipe(gulp.dest("temp/JavaTMP-Static-Ajax"))
            .on('end', function () {
                cb();
            });
});
gulp.task('copy-JavaTMP-Static-Ajax-RTL', function (cb) {
    return gulp
            .src([
                './JavaTMP-Static-Ajax-RTL/**/*',
                '!**/node_modules{,/**}',
                '!**/nbproject/private{,/**}'
            ], {dot: true, read: false})
            .pipe(gulp.dest("temp/JavaTMP-Static-Ajax-RTL"))
            .on('end', function () {
                cb();
            });
});
gulp.task('copy-JavaTMP-Static-Ajax-Starter', function (cb) {
    return gulp
            .src([
                './JavaTMP-Static-Ajax-Starter/**/*',
                '!**/node_modules{,/**}',
                '!**/nbproject/private{,/**}'
            ], {dot: true, read: false})
            .pipe(gulp.dest("temp/JavaTMP-Static-Ajax-Starter"))
            .on('end', function () {
                cb();
            });
});
gulp.task('copy-JavaTMP-Static-Ajax-Starter-RTL', function (cb) {
    return gulp
            .src([
                './JavaTMP-Static-Ajax-Starter-RTL/**/*',
                '!**/node_modules{,/**}',
                '!**/nbproject/private{,/**}'
            ], {dot: true, read: false})
            .pipe(gulp.dest("temp/JavaTMP-Static-Ajax-Starter-RTL"))
            .on('end', function () {
                cb();
            });
});
//gulp.task('license-javatmp-static-ajax', function (cb) {
//    return gulp
//            .src([
//                'temp/JavaTMP-Static-Ajax/**/*',
//                "!**/public_html/components{,/**}",
//                "!**/public_html/assets/fonts{,/**}",
//                "!**/public_html/assets/img{,/**}"], {dot: true})
//            .pipe(header(banner, {pkg: pkg}))
//            .pipe(gulp.dest("temp/JavaTMP-Static-Ajax"))
//            .on('end', function () {
//                cb();
//            });
//});
//gulp.task('license-javatmp-static-ajax-rtl', function (cb) {
//    return gulp
//            .src([
//                'temp/JavaTMP-Static-Ajax-RTL/**/*',
//                "!**/public_html/components{,/**}",
//                "!**/public_html/assets/fonts{,/**}",
//                "!**/public_html/assets/img{,/**}"], {dot: true})
//            .pipe(header(banner, {pkg: pkg}))
//            .pipe(gulp.dest("temp/JavaTMP-Static-Ajax-RTL"))
//            .on('end', function () {
//                cb();
//            });
//});

gulp.task('save-project-online-static-demo', function (cb) {
    return gulp
            .src(['temp/JavaTMP-Static-Ajax/public_html/**/*'], {dot: true, read: false})
            .pipe(gulp.dest("temp/online-static-demo"))
            .on('end', function () {
                cb();
            });
});
gulp.task('save-project-online-static-demo-rtl', function (cb) {
    return gulp
            .src(['temp/JavaTMP-Static-Ajax-RTL/public_html/**/*'], {dot: true, read: false})
            .pipe(gulp.dest("temp/online-static-demo-rtl"))
            .on('end', function () {
                cb();
            });
});
gulp.task('save-project-online-static-demo-starter', function (cb) {
    return gulp
            .src(['temp/JavaTMP-Static-Ajax-Starter/public_html/**/*'], {dot: true, read: false})
            .pipe(gulp.dest("temp/online-static-demo-starter"))
            .on('end', function () {
                cb();
            });
});
gulp.task('save-project-online-static-demo-starter-rtl', function (cb) {
    return gulp
            .src(['temp/JavaTMP-Static-Ajax-Starter-RTL/public_html/**/*'], {dot: true, read: false})
            .pipe(gulp.dest("temp/online-static-demo-starter-rtl"))
            .on('end', function () {
                cb();
            });
});
gulp.task('process-javatmp-static-ajax', function (cb) {
    return gulp
            .src(['temp/JavaTMP-Static-Ajax/**/*.html'], {dot: true})
            .pipe(processhtml())
            .pipe(gulp.dest("temp/JavaTMP-Static-Ajax"))
            .on('end', function () {
                cb();
            });
});
gulp.task('process-javatmp-static-ajax-rtl', function (cb) {
    return gulp
            .src(['temp/JavaTMP-Static-Ajax-RTL/**/*.html'], {dot: true})
            .pipe(processhtml())
            .pipe(gulp.dest("temp/JavaTMP-Static-Ajax-RTL"))
            .on('end', function () {
                cb();
            });
});
gulp.task('process-javatmp-static-ajax-starter', function (cb) {
    return gulp
            .src(['temp/JavaTMP-Static-Ajax-Starter/**/*.html'], {dot: true})
            .pipe(processhtml())
            .pipe(gulp.dest("temp/JavaTMP-Static-Ajax-Starter"))
            .on('end', function () {
                cb();
            });
});
gulp.task('process-javatmp-static-ajax-starter-rtl', function (cb) {
    return gulp
            .src(['temp/JavaTMP-Static-Ajax-Starter-RTL/**/*.html'], {dot: true})
            .pipe(processhtml())
            .pipe(gulp.dest("temp/JavaTMP-Static-Ajax-Starter-RTL"))
            .on('end', function () {
                cb();
            });
});

gulp.task('remove-demo-assets-src', function (cb) {
    del.sync([
        'temp/online-static-demo-starter-rtl/assets/src',
        'temp/online-static-demo-starter/assets/src',
        'temp/online-static-demo-rtl/assets/src',
        'temp/online-static-demo/assets/src'
    ], cb());
});

gulp.task('process-online-static-demo', function (cb) {
    return gulp.src(['temp/online-static-demo/**/*.html'], {dot: true})
            .pipe(htmlmin({collapseWhitespace: true, minifyCSS: true, minifyJS: true, removeComments: true, ignoreCustomComments: false}))
            .pipe(gulp.dest("temp/online-static-demo"))
            .on('end', function () {
                cb();
            });
});

gulp.task('process-online-static-demo-rtl', function (cb) {
    return gulp
            .src(['temp/online-static-demo-rtl/**/*.html'], {dot: true})
            .pipe(htmlmin({collapseWhitespace: true, minifyCSS: true, minifyJS: true, removeComments: true, ignoreCustomComments: false}))
            .pipe(gulp.dest("temp/online-static-demo-rtl"))
            .on('end', function () {
                cb();
            });
});
gulp.task('process-online-static-demo-starter', function (cb) {
    return gulp
            .src(['temp/online-static-demo-starter/**/*.html'], {dot: true})
            .pipe(htmlmin({collapseWhitespace: true, minifyCSS: true, minifyJS: true, removeComments: true, ignoreCustomComments: false}))
            .pipe(gulp.dest("temp/online-static-demo-starter"))
            .on('end', function () {
                cb();
            });
});
gulp.task('process-online-static-demo-starter-rtl', function (cb) {
    return gulp
            .src(['temp/online-static-demo-starter-rtl/**/*.html'], {dot: true})
            .pipe(htmlmin({collapseWhitespace: true, minifyCSS: true, minifyJS: true, removeComments: true, ignoreCustomComments: false}))
            .pipe(gulp.dest("temp/online-static-demo-starter-rtl"))
            .on('end', function () {
                cb();
            });
});

gulp.task('generate-online-static-demo-zip', function (cb) {
    return gulp.src(['temp/online-static-demo/**/*'], {dot: true})
            .pipe(chmod(0o644, true))
            .pipe(zip('javatmp-static-ajax.zip'))
            .pipe(gulp.dest('temp'))
            .on('end', function () {
                cb();
            });
});
gulp.task('generate-online-static-demo-rtl-zip', function (cb) {
    return gulp.src(['temp/online-static-demo-rtl/**/*'], {dot: true})
            .pipe(chmod(0o644, true))
            .pipe(zip('javatmp-static-ajax-rtl.zip'))
            .pipe(gulp.dest('temp'))
            .on('end', function () {
                cb();
            });
});
gulp.task('generate-online-static-demo-starter-zip', function (cb) {
    return gulp.src(['temp/online-static-demo-starter/**/*'], {dot: true})
            .pipe(chmod(0o644, true))
            .pipe(zip('javatmp-static-ajax-starter.zip'))
            .pipe(gulp.dest('temp'))
            .on('end', function () {
                cb();
            });
});
gulp.task('generate-online-static-demo-starter-rtl-zip', function (cb) {
    return gulp.src(['temp/online-static-demo-starter/**/*'], {dot: true})
            .pipe(chmod(0o644, true))
            .pipe(zip('javatmp-static-ajax-starter-rtl.zip'))
            .pipe(gulp.dest('temp'))
            .on('end', function () {
                cb();
            });
});

gulp.task('remove-online-static-demos (LTR & RTL)', function (cb) {
    del.sync([
        'temp/online-static-demo',
        'temp/online-static-demo-rtl',
        'temp/online-static-demo-starter',
        'temp/online-static-demo-starter-rtl'
    ], cb());
});
//gulp.task('remove-embedded-code', function (cb) {
//    return gulp.src('temp/JavaTMP-Static-Ajax/public_html/assets/src/js-src/javatmp.js')
//            .pipe(eslint())
//            .pipe(eslint.format())
//            .pipe(processhtml())
//            .pipe(uglify({output: {comments: /^!/}}))
//            .pipe(rename({suffix: '.min'}))
//            .pipe(gulp.dest('temp/JavaTMP-Static-Ajax/public_html/assets/js/')).on('end', function () {
//        cb();
//    });
//});
//gulp.task('remove-embedded-code-rtl', function (cb) {
//    return gulp
//            .src('temp/JavaTMP-Static-Ajax-RTL/public_html/assets/src/js-src/javatmp.js')
//            .pipe(eslint())
//            .pipe(eslint.format())
//            .pipe(processhtml())
//            .pipe(uglify({output: {comments: /^!/}}))
//            .pipe(rename({suffix: '.min'}))
//            .pipe(gulp.dest('temp/JavaTMP-Static-Ajax-RTL/public_html/assets/js/'))
//            .on('end', function () {
//                cb();
//            });
//});


gulp.task('copy-readme', function (cb) {
    return gulp
            .src(['readme.md', 'LICENSE'])
            .pipe(gulp.dest('temp/'))
            .on('end', function () {
                cb();
            });
});

gulp.task('zip', function (cb) {
    return gulp
            .src(['temp/**/*'], {dot: true})
            .pipe(chmod(0o644, true))
            .pipe(zip('javatmp.zip'))
            .pipe(gulp.dest('dist'))
            .on('end', function () {
                cb();
            });
});
gulp.task('git-add', function (cb) {
    return gulp.src(['./*',
        "!./temp",
        "!./node_modules",
        '!**/node_modules{,/**}',
        "!./temp"
    ]).pipe(git.add({args: ''}, cb)).on('end', function () {
        cb();
    });
});

gulp.task('git-commit', function (cb) {
    return gulp.src('./*')
            .pipe(git.commit(undefined, {
                args: '-am \"' + pkg.version + '"',
                disableMessageRequirement: true
            }, cb));
});
gulp.task('save-projects',
        gulp.series(
                "clean",
                'copy-JavaTMP-Static-Ajax',
                'copy-JavaTMP-Static-Ajax-RTL',
                'copy-JavaTMP-Static-Ajax-Starter',
                'copy-JavaTMP-Static-Ajax-Starter-RTL',
//                'license-javatmp-static-ajax',
//                'license-javatmp-static-ajax-rtl',
                'save-project-online-static-demo',
                'save-project-online-static-demo-rtl',
                'save-project-online-static-demo-starter',
                'save-project-online-static-demo-starter-rtl',
                'process-javatmp-static-ajax',
                'process-javatmp-static-ajax-rtl',
                'process-javatmp-static-ajax-starter',
                'process-javatmp-static-ajax-starter-rtl',
                'remove-demo-assets-src',
                'process-online-static-demo',
                'process-online-static-demo-rtl',
                'process-online-static-demo-starter',
                'process-online-static-demo-starter-rtl',
                'generate-online-static-demo-zip',
                'generate-online-static-demo-rtl-zip',
                'generate-online-static-demo-starter-zip',
                'generate-online-static-demo-starter-rtl-zip',
                'remove-online-static-demos (LTR & RTL)',
//                'remove-embedded-code',
//                'remove-embedded-code-rtl',
                'copy-readme',
                'zip',
                function (cb) {
                    cb();
                })
        );


gulp.task('create-new-tag', gulp.series('git-add', 'git-commit', function (cb) {
    git.tag(pkg.version, pkg.version, /*{args: '--force'},*/ function (error) {
        if (error) {
            throw error;
        }
        cb();
    });
//    git.push('origin', 'master', {args: '--tags'}, cb);
}));

gulp.task('push:tag', gulp.series('create-new-tag', function (cb) {
    return git.push('origin', 'master', {args: '--tags'}, function (err) {
        if (err)
            throw err;
        cb();
    });
}));
gulp.task('push', gulp.series('git-add', 'git-commit', function (cb) {
    return git.push('origin', 'master', function (err) {
        if (err)
            throw err;
        cb();

    });
}));

gulp.task('release', gulp.series('update-version', 'save-projects', 'push:tag', function (cb) {
    cb();
}));


//https://stackoverflow.com/questions/5343068/is-there-a-way-to-skip-password-typing-when-using-https-on-github
gulp.task('default', gulp.series('save-projects', 'push', function (cb) {
    console.log("*** Zip files in dist should be created ***");
    console.log("Current Version Number [" + pkg.version + "]");
    console.log("Now we commit and push current changes :");
    cb();
}));

gulp.task('run', function () {

    connect.server({
//        root: '',
        port: 8888,
        livereload: true
    });
});
