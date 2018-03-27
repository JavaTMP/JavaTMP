
(function ($) {

    window.javatmp = {};

    window.javatmp.defaults = {
        // Http method to use when calling any ajax requests passing to jquery $.ajax
        httpMethod: "GET",

        // Datatype of ajax content passing to jquery $.ajax
        dataType: "html",

        // update browser hash with ajax url parts or not.
        // sometime you want to forbbid URL bookmarking or sharing so set it to false.
        updateURLHash: true,

        // extra parameters to send with the ajax requests or for managing template.
        // useful to notify your remote server.
        // Setting _ajaxGlobalBlockUI parameter to true will use BlockUI plugin
        // and block browser page and indicate to user
        // Setting _ajaxGlobalBlockUI parameter to false will NOT use BlockUI plugin
        // and The ajax request will silent and the user can operate in the site.
        defaultPassData: {_ajax: "ajax", _ajaxGlobalBlockUI: true},

        // Main Output selector for ajax request content.
        // it should be one and only one.
        defaultOutputSelector: '.main-body-content-container',

        // Whenever the browser resize on all devices
        // or user press collapse button to hide or show the sidebar on large screen only.
        // The template fire this event on defaultOutputSelector element above.
        javaTmpContainerResizeEventName: "javatmp-container-resize",

        // whenever the sidebar metismenu link click,
        // the template fire this event on defaultOutputSelector
        // and waiting until event's handler code finish and if the return value
        // from event's handler code is false or event.preventDefault() was called
        // will cancel current ajax request and keep you in the current page.
        // You can run any destruction code in this event's handler function.
        javaTmpContainerRemoveEventName: "javatmp-container-remove",

        // Whenever card's copress fullscreen button press the event fire
        // on defaultOutputSelector selector
        // with card object as parameter to handler fuction.
        cardFullscreenCompress: "card.fullscreen.compress",

        // Whenever card's expand fullscreen button press the event fire
        // on defaultOutputSelector selector
        // with card object as parameter to handler fuction.
        cardFullscreenExpand: "card.fullscreen.expand",

        // After the ajax request finished and content fetched and updated the page
        // the tempalte fire this event on defaultOutputSelector.
        // it is considered the safest way to run your initialiation code regarding new content.
        javaTmpAjaxContainerReady: "javatmp-ajax-container-ready",

        // Default url string to start the template from.
        // after template load it search for this string in href attribute
        // in sidebar's metismenu to fire a click on.
        defaultUrl: 'pages/home.html',

        // default float or direction used
        floatDefault: "left",

        // reverse float or direction used.
        floatReverse: 'right',

        // direction of the document:
        direction: "ltr",

        // attribute for some of plugins that support RTL through initialization parameter.
        isRTL: false
    };

    window.javatmp.settings = {};

    window.javatmp.init = function (options) {

        // initialize application settings from default and options paramters:
        this.settings = $.extend({}, this.defaults, options);

        // initialize global jquery ajax configuration:
        $.ajaxSetup({
            async: true,
            cache: true,
            data: javatmp.settings.defaultPassData,
            error: function (xhr) {
                alert("An error occured: status[" + xhr.status + "], text[" + xhr.statusText + "]");
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
            if (ajaxOptions.url.indexOf("_ajaxGlobalBlockUI=true") !== -1) {
                $.blockUI({message: null,
                    overlayCSS: {
                        backgroundColor: 'transparent',
                        opacity: 1
                    },
                    ignoreIfBlocked: true,
                    baseZ: 1999});
            }
        }).ajaxComplete(function (event, xhr, ajaxOptions) {
            if (ajaxOptions.url.indexOf("_ajaxGlobalBlockUI=true") !== -1) {
                $.unblockUI({
                    fadeOut: 0 // supporting fadeOut value may hang the windows an issue in the plugin itself.
                });
            }
            // <!-- build:remove -->
            if (ajaxOptions.url.indexOf("assets/data") === -1) {
                var ajaxurl = window.location.pathname + "#" + ajaxOptions.url;
                ga('send', 'pageview', ajaxurl);
            }
            // <!-- /build -->
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
        $('.sidebar').on('transitionend webkitTransitionEnd oTransitionEnd otransitionend MSTransitionEnd',
                function () {
                    $(javatmp.settings.defaultOutputSelector).trigger(javatmp.settings.javaTmpContainerResizeEventName);
                    $(".sidebar-toggler-button").prop('disabled', false);
                });

        var menuTimeout = null;
        var handlingMouseMove = function (e) {
            if (e.pageX < 10 || $('.sidebar').is(':hover')) {
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
                if (!javatmp.isWidthSmall()) {
                    $("body").addClass("mouse-auto-show");
                    // just in case:
                    $(window).off('mousemove', handlingMouseMove);
                    $(window).on('mousemove', handlingMouseMove);
                }
            } else {
                $("body").addClass("sidebar-active");
                // disabled auto show on mouse move
                $("body").removeClass("mouse-auto-show");
                $(window).off('mousemove', handlingMouseMove);
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

                                    if (javatmp.isWidthSmall() || $("body").hasClass("mouse-auto-show")) {
                                        $('body').removeClass("sidebar-active");
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

    window.javatmp.getFixedOffset = function () {

        var retOffset = 0;
        retOffset = retOffset + $('.main-javatmp-navbar').outerHeight(true);
        retOffset = retOffset + $('.main-breadcrumb-bar').outerHeight(true);
        return retOffset;

    };

    window.javatmp.isWidthSmall = function () {
        var width = (window.innerWidth > 0) ? window.innerWidth : this.screen.width;
        if ((width < 768)) {
            return true;
        } else {
            return false;
        }
    };

// http://stackoverflow.com/questions/1397329/how-to-remove-the-hash-from-window-location-with-javascript-without-page-refresh/5298684#5298684
    window.javatmp.removeHash = function () {
        var scrollV, scrollH, loc = window.location;
        if ("pushState" in history)
            history.replaceState("", document.title, loc.pathname + loc.search);
        else {
            // Prevent scrolling by storing the page's current scroll offset
            scrollV = (document.documentElement && document.documentElement.scrollTop) ||
                    document.body.scrollTop;
            scrollH = (document.documentElement && document.documentElement.scrollLeft) ||
                    document.body.scrollLeft;

            loc.hash = "";

            // Restore the scroll offset, should be flicker free
            document.body.scrollTop = scrollV;
            document.body.scrollLeft = scrollH;
        }
    };

// http://stackoverflow.com/a/4541963/1461221
    window.javatmp.waitForFinalEvent = (function () {
        var timers = {};
        return function (callback, ms, uniqueId) {
            if (!uniqueId) {
                uniqueId = "Don't call this twice without a uniqueId";
            }
            if (timers[uniqueId]) {
                clearTimeout(timers[uniqueId]);
            }
            timers[uniqueId] = setTimeout(callback, ms);
        };
    })();
}(jQuery));
