---
title: JavaTMP HTML Files
---
# JavaTMP HTML Files
The HTML files for template consist of `./web/index.html` file and all HTML files located in `./web/pages` folder which most of them are AJAX HTML snippets were called from `./web/index.html` file and `javatmp.js` Javascript file using jquery AJAX. The following is a high level folder structures of JavaTMP HTML `./web` regarding HTML files, kindly see our [online demo](http://demo.javatmp.com/JavaTMP-Static-Ajax/ "JavaTMP Bootstrap Admin And Dashboard Template") sidebar links for complete list of folders and links:
```
./web
|---index.html
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

1.  `index.html` which consists of the main html file used for initializing Javascript and providing main layout structure of the template like navbar, sidebar and use AJAX to load other html snippet files.
2.  HTML snippet files which consist of HTML code used as an AJAX content to be injected in the index.html file. like most of other pages, for example `./web/pages/custom-pages/empty-pages/card-page.html` page
3.  Separate HTML pages consist of complete code to show specific scenarios or features like `404-page.html` or `default-login-page.html`. they open in new browser tab and sometimes they depends on external front-end resources.

Please see our [online demo](http://demo.javatmp.com/JavaTMP-Static-Ajax/ "JavaTMP Bootstrap Admin And Dashboard Template") for those types of pages.

`empty-page.html` Page 
-----------------------

The following is the content of the `./web/pages/custom-pages/empty-pages/empty-page.html` that provide minimum required html code to create an AJAX snippet content:
```html
<div class="dynamic-ajax-content">
    <div class="row">

    </div>
    <script type="text/javascript">
        jQuery(function ($) {
            // any code put here will be run after content attach to ajax output container and before
            // control return to main javascript file.

            $(javatmp.settings.defaultOutputSelector).on(javatmp.settings.javaTmpAjaxContainerReady, function (event) {
                // fire AFTER all transition done and your ajax content is shown to user.
            });

            $(javatmp.settings.defaultOutputSelector).on(javatmp.settings.javaTmpContainerResizeEventName, function (event) {
                // fire when user resize browser window or sidebar hide / show
            });

            /\*\*
             \* When another sidebar menu item pressed and before container replaced with new ajax content.
             \* You can cancel, destroy, or remove any thing here before replace main output ajax container.
             \* returning false will cancel the new request and do nothing.
             \*\*/
            $(javatmp.settings.defaultOutputSelector).on(javatmp.settings.javaTmpContainerRemoveEventName, function (event) {
                return true;
            });
        });
    </script>
</div>
```
The following is an [online demo of empty-page.html](http://demo.javatmp.com/JavaTMP-Static-Ajax/#pages/custom-pages/empty-pages/empty-page.html "JavaTMP Java Bootstrap Admin And Dashboard Empty Page Template").