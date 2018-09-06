/*!
 * JavaTMP Sidebar JS File.
 */

;
(function ($, window, document, undefined) {

    var defaults = {
        sidebarSelector: null,
        sidebarBeforeHideEventName: "sidebarBeforeHide",
        sidebarHideEventName: "sidebarHide",
        sidebarBeforeShowEventName: "sidebarBeforeShow",
        sidebarShowEventName: "sidebarShow",
        isRTL: false,
        floatDefault: "left"
    };

    window.javatmp.sidebar = window.javatmp.sidebar || {settings: {}};

    window.javatmp.sidebar.init = function (options) {

        this.settings = $.extend(true, {}, defaults, options);
        var $this = this;
        // listen to transition on sidebar instead of fixed wait to trigger event
        $($this.settings.sidebarSelector).on('transitionend webkitTransitionEnd oTransitionEnd otransitionend MSTransitionEnd', function (event) {
            var propertyName = "margin-" + javatmp.sidebar.settings.floatDefault;
            var propertyValue = $($this.settings.sidebarSelector).css(propertyName);
            if (event.originalEvent && event.originalEvent.propertyName
                    && (event.originalEvent.propertyName.indexOf(propertyName) !== -1)) {
                if (propertyValue === "0px") {
                    // just shown:
                    $($this.settings.sidebarSelector).trigger($this.settings.sidebarShowEventName);
                } else {
                    // just hidden:
                    $($this.settings.sidebarSelector).trigger($this.settings.sidebarHideEventName);
                }
            }
        });
    };

    var handlingMouseMove = function (e) {
        // check if mouse is near the left edge of the browser in LTR or right edige for RTL.
        var insideEdge = javatmp.sidebar.settings.isRTL ? (e.pageX > ($(window).innerWidth() - 10)) : e.pageX < 10;
        if (insideEdge || $('.sidebar').is(':hover')) {
            // Show the menu if mouse is within 10 pixels from the left or we are hovering over it
            javatmp.sidebar.show();
        } else {
            javatmp.sidebar.hide();
        }
    };

    window.javatmp.sidebar.show = function () {
        if ($("body").hasClass("sidebar-active") === false) {
            $(this.settings.sidebarSelector).trigger(this.settings.sidebarBeforeShowEventName).promise().done(function () {
                $("body").addClass("sidebar-active");
            });
        }
    };

    window.javatmp.sidebar.isShown = function () {
        return $("body").hasClass("sidebar-active");
    };

    window.javatmp.sidebar.hide = function () {
        if ($("body").hasClass("sidebar-active") === true) {
            $(this.settings.sidebarSelector).trigger(this.settings.sidebarBeforeHideEventName).promise().done(function () {
                $("body").removeClass("sidebar-active");
            });
        }
    };

    window.javatmp.sidebar.toggleStatus = function () {
        if (this.isShown() === true) {
            this.hide();
        } else {
            this.show();
        }
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

}(jQuery, window, document));

