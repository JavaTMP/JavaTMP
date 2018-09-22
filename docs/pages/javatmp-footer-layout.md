---
title: JavaTMP Footer Layout
---
# JavaTMP Footer Layout
The class `.main-footer-bar` style main footer div which is fixed on desktop and large screen and relative on small devices and mobile.
The main SASS file for styling `.main-footer-bar` element is `./web/assets/src/sass/partials/footer.scss`
and it is imported in `./web/assets/src/sass/main.scss` file to be part of template main CSS file.

If you don't want a footer element at all, you can simply remove `.main-footer-bar` div and `footer.scss` file
and update `main.scss` file by removing import statement for `footer.scss`.

If you want to update `footer` by removing its fixed behavior, you can make the following changes:
*   Remove the following rules `bottom: 0;` and `position: fixed;` from `footer.scss` file for `.main-footer-bar` selector.
*   Optionally, remove `height` rule from `footer.scss` file for `.main-footer-bar` selector too
    if you don't want to force footer's height.
*   Update body styling in `base.scss` file by removing `padding-bottom` rule.
