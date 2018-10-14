---
title: JavaTMP Template Layout
---
# Default JavaTMP Template Layout
JavaTMP templates are an AJAX based Templates with fixed navbar, sidebar, breadcrumb, and footerbar.
It is implemented in main html file `index.html` inside `web` folder.

JavaTMP templates layouts are based on fixed-fluid two columns bootstrap 4 layout which you can find separate information and demos in the following pages:
*   [collapsible fixed sidebar in bootstrap 4 using css transition tutorial](https://www.javatmp.com/blogs/tutorial/collapsible-fixed-sidebar-in-bootstrap-4-using-css-transition "collapsible fixed sidebar in bootstrap 4 using css transition tutorial")
*   [off canvas sliding fixed sidebar in bootstrap 4 using css transition demo](http://demo.javatmp.com/JavaTMP-Static-Ajax/pages/custom-pages/two-columns-layout/off-canvas-sliding-fixed-sidebar-in-bootstrap-4-using-css-transition.html "off canvas sliding fixed sidebar in bootstrap 4 using css transition demo")
*   [on canvas sliding hidden fixed sidebar in bootstrap 4 on mouse hover tutorial](https://www.javatmp.com/blogs/tutorial/on-canvas-sliding-hidden-fixed-sidebar-in-bootstrap-4-on-mouse-hover "on canvas sliding hidden fixed sidebar in bootstrap 4 on mouse hover")
*   [on canvas sliding hidden fixed sidebar in bootstrap 4 on mouse hover demo](http://demo.javatmp.com/JavaTMP-Static-Ajax/pages/custom-pages/two-columns-layout/on-canvas-sliding-hidden-fixed-sidebar-in-bootstrap-4-on-mouse-hover.html "on canvas sliding hidden fixed sidebar in bootstrap 4 on mouse hover demo")

The template layout options for javatmp are:
*   wider navbar over sidebar.
*   Longer sidebar layout beside navbar using `longer-sidebar` class on body element.
*   Auto hide/show of sidebar when user toggle it using navbar toggler's button on large and desktop device screens.

### `head` element
`head` element contains `title`, `meta` tags, and references for external CSS files.

### `.main-javatmp-navbar` element
The class `.main-javatmp-navbar` styles main navbar of JavaTMP which is fixed on top with `.fix-top` class,
the following SASS file `./web/assets/src/sass/partials/navbar.scss` provides main styling for navbar.

### `.sidebar` element
The class `.sidebar` styles main sidebar of JavaTMP which is Off-canvas fixed with sliding
for main content on large screen and devices and on-canvas fixed on small screen and mobile
devices or when the user press togger button on navbar which will activate auto show/hide off
of sidebar on desktop and large screen only. The SASS file for styling sidebar is 
`./web/assets/src/sass/partials/sidebar.scss`, 
JavaTMP's sidebar uses a CSS transition to show hide itself by sliding main content to right. 

### `.main-content` element
The `.main-content` div is a grouper for `.main-breadcrumb-bar` and `.main-body-content-container` classes,
and shrink by `margin-left` rule when the fixed sidebar is active by class `.active` on the large screens and devices.
The SASS file for styling `.main-content` is reside in `./web/assets/src/sass/partials/base.scss` file.

### `main-breadcrumb-bar` element
The class `.main-breadcrumb-bar` styles main breadcrumb of JavaTMP which is fixed with shrink when sidebar is active
on large screen and devices. The SASS file for styling .`main-breadcrumb-bar` is
`./web/assets/src/sass/partials/breadcrumb.scss`. 

### `.main-body-content-container` element
The class `.main-body-content-container` style main AJAX container div that will hold the AJAX content for one of sidebar links.
It does not has any special styling other than padding and mainly padding from top because `.main-breadcrumb-bar` class is fixed.

### `.main-footer-bar` element
The class `.main-footer-bar` style main footer div which is fixed on desktop and large screen and relative on small devices and mobile.
It is height about 34 pixels so we styled `body` element with padding from the bottom with 34 pixels too on large screen
and desktop devices.

## JavaTMP Navbar Layout
The main navbar of JavaTMP template is fixed on top using native bootstrap `.fix-top` class,
so we styled the body to have a value of its height for padding-top rule.

Main features of JavaTMP navbar:
*   Wider fixed on top navbar above the fixed sidebar.
*   Fixed on top next to fixed sidebar when `body.longer-sidebar` activated.

The class `.main-javatmp-navbar` styles main navbar of JavaTMP template and the SASS file for styling navbar
`.main-javatmp-navbar` is located in `./web/assets/src/sass/partials/navbar.scss`

The main navbar element `.main-javatmp-navbar` of The template consists of three main elements:
*   `.navbar-brand` which is a link to demo home page with template name.
*   `.nav` with `.main-navbar-menu` which is a native bootstrap nav providing left navbar menu bar.
*   `.navbar-toggler` which is a `button` styled using native bootstrap `.navbar-toggler` class
    and used for showing/hiding sidebar by sliding it.

For simplicity and template consistent we styled `.main-javatmp-navbar` with `flex-wrap: nowrap` so the complete `.navbar`
will stay same for all devices and screen sizes but we hide some element to accommodate screen sizes.

### `.navbar-brand` element
The navbar brand element is a simple link to demo home page with text only.

### `.nav.main-navbar-menu` element
The `.nav` menu bar was not enclosed by `div.collapse.navbar-collapse` so it will stay same on mobile, desktop and small screen devices.
It consists of set of nav-item to provide languages, messages, tasks and alerts dropdowns.
Note that those dropdowns are only static and do not provide any functionalities and it is just exist to show you style for them.
The main two modifications for bootstrap normal dropdown menu are `.mega-on-sm` and `.dropdown-menu-extender` classes.
*   `.mega-on-sm` class applied to `.nav-item.dropdown` element and it makes the element's position static and its child `.dropdown-menu`
    stretch wide on small screen and mobile devices by the following CSS file in `./web/assets/src/sass/plugins/custom-bootstrap-dropdown.scss`
*   `.dropdown-menu-extender` class which applied to `.dropdown-menu` element to extends it to support header,
    footer and fixed height content elements for `.dropdown-menu`. It is styling located in 
    `./web/assets/src/sass/pages/dropdown-menu-extender.scss` SASS file.

### `.navbar-toggler` element
It is simply a `button` styled using native bootstrap `.navbar-toggler` class and used for showing/hiding sidebar by sliding it
using `click` event on `.sidebar-toggler-button` class

Although we use native bootstrap `.navbar-toggler` and `.navbar-toggler-icon` classes, it is not mandatory as this `button`
is not used with bootstrap collapsible plugin and for custom styling you can remove or provide specific styling for it.

Note that we show `.navbar-toggler` button on all devices and screen sizes, so if you want to hide it on large screens
and desktop devices you can add `.navbar-expand-lg` class to `nav.main-javatmp-navbar.navbar` element, but keep in mind that
it will do nothing if you provide custom styling and remove `.navbar-toggler` class.

## JavaTMP Sidebar Layout
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

## JavaTMP Main Content Layout
The `.main-content` div is a grouper for `.main-breadcrumb-bar` and `.main-body-content-container` classes.

### `main-breadcrumb-bar` element
The class `.main-breadcrumb-bar` styles main breadcrumb of JavaTMP which is fixed with shrink when sidebar is active on large screen
and devices. The SASS file for styling .`main-breadcrumb-bar` is `./web/assets/src/sass/partials/breadcrumb.scss`.

### `.main-body-content-container` element
The class `.main-body-content-container` style main AJAX container div that will hold the AJAX content for one of sidebar links.
It does not has any special styling other than padding and mainly padding from top because `.main-breadcrumb-bar` class is fixed.

We define this element as the main AJAX container when we initialize javatmp javascript when calling `index.init` method.
for AJAX life cycle activities and steps events it should be one and only one element selected using this name.

## JavaTMP Footer Layout
The class `.main-footer-bar` style main footer div which is fixed on desktop and large screen and relative on small devices and mobile.
The main SASS file for styling `.main-footer-bar` element is `./web/assets/src/sass/partials/footer.scss`
and it is imported in `./web/assets/src/sass/main.scss` file to be part of template main CSS file.

If you don't want a footer element at all, you can simply remove `.main-footer-bar` div and `footer.scss` file
and update `main.scss` file by removing import statement for `footer.scss`.

If you want to update `footer` by removing its fixed behavior, you can make the following changes:
*   Remove the following rules `bottom: 0;` and `position: fixed;` from `footer.scss` file for `.main-footer-bar` selector.
*   Optionally, remove `height` rule from `footer.scss` file for `.main-footer-bar` selector too
    if you don't want to force footer's height.
*   Update body styling in `base.scss` file by removing `padding-bottom` rule.

