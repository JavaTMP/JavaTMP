---
title: JavaTMP AJAX Page Lifecycle
---
# JavaTMP AJAX Page Lifecycle
JavaTMP templates are a type of `AJAX` based landing page which fetchs `index.html` page using browser address bar and then all remaining pages consist of snippet html codes that are loaded through `AJAX` in `javatmp.js` file. In this documentation page we are going to discuss all `AJAX` aspect starting from loading AJAX pages in `javatmp.js` to triggering  custom `events` to provide complete life cycle for AJAX page and template.

Whenever you load `index.html` page by explicitly typing it on browser URL address bar or pressing a link that point to ROOT directory, the following steps are happened:

1.  Browser Load `index.html` page from remote server
2.  Browser Load all CSS/JS files in the head and at the end of the `index.html` document.
3.  Browser run any embedded JS code in `index.html`
4.  Browser run `javatmp.init` method with default or overriding parameters. the most important parameters for AJAX here is:
    *    `defaultUrl: 'pages/home.html'`. which is the default URL string to search for in href attribute in sidebar <a> tags to press after initialization if browser's URL hash string does not contain one to search for, because we support `AJAX` URL bookmarking.
    *   `updateURLHash: true`. To support `AJAX` URL bookmarking and showing URL hash string, put this parameter to `true`, else pressing on any sidebar links will not update browser URL in address bar and navigating bookmarked URL that contains hash string will redirect to `index.html` page and remove the hash string in URL.  
5.  At the end of the `javatmp.init` method the following code runs to check which `<a>` link should be pressed:  
```
    // Trigger the initial click event on sidebar <a> links
    // which its href equal URL hash String or the defaultUrl String
    if (javatmp.settings.updateURLHash === true) {
        var loc = window.location.href,
                index = loc.indexOf('#');
        if (index > 0 && window.location.hash.length > 1) {
            var ajaxUrl = window.location.hash.replace('#', '');
            $('a\[href="' + ajaxUrl + '"\]').trigger("click");
        } else {
            $('a\[href="' + javatmp.settings.defaultUrl + '"\]').trigger("click");
        }
    } else {
        var loc = window.location.href,
                index = loc.indexOf('#');
        if (index > 0) {
            window.location.replace(loc.substring(0, index));
        } else {
            $('a\[href="' + javatmp.settings.defaultUrl + '"\]').trigger("click");
        }
    }
```
6.  So the above code will lead to three scenarios:
    1.  Removing URL' hash string starting from # character which will redirect the page to index.html again:

        window.location.replace(loc.substring(0, index));

    2.  Using `defaultUrl` string to look for `<a>`'s `href` equal it and triggers a `click` event on it:
```
        $('a\[href="' + javatmp.settings.defaultUrl + '"\]').trigger("click");
```
        In our case the following code will run:
```
        $('a\[href="pages/home.html"\]').trigger("click");
```
    3.  Using URL's hash string as a searching string after remove `#` character when `javatmp.settings.updateURLHash` is `true` and hash is exist in the URL:
```
        $('a\[href="' + ajaxUrl + '"\]').trigger("click");
```
        For example: http://demo.javatmp.com/JavaTMP-Static-Ajax/#pages/bootstrap/components.html will become `pages/bootstrap/components.html` and then triggering:
```
        $('a\[href="pages/bootstrap/components.html"\]').trigger("click");
```
7.  After one of the sidebar <a> link was clicked In our case `pages/home.html` by the above event firing code the following event handling will work and start JavaTMP template AJAX life cycle phases (we removed irrelevant code, so see javatmp.js for more details on the complete code):
```
    // Initialize and define main AJAX lifecycle for template by listening on click event of sidebar's metismenu links.
    $(".metismenu").on("click", 'a\[target!="\_blank"\]\[href!="#"\]', function (event) {
        var $this = $(this);
        event.preventDefault();
        var javaTmpRemoveEvent = $.Event(javatmp.settings.javaTmpContainerRemoveEventName, {\_newTarget: $this});
        $(javatmp.settings.defaultOutputSelector).trigger(javaTmpRemoveEvent).promise().done(function () {
            if (!javaTmpRemoveEvent.isDefaultPrevented()) {
                $(javatmp.settings.defaultOutputSelector).off(javatmp.settings.javaTmpAjaxContainerReady).promise().done(function () {
                    $(javatmp.settings.defaultOutputSelector).off(javatmp.settings.javaTmpContainerResizeEventName).promise().done(function () {
                        $(javatmp.settings.defaultOutputSelector).off(javatmp.settings.javaTmpContainerRemoveEventName).promise().done(function () {
                            $(javatmp.settings.defaultOutputSelector).off(javaTmpRemoveEvent).promise().done(function () {
                                if (javatmp.settings.updateURLHash === true) {
                                    window.location.hash = $this.attr("href");
                                }
                                $.ajax({
                                    url: $this.attr("href"),
                                    success: function (response, textStatus, jqXHR) {
                                        $(javatmp.settings.defaultOutputSelector).html(response).promise().done(function () {
                                            $('html').animate({scrollTop: 0}, 'slow').promise().done(function () {
                                                $(javatmp.settings.defaultOutputSelector).trigger(javatmp.settings.javaTmpAjaxContainerReady);
                                            });
                                        });
                                    }
                                });
                            });
                        });
                    });
                });
            }
        });
    });
```
8.  Create and trigger custom event `javaTmpContainerRemoveEventName` name on `defaultOutputSelector` selector and wait using jQuery promise until it finishes if there are any. we passed new <a> link object as parameter to custom event handler and after the custom event handler finished we check immediately for the handler cancel the new request or not. Note that for initial request there are not attached any handler for this event yet so the logic continue quickly. The following code summarize creating and trigger javaTmpContainerRemoveEventName event:
```
    var javaTmpRemoveEvent = $.Event(javatmp.settings.javaTmpContainerRemoveEventName, {\_newTarget: $this});
    $(javatmp.settings.defaultOutputSelector).trigger(javaTmpRemoveEvent).promise().done(function () {
        if (!javaTmpRemoveEvent.isDefaultPrevented()) {

        }
    });
```
    So if you want to provide any destruction code for current page or to cancel new request, you can listen on this event like this:
