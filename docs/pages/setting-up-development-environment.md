---
title: Setting Up Development Environment
---
# Setting Up Development Environment
Doing things manually is fine once but if you can automate things it’s better. With little tools you can speed up development and reduce recursive mundane tasks such as starting a project or setting up boilerplate code. We will show you how to set up and test a development environment on Windows. don't forget to take a backup of any folder or file before changing anythings.

### Install Git
Some Node package need Git SCM to work so first install Git if you don’t have it. Go to their official site and [download a git client version](https://git-scm.com/downloads), Or choose whatever fork you'd like like [Git for Windows](https://git-for-windows.github.io/).

### Install Node.js
Gulp depend on [Node.js](https://nodejs.org/en/) and NPM so you need to get Node.js. Just download the installation package from Node.js site and click through it.

#### create a package.json file
To create `package.json` file, you can run `npm init` command and go through its options or manually create the file based on [node official site package.json rules](https://docs.npmjs.com/files/package.json).

Using `npm init` command to create the `package.json` will prompt you for values for the `package.json` fields. The two required fields are name and version. You'll also want to have a value for main. You can use the default, index.js.

Here's a simple `package.json`:
```
{
  "name": "application name",
  "version": "1.0.0",
  "description": "your application description",
  "main": "index.js",
  "scripts": {
    "test": "echo \\"Error: no test specified\\" && exit 1",
  },
  "author": "You",
  "license": "",
  "dependencies": {},
  "devDependencies": {}
}
```
Please go to our `package.json` file in the JavaTMP root directory to get more information about our dependencies and tools.

### Install Gulp
To automate and enhance your development you can use Gulp to automate and run a predefine tasks. We Installed Gulp globally with npm:
```
npm install --global gulp
```
Install Gulp also in your project devDependencies (`package.json`'s devDependencies):
```
npm install --save-dev gulp
```

#### Create `gulpfile.js`
we need to create the `gulpfile.js` which defines our tasks we want to perform. Then, add the following to your gulpfile.js:
```
var gulp = require('gulp');

gulp.task('Generic\_Task', function () {
    process.stdout.write("\*\*\* Start Generic Task @ \[" + new Date() + "\] \*\*\*")
});

gulp.task('default', \['Generic\_Task'\], function () {
    process.stdout.write("\*\*\* Finished @ \[" + new Date() + "\] \*\*\*")
});
```
The default task runs nothing but print the date and time. You can run this `gulpfile.js` through the following `gulp` command:
```
gulp
```
Please review `./gulpfile.js` and `./package.json` for more information about gulp plugins and tasks used in the project.