<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<div class="dynamic-ajax-content grid-gutter-padding">
    <h4 class="my-3">Advanced Users Search</h4>
    <hr/>
    <div class="form-row">
        <div class="col-6">
            <div class="card">
                <div class="card-body p-1">
                    <div id="builder1"></div>
                    <button class="btn btn-primary" id="btn-get">Search</button>
                    <button class="btn btn-secondary" id="btn-reset">Reset</button>
                    </body>
                </div>
            </div>
        </div>
        <div class="col-6">
            <div class="card">
                <div class="card-body pt-0 p-1">
                    <table cellspacing="0" class="table table-condensed table-bordered table-hover" id="UsersListTableId">
                        <thead>
                            <tr>
                                <th style="width: 5rem;"><p class="m-0 p-0" style="width: 5rem;">${labels['domain.user.id']}</p></th>
                                <th style="width: 9rem;"><p class="m-0 p-0" style="width: 9rem;">${labels['domain.user.userName']}</p></th>
                                <th style="width: 7rem;"><p class="m-0 p-0" style="width: 7rem;">${labels['domain.user.firstName']}</p></th>
                                <th style="width: 7rem;"><p class="m-0 p-0" style="width: 7rem;">${labels['domain.user.lastName']}</p></th>
                                <th style="width: 8rem;"><p class="m-0 p-0" style="width: 8rem;">${labels['domain.user.birthDate']}</p></th>
                                <th style="width: 3rem;"><p class="m-0 p-0" style="width: 3rem;">${labels['domain.user.age']}</p></th>
                                <th style="width: 12rem;"><p class="m-0 p-0" style="width: 12rem;">${labels['domain.user.email']}</p></th>
                                <th style="width: 10rem;"><p class="m-0 p-0" style="width: 10rem;">${labels['domain.user.status']}</p></th>
                                <th style="width: 8rem;"><p class="m-0 p-0" style="width: 8rem;">${labels['domain.user.country']}</p></th>
                                <th style="width: 10rem;"><p class="m-0 p-0" style="width: 10rem;">${labels['domain.user.lang']}</p></th>
                                <th style="width: 10rem;"><p class="m-0 p-0" style="width: 10rem;">${labels['domain.user.theme']}</p></th>
                                <th style="width: 10rem;"><p class="m-0 p-0" style="width: 10rem;">${labels['domain.user.timezone']}</p></th>
                                <th style="width: 8rem;"><p class="m-0 p-0" style="width: 8rem;">${labels['domain.user.creationDate']}</p></th>
                            </tr>
                            <tr id="UserListFilterHeader">
                                <th style="width: 5rem;">
                                    <input id="userlist-id-filter" class="form-control"/>
                                </th>
                                <th style="width: 9rem;">
                                    <input id="userlist-username-filter" class="form-control"/>
                                </th>
                                <th style="width: 7rem;">
                                    <input id="userlist-firstname-filter" class="form-control"/>
                                </th>
                                <th style="width: 7rem;">
                                    <input id="userlist-lastname-filter" class="form-control"/>
                                </th>
                                <th style="width: 8rem;">
                                    <input id="userlist-birthdate-filter" class="form-control" dir="ltr"/>
                                </th>
                                <th style="width: 3rem;">
                                    <input id="userlist-age-filter" class="form-control"/>
                                </th>
                                <th style="width: 12rem;">
                                    <input id="userlist-email-filter" class="form-control"/>
                                </th>
                                <th style="width: 10rem;">
                                    <select id="userlist-status-filter" class="form-control">
                                        <option value="">ALL Statuses</option>
                                        <option value="1">Activated</option>
                                        <option value="0">Deactivated</option>
                                    </select>
                                </th>
                                <th style="width: 8rem;">
                                    <p class="m-0 p-0" style="width: 10rem;">
                                        <select id="userlist-country-filter" class="form-control">
                                            <c:choose>
                                                <c:when test="${fn:length(requestScope.countries) > 0}">
                                                    <option value="">All Countries</option>
                                                    <c:forEach items="${requestScope.countries}" var="country">
                                                        <option value="${country.countrytranslationPK.countryId}">${country.countryName}</option>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>
                                                    <option value="-1">${labels['page.text.noRecordFound']}</option>
                                                </c:otherwise>
                                            </c:choose>
                                        </select>
                                    </p>
                                </th>
                                <th style="width: 10rem;">
                                    <select id="userlist-language-filter" name="lang" class="form-control">
                                        <c:choose>
                                            <c:when test="${fn:length(requestScope.languages) > 0}">
                                                <option value="">${labels['page.text.kindlySelect']}</option>
                                                <c:forEach items="${requestScope.languages}" var="language">
                                                    <option value="${language.languagetranslationPK.languageId}">${language.languageName}</option>
                                                </c:forEach>
                                            </c:when>
                                            <c:otherwise>
                                                <option value="">${labels['page.text.noRecordFound']}</option>
                                            </c:otherwise>
                                        </c:choose>
                                    </select>
                                </th>
                                <th style="width: 10rem;">
                                    <select id="userlist-theme-filter" name="theme" class="form-control">
                                        <c:choose>
                                            <c:when test="${fn:length(requestScope.themes) > 0}">
                                                <option value="">${labels['page.text.kindlySelect']}</option>
                                                <c:forEach items="${requestScope.themes}" var="theme">
                                                    <option value="${theme.themetranslationPK.themeId}">${theme.themeName}</option>
                                                </c:forEach>
                                            </c:when>
                                            <c:otherwise>
                                                <option value="">${labels['page.text.noRecordFound']}</option>
                                            </c:otherwise>
                                        </c:choose>
                                    </select>
                                </th>
                                <th style="width: 10rem;">
                                    <select id="userlist-timezone-filter" name="timezone" class="form-control">
                                        <c:choose>
                                            <c:when test="${fn:length(requestScope.timezones) > 0}">
                                                <option value="">All Timezones</option>
                                                <c:forEach items="${requestScope.timezones}" var="timezone">
                                                    <option value="${timezone.timezonetranslationPK.timezoneId}">${timezone.timezoneNameDescription}</option>
                                                </c:forEach>
                                            </c:when>
                                            <c:otherwise>
                                                <option value="-1">${labels['page.text.noRecordFound']}</option>
                                            </c:otherwise>
                                        </c:choose>
                                    </select>
                                </th>
                                <th style="width: 8rem;">
                                    <input id="userlist-creationdate-filter" class="form-control"/>
                                </th>
                            </tr>
                        </thead>
                        <tbody></tbody>
                    </table>
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
                var countriesMap = {};
                var countriesSelect = $("#userlist-country-filter");
                var languagesMap = {};
                var languagesSelect = $("#userlist-language-filter");
                var themesMap = {};
                var themesSelect = $("#userlist-theme-filter");
                var timezonesMap = {};
                var timezoneSelect = $("#userlist-timezone-filter");
                $("option", countriesSelect).map(function (i, item) {
                    var text = $(item).text();
                    var value = $(item).attr("value");
                    if (!(value === "-1" || value === "")) {
                        countriesMap[value] = text;
                    }
                });
                $("option", languagesSelect).map(function (i, item) {
                    var text = $(item).text();
                    var value = $(item).attr("value");
                    if (!(value === "-1" || value === "")) {
                        languagesMap[value] = text;
                    }
                });
                $("option", themesSelect).map(function (i, item) {
                    var text = $(item).text();
                    var value = $(item).attr("value");
                    if (!(value === "-1" || value === "")) {
                        themesMap[value] = text;
                    }
                });
                $("option", timezoneSelect).map(function (i, item) {
                    var text = $(item).text();
                    var value = $(item).attr("value");
                    if (!(value === "-1" || value === "")) {
                        timezonesMap[value] = text;
                    }
                });

                var table = null;
                var queryBuilder = null;

                $(javatmp.settings.defaultOutputSelector).on(javatmp.settings.javaTmpContainerResizeEventName, function (event) {
                    // fire when user resize browser window or sidebar hide / show
                });
                $(javatmp.settings.defaultOutputSelector).on(javatmp.settings.cardFullscreenCompress, function (event, card) {
                    // when card compress by pressing the top right tool button
                    table.columns.adjust();
                });
                $(javatmp.settings.defaultOutputSelector).on(javatmp.settings.cardFullscreenExpand, function (event, card) {
                    // when card Expand by pressing the top right tool button
                    table.columns.adjust();
                });

                /**
                 * When another sidebar menu item pressed and before container issues new ajax request.
                 * You can cancel, destroy, or remove any thing here before replace main output ajax container.
                 * return false or event.preventDefault() will cancel ajax and stay you in the current page and do nothing.
                 **/
                $(javatmp.settings.defaultOutputSelector).on(javatmp.settings.javaTmpContainerRemoveEventName, function (event) {
                    var newLink = $(event._newTarget);
                    table.clear();
                    table.destroy(true);
                    return true;
                });

                var userTableElement = $('#UsersListTableId');

                table = javatmp.plugins.DataTableAjaxWrapper(userTableElement, {
                    "ajax": {
                        "data": function (currentData) {
                            currentData._ajaxGlobalBlockUI = false; // window blocked until data return
                            if (queryBuilder) {
                                var result = $(queryBuilder).queryBuilder('getRules');
                                console.log(JSON.stringify(result, null, 2));
                                currentData.advancedSearchQuery = result;
                            }
                            return JSON.stringify(currentData);
                        },
                        "url": javatmp.settings.contextPath + "/user/ListUsersController"
                    },
                    "rowCallback": function (row, data, displayNum, displayIndex, dataIndex) {
                        // replace the contents of the first column (rowid) with an edit link
                        var api = this.api();
                        var init = api.init();
//                    $(row).attr("data-row-id", "null");
                    },
                    "drawCallback": function (settings) {
//                        disabled();
                    },
                    initComplete: function (settings, json) {
                        var api = this.api();
                        // prepare id filter search field:
                        var idFilterInput = $("#userlist-id-filter").on('keyup', javatmp.plugins.DataTableColFilterEventWrapper(api, 0));
                        var usernameFilterInput = $("#userlist-username-filter").on('keyup', javatmp.plugins.DataTableColFilterEventWrapper(api, 1));
                        var firstNameFilterInput = $("#userlist-firstname-filter").on('keyup', javatmp.plugins.DataTableColFilterEventWrapper(api, 2));
                        var lastNameFilterInput = $("#userlist-lastname-filter").on('keyup', javatmp.plugins.DataTableColFilterEventWrapper(api, 3));
                        var birthdateFilterInput = $("#userlist-birthdate-filter").on('change', javatmp.plugins.DataTableColFilterEventWrapper(api, 4, false));
                        var birthDateInputMask = javatmp.plugins.inputmaskWrapperForDate(birthdateFilterInput);
                        var birthDateDatePicker = javatmp.plugins.daterangepickerWrapperForDate(birthdateFilterInput);
                        var ageFilterInput = $("#userlist-age-filter").on('keyup', javatmp.plugins.DataTableColFilterEventWrapper(api, 5, false));
                        var emailFilterInput = $("#userlist-email-filter").on('keyup', javatmp.plugins.DataTableColFilterEventWrapper(api, 6, false));
                        var statusFilterInput = $("#userlist-status-filter");
                        var statusSelect = javatmp.plugins.select2Wrapper(statusFilterInput).on("select2:close", javatmp.plugins.DataTableColFilterEventWrapper(api, 7));
                        var countryFilterInput = $("#userlist-country-filter");
                        var countryIdSelect = javatmp.plugins.select2WrapperForCountry(countryFilterInput).on("select2:close", javatmp.plugins.DataTableColFilterEventWrapper(api, 8));
                        var languageFilterInput = $("#userlist-language-filter");
                        var langSelect = javatmp.plugins.select2Wrapper(languageFilterInput).on("select2:close", javatmp.plugins.DataTableColFilterEventWrapper(api, 9));
                        var themeFilterInput = $("#userlist-theme-filter");
                        var themeSelect = javatmp.plugins.select2WrapperForTheme(themeFilterInput).on("select2:close", javatmp.plugins.DataTableColFilterEventWrapper(api, 10));
                        var timezoneFilterInput = $("#userlist-timezone-filter");
                        var timezoneSelect = javatmp.plugins.select2Wrapper(timezoneFilterInput).on("select2:close", javatmp.plugins.DataTableColFilterEventWrapper(api, 11));
                        var creationdateFilterInput = $("#userlist-creationdate-filter");
                        var creationdateFilterRange = javatmp.plugins.daterangepickerWrapperForDateRange(creationdateFilterInput);
                        creationdateFilterInput.on('change', function () {
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
                    },
                    columns: [
                        {data: 'id',
                            "createdCell": function (td, cellData, rowData, row, col) {
//                            console.log(table.init().columns[col]);
                                $(td).addClass("text-center");
                            },
                            className: "", name: "id", width: "6rem", "render": javatmp.plugins.DataTableColRenderWrapper("6rem")},
                        {data: 'userName', name: "userName", width: "10rem", "render": javatmp.plugins.DataTableColRenderWrapper("10rem")},
                        {data: 'firstName', name: "firstName", width: "8rem", "render": javatmp.plugins.DataTableColRenderWrapper("8rem")},
                        {data: 'lastName', name: "lastName", width: "8rem", "render": javatmp.plugins.DataTableColRenderWrapper("8rem")},
                        {data: 'birthDate', "type": "date", name: "birthDate", width: "9rem", "render": javatmp.plugins.DataTableColRenderWrapper("9rem")},
                        {data: 'birthDate', name: "age", "type": "date", width: "4rem",
                            "render": function (data, type, row) {
                                data = Math.ceil(moment().diff(moment(data, javatmp.settings.networkDateFormat), 'years', true));
                                if (type === "display") {
                                    return "<p class='m-0 p-0' style='width: 4rem;'>" + data + "</p>";
                                } else {
                                    return data;
                                }
                            }
                        },
                        {data: 'email', name: "email", width: "14rem", "render": javatmp.plugins.DataTableColRenderWrapper("14rem")},
                        {data: 'status', className: "text-center", name: "status", width: "12rem",
                            "render": function (data, type, row) {
                                var statusMap = {"0": {label: "Deactive", style: "warning"}, "1": {label: "Active", style: "success"}};
                                if (type === "display") {
                                    return "<p class='m-0 p-0' style='width: 12rem;'><span class='badge badge-" + statusMap[data].style + "'>" + statusMap[data].label + "</span></p>";
                                } else {
                                    return data;
                                }
                            }
                        },
                        {data: 'countryId', name: "countryId", width: "9rem", "render": javatmp.plugins.DataTableColRenderWrapper("9rem", countriesMap)},
                        {data: 'lang', name: "lang", width: "10rem", "render": javatmp.plugins.DataTableColRenderWrapper("10rem", languagesMap)},
                        {data: 'theme', name: "theme", width: "10rem", "render": javatmp.plugins.DataTableColRenderWrapper("10rem", themesMap)},
                        {data: 'timezone', name: "timezone", width: "11rem", "render": javatmp.plugins.DataTableColRenderWrapper("11rem", timezonesMap)},
                        {data: 'creationDate', "type": "date", name: "creationDate", width: "9rem", "render": javatmp.plugins.DataTableColRenderWrapper("9rem")}
                    ]
                });

                var defaultIcons = {
                    add_group: 'fas fa-plus-square',
                    add_rule: 'fas fa-plus-circle',
                    remove_group: 'fas fa-minus-square',
                    remove_rule: 'fas fa-minus-circle',
                    error: 'fas fa-exclamation-triangle'
                };


                queryBuilder = $('#builder1').queryBuilder({
                    icons: defaultIcons,
                    allow_empty: true,
                    display_empty_filter: true,
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
                                console.log(rule.operator);
                                var $container = rule.$el.find('.rule-value-container');
                                $($container).append(`<input  name="` + name + `" class="form-control birthdate-filter" dir="ltr"/>`);
                                var birthDateSelect = $("input[name='" + name + "']", $container);
                                var birthDateInputMask = javatmp.plugins.inputmaskWrapperForDate(birthDateSelect);
                                var birthDateDatePicker = javatmp.plugins.daterangepickerWrapperForDate(birthDateSelect);
                                $(birthDateSelect).val(moment().format(javatmp.plugins.settings.dateFormat));
                                return birthDateSelect;
                            },
                            valueGetter: function (rule) {

                                var $container = rule.$el.find('.rule-value-container');
                                var birthDateSelect = $(".birthdate-filter", $container);
                                var currentValue = $(birthDateSelect).val();
                                console.log(currentValue);
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
                            field: "countryId",
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

                $('#btn-get').on('click', function (event) {
                    event.preventDefault();
                    var result = $(queryBuilder).queryBuilder('getRules');
                    if (!$.isEmptyObject(result)) {
                        console.log(JSON.stringify(result, null, 2));
//                        alert(JSON.stringify(result, null, 2));
                        table.draw();
                    } else {
                        console.log("invalid object :");
                    }
                    console.log(result);
                });

                $('#btn-reset').on('click', function () {
                    $(queryBuilder).queryBuilder('reset');
                    table.draw();
                });

                //When rules changed :
                $('#builder1').on('getRules.queryBuilder.filter', function (e) {
                    //$log.info(e.value);
                });

            });
        });
    </script>
</div>