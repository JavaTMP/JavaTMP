---
title: Extended Bootstrap Card Options
---
# Extended Bootstrap Card Options
We extend default Bootstrap Card by using [Bootstrap Card Extender plugin](https://github.com/JavaTMP/bootstrap-card-extender "Bootstrap Card Extender") which adds options and tool buttons that help us interact with and make Bootstrap Card more responsive and interactive. The main extended options are:

*   Collapsible Card Option
*   Fullscreen Card Expander Option
*   Removing Card Option
*   Resorting and Moving Card Option (Using jQueryUI Sortable Plugin)

Extend Bootstrap Card HTML Code
-------------------------------

The native Bootstrap card html with header is:
```
<div class="card">
    <div class="card-header">
        Card Header
    </div>
    <div class="card-body">
        ...
    </div>
</div>
```
We extended the native Bootstrap Card HTML code above by adding the following:
```
<div class="card">
    <div class="card-header">
        Card
        <div class="options float-right">
            <a class="settings"><i class="fa fa-cog"></i></a>
            <a href="#" class="collapse"><i class="fa fa-chevron-up"></i></a>
            <a href="#" class="reload"><i class="fa fa-refresh"></i></a>
            <a href="#" class="fullscreen"><i class=" fa fa-expand"></i></a>
            <a href="#" class="remove"><i class="fa fa-times"></i></a>
        </div>
    </div>
    <div class="card-body">
        ...
    </div>
</div>
```
Collapsible Bootstrap Card Option
---------------------------------

We extended default bootstrap card by supporting card collapsing option using simply jQuery `slideUp` and `slideDown` functions and we changed icons for collapsible button using Font Awesome `fa-chevron-up` and `fa-chevron-down` icons. The following Javascript code implements collapsible Bootstrap Card Option in `javatmp.js` file:
```
$('body').on('click', '.card > .card-header a.collapse, .card > .card-header a.expand', function (e) {
    e.preventDefault();
    var el = $(this).closest(".card").find(".card-body");
    if ($(this).hasClass("collapse")) {
        $(this).removeClass("collapse").addClass("expand");
        el.slideUp(200);
        if ($(this).children('i').hasClass('fa-chevron-up')) {
            $(this).children('i').removeClass('fa-chevron-up');
            $(this).children('i').addClass('fa-chevron-down');
        }
    } else {
        $(this).removeClass("expand").addClass("collapse");
        el.slideDown(200);
        if ($(this).children('i').hasClass('fa-chevron-down')) {
            $(this).children('i').removeClass('fa-chevron-down');
            $(this).children('i').addClass('fa-chevron-up');
        }
    }
});
```
Removing Card Option
--------------------

We extend native Bootstrap Card by supporting remove button in `.options` div using the following Javascript code in `javatmp.js`:
```
$('body').on('click', '.card > .card-header a.remove', function (e) {
    e.preventDefault();
    var panel = $(this).closest(".card");

    if ($('html').hasClass('card-fullscreen')) {
        $('html').removeClass('card-fullscreen');
    }

    panel.remove();
});
```
Fullscreen Card Expander Option
-------------------------------

We extended native Bootstrap Card by supporting Fullscreen Card View button using CSS styling and Javascript code. The following CSS styling in `./web/assets/src/sass/partials/card.scss` SASS file defines the rules needed to implement fullscreen feature:
```
.card-fullscreen {
    overflow: hidden;
}

.card {
    &.fullscreen {
        z-index: 1031;
        margin: 0!important;
        position: fixed;
        top: 0!important;
        left: 0!important;
        bottom: 0px!important;
        right: 0!important;
        width: 100%!important;
        height: 100%!important;
        background: #fff;
        > .card-body {
            overflow-y: auto;
            overflow-x: hidden;
        }
    }
}
```
The following Javascript for implmenting fullscreen feature in `javatmp.js`:
```
$('body').on('click', '.card > .card-header a.fullscreen', function (e) {
    e.preventDefault();
    var panel = $(this).closest(".card");
    if (panel.hasClass('fullscreen')) {
        $(this).removeClass('on');
        panel.removeClass('fullscreen');
        $('html').removeClass('card-fullscreen');

        if ($(this).children('i').hasClass('fa-compress')) {
            $(this).children('i').removeClass('fa-compress');
            $(this).children('i').addClass('fa-expand');
        }

        panel.children('.card-body').css('height', 'auto');
        panel.trigger(javatmp.settings.cardFullscreenCompress, \[panel\]);

    } else {
        $(this).addClass('on');
        panel.addClass('fullscreen');
        $('html').addClass('card-fullscreen');

        var height = viewport().height
                - panel.children('.card-header').outerHeight()
                - (panel.children(".card-footer").length > 0 ? panel.children('.card-footer').outerHeight() : 0);

        panel.children('.card-body').css('height', height);

        if ($(this).children('i').hasClass('fa-expand')) {
            $(this).children('i').removeClass('fa-expand');
            $(this).children('i').addClass('fa-compress');
        }

        panel.trigger(javatmp.settings.cardFullscreenExpand, \[panel\]);

    }
});
```
Moving Bootstrap Card Option
----------------------------

We extended native Bootstrap Card by supporting moving and resorting cards inside .col div that help to implements a kind of Kanban Board or Agile's scrum backlogs. We used jQueryUI Sortable Pluin but we include complete jQueryUI library instead of only sortable plugin. 

The following demo page show the implementation of Bootstrap card resorting in separate page: [Sortable Cards using JqueryUI sortable Plugin JavaTMP Demo Page](http://demo.javatmp.com/JavaTMP-Static-Ajax/#pages/custom-components/sortable-cards.html "Sortable Cards using JqueryUI sortable Plugin JavaTMP Demo Page").

Normally this feature is not required by most projects and because jQueryUI is not naturally intended to be in a Bootstrap Template we implemented it in the same above demo page. So, kindly see the above demo page HTML source code for more details.

We should include jQueryUI library before bootstrap one, So for this reason we included it globally in index.html. As we said before if you are not interested in this feature you can remove jQueryUI library.

