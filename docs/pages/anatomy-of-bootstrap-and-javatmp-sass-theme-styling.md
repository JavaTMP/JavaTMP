---
title: Anatomy Of Bootstrap And JavaTMP SASS Theme Styling
---
# Anatomy Of Bootstrap And JavaTMP SASS Theme Styling

In this page, we are going to discuss the use of Bootstrap 4 SASS variables for customizing our JavaTMP HTML pages and plugins styling. SASS stands for Syntactically Awesome Stylesheet. It is a CSS pre-processor which helps in the reduction of the repetition with CSS that ultimately saves our time. In order to customize variables, we need to override a variable’s value and recompile and apply the Bootstrap variables on JavaTMP template we should use exact variables on custom plugins CSS styling file to provide consistent theme for main template and all of its plugins.

Note that we will focus our discussion for using Bootstrap Sass variables to apply standard style for our JavaTMP themes more than customizing bootstrap itself.

[Quick SASS guide](http://sass-lang.com/guide "Online Basic Quick Quide for SASS pre-processor") provides an online quick guide for Sass preprocessor. It is a good idea to see it.

Bootstrap SASS
--------------

The Bootstrap SASS files came with Bootstrap distribution downloaded using node.js's npm command. They are reside in the `./node_modules/bootstrap/scss`. The main Sass file for Bootstrap v4.0.0 framework is `./node_modules/bootstrap/scss/bootstrap.scss` which contains import statements for other Sass files in the same folder like most important files: `./node_modules/bootstrap/scss/_variables.scss` and `./node_modules/bootstrap/scss/_mixins.scss`.

The main SASS file for Bootstrap global styling variables is `./node_modules/bootstrap/scss/_variables.scss`. and we imported it in `./web/assets/src/sass/common/variables.scss` file, So we can override and use its values in our JavaTMP and plugins CSS styling files.

Refer to [Official Online Bootstrap Theme Documentation Page](https://getbootstrap.com/docs/4.0/getting-started/theming/ "Official Online Bootstrap Theme Documentation Page") for quick information about Bootstrap Sass.

[Bootstrap Magic](https://pikock.github.io/bootstrap-magic/ "online visual customization editor for Bootstrap") provides an online editor and visualization for Bootstrap SASS variables file. It is a good idea to see it and use it if you want any online visual customization editor for Bootstrap.

Bootstrap uses the following construct for any variable's name `$component-state-property-size` for consistent naming. For examples: `$component-active-color, $component-active-bg, $font-size-lg, $table-bg, $table-dark-border-color, $input-btn-padding-y-sm`.

You can override Bootstrap Sass variables by defining the variable before referencing `variables.scss` file above, because every Sass variable in Bootstrap 4 includes the `!default` flag allowing you to override the variable’s default value in your own Sass without modifying Bootstrap’s source code. Copy and paste variables as needed, modify their values, and remove the `!default` flag. If a variable has already been assigned, then it won’t be re-assigned by the default values in Bootstrap.

### Anatomy Of `./node_modules/bootstrap/scss/_functions.scss` file

Bootstrap utilizes several Sass functions, but only a subset are applicable to general theming. They've included three functions for getting values from the `$colors` , `$theme-colors` , and `$grays` color maps and another function for getting a particular level of color from the `$theme-colors` map. The following link provides you a [quick description for the Bootstrap functions available in \_functions.scss file](https://getbootstrap.com/docs/4.0/getting-started/theming/#functions "quick description for the Bootstrap functions available in _functions.scss file").

### Anatomy Of `./node_modules/bootstrap/scss/_variables.scss` file

It is The main SASS file for Bootstrap global styling variables and we imported it in `./web/assets/src/sass/common/variables.scss` file, So we can override and use its values in our JavaTMP and plugins CSS styling files. Remember that Bootstrap uses the following construct for any variable's name `$component-state-property-size` for consistent naming.

#### Default Colors Variables

The Bootstrap variables file starts by defining default values for color system with variables' names reflect its values and overriding those values in our `./web/assets/src/sass/common/variables.scss` file will quickly apply the changes to all Bootstrap Framework, But sometimes put you in semantic errors if you change the values of the color's name for completely different colors. Instead, it is better to use different value or variable, For example the `$white` variable in Bootstrap Sass is used for `$body-bg` and if you want to change the background color of the body change the value for `$body-bg`.

#### Bootstrap Colors

Bootstrap defines all standard theme colors in variables with corresponding name convention that reflect the color chose and these colors are used currently for assigning a value for other important theme colors

#### Theme colors

These are the most important colors in Bootstrap and it is used to construct components styling colors:
```scss
$primary:       $blue !default;
$secondary:     $gray-600 !default;
$success:       $green !default;
$info:          $cyan !default;
$warning:       $yellow !default;
$danger:        $red !default;
$light:         $gray-100 !default;
$dark:          $gray-800 !default;

$theme-colors: () !default;
$theme-colors: map-merge((
  "primary":    $primary,
  "secondary":  $secondary,
  "success":    $success,
  "info":       $info,
  "warning":    $warning,
  "danger":     $danger,
  "light":      $light,
  "dark":       $dark
), $theme-colors);
```
So, Updating one of them or all will automatically update all other components and classes that use them. and extending `$them-colors` map by adding new key/value in `$them-colors` will automatically create a component with that key as we see next.

#### `$theme-color-interval` variable

Bootstrap uses `$theme-color-interval` in `theme-color-level` function in `./node_modules/bootstrap/scss/_functions.scss` Sass file to get a particular level of color from the `$theme-colors` map. The following definition of `theme-color-level` function:
```
...
// Request a theme color level
@function theme-color-level($color-name: "primary", $level: 0) {
  $color: theme-color($color-name);
  $color-base: if($level > 0, #000, #fff);
  $level: abs($level);

  @return mix($color-base, $color, $level \* $theme-color-interval);
}
```
So, Negative level values will lighten the color, while higher levels will darken and this function is called mainly in three locations to automatically generate a color for Alert, list-group-item and  table-row variants. In our example above when we introduce javatmp theme color with `#598234`. bootstrap assign different values for alert-javatmp, list-group-item-javatmp, table-javatmp background,border and text colors.

Note that the mix function that is used above in `theme-color-level` function is Sass build-in function and the following external link provide you more information about it: [Sass mix build-in Function Documentation Page](http://sass-lang.com/documentation/Sass/Script/Functions.html#mix-instance_method "Sass mix build-in Function Documentation Page")

#### Color contrast

Bootstrap uses the following variables:
```
// The yiq lightness value that determines when the lightness of color changes from "dark" to "light". Acceptable values are between 0 and 255.
$yiq-contrasted-threshold: 150 !default;

// Customize the light and dark text colors for use in our YIQ color contrast function.
$yiq-text-dark: $gray-900 !default;
$yiq-text-light: $white !default;
```
To manage the color contrast function called `color-yiq`. It utilizes the YIQ color space to automatically return a `$yiq-text-light` or `$yiq-text-dark` color based on the specified base color. This function is especially useful for mixins or loops where you’re generating multiple classes. For example Bootstrap uses it to dynamically generate the text color of a button based on background color. The following photo show you a subset of JavaTMP extended buttons and how Bootstrap define the color value of the button's text:

![Bootstrap Extended Buttons with dynamic Text color based on Background color](/assets/img/Bootstrap-extended-buttons.jpg)

The definition of `color-yiq` function is reside in `./node_modules/bootstrap/scss/_functions.scss`.

#### Bootstrap Sass options

Bootstrap uses the following variables to globally modify styling by enabling or disabling optional features:
```
$enable-caret:              true !default; // Enables pseudo element caret on .dropdown-toggle.
$enable-rounded:            true !default; // Enables predefined border-radius styles on various components.
$enable-shadows:            false !default; // Enables predefined box-shadow styles on various components.
$enable-gradients:          false !default; // Enables predefined gradients via background-image styles on various components.
$enable-transitions:        true !default; // Enables predefined transitions on various components.
$enable-hover-media-query:  false !default; // Deprecated, no longer affects any compiled CSS
$enable-grid-classes:       true !default; // Enables the generation of CSS classes for the grid system (e.g., .container, .row, .col-md-1, etc.).
$enable-print-styles:       true !default; // Enables styles for optimizing printing.
```
#### Bootstrap Body variables

Bootstrap uses the following two important global variables that will use in body and some components elements:
```
$body-bg:    $white !default;
$body-color: $gray-900 !default;
```
remember that bg stand for background, So the default Bootstrap color for body background is `$white` and body text color is `$gray-900`.

#### Bootstrap Links variables

Bootstrap uses the following variables to control the style of link and anchor elements:
```
$link-color:            theme-color("primary") !default;
$link-decoration:       none !default;
$link-hover-color:      darken($link-color, 15%) !default;
$link-hover-decoration: underline !default;
```
So Bootstrap use custom theme-color function to get the color value of primary. So you update the key of assign a different color value for link and you can use those variables in your custom style and plugins. Remember that the darken function is a [Build-in Sass function](http://sass-lang.com/documentation/Sass/Script/Functions.html "Build-in Sass function") that you can read more about [here](http://sass-lang.com/documentation/Sass/Script/Functions.html#darken-instance_method "Build-in Sass function").

#### Bootstrap Paragraph Variable

Bootstrap uses the following variable to set a bottom margin for paragraph element `<p>`:
```
$paragraph-margin-bottom: 1rem !default;
```
And it is mainly used in `./node_modules/bootstrap/scss/_reboot.scss`.

#### Bootstrap Grid Breakpoints

Bootstrap primarily uses the following $grid-breakpoints map to define the minimum dimensions at which layout, grid system, and components will change, adapting to different screen sizes, for use in media queries:
```
$grid-breakpoints: (
  xs: 0,
  sm: 576px,
  md: 768px,
  lg: 992px,
  xl: 1200px
) !default;
```
Since Bootstrap is developed to be mobile first, It use a handful of media queries to create sensible breakpoints for its layouts and interfaces. These breakpoints are mostly based on minimum viewport widths and allow them to scale up elements as the viewport changes. Bootstrap provides the following important mixins `media-breakpoint-up` and `media-breakpoint-down` to deal with the above `$grid-breakpoints` map and generate desired media queries in `./node_modules/bootstrap/scss/mixins/_breakpoints.scss` Sass file.

You can use those mixins like this:
```
@include media-breakpoint-up(xs) {
    .some-class {
        display: block;
    }
}
@include media-breakpoint-down(xs) {
    .some-class {
        display: block;
    }
}
```
And the generated CSS will be like this:
```
@media (min-width: 576px) {
    .some-class {
        display: block;
    }
}
@media (max-width: 575.99px) {
    .some-class {
        display: block;
    }
}
```

