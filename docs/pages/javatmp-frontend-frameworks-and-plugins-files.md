---
title: JavaTMP Front-end Frameworks And Plugins Files
---
# JavaTMP Front-end Frameworks And Plugins Files
The JavaTMP Front-end frameworks and plugins consist of the libraries used in the front-end part of the template like jQuery,
Bootstrap and it is first stored separately in `./web/components` folder with all its Javascript, CSS, and images files.
Before it is moved and merged to appropriate files in `./web/assets/dist` using gulp's task `generate-dist`.
Then, it deleted when gulp's task `generate-dist` finishes running.

Keep in mind that these plugins and frameworks are different than the custom JS/CSS files specifically used in the template,
which are stored in `./web/assets/src/` folder and moved and merged to `./web/assets/dist` too using same gulp's task.

We manage our front-end dependencies using Node NPM and gulp so the folder `./web/components`
are dynamically generated when we run the gulp's task `copy-components`.
Read more about our [Gulp build file](/pages/gulp-build-file) and
[managing front-end dependencies using Node.js And Gulp](/pages/manage-front-end-dependencies-using-node-js-and-gulp).

Please see the complete list of front-end jquery and bootstrap libraries we used in our template in the following page:
[JavaTMP Front-end Plugins And Frameworks](/pages/javatmp-front-end-plugins-and-frameworks).

## Plugins in Projects
After we downloaded front-end plugins using Node's `npm` command , We copied only needed files like dist folder and images
as defined in `config.plugins` in gulp's task `copy-components` from `./node_modules` to `./web/components`
and then we merge them as defined `src.css`/`src.js` keys in gulp's task `generate-dist`.
So it is your responsibilities to decide which plugins you need and if you want to merge them in one large js or css files.

We provide a CSS customization for some of the plugins styling to apply our themes to them in a form of SASS' SCSS syntax.
Those custom CSS files reside separately in `./web/assets/src/sass/plugins` or `./web/assets/src/sass-rtl/plugins` folders.
And they compile and merge with bootstrap and JavaTMP styling and moved to `./web/assets/dist/css/javatmp-*.min.css`
the following page describes the front-end customization for some of the plugins:
[JavaTMP Resources Customization](/pages/javatmp-frontend-resources-customization).