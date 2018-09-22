---
title: JavaTMP HTML Files
---
# JavaTMP HTML Files
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
    like most of other pages, for example `./web/pages/custom-pages/empty-pages/card-page.html` page
3.  Separate HTML pages consist of complete code to show specific scenarios or features like `404-page.html`
    or `default-login-page.html`. they open in new browser tab and sometimes they depends on external front-end resources.

Please see our [online demo](http://demo.javatmp.com/JavaTMP-Static-Ajax/) for those types of pages.

## `empty-page.html` Page 
The following is the content of the `./web/pages/custom-pages/empty-pages/empty-page.html` that provide minimum required html code
to create an AJAX snippet content. The following is an
[online demo of empty-page.html](http://demo.javatmp.com/JavaTMP-Static-Ajax/#pages/custom-pages/empty-pages/empty-page.html).