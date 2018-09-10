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

The following HTML code provides you an overview of the `index.html` structure:
```html
<!doctype html>
<html lang="en">
    <head>...</head>
    <body class="sidebar-active"> <!-- 'longer-sidebar' class will activate longer sidebar -->
        <nav class="main-javatmp-navbar navbar fixed-top navbar-dark bg-primary my-0 py-0">...</nav>
        <div class="container-fluid">
            <div class="row">
                <div class="col-12 m-0 p-0">
                    <div class="sidebar">...</div>
                    <div class="main-content">
                        <div class="main-breadcrumb-bar d-flex flex-row">...</div>
                        <div class="main-body-content-container"></div>
                    </div>
                </div>
            </div>
        </div>
        <div class="main-footer-bar">...</div>
        <!-- JavaScript References --> ...
        <!-- custom style for sidebar menu search text field --> ...
        <!-- Embedded Javascript code for various parts of the template --> ...
    </body>
</html>
```
`head` element
--------------
`head` element contains `title`, `meta` tags, referenced stylesheets external files:
```html
<head>
    <title>JavaTMP - Java Bootstrap Admin and Dashboard Template</title>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link href="components/nprogress/nprogress.css" rel="stylesheet" type="text/css"/>
    <link href="assets/css/plugins/custom-nprogress.min.css" rel="stylesheet" type="text/css"/>

    <link href="components/jquery-ui/jquery-ui.min.css" rel="stylesheet" type="text/css"/>

    <!-- Bootstrap CSS -->
    <link href="components/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>

    <!-- JavaTMP Main CSS files -->
    <link href="assets/css/main.min.css" rel="stylesheet"/>

    <!-- main font family -->
    <link href="assets/css/font-family/font-family-en.min.css" rel="stylesheet" type="text/css"/>

    <!-- Plugins CSS followed by its customization file -->
    <link href="assets/css/plugins/custom-font-awesome.min.css" rel="stylesheet" type="text/css"/>
    <link href="components/font-awesome/web-fonts-with-css/css/fontawesome-all.min.css" rel="stylesheet" type="text/css" />
    <link href="components/font-awesome-animation/dist/font-awesome-animation.min.css" rel="stylesheet"/>
    <link href="components/metismenu/dist/metisMenu.min.css" rel="stylesheet" type="text/css"/>
    <link href="assets/css/plugins/custom-metisMenu.min.css" rel="stylesheet" type="text/css"/>
    <link href="components/malihu-custom-scrollbar-plugin/jquery.mCustomScrollbar.css" rel="stylesheet" type="text/css"/>
    <link href="assets/css/plugins/custom-jquery.mCustomScrollbar.min.css" rel="stylesheet" type="text/css"/>
    <link href="assets/css/plugins/custom-jQuery-ScrollUp.min.css" rel="stylesheet" type="text/css"/>
</head>
```
`.main-javatmp-navbar` element
------------------------------
The class `.main-javatmp-navbar` styles main navbar of JavaTMP which is fixed on top with `.fix-top` class with 51px height, so we styled the body to has a value of 51px for `padding-top` rule. There are no special styling for navbar other that the dropdown menu are spread wide on small screen like mobile devices. the following SASS file `./web/assets/src/sass/partials/navbar.scss` provides main styling for navbar.

`.sidebar` element
------------------
The class `.sidebar` styles main sidebar of JavaTMP which is Off-canvas fixed with sliding for main content on large screen and devices and on-canvas fixed on small screen and mobile devices or when the user press togger button on navbar which will activate auto show/hide off of sidebar on desktop and large screen only. The SASS file for styling sidebar is `./web/assets/src/sass/partials/sidebar.scss`,  JavaTMP's sidebar uses a CSS transition to show hide itself by sliding main content to right. The following CSS rules define the behavior of `.sidebar` element on all devices and screens:
```CSS
.sidebar {
    margin-left: -325px;
}
body.longer-sidebar .sidebar {
    top: 0;
}
body.sidebar-active .sidebar {
    margin-left: 0;
}
```
`.main-content` element
-----------------------
The `.main-content` div is a grouper for `.main-breadcrumb-bar` and `.main-body-content-container` classes, and shrink by `margin-left` rule when the fixed sidebar is active by class `.active` on the large screens and devices. The following CSS rules define the behavior of `.main-content` element on large screen in SASS file `./web/assets/src/sass/partials/base.scss`:
```
@media (min-width: 768px){
    body.sidebar-active .main-content {
        margin-left: 325px;
    }
}
```
`main-breadcrumb-bar` element
-----------------------------
The class `.main-breadcrumb-bar` styles main breadcrumb of JavaTMP which is fixed with shrink when sidebar is active on large screen and devices. The SASS file for styling .`main-breadcrumb-bar` is `./web/assets/src/sass/partials/breadcrumb.scss`, The following CSS rules define the behavior of `.main-breadcrumb-bar` on large screen and devices:
```
/\* on small screen and mobile devices \*/
.main-breadcrumb-bar {
        left: 0px;
 }
/\* on desktop devices and large screen \*/
@media (min-width: 768px) {
    body.sidebar-active .main-content > .main-breadcrumb-bar {
        left: 325px;
    }
}
```
`.main-body-content-container` element
--------------------------------------
The class `.main-body-content-container` style main AJAX container div that will hold the AJAX content for one of sidebar links. It does not has any special styling other than padding and mainly padding from top because `.main-breadcrumb-bar` class is fixed.

`.main-footer-bar` element
--------------------------
The class `.main-footer-bar` style main footer div which is fixed on desktop and large screen and relative on small devices and mobile. It is height about 34 pixels so we styled `body` element with padding from the bottom with 34 pixels too on large screen and desktop devices.