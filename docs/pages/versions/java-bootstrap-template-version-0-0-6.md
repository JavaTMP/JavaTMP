---
title: Java Bootstrap Template Version 0.0.6 (Current Development Version)
---
# Java Bootstrap Template Version 0.0.5 (Current Development Version)

## de69f43 on Nov 16, 2018, 10:42 PM GMT+4
- Move all Javatmp-User-Starter project's plugins creation to new Javascript file `.\JavaTMP\JavaTMP-User-Starter\web\assets\app\js\javatmp.plugins.js`
- Update all pages to support locales messages for English and Arabic languages.
- Update The following front end plugins:
    - bootstrap-modal-wrapper from 1.0.14 to 1.0.15
    - bootstrap-slider from 10.2.0 to 10.2.3
    - cropperjs from 1.4.1 to 1.4.3
    - inputmask from 4.0.2 to 4.0.3
    - popper.js from 1.14.4 to 1.14.5
    - bootstrap-actionable from 1.0.9 to 1.0.11
    - jquery.fancytree from 2.30.0 to 2.30.1
    - file-saver from 1.3.8 to 2.0.0
    - @fortawesome/fontawesome-free from 5.3.1 to 5.5.0
    - moment-timezone from 0.5.21 to 0.5.23
    - gulp-sass from 4.0.1 to 4.0.2

## d336b19 on Oct 6, 2018, 1:59 PM GMT+4
- Update `bootstrap-slider` from 10.2.0 to 10.2.1
- Update `metismenu` from 2.7.9 to 3.0.3
    - replace all occurrences for `active` class with `mm-active` regarding metismenu specially in
    `.\web\assets\src\sass\plugins\custom-metisMenu.scss`.
    - Replace `active` class with `mm-active` in index.js when we filter the menu to open its item programmatically.
    - Replace `active` class with `mm-active` when we open any metismenu sidebar link if user bookmarks one.
    - Add classes `mm-show in` to each `ul` element we want to open programmatically.
