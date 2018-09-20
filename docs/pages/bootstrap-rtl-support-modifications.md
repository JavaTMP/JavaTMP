---
title: Bootstrap RTL support and modifications
---
# Bootstrap RTL support and modifications

We used the idea of overriding classes and rules on `sass` folder
to produce RTL folder `sass-rtl`. As you will see shortly we copied sass folder
as is and provide another folder sass-rtl for overriding classes and tags
that need a directional modification to support RTL.

We used [Bootstrap reverse Plugin](https://github.com/JavaTMP/bootstrap-reverse "Bootstrap 4
RTL plugin to support RTL template and skin theme") for overriding core bootstrap classes
to support Right to Left directional behavior instead of left to right.

We copied and overrode from `./JavaTMP/*/web/assets/src/sass` only classes that need to be
flipped to support RTL and put them in `/JavaTMP/*/web/assets/src/sass-rtl`.
So we should reference both of them for the same part to support RTL as we'll see later.

The `./JavaTMP/*/web/assets/src/sass/common/variables.scss` file is still the central main variables file for LTR and RTL features.

The `main-rtl.scss` and its compiled version `main-rtl.min.css` file is the overriding
for `main.scss` and should be referenced after `main.min.css`.

For plugins we modified and add RTL modifications to custom LTR SASS version for the plugin,
because most Plugin RTL modification is a little and normally should be part of the plugin style itself.
keep in mind that most plugins support RTL by default.

Custom plugin RTL style rules are separated in `./JavaTMP/*/web/assets/src/sass-rtl/plugins-rtl`
for [Datatables plugin](https://datatables.net/ "Datatables Plugin")
because Datatables plugin does not provide support for RTL pages so we overrode some of its rules and classes in these files:
*   custom-dataTables.bootstrap4-rtl.scss
*   custom-datatables.net-responsive-bs4-rtl.scss
*   custom-datatables.net-select-bs4-rtl.scss

The following is a high level folder structures of our `sass` and `sass-rtl`:
```
./JavaTMP/JAVATMP-Static-Ajax,JAVATMP-Java-Ajax,JAVATMP-User-Starter
+---web (Web Application Context Root Folder)
    +---assets (Specific Template JS,CSS,fonts, and images folders and files)
        +---src (Source folder of the JS/CSS files)
            +---sass (Default SASS' SCSS source folders)
            +---sass-rtl (RTL specific classes and rules)
```

##`./JavaTMP/JavaTMP-Static-Ajax/web/index-rtl.html` file

The following list provides the main modifications applied for `index.html` to support RTL:
*   Modified `HTML` tag by adding `dir="rtl"` and `lang="en"`.
*   Reference `-rtl` version instead of normal one for javatmp style used:
    ```
    <link id="themeStyleSheet" href="assets/dist/css/javatmp-default-rtl.min.css" rel="stylesheet" type="text/css"/>
    ```
*   Added custom Javascript event handler for modifying dropdown's position. Because default behavior for popper.js is wrongly position it in RTL HTML pages with issues and problems.
*   Initialize JavaTMP Javascript by calling javatmp.init method and explicitly override the languages and directional attributes : `direction:"rtl"`,
`isRTL=true`, `floatDefault="right"`, and `floatReverse="left"`
    ```Javascript
    <script type="text/javascript">
        jQuery(function ($) {
            var defaults = {
                    floatDefault: 'right',
                    floatReverse: 'left',
                    direction: "rtl",
                    isRTL: true
                };
            index.init(defaults);
        });
    </script>
    ```
*   For more details information about custom plugins modifications and usages to support RTL and internationalization features kindly see our [Front-end Plugins And Frameworks documentation page](/pages/javatmp-front-end-plugins-and-frameworks "JavaTMP Front-end Plugins And Frameworks").
