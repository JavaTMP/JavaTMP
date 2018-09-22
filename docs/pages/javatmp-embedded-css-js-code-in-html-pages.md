---
title: JavaTMP Embedded CSS/JS Code in HTML Pages
---
# JavaTMP Embedded CSS/JS Code in HTML Pages
For simplicity and complete separation of concerns, we wrote each page with its `CSS/JS` code to run it properly.
So whenever you want to see the implementation or how to use some functionality or plugins, go to corresponding page
in `./web/pages` and see the `HTML` page with its embedded `CSS/JS` codes needed to run that part of the plugin.

Embedding Front-end resources help us isolate main or mandatory resources from other ones and escaping the irrelevant features quickly.

Normally, Embedding `CSS/JS` code in `HTML` pages increase learning curve,
but it does not make the project ready for production quickly.

In this page we are going to discuss the mandatory or global front-end resources with its initialization
and secondary or demo feature pages only.

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

## Embedded CSS/JS Code in `index.html`
For separation of concerns and simplicity we moved any `CSS/JS` codes that should be in `index.html` to file `index.js`
and initialize page by calling `index.init` function that will wrap all initialization of above plugins.
Check out `./web/assets/src/js-src/index.js` Javascript file for more information.

## Embedded CSS/JS Code in `./web/pages` folder
Most ajax demo pages are based on one of template snippet empty pages reside in `./web/pages/custom-pages/empty-pages`
specially `card-page.html`. Check out HTML file `./web/pages/custom-pages/empty-pages/card-page.html`
So whenever we need to implement a new demo page for plugin or feature, we copy this file to desired folder
in `./web/pages/` and rename it and add a new link in sidebar menu to point to it and write the code inside this new page
with all references to external `CSS` and `Javascript` files if there are anyones and embed to any custom styling
and initialize the plugins in `script` tag. kindly refer to ajax demo pages in `./web/pages` for more details.

## Embedded CSS/JS Code in isolated demo pages in `./web/pages` folder
These pages are not AJAX snippets and normally run separately from the theme. It is like:
*   **Login Pages**. for example see `./web/pages/custom-pages/login-pages/default-login-page.html`
*   **System Pages**, for example see `./web/pages/custom-pages/404-page.html`
*   **Feature Pages**, these demo pages might reference external `CSS/JS` files too
    that are not exist in our theme for demonstration purposes, So you should be connected to internet when browsing those pages.
    for example see pages in `./web/pages/custom-pages/two-columns-layout` folder.

