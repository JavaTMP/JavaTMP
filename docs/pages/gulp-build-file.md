---
title: Gulp Build file
---
# Gulp Build file
To automate and enhance our development process we use Gulp tool to automate and run a predefine tasks, like plugins update, sass compiling. We Installed Gulp globally with npm.

Please Refer to [Setting Up Development Environment](/pages/setting-up-development-environment) Page to read more about installing `gulp` and generating `gulpfile.js`.

The JavaTMP's main gulp file `./gulpfile.js` is located in root directory of the template and it contains the following tasks:

Please review `./gulpfile.js` and `./package.json` files for more information about gulp plugins and tasks used in the project.

Please Refer to [Development tools](/pages/development-and-environment-tools) Page to read more about `Gulp` plugins used in `gulpfile.js`.

`delete-components` and `copy-components`
-----------------------------------------

 We manage front-end dependencies like jQuery, Bootstrap, using Node.js NPM and Gulp tools.

So invoking `gulp delete-components` command will remove folder `./web/components` with all its sub-folders and files. 

And invoking `gulp copy-components` command will copy all needed plugins and frameworks from `./node_modules` folder to `./web/components` folder based in configuration data found in `gulpfile.js` file. 

We created a separate page to describe in details the [process of managing front-end dependencies using Node NPM and gulp](/pages/manage-front-end-dependencies-using-node-js-and-gulp "Manage Front-end Dependencies Using Node NPM and Gulp tools"). kindly read it [here](/pages/manage-front-end-dependencies-using-node-js-and-gulp "Manage Front-end Dependencies Using Node NPM and Gulp tools") for more information.

run-local-web-server
--------------------

We use `run-local-web-server` task to run a local web server for static JavaTMP version.

The following code is the definition of `run-local-web-server` task:
```javascript
gulp.task('run-local-web-server', function () {
    connect.server({
        root: 'web',
        port: 8888,
        livereload: true
    });
});
```
You can run the gulp's task using the following command line:
```
gulp run-local-web-server
```
delete-css
----------

We use `delete-css` task to delete css folder with all its files before we regenerate them from compiling SASS files.

This task is not intended to run manually. it is called using one of the below tasks.

The following code is the definition of `delete-css` task:
```javascript
gulp.task('delete-css', function () {
    return del(['./web/assets/css/**/*']);
});
```
You can run the gulp's task using the following command line:
```
gulp delete-css
```
main-sass, plugins-sass, pages-sass, sass
-----------------------------------------

We use these tasks to generate a minify css files from sass's scss files:

The following code is the definition of these tasks:
```javascript
gulp.task('main-sass', ["delete-css"], function () {
    return gulp.src(['./web/assets/src/sass/main.scss'])
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
    return gulp.src(['./web/assets/src/sass/plugins/**/*.scss'])
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
    return gulp.src(['./web/assets/src/sass/pages/**/*.scss'])
            .pipe(sass().on('error', sass.logError))
            .pipe(autoprefixer({
                browsers: ['last 2 versions'],
                cascade: false
            }))
            .pipe(cleanCSS())
            .pipe(rename({suffix: '.min'}))
            .pipe(gulp.dest('./web/assets/css/pages/'));
});
```
You can run the gulp's task using the following command line:

gulp sass

Note that if you want to generate normal css files instead of minify ones, then you can update the above script and remove `cleanCSS` pipe step.

Note that we don't combine and merge CSS files to simplify the theme and make it simple to customize.

delete-js
---------

We use `delete-js` task to delete js folder with all its Javascript files before we regenerate them from compiling Javascript files reside in `./web/assets/src/js-src/`.

This task is not intended to run manually. it is called using one of the below tasks.

The following code is the definition of `delete-js` task:
```javascript
gulp.task('delete-js', function () {
    return del(['./web/assets/js/**/*']);
});
```
You can run the gulp's task using the following command line:
```
gulp delete-js
```
compress-js
-----------

We use `compress-js` task to reduce and uglify JavaTMP's javascript files.

The following code is the definition of `compress-js` task:
```javascript
gulp.task('compress-js', ["delete-js"], function (cb) {
    pump([
        gulp.src('./web/assets/src/js-src/**/*'),
        eslint(),
        eslint.format(),
        uglify(),
        rename({suffix: '.min'}),
        gulp.dest('./web/assets/js/')
    ], cb);
});
```
You can run the gulp's task using the following command line:

gulp compress-js

watch-sass-and-js
-----------------

We use `watch-sass-and-js` task to watch the source scss and js files for any changes and run corresponding tasks accordingly.

The following code is the definition of `watch-sass-and-js` task:
```javascript
gulp.task('watch-sass-and-js', ["delete-css", "delete-js", "sass", "compress-js"], function () {
    console.log("watching scss & js files changing");
    gulp.watch('./web/assets/src/sass/**/\*.scss', ['sass']);
    gulp.watch('./web/assets/src/js-src/**/\*', ['compress-js']);
});
```
You can run the gulp's task using the following command line:
```
gulp watch-sass-and-js
```
default
-------

We use `default` task to run `watch-sass-and-js` through out our development.

The following code is the definition of `default` task:
```javascript
gulp.task('default', ['watch-sass-and-js'], function () {
    process.stdout.write("*** Finished @ [" + new Date() + "] ***");
});
```
You can run the default gulp's task using the following command line:

gulp

