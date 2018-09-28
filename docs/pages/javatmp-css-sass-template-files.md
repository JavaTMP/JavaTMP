---
title: JavaTMP CSS/SASS Template Files
---
# JavaTMP CSS/SASS Template Files
The main minificated CSS files for JavaTMP template are located in the `./web/assets/dist/css` folder,
And it is automatically generated and populated during running of gulp's task `generate-dist` from:
- Template SASS source theme files reside in `./web/assets/src/sass/themes/javatmp-*.scss` folder.
- RTL Template SASS source theme files reisde in `./web/assets/src/sass-rtl/themes/javatmp-*.scss` folder.
- Merged plugins original CSS files reside in `src.css` array of files.
- Merged plugins original Print CSS files reside in `src.cssForPrint` array of files.
- Font family CSS file for each language key defined in `src.fontFamilyFiles`.

The following file structure provide the output CSS file from gulp's task 'generate-dist':
```
./web/assets/dist/css
+---font-family-en.min.css
+---javatmp-plugins-all.min.css
+---javatmp-plugins-print-all.min.css
+---javatmp-*.min.css (For each SASS theme files reside in ./web/assets/src/sass/themes/ like javatmp-default.min.css)
+---javatmp-*-rtl.min.css (For each SASS theme files reside in ./web/assets/src/sass-rtl/themes/ like javatmp-default-rtl.min.css)
```

We keep sass folder in the main assets of the template to simplify development and make any changes on the CSS happen
through SASS files, and when generating production version of the template we remove `./web/assets/src` folder. 
The most important SASS files in `./web/assets/src/sass|sass-rtl` are:
- `./web/assets/src/sass/common/variables.scss`.
- `./web/assets/src/sass/main.scss`.
- `./web/assets/src/sass-rtl/main-rtl.scss`

If you want to see the compiled CSS files for all SASS files without minification,
then simply comments `.pipe(cleanCSS())` line from corresponding gulp's task `generate-dist`.

Also, we include the required part of the `./node_modules/bootstrap/scss/bootstrap.scss` file
in `common/variables.scss` file to use its variables and function
and include the complete `./node_modules/bootstrap/scss/bootstrap.scss` file again in `main.scss` file
instead of remaining optional part only.