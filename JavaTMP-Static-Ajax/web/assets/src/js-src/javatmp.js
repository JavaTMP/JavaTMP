/*!
 * JavaTMP Main JS File.
 */
(function ($) {
    window.javatmp.setup = function () {

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

        var menuTimeout = null;
        var handlingMouseMove = function (e) {
            // check if mouse is near the left edge of the browser in LTR or right edige for RTL.
            var insideEdge = javatmp.settings.isRTL ? (e.pageX > ($(window).innerWidth() - 10)) : e.pageX < 10;
            if (insideEdge || $('.sidebar').is(':hover')) {
                // Show the menu if mouse is within 10 pixels from the left or we are hovering over it
                clearTimeout(menuTimeout);
                menuTimeout = null;
                $("body").addClass("sidebar-active");
            } else if (menuTimeout === null) {
                menuTimeout = setTimeout(function () {
                    $("body").removeClass("sidebar-active");
                }, 300);
            }
        };

        // listen of click event of main navbar-toggler button in navbar.
        $(".sidebar-toggler-button").on("click", function () {
            var originalButton = this;
            $(originalButton).prop('disabled', true);
            // we manually collapse sidebar:
            if ($('body').hasClass("sidebar-active")) {
                $("body").removeClass("sidebar-active");
                // activate mouse on desktop and large devices:
                if (!javatmp.util.isWidthSmall()) {
                    $("body").addClass("mouse-auto-show");
                    // just in case:
//                    $(window).off('mousemove', handlingMouseMove);
                    $(window).on('mousemove', handlingMouseMove);
                }
            } else {
                // disabled auto show on mouse move
                clearTimeout(menuTimeout);
                menuTimeout = null;
                $("body").removeClass("mouse-auto-show");
                $(window).off('mousemove', handlingMouseMove);
                $("body").addClass("sidebar-active");
            }
        });

        // listen to resize window event to update sidebar status
        $(window).on('resize', function () {
            width = (window.innerWidth > 0) ? window.innerWidth : this.screen.width;
            if ((width < 768)) {
                // default on <= navbar-expand-sm devices.
                $("body").removeClass("sidebar-active");
                // remove mouse-auto-show feature
                clearTimeout(menuTimeout);
                menuTimeout = null;
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
}(jQuery));

