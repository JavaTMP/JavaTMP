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

    window.javatmp.plugins.daterangepickerWrapperForDateRange = function (element, options) {

        var settings = $.extend(true, {}, {
            "opens": javatmp.settings.floatDefault,
            startDate: moment().subtract(100, 'years'),
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
            lang: javatmp.settings.lang === "ar" ? "ar-AR" : javatmp.settings.lang,
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

    window.javatmp.plugins.template = function (element, options) {

        var settings = $.extend(true, {}, {

        }, options);

        return $(element).wrappedPlugin(settings);
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
                    action: function (modalWrapper, button, buttonData, originalEvent) {
                        return modalWrapper.hide();
                    }
                }, {
                    label: confirmActionBtnText,
                    cssClass: "btn btn-warning",
                    action: function (modalWrapper, button, buttonData, originalEvent) {
                        modalWrapper.hide();
                        javatmp.plugins.ajaxAction(ajaxUrl, ajaxData, successCallback, errorCallback);
                    }
                }
            ]
        }).show();
    };

    window.javatmp.plugins.ajaxAction = function (ajaxUrl, ajaxData, successCallback, errorCallback) {
        var m = BootstrapModalWrapperFactory.createModal({
            message: '<div class="text-center"><i class="fa fa-sync fa-spin fa-3x fa-fw text-primary"></i></div>',
            closable: false,
            closeByBackdrop: false,
            closeByKeyboard: false
        });
        m.originalModal.find(".modal-dialog").css({transition: 'all 0.5s'});
        m.originalModal.on('shown.bs.modal', function (e) {
            $.ajax({
                type: "POST",
                url: ajaxUrl,
                data: JSON.stringify(ajaxData),
                dataType: "json",
                contentType: "application/json; charset=UTF-8",
                success: function (data) {
                    m.updateMessage(data.message);
                    m.updateClosable(true);
                    m.updateClosableByBackdrop(true);
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
                    var errorMsg = javatmp.settings.labels["dialog.error.message"];
                    try {
                        var jsonData = $.parseJSON(data.responseText);
                        errorMsg = jsonData.message;
                    } catch (error) {
                    }
                    m.updateMessage(errorMsg);
                    m.updateClosable(true);
                    m.updateTitle(javatmp.settings.labels["dialog.error.title"]);
                    toastr.error(errorMsg, javatmp.settings.labels["dialog.error.title"], {
                        timeOut: 3000,
                        progressBar: true,
                        rtl: javatmp.settings.isRTL,
                        positionClass: javatmp.settings.isRTL === true ? "toast-top-left" : "toast-top-right"
                    });
                    if (errorCallback && (typeof errorCallback === "function")) {
                        errorCallback.call(m, data);
                    }
                }
            });
        });
        m.show();
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

}(jQuery, window, document));
