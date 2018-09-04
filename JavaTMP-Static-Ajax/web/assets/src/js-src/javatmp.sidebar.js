/*!
 * JavaTMP Sidebar JS File.
 */
(function ($) {
    window.javatmp.sidebar = window.javatmp.sidebar || {settings: {}};
    var defaults = {
        sidebarSelector: null
    };
    window.javatmp.sidebar.init = function (options) {

        this.settings = $.extend(true, {}, defaults, options);
        var $this = this;
        // listen to transition on sidebar instead of fixed wait to trigger event
        $($this.settings.sidebarSelector).on('transitionend webkitTransitionEnd oTransitionEnd otransitionend MSTransitionEnd', function (event) {
            var propertyName = "margin-" + javatmp.settings.floatDefault;
            if (event.originalEvent && event.originalEvent.propertyName
                    && (event.originalEvent.propertyName.indexOf(propertyName) !== -1)) {
                console.log("transition event occured related to sidebar [" + propertyName + "] is " + $($this.settings.sidebarSelector).css(propertyName));
                if ((javatmp.util.isWidthSmall() === false)) {
                    // Here large and desktop devices:
                    $(javatmp.settings.defaultOutputSelector).trigger(javatmp.settings.javaTmpContainerResizeEventName);
                    // recheck if auto is paused or not:
                    if (javatmp.sidebar.isAutoShowHideActive()) {
                        javatmp.sidebar.continueAutoShowHide();
                    }
                }
            }
        });
    };

    var handlingMouseMove = function (e) {
        // check if mouse is near the left edge of the browser in LTR or right edige for RTL.
        var insideEdge = javatmp.settings.isRTL ? (e.pageX > ($(window).innerWidth() - 10)) : e.pageX < 10;
        if (insideEdge || $('.sidebar').is(':hover')) {
            // Show the menu if mouse is within 10 pixels from the left or we are hovering over it
            javatmp.sidebar.show();
        } else {
            javatmp.sidebar.hide();
        }
    };

    window.javatmp.sidebar.show = function () {
        if ($("body").hasClass("sidebar-active") === false) {
            $("body").addClass("sidebar-active");
        }
    };

    window.javatmp.sidebar.isShown = function () {
        return $("body").hasClass("sidebar-active");
    };

    window.javatmp.sidebar.hide = function () {
        if ($("body").hasClass("sidebar-active") === true) {
            $("body").removeClass("sidebar-active");
        }
    };

    window.javatmp.sidebar.toggleStatus = function () {

    };

    window.javatmp.sidebar.isAutoShowHideActive = function () {
        return $("body").hasClass("mouse-auto-show");
    };

    window.javatmp.sidebar.activateAutoShowHide = function () {
        if ($("body").hasClass("mouse-auto-show") === false) {
            $("body").addClass("mouse-auto-show");
            $(window).on('mousemove', handlingMouseMove);
        }
    };

    window.javatmp.sidebar.deactivateAutoShowHide = function () {
        // disabled auto show on mouse move and show
        $("body").removeClass("mouse-auto-show");
        $(window).off('mousemove', handlingMouseMove);
    };

    window.javatmp.sidebar.pauseAutoShowHide = function () {
        // disabled auto show on mouse move and show
        $(window).off('mousemove', handlingMouseMove);
    };
    window.javatmp.sidebar.continueAutoShowHide = function () {
        $(window).on('mousemove', handlingMouseMove);
    };

}(jQuery));

