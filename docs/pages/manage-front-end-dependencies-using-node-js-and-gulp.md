---
title: Manage Front-end dependencies Using Node.js And Gulp
---
# {{ page.title }}
We manage all front-end plugins and framework dependencies like jQuery, Bootstrap using Node NPM and gulp tools.
npm is the package manager for the Node JavaScript platform. It puts modules in place so that node can find them,
and manages dependency conflicts intelligently. It is extremely configurable to support a wide variety of use cases.
Most commonly, it is used to publish, discover, install, and develop node programs and
`Gulp` is a toolkit for automating painful or time-consuming tasks in your development workflow. We use gulp to automate
our building process like generating JS/CSS.  

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
NPM loads jquery into your local node\_modules folder, and stores relevant metadata to package.json.
We Repeated this for all of the dependencies that are available on NPM and we ended up with something like:
```
...
  "dependencies": {
    "bootstrap": "^4.3.1",
    "jquery": "^3.3.1",
    "popper.js": "^1.14.3",
    ...
  },
  ...
```

### Fix Issues for non node.js NPM package modules
There were mainly Three issues raised using above method:
1.  Not all our front-end libraries were node packages. Some of our front-end libraries exist in github repositories
    but were not registered in NPM repository.
2.  We need complete github repositories for some libraries, not just what their authors published in NPM repository.
3.  Not all front-end libraries resources are production ready. Some of them are still raw text and need a minification and cleaning.

For those issues we used a npm's package called `napa` which is a helper for installing repositories without a package.json with `npm`

