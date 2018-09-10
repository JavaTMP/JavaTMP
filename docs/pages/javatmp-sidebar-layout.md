---
title: JavaTMP Sidebar Layout
---
# JavaTMP Sidebar Layout
The main navbar of JavaTMP template is fixed on top using native bootstrap `.fix-top` class, so we styled the body to have a value of 51px for padding-top rule.

Main features of JavaTMP navbar:

*   Wider fixed on top navbar above the fixed sidebar.
*   Fixed on top next to fixed sidebar when `body.longer-sidebar` activated.

The class `.main-javatmp-navbar` styles main navbar of JavaTMP template and the SASS file for styling navbar and `.main-javatmp-navbar` located in `./web/assets/src/sass/partials/navbar.scss`

The main navbar element `.main-javatmp-navbar` of The template consists of three main elements:

*   `.navbar-brand` which is a link to demo home page with template name.
*   `.nav` with `.main-navbar-menu` which is a native bootstrap nav providing left navbar menu bar.
*   `.navbar-toggler` which is a `button` styled using native bootstrap `.navbar-toggler` class and used for showing/hiding sidebar by sliding it.

For simplicity and template consistent we styled `.main-javatmp-navbar` with `flex-wrap: nowrap` so the complete `.navbar` will stay same for all devices and screen sizes but we hide some element to accommodate screen sizes.

`.navbar-brand` element
-----------------------

The navbar brand element is a simple link to demo home page with text only.

`.nav.main-navbar-menu` element
-------------------------------

The `.nav` menu bar was not enclosed by `div.collapse.navbar-collapse` so it will stay same on mobile devices and small screen. It consists of set of nav-item to provide languages, messages, tasks and alerts dropdowns. Note that those dropdowns are static only and do not provide any functionalities and it is just exist to show you style for them. The main two modifications for bootstrap normal dropdown menu are `.mega-on-sm` and `.dropdown-menu-extender` classes.

*   `.mega-on-sm` class applied to `.nav-item.dropdown` element and it makes the element's position static and its child `.dropdown-menu` stretch wide on small screen and mobile devices by the following CSS ruls in `./web/assets/src/sass/partials/navbar.scss`:
    ```
    .main-javatmp-navbar {
        ...
        .main-navbar-menu {
            ...
            > .dropdown {
                ...
                @media (max-width: 768px) {
                    &.mega-on-sm {
                        position: static;
                        > .dropdown-menu {
                            width: 100%;
                            left: 0;
                            right: 0;
                        }
                    }
                }
            }
        }
    }
    ```
*   `.dropdown-menu-extender` class which applied to `.dropdown-menu` element to extends it to support header, footer and fixed height content elements for `.dropdown-menu`. It is styling located in `./web/assets/src/sass/pages/dropdown-menu-extender.scss` SASS file.

`.navbar-toggler` element
-------------------------

It is simply a `button` styled using native bootstrap `.navbar-toggler` class and used for showing/hiding sidebar by sliding it using `click` event on `.sidebar-toggler-button` class, The following Javascript code shows you the click's event handler on `.sidebar-toggler-button` in `./web/assets/src/js-src/javatmp.js` file:
```
...
// listen of click event of main navbar-toggler button in navbar.
$(".sidebar-toggler-button").on("click", function () {
    var originalButton = this;
    $(originalButton).prop('disabled', true);
    // we manually collapse sidebar:
    if ($('body').hasClass("sidebar-active")) {
        $("body").removeClass("sidebar-active");
        // activate mouse on desktop and large devices:
        if (!javatmp.isWidthSmall()) {
            $("body").addClass("mouse-auto-show");
            // just in case:
            $(window).off('mousemove', handlingMouseMove);
            $(window).on('mousemove', handlingMouseMove);
        }
    } else {
        $("body").addClass("sidebar-active");
        // disabled auto show on mouse move
        $("body").removeClass("mouse-auto-show");
        $(window).off('mousemove', handlingMouseMove);
    }
});
...
```
And the following HTML code defines .navbar-toggler  button:

<button class="navbar-toggler sidebar-toggler-button py-0 ml-1" type="button">
    <span class="navbar-toggler-icon"></span>
</button>

Although we use native bootstrap `.navbar-toggler` and `.navbar-toggler-icon` classes, it is not mandatory as this `button` is not used with bootstrap collapsible plugin and for custom styling you can remove or provide specific styling for it.

Note that we show `.navbar-toggler` button on all devices and screen sizes, so if you want to hide it on large screens and desktop devices you can add `.navbar-expand-lg` class to `nav.main-javatmp-navbar.navbar` element, but keep in mind that it will do nothing if you provide custom styling and remove `.navbar-toggler` class.
