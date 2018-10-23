/*!
 * JavaTMP AJAX JS File.
 */
;
(function ($, window, document, undefined) {

    window.javatmp = window.javatmp || {};

    window.javatmp.ajax = window.javatmp.ajax || {};
    window.javatmp.ajax.settings = window.javatmp.ajax.settings || {};

    var defaults = {
        defaultPassData: {}
    };
    window.javatmp.ajax.init = function (options) {

        $.extend(true, this.settings, defaults, options);

        // initialize global jquery ajax configuration:
        $.ajaxSetup({
            async: true,
            cache: true,
            data: this.settings.defaultPassData,
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

        // initialize jQuery Default Ajax events lifecycle:
        $(document).ajaxStart(function () {

        }).ajaxSend(function (event, xhr, ajaxOptions) {

        }).ajaxComplete(function (event, xhr, ajaxOptions) {

        }).ajaxStop(function (event, xhr, ajaxOptions) {

        });
    };

    window.javatmp.ajax.actionRequest = function () {

    };

}(jQuery, window, document));