```
    /\*\*
     \* When another sidebar menu item pressed and before container issues new ajax request.
     \* You can cancel, destroy, or remove any thing here before replace main output ajax container.
     \* return false or event.preventDefault() will cancel ajax and stay you in the current page and do nothing.
     \*\*/
    $(javatmp.settings.defaultOutputSelector).on(javatmp.settings.javaTmpContainerRemoveEventName, function (event) {
        return false;
    });
```
9.  After event handler return true and no preventing us from calling the new AJAX request. the code continues by removing the following custom event handlers if were attached previously on `defaultOutputSelector`, The code waits until custom event handlers are removed using promise object:
```
    $(javatmp.settings.defaultOutputSelector).off(javatmp.settings.javaTmpAjaxContainerReady).promise().done(function () {
        $(javatmp.settings.defaultOutputSelector).off(javatmp.settings.javaTmpContainerResizeEventName).promise().done(function () {
            $(javatmp.settings.defaultOutputSelector).off(javatmp.settings.javaTmpContainerRemoveEventName).promise().done(function () {
                $(javatmp.settings.defaultOutputSelector).off(javaTmpRemoveEvent).promise().done(function () {

                });
            });
        });
    });
```
10.  Now all previously custom event handlers are removed we update the URL's hash with new `<a>`'s `href` if `updateURLHash` is true:
```
    if (javatmp.settings.updateURLHash === true) {
        window.location.hash = $this.attr("href");
    }
```
11.  Now we send an `AJAX` request using current link `href`:
```
    $.ajax({
        url: $this.attr("href"),
        success: function (response, textStatus, jqXHR) {
            $(javatmp.settings.defaultOutputSelector).html(response).promise().done(function () {
                $('html').animate({scrollTop: 0}, 'slow').promise().done(function () {
                    $(javatmp.settings.defaultOutputSelector).trigger(javatmp.settings.javaTmpAjaxContainerReady);
                });
            });
        }
    });
```
12.  After remote server sent a response for AJAX request the `success` function is called with new HTML content in `response` variable so we replaced current HTML code in defaultOutputSelector div with new HTML content and wait. after update any external CSS/JS files referenced in new content will be fetched and any embedded Javascript code will be ran too. then we smoothly animate to to of the page.
13.  At the end after everything finish, we trigger `javaTmpAjaxContainerReady` event on `defaultOutputSelector` for any new handler attached from new AJAX response contents. And this is considered the most safest location to initialize your new content from. 

The following HTML code provides General AJAX response Page that might be returned from the server and it is located in `web/pages/custom-pages/empty-pages/event-page.html`:
```
<div class="dynamic-ajax-content">
    <div class="page-header">
        <h1>Page Title</h1>
    </div>
    <div class="row">
        <div class="col-lg-12">
            <p class="">Page Content</p>
        </div>
    </div>
    <!--
    Reference Your external Stylesheet file here
    if your feature or plugins could not support to run globally.
    <link href="components/" rel="stylesheet">
    -->
    <style type="text/css">
        /\*
        Embed CSS styling for current page.
        \*/
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

            /**
             * When another sidebar menu item pressed and before container issues new ajax request.
             * You can cancel, destroy, or remove any thing here before replace main output ajax container.
             * return false or event.preventDefault() will cancel ajax and stay you in the current page and do nothing.
             **/
            $(javatmp.settings.defaultOutputSelector).on(javatmp.settings.javaTmpContainerRemoveEventName, function (event) {
                var newLink = $(event._newTarget);
                return true;
            });
        });
    </script>
</div>
```