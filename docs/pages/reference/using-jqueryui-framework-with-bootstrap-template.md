---
title: Using jQueryUI Framework With Bootstrap Template
---
# {{ page.title }}
`jQueryUI` is not naturally intended to be in a Bootstrap Template. However, we include it completely for implementing two things.
First, supporting sortable and moving of bootstrap card option and, Second, implementing third-party plugins that depends on it,
like jquery Fancytree and jQuery FullCalendar plugins. So the demo pages for them depend on `jQueryUI`.

We should include `jQueryUI` library before bootstrap one, So for this reason we included it before bootstrap in
`./src/main/webapp/assets/dist/js/javatmp-plugins-all.min.js` during gulp's task `generate-dist`.

As we said before if you are not interested in this feature you can remove `jQueryUI` library in `gulpfile.js` file
and then re-generate dist folder again using `gulp generate-dist` command.

We included jQuery UI Touch Punch plugin `jquery.ui.touch-punch.min.js` after `jQueryUI` which provides a small hack
that enables the use of touch events on sites using the jQuery UI user interface library.

The following demo page show the implementation of Bootstrap card resorting in separate page: 
[Sortable Cards using JqueryUI sortable Plugin JavaTMP Demo Page](http://java.javatmp.com/#/pages/static/custom-components/sortable-cards).

The following demo page show the implementation of jQuery Fancytree plugin
[Plain Fancytree Plugin JavaTMP Demo Page](http://java.javatmp.com/#/pages/static/plugins/tree/fancytree/plain_fancytree).

Removing `jQueryUI` library from JavaTMP Tempate
------------------------------------------------

You could remove `jQueryUI` if you don't want to use sorting card by doing the following steps:
*   Remove `jquery-ui-dist` and `jquery-ui-touch-punch` references from `package.json` file.
*   Run `gulp copy-components` command.
*   Remove from `index.jsp` the above references for `jqueryUI` and `touch-punch` CSS/JS files.
*   The Sorting and moving Card will not work.
*   The jQuery Fullcalendar plugin will not work too.
*   For jquery Fancytree plugin use the `jquery.fancytree-all-deps.min.js` instead of `jquery.fancytree-all.min.js`.

