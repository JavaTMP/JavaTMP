---
title: JavaTMP Embedded CSS/JS Code in HTML Pages
---
# JavaTMP Embedded CSS/JS Code in HTML Pages
For simplicity and complete separation of concerns, we wrote each page with its `CSS/JS` code to show or run instead of grouping plugins and demos pages in external files or inject them with main CSS or Javascript file.

So whenever you want to see the implementation or how to use some functionality, go to corresponding page in `./web/pages` and see the `HTML` page with its `CSS/JS` needed to run that part of the plugin.

Embedding Front-end resources help us isolate main or mandatory resources from other ones and escaping the irrelevant features quickly.

Normally, Embedding `CSS/JS` code in `HTML` pages increase learning curve, but it does not make the project ready for production quickly. and for this reason we implemented other versions of JavaTMP template that focus on specific area.

In this page we are going to discuss the mandatory or global front-end resources with its initialization and secondary or demo feature pages only.

Global And Mandatory Front-end Resources
----------------------------------------

In `index.html` page, we defined and initialized the global resources. the following list of front-end resources are separately referenced in `index.html` page:

*   `NProgress`. We use NProgress library to provide a red progress bar at top of the browser page for all fetching activities.
*   `jQuery`. JavaTMP templates are mainly based on jQuery Javascript library.
*   `jQueryUI`. jQueryUI not mandatory for running and initializing javatmp.js file. but to support card ordering and re-arranging and to use fancytree demo pages. We should include jQueryUI before bootstrap to fix any problems. 
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

Embedded CSS/JS Code in `index.html`
------------------------------------

For separation of concerns and simplicity we embed the following `CSS/JS` code in `index.html` at the end of the file after referenced the above mandatory libraries and plugins:

*   custom style for sidebar menu search text field. So if you want to remove the `textfiled` you can simply remove this `CSS` style too.
*   Javascript code that will disable `click` event on `.disabled` class.
*   Javascript code that will disable `click` event on `.dropdown-menu-header` or `.dropdown-menu-footer` classes.
*   Javascript code that will initialize bootstrap `tooltip` plugin on `[data-toggle=tooltip]` selector.
*   Javascript code that will initialize `scrollUp` plugin.
*   Javascript code that will listen of `keyup` event for instantly searching and filtering sidebar menu in textfield.
*   Javascript code that will initialize javatmp main Javascript code by invoking `javatmp.init` method.
*   Javascript code for google analytics to track site usages.

Embedded CSS/JS Code in `./web/pages` folder
--------------------------------------------

Most ajax demo pages are based on one of template snippet empty pages reside in `./web/pages/custom-pages/empty-pages` specially `card-page.html`. The following HTML code show you `card-page.html` page (we are going to describe custom events trigger and firing later):
```
<div class="dynamic-ajax-content">
    <div class="page-header">
        <h1>Blank Card Page Title</h1>
    </div>
    <div class="row">
        <div class="col">
            <div class="card my-3">
                <div class="card-header">
                    Blank Card Title
                    <div class="options float-right">
                        <a class="settings"><i class="fa fa-cog"></i></a>
                        <a href="#" class="collapse"><i class="fa fa-chevron-up"></i></a>
                        <a href="#" class="reload"><i class="fa fa-refresh"></i></a>
                        <a href="#" class="fullscreen"><i class=" fa fa-expand"></i></a>
                        <a href="#" class="remove"><i class="fa fa-times"></i></a>
                    </div>
                </div>
                <div class="card-body">
                    <h4 class="card-title text-primary">Special title treatment</h4>
                    <p class="card-text">With supporting text below as a natural lead-in to additional content.</p>
                </div>
            </div>
        </div>
    </div>
    <!--
    Reference Your external Stylesheet file here
    if your feature or plugins could not support to run globally.
    <link href="components/" rel="stylesheet">
    -->
    <style type="text/css">
        /*
        Embed CSS styling for current page.
        */
    </style>

    <!--
    Reference Your external Javascript file here
    if your feature or plugins could not support to run globally.
    <script src="components/"></script>
    -->
    <script type="text/javascript">
        // You could write safely Javascript code here too as our template
        // should load mandatory libraries and plugins before.
        // <--- HERE --->
        //

        jQuery(function ($) {
            // any code put here will be run after content attach to ajax output container and before
            // controll return to main javascript file.
            // <--- HERE --->
            //

            $(javatmp.settings.defaultOutputSelector).on(javatmp.settings.javaTmpAjaxContainerReady, function (event) {
                // fire AFTER all transition done and your ajax content is shown to user.
            });

            $(javatmp.settings.defaultOutputSelector).on(javatmp.settings.javaTmpContainerResizeEventName, function (event) {
                // fire when user resize browser window or sidebar hide / show
            });
            $(javatmp.settings.defaultOutputSelector).on(javatmp.settings.cardFullscreenCompress, function (event, card) {
                // when card compress by pressing the top right tool button
            });
            $(javatmp.settings.defaultOutputSelector).on(javatmp.settings.cardFullscreenExpand, function (event, card) {
                // when card Expand by pressing the top right tool button
            });

            /**
             * When another sidebar menu item pressed and before container issues new ajax request.
             * You can cancel, destroy, or remove any thing here before replace main output ajax container.
             * returning false will cancel the new request and do nothing.
             **/
            $(javatmp.settings.defaultOutputSelector).on(javatmp.settings.javaTmpContainerRemoveEventName, function (event) {
                $(javatmp.settings.defaultOutputSelector).off(javatmp.settings.cardFullscreenCompress);
                $(javatmp.settings.defaultOutputSelector).off(javatmp.settings.cardFullscreenExpand);
                return true;
            });
        });
    </script>
</div>
```
So whenever we need to implement a new demo for plugin or feature, we copy this file to desired folder in `./web/pages/` and rename it and add a new link in sidebar menu to point to it and write the code inside this new page with all references to `CSS` and `Javascript` files and Embed to any custom styling and initialize the plugins in `script` tag. kindly refer to ajax demo pages in `./web/pages` for more details.

Embedded CSS/JS Code in isolated demo pages in `./web/pages` folder
-------------------------------------------------------------------

These pages are not AJAX snippets and normally run separately from the theme. It is like:

*   **Login Pages**. for example see `./web/pages/custom-pages/login-pages/default-login-page.html`
*   **System Pages**, for example see `./web/pages/custom-pages/404-page.html`
*   **Feature Pages**, these demo pages might reference external `CSS/JS` files too that are not exist in our theme for demonstration purposes, So you should be connected to internet when browsing those pages. for example see pages in `./web/pages/custom-pages/two-columns-layout` folder.

