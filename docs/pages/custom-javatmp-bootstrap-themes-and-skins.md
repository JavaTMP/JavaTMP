---
title: Custom JavaTMP Bootstrap Themes and Skins
---
# {{ page.title }}
The Main JavaTMP SASS file `./web/assets/src/sass/main.scss` included 
`./node_modules/bootstrap/scss/bootstrap` to apply its style to Bootstrap and all plugins and layouts.
However, Because we use `SASS` as a css preprocessor in our templates and to support same Bootstrap style and theme for own parts
and plugins of the JavaTMP templates we should use one of these options:
*   Use same Bootstrap values for colors, styles and format in our SASS files specially in `./web/assets/src/sass/common/variables.scss`.
*   Import Bootstrap SASS files and use bootstrap SASS variables in our styling and theme.

We chose option two and imported Bootstrap `SASS` files from `./node_modules/bootstrap/scss` to take advantage of variables,
maps, mixins, and use its variables in our styling and theme, which gives us flexibility to override default bootstrap themes
without touching original files and help us quickly apply third party SASS themes and customization built for Bootstrap
as we will see soon.

## Bootstrap SASS
As described in [the theming Bootstrap documentation](https://getbootstrap.com/docs/4.1/getting-started/theming/),
We avoid modifying Bootstrap’s core files. For Sass, that means creating our own stylesheet that imports Bootstrap
so you can modify and extend it. The following file structure for our `JavaTMP-Static-Ajax` project provides you the relative files
for Bootstrap and main SASS files:
```
./JavaTMP/JavaTMP-Static-Ajax
├── web
    └── assets
        ├── dist
        └── src
            └── sass
                ├── common
                    └── variables.scss
                ├── partials
                ├── plugins
                ├── themes
                    └── javatmp-default.scss
                └── main.scss
            └── sass-rtl
                ├── common
                    └── variables.scss
                ├── partials-rtl
                ├── plugins-rtl
                ├── themes-rtl
                    └── javatmp-default-rtl.scss
                └── main-rtl.scss
└── node_modules/
    └── bootstrap
        ├── js
        └── scss
```
In our `variables.scss` and `main.scss` files, we'll import Bootstrap’s source Sass files and pick the parts we need.
and because `variables.scss` file are shared by all other `SASS` files we put in it the required Bootstrap files Only:
```
// Include Required parts of Bootstrap
@import "../../../../../node_modules/bootstrap/scss/functions";
@import "../../../../../node_modules/bootstrap/scss/variables";
@import "../../../../../node_modules/bootstrap/scss/mixins";
```
And in the `main.scss` we could put the remaining imports but for simplicity we include main bootstrap theme file:
```
/*!************************************
Include original Bootstrap SCSS file
***************************************/
@import "../../../../../node_modules/bootstrap/scss/bootstrap";
...
```

Make sure to run gulp'task `generate-dist` or default after any change on the sass or js files.

### SASS Files Map for customizations
You could directly apply your style changes on:
- `./web/assets/src/sass/themes/javatmp-*.scss`. Global Styling on specific themes.
- `./web/assets/src/sass/themes/javatmp-default.scss`. Global Styling on all themes.
- `./web/assets/src/sass/main.scss`. Global Styling on all themes.
- `./web/assets/src/sass/common/variables.scss`. Global variables Styling on all effecting all files.
- `./web/assets/src/sass/partials/*`. Specific JavaTMP template layout.
- `./web/assets/src/sass/plugins/*`. Specific Plugins styles.

### Customize JavaTMP-Static-Ajax by standard third-party Bootstrap themes

In this section we show you some examples of how you could customize `JavaTMP-Static-Ajax` by utilizing third-party Bootstrap
themes from many sources:

#### Bootswatch [https://bootswatch.com/](https://bootswatch.com/)
[Bootswatch site](https://bootswatch.com/) provides a lot of free themes for Bootstrap 4 that are easy to install and customize,
And we support all of their themes in our templates. Kindly see the following folders for more details:
- `./web/assets/src/sass/themes`
- `./web/assets/src/sass/themes-rtl`

#### Bootstrap Magic [https://pikock.github.io/bootstrap-magic/](https://pikock.github.io/bootstrap-magic/)
Bootstrap Magic is an online Bootstrap SASS editor help you create your Bootstrap 4.0 themes easily which provides you a live preview,
live HTML coding to help you create your Bootstrap 4.0 theme directly in your browser. So you could design and apply your modifications
and then save variables sass file and import it to JavaTMP projects using one of the above methods.
