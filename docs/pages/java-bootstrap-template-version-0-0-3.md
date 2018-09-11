---
title: Java Bootstrap Template Version 0.0.3 (Current Development Version)
---
# Java Bootstrap Template Version 0.0.3 (Current Development Version)

11fe3e4 on Sep 8, 2018, 9:28 PM GMT+4
-------------------------------------
Move icons menu to root instead of a child of custom-components and new folder for it become \\web\\pages\\icon

1119a11 on Sep 8, 2018, 8:15 PM GMT+4
-------------------------------------
Prepare codes for release 0.0.3

Refactor most javascript code specially javatmp.js

Implement a special api for sidebar like show/hide

create a layout options demo page to show and modify some theme styling.

Update: bootstrap-card-extender": "^1.0.2" instead of 1.0.1 . "bootstrap-actionable": "^1.0.9" instead of 1.0.6.

f4c5359 on Sep 2, 2018, 11:31 PM GMT+4
--------------------------------------
update bootstrap-modal-wrapper from 1.0.13 to 1.0.14, jquery.fancytree from 2.29.1 to 2.30.0 and npm install & gulp copy-components or gulp

40d8f6a on Sep 2, 2018, 7:25 PM GMT+4
-------------------------------------
Update fontawesome from 5.2.0 to 5.3.1, gulp-autoprefixer from 5.0.0 to 6.0.0, gulp-connect from 5.5.0 to 5.6.1

c1dd69a on Sep 1, 2018, 1:07 AM GMT+4
-------------------------------------
Add Bootstrap Invoice template demo pages in `.\web\pages\custom-pages\invoice`

Add Dynamic Sortable Table Demo Page `.\web\pages\table\dynamic-sortable-table.html` That supports adding new record dynamically and reorders it.

216ffb1 on Aug 31, 2018, 6:29 PM GMT+4
--------------------------------------
Create a demo page for moment.js library showing most features related to date and time with locale and timezone `.\web\WEB-INF\pages\plugins\moment.js.html`

Run `gulp copy-components` on `JavaTMP-Static-Ajax` `JavaTMP-Static-Ajax-RTL` template projects

c5abf07 on Aug 31, 2018, 3:28 PM GMT+4
--------------------------------------
Minimize the font size of `html` tag to `0.8125rem` which corresponds to 13px in pixels scale, in file `.\JavaTMP\JavaTMP-User-Starter\web\assets\src\sass\themes\javatmp-default.scss`

Decrease the width of sidebar `div` tag to `19rem` instead of `20rem`, in file `.\JavaTMP\JavaTMP-User-Starter\web\assets\src\sass\common\variables.scss`

Decrease the width and height of profile thumbnail image to `36` instead of `38`, in file `.\JavaTMP\JavaTMP-User-Starter\web\WEB-INF\index.jsp`

Run `gulp` in command line from `.\JavaTMP\JavaTMP-User-Starter` to update changes to sass files and generate a new `.\JavaTMP\JavaTMP-User-Starter\web\assets\dist`