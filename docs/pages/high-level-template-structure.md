---
title: High Level Template Structure
---
# High Level Template Structure

Your purchased package contains separate folder for each template. The following is a high level folder structures
of purchased JavaTMP project package with its description and usage:

```
JavaTMP-html.zip (JavaTMP Static HTML Bootstrap Admin and Dashboard components template)
|---readme.md (read me file)
|---LICENSE (end-user license agreement (EULA) and copyright information file)
+---[JavaTMP-Static-Ajax](http://demo.javatmp.com/JavaTMP-Static-Ajax/
"Java Bootstrap Admin And Dashboard Components Template") (Static LTR/RTL Bootstrap Admin and Dashboard components template)
```

```
JavaTMP-java.zip (JavaTMP Dynamic Java Bootstrap Admin and Dashboard components template)
|---readme.md (read me file)
|---LICENSE (end-user license agreement (EULA) and copyright information file)
+---[JavaTMP-User-Starter](http://java.javatmp.com:8080/JavaTMP-User-Starter/
"Dynamic Java Bootstrap LTR/RTL multi languages User Management Web application Template") (Dynamic LTR/RTL multi languages Advanced Java Bootstrap User Management Web application version)
```

### `./JavaTMP/readme.md` file
readme.txt file thanks you for purchasing our template and provides you with a high level information about the template.

### `./JavaTMP/LICENSE` file
LICENSE file contains copyright information and end-user license agreement (EULA).

### `./JavaTMP-Static-Ajax` folder
Project `JavaTMP-Static-Ajax` Which consists of combined curated resources of
general static bootstrap LTR/RTL Admin and Dashboard components template.
Our [online demo](http://demo.javatmp.com/JavaTMP-Static-Ajax/
"Java Bootstrap Admin And Dashboard Components Template")
deployed and hosted from this folder.
For more information see ﻿[JavaTMP-Static-Ajax Project Version online documentation page](/pages/javatmp-static-ajax-project-version "﻿JavaTMP-Static-Ajax Project Version Documentation Page").

### `JavaTMP-User-Starter` folder
`JavaTMP-User-Starter` project is an advanced Dynamic Java Bootstrap LTR/RTL multi languages
User Management Web application Template derived from `JavaTMP-Static-Ajax` project
with support for data persistent using Mysql Database Management System through
java Persistent API and hibernate JPA implementation.
The [online Java User Management Web Application demo](http://java.javatmp.com:8080/JavaTMP-User-Starter/
"Dynamic Java Bootstrap LTR/RTL multi languages User Management Web application Template")
provide a running version of this project folder on tomcat 9.
For more information see ﻿[JavaTMP-User-Starter Project Version online documentation page](/pages/javatmp-user-starter-project-version
"﻿JavaTMP-User-Starter Project Version Documentation Page").

### Important Notes And Questions
#### What should I do BEFORE buying a JavaTMP Bootstrap Template ?
*   Know what your requirements are and have a clear idea of what you want in terms of design and the functionalities.
*   Go through your design requirements. Know what all functionalities you would need in your template and what plugins are better suited for serving those functionalities.
*   Go through our documentation and above live demos and see if it provides your desired requirements you are looking for and you have the experiences to customize it and make the changes you need.
*   For static version, make sure you have required experiences to develop and use our web development tools and frameworks like `jQuery`, `Bootstrap`, `Node`, `gulp.js`, and the thired-party jQuery or Bootstrap plugins.
*   For dynamic Java version, make sure you have required experiences to develop and use our backend web development tools and frameworks like `Java`, `Servlet`, `JSP`, `Tomcat`, and external third-party libraries.
*   Evaluate your choices based on the general criteria or factors of Bootstrap Admin and Dashboard templates like `Design`, `Code`, `Cost`, `Responsiveness`, `Customization`, `Security`, `Support`, `Documentation`, `Ratings and Reviews`, `Number of Downloads or Sales`.
*   We don't provide a return or refund policy. So, always feel free to ask questions or contact us.

