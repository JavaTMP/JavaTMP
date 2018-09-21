---
title: Gulp Build file
---
# Gulp Build file
To automate and enhance our development process we use Gulp tool to automate and run a predefine tasks, like plugins update, sass compiling. We Installed Gulp globally with npm.

Please Refer to [Setting Up Development Environment](/pages/setting-up-development-environment) Page to read more about installing `gulp` and generating `gulpfile.js`.

The JavaTMP's main gulp file `./gulpfile.js` is located in root directory of the template and it contains the following tasks:

Please review `./gulpfile.js` and `./package.json` files for more information about gulp plugins and tasks used in the project.

Please Refer to [Development tools](/pages/development-and-environment-tools) Page to read more about `Gulp` plugins used in `gulpfile.js`.

## `delete-components` and `copy-components`
We manage front-end dependencies like jQuery, Bootstrap, using Node.js NPM and Gulp tools.

So invoking `gulp delete-components` command will remove folder `./web/components` with all its sub-folders and files. 

And invoking `gulp copy-components` command will copy all needed plugins and frameworks from `./node_modules` folder to `./web/components` folder based in configuration data found in `gulpfile.js` file. 

We created a separate page to describe in details the [process of managing front-end dependencies using Node NPM and gulp](/pages/manage-front-end-dependencies-using-node-js-and-gulp "Manage Front-end Dependencies Using Node NPM and Gulp tools"). kindly read it [here](/pages/manage-front-end-dependencies-using-node-js-and-gulp "Manage Front-end Dependencies Using Node NPM and Gulp tools") for more information.

## run-local-web-server
We use `run-local-web-server` task to run a local web server for static JavaTMP version on port 8888. You can run
this gulp's task using the following command line:
```
gulp run-local-web-server
```

## delete-css
We use `delete-css` task to delete css folder with all its files before we regenerate them from compiling SASS files.

This task is not intended to run manually. it is called using one of the below tasks. You can run the gulp's task using
the following command line:
```
gulp delete-css
```

## generate-dist
We use this task to generate the main front end resources JS/CSS files and folders.
You can run the gulp's task using the following command line:
```
gulp sass
```

Note that if you want to generate normal css files instead of minify ones, then you can update the above script
and remove `cleanCSS` pipe step.

## delete-js
We use `delete-js` task to delete js folder with all its Javascript files before we regenerate them from
compiling Javascript files reside in `./web/assets/src/js-src/`. This task is not intended to run manually and
it is called using one of the below `generate-dist` task. You could run the gulp's task using the following command line:
```
gulp delete-js
```

## watch-sass-and-js
We use `watch-sass-and-js` task to watch the source scss and js files for any changes and run corresponding tasks accordingly.
You can run the gulp's task using the following command line:
```
gulp watch-sass-and-js
```

## default
We use `default` task to run `generate-dist` through out our development.
You can run the default gulp's task using the following command line:
```
gulp
```
