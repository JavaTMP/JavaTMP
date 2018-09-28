---
title: JavaTMP Front-end Frameworks And Plugins Files
---
# JavaTMP Front-end Frameworks And Plugins Files
The JavaTMP Front-end frameworks and plugins consist of the libraries used in the front-end part of the template like jQuery,
Bootstrap and it is first stored separately in `./web/components` folder with all its Javascript, CSS, and images files.
Before it is moved and merged to appropriate files in `./web/assets/dist` using gulp's task `generate-dist`.
Then, it deleted when gulp's task `generate-dist` finishes running.

Keep in mind that these plugins and frameworks are different than the custom JS/CSS files specifically used in the template,
which are stored in `./web/assets/src/` folder and moved and merged to `./web/assets/dist` too using same gulp's task.

We manage our front-end dependencies using Node NPM and gulp so the folder `./web/components`
are dynamically generated when we run the gulp's task `copy-components`.
Read more about our [Gulp build file](/pages/gulp-build-file) and
[managing front-end dependencies using Node.js And Gulp](/pages/manage-front-end-dependencies-using-node-js-and-gulp).

Please see the complete list of front-end jquery and bootstrap libraries we used in our template in the following page:
[JavaTMP Front-end Plugins And Frameworks](/pages/javatmp-front-end-plugins-and-frameworks).

## Plugins in Projects
After we downloaded front-end plugins using Node's `npm` command , We copied only needed files like dist folder and images
as defined in `config.plugins` in gulp's task `copy-components` from `./node_modules` to `./web/components`
and then we merge them as defined `src.css`/`src.js` keys in gulp's task `generate-dist`.
So it is your responsibilities to decide which plugins you need and if you want to merge them in one large js or css files.

We provide a CSS customization for some of the plugins styling to apply our themes to them in a form of SASS' SCSS syntax.
Those custom CSS files reside separately in `./web/assets/src/sass/plugins` or `./web/assets/src/sass-rtl/plugins` folders.
And they compile and merge with bootstrap and JavaTMP styling and moved to `./web/assets/dist/css/javatmp-*.min.css`
the following page describes the front-end customization for some of the plugins:
[JavaTMP Resources Customization](/pages/javatmp-frontend-resources-customization).

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
- `./JavaTMP/JavaTMP-Java-Ajax/web/WEB-INF/index.jsp`
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
