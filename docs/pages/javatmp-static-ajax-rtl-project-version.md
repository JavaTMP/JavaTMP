---
title: JavaTMP-Static-Ajax-RTL Project Version
---
# JavaTMP-Static-Ajax-RTL Project Version

`./JavaTMP/JavaTMP-Static-Ajax-RTL` Folder
------------------------------------------

`JavaTMP-Static-Ajax-RTL` project is a mirror copy from above `JavaTMP-Static-Ajax` project with a little modifications to support RTL.
It consists of general static bootstrap RTL admin and dashboard components template.
Our [online RTL demo](http://demo.javatmp.com/JavaTMP-Static-Ajax-RTL/ "Java Bootstrap RTL Admin And Dashboard Components Template")
deploys and host this version of JavaTMP.

JavaTMP-Static-Ajax-RTL is a front-end static project that intended to provide demo pages for all plugins and frameworks used separately and in isolation level. it is a base for remaining versions like Java, starter and it is a [Netbeans IDE 8.2](https://netbeans.org/ "Netbeans IDE") project, so you can directly import and open it there.

`JavaTMP-Static-Ajax-RTL` project is not intended to start your custom project from. it is provided to let you test and see various RTL features and user interface components used in remaining projects.

### RTL Bootstrap Notes

We used the idea of overriding classes and rules on `JavaTMP-Static-Ajax` project to produce RTL version `JavaTMP-Static-Ajax-RTL` project. As you will see shortly we copied sass folder as is and provide another folder sass-rtl for overriding classes and tags and need a directional modification to support RTL.

We used [Bootstrap reverse Plugin](https://github.com/JavaTMP/bootstrap-reverse "Bootstrap 4 RTL plugin to support RTL template and skin theme") for overriding core bootstrap classes to support Right to Left directional behavior instead of left to right.

We copied and overrode from `./JavaTMP-Static-Ajax/web/assets/src/sass` only classes that need to be flipped to support RTL and put them in `JavaTMP-Static-Ajax/web/assets/src/sass-rtl`. So we should reference both of them for the same part to support RTL as we'll see later.

The `./JavaTMP-Static-Ajax-RTL/web/assets/src/sass/common/variables.scss` file still the central main variables file for LTR and RTL features.

The `main-rtl.scss` and its compiled version `main-rtl.min.css` file is the overriding for `main.scss` and should be referenced after `main.min.css`.

For demo pages, we merged RTL modification with default LTR version.

For plugins we modified and add RTL modifications to custom LTR SASS version for the plugin, because most Plugin RTL modification is a little and normally should be part of the plugin style itself. keep in mind that most plugins support RTL.

Custom plugin RTL style rules are separated in `./JavaTMP-Static-Ajax-RTL/web/assets/src/sass-rtl/plugins-rtl` for [Datatables plugin](https://datatables.net/ "Datatables Plugin") because Datatables plugin does not provide support for RTL pages so we overrode some of its rules and classes in these files:

*   custom-dataTables.bootstrap4-rtl.scss
*   custom-datatables.net-responsive-bs4-rtl.scss
*   custom-datatables.net-select-bs4-rtl.scss

The following is a high level folder structures of our JavaTMP-Static-Ajax-RTL web application with its description and usage:
```
./JavaTMP/JAVATMP-STATIC-AJAX-RTL
|---.gitignore
|---gulpfile.js
|---.eslintrc
|---package.json
+---node\_modules (Node.js's NPM local dependencies Folders)
+---nbproject (Netbeans IDE config folders and files)
+---web (Web Application Context Root Folder)
    |---index.html (Main HTML Page references Front-end Libraries from components folder)
    +---assets (Specific Template JS,CSS,fonts, and images folders and files)
    +---components (Destination Front-end Folders)
    +---pages (HTML Pages reference Front-end Libraries from components folder)
```
### `./JavaTMP/JavaTMP-Static-Ajax-RTL/.gitignore` file

We stored our templates in a private github repository so we add .gitignore file to exclude mainly `./node_modules` and `./nbproject/private/` folders from versioning. 

### `./JavaTMP/JavaTMP-Static-Ajax-RTL/.gulpfile.js` file

This is a gulp's configuration file. gulp is a toolkit for automating painful or time-consuming tasks in your development workflow. We use gulp to automate our building process like generating JS/CSS. 

### `./JavaTMP/JavaTMP-Static-Ajax-RTL/.eslintrc` file

ESLint plugin configuration file which contains directive and parameters to gulp-eslint gulp plugin. the following external links provide more information about the those configuration: [Configuring ESLint](https://eslint.org/docs/user-guide/configuring "Configuring ESLint"), [A sample .eslintrc file](https://gist.github.com/adrianhall/70d63d225e536b4563b2 "A sample .eslintrc file"), [A starter .eslintrc file](https://gist.github.com/cletusw/e01a85e399ab563b1236 "A starter .eslintrc file").

### `./JavaTMP/JavaTMP-Static-Ajax-RTL/package.json` file

A Node.js's NPM meta file. This file holds various metadata relevant to the project. This file is used to give information to npm that allows it to handle the project's dependencies. 

### `./JavaTMP/JavaTMP-Static-Ajax-RTL/node_modules` folder

This folder is automatically generated by NPM to store a local copy of dependency libraries needed in your project when you invoke the command `npm install`. NPM depends on `pakcage.json` file to know which plugins and libraries need to be installed in this folder.

### `./JavaTMP/JavaTMP-Static-Ajax-RTL/nbproject` folder

The `nbproject` folder contains all the netbeans metadata about our project. We include `./nbproject`, but not `./nbproject/private`. This folder is usually not required and If you were to check out our project using a different IDE, you would not require our `nbproject` directory. In other words: This directory is Netbeans IDE specific, not project specific.

### `./JavaTMP/JavaTMP-Static-Ajax-RTL/web` folder

It is a web application context root folder contains everything related to static behavior of the template like `Javascript`, `CSS`, `font`, `images`, and `HTML` files. The following is a high level folder structures of ./JavaTMP/JavaTMP-Static-Ajax-RTL/web folder with its description and usage:
```
./JavaTMP/JavaTMP-Static-Ajax-RTL/web
|---index.html (Main HTML RTL index Page references Front-end Libraries from components folder)
+---assets (Specific Template JS,CSS,fonts, and images folders and files)
    +---css (generated minification CSS files from source SASS files)
        +--- pages
        +--- plugins
        |--- main-rtl.min.css
        |--- main.min.css
    +---data (static json files used for ajax demos)
    +---fonts (fonts related files like open-sans)
    +---img (demo images and avatars used as a demo purposes)
    +---js (generated minification JS files from soruce JS files)
    +---src (source JS/SASS files)
        +---js-src (Source Javascript folder)
        +---sass (source SASS files exact copy of JavaTMP-Static-Ajax-RTL/web/assets/src/sass folder)
        +---sass-rtl (RTL overriding roles and classes for RTL support)
            +--- common
            +--- partials-rtl
            +--- plugins-rtl
            |--- main-rtl.scss
+---components (plugins and framework used in the template came from node\_moudle)
    +---bootstrap
    +---bootstrap-reverse (Bootstrap RTL port to override classes to support RTL)
    +---jquery
    +---font-awesome
    ...
+---pages (Modified RTL version of HTML snippets for template pages)
    |---home.html
    +---bootstrap
    +---chart
    +---custom-components
    +---custom-pages
    +---form
    +---gallery
    +---plugins
    +---table
    +---wizard
```
`./JavaTMP/javatmp-static-ajax-rtl.zip` file
--------------------------------------------

It is our RTL online demo version of JavaTMP-Static-Ajax-RTL project. we provide it without any modification and we were deploying our online demo at [http://demo.javatmp.com/JavaTMP-Static-Ajax-RTL/](http://demo.javatmp.com/JavaTMP-Static-Ajax-RTL/ "RTL Java Bootstrap Admin And Dashboard Components Template") from this file. We generated it using the following special gulp's tasks:
```javascript
gulp.src('./JavaTMP-Static-Ajax-RTL/web/\*\*/\*', {dot: true})
        .pipe(gulp.dest("./online-static-demo-rtl"));
del.sync(\['./online-static-demo-rtl/assets/src'\]);
gulp.src(\['./online-static-demo-rtl/\*\*/\*.html'\], {dot: true})
        .pipe(htmlmin({collapseWhitespace: true, minifyCSS: true, minifyJS: true, removeComments: true}))
        .pipe(gulp.dest("./online-static-demo-rtl"));
gulp.src(\['./online-static-demo-rtl/\*\*/\*'\], {dot: true})
        .pipe(chmod(0o644, true))
        .pipe(zip('javatmp-static-ajax-rtl.zip'))
        .pipe(gulp.dest('./'));
```