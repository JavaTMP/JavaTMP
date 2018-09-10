---
title: Extended Bootstrap Colors And Buttons
---
# Extended Bootstrap Colors And Buttons
We extended Bootstrap Colors and Buttons by adding more separate colors classes and then use them to generate more buttons with its colors. The SASS file `./web/assets/src/sass/common/colors-variables.scss` provides SASS map contains extended color names and value codes.

JavaTMP Extended Color Classes
------------------------------

We generated a separate compiled CSS file from the following SASS file ./web/assets/src/sass/pages/color-classes-utils.scss that use the above colors-variables.scss file like this:
```
@import "../common/variables.scss";
@import "../common/colors-variables";

@mixin createTextColorClass($selector, $colorValue) {
    .text-#{$selector} {
        color: $colorValue;
    }
    .bg-#{$selector} {
        background-color: $colorValue;
    }
}

@each $colorKey, $colorValue in $colorsMap {
    @include createTextColorClass($colorKey, map-get($colorValue, base));
}
```
The compiled file from above SASS file is `./web/assets/css/pages/color-classes-utils.min.css` which contains two classes for each map's key `.cl-` and `.bg-` one for color and other for background-color. The following online demo pages show you those colors:

[JavaTMP Color Palette Combinations Online Demo Page](http://demo.javatmp.com/JavaTMP-Static-Ajax/index.html#pages/custom-components/color/color-palette-combinations.html "JavaTMP Color Palette Combinations Online Demo Page")

[JavaTMP 100 Colors Combinations Online Demo Page](http://demo.javatmp.com/JavaTMP-Static-Ajax/index.html#pages/custom-components/color/100-color-combinations.html "JavaTMP 100 Colors Combinations Online Demo Page")

JavaTMP Extended Colors Button Classes
--------------------------------------

The same colorsMap SASS object above used to generate extended color button classes too, The following SASS file `./web/assets/src/sass/pages/extended-buttons-color.scss` generate extended button classes:
```
@import "../common/variables.scss";
@import "../common/colors-variables";

@each $colorKey, $colorValue in $colorsMap {
    .btn-#{$colorKey} {
        @include button-variant(map-get($colorValue, base), map-get($colorValue, base));
    }
}

@each $colorKey, $colorValue in $colorsMap {
    .btn-outline-#{$colorKey} {
        @if $colorKey == "light" {
            @include button-outline-variant(map-get($colorValue, base), $gray-900);
        } @else {
            @include button-outline-variant(map-get($colorValue, base), map-get($colorValue, base));
        }
    }
}
```
So for each color in colorsMap SASS's map we create two button normal button and outline one. We used native Bootstrap mixin from `./node_modules/bootstrap/scss/mixins/_buttons.scss` that was imported in `./web/assets/src/sass/common/variables.scss` file.

The generated compiled CSS file for extended buttons is `./web/assets/css/pages/extended-buttons-color.min.css` and the following JavaTMP Online demo show you JavaTMP Extended Color Buttons:

[JavaTMP Extended Color Buttons Online Demo Page](http://demo.javatmp.com/JavaTMP-Static-Ajax/index.html#pages/custom-components/extended-color-button.html "JavaTMP Extended Color Buttons Online Demo Page")

[JavaTMP Extended Color Outline Buttons Online Demo Page](http://demo.javatmp.com/JavaTMP-Static-Ajax/index.html#pages/custom-components/extended-color-outline-button.html "JavaTMP Extended Color Outline Buttons Online Demo Page")
