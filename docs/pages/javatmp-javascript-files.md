---
title: JavaTMP CSS/SASS Template Files
---
# JavaTMP CSS/SASS Template Files
The main JavaTMP Javascript source file is located in the `./web/assets/src/js-src` folder and move after cleaning and minification to `./web/assets/js`. The following code shows you a gulp's task `compress-js` which responsible on generating cleaning and minification copy:
```Javascript
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
The main Javascript file in the source folder `./web/assets/src/js-src` is `javatmp.js` which is responsible for managing and handling all aspects of the template and we will describe it in next section.

javatmp.js Javascript file
--------------------------

This is the main Javascript code responsible for initializing and defining main plugins to run JavaTMP template. It is referenced at the end of main html page `index.html` like this:

<script src="assets/js/javatmp.min.js"></script>

And initialized by calling `init` method in `index.html` file:
```html
<script type="text/javascript">
    jQuery(function ($) {
        var defaults = {
            httpMethod: "GET",
            dataType: "html",
            updateURLHash: true,
            defaultPassData: {_ajax: "ajax", _ajaxGlobalBlockUI: true},
            defaultOutputSelector: '.main-body-content-container',
            defaultUrl: 'pages/home.html'
        };
        javatmp.init(defaults);
    });
</script>
```
The parameters that `javatmp.js` used and you can override are the following with its description:
```Javascript
window.javatmp.defaults = {
    // Http method to use when calling any ajax requests passing to jquery $.ajax
    httpMethod: "GET",
    // Datatype of ajax content passing to jquery $.ajax
    dataType: "html",
    // update browser hash with ajax url parts or not.
    // sometime you want to forbbid URL bookmarking or sharing so set it to false.
    updateURLHash: true,
    // extra parameters to send with the ajax requests or for managing template.
    // useful to notify your remote server.
    // Setting _ajaxGlobalBlockUI parameter to true will use BlockUI plugin
    // and block browser page and indicate to user
    // Setting _ajaxGlobalBlockUI parameter to false will NOT use BlockUI plugin
    // and The ajax request will silent and the user can operate in the site.
    defaultPassData: {_ajax: "ajax", _ajaxGlobalBlockUI: true},
    // Main Output selector for ajax request content.
    // it should be one and only one.
    defaultOutputSelector: '.main-body-content-container',
    // Whenever the browser resize on all devices
    // or user press collapse button to hide or show the sidebar on large screen only.
    // The template fire this event on defaultOutputSelector element above.
    javaTmpContainerResizeEventName: "javatmp-container-resize",
    // whenever the sidebar metismenu link click,
    // the template fire this event on defaultOutputSelector
    // and waiting until event's handler code finish and if the return value
    // from event's handler code is false or event.preventDefault() was called
    // will cancel current ajax request and keep you in the current page.
    // You can run any destruction code in this event's handler function.
    javaTmpContainerRemoveEventName: "javatmp-container-remove",
    // Whenever card's copress fullscreen button press the event fire
    // on defaultOutputSelector selector
    // with card object as parameter to handler fuction.
    cardFullscreenCompress: "card.fullscreen.compress",
    // Whenever card's expand fullscreen button press the event fire
    // on defaultOutputSelector selector
    // with card object as parameter to handler fuction.
    cardFullscreenExpand: "card.fullscreen.expand",
    // After the ajax request finished and content fetched and updated the page
    // the tempalte fire this event on defaultOutputSelector.
    // it is considered the safest way to run your initialiation code regarding new content.
    javaTmpAjaxContainerReady: "javatmp-ajax-container-ready",
    // Default url string to start the template from.
    // after template load it search for this string in href attribute
    // in sidebar's metismenu to fire a click on.
    defaultUrl: 'pages/home.html',
    // default float or direction used
    floatDefault: "left",
    // reverse float or direction used.
    floatReverse: 'right',
    // direction of the document:
    direction: "ltr",
    // attribute for some of plugins that support RTL through initialization parameter.
    isRTL: false,
    // additional string work as a URL contextPath of your web application:
    contextPath: ""
};
```
`window.javatmp.init` method 
-----------------------------

The main method of `javatmp.js` file is `window.javatmp.init` which is responsible for the following actions:

*   initialize global jquery ajax configuration
*   initialize `NProgress` and `blockUI` plugins to work in all ajax requests
*   initialize `malihu-custom-scrollbar-plugin` plugin for fixed sidebar and any container has `.scroll-content` class to provide customize styled slim scroll bars
*   Initialize `metismenu` plugin for `.metismenu` div in sidebar and update sidebar whenever any of `.metismenu` item collapsed.
*   listen to transition on sidebar to trigger event on default ajax output div using event name `javatmp.settings.javaTmpContainerResizeEventName`.
*   handle method for `mousemove` event to activiate hidden sidebar when mouse reach the left side of browser window.
*   listen of click event of main `.navbar-toggler` button in navbar.
*   listen to `resize` window event to update sidebar status.
*   listen on `click` event on breadcrumb bar's links.
*   Initialize and define main AJAX lifecycle for template by listening on `click` event of sidebar's metismenu links.
*   Update browser url with hash string if it is required.
*   Override some of [Bootstrap Actionable plugin](/pages/javatmp-actionable-plugin "JavaTMP Bootstrap Actionable Plugin") parameters
*   Override some of [Bootstrap Card Extender plugin](/pages/extended-bootstrap-card-options "JavaTMP Bootstrap Card Extender") parameters

`javatmp.js` initializes and uses some plugins that should be referenced before `javatmp.js` file. the following list of main plugins that are used in `javatmp.js` file:

*   jQuery
*   jQueryUI
*   jquery.ui.touch-punch
*   popper
*   bootstrap
*   NProgress
*   malihu-custom-scrollbar-plugin
*   metisMenu
*   jquery.blockUI
*   jquery.scrollUp
*   bootstrap-modal-wrapper-factory
*   bootstrap-actionable
*   bootstrap-card-extender
*   bootstrap-alert-wrapper

We separately referenced those plugins before calling `javatmp.init` method in `index.html` file.