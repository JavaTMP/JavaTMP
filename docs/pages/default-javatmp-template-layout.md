---
title: JavaTMP Template Layout
---
# JavaTMP Template Layout
JavaTMP templates are an AJAX based Templates with fixed navbar, sidebar, breadcrumb, and footerbar. it is implemented in main html file `index.html` inside `web` folder.

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