---
title: JavaTMP NPM's package.json file
---
# JavaTMP NPM's package.json file
The `package.json` file is normally located at the root directory of a Node.js project. This file holds various metadata relevant to the project. This file is used to give information to npm that allows it to handle the project's dependencies. It can also contain other metadata such as a project description, the version of the project in a particular distribution, license information, even configuration data - all of which can be vital to the end users of the project. 

A `package.json` file:

*   lists the packages that your project depends on through dependencies, devDependencies, and napa sections.
*   allows you to specify the versions of a package that your project can use using semantic versioning rules.
*   makes your build reproducible, and therefore much easier to share with other developers.

Please Refer to [Setting Up Development Environment](/pages/setting-up-development-environment) Page to read more about installing `Node` and generating `package.json` file.

Please review `./package.json` file for more information about gulp plugins and front-end plugins and frameworks used in the project.

Please Refer to [Development tools](/pages/development-and-environment-tools) Page to read more about `Node.js` plugins used in `package.json`.

The JavaTMP's main NPM file ./package.json is located in root directory of the template and it contains the following scripts:

`npm install`
-------------

Invoking `npm install` command will download all modules found in `devDependencies` and `dependencies` and save theme locally in node\_module folder, then it will run `napa` plugin which will fetch all github repositories found in napa section of package.json file and save them in local `node_moudle` folder.

`npm update`
------------

Invoking `npm update` command will update all modules found in `devDependencies` and `dependencies`, then it will run `napa` plugin which will fetch all github repositories found in napa section of package.json file and save them in local `node_moudle` folder.

`npm run napa`
--------------

Invoking `npm run napa` command will ONLY run `napa` plugin which will fetch all github repositories found in napa section of package.json file and save them in local `node_moudle` folder.
