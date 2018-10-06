---
title: Java Bootstrap Template Version 0.0.6 (Current Development Version)
---
# Java Bootstrap Template Version 0.0.5 (Current Development Version)

## d336b19 on Oct 6, 2018, 1:59 PM GMT+4
- Update `bootstrap-slider` from 10.2.0 to 10.2.1
- Update `metismenu` from 2.7.9 to 3.0.3
    - replace all occurrences for `active` class with `mm-active` regarding metismenu specially in
    `.\web\assets\src\sass\plugins\custom-metisMenu.scss`.
    - Replace `active` class with `mm-active` in index.js when we filter the menu to open its item programmatically.
    - Replace `active` class with `mm-active` when we open any metismenu sidebar link if user bookmarks one.
    - Add classes `mm-show in` to each `ul` element we want to open programmatically.
