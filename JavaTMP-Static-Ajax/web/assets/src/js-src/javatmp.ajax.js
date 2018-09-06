/*!
 * JavaTMP AJAX JS File.
 */
;
(function ($, window, document, undefined) {

    window.javatmp = window.javatmp || {};

    window.javatmp.ajax = window.javatmp.ajax || {};

    window.javatmp.ajax.init = function () {
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
    };
}(jQuery, window, document));

