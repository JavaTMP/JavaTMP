<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<div class="dynamic-ajax-content grid-gutter-padding">
    <h4 class="my-3">Advanced Users Search</h4>
    <hr/>
    <div class="form-row">
        <div class="col-5">
            <div class="card">
                <div class="card-body p-1">
                    <div id="builder1"></div>
                    <button class="btn btn-primary" id="btn-get">Get Rules</button>
                    <button class="btn btn-secondary" id="btn-reset">Reset</button>
                    </body>
                </div>
            </div>
        </div>
        <div class="col-7">
            <div class="card">
                <div class="card-body">

                </div>
            </div>
        </div>
    </div>

    <!--
    Reference Your external Stylesheet file here
    if your feature or plugins could not support to run globally.
    <link href="components/" rel="stylesheet">
    -->
    <style type="text/css">
        /*
        Embed CSS styling for current page.
        */
    </style>

    <!--
    Reference Your external Javascript file here
    if your feature or plugins could not support to run globally.
    <script src="components/"></script>
    -->
    <script type="text/javascript">
        // You could write safely Javascript code here too as our template
        // should load mandatory libraries and plugins before.
        // <--- HERE --->
        //
        jQuery(function ($) {
            // any code put here will be run after content attach to ajax output container and before
            // controll return to main javascript file.
            // <--- HERE --->
            //
            $(javatmp.settings.defaultOutputSelector).on(javatmp.settings.javaTmpAjaxContainerReady, function (event) {
                // fire AFTER all transition done and your ajax content is shown to user.

                $(javatmp.settings.defaultOutputSelector).on(javatmp.settings.javaTmpContainerResizeEventName, function (event) {
                    // fire when user resize browser window or sidebar hide / show
                });

                /**
                 * When another sidebar menu item pressed and before container issues new ajax request.
                 * You can cancel, destroy, or remove any thing here before replace main output ajax container.
                 * return false or event.preventDefault() will cancel ajax and stay you in the current page and do nothing.
                 **/
                $(javatmp.settings.defaultOutputSelector).on(javatmp.settings.javaTmpContainerRemoveEventName, function (event) {
                    var newLink = $(event._newTarget);
                    return true;
                });

                var defaultIcons = {
                    add_group: 'fas fa-plus-square',
                    add_rule: 'fas fa-plus-circle',
                    remove_group: 'fas fa-minus-square',
                    remove_rule: 'fas fa-minus-circle',
                    error: 'fas fa-exclamation-triangle'
                };


                $('#builder1').queryBuilder({
                    icons: defaultIcons,
                    select_placeholder: javatmp.settings.defaultSelectPlaceholder,
                    filters: [{
                            id: 'id',
                            label: '${labels['domain.user.id']}',
                            type: 'integer',
                            input: 'number'
                        },
                        {
                            id: 'userName',
                            label: '${labels['domain.user.userName']}',
                            type: 'string',
                            input: 'text'
                        },
                        {
                            id: 'firstName',
                            label: '${labels['domain.user.firstName']}',
                            type: 'string',
                            input: 'text'
                        },
                        {
                            id: 'lastName',
                            label: '${labels['domain.user.lastName']}',
                            type: 'string',
                            input: 'text'
                        },
                        {
                            id: 'birthDate',
                            label: '${labels['domain.user.birthDate']}',
                            type: 'date',
                            default_operator: "less",
                            input: function (rule, name) {
                                var $container = rule.$el.find('.rule-value-container');
                                $($container).append(`<input class="form-control birthdate-filter" dir="ltr"/>`);
                                var birthDateSelect = $(".birthdate-filter", $container);
                                var birthDateInputMask = javatmp.plugins.inputmaskWrapperForDate(birthDateSelect);
                                var birthDateDatePicker = javatmp.plugins.daterangepickerWrapperForDate(birthDateSelect);
                                $(birthDateSelect).val(moment().format(javatmp.plugins.settings.dateFormat));
                            },
                            valueGetter: function (rule) {
                                var $container = rule.$el.find('.rule-value-container');
                                var birthDateSelect = $(".birthdate-filter", $container);
                                var currentValue = $(birthDateSelect).val();
                                return currentValue;
                            },
                            valueSetter: function (rule, value) {
                                var $container = rule.$el.find('.rule-value-container');
                                var birthDateSelect = $(".birthdate-filter", $container);
                                $(birthDateSelect).val(value).trigger("change");
                            }
                        },
                        {
                            id: 'age',
                            label: '${labels['domain.user.age']}',
                            type: 'integer',
                            input: 'number'
                        },
                        {
                            id: 'email',
                            label: '${labels['domain.user.email']}',
                            type: 'string',
                            input: 'text'
                        },
                        {
                            id: 'status',
                            label: '${labels['domain.user.status']}',
                            type: 'integer',
                            input: 'select',
                            multiple: false,
                            values: [
                                {"": javatmp.settings.defaultSelectPlaceholder},
                                {1: 'Active'},
                                {0: 'Inactive'}
                            ],
                            operators: ['equal', 'not_equal']
                        },
                        {
                            id: 'country',
                            label: '${labels['domain.user.country']}',
                            type: 'string',
                            input: function (rule, name) {
                                rule.nameOfCustomElement = name;
                                var that = this;
                                var $container = rule.$el.find('.rule-value-container');
                                $($container).append(`
<select class="form-control" name="` + name + `">
        <option value=""></option>
        <c:forEach items="${requestScope.countries}" var="country">
            <option value="${country.countrytranslationPK.countryId}">${country.countryName}</option>
        </c:forEach>
</select>
`);
                                var select = $("select[name='" + rule.nameOfCustomElement + "']", $container);
                                var select2Object = javatmp.plugins.select2WrapperForCountry(select);
                                return select;
                            },
                            valueGetter: function (rule) {
                                var $container = rule.$el.find('.rule-value-container');
                                var select = $("select[name='" + rule.nameOfCustomElement + "']", $container);
                                var currentValue = select.val();
                                return currentValue;
                            },
                            valueSetter: function (rule, value) {
                                var $container = rule.$el.find('.rule-value-container');
                                var select = $("select[name='" + rule.nameOfCustomElement + "']", $container);
                                $(select).val(value).trigger("change");
                            }
                        },
                        {
                            id: 'lang',
                            label: '${labels['domain.user.lang']}',
                            type: 'string',
                            input: function (rule, name) {
                                rule.nameOfCustomElement = name;
                                var that = this;
                                var $container = rule.$el.find('.rule-value-container');
                                $($container).append(`
<select class="form-control" name="` + name + `">
        <option value=""></option>
        <c:forEach items="${requestScope.languages}" var="language">
            <option value="${language.languagetranslationPK.languageId}">${language.languageName}</option>
        </c:forEach>
</select>
`);
                                var select = $("select[name='" + rule.nameOfCustomElement + "']", $container);
                                var select2Object = javatmp.plugins.select2Wrapper(select);
                                return select;
                            },
                            valueGetter: function (rule) {
                                var $container = rule.$el.find('.rule-value-container');
                                var select = $("select[name='" + rule.nameOfCustomElement + "']", $container);
                                var currentValue = select.val();
                                return currentValue;
                            },
                            valueSetter: function (rule, value) {
                                var $container = rule.$el.find('.rule-value-container');
                                var select = $("select[name='" + rule.nameOfCustomElement + "']", $container);
                                $(select).val(value).trigger("change");
                            }
                        },
                        {
                            id: 'theme',
                            label: '${labels['domain.user.theme']}',
                            type: 'string',
                            input: function (rule, name) {
                                rule.nameOfCustomElement = name;
                                var that = this;
                                var $container = rule.$el.find('.rule-value-container');
                                $($container).append(`
<select class="form-control" name="` + name + `">
        <option value=""></option>
        <c:forEach items="${requestScope.themes}" var="theme">
            <option value="${theme.themetranslationPK.themeId}">${theme.themeName}</option>
        </c:forEach>
</select>
`);
                                var select = $("select[name='" + rule.nameOfCustomElement + "']", $container);
                                var select2Object = javatmp.plugins.select2WrapperForTheme(select);
                                return select;
                            },
                            valueGetter: function (rule) {
                                var $container = rule.$el.find('.rule-value-container');
                                var select = $("select[name='" + rule.nameOfCustomElement + "']", $container);
                                var currentValue = select.val();
                                return currentValue;
                            },
                            valueSetter: function (rule, value) {
                                var $container = rule.$el.find('.rule-value-container');
                                var select = $("select[name='" + rule.nameOfCustomElement + "']", $container);
                                $(select).val(value).trigger("change");
                            }
                        },
                        {
                            id: 'timezone',
                            label: '${labels['domain.user.timezone']}',
                            type: 'string',
                            input: function (rule, name) {
                                rule.nameOfCustomElement = name;
                                var that = this;
                                var $container = rule.$el.find('.rule-value-container');
                                $($container).append(`
<select class="form-control" name="` + name + `">
        <option value=""></option>
        <c:forEach items="${requestScope.timezones}" var="timezone">
            <option value="${timezone.timezonetranslationPK.timezoneId}">${timezone.timezoneNameDescription}</option>
        </c:forEach>
</select>
`);
                                var select = $("select[name='" + rule.nameOfCustomElement + "']", $container);
                                var select2Object = javatmp.plugins.select2Wrapper(select);
                                return select;
                            },
                            valueGetter: function (rule) {
                                var $container = rule.$el.find('.rule-value-container');
                                var select = $("select[name='" + rule.nameOfCustomElement + "']", $container);
                                var currentValue = select.val();
                                return currentValue;
                            },
                            valueSetter: function (rule, value) {
                                var $container = rule.$el.find('.rule-value-container');
                                var select = $("select[name='" + rule.nameOfCustomElement + "']", $container);
                                $(select).val(value).trigger("change");
                            }
                        },
                        {
                            id: 'creationDate',
                            label: '${labels['domain.user.creationDate']}',
                            type: 'string',
                            input: function (rule, name) {
                                rule.nameOfCustomElement = name;
                                var that = this;
                                var $container = rule.$el.find('.rule-value-container');
                                $($container).append(`
        <input class="form-control" name="` + name + `"/>
`);
                                var input = $("input[name='" + rule.nameOfCustomElement + "']", $container);
                                var customInput = javatmp.plugins.daterangepickerWrapperForDateRange(input);
                                customInput.on('change', function () {
                                    var $this = $(this);
                                    javatmp.util.waitForFinalEvent(function () {
                                        var start = $this.data("start");
                                        var end = $this.data("end");
                                        var val = "";
                                        if ((start !== undefined) && (end !== undefined)) {
                                            val = start.locale('en').format(javatmp.settings.networkDateFormat)
                                                    + "##TO##"
                                                    + end.locale('en').format(javatmp.settings.networkDateFormat);
                                        }
                                        api.column(12).search(val ? val : '', false, false).draw();
                                    }, 200, "@userlist-main-table-filter");
                                });
                                return input;
                            },
                            valueGetter: function (rule) {
                                var $container = rule.$el.find('.rule-value-container');
                                var input = $("input[name='" + rule.nameOfCustomElement + "']", $container);
                                var start = input.data("start");
                                var end = input.data("end");
                                var val = input.val();
                                if ((start !== undefined) && (end !== undefined)) {
                                    val = start.locale('en').format(javatmp.settings.networkDateFormat)
                                            + "##TO##"
                                            + end.locale('en').format(javatmp.settings.networkDateFormat);
                                }
                                var currentValue = val;
                                return currentValue;
                            },
                            valueSetter: function (rule, value) {
                                var $container = rule.$el.find('.rule-value-container');
                                var select = $("input[name='" + rule.nameOfCustomElement + "']", $container);
                                $(select).val(value).trigger("change");
                            }
                        }]
                });
                /****************************************************************
                 Triggers and Changers QueryBuilder
                 *****************************************************************/

                $('#btn-get').on('click', function () {
                    var result = $('#builder1').queryBuilder('getRules');
                    if (!$.isEmptyObject(result)) {
                        console.log(JSON.stringify(result, null, 2));
                        alert(JSON.stringify(result, null, 2));
                    } else {
                        console.log("invalid object :");
                    }
                    console.log(result);
                });

                $('#btn-reset').on('click', function () {
                    $('#builder1').queryBuilder('reset');
                });

                //When rules changed :
                $('#builder1').on('getRules.queryBuilder.filter', function (e) {
                    //$log.info(e.value);
                });

            });
        });
    </script>
</div>