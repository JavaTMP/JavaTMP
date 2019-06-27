
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
const markdown = require('gulp-markdown');
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
//    cb();
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
    del.sync(['./temp', './dist-java'], cb());
});
gulp.task('copy-JavaTMP-Static-Ajax', function (cb) {
    return gulp
            .src([
                './JavaTMP-Static-Ajax/**/*',
                '!**/node_modules{,/**}',
                '!**/nbproject/private{,/**}',
                '!**/package-lock.json'
            ], {dot: true})
            .pipe(gulp.dest("temp/JavaTMP-Static-Ajax"))
            .on('end', function () {
                cb();
            });
});
gulp.task('copy-JavaTMP-User-Starter', function (cb) {
    return gulp
            .src([
                './JavaTMP-User-Starter/**/*',
                '!**/node_modules{,/**}',
                '!**/nbproject/private{,/**}',
                '!**/package-lock.json'
            ], {dot: true})
            .pipe(gulp.dest("temp/JavaTMP-User-Starter"))
            .on('end', function () {
                cb();
            });
});
gulp.task('license-javatmp-static-ajax', function (cb) {
    return gulp
            .src([
                'temp/JavaTMP-Static-Ajax/**/*',
                "!**/web/components{,/**}",
                "!**/web/assets/fonts{,/**}",
                "!**/web/assets/img{,/**}"], {dot: true})
            .pipe(header(banner, {pkg: pkg}))
            .pipe(gulp.dest("temp/JavaTMP-Static-Ajax"))
            .on('end', function () {
                cb();
            });
});
gulp.task('save-project-online-static-demo', function (cb) {
    return gulp
            .src(['temp/JavaTMP-Static-Ajax/web/**/*'], {dot: true})
            .pipe(gulp.dest("temp/online-static-demo"))
            .on('end', function () {
                cb();
            });
});
gulp.task('save-project-online-java-user-demo-starter', function (cb) {
    return gulp
            .src(['temp/JavaTMP-User-Starter/build/web/**/*'], {dot: true})
            .pipe(gulp.dest("temp/online-java-user-demo-starter"))
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
gulp.task('process-javatmp-user-starter', function (cb) {
    return gulp
            .src(['temp/JavaTMP-User-Starter/**/*.html', 'temp/JavaTMP-User-Starter/**/*.jsp'], {dot: true})
            .pipe(processhtml())
            .pipe(gulp.dest("temp/JavaTMP-User-Starter"))
            .on('end', function () {
                cb();
            });
});
gulp.task('remove-demo-assets-src', function (cb) {
    del.sync([
        'temp/online-java-demo/assets/src',
        'temp/online-java-user-demo-starter/assets/src',
        'temp/online-static-demo/assets/src'
    ], cb());
});
gulp.task('process-online-static-demo', function (cb) {
    return gulp
            .src(['temp/online-static-demo/**/*.html'], {dot: true})
            .pipe(htmlmin({collapseWhitespace: true, minifyCSS: true, minifyJS: true, removeComments: true, ignoreCustomComments: false}))
            .pipe(gulp.dest("temp/online-static-demo"))
            .on('end', function () {
                cb();
            });
});
gulp.task('process-online-java-user-demo-starter', function (cb) {
    return gulp
            .src(['temp/online-java-user-demo-starter/**/*.html', 'temp/online-java-user-demo-starter/**/*.jsp'], {dot: true})
            .pipe(htmlmin({collapseWhitespace: true,
                minifyCSS: true,
                minifyJS: true,
                removeComments: true,
                ignoreCustomComments: false,
                keepClosingSlash: true,
                ignoreCustomFragments: [/<%--[\s\S]*?--%>/, /<%@[\s\S]*?%>/, /\$\{[\s\S]*?\}/, /<fmt:[\s\S]+?\/>/, /<c:[\s\S]+?\/?>/, /<\/c:[\s\S]+?>/, /\{\{[\s\S]*?\}\}/]
            }))
            .pipe(gulp.dest("temp/online-java-user-demo-starter"))
            .on('end', function () {
                cb();
            });
});
gulp.task('generate-online-static-demo-zip', function (cb) {
    return gulp.src(['temp/online-static-demo/**/*'], {dot: true})
            .pipe(chmod(0o644, true))
            .pipe(zip('JavaTMP-Static-Ajax.zip'))
            .pipe(gulp.dest('dist'))
            .on('end', function () {
                cb();
            });
});
gulp.task('generate-online-java-user-demo-starter-war', function (cb) {
    return gulp.src(['temp/online-java-user-demo-starter/**/*'], {dot: true})
            .pipe(chmod(0o644, true))
            .pipe(zip('JavaTMP-User-Starter.war'))
            .pipe(gulp.dest('dist'))
            .on('end', function () {
                cb();
            });
});
gulp.task('remove-online-static-demos-folders', function (cb) {
    del.sync([
        'temp/online-static-demo',
        'temp/online-java-user-demo-starter',
        'temp/JavaTMP-User-Starter/build',
        'temp/JavaTMP-User-Starter/dist'
    ], cb());
});
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
                args: '-m \"' + pkg.version + '"',
                disableMessageRequirement: true
            }, cb));
});
gulp.task('save-projects',
        gulp.series(
                "clean",
                'copy-JavaTMP-Static-Ajax',
                'copy-JavaTMP-User-Starter',
                'save-project-online-static-demo',
                'save-project-online-java-user-demo-starter',
                'process-javatmp-static-ajax',
                'process-javatmp-user-starter',
                'remove-demo-assets-src',
                'process-online-static-demo',
                'process-online-java-user-demo-starter',
                'generate-online-static-demo-zip',
                'generate-online-java-user-demo-starter-war',
                'remove-online-static-demos-folders',
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
gulp.task('default', gulp.series('save-projects', function (cb) {
    console.log("*** Zip files in dist should be created ***");
    console.log("Current Version Number [" + pkg.version + "]");
    console.log("Now we commit and push current changes :");
    cb();
}));

gulp.task('generate-docs', function (cb) {
    del.sync(['./temp/docs/**/*']);
    gulp.src('./docs/**/*')
            .pipe(markdown({}))
            .pipe(rename(function (path) {
//                path.dirname += "/ciao";
//                path.basename += "-goodbye";
                path.extname = "";
            }))
            .pipe(gulp.dest('./temp/docs')).on('end', cb);
});

gulp.task('run', gulp.series('generate-docs', function () {
    connect.server({
//        root: '',
        port: 8888,
        livereload: true
    });
}));
