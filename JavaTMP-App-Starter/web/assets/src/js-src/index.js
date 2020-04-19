/*!
 * JavaTMP index.html JS File.
 */
;
(function ($, window, document, undefined) {

    window.index = window.index || {};
    window.javatmp = window.javatmp || {};
    var index = window.index;
    var javatmp = window.javatmp;

    var defaults = {
        httpMethod: "GET",
        dataType: "html",
        updateURLHash: true,
        defaultPassData: {_ajax: "ajax", _ajaxGlobalBlockUI: true},
        defaultOutputSelector: '.main-body-content-container',
        defaultUrl: 'pages/home.html',
        sidebarSelector: ".sidebar",
        sidebarHiddenEventName: "sidebarHidden",
        sidebarShownEventName: "sidebarShown",
        listOfFixedElement: ['.main-javatmp-navbar', '.main-breadcrumb-bar'],
        mainSidebarMenuClass: '.main-sidebar-menu',
        mCustomScrollbarOptions: {
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
        }
    };

    index.init = function (options) {

        $.extend(true, defaults, options);

        // define default parameters to apply as a global settings for application.


        javatmp.init(defaults);
        javatmp.ajax.init({
            defaultPassData: javatmp.settings.defaultPassData
        });

        javatmp.sidebar.init({
            sidebarSelector: javatmp.settings.sidebarSelector,
            isRTL: javatmp.settings.isRTL,
            floatDefault: javatmp.settings.floatDefault,
            sidebarHiddenEventName: javatmp.settings.sidebarHiddenEventName,
            sidebarShownEventName: javatmp.settings.sidebarShownEventName
        });

        // Override Some of Bootstrap Actionable plugin parameters
        BootstrapActionable.options = {
            loadingHtml: '<div class="text-center"><i class="fa fa-sync fa-spin fa-3x fa-fw text-primary"></i></div>',
            ajaxHttpMethod: javatmp.settings.httpMethod,
            ajaxContainerReady: javatmp.settings.javaTmpAjaxContainerReady
        };
        // Override Some of Bootstrap Card Extender plugin parameters
        BootstrapCardExtender.options = {
            cardFullscreenExpand: javatmp.settings.cardFullscreenExpand,
            cardFullscreenCompress: javatmp.settings.cardFullscreenCompress
        };

        // Initialize ajax output selector using BootstrapActionable to be responsible for Ajax Lifecycle events.
        $(javatmp.settings.defaultOutputSelector).BootstrapActionable({
            containerRemoveEventName: javatmp.settings.javaTmpContainerRemoveEventName,
            containerReadyEventName: javatmp.settings.javaTmpAjaxContainerReady,
            ajaxMethodType: javatmp.settings.httpMethod,
            ajaxCache: true,
            ajaxDefaultData: javatmp.settings.defaultPassData,
            ajaxDataType: javatmp.settings.dataType
        });

        $.scrollUp({zIndex: 1000, scrollText: '<i class="fa fa-arrow-up"></i>'});

        // initialize NProgress and blockUI jquery plugins to work in ajax
        $(document).ajaxStart(function () {
            NProgress.start();
            $(".breadcrumb-submenu > a > i.fa.faa-spin").removeClass("spin-sync-stop");
            $(".breadcrumb-submenu > a > i.fa.faa-spin").addClass("animated spin-sync-running");
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
            $(".breadcrumb-submenu > a > i.fa.faa-spin").removeClass("animated spin-sync-running");
            $(".breadcrumb-submenu > a > i.fa.faa-spin").addClass("spin-sync-stop");
        });

        // listen to resize window event to update sidebar status
        $(window).on('resize', function () {
            javatmp.util.waitForFinalEvent(function () {
                width = (window.innerWidth > 0) ? window.innerWidth : this.screen.width;
                if ((width < 768)) {
                    // default on <= navbar-expand-sm devices.
                    javatmp.sidebar.hide();
                    javatmp.sidebar.deactivateAutoShowHide();
                } else {
                    // default on > navbar-expand-sm devices.
                    javatmp.sidebar.show();
                }
                $(javatmp.settings.defaultOutputSelector).trigger(javatmp.settings.javaTmpContainerResizeEventName);
            }, 200, "@global.window.resize");
        }).resize();

        $("body").on("click", ".dropdown-menu-header,.dropdown-menu-footer", function (event) {
            event.stopPropagation();
        });

        $("body").on("click", '.disabled', function (event) {
            event.stopPropagation();
            event.preventDefault();
            return false;
        });

        // initialize mCustomScrollbar on each .scroll-content element found in the current page:
        $('.scroll-content').mCustomScrollbar(javatmp.settings.mCustomScrollbarOptions);

        // listen of click event of main navbar-toggler button in navbar.
        $(".sidebar-toggler-button").on("click", function () {
            if (javatmp.sidebar.isShown()) {
                javatmp.sidebar.hide();
                // activate mouse on desktop and large devices:
                if (javatmp.util.isWidthSmall() === false) {
                    javatmp.sidebar.activateAutoShowHide();
                }
            } else {
                // disabled auto show on mouse move
                javatmp.sidebar.deactivateAutoShowHide();
                javatmp.sidebar.show();
            }
        });

        // tooltip demo
        $('.sidebar').tooltip({
            selector: "[data-toggle=tooltip]",
            container: ".sidebar"
        });

        // Initialize sidebar menu element using metisMenu jQuery Plugin.
        $(javatmp.settings.mainSidebarMenuClass).metisMenu({
            toggle: false,
            preventDefault: true
        }).on('shown.metisMenu', function (event) {
            // https://stackoverflow.com/questions/2905867/how-to-scroll-to-specific-item-using-jquery
            var scrollTopValue = $(event.target).parent('li').offset().top
                    - $('.mCSB_container', javatmp.settings.sidebarSelector).offset().top
                    + $('.mCSB_container', javatmp.settings.sidebarSelector).scrollTop();
            $(javatmp.settings.sidebarSelector).mCustomScrollbar("scrollTo", scrollTopValue, {scrollInertia: 1000});
        }).on('hidden.metisMenu', function (event) {
        });

        // Initialize and define main AJAX lifecycle for template by listening on click event of sidebar's main menu links.
        $(javatmp.settings.mainSidebarMenuClass).on("click", 'a[target!="_blank"][href!="#"]', function (event) {
            $(javatmp.settings.defaultOutputSelector).BootstrapActionable("populateByLinkEvent", {
                linkElement: $(this),
                linkEvent: event,
                ajaxBeforeSend: function (jqXHR, settings) {
                    var element = this.linkElement;
                    // this here refere to actionable localOptions.
                    if (javatmp.settings.updateURLHash === true) {
                        window.location.hash = element.attr("href");
                    }

                    $('a.mm-active', javatmp.settings.mainSidebarMenuClass).removeClass("mm-active");

                    element.addClass('mm-active');
                    element.parents("li").addClass("mm-active");
                    element.parents("ul").css({"height": "auto"});
                    element.parents("ul").addClass("mm-show in");

                    if (javatmp.util.isWidthSmall()) {
                        javatmp.sidebar.hide();
                    } else if (javatmp.sidebar.isShown() && javatmp.sidebar.isAutoShowHideActive()) {
                        javatmp.sidebar.pauseAutoShowHide();
                        javatmp.sidebar.hide();
                    }

                    var scrollTopValue = element.offset().top
                            - $('.sidebar .mCSB_container').offset().top
                            + $('.sidebar .mCSB_container').scrollTop();
                    $(".sidebar").mCustomScrollbar("scrollTo", scrollTopValue, {scrollInertia: 1000});

                    $(".breadcrumb").html("");
                    $(element.parents("li").get().reverse()).each(function () {
                        var element = $(this).children("a").clone();
//                                        $(element).addClass("breadcrumb-item");
                        element.find('i').remove();
//                              element = element.replace(/<(?:.|\n)*?>/gm, '');
                        element.html(element.text());
                        $("<li/>").addClass("breadcrumb-item").append(element).appendTo($(".breadcrumb"));
                    });
                    $(this.outputElement).off(javatmp.settings.javaTmpContainerResizeEventName);
                    $(this.outputElement).html("Loading ...");
                }
            });
        });

        // todo: move clear input button mini-plugin
        $('#filter-menu-id').on('input propertychange', function () {
            var $this = $(this);
            var visible = Boolean($this.val());
            $this.siblings('.form-control-clear').toggleClass('d-none', !visible);
        }).trigger('propertychange').trigger('keyup');
        // todo: move clear input button mini-plugin
        $('.form-control-clear').click(function () {
            $(this).siblings('input[type="text"]').val('')
                    .trigger('propertychange').trigger('keyup').focus();
        });

        $('#filter-menu-id').keyup(function () {
            var text = $(this).val().toLowerCase();
            $('li', javatmp.settings.mainSidebarMenuClass).each(function () {
                if ($(this).text().toLowerCase().indexOf(text) === -1) {
                    $(this).hide();
                    $(this).children().removeClass("mm-active");
                    $(this).children().removeClass("in");
                } else {
                    $(this).show();
                    $(this).children("ul").css({height: "auto"});
                    $(this).parentsUntil(javatmp.settings.mainSidebarMenuClass, "li").addClass("mm-active");
                    $(this).parentsUntil(javatmp.settings.mainSidebarMenuClass, "ul").addClass("mm-show in");
                }
            });
        });

        // listen on click event on breadcrumb bar's links and fire corresponding item in the sidebar
        $(".main-breadcrumb-bar").on("click", 'a[target!="_blank"][href!="#"]', function (event) {
            event.preventDefault();
            $('a[href="' + $(this).attr("href") + '"]', javatmp.settings.mainSidebarMenuClass).trigger("click");
        });

        // issue #186 : Hide sidebar when press outside it
        var closingSidebarOnBodyClick = function (e) {
            console.log("firing one click outside");
            javatmp.sidebar.hide();
        };

        $(javatmp.settings.sidebarSelector).on(javatmp.settings.sidebarShownEventName, function () {
            if (javatmp.util.isWidthSmall() === true) {
                console.log("activate one click outside");
                $('body,html').one("click", ".main-content,.main-footer-bar,.main-javatmp-navbar", closingSidebarOnBodyClick);
            }
        }).on(javatmp.settings.sidebarHiddenEventName, function () {
            if (javatmp.util.isWidthSmall() === true) {
                console.log("off activate one click outside");
                $('body,html').off("click", ".main-content,.main-footer-bar,.main-javatmp-navbar", closingSidebarOnBodyClick);
            }
        });
        // End issue #186 Solution.

        // listen to sidebar show/hide events to notify any listener on main output area.
        $(javatmp.settings.sidebarSelector).on(javatmp.settings.sidebarHiddenEventName + ' ' + javatmp.settings.sidebarShownEventName, function () {
            $(javatmp.settings.defaultOutputSelector).trigger(javatmp.settings.javaTmpContainerResizeEventName);
            if ((javatmp.util.isWidthSmall() === false)) {
                // On large and desktop devices recheck if auto is paused or not:
                if (javatmp.sidebar.isAutoShowHideActive()) {
                    javatmp.sidebar.continueAutoShowHide();
                }
            }
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
    };
}(jQuery, window, document));

