/*!
 * JavaTMP Main JS File.
 */
(function ($) {
    window.javatmp.setup = function () {
        // initialize global jquery ajax configuration:
        $.ajaxSetup({
            async: true,
            cache: true,
            data: javatmp.settings.defaultPassData,
            error: function (xhr, ajaxOptions, thrownError) {
            },
            statusCode: {
                200: function (event, request, settings) {
                },
                404: function (event, request, settings) {
                },
                401: function (event, request, settings) {
                },
                302: function (event, request, settings) {
                }
            }
        });

        // initialize NProgress and blockUI jquery plugins to work in ajax
        $(document).ajaxStart(function () {
//            Pace.restart();
            NProgress.start();
            $(".breadcrumb-submenu > a > i.fa.faa-spin").removeClass("text-primary");
            $(".breadcrumb-submenu > a > i.fa.faa-spin").addClass("animated text-danger");
        }).ajaxSend(function (event, xhr, ajaxOptions) {
            if (
                    (ajaxOptions.url.indexOf("_ajaxGlobalBlockUI=false") === -1) // parameter is part of the get URL
                    && !(!!ajaxOptions.data && !!ajaxOptions.data.indexOf && (ajaxOptions.data.indexOf('"_ajaxGlobalBlockUI":false') !== -1)) // parameter is part of Post JSON data
                    )
            {
                $.blockUI({message: null,
                    overlayCSS: {
                        backgroundColor: 'transparent',
                        opacity: 1
                    },
                    ignoreIfBlocked: true,
                    baseZ: 2147483647});
            }
        }).ajaxComplete(function (event, xhr, ajaxOptions) {
            if (
                    (ajaxOptions.url.indexOf("_ajaxGlobalBlockUI=false") === -1) // parameter is part of the get URL
                    && !(!!ajaxOptions.data && !!ajaxOptions.data.indexOf && (ajaxOptions.data.indexOf('"_ajaxGlobalBlockUI":false') !== -1)) // parameter is part of Post JSON data
                    ) {
                $.unblockUI({
                    fadeOut: 0 // supporting fadeOut value may hang the windows an issue in the plugin itself.
                });
            }
        }).ajaxStop(function (event, xhr, ajaxOptions) {
            NProgress.done();
            $(".breadcrumb-submenu > a > i.fa.faa-spin").removeClass("animated text-danger");
            $(".breadcrumb-submenu > a > i.fa.faa-spin").addClass("text-primary");
        });

        javatmp.mCustomScrollbarOptions = {
            theme: "javatmp",
            alwaysShowScrollbar: 0,
            scrollInertia: 0,
            mouseWheel: {
                preventDefault: true,
                scrollAmount: 85
            },
            advanced: {
                autoScrollOnFocus: false,
                updateOnContentResize: true
            }
        };

        $('.scroll-content').mCustomScrollbar(javatmp.mCustomScrollbarOptions);

        $('.metismenu').metisMenu({
            toggle: false,
            preventDefault: true
        }).on('shown.metisMenu', function (event) {
            // https://stackoverflow.com/questions/2905867/how-to-scroll-to-specific-item-using-jquery
            var scrollTopValue = $(event.target).parent('li').offset().top
                    - $('.sidebar .mCSB_container').offset().top
                    + $('.sidebar .mCSB_container').scrollTop();
            $(".sidebar").mCustomScrollbar("scrollTo", scrollTopValue, {scrollInertia: 1000});
        }).on('hidden.metisMenu', function (event) {
        });

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

        // listen on click event on breadcrumb bar's links
        $(".main-breadcrumb-bar").on("click", 'a[target!="_blank"][href!="#"]', function (event) {
            event.preventDefault();
            $('.metismenu a[href="' + $(this).attr("href") + '"]').trigger("click");
        });

        // Initialize and define main AJAX lifecycle for template by listening on click event of sidebar's metismenu links.
        $(".metismenu").on("click", 'a[target!="_blank"][href!="#"]', function (event) {
            var $this = $(this);
            event.preventDefault();
            var javaTmpRemoveEvent = $.Event(javatmp.settings.javaTmpContainerRemoveEventName, {_newTarget: $this});
            $(javatmp.settings.defaultOutputSelector).trigger(javaTmpRemoveEvent).promise().done(function () {
                if (!javaTmpRemoveEvent.isDefaultPrevented()) {
                    $(javatmp.settings.defaultOutputSelector).off(javatmp.settings.javaTmpAjaxContainerReady).promise().done(function () {
                        $(javatmp.settings.defaultOutputSelector).off(javatmp.settings.javaTmpContainerResizeEventName).promise().done(function () {
                            $(javatmp.settings.defaultOutputSelector).off(javatmp.settings.javaTmpContainerRemoveEventName).promise().done(function () {
                                $(javatmp.settings.defaultOutputSelector).off(javaTmpRemoveEvent).promise().done(function () {
                                    if (javatmp.settings.updateURLHash === true) {
                                        window.location.hash = $this.attr("href");
                                    }

                                    $('.metismenu a.active').removeClass("active");

                                    $this.addClass('active');
                                    $this.parents("li").addClass("active");
                                    $this.parents("ul").css({"height": "auto"});
                                    $this.parents("ul").addClass("in");

                                    if (javatmp.util.isWidthSmall() || ($("body").hasClass("mouse-auto-show") && $('body').hasClass("sidebar-active"))) {
                                        clearTimeout(menuTimeout);
                                        menuTimeout = null;
                                        $("body").removeClass("mouse-auto-show");
                                        $('body').removeClass("sidebar-active");
                                        $(window).off('mousemove', handlingMouseMove);
                                    }

                                    var scrollTopValue = $this.offset().top
                                            - $('.sidebar .mCSB_container').offset().top
                                            + $('.sidebar .mCSB_container').scrollTop();
                                    $(".sidebar").mCustomScrollbar("scrollTo", scrollTopValue, {scrollInertia: 1000});

                                    var currentItem = $this;
                                    $(".breadcrumb").html("");

                                    $(currentItem.parents("li").get().reverse()).each(function () {
                                        var element = $(this).children("a").clone();
//                                        $(element).addClass("breadcrumb-item");
                                        element.find('i').remove();
//                              element = element.replace(/<(?:.|\n)*?>/gm, '');
                                        element.html(element.text());
                                        $("<li/>").addClass("breadcrumb-item").append(element).appendTo($(".breadcrumb"));
                                    });

                                    $.ajax({
                                        type: javatmp.settings.httpMethod,
                                        async: true,
                                        cache: true,
                                        dataType: javatmp.settings.dataType,
                                        url: $this.attr("href"),
                                        data: javatmp.settings.defaultPassData,
                                        beforeSend: function () {
                                            // You can clean Ajax Default Output Selector before send request.
                                            // and then add an ajax indicator.
//                                            $(javatmp.settings.defaultOutputSelector).html("");
                                        },
                                        success: function (response, textStatus, jqXHR) {
                                            $(javatmp.settings.defaultOutputSelector).html(response).promise().done(function () {
                                                $('html').animate({scrollTop: 0}, 'slow').promise().done(function () {
                                                    $(javatmp.settings.defaultOutputSelector).trigger(javatmp.settings.javaTmpAjaxContainerReady);
                                                });
                                            });
                                        }
                                    });
                                });
                            });
                        });
                    });
                }
            });
        });

        // Trigger the initial click event on sidebar <a> links
        // which its href equal URL hash String or the defaultUrl String
        if (javatmp.settings.updateURLHash === true) {
            var loc = window.location.href,
                    index = loc.indexOf('#');
            if (index > 0 && window.location.hash.length > 1) {
                var ajaxUrl = window.location.hash.replace('#', '');
                $('a[href="' + ajaxUrl + '"]').trigger("click");
            } else {
                $('a[href="' + javatmp.settings.defaultUrl + '"]').trigger("click");
            }
        } else {
            var loc = window.location.href,
                    index = loc.indexOf('#');
            if (index > 0) {
                window.location.replace(loc.substring(0, index));
            } else {
                $('a[href="' + javatmp.settings.defaultUrl + '"]').trigger("click");
            }
        }

        // Override Some of Bootstrap Actionable plugin parameters
        BootstrapActionable.options = {
            loadingHtml: '<div class="text-center"><i class="fa fa-sync fa-spin fa-3x fa-fw text-primary"></i></div>',
            ajaxHttpMethod: "GET",
            ajaxContainerReady: javatmp.settings.javaTmpAjaxContainerReady
        };
        // Override Some of Bootstrap Card Extender plugin parameters
        BootstrapCardExtender.options = {
            cardFullscreenExpand: javatmp.settings.cardFullscreenExpand,
            cardFullscreenCompress: javatmp.settings.cardFullscreenCompress
        };
    };
}(jQuery));

