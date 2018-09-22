---
title: JavaTMP Sidebar Layout
---
# JavaTMP Sidebar Layout
The main sidebar of JavaTMP template is fixed and sliding off-canvas by shifting `.main-content` on large screen and devices,
and on-canvas on small screens and mobile devices when the `.sidebar-toggler-button` button presses.
The sidebar sliding on-canvas too when you press the toggler button which activates sidebar by mouse moving near
the left side of the browser window.

Main features of sidebar:
*   Fixed position with custom scrollbar.
*   Below navbar on default wider navbar style.
*   Off navbar from top to bottom on longer sidebar style.
*   Off-canvas next to main content.
*   On-canvas when activate mouse-auto-show feature.
*   On-canvas on mobile and small screen and devices.

The SASS file for styling sidebar is located in `./web/assets/src/sass/partials/sidebar.scss`,
JavaTMP's `.sidebar` uses a CSS transition to show or hide itself by sliding main content to right.

We make `.sidebar` scrollable by adding `.scroll-content` class, which we applied a `malihu-custom-scrollbar-plugin` plugin to it
in main Javascript file:
```
$('.scroll-content').mCustomScrollbar(javatmp.settings.mCustomScrollbarOptions);
```

So, If you want to remove `malihu-custom-scrollbar-plugin` plugin, you should add `overflow-y: scroll;`
to all `.scroll-content` class tags, if its height is explicitly set.
Also you should make sure any fixed element with explicit height are style by `overflow-y: scroll;`. Anyway,
there are three main elements in our fixed sidebar which are:
*   `.sidebar-shortcut-button` div for small buttons used as demo without any functionalities.
*   `.sidebar-menu-filter-form` div which contains a `textfield` for filtering menu items.
*   `.metismenu` div which provides collapsible sidebar links using `metismenu` jQuery plugin.

### `.sidebar-shortcut-button` element
It contains a `buttons` which point to demo home page using Actionable plugin which we discuss later.
You can remove the div and it is styling too. 

### `.sidebar-menu-filter-form` element
It contains a `textfield` that provides simple filtration for next collapsible link items with clear button that shown
when you write something on the `textfield`.

### `.metismenu` element
`.metismenu` `ul` is a container for main sidebar collapsible menu items. The menu is initialized and activated in
`index.js` using `metismenu` jQuery plugin and styled using default plugin CSS file and custom styling to apply our styling to it.
The `metismenu` plugin is initialized in `index.init` method.

So if you don't want to use metisMenu plugin and want to remove it completely from project you should do the following step:
*   Remove `metismenu` key and value from `package.json'`s dependencies.
*   Remove `metismenu` key and values from `gulpfile.js` config variable.
*   Remove Javascript file path in src.js array and CSS file path in src.css for metismenu plugin.
*   Remove custom `metismenu` styling file `web/assets/src/sass/plugins/custom-metisMenu.scss`.
*   Generate the dist folder again by issuing gulp command `generate-dist`.
*   Remove above `metismenu` initialization code in index.js file.
*   Optionally, you can remove or update `.metismenu` class in sidebar and use another class too in `index.js` file
    for handling event `click` on any link inside .metismenu.
    ```
    // Initialize and define main AJAX lifecycle for template by listening on click event of sidebar's metismenu links.
    $(".metismenu").on("click", 'a[target!="_blank"][href!="#"]', function (event) {...}
    ```
