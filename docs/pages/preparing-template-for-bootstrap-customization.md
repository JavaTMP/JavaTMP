---
title: Preparing Template for Bootstrap customization
---
# Preparing Template for Bootstrap customization
Backup `JavaTMP-Static-Ajax` project and apply the following steps before continuing:

*   In file `./web/assets/src/sass/common/variables.scss` and `BEFORE` the imports of required bootstrap SASS parts, add the following line `// --- override default bootstrap variables here` like this:
    ```
    ...
    // --- override default bootstrap variables here

    // Include Required parts of Bootstrap
    @import "../../../../../node\_modules/bootstrap/scss/functions";
    @import "../../../../../node\_modules/bootstrap/scss/variables";
    @import "../../../../../node\_modules/bootstrap/scss/mixins";
    ...
    ```
*   To Apply any new overriding variables of the above modification and reflected it to all project, you should un-comments the imports statements for Optional parts of Bootstrap in `./web/assets/src/sass/main.scss` like this:
```
    ...
    // Include Optional parts of Bootstrap
    // un-comment if you provide a customization for main bootstrap variables
    // in common/variables.scss file
    @import "../../../../node\_modules/bootstrap/scss/root";
    ... until last import of bootstrap sass part
    @import "../../../../node\_modules/bootstrap/scss/utilities";
    ...
```
*   Comment or remove reference for `bootstap.min.css` in `index.html` file as the bootstrap theme became inside `main.min.css` file:
```
    ...
    <!-- Bootstrap CSS -->
    <!--<link href="components/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>-->
    <!-- JavaTMP Main CSS files -->
    <link href="assets/css/main.min.css" rel="stylesheet"/>
    ...
```
*   Run gulp'task `sass` by invoking `gulp sass` command. or run default gulp'task by invoking `gulp` command that will run `sass` and `compress-js` and then watches for files change.
*   Now, you can customize and use Bootstrap Sass variables and reflect them immediately on the template.

For simple customization add the following line `$primary: #000;` In file `./web/assets/src/sass/common/variables.scss` after `// --- override default bootstrap variables here` and before `// Include Required parts of Bootstrap` lines: 
```
...
// --- override default bootstrap variables here
$primary: #000;

// Include Required parts of Bootstrap
@import "../../../../../node\_modules/bootstrap/scss/functions";
@import "../../../../../node\_modules/bootstrap/scss/variables";
@import "../../../../../node\_modules/bootstrap/scss/mixins";
...
```
Run gulp'task `sass` by invoking `gulp sass` command. or run default gulp'task by invoking `gulp` command that will run `sass` and `compress-js` and then watches for files change.

The following screen show you the output of the above customization:

![Black Bootstrap skin version](/assets/img/JavaTMP-Java-Bootstrap-Dashboard-Admin-Template-Simple-Customization.jpg)

#### Updating `$primary` variable

Updating `$primary` variable or `"primary"` key value will automatically update the $theme-colors("primary") which will update the following components: `.alert-primary, .badge-primary, .btn-primary, .btn-outline-primary, .list-group-item-primary, .table-primary, .bg-primary, .bg-gradient-primary, .border-primary, .text-primary.`

#### Introducing new `$theme-colors` entry

At the same way adding new entry to the `$theme-colors` map will automatically generate all above components for that key. for example the following customization add new entry to `$theme-colors` and keep everything else same:

*   Go to file `./JavaTMP-Static-Ajax/web/assets/src/sass/common/variables.scss`.
*   At comment `// --- override default bootstrap variables`, add the following line `$theme-colors: ("javatmp": #598234);` like this:
```
    ...
    // --- override default bootstrap variables here
    $theme-colors: ("javatmp": #598234);

    // Include Required parts of Bootstrap
    @import "../../../../../node\_modules/bootstrap/scss/functions";
    ...
```
*   Depending on your new color, sometime you need to adjust some Bootstrap components for new theme color so you should go to our main Sass file `./JavaTMP-Static-Ajax/web/assets/src/sass/main.scss` , and add your overriding CSS styling for adjusting components after the last import statement of Bootstrap Sass and before importing of the first JavaTMP Sass file. like this:
```
    ...
    @import "../../../../node\_modules/bootstrap/scss/utilities";

    // -- add HERE your overriding CSS styling for adjusting components.

    @import "partials/fonts.scss";
    ...
```
*   Run gulp command: `gulp sass` or default `gulp`

The above steps will introduce a new theme called `javatmp` with `#598234` color and generated the following new components or classes for that theme:`.text-javatmp, .bg-javatmp, .alert-javatmp, .badge-javatmp, .btn-javatmp, .btn-outline-javatmp, .list-group-item-javatmp, .table-javatmp, .bg-gradient-javatmp, .border-javatmp, .bg-gradient-javatmp`. The following photos show you new components:

![Customizing Bootstrap Theme Colors In JavaTMP Tempalte](//cdn.shopify.com/s/files/1/2570/3194/files/customize-bootstrap-theme-color-in-javatmp-1_1024x1024.JPG?v=1516090852)

![Customizing Bootstrap Theme Colors In JavaTMP Tempalte](//cdn.shopify.com/s/files/1/2570/3194/files/customize-bootstrap-theme-color-in-javatmp-2_1024x1024.JPG?v=1516090902)

![Customizing Bootstrap Theme Colors In JavaTMP Tempalte](//cdn.shopify.com/s/files/1/2570/3194/files/customize-bootstrap-theme-color-in-javatmp-3_1024x1024.JPG?v=1516090933)

![Customizing Bootstrap Theme Colors In JavaTMP Tempalte](//cdn.shopify.com/s/files/1/2570/3194/files/customize-bootstrap-theme-color-in-javatmp-4_1024x1024.JPG?v=1516090949)

So, at the same way you can update all Bootstrap Theme Colors or introduce a new set of different keys with their new components.

