/*!
 * JavaTMP Plugins Helper JS File.
 */
;
(function ($, window, document, undefined) {

    window.javatmp.plugins = window.javatmp.plugins || {};
    window.javatmp.plugins.inputmaskWrapperForDate = function (element, options) {

        var settings = $.extend(true, {}, {
            alias: "datetime",
            placeholder: "dd/mm/yyyy",
            inputFormat: "dd/mm/yyyy",
            displayFormat: true,
            hourFormat: "24",
            clearMaskOnLostFocus: false
        }, options);

        return $(element).inputmask(settings);
    };

    window.javatmp.plugins.daterangepickerWrapperForDate = function (element, options) {

        var settings = $.extend(true, {}, {
            "opens": javatmp.settings.floatReverse,
            startDate: moment().format(javatmp.settings.dateFormat),
            singleDatePicker: true,
            showDropdowns: true,
            timePicker: false,
            timePickerIncrement: 1,
            timePicker24Hour: true,
            autoApply: true,
            autoUpdateInput: false,
            minDate: '01/01/1900',
            maxDate: '31/12/2099',
            //                    maxDate: '',
            //                    minDate: moment(),
            locale: {
                "direction": javatmp.settings.direction,
                format: javatmp.settings.dateFormat
            }
        }, options);

        return $(element).daterangepicker(settings, function (start, end, label) {
            var formatedDateSelected = moment(start).locale('en').format(javatmp.settings.dateFormat);
            $(element).val(formatedDateSelected).trigger("change");
        });
    };

    window.javatmp.plugins.summernoteWrapper = function (element, options) {

        var settings = $.extend(true, {}, {
            direction: javatmp.settings.direction,
            lang: javatmp.user.lang === "ar" ? "ar-AR" : javatmp.user.lang,
            height: 200,
            dialogsInBody: true
        }, options);

        return $(element).summernote(settings);
    };

    window.javatmp.plugins.select2Wrapper = function (element, options) {

        var settings = $.extend(true, {}, {
            theme: "bootstrap",
            dir: javatmp.settings.direction,
            placeholder: javatmp.settings.labels['page.text.kindlySelect'],
            allowClear: true,
            containerCssClass: ':all:',
            width: ''
        }, options);

        return $(element).select2(settings).on("select2:select", function () {
            (this).focus();
        });
    };

    window.javatmp.plugins.select2WrapperForTheme = function (element, options) {

        function formatThemeSelection(repo) {
            if (!repo.id) {
                return repo.text;
            }

            var imagePath = javatmp.settings.contextPath + "/assets/img/themes/" + repo.text + ".png";
            var template =
                    '    <div class="media d-flex align-items-center">' +
                    '        <img style="height: 1.5rem;" class="mr-1" src="{{imagePath}}" alt="{{themeName}}"/>' +
                    '        <div class="media-body">' +
                    '            <span>{{themeName}}</span>' +
                    '        </div>' +
                    '    </div>';
            var readyData = template.composeTemplate({
                'imagePath': imagePath,
                'themeName': repo.text
            });
            return readyData;
        }
        function formatThemeResult(repo) {
            if (!repo.id) {
                return repo.text;
            }

            var imagePath = javatmp.settings.contextPath + "/assets/img/themes/" + repo.text + ".png";
            var template =
                    '    <div class="media d-flex align-items-center">' +
                    '        <img style="height: 5rem;" class="mr-1" src="{{imagePath}}" alt="{{themeName}}"/>' +
                    '        <div class="media-body">' +
                    '            <span>{{themeName}}</span>' +
                    '        </div>' +
                    '    </div>';

            var readyData = template.composeTemplate({
                'imagePath': imagePath,
                'themeName': repo.text
            });
            return readyData;
        }

        var settings = $.extend(true, {}, {
            theme: "bootstrap",
            dir: javatmp.settings.direction,
            placeholder: javatmp.settings.labels['page.text.kindlySelect'],
            allowClear: true,
            containerCssClass: ':all:',
            width: '',
            escapeMarkup: function (markup) {
                return markup;
            },
            templateSelection: formatThemeSelection,
            templateResult: formatThemeResult
        }, options);

        return $(element).select2(settings).on("select2:select", function () {
            (this).focus();
        });
    };

    window.javatmp.plugins.select2WrapperForCountry = function (element, options) {

        function formatCountry(repo) {
            if (repo.loading)
                return repo.text;
            var imagePath = javatmp.settings.contextPath + "/assets/img/flags/" + repo.id.toLowerCase() + ".png";
            var template =
                    '    <div class="media d-flex align-items-center">' +
                    '        <img class="mr-1" src="{{imagePath}}" alt="{{countryText}}"/>' +
                    '        <div class="media-body">' +
                    '            <strong>{{countryText}} ({{countryId}})</strong>' +
                    '        </div>' +
                    '    </div>';
            var readyData = template.composeTemplate({
                'imagePath': imagePath,
                'countryText': repo.text,
                'countryId': repo.id
            });
            return readyData;
        }
        function formatCountrySelection(repo) {
            if (!repo.id) {
                return repo.text;
            }

            var imagePath = javatmp.settings.contextPath + "/assets/img/flags/" + repo.id.toLowerCase() + ".png";
            var template =
                    '    <div class="media d-flex align-items-center">' +
                    '        <img class="mr-1" src="{{imagePath}}" alt="{{countryText}}"/>' +
                    '        <div class="media-body">' +
                    '            <span>{{countryText}} ({{countryId}})</span>' +
                    '        </div>' +
                    '    </div>';
            var readyData = template.composeTemplate({
                'imagePath': imagePath,
                'countryText': repo.text,
                'countryId': repo.id
            });
            return readyData;
        }

        var settings = $.extend(true, {}, {
            theme: "bootstrap",
            dir: javatmp.settings.direction,
            placeholder: javatmp.settings.labels['page.text.kindlySelect'],
            allowClear: true,
            containerCssClass: ':all:',
            width: '',
            templateSelection: formatCountrySelection,
            templateResult: formatCountry,
            escapeMarkup: function (markup) {
                return markup;
            }
        }, options);

        return $(element).select2(settings).on("select2:select", function () {
            (this).focus();
        });
    };

    window.javatmp.plugins.mCustomScrollbarForProfilePicture = function (element, options) {

        var settings = $.extend(true, {}, {
            axis: "yx",
            theme: "javatmp",
            scrollInertia: 0,
            advanced: {
                updateOnContentResize: true,
                autoExpandHorizontalScroll: true,
                updateOnImageLoad: true
            },
            mouseWheel: {
                preventDefault: true,
                scrollAmount: 85
            }
        }, options);

        return $(element).mCustomScrollbar(settings);
    };

    window.javatmp.plugins.template = function (element, options) {

        var settings = $.extend(true, {}, {

        }, options);

        return $(element).wrappedPlugin(settings);
    };

}(jQuery, window, document));
