---
title: JavaTMP Main Content Layout
---
# JavaTMP Main Content Layout
The `.main-content` div is a grouper for `.main-breadcrumb-bar` and `.main-body-content-container` classes, and shrink by `margin-left` rule when the fixed sidebar is active by class `.active` on the large screens and devices. The following CSS rules define the behavior of `.main-content` element on large screen in SASS file `./web/assets/src/sass/partials/base.scss`:
```
@media (min-width: 768px){
    body.sidebar-active + .main-content {
        margin-left: 325px;
    }
}
```
`main-breadcrumb-bar` element
-----------------------------
The class `.main-breadcrumb-bar` styles main breadcrumb of JavaTMP which is fixed with shrink when sidebar is active on large screen and devices. The SASS file for styling .`main-breadcrumb-bar` is `./web/assets/src/sass/partials/breadcrumb.scss`, The following CSS rules define the behavior of `.main-breadcrumb-bar` on large screen and devices:
```
/* on small screen and mobile devices */
body.mouse-auto-show.sidebar-active .main-content > .main-breadcrumb-bar {
        left: 0px;
 }
/* on desktop devices and large screen */
@media (min-width: 768px) {
    body.sidebar-active .main-content > .main-breadcrumb-bar {
        left: 325px;
    }
}
```
`.main-body-content-container` element
--------------------------------------
The class `.main-body-content-container` style main AJAX container div that will hold the AJAX content for one of sidebar links. It does not has any special styling other than padding and mainly padding from top because `.main-breadcrumb-bar` class is fixed.

We define this element as the main AJAX container when we initialize javatmp javascript when calling `javatmp.init` method. for AJAX life cycle activities and steps events it should be one and only one element selected using this name.