#### What should I do AFTER buying a JavaTMP Bootstrap Template ?
*   Download the Compressed archive `.zip` file sent to you.
*   Backup The downloaded file in a safe location.
*   Extract Downloaded JavaTMP file using any unzip tools like winrar or winzip.
*   Check that your extracted JavaTMP folder structures is similar to above folder tree structure.
*   Make sure you already download and install `git`, `nodejs`, `gulpjs`.
*   You could check our online demos that exists as is with our google analytics script by deploying them in your local HTTP server.
*   Navigate to `./JavaTMP-Static-Ajax` using command line tool and run the command `npm install` and then `gulp run-local-web-server`. Open a browser on `http://localhost:8888` to check it. stop the local server. You could import the `JavaTMP-Static-Ajax` project directly from Netbeans IDE by `"Open Project..."` menu item.
*   Navigate to `./JavaTMP-User-Starter` using command line tool and run the command `npm install`.
*   Make sure you already download and install above web development tools and Java development tools like `Java`, `Tomcat`, `Ant`.
*   For `./JavaTMP-User-Starter` project it is better to import it on Netbeans IDE `"Open Project.."` menu item in File.
But you can run the following command to clean, compile, or dist project using `ant "-Dj2ee.server.home=C:\apache-tomcat-9.0.7" "-Dlibs.CopyLibs.classpath=C:\Program Files\NetBeans 8.2\java\ant\extra\org-netbeans-modules-java-j2seproject-copylibstask.jar" clean`,
    `ant "-Dj2ee.server.home=C:\apache-tomcat-9.0.7" "-Dlibs.CopyLibs.classpath=C:\Program Files\NetBeans 8.2\java\ant\extra\org-netbeans-modules-java-j2seproject-copylibstask.jar" compile` and
    `ant "-Dj2ee.server.home=C:\apache-tomcat-9.0.7" "-Dlibs.CopyLibs.classpath=C:\Program Files\NetBeans 8.2\java\ant\extra\org-netbeans-modules-java-j2seproject-copylibstask.jar" dist`.
*   Note that you could do all above command from Netbeans IDE after importing it.

## JavaTMP NPM's package.json file
The `package.json` file is normally located at the root directory of a Node.js project. This file holds various metadata relevant
to the project. This file is used to give information to npm that allows it to handle the project's dependencies.
It can also contain other metadata such as a project description, the version of the project in a particular distribution,
license information, even configuration data - all of which can be vital to the end users of the project. 

A `package.json` file:
*   lists the packages that your project depends on through dependencies, devDependencies, and napa sections.
*   allows you to specify the versions of a package that your project can use using semantic versioning rules.
*   makes your build reproducible, and therefore much easier to share with other developers.

Please Refer to [Setting Up Development Environment](/pages/setting-up-development-environment) Page to read more about installing
`Node` and generating `package.json` file.

Please review `./package.json` file for more information about gulp plugins and front-end plugins and frameworks used in the project.

Please Refer to [Development tools](/pages/reference/development-and-environment-tools) Page to read more about `Node.js` plugins
used in `package.json`.

The JavaTMP's main NPM file ./package.json is located in root directory of the template and it contains the following scripts:

### `npm install`
Invoking `npm install` command will download all modules found in `devDependencies` and `dependencies` and save theme
locally in node_module folder, then it will run `napa` plugin which will fetch all github repositories found
in napa section of package.json file and save them in local `node_moudle` folder.

### `npm update`
Invoking `npm update` command will update all modules found in `devDependencies` and `dependencies`, then it will run `napa` plugin
which will fetch all github repositories found in napa section of package.json file and save them in local `node_moudle` folder.

### `npm run napa`
Invoking `npm run napa` command will ONLY run `napa` plugin which will fetch all github repositories found in napa section of
package.json file and save them in local `node_moudle` folder.

## Gulp Build file
To automate and enhance our development process we use Gulp tool to automate and run a predefine tasks, like plugins update,
sass compiling. We Installed Gulp globally with npm.

Please Refer to [Setting Up Development Environment](/pages/setting-up-development-environment) Page to read more about
installing `gulp` and generating `gulpfile.js`.

The JavaTMP's main gulp file `./gulpfile.js` is located in root directory of the template and it contains the following tasks:

Please review `./gulpfile.js` and `./package.json` files for more information about gulp plugins and tasks used in the project.

Please Refer to [Development tools](/pages/reference/development-and-environment-tools) Page to read more about `Gulp` plugins used in
`gulpfile.js`.