[napa NPM's package link](https://www.npmjs.com/package/napa "napa npm package") and
[napa npm's github.com repository](https://github.com/shama/napa "napa npm package github.com repository")

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

1. Using new napa entry in package.json file to hold repositories:
```
{
  ...
  "napa": {
    "blockui": "git+https://github.com/malsup/blockui.git",
    "scrollup": "git+https://github.com/markgoodyear/scrollup.git",
    ...
  }
}
```
2. Adding scripts entries in package.json file to let `napa` run when we invoke `npm install`,`npm update`, and `npm run napa` commands: 
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
3. Adding custom napa's `napa-config` configuration options entry, mainly to disable repositories caching:
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

Now, whenever we invoke `npm install` command, all our front-end dependencies will be downloaded and installed
in local `./node_modules` folder by `node.js` and `napa` tools.
The following is our complete package.json file updated with all dependencies, devDependencies, and napa entries:
```
{
  "name": "JavaTMP-Static-Ajax",
  "version": "0.0.4",
  "private": true,
  "description": "JavaTMP Bootstrap Admin And Dashboard Template",
  "keywords": [
    "jquery",
    "bootstrap",
    "admin",
    "template",
    "dashboard"
  ],
  "author": "javatmp",
  "licenses": "JavaTMP License",
  "contributors": [],
  "dependencies": {
    ...
  },
  "devDependencies": {
    ...
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
    ...
  }
}
```

### Moving Required libraries Files to our web application folders
We can now reference the dependencies straight from `./node_modules` folder.
but our node_modules folder is outside context root folder `./web` and normally it is not a good idea to make
node_modules folder inside your context root folder, indeed not all files and directories are needed in node_modules folder.
The following is a high level web folder structures of our template web application:
```
web (Web Application Context Root Folder)
    |---index.html (Main HTML Page references Front-end Libraries from components folder)
    +---assets (Specific Template JS,CSS,fonts, and images folders and files)
    +---components (Temporary destination for our Front-end resources Folders)
    \---pages (HTML Pages reference Front-end Libraries from assets folder)
```
So we need a simple process that chooses and moves required and needed plugins and frameworks from `./node_modules`
to `./web/components` folders and processes them if they need any minification or cleaning before move them. 

We used Gulp to automate our building process. So, we created a simple gulp task that implements our requirements above by first
creating an object that hold need libraries. kindly go to `gulpfile.js` file for more information.
the following object hold our required libraries:
```
var config = {
    "sourceNodeLib": "./node_modules",
    "destComponentsLib": "./web/components",
    "destDist": "./web/assets/dist",
    "plugins": {
        "jquery": [
            {"from": "${sourceNodeLib}/jquery/dist/jquery.min.js", "to": "${destComponentsLib}/jquery/dist"}
        ],
        "popper.js": [
            {"from": "${sourceNodeLib}/popper.js/dist/umd/popper.min.js", "to": "${destComponentsLib}/popper.js/dist/umd"}
        ],
        "bootstrap": [
            {"from": "${sourceNodeLib}/bootstrap/dist/css/bootstrap.min.css", "to": "${destComponentsLib}/bootstrap/dist/css"},
            {"from": "${sourceNodeLib}/bootstrap/dist/js/bootstrap.min.js", "to": "${destComponentsLib}/bootstrap/dist/js"}
        ],
        ...
    }
};
```

Actually it is not a standard nor optimal, but give us need functionality and flexibility to select only wanted file
and decide what we could do with them before moving or merging them . Kindly refer to gulp's task called `copy-components`
that use the above configuration to copy folders and files and processes them from `./node_modules` to `./web/components`
as defined in the above config object:
```
...
gulp.task('copy-components', ["delete-components"], function () {
    // copy all above resources and process them from ./node_modules to ./web/components
});
```
We used `gulp-if` plugins to check if the resource need any preprocessing. So if it is a Javascript file we apply `gulp-uglify` plugin
on the resource and if it is CSS file we apply `gulp-clean-css` plugin on the resource before move them.

We can simply add another gulp's task called `generate-dist` that will compile all SASS themes files and moved all resources
to `./web/assets/dist` folder.

## Gulp's Task `generate-dist`
The gulp's task `generate-dist` depends on task `copy-components` described in details above.

The gulp's task `generate-dist` also depends on `src` object that define needed resources and plugins to be combined together,
kindly refer to `src` object in gulpfile.js for more information about it.

The Gulp's task `generate-dist` task makes the following things:
1.  Compile the SASS Bootstrap themes found in `./web/assets/src/sass/themes/javatmp-*.scss` and generate base template CSS file and move them to `./web/assets/dist/css` folder
2.  Concatenate all CSS files found in above `src.css` in order and put the concatenated file in `./web/assets/dist/css/javatmp-plugins-all.min.css`
3.  Concatenate all CSS files found in above `src.cssForPrint` in order and put the concatenated file in `./web/assets/dist/css/javatmp-plugins-print-all.min.css`
4.  Generate and uglify main JavaTMP template Javascript file `javatmp.min.js` in `./web/assets/src/js-src/javatmp.js` to `./web/assets/dist/js/javatmp.min.js`
5.  Concatenate all JS files found in above `src.js` in order and put the concatenated file `./web/assets/dist/js/javatmp-plugins-all.min.js`
6.  Compile and generate a minification version of `src.fontFamilyFiles` and put the css file in `./web/assets/dist/css`, in above case `./web/assets/dist/css/font-family-en.min.css`
7.  Copy `src.img` files needed by plugins to `./web/assets/dist/img` folder
8.  Copy binary fonts files needed by plugins and template from `src.fonts` to `./web/assets/dist/fonts folder`
9.  finally, remove `./web/components` folder as all front-end resources became combined and concatenated in TWO BIG LARGE MAIN files `javatmp-plugins-all.min.css` and `javatmp-plugins-all.min.js`

So, The main output of `generate-dist` task is folder `./web/assets/dist` which contains the following:
```
./web/assets/dist
+---css
    +---font-family-en.min.css
    +---javatmp-plugins-all.min.css
    +---javatmp-plugins-print-all.min.css
    +---javatmp-*.min.css (For each SASS theme files like javatmp-default.min.css)
    +---javatmp-*-rtl.min.css (For each SASS theme files like javatmp-default-rtl.min.css)
+---fonts
    +---context-menu-icons.eot
    +---fa-brands-400.eot
    +---open-sans-v15-latin-300.eot
    +---slick.eot
    +---summernote.eot
    +---...
+---img
    +---ajax-loader.gif
    +---mCSB_buttons.png
+---js
    +---javatmp-plugins-all-locale-*.min.js (For each Locale key defines `src.localeJS` object like `src.localeJS.en`)
    +---javatmp-plugins-all.min.js
    +---javatmp.min.js
```
