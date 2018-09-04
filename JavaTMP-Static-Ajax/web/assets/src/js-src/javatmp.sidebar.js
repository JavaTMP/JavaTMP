/*!
 * JavaTMP Sidebar JS File.
 */
(function ($) {
    window.javatmp.sidebar = window.javatmp.sidebar || {};

    window.javatmp.sidebar.init = function () {

        // listen to transition on sidebar instead of fixed wait to trigger event
        $('.sidebar').on('transitionend webkitTransitionEnd oTransitionEnd otransitionend MSTransitionEnd', function (event) {
            if ($(".sidebar-toggler-button").prop('disabled')
                    && (event.originalEvent.propertyName)
                    && (event.originalEvent.propertyName.indexOf("margin-" + javatmp.settings.floatDefault) !== -1)) {
                $(".sidebar-toggler-button").prop('disabled', false);
                if ((javatmp.util.isWidthSmall() === false)) {
                    $(javatmp.settings.defaultOutputSelector).trigger(javatmp.settings.javaTmpContainerResizeEventName);
                }
            } else {
                // re cheek if auto-show is activiated or not bug in ie11 & edge:
                if ((javatmp.util.isWidthSmall() === false)
                        && ($("body").hasClass("mouse-auto-show") === false)
                        && ($('body').hasClass("sidebar-active") === false)) {
                    setTimeout(function () {
                        if ((javatmp.util.isWidthSmall() === false)
                                && ($("body").hasClass("mouse-auto-show") === false)
                                && ($('body').hasClass("sidebar-active") === false)) {
                            $("body").addClass("mouse-auto-show");
                            $(window).on('mousemove', handlingMouseMove);
                        }
                    }, 1000);
                }
            }
        });


        // listen of click event of main navbar-toggler button in navbar.
        $(".sidebar-toggler-button").on("click", function () {
            // we manually collapse sidebar:
            if (javatmp.sidebar.isShown()) {
                javatmp.sidebar.hide();
                // activate mouse on desktop and large devices:
                if (!javatmp.util.isWidthSmall()) {
                    javatmp.sidebar.activateAutoShowHide();
                }
            } else {
                // disabled auto show on mouse move
                javatmp.sidebar.deactivateAutoShowHide();
                javatmp.sidebar.show();
            }
        });

        // listen to resize window event to update sidebar status
        $(window).on('resize', function () {
            width = (window.innerWidth > 0) ? window.innerWidth : this.screen.width;
            if ((width < 768)) {
                // default on <= navbar-expand-sm devices.
                $("body").removeClass("sidebar-active");
                // remove mouse-auto-show feature
                $("body").removeClass("mouse-auto-show");
                $(window).off('mousemove', handlingMouseMove);
            } else {
                // default on > navbar-expand-sm devices.
                if (!$("body").hasClass("mouse-auto-show")) {
                    $("body").addClass("sidebar-active");
                }
            }
            $(javatmp.settings.defaultOutputSelector).trigger(javatmp.settings.javaTmpContainerResizeEventName);
        }).resize();
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

}(jQuery));

