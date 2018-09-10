---
title: Bootstrap RTL support and modifications
---
# Bootstrap RTL support and modifications
`JavaTMP-Static-Ajax-RTL` project is a mirror copy from `JavaTMP-Static-Ajax` project with a little modifications to support RTL. It consists of general static bootstrap RTL admin and dashboard components template. Our [online RTL demo](http://demo.javatmp.com/JavaTMP-Static-Ajax-RTL/ "Java Bootstrap RTL Admin And Dashboard Components Template") deploys and host this version of JavaTMP.

JavaTMP-Static-Ajax-RTL is a front-end static project that intended to provide demo pages for all plugins and frameworks used separately and in isolation level. it is a base for remaining versions like Java, starter and it is a [Netbeans IDE 8.2](https://netbeans.org/ "Netbeans IDE") project, so you can directly import and open it there.

`JavaTMP-Static-Ajax-RTL` project is not intended to start your custom project from. it is provided to let you test and see various RTL features and user interface components used in remaining projects.

`./JavaTMP/JavaTMP-Static-Ajax-RTL/web/index.html` file
-------------------------------------------------------

The following list provides the main modifications applied for `index.html` to support RTL:

*   Modified `HTML` tag by adding `dir="rtl"` and `lang="en"`.
*   Reference `[bootstrap-reverse plugin](https://github.com/JavaTMP/bootstrap-reverse "Bootstrap RTL plugin")` after main `bootstrap.min.css` file:
```
    <!-- Bootstrap CSS -->
    <link href="components/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <!-- Bootstrap RTL CSS -->
    <link href="components/bootstrap-reverse/dist/bootstrap-reverse.min.css" rel="stylesheet" type="text/css"/>
```
*   Reference main JavaTMP RTL CSS file `assets/css/main-rtl.min.css` after `assets/css/main.min.css` file, that override some style rules and classes and generated from compiling `assets/src/sass-rtl/main-rtl.scss` file, like this:
```
    <!-- JavaTMP Main CSS files -->
    <link href="assets/css/main.min.css" rel="stylesheet"/>
    <!-- JavaTMP Main RTL CSS files -->
    <link href="assets/css/main-rtl.min.css" rel="stylesheet" type="text/css"/>
```
*   Modify custom style for sidebar menu search `textfield` to make the clear icon shown on left when user starts typing.
*   Added custom Javascript event handler for modifying dropdown's position. Because default behavior for popper.js is wrongly position it in RTL HTML pages with issues and problems.
*   Initialize JavaTMP Javascript by calling javatmp.init method and explicitly override the languages and directional attributes : `direction:"rtl"`, `isRTL=true`, `floatDefault="right"`, and `floatReverse="left"`
*   For more details information about custom plugins modifications and usages to support RTL and internationalization features kindly see our [Front-end Plugins And Frameworks documentation page](/pages/javatmp-front-end-plugins-and-frameworks "JavaTMP Front-end Plugins And Frameworks").
