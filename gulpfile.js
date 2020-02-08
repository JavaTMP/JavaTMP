'use strict';

var cp = require("child_process");
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
    fs.writeFile('./package.json', JSON.stringify(pkg, null, 4), 'utf8', function (err) {
        if (err)
            throw err;
        var dynamicPkg = require('./JavaTMP-App-Starter/package.json');
        dynamicPkg.version = pkg.version;
        fs.writeFile('./JavaTMP-App-Starter/package.json', JSON.stringify(dynamicPkg, null, 4), 'utf8', function (err) {
            if (err)
                throw err;
            pkg.version = "v" + pkg.version;
            console.log("Package Version updated [" + pkg.version + "]");
            cb();
        });
    });
});

gulp.task('clean', function (cb) {
//    del.sync(['./temp', './dist'], cb());
    return del(['./temp'], cb);
});

gulp.task('copy-JavaTMP-App-Starter', gulp.series('clean', function (cb) {
    return gulp
            .src([
                './JavaTMP-App-Starter/**/*',
                '!**/node_modules{,/**}',
                '!**/nbproject{,/**}',
                '!**/.settings{,/**}',
                '!**/logs{,/**}',
                '!**/package-lock.json',
                '!./JavaTMP-App-Starter/.project',
                '!./JavaTMP-App-Starter/.classpath',
                '!./JavaTMP-App-Starter/nbactions.xml',
                '!./JavaTMP-App-Starter/nb-configuration.xml',
                '!./JavaTMP-App-Starter/target{,/**}'
            ], {dot: true})
            .pipe(gulp.dest("temp/JavaTMP-App-Starter"))
            .on('end', function () {
                cb();
            });
}));

function callExec(command, args, cb) {
    const call = cp.exec(command, args);
    // stdout
    call.stdout.on('data', function (data) {
        // like console.log, but without the trailing newline
        process.stdout.write(data.toString());
    });
    // stderr
    call.stderr.on('data', function (data) {
        console.log(data.toString());
        cb(data.toString());
    });
    call.on('exit', function (code) {
        console.log('child process exited with code :');
        console.log(code);
        cb(code);
    });
}


gulp.task('save-project-online-java-app-demo-starter', gulp.series('copy-JavaTMP-App-Starter', function (cb) {
    return gulp
            .src([
                'temp/JavaTMP-App-Starter/**/*',
                "!temp/JavaTMP-App-Starter/web{,/**}",
                "!temp/JavaTMP-App-Starter/db_scripts{,/**}"
            ], {dot: true})
            .pipe(gulp.dest("temp/online-java-app-demo-starter"))
            .on('end', function () {
                cb();
            });
}));

gulp.task('process-javatmp-app-starter', gulp.series('save-project-online-java-app-demo-starter', function (cb) {
    return gulp
            .src(['temp/JavaTMP-App-Starter/**/*.html', 'temp/JavaTMP-App-Starter/**/*.jsp'], {dot: true})
            .pipe(processhtml())
            .pipe(gulp.dest("temp/JavaTMP-App-Starter"))
            .on('end', function () {
                cb();
            });
}));
gulp.task('remove-demo-assets-src', gulp.series('process-javatmp-app-starter', function (cb) {
    del.sync([
        'temp/online-java-app-demo-starter/assets/src'
    ], cb());
}));
gulp.task('process-online-static-demo', function (cb) {
    return gulp
            .src(['temp/online-static-demo/**/*.html'], {dot: true})
            .pipe(htmlmin({collapseWhitespace: true, minifyCSS: true, minifyJS: true, removeComments: true, ignoreCustomComments: false}))
            .pipe(gulp.dest("temp/online-static-demo"))
            .on('end', function () {
                cb();
            });
});
gulp.task('process-online-java-app-demo-starter', gulp.series('remove-demo-assets-src', function (cb) {
    return gulp
            .src(['temp/online-java-app-demo-starter/**/*.html', 'temp/online-java-app-demo-starter/**/*.jsp'], {dot: true})
            .pipe(htmlmin({collapseWhitespace: true,
                minifyCSS: true,
                minifyJS: true,
                removeComments: true,
                ignoreCustomComments: false,
                keepClosingSlash: true,
                ignoreCustomFragments: [/<%--[\s\S]*?--%>/, /<%@[\s\S]*?%>/, /\$\{[\s\S]*?\}/, /<fmt:[\s\S]+?\/>/, /<c:[\s\S]+?\/?>/, /<\/c:[\s\S]+?>/, /\{\{[\s\S]*?\}\}/]
            }))
            .pipe(gulp.dest("temp/online-java-app-demo-starter"))
            .on('end', function () {
                cb();
            });
}));

