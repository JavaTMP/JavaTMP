/*!
 * JavaTMP Plugins Helper JS File.
 */
;
(function ($, window, document, undefined) {

    var defaults = {
        locale: "en",
        direction: "left",
        isRTL: false,
        defaultSelectPlaceholder: "Kindly Select",
        dateFormat: "DD/MM/YYYY",
        dateTimeFormat: "DD/MM/YYYY HH:mm"
    };

    window.javatmp = window.javatmp || {};
    window.javatmp.plugins = window.javatmp.plugins || {};
    window.javatmp.plugins.settings = {};

    window.javatmp.plugins.init = function (options) {
        $.extend(true, window.javatmp.plugins.settings, defaults, options);
        // set default global locale for moment datetime plugin
        moment.locale(this.settings.locale);

        // set global default select2 parameters for theme and direction
        $.fn.select2.defaults.set("theme", "bootstrap");
        $.fn.select2.defaults.set("dir", this.settings.direction);
        $.fn.select2.defaults.set("placeholder", this.settings.defaultSelectPlaceholder);

        $.fn.dataTable.ext.errMode = 'none';

        // tweek for dropdown using right to left language like arabic:
        if (this.settings.isRTL === true) {
            $("body").on('shown.bs.dropdown', '.main-body-content-container .dropdown, .main-body-content-container .btn-group, .main-body-content-container .input-group-prepend, .main-body-content-container .input-group-append', function () {
                console.log("firing recalculate popper sub len [" + $(this).parents(".dropdown-submenu").lenght + "]");
                if ($(this).parents(".navbar").length !== 0 || (!!$(this).parents(".dropdown-submenu").lenght && $(this).parents(".dropdown-submenu").lenght !== 0)) {
                    console.log("Cancel and return navbar len [" + $(this).parents(".navbar").length + "] .dropdown-submenu len [" + $(this).parents(".dropdown-submenu").lenght + "]");
                    return;
                }

                var dropDown = $(this).children(".dropdown-menu");
                setTimeout(function () {
                    var previous =
                            dropDown.css("-webkit-transform") ||
                            dropDown.css("-moz-transform") ||
                            dropDown.css("-ms-transform") ||
                            dropDown.css("-o-transform") ||
                            dropDown.css("transform") ||
                            "Either no transform set, or browser doesn't do getComputedStyle";
                    var values = previous.split("(")[1];
                    values = values.split(")")[0];
                    values = values.split(", ");
                    var x = 0;
                    var y = parseInt(values[5]);
                    var z = 0;
                    dropDown.css({transform: "translate3d(" + x + "px," + y + "px," + z + "px)", left: "auto", right: "auto"});
                }, 0);
            });
        }

        if (this.settings.locale === "ar") {
            numeral.register('locale', 'ar', {
                delimiters: {
                    thousands: ',',
                    decimal: '.'
                },
                abbreviations: {
                    thousand: 'ألف',
                    million: 'م',
                    billion: 'ب',
                    trillion: 'ت'
                },
                ordinal: function (number) {
                    return '';
                },
                currency: {
                    symbol: '$'
                }
            });
            // switch between locales
            numeral.locale('ar');

            $.extend(true, $.fn.dataTable.defaults, {
                "language": {
                    "sProcessing": "جارٍ التحميل...",
                    "sLengthMenu": "أظهر _MENU_ سجل",
                    "sZeroRecords": "لم يعثر على أية سجلات",
                    "sInfo": "إظهار _START_ إلى _END_ من أصل _TOTAL_ سجل",
                    "sInfoEmpty": "يعرض 0 إلى 0 من أصل 0 سجل",
                    "sInfoFiltered": "(منتقاة من مجموع _MAX_ مُدخل)",
                    "sInfoPostFix": "",
                    "sInfoSelect": "إختيار",
                    "sSearch": "ابحث:",
                    "sUrl": "",
                    "decimal": ".",
                    "thousands": ",",
                    "oPaginate": {
                        "sFirst": "الأول",
                        "sPrevious": "السابق",
                        "sNext": "التالي",
                        "sLast": "الأخير"
                    },
                    select: {
                        rows: {
                            _: "تم إختيار %d سجل",
                            0: "إضغط على السجل ليتم إختياره",
                            1: "تم إختيار سجل"
                        }
                    },
                    "emptyTable": "لا يوجد أي سجلات"
                }
            });
        }

        $.validator.setDefaults({
            submitHandler: function () {},
            ignore: ":hidden:not(.forceValidate), [contenteditable='true']:not([name])",
            rules: {},
            messages: {},
            highlight: function (element) {
                $(element).closest('.form-group').removeClass('has-success').addClass('has-error');
            },
            unhighlight: function (element) {
                $(element).closest('.form-group').removeClass('has-error').addClass('has-success');
            },
            errorElement: 'small',
            errorClass: 'form-text text-danger',
            errorPlacement: function (error, element) {
                if (element.length) {
                    var targetParent = $(element).parent();
                    if (targetParent.hasClass("form-check") || targetParent.hasClass("custom-control")) {
                        targetParent = targetParent.parent();
                    }
                    targetParent.append(error);
                }
            }
        });
        $.extend($.validator.messages, {
            summernoteRequired: $.validator.messages.required,
            validDate: "Please enter a valid date",
            validDateTime: "Please enter a valid date and time",
            dateBeforeNow: "Must be less than Today",
            dateTimeBeforeNow: "Must be less than Now",
            dateGreaterThan: "Must be greater than other value",
            dateLessThan: 'Must be less than other value',
            dateEqualOrGreaterThan: 'Must be equal or greater than other value',
            dateEqualOrLessThan: 'Must be equal or less than other value'
        });
        if (this.settings.locale === "ar") {
            $.extend($.validator.messages, {
                summernoteRequired: $.validator.messages.required,
                validDate: "الرجاء إدخال تاريخ صحيح",
                validDateTime: "الرجاء إدخال تاريخ ووقت صحيحين",
                dateBeforeNow: "يجب أن يكون التاريخ أقدم من اليوم",
                dateTimeBeforeNow: "يجب أن يكون التاريخ والوقت أقدم من الأن",
                dateGreaterThan: "يجب أن يكون التاريخ احدث",
                dateLessThan: 'يجب أن يكون التاريخ أقدم',
                dateEqualOrGreaterThan: 'يجب أن يكون التاريخ يساوي أو أحدث',
                dateEqualOrLessThan: 'يجب أن يكون التاريخ يساوي أو أقدم'
            });
        }
        // register global jquery validator methods:
        jQuery.validator.addMethod("summernoteRequired", function (value, element, params) {
            if ((value !== "") && (value !== "<p><br></p>")) {
                return true;
            }
            return false;
        }, $.validator.messages.summernoteRequired);

        jQuery.validator.addMethod("validDate", function (value, element, params) {
            return this.optional(element) || moment(value, javatmp.plugins.settings.dateFormat, true).isValid();
        }, $.validator.messages.validDate);

        jQuery.validator.addMethod("validDateTime", function (value, element) {
            return this.optional(element) || moment(value, javatmp.plugins.settings.dateTimeFormat, true).isValid();
        }, $.validator.messages.validDateTime);

        jQuery.validator.addMethod("dateTimeBeforeNow", function (value, element, params) {
            if (this.optional(element) || $(params).val() === "")
                return true;
            if (moment(value, javatmp.plugins.settings.dateTimeFormat).isBefore(moment()))
                return true;
            return false;
        }, $.validator.messages.dateTimeBeforeNow);

        jQuery.validator.addMethod("dateBeforeNow", function (value, element, params) {
            if (this.optional(element) || value === "")
                return true;
            if (moment(value, javatmp.plugins.settings.dateFormat).isBefore(moment().set({hour: 0, minute: 0, second: 0, millisecond: 0})))
                return true;
            return false;
        }, $.validator.messages.dateBeforeNow);

        jQuery.validator.addMethod("dateGreaterThan", function (value, element, params) {
            if (this.optional(element) || $(params).val() === "")
                return true;
            if (moment(value, javatmp.plugins.settings.dateTimeFormat).isAfter(moment($(params).val(), javatmp.plugins.settings.dateTimeFormat)))
                return true;
            return false;
        }, $.validator.messages.dateGreaterThan);

        jQuery.validator.addMethod("dateLessThan", function (value, element, params) {
            if (this.optional(element) || $(params).val() === "")
                return true;
            if (moment(value, javatmp.plugins.settings.dateTimeFormat).isBefore(moment($(params).val(), javatmp.plugins.settings.dateTimeFormat)))
                return true;
            return false;
        }, $.validator.messages.dateLessThan);

        jQuery.validator.addMethod("dateEqualOrGreaterThan", function (value, element, params) {
            if (this.optional(element) || $(params).val() === "")
                return true;
            if (moment(value, javatmp.plugins.settings.dateTimeFormat).isSameOrAfter(moment($(params).val(), javatmp.plugins.settings.dateTimeFormat)))
                return true;
            return false;
        }, $.validator.messages.dateEqualOrGreaterThan);

        jQuery.validator.addMethod("dateEqualOrLessThan", function (value, element, params) {
            if (this.optional(element) || $(params).val() === "")
                return true;
            if (moment(value, javatmp.plugins.settings.dateTimeFormat).isSameOrBefore(moment($(params).val(), javatmp.plugins.settings.dateTimeFormat)))
                return true;
            return false;
        }, $.validator.messages.dateEqualOrLessThan);

        //Compose template string >>> use mustach tempalte instead for more functionalities
        String.prototype.composeTemplate = (function () {
            var re = /\{{(.+?)\}}/g;
            return function (o) {
                return this.replace(re, function (_, k) {
                    return typeof o[k] !== 'undefined' ? o[k] : '';
                });
            };
        }());

        $("body").on("click", '[actionableWrapperType]', function (event) {
            var actionType = $(this).attr("actionableWrapperType") ? $(this).attr("actionableWrapperType") : "ajax";
            if (actionType === "ajax-area-in-card") {
                var actionOutputArea = $(this).closest(".card").children(".card-body");
                window.javatmp.plugins.bootstrapActionableWrapper(actionOutputArea)
                        .BootstrapActionable("populateByLinkEvent", {
                            linkElement: $(this), linkEvent: event
                        });
            }
        });

    };

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

    window.javatmp.plugins.daterangepickerWrapperForDateRange = function (element, options) {

        var settings = $.extend(true, {}, {
            "opens": javatmp.settings.floatDefault,
            startDate: moment().subtract(1, 'years'),
            endDate: moment(),
            minDate: '01/01/1900',
            maxDate: '31/12/2099',
            timePicker: true,
            autoApply: true,
            autoUpdateInput: false,
            locale: {
                "direction": javatmp.settings.direction,
                format: javatmp.settings.dateTimeSecondFormat
            },
            ranges: {
                'Today': [moment().startOf('day'), moment().endOf("day")],
                'Yesterday': [moment().subtract(1, 'days').startOf('day'), moment().subtract(1, 'days').endOf("day")],
                'Last 7 Days': [moment().subtract(6, 'days').startOf('day'), moment().endOf("day")],
                'Last 30 Days': [moment().subtract(29, 'days').startOf('day'), moment().endOf("day")],
                'This Month': [moment().startOf('month').startOf('day'), moment().endOf('month').endOf("day")],
                'Last Month': [moment().subtract(1, 'month').startOf('month').startOf('day'), moment().subtract(1, 'month').endOf('month').endOf("day")]
            }
        }, options);

        return $(element).daterangepicker(settings).on('apply.daterangepicker', function (ev, picker) {
            $(element).data("start", picker.startDate);
            $(element).data("end", picker.endDate);
            $(element).val(picker.startDate.format(javatmp.settings.dateTimeSecondFormat) + ' - ' + picker.endDate.format(javatmp.settings.dateTimeSecondFormat)).trigger("change");
        }).on('cancel.daterangepicker', function (ev, picker) {
            $(element).removeData("start");
            $(element).removeData("end");
            $(this).val('').trigger("change");
        });
    };

    window.javatmp.plugins.summernoteWrapper = function (element, options) {
        var settings = $.extend(true, {}, {
            direction: javatmp.settings.direction,
            lang: javatmp.plugins.settings.locale === "ar" ? "ar-AR" : javatmp.plugins.settings.locale,
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
            width: '',
            containerCssClass: ':all:',
            escapeMarkup: function (markup) {
                return markup;
            }
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

            var imagePath = javatmp.settings.contextPath + "/assets/img/themes/" + repo.id + ".png";
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

            var imagePath = javatmp.settings.contextPath + "/assets/img/themes/" + repo.id + ".png";
            var template =
                    '    <div class="media d-flex align-items-center">' +
                    '        <img style="height: 3rem;" class="mr-1" src="{{imagePath}}" alt="{{themeName}}"/>' +
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
            width: '',
            containerCssClass: ':all:',
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

    window.javatmp.plugins.confirmAjaxAction = function (confirmTitleText, confirmMessageText, confirmActionBtnText, cancelActionBtnText,
            ajaxUrl, ajaxData, successCallback, errorCallback) {
        BootstrapModalWrapperFactory.createModal({
            title: confirmTitleText,
            message: confirmMessageText,
            closable: false,
            closeByBackdrop: false,
            buttons: [{
                    label: cancelActionBtnText,
                    cssClass: "btn btn-secondary",
                    action: function (button, buttonData, originalEvent) {
                        return this.hide();
                    }
                },
                {
                    label: confirmActionBtnText,
                    cssClass: "btn btn-primary",
                    action: function (button, buttonData, originalEvent) {
                        this.hide();
                        javatmp.plugins.ajaxAction(ajaxUrl, ajaxData, successCallback, errorCallback);
                    }
                }
            ]
        }).show();
    };

    window.javatmp.plugins.ajaxAction = function (ajaxUrl, ajaxData, successCallback, errorCallback, completeCallBack) {
        var m = BootstrapModalWrapperFactory.createModal({
            message: '<div class="text-center"><i class="fa fa-sync fa-spin fa-3x fa-fw text-primary"></i></div>',
            closable: false,
            closeByBackdrop: false,
            closeByKeyboard: false
        });
        m.originalModal.find(".modal-dialog").css({transition: 'all 0.5s'});
        m.originalModal.on('shown.bs.modal', function (e) {
            window.javatmp.plugins.ajaxJsonAction({
                url: ajaxUrl,
                data: JSON.stringify(ajaxData),
                success: function (data) {
                    m.updateMessage(data.message);
                    m.updateTitle(data.title);
                    toastr.success(data.message, data.title, {
                        timeOut: 5000,
                        progressBar: true,
                        rtl: javatmp.settings.isRTL,
                        positionClass: javatmp.settings.isRTL === true ? "toast-top-left" : "toast-top-right"
                    });
                    if (successCallback && (typeof successCallback === "function")) {
                        successCallback.call(m, data);
                    }
                },
                error: function (data) {
                    m.updateMessage(data.message);
                    m.updateTitle(data.title);
                    if (errorCallback && (typeof errorCallback === "function")) {
                        errorCallback.call(m, data);
                    }
                },
                complete: function (jqXHR, textStatus) {
                    m.updateClosable(true);
                    m.updateClosableByBackdrop(true);
                    if (completeCallBack && (typeof completeCallBack === "function")) {
                        completeCallBack.call(null, jqXHR, textStatus);
                    }
                }
            });
        });
        m.show();
    };

    window.javatmp.plugins.ajaxJsonAction = function (ajaxParameters) {
        $.ajax({
            type: "POST",
            url: ajaxParameters.url,
            data: ajaxParameters.data,
            dataType: "json",
            contentType: "application/json; charset=UTF-8",
            success: function (data) {
                if (ajaxParameters.success && (typeof ajaxParameters.success === "function")) {
                    ajaxParameters.success.call(null, data);
                }
            },
            error: function (data) {
                var errorObj = {
                    message: javatmp.settings.labels["dialog.error.message"],
                    title: javatmp.settings.labels["dialog.error.title"]
                };
                try {
                    errorObj = $.parseJSON(data.responseText);
                    errorObj.title = (errorObj.title ? errorObj.title : javatmp.settings.labels["dialog.error.title"]);
                    errorObj.message = (errorObj.message ? errorObj.message : javatmp.settings.labels["dialog.error.message"]);
                } catch (error) {
                }
                toastr.error(errorObj.message, errorObj.title, {
                    timeOut: 3000,
                    progressBar: true,
                    rtl: javatmp.settings.isRTL,
                    positionClass: javatmp.settings.isRTL === true ? "toast-top-left" : "toast-top-right"
                });
                if (ajaxParameters.error && (typeof ajaxParameters.error === "function")) {
                    ajaxParameters.error.call(null, errorObj);
                }
            },
            complete: function (jqXHR, textStatus) {
                if (ajaxParameters.complete && (typeof ajaxParameters.complete === "function")) {
                    ajaxParameters.complete.call(null, jqXHR, textStatus);
                }
            }
        });
    };

    window.javatmp.plugins.contextMenuWrapper = function (element, selector, $contextMenu) {
        function getMenuPosition($contextMenu, mouse, direction, scrollDir, isRTL) {
            var win = $(window)[direction]();
            var scroll = $(window)[scrollDir]();
            var menu = $($contextMenu)[direction]();
//                var position = mouse + scroll;
            var position = mouse + 0;
            if (direction === "width" && (position - $($contextMenu)[direction]() > 0) && isRTL) {
                position = position - $($contextMenu)[direction]();
            } else {
                // opening menu would pass the side of the page
                if (mouse + menu > win && menu < mouse)
                    position -= menu;
            }
            return position;
        }
        $(element).on('contextmenu', selector, function (e) {
            // https://stackoverflow.com/questions/18666601/use-bootstrap-3-dropdown-menu-as-context-menu
            if (e.ctrlKey)
                return;

            $contextMenu.on("click", "a", function () {
                $contextMenu.hide();
            });

            $('body').on("click", function () {
                $contextMenu.hide();
            });

            $contextMenu.css({
                display: "block",
                left: getMenuPosition($contextMenu, e.clientX, 'width', 'scrollLeft', javatmp.settings.isRTL),
                right: "auto",
                top: getMenuPosition($contextMenu, e.clientY, 'height', 'scrollTop', javatmp.settings.isRTL)
            });
            return false;
        });
    };

    window.javatmp.plugins.populateForm = function (frm, data) {
        $.each(data, function (key, value) {
            var $ctrl = $('[name=' + key + ']', frm);
            if ($ctrl.is('select')) {
                $ctrl.val(value).trigger("change");
//                        $("option", $ctrl).each(function () {
//                            console.log("this.value is [" + this.value + "], value [" + value + "]");
//                            if (this.value === value) {
//                                console.log("Matched and we select now");
//                                $(this).prop("selected", true).trigger("change");
//                            }
//                        });
            } else if ($ctrl.is('textarea')) {
                $ctrl.val(value).trigger("change");
            } else {
                switch ($ctrl.attr("type"))
                {
                    case "text" :
                    case "hidden":
                    case "textarea":
                        $ctrl.val(value).trigger("change");
                        break;
                    case "radio" :
                    case "checkbox":
                        $ctrl.each(function () {
                            if ($(this).attr('value') === value) {
                                $(this).prop("checked", value).trigger("change");
                            }
                        });
                        break;
                }
            }
        });
    };

    window.javatmp.plugins.DataTableColFilterEventWrapper = function (dataTableReference, colIndex, escape) {
        return function (event) {
            var $this = $(this);
            javatmp.util.waitForFinalEvent(function () {
                var val = escape ? $.fn.dataTable.util.escapeRegex($this.val()) : $this.val();
                dataTableReference.column(colIndex).search(val ? val : '', true, false).draw();
            }, 200, "@table-filter");
        };
    };
    window.javatmp.plugins.DataTableColRenderWrapper = function (forceWidth, mapperObject) {
        return function (data, type, row, meta) {
//                    console.log(meta);
//                    console.log(meta.settings);
//                    console.log(meta.settings.aoColumns);
            if (type === "sort" || type === 'type' || type === 'filter') {
                return data;
            } else if (type === "display" && meta.settings.aoColumns[meta.col].type === "date") {
                return "<p class='m-0 p-0 text-truncate' style='width: " + forceWidth + ";'>" + moment(data, javatmp.settings.networkDateFormat).format(javatmp.settings.dateFormat) + "</p>";
            } else if (type === "display") {
                return "<p class='m-0 p-0 text-truncate' style='width: " + forceWidth + ";'>" + (mapperObject ? mapperObject[data] : data) + "</p>";
            } else {
                return data;
            }
        };
    };

    /*
     "createdCell": function (td, cellData, rowData, row, col) {
     console.log(cellData);
     console.log(rowData);
     console.log(row);
     console.log(col);
     }
     */

    window.javatmp.plugins.bootstrapActionableWrapper = function (element, options) {

        var settings = $.extend(true, {}, {
            containerRemoveEventName: javatmp.settings.javaTmpContainerRemoveEventName,
            containerReadyEventName: javatmp.settings.javaTmpAjaxContainerReady,
            ajaxMethodType: javatmp.settings.httpMethod,
            ajaxCache: true,
            ajaxDefaultData: javatmp.settings.defaultPassData,
            ajaxDataType: javatmp.settings.dataType,
            ajaxBeforeSend: function (jqXHR, settings) {
                var outputDiv = this.outputElement;
                var outputElementId = $(outputDiv).attr('id');
                if (!!!outputElementId) {
                    outputElementId = javatmp.util.getUniqueID("cardlet");
                    $(outputDiv).attr("id", outputElementId);
                }
                var url = settings.url;
                var separator = url.indexOf('?') > -1 ? '&' : '?';
                url += separator + encodeURIComponent("cardletId") + "=" + encodeURIComponent(outputElementId);
                settings.url = url;
            }
        }, options);

        return $(element).BootstrapActionable(settings);
    };

    window.javatmp.plugins.template = function (element, options) {

        var settings = $.extend(true, {}, {

        }, options);

        return $(element).wrappedPlugin(settings);
    };

    window.javatmp.plugins.blockWrapper = function (element, options) {

        var settings = $.extend(true, {}, {
            message: javatmp.settings.labels["global.loadingText"],
            overlayCSS: {
                backgroundColor: '#000',
                opacity: 0.7
            }
        }, options);

        return $(element).block(settings);
    };

    window.javatmp.plugins.echartCustomTooltipFormatter = function (params) {
        var retStr = "";
        for (var i = 0; i < params.length; i++) {
            retStr += [
                '<span>' + params[i].axisValue + '</span>',
                "<br/>",
                "<span style='display:inline-block;width:10px;height:10px;border-radius:50%;background-color:" + params[i].color + ";margin-" + javatmp.settings.floatReverse + ":5px;'></span><span>" + params[i].seriesName + ':' + params[i].data + "</span>"
            ].join('');
        }
        return retStr;
    };

}(jQuery, window, document));