### `delete-components` and `copy-components`
We manage front-end dependencies like jQuery, Bootstrap, using Node.js NPM and Gulp tools.

So invoking `gulp delete-components` command will remove folder `./web/components` with all its sub-folders and files. 

And invoking `gulp copy-components` command will copy all needed plugins and frameworks
from `./node_modules` folder to `./web/components` folder based in configuration data found in `gulpfile.js` file. 

We created a separate page to describe in details the
[process of managing front-end dependencies using Node NPM and gulp](/pages/manage-front-end-dependencies-using-node-js-and-gulp).
kindly read it for more information.

### run-local-web-server
We use `run-local-web-server` task to run a local web server for static JavaTMP version on port 8888. You can run
this gulp's task using the following command line:
```
gulp run-local-web-server
```

### delete-css
We use `delete-css` task to delete css folder with all its files before we regenerate them from compiling SASS files.

This task is not intended to run manually. it is called using one of the below tasks. You can run the gulp's task using
the following command line:
```
gulp delete-css
```

### generate-dist
We use this task to generate the main front end resources JS/CSS files and folders.
You can run the gulp's task using the following command line:
```
gulp sass
```

Note that if you want to generate normal css files instead of minify ones, then you can update the above script
and remove `cleanCSS` pipe step.

### delete-js
We use `delete-js` task to delete js folder with all its Javascript files before we regenerate them from
compiling Javascript files reside in `./web/assets/src/js-src/`. This task is not intended to run manually and
it is called using one of the below `generate-dist` task. You could run the gulp's task using the following command line:
```
gulp delete-js
```

### watch-sass-and-js
We use `watch-sass-and-js` task to watch the source scss and js files for any changes and run corresponding tasks accordingly.
You can run the gulp's task using the following command line:
```
gulp watch-sass-and-js
```

### default
We use `default` task to run `generate-dist` through out our development.
You can run the default gulp's task using the following command line:
```
gulp
```