gulp.task('run-maven', gulp.series('process-online-java-app-demo-starter', function (cb) {
    // In gulp 4, you can return a child process to signal task completion
//    callExec('mvn clean package', {cwd: "./temp/online-java-app-demo-starter"}, cb);
    const mvn = require('maven').create({
        cwd: "./temp/online-java-app-demo-starter"
    });
    mvn.execute(['clean', 'package'], {'skipTests': false}).then(() => {
        // As mvn.execute(..) returns a promise, you can use this block to continue
        // your stuff, once the execution of the command has been finished successfully.
//        setTimeout(function () {
        cb();
//        }, 0);
    });
}));

gulp.task('generate-online-java-app-demo-starter-war', function (cb) {
    return gulp.src(['temp/online-java-app-demo-starter/**/*'], {dot: true})
            .pipe(chmod(0o644, true))
            .pipe(zip('JavaTMP-App-Starter.war'))
            .pipe(gulp.dest('dist'))
            .on('end', function () {
                cb();
            });
});
gulp.task('copy-online-java-app-demo-starter-war', gulp.series('run-maven', function (cb) {
    return gulp.src(['./temp/online-java-app-demo-starter/target/JavaTMP-App-Starter*.war'], {dot: true})
            .pipe(gulp.dest('./dist'))
            .on('end', function () {
                cb();
            });
}));
gulp.task('remove-online-static-demos-folders', function (cb) {
    del.sync([
        'temp/online-static-demo'
    ], cb());
});
gulp.task('remove-online-java-demos-folders', function (cb) {
    return del([
        'temp/online-java-app-demo-starter',
        'temp/JavaTMP-App-Starter/build',
        'temp/JavaTMP-App-Starter/dist'
    ], cb);
});
gulp.task('copy-readme', function (cb) {
    return gulp
            .src(['readme.md', 'LICENSE'])
            .pipe(gulp.dest('temp/'))
            .on('end', function () {
                cb();
            });
});
gulp.task('zip-java', function (cb) {
    return gulp
            .src(['temp/**/*'], {dot: true})
            .pipe(chmod(0o644, true))
            .pipe(zip('javatmp-java.zip'))
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
        "!./temp",
        "!./logs"
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
gulp.task('generate-java-project',
        gulp.series(
                'copy-online-java-app-demo-starter-war',
                'remove-online-java-demos-folders',
                'copy-readme',
                'zip-java',
                "clean",
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
gulp.task('push-only', gulp.series(function (cb) {
    return git.push('origin', 'master', {args: '--tags'}, function (err) {
        if (err)
            throw err;
        cb();
    });
}));
gulp.task('pre-release', function (cb) {
//    del.sync(['./temp', './dist'], cb());
    return del(['./dist/**/*'], cb);
});
gulp.task('release', gulp.series('pre-release', 'update-version', 'generate-java-project', 'push:tag', function (cb) {
    cb();
}));
//https://stackoverflow.com/questions/5343068/is-there-a-way-to-skip-password-typing-when-using-https-on-github
gulp.task('default', gulp.series('generate-java-project', function (cb) {
    console.log("*** Zip files in dist should be created ***");
    console.log("Current Version Number [" + pkg.version + "]");
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
gulp.task('run-doc', gulp.series('generate-docs', function () {

    connect.server({
        root: './temp/docs',
        port: 8888,
        livereload: true,
        middleware: function () {
            return [function (req, res, next) {
                    res.setHeader('Content-Type', 'text/html; charset=utf-8');
                    res.setHeader('Content-Disposition', 'inline');
                    next();
                }];
        }
    });
    gulp.watch('./docs/**/*', gulp.series('generate-docs', function (cb) {
        console.log("finished");
        connect.reload();
        cb();
    }));
}));

