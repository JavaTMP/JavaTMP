---
title: JavaTMP Footer Layout
---
# JavaTMP Footer Layout
The class `.main-footer-bar` style main footer div which is fixed on desktop and large screen and relative on small devices and mobile. It is height about 34 pixels so we styled `body` element with padding from the bottom with 34 pixels too on large screen and desktop devices. The main SASS file for styling `.main-footer-bar` element is `./web/assets/src/sass/partials/footer.scss` and it is imported in `./web/assets/src/sass/main.scss` file to be part of template main CSS file `main.min.css`

If you don't want a footer element at all, you can simply remove `.main-footer-bar` div and `footer.scss` file and update `main.scss` file to removing import `footer.scss`.

If you want to update `footer` by removing its fixed behavior, you can make the following changes:

*   Remove the following rules `bottom: 0;` and `position: fixed;` from `footer.scss` file for `.main-footer-bar` selector.
*   Optionally, remove `height: 34px;` rule from `footer.scss` file for `.main-footer-bar` selector too if you don't want to force footer's height.
*   Update body styling in `base.scss` file by removing rule `padding-bottom: 34px;`
