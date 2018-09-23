---
title: Preparing Template for Bootstrap customization
---
# Preparing Template for Bootstrap customization
Backup JavaTMP project and apply the following steps before continuing:
*   In file `./web/assets/src/sass/common/variables.scss` and `BEFORE` the imports of required bootstrap SASS parts and at
    comment `//--- override default bootstrap variables here`.
    You can Override any bootstrap or javatmp variables that will be used in the remaining files including bootstrap itself.
*   In file `./web/assets/src/sass/main.scss`, You can Override any bootstrap or javatmp variables too to be used in all styles.
*   In each SASS files `./web/assets/src/sass|-rtl/`, You can Override any bootstrap or javatmp variables too to be used **in that part only**.
*   For example, Updating variables in `./web/assets/src/sass/plugins/custom-fullcalendar.scss` file will effect this plugin's style only.
*   Run gulp'task `generate-dist` by invoking `gulp sass` command. or run default gulp'task by invoking `gulp` command
    that will generate `./web/assets/dist` folder with updated styles.
*   So, you can customize and use Bootstrap Sass variables and reflect them immediately on the template.

### Updating `$primary` variable
Updating `$primary` variable or `"primary"` key value will automatically update the $theme-colors("primary")
which will update the following components:
`.alert-primary, .badge-primary, .btn-primary, .btn-outline-primary, .list-group-item-primary,
.table-primary, .bg-primary, .bg-gradient-primary, .border-primary, .text-primary.`

### Introducing new `$theme-colors` entry
At the same way adding new entry to the `$theme-colors` map will automatically generate all above components for that key.
for example the following customization add new entry to `$theme-colors` and keep everything else same:
*   Go to file `./web/assets/src/sass/common/variables.scss`.
*   At comment `// --- override default bootstrap variables`, add the following line
    `$theme-colors: ("javatmp": #598234);` like this:
```
    ...
    // --- override default bootstrap variables here
    $theme-colors: ("javatmp": #598234);
    ...
```
*   Depending on your new color, sometime you need to adjust some Bootstrap components for new theme color so you
    should go to our main Sass file `./web/assets/src/sass/main.scss` , and add your overriding CSS styling for
    adjusting components after the last import statement of Bootstrap Sass and before importing of the first JavaTMP Sass file.
*   Run gulp command: `gulp generate-dist` or `gulp`.
*   The above steps will introduce a new theme color called `javatmp` with `#598234` color and generated
    the following new components or classes for that theme:
    `.text-javatmp, .bg-javatmp, .alert-javatmp, .badge-javatmp, .btn-javatmp, .btn-outline-javatmp,
    .list-group-item-javatmp, .table-javatmp, .bg-gradient-javatmp, .border-javatmp, .bg-gradient-javatmp`.

So, at the same way you can update all Bootstrap or JavaTMP Theme Colors
or introduce a new set of different keys with their new components.

