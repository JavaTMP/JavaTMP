<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<div class="dynamic-ajax-content grid-gutter-padding">
    <div class="user-list-btn-toolbar my-3" role="toolbar" aria-label="Toolbar with button groups">
        <button type="button" class="btn btn-primary"
                action-name="Add-New-User-Action"
                actionType="action-ref-href"
                action-ref-by-href="${pageContext.request.contextPath}/user/CreateUserController">
            <i class="fa fa-fw fa-user"></i>
            ${labels['page.btn.addNewUserPage']}
        </button>
        <button action-name="Add-New-User-Popup-Action" id="UserList-AddNewUserPopupId" type="button" class="btn btn-primary">
            <i class="fa fa-external-link-alt fa-fw"></i>
            ${labels['page.btn.addNewUserPopup']}
        </button>
        <button
            id="UserList-AddNewUserByWizardPopupId"
            action-name="Add-New-User-By-Wizard-Popup-Action"
            type="button"
            class="btn btn-primary">
            Add User By Wizard Popup
        </button>
        <button action-name="Update-Complete-User-Action" id="UserList-UpdateSelectedUserId" type="button" class="btn btn-primary">
            <i class="fa fa-user-edit fa-fw"></i>
            ${labels['page.btn.updateCompleteUser']}
        </button>
        <button action-name="Delete-User-Action" id="UserList-DeleteSelectedUserId" type="button" class="btn btn-primary">
            <i class="fa fa-user-times fa-fw text-danger"></i>
            ${labels['page.btn.deleteUser']}
        </button>
        <button action-name="Activate-User-Action" id="UserList-ActivateSelectedUserId" type="button" class="btn btn-primary">
            <i class="fa fa-user-check fa-fw text-success"></i>
            ${labels['page.btn.activateUser']}
        </button>
        <button action-name="Deactivate-User-Action" id="UserList-DeactivateSelectedUserId" type="button" class="btn btn-primary">
            <i class="fa fa-user-slash fa-fw text-warning"></i>
            ${labels['page.btn.deactivateUser']}
        </button>
    </div>
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
    <div id="contextMenu" class="dropdown-menu" role="menu" style="display:none;position: fixed;" >
        <a tabindex="-1" class="dropdown-item" href="javascript:;" actionType="action-ref" action-ref-by-name="Add-New-User-Action">
            <i class="fa fa-fw fa-user text-primary"></i>
            ${labels['domain.user.CreateNewUser']}
        </a>
        <a tabindex="-1" class="dropdown-item" href="javascript:;" actionType="action-ref" action-ref-by-name="Add-New-User-Popup-Action">
            <i class="fa fa-external-link-alt fa-fw text-primary"></i>
            ${labels['page.btn.addNewUserPopup']}
        </a>
        <a tabindex="-1" class="dropdown-item" href="javascript:;" actionType="action-ref" action-ref-by-name="Update-Complete-User-Action">
            <i class="fa fa-user-edit fa-fw text-primary"></i>
            ${labels['page.btn.updateCompleteUser']}
        </a>
        <a tabindex="-1" class="dropdown-item" href="javascript:;" actionType="action-ref" action-ref-by-name="Activate-User-Action">
            <i class="fa fa-user-check fa-fw text-success"></i>
            ${labels['page.btn.activateUser']}
        </a>
        <a tabindex="-1" class="dropdown-item" href="javascript:;" actionType="action-ref" action-ref-by-name="Deactivate-User-Action">
            <i class="fa fa-user-slash fa-fw text-warning"></i>
            ${labels['page.btn.deactivateUser']}
        </a>
        <div class="dropdown-divider"></div>
        <a tabindex="-1" class="dropdown-item" href="javascript:;" actionType="action-ref" action-ref-by-name="Delete-User-Action">
            <i class="fa fa-user-times fa-fw text-danger"></i>
            ${labels['page.btn.deleteUser']}
        </a>
    </div>
    <style type="text/css">
        table.dataTable tbody tr {
            cursor: pointer;
        }
        /*        #UserListFilterHeader th {
                    padding: 0;
                }

                #UserListFilterHeader th > .form-control {
                    border-radius: 0;
                }
                #UserListFilterHeader th > .custom-select {
                    border-radius: 0;
                }
                #UserListMainHeader th > p {
                    margin-bottom: 0;
                }*/
    </style>
    <script type="text/javascript">
        jQuery(function ($) {
            // any code put here will be run after content attach to ajax output container and before
            // controll return to main javascript file.

            // build lookup map for countries:
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
            var addNewUserPopupButton = $("#UserList-AddNewUserPopupId");
            var addNewUserByWizardPopupButton = $("#UserList-AddNewUserByWizardPopupId");
            var updateUserButton = $("#UserList-UpdateSelectedUserId");
            var deleteUserButton = $("#UserList-DeleteSelectedUserId");
            var activateUserButton = $("#UserList-ActivateSelectedUserId");
            var deActivateUserButton = $("#UserList-DeactivateSelectedUserId");
            var userTableElement = $('#UsersListTableId');
//            updateUserButton.addClass("disabled");
            function disabled() {
                updateUserButton.prop("disabled", true);
                deleteUserButton.prop("disabled", true);
                activateUserButton.prop("disabled", true);
                deActivateUserButton.prop("disabled", true);
            }
            function enabled(record) {
                updateUserButton.prop("disabled", false);
                deleteUserButton.prop("disabled", false);
                if (record.status !== 1) {
                    activateUserButton.prop("disabled", false);
                }
                if (record.status !== 0) {
                    deActivateUserButton.prop("disabled", false);
                }
            }
            disabled();

            var table = javatmp.plugins.DataTableAjaxWrapper(userTableElement, {
                "ajax": {
                    "url": javatmp.settings.contextPath + "/user/ListUsersController"
                },
                "rowCallback": function (row, data, displayNum, displayIndex, dataIndex) {
                    // replace the contents of the first column (rowid) with an edit link
                    var api = this.api();
                    $(row).attr("data-row-id", data.id);
                },
                "drawCallback": function (settings) {
                    disabled();
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
                            console.log(table.init().columns[col]);
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

            window.javatmp.plugins.contextMenuWrapper($('tbody', userTableElement), 'tr[data-row-id]', $("#contextMenu"));

            table.on('select', function (e, dt, type, indexes) {
                var rowsData = table.rows(indexes).data().toArray();
                var rowData = rowsData[0];
                enabled(rowData);
            }).on('deselect', function (e, dt, type, indexes) {
                var rowsData = table.rows(indexes).data().toArray();
                var rowData = rowsData[0];
                disabled();
            });
            addNewUserPopupButton.on("click", function (event) {
                BootstrapModalWrapperFactory.createAjaxModal({
                    message: '<div class="text-center"><i class="fa fa-sync fa-spin fa-3x fa-fw text-primary"></i></div>',
                    title: "${labels['global.loadingText']}",
                    updateSizeAfterDataFetchTo: "modal-lg", // default is  or null for standard or "modal-sm"
                    size: "modal-lg",
                    localData: {
                        callback: actionCallback
                    },
                    ajax: {
                        url: javatmp.settings.contextPath + "/user/GetCreateNewUserPopupController",
                        data: {}
                    },
                    ajaxContainerReadyEventName: javatmp.settings.javaTmpAjaxContainerReady
                });
            });
            addNewUserByWizardPopupButton.on("click", function (event) {
                BootstrapModalWrapperFactory.createAjaxModal({
                    message: '<div class="text-center"><i class="fa fa-sync fa-spin fa-3x fa-fw text-primary"></i></div>',
                    title: "${labels['global.loadingText']}",
                    updateSizeAfterDataFetchTo: "modal-lg", // default is  or null for standard or "modal-sm"
                    size: "modal-lg",
                    localData: {
                        callback: actionCallback
                    },
                    ajax: {
                        url: javatmp.settings.contextPath + "/pages/user/addUserByWizardPopup",
                        data: {}
                    },
                    ajaxContainerReadyEventName: javatmp.settings.javaTmpAjaxContainerReady
                });
            });
            updateUserButton.on("click", function (event) {
                //                var selectedCount = table.rows({selected: true}).count();
                var selectedData = table.rows({selected: true}).data();
                if (selectedData.length > 0) {
                    var selectedRecord = selectedData[0];
                    BootstrapModalWrapperFactory.createAjaxModal({
                        message: '<div class="text-center"><i class="fa fa-sync fa-spin fa-3x fa-fw text-primary"></i></div>',
                        updateSizeAfterDataFetchTo: "modal-lg", // default is  or null for standard or "modal-sm"
                        size: "modal-lg",
                        localData: {
                            callback: actionCallback
                        },
                        ajax: {
                            url: javatmp.settings.contextPath + "/user/GetUpdateUserPopupController",
                            data: {
                                id: selectedRecord.id
                            }
                        },
                        ajaxContainerReadyEventName: javatmp.settings.javaTmpAjaxContainerReady
                    });
                } else {
                    BootstrapModalWrapperFactory.showMessage("Kindly Select a record from the table");
                }

            });
            deleteUserButton.on("click", function (event) {
                var selectedData = table.rows({selected: true}).data();
                if (selectedData.length > 0) {
                    var selectedRecord = selectedData[0];
                    window.javatmp.plugins.confirmAjaxAction(
                            javatmp.settings.labels["dialog.delete.title"],
                            javatmp.settings.labels["dialog.delete.message"],
                            javatmp.settings.labels["page.btn.deleteUser"],
                            javatmp.settings.labels["global.cancel"],
                            javatmp.settings.contextPath + "/user/DeleteUserController",
                            selectedRecord,
                            function (data) {
                                table.columns.adjust().draw();
                            }
                    );
                } else {
                    BootstrapModalWrapperFactory.showMessage("Kindly Select a record from the table");
                }
            });
            activateUserButton.on("click", function (event) {
                var selectedData = table.rows({selected: true}).data();
                if (selectedData.length > 0) {
                    var selectedRecord = selectedData[0];
                    window.javatmp.plugins.confirmAjaxAction(
                            javatmp.settings.labels["dialog.activate.title"],
                            javatmp.settings.labels["dialog.activate.message"],
                            javatmp.settings.labels["page.btn.activateUser"],
                            javatmp.settings.labels["global.cancel"],
                            javatmp.settings.contextPath + "/user/ActivateUserController",
                            selectedRecord,
                            function (data) {
                                table.columns.adjust().draw();
                            }
                    );
                } else {
                    BootstrapModalWrapperFactory.showMessage("Kindly Select a record from the table");
                }

            });
            deActivateUserButton.on("click", function (event) {
                var selectedData = table.rows({selected: true}).data();
                if (selectedData.length > 0) {
                    var selectedRecord = selectedData[0];
                    window.javatmp.plugins.confirmAjaxAction(
                            javatmp.settings.labels["dialog.inActivate.title"],
                            javatmp.settings.labels["dialog.inActivate.message"],
                            javatmp.settings.labels["page.btn.deactivateUser"],
                            javatmp.settings.labels["global.cancel"],
                            javatmp.settings.contextPath + "/user/DeactivateUserController",
                            selectedRecord,
                            function (data) {
                                table.columns.adjust().draw();
                            }
                    );
                } else {
                    BootstrapModalWrapperFactory.showMessage("Kindly Select a record from the table");
                }

            });

            var actionCallback = function (callbackData) {
                if (callbackData.cancel === true) {
                } else {
                    table.columns.adjust().draw();
                }
            };
            $(javatmp.settings.defaultOutputSelector).on(javatmp.settings.javaTmpAjaxContainerReady, function (event) {
                // fire AFTER all transition done and your ajax content is shown to user.
            });
            $(javatmp.settings.defaultOutputSelector).on(javatmp.settings.javaTmpContainerResizeEventName, function (event) {
                // fire when user resize browser window or sidebar hide / show
                table.columns.adjust().draw();
            });
            $(javatmp.settings.defaultOutputSelector).on(javatmp.settings.cardFullscreenCompress, function (event, card) {
                // when card compress by pressing the top right tool button
                table.columns.adjust().draw();
            });
            $(javatmp.settings.defaultOutputSelector).on(javatmp.settings.cardFullscreenExpand, function (event, card) {
                // when card Expand by pressing the top right tool button
                table.columns.adjust().draw();
            });
            /**
             * When another sidebar menu item pressed and before container replaced with new ajax content.
             * You can cancel, destroy, or remove any thing here before replace main output ajax container.
             * returning false will cancel the new request and do nothing.
             **/
            $(javatmp.settings.defaultOutputSelector).on(javatmp.settings.javaTmpContainerRemoveEventName, function (event) {
                $(javatmp.settings.defaultOutputSelector).off(javatmp.settings.cardFullscreenCompress);
                $(javatmp.settings.defaultOutputSelector).off(javatmp.settings.cardFullscreenExpand);
                // it is important to destroy table before leaving current ajax page
                // so the fixedHeader will not be kept on site pages.
                table.clear();
                table.destroy(true);
                return true;
            });
        });
    </script>
</div>