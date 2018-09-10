---
title: Custom Bootstrap Themes and Skins
---
# Custom Bootstrap Themes and Skins
The JavaTMP versions come with default Bootstrap framework with its default styles and skin and we included `./web/components/bootstrap/dist/css/bootstrap.min.css` after copied it from `./node_modules/bootstrap/dist/css/bootstrap.min.css` when gulp's task `copy-components` runs. However, Because we use `SASS` as a css preprocessor in our templates and to support same Bootstrap style and theme for own parts and plugins of the JavaTMP templates we should use one of these options:

*   Use same Bootstrap values for colors, styles and format in our SASS files specially in `./web/assets/src/sass/common/variables.scss`.
*   Import Bootstrap SASS files and use bootstrap SASS variables in our styling and theme.

We chose option two and imported Bootstrap `SASS` files from `./node_modules/bootstrap/scss` to take advantage of variables, maps, mixins, and use its variables in our styling and theme, which gives us flexibility to override default bootstrap themes without touching original files and help us quickly apply third party SASS themes and customization built for Bootstrap as we will see soon.

Bootstrap SASS
--------------
As described in [the theming Bootstrap documentation](https://getbootstrap.com/docs/4.0/getting-started/theming/), We avoid modifying Bootstrap’s core files. For Sass, that means creating our own stylesheet that imports Bootstrap so you can modify and extend it. The following file structure for our `JavaTMP-Static-Ajax` project provides you the relative files for Bootstrap and main SASS files:
```
./JavaTMP/JavaTMP-Static-Ajax
├── web
    └── assets
        └── src
            └── sass
                ├── common
                    └── variables.scss
                ├── pages
                ├── partials
                ├── plugins
                └── main.scss
└── node\_modules/
    └── bootstrap
        ├── js
        └── scss
```
In our `variables.scss` and `main.scss` files, we'll import Bootstrap’s source Sass files and pick the parts we need. and because `variables.scss` file are shared by all other `SASS` files we put in it the required files:
```
// Include Required parts of Bootstrap
@import "../../../../../node\_modules/bootstrap/scss/functions";
@import "../../../../../node\_modules/bootstrap/scss/variables";
@import "../../../../../node\_modules/bootstrap/scss/mixins";
```
And in the `main.scss` we put  the remaining imports:
```
// Include Optional parts of Bootstrap
// un-comment if you provide a customization for main bootstrap variables
// in common/variables.scss file
/\*
@import "../../../../node\_modules/bootstrap/scss/root";
@import "../../../../node\_modules/bootstrap/scss/print";
@import "../../../../node\_modules/bootstrap/scss/reboot";
@import "../../../../node\_modules/bootstrap/scss/type";
@import "../../../../node\_modules/bootstrap/scss/images";
@import "../../../../node\_modules/bootstrap/scss/code";
@import "../../../../node\_modules/bootstrap/scss/grid";
@import "../../../../node\_modules/bootstrap/scss/tables";
@import "../../../../node\_modules/bootstrap/scss/forms";
@import "../../../../node\_modules/bootstrap/scss/buttons";
@import "../../../../node\_modules/bootstrap/scss/transitions";
@import "../../../../node\_modules/bootstrap/scss/dropdown";
@import "../../../../node\_modules/bootstrap/scss/button-group";
@import "../../../../node\_modules/bootstrap/scss/input-group";
@import "../../../../node\_modules/bootstrap/scss/custom-forms";
@import "../../../../node\_modules/bootstrap/scss/nav";
@import "../../../../node\_modules/bootstrap/scss/navbar";
@import "../../../../node\_modules/bootstrap/scss/card";
@import "../../../../node\_modules/bootstrap/scss/breadcrumb";
@import "../../../../node\_modules/bootstrap/scss/pagination";
@import "../../../../node\_modules/bootstrap/scss/badge";
@import "../../../../node\_modules/bootstrap/scss/jumbotron";
@import "../../../../node\_modules/bootstrap/scss/alert";
@import "../../../../node\_modules/bootstrap/scss/progress";
@import "../../../../node\_modules/bootstrap/scss/media";
@import "../../../../node\_modules/bootstrap/scss/list-group";
@import "../../../../node\_modules/bootstrap/scss/close";
@import "../../../../node\_modules/bootstrap/scss/modal";
@import "../../../../node\_modules/bootstrap/scss/tooltip";
@import "../../../../node\_modules/bootstrap/scss/popover";
@import "../../../../node\_modules/bootstrap/scss/carousel";
@import "../../../../node\_modules/bootstrap/scss/utilities";
\*/
```
That mean we imported Bootstrap `SASS` files but because we don't override any variables we don't include optional files and we should include main `bootstrap.min.css` that came with bootstrap package as we did in `index.html` file (Note That bootstrap folder was moved from `./node_modules` to `./web/components` folder by our gulp's task called `"copy-components"`):
```
...
<!-- Bootstrap CSS -->
<link href="components/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>

<!-- JavaTMP Main CSS files -->
<link href="assets/css/main.min.css" rel="stylesheet"/>
...
```
Why did we separate the imports statement of Bootstrap SASS files ?
-------------------------------------------------------------------

Because in `JavaTMP-Static-Ajax` project we provided separate `CSS` files for pages and custom plugins to let you choose what are suitable for you instead of merging them, so you can pick your needed plugins and leave others. However, if you want to provide custom style for bootstrap you should override yours in `variables.scss` file and uncomment the import statements for Bootstrap SASS files in `main.scss` and finally remove the reference for `boostrap.min.css` file in `index.html` as it becomes included in `main.min.css` file. 

Customizing `JavaTMP-Static-Ajax` Project
-----------------------------------------

We are going to show you different ways to customize and utilize our SASS files to provide desired style and theme.

### Customize own JavaTMP-Static-Ajax style variables

In global `JavaTMP-Static-Ajax` SASS variable file `./web/assets/src/sass/common/variables.scss` we defined general variables that were used on all other pages and plugins SASS files and changing these values do not effect on the bootstrap main styling so we could keep the reference for bootstra.min.css on index.html:
```
$default-sidebar-width: 325px;
$javatmp-primary-color: $primary;
$javatmp-primary-color-dark: darken($javatmp-primary-color, 7.5%);
$javatmp-secondary-bg: $gray-100;
$javatmp-secondary-text-gray: $gray-600;
$javatmp-secondary-text: $gray-900;
$javatmp-secondary-border: $gray-400;
```
For simple customization,  change the `$default-sidebar-width` variable's value to `500px` instead of `323px` and save the file and then run gulp'task `sass` by invoking `gulp sass` command. or run default gulp'task by invoking `gulp` command that will run `sass` and `compress-js` and then watches for files change.

### Customize JavaTMP-Static-Ajax by updating Bootstrap variables

To customize JavaTMP and provide a different style for All project we show you a simple changes to update `primary` color of the project from default Bootstrap value `#007bff` to `#ff420e`

Steps to customize JavaTMP-Static-Ajax Project:

*   In file `./web/assets/src/sass/common/variables.scss` and `BEFORE` the imports of required bootstrap SASS parts, add the following line `$primary: #ff420e;` like this:
```
    ...
    $primary: #ff420e;

    // Include Required parts of Bootstrap
    @import "../../../../../node\_modules/bootstrap/scss/functions";
    @import "../../../../../node\_modules/bootstrap/scss/variables";
    @import "../../../../../node\_modules/bootstrap/scss/mixins";
    ...
```
*   To Apply the above new color for primary and reflected it to all project, you should un-comments the imports statements for Optional parts of Bootstrap in `./web/assets/src/sass/main.scss` like this:
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

The output of above customization is:

![Customize JavaTMP- Bootstrap Admin And Dashboard Template](/assets/img/customize-javatmp-java-bootstrap-admin-dashboard-tempate.jpg)

### Customize JavaTMP-Static-Ajax by standard third-party Bootstrap themes

In this section we show you some examples of how you could customize `JavaTMP-Static-Ajax` by utilizing third-party Bootstrap themes from many sources:

#### Bootswatch [https://bootswatch.com/](https://bootswatch.com/)

[Bootswatch site](https://bootswatch.com/) provides a lot of free themes for Bootstrap 4 that are easy to install and customize, In this section we show you how to use two of those themes which are Cerulean and Superhero themes.

##### Utilizing Cerulean theme

Steps to apply Cerulean theme:

*   In file `./web/assets/src/sass/common/variables.scss` and `BEFORE` the imports of required bootstrap SASS parts, add the contents of `https://bootswatch.com/4/cerulean/_variables.scss` file, like this:
```
    ...
    //==> Here Add Content of https://bootswatch.com/4/cerulean/\_variables.scss
    // Include Required parts of Bootstrap
    @import "../../../../../node\_modules/bootstrap/scss/functions";
    @import "../../../../../node\_modules/bootstrap/scss/variables";
    @import "../../../../../node\_modules/bootstrap/scss/mixins";
    ...
```
*   To Apply the above new color for primary and reflected it to all project, you should un-comments the imports statements for Optional parts of Bootstrap in `./web/assets/src/sass/main.scss` like this:
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
*   In `./web/assets/src/sass/main.scss`, After importing last part of Bootstrap optional parts and before our import for `@import "partials/fonts.scss";` add content of `https://bootswatch.com/4/cerulean/_bootswatch.scss`, like this:
```
    ...
    @import "../../../../node\_modules/bootstrap/scss/utilities";

    //==> Here Add Content of https://bootswatch.com/4/cerulean/\_bootswatch.scss

    @import "partials/fonts.scss";
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

##### Utilizing Superhero theme

As the same steps we did for applying Cerulean we use for Superhero and instead of contents of
`https://bootswatch.com/4/cerulean/_variables.scss` and
`https://bootswatch.com/4/cerulean/_bootswatch.scss`
files we use the contents of the following files
`https://bootswatch.com/4/superhero/_variables.scss`
`https://bootswatch.com/4/superhero/_bootswatch.scss`

So, you can utilize and update any variable you want and adjust width and height.

#### Bootstrap Magic [https://pikock.github.io/bootstrap-magic/](https://pikock.github.io/bootstrap-magic/)

Bootstrap Magic is an online Bootstrap SASS editor help you create your Bootstrap 4.0 themes easily which provides you a live preview,
live HTML coding to help you create your Bootstrap 4.0 theme directly in your browser. So you could design and apply your modifications
and then save variables sass file and import it to JavaTMP projects using one of the above methods.