## JavaTMP HTML Files
The HTML files for template consist of main html files like `./web/index.html`, `./web/index-rtl.html` files
and all HTML files located in `./web/pages` folder which most of them are AJAX HTML snippets which called
from `./web/index.html` file sidebar section and `javatmp.js` Javascript file using jquery AJAX. 
The following is a high level folder structures of JavaTMP HTML `./web` regarding HTML files,
kindly see our [online demo](http://demo.javatmp.com/JavaTMP-Static-Ajax/) sidebar links for complete list of folders and links:
```
./web
|---index.html
|---index-rtl.html
+---assets
+---pages
    |---home.html
    +---bootstrap
    +---chart
    +---custom-components
    +---custom-pages
        |---404-page.html
        +---empty-pages
            |---blank-page.html
            |---card-page.html
            |---empty-page.html
            |---event-page.html
        +---inbox
        +---login-pages
    +---form
    +---gallery
    +---plugins
    +---table
    +---wizard
```
There are three types of HTML files exist in above folder.

1.  `index.html` which consists of the main html file used for initializing Javascript
    and providing main layout structure of the template like navbar, sidebar and use AJAX to load other html snippet files.
2.  HTML snippet files which consist of HTML code used as an AJAX content to be injected in the index.html file.
    like most of other pages, for example `./web/pages/custom-pages/empty-pages/card-page.html` page.
    Kindly refer to `./web/pages/custom-pages/empty-pages/empty-page.html` page to see the minimum required html code needed
    to create an AJAx snippet content. the following link is an
    [online demo of empty-page.html](http://demo.javatmp.com/JavaTMP-Static-Ajax/#pages/custom-pages/empty-pages/empty-page.html).
3.  Separate HTML pages consist of complete code to show specific scenarios or features like `404-page.html`
    or `default-login-page.html`. they open in new browser tab and sometimes they depends on external front-end resources.

Please see our [online demo](http://demo.javatmp.com/JavaTMP-Static-Ajax/) for those types of pages.

## JavaTMP Front-end Frameworks And Plugins Files
The JavaTMP Front-end frameworks and plugins consist of the libraries used in the front-end part of the template like jQuery,
Bootstrap and it is first stored separately in `./web/components` folder with all its Javascript, CSS, and images files.
Before it is moved and merged to appropriate files in `./web/assets/dist` using gulp's task `generate-dist`.
Then, it deleted when gulp's task `generate-dist` finishes running.

Keep in mind that these plugins and frameworks are different than the custom JS/CSS files specifically used in the template,
which are stored in `./web/assets/src/` folder and moved and merged to `./web/assets/dist` too using same gulp's task.

We manage our front-end dependencies using Node NPM and gulp so the folder `./web/components`
are dynamically generated when we run the gulp's task `copy-components`.
Read more about our
[managing front-end dependencies using Node.js And Gulp](/pages/manage-front-end-dependencies-using-node-js-and-gulp).

Please see the complete list of front-end jquery and bootstrap libraries we used in our template in the following page:
[JavaTMP Front-end Plugins And Frameworks](/pages/reference/javatmp-front-end-plugins-and-frameworks).

## Front-end Resources Customization
You should read first : [Setting Up Development Environment](/pages/setting-up-development-environment) .

After we downloaded front-end plugins using Node's `npm` command , We remove many plugins unneeded files and kept only needed
files like dist folder and images, and merge them to be included in 'javatmp-plugins-all.min.js' when gulp's task 'generate-dist' run.

So it is your responsibilities to decide which plugins you need and if you want to merge them in one large js or css files.

we provide a separate CSS customization file for each plugin, so it is simple to change and understand.

You should include custom CSS file after each plugin's main css file. for this reason we include the
plugins customizations CSS style after main plugin CSS files. like this:
```
<link href="assets/dist/css/javatmp-plugins-all.min.css" rel="stylesheet" type="text/css"/>
<link href="assets/dist/css/javatmp-default.min.css" rel="stylesheet" type="text/css"/>
```

### Custom Plugins CSS
All plugins in JavaTMP template projects are located in the `./node_modules` and `./web/components` folder and
their custom SASS files are located in `./web/assets/src/sass|-rtl/plugins` folder. The compiled CSS files are generated
in gulp's task `generate-dist`.

Kindly see the source code of gulp's task `generate-dist` for more information about this process.
and folder `./web/assets/src/sass/plugins` and `./web/assets/src/sass-rtl/plugins`
for more information about the plugins that we customized to adapt default or custom bootstrap themes and skins.

## Plugins in Projects
After we downloaded front-end plugins using Node's `npm` command , We copied only needed files like dist folder and images
as defined in `config.plugins` in gulp's task `copy-components` from `./node_modules` to `./web/components`
and then we merge them as defined `src.css`/`src.js` keys in gulp's task `generate-dist`.
So it is your responsibilities to decide which plugins you need and if you want to merge them in one large js or css files.

We provide a CSS customization for some of the plugins styling to apply our themes to them in a form of SASS' SCSS syntax.
Those custom CSS files reside separately in `./web/assets/src/sass/plugins` or `./web/assets/src/sass-rtl/plugins` folders.
And they compile and merge with bootstrap and JavaTMP styling and moved to `./web/assets/dist/css/javatmp-*.min.css`.

## JavaTMP CSS/SASS Template Files
The main minificated CSS files for JavaTMP template are located in the `./web/assets/dist/css` folder,
And it is automatically generated and populated during running of gulp's task `generate-dist` from:
- Template SASS source theme files reside in `./web/assets/src/sass/themes/javatmp-*.scss` folder.
- RTL Template SASS source theme files reisde in `./web/assets/src/sass-rtl/themes/javatmp-*.scss` folder.
- Merged plugins original CSS files reside in `src.css` array of files.
- Merged plugins original Print CSS files reside in `src.cssForPrint` array of files.
- Font family CSS file for each language key defined in `src.fontFamilyFiles`.

The following file structure provide the output CSS file from gulp's task 'generate-dist':
```
./web/assets/dist/css
+---font-family-en.min.css
+---javatmp-plugins-all.min.css
+---javatmp-plugins-print-all.min.css
+---javatmp-*.min.css (For each SASS theme files reside in ./web/assets/src/sass/themes/ like javatmp-default.min.css)
+---javatmp-*-rtl.min.css (For each SASS theme files reside in ./web/assets/src/sass-rtl/themes/ like javatmp-default-rtl.min.css)
```

We keep sass folder in the main assets of the template to simplify development and make any changes on the CSS happen
through SASS files, and when generating production version of the template we remove `./web/assets/src` folder. 
The most important SASS files in `./web/assets/src/sass|sass-rtl` are:
- `./web/assets/src/sass/common/variables.scss`.
- `./web/assets/src/sass/main.scss`.
- `./web/assets/src/sass-rtl/main-rtl.scss`

If you want to see the compiled CSS files for all SASS files without minification,
then simply comments `.pipe(cleanCSS())` line from corresponding gulp's task `generate-dist`.

Also, we include the required part of the `./node_modules/bootstrap/scss/bootstrap.scss` file
in `common/variables.scss` file to use its variables and function
and include the complete `./node_modules/bootstrap/scss/bootstrap.scss` file again in `main.scss` file
instead of remaining optional part only.

## JavaTMP Javascript Files
The main JavaTMP Javascript files are located in the `./web/assets/dist/js`
and generated from the gulp's task 'generate-dist` from these locations:
- From `./web/assets/src/js-src` after compile and minificate to `javatmp.min.js`.
- From `src.js` array for each plugin js file after merging to `javatmp-plugins-all.min.js`
- From `src.localeJS` array for each locale object we create `javatmp-plugins-all-locale-*.min.js` file.

The following file structure provide the output JS files from gulp's task 'generate-dist':
```
./web/assets/dist/js
+---javatmp-plugins-all-locale-*.min.js (For each Locale key defines `src.localeJS` object like `src.localeJS.en`)
+---javatmp-plugins-all.min.js
+---javatmp.min.js
```

These Javascript files are referenced from index html/JSP page. kindly see the following pages for more information:
- `./JavaTMP/JavaTMP-Static-Ajax/web/index.html`
- `./JavaTMP/JavaTMP-Static-Ajax/web/index-rtl.html`
- `./JavaTMP/JavaTMP-User-Starter/web/WEB-INF/index.jsp`

## Global And Mandatory Front-end Resources
In `index.html` page, we defined and initialized the global resources. the following list of front-end resources
are used when initializing page parts through calling of `index.init` method:
*   `NProgress`. We use NProgress library to provide a red progress bar at top of the browser page for all fetching activities.
*   `jQuery`. JavaTMP templates are mainly based on jQuery Javascript library.
*   `jQueryUI`. jQueryUI not mandatory for running and initializing javatmp.js nor index.js file.
    but to support card ordering and re-arranging and to use fancytree demo pages.
    We should include jQueryUI before bootstrap to fix any problems. 
*   `jquery.ui.touch-punch`. It is not required too and it is used to improve touch behavior for jQueryUI library.
*   `popper`. popper plugin required by bootstrap and should be included before referencing bootstrap.
*   `Bootstrap`. JavaTMP template based mainly on Bootstrap 4 too.
*   `malihu-custom-scrollbar-plugin` plugin provides a nice scrollable bar for any div like our main fixed sidebar.  
*   `metisMenu`. It is used for main sidebar menu item links.
*   `jquery.blockUI`. We used it to simulate synchronous behavior when using AJAX, without locking the browser.
*   `jquery.scrollUp`. It is used to create a 'Scroll to top' feature.
*   `bootstrap-modal-wrapper-factory`. A wrapper for native bootstrap modal with extending features like creating modal dynamically and open multi modals at the same time.
*   `bootstrap-actionable`. A small Javascript code that help implement click event actions for a and button tags by declarative way and provide functionalities to load AJAX content in Bootstrap Modal Wrapper instance.
*   `bootstrap-card-extender`. Extending bootstrap card by adding option buttons that help make Bootstrap Card more responsive and interactive
*   `bootstrap-alert-wrapper`. Bootstrap alert wrapper factory for creating dynamic alert instances.

## JavaTMP Embedded CSS/JS Code in HTML Pages
For simplicity and complete separation of concerns, we wrote each page with its `CSS/JS` code to run it properly.
So whenever you want to see the implementation or how to use some functionality or plugins, go to corresponding page
in `./web/pages` and see the `HTML` page with its embedded `CSS/JS` codes needed to run that part of the plugin.

Embedding Front-end resources help us isolate main or mandatory resources from other ones and escaping the irrelevant features quickly.

Normally, Embedding `CSS/JS` code in `HTML` pages increase learning curve,
but it does not make the project ready for production quickly.

In this page we are going to discuss the mandatory or global front-end resources with its initialization
and secondary or demo feature pages only.

### Embedded CSS/JS Code in `index.html`
For separation of concerns and simplicity we moved any `CSS/JS` codes that should be in `index.html` to file `index.js`
and initialize page by calling `index.init` function that will wrap all initialization of above plugins.
Check out `./web/assets/src/js-src/index.js` Javascript file for more information.

### Embedded CSS/JS Code in `./web/pages` folder
Most ajax demo pages are based on one of template snippet empty pages reside in `./web/pages/custom-pages/empty-pages`
specially `card-page.html`. Check out HTML file `./web/pages/custom-pages/empty-pages/card-page.html`
So whenever we need to implement a new demo page for plugin or feature, we copy this file to desired folder
in `./web/pages/` and rename it and add a new link in sidebar menu to point to it and write the code inside this new page
with all references to external `CSS` and `Javascript` files if there are anyones and embed to any custom styling
and initialize the plugins in `script` tag. kindly refer to ajax demo pages in `./web/pages` for more details.

### Embedded CSS/JS Code in isolated demo pages in `./web/pages` folder
These pages are not AJAX snippets and normally run separately from the theme. It is like:
*   **Login Pages**. for example see `./web/pages/custom-pages/login-pages/default-login-page.html`
*   **System Pages**, for example see `./web/pages/custom-pages/404-page.html`
*   **Feature Pages**, these demo pages might reference external `CSS/JS` files too
    that are not exist in our theme for demonstration purposes, So you should be connected to internet when browsing those pages.
    for example see pages in `./web/pages/custom-pages/two-columns-layout` folder.

## JavaTMP AJAX Page Lifecycle
JavaTMP templates are a type of `AJAX` based landing page which fetchs `index.html` page using browser address bar
and then all remaining pages consist of snippet html codes that are loaded through `AJAX` in `index.js` file.
In this page we are going to discuss all `AJAX` aspect starting from loading AJAX pages in `index.js` to triggering 
custom `events` to provide complete life cycle for AJAX page and template.

Whenever you load `index.html` page by explicitly typing it on browser URL address bar or pressing
a link that point to ROOT directory, the following steps are happened:
1.  Browser Load `index.html` page from remote server
2.  Browser Load all CSS/JS files in the head and at the end of the `index.html` document.
3.  Browser run any embedded JS code in `index.html`
4.  Browser run `index.init` which calls `javatmp.init` method with default or overriding parameters.
    the most important parameters for AJAX here is:
    *   `defaultUrl: 'pages/home.html'`. which is the default URL string to search for in href attribute in sidebar <a> tags
        to press after initialization if browser's URL hash string does not contain one to search for,
        because we support `AJAX` URL bookmarking.
    *   `updateURLHash: true`. To support `AJAX` URL bookmarking and showing URL hash string, put this parameter to `true`,
        else pressing on any sidebar links will not update browser URL in address bar and navigating bookmarked URL
        that contains hash string will redirect to `index.html` page and remove the hash string in URL.  
5.  At the end of the `index.init` method a code runs to check which `<a>` link should be pressed
    based on `defaultUrl` and `updateURLHash` parameters. And one of the following should happen:  
    1.  Removing URL' hash string starting from # character which will redirect the page to index.html again.
    2.  Using `defaultUrl` string to look for `<a>`'s `href` equal it and triggers a `click` event on it.
    3.  Using URL's hash string as a searching string after remove `#` character when `javatmp.settings.updateURLHash` is `true`
        and hash is exist in the URL.
6.  After one of the sidebar <a> link was clicked In our case `pages/home.html` by the above event firing code the following
    event handling will work and start JavaTMP template AJAX life cycle phases using
    [bootstrap-actionable](https://github.com/JavaTMP/bootstrap-actionable/blob/master/js/bootstrap-actionable.js) plugin.
7. Kindly refer to `./web/pages/custom-pages/empty-pages/` pages to see more details about AJAX events lifecycle code.