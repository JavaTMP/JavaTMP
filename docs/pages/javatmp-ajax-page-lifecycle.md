---
title: JavaTMP AJAX Page Lifecycle
---
# JavaTMP AJAX Page Lifecycle
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