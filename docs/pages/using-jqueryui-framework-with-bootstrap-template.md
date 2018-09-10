---
title: Using jQueryUI Framework With Bootstrap Template
---
# Using jQueryUI Framework With Bootstrap Template
`jQueryUI` is not naturally intended to be in a Bootstrap Template. However, we include it completely for implementing two things. First, supporting sortable and moving of bootstrap card option and, Second, implementing third-party plugins that depends on it, like jquery Fancytree and jQuery FullCalendar plugins. So the demo pages for them depend on `jQueryUI`.

We should include `jQueryUI` library before bootstrap one, So for this reason we included it globally in `index.html`. As we said before if you are not interested in this feature you can remove `jQueryUI` library. the following HTML snippet taken from index.html page show you how we were including jQueryUI library in `index.html` page:
```
<!-- in head element and before bootstrap css file -->
<link href="components/jquery-ui/jquery-ui.min.css" rel="stylesheet" type="text/css"/>
<!-- at the end after jQuery and before bootstrap -->
<script src="components/jquery/dist/jquery.min.js" type="text/javascript"></script>
<script src="components/jquery-ui/jquery-ui.min.js" type="text/javascript"></script>
<script src="components/jquery-ui-touch-punch/jquery.ui.touch-punch.min.js" type="text/javascript"></script>
<script src="components/popper.js/dist/umd/popper.min.js" type="text/javascript"></script>
<script src="components/bootstrap/dist/js/bootstrap.min.js" type="text/javascript"></script>
```
We included jQuery UI Touch Punch plugin `jquery.ui.touch-punch.min.js` after `jQueryUI` which provides a small hack that enables the use of touch events on sites using the jQuery UI user interface library.

The following demo page show the implementation of Bootstrap card resorting in separate page: [Sortable Cards using JqueryUI sortable Plugin JavaTMP Demo Page](http://demo.javatmp.com/JavaTMP-Static-Ajax/#pages/custom-components/sortable-cards.html "Sortable Cards using JqueryUI sortable Plugin JavaTMP Demo Page").

The following demo page show the implementation of jQuery Fancytree plugin [Plain Fancytree Plugin JavaTMP Demo Page](http://demo.javatmp.com/JavaTMP-Static-Ajax/#pages/plugins/tree/fancytree/plain_fancytree.html "Plain Fancytree Plugin JavaTMP Demo Page").

Removing `jQueryUI` library from JavaTMP Tempate
------------------------------------------------

You could remove `jQueryUI` if you don't want to use sorting card by doing the following steps:

*   Remove `jquery-ui-dist` and `jquery-ui-touch-punch` references from `package.json` file.
*   Run `gulp copy-components` command.
*   Remove from `index.html` the above references for `jqueryUI` and `touch-punch` CSS/JS files.
*   The Sorting and moving Card will not work.
*   The jQuery Fullcalendar plugin will not work too.
*   For jquery Fancytree plugin use the `jquery.fancytree-all-deps.min.js` instead of `jquery.fancytree-all.min.js`.

