<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<div class="dynamic-ajax-content">
    <div class="form-row">
        <div class="col-12">
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
        </div>
    </div>
    <div class="form-row">
        <div class="col-sm-7">
            <table cellspacing="0" class="table table-condensed table-bordered table-hover" id="UsersListTableId">
                <thead>
                    <tr id="UserListMainHeader">
                        <th style="width: 5rem;"><p style="width: 5rem;">${labels['domain.user.id']}</p></th>
                        <th style="width: 9rem;"><p style="width: 9rem;">${labels['domain.user.userName']}</p></th>
                        <th style="width: 7rem;"><p style="width: 7rem;">${labels['domain.user.firstName']}</p></th>
                        <th style="width: 7rem;"><p style="width: 7rem;">${labels['domain.user.lastName']}</p></th>
                        <th style="width: 8rem;"><p style="width: 8rem;">${labels['domain.user.birthDate']}</p></th>
                        <th style="width: 3rem;"><p style="width: 3rem;">${labels['domain.user.age']}</p></th>
                        <th style="width: 8rem;"><p style="width: 8rem;">${labels['domain.user.email']}</p></th>
                        <th style="width: 6rem;"><p style="width: 6rem;">${labels['domain.user.status']}</p></th>
                        <th style="width: 8rem;"><p style="width: 8rem;">${labels['domain.user.country']}</p></th>
                        <th style="width: 10rem;"><p style="width: 10rem;">${labels['domain.user.lang']}</p></th>
                        <th style="width: 10rem;"><p style="width: 10rem;">${labels['domain.user.theme']}</p></th>
                        <th style="width: 10rem;"><p style="width: 10rem;">${labels['domain.user.timezone']}</p></th>
                        <th style="width: 8rem;"><p style="width: 8rem;">${labels['domain.user.creationDate']}</p></th>
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
                        <th style="width: 8rem;">
                            <input id="userlist-email-filter" class="form-control"/>
                        </th>
                        <th style="width: 6rem;">
                            <select id="userlist-status-filter" class="form-control">
                                <option value="">ALL Statuses</option>
                                <option value="1">Activated</option>
                                <option value="0">Deactivated</option>
                            </select>
                        </th>
                        <th style="width: 8rem;">
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
                                            <option value="${timezone.timezoneId}">${timezone.timezoneName}</option>
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
        <div class="col-sm-5">
            <div class="card mb-3 bg-light shadow">
                <div class="card-header">
                    ${labels['page.listUsers.userDetails']}
                    <div class="options float-right">
                        <a href="#" class="collapse"><i class="fa fa-chevron-up"></i></a>
                        <a href="#" class="fullscreen"><i class=" fa fa-expand"></i></a>
                    </div>
                </div>
                <div class="card-body p-0">
                    <div class="scroll-content" style="height: 500px;">
                        <form enctype="multipart/form-data" autocomplete="off" id="SearchForUserProfileFormId" class="form m-3"
                              action="${pageContext.request.contextPath}/user/UpdateCompleteUserController" method="post" novalidate="novalidate">
                            <div class="form-row">
                                <div class="col-lg-6">
                                    <div class="form-group">
                                        <label class="control-label">${labels['domain.user.userName']}</label>
                                        <input class="form-control" type="text" autocomplete="off" placeholder="${labels['domain.user.userName']}"
                                               name="userName" value="">
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="form-group">
                                        <label class="control-label">${labels['domain.user.status']}</label>
                                        <select name="status" class="custom-select">
                                            <option value="">${labels['page.text.kindlySelect']}</option>
                                            <option value="1">Activated</option>
                                            <option value="0">Deactivated</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="col-lg-6">
                                    <div class="form-group">
                                        <label class="control-label">${labels['domain.user.firstName']}</label>
                                        <input class="form-control" type="text" placeholder="${labels['domain.user.firstName']}" name="firstName" value="">
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="form-group">
                                        <label class="control-label">${labels['domain.user.lastName']}</label>
                                        <input class="form-control" type="text" placeholder="${labels['domain.user.lastName']}" name="lastName" value="">
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="form-group">
                                        <label class="control-label">${labels['domain.user.birthDate']}</label>
                                        <input dir="ltr" class="form-control"  type="text" name="birthDate" value="">
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="form-group">
                                        <label class="control-label">${labels['domain.user.email']}</label>
                                        <input class="form-control" type="text" placeholder="${labels['domain.user.email']}" name="email" value="">
                                    </div>
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="col-lg-6">
                                    <div class="form-group">
                                        <label class="control-label">${labels['domain.user.country']}</label>
                                        <select name="countryId" class="form-control">
                                            <c:choose>
                                                <c:when test="${fn:length(requestScope.countries) > 0}">
                                                    <option value="">${labels['page.text.kindlySelect']}</option>
                                                    <c:forEach items="${requestScope.countries}" var="country">
                                                        <option value="${country.countrytranslationPK.countryId}">${country.countryName}</option>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>
                                                    <option value="">No Record Found</option>
                                                </c:otherwise>
                                            </c:choose>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="form-group">
                                        <label class="control-label">${labels['domain.user.lang']}</label>
                                        <select name="lang" class="form-control">
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
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="form-group">
                                        <label class="control-label">${labels['domain.user.theme']}</label>
                                        <select name="theme" class="form-control">
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
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="form-group">
                                        <label class="control-label">${labels['domain.user.timezone']}</label>
                                        <select name="timezone" class="form-control">
                                            <option value="">${labels['page.text.kindlySelect']}</option>
                                            <c:choose>
                                                <c:when test="${fn:length(requestScope.timezones) > 0}">
                                                    <option value="">Choose ...</option>
                                                    <c:forEach items="${requestScope.timezones}" var="timezone">
                                                        <option value="${timezone.timezoneId}">${timezone.timezoneName}</option>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>
                                                    <option value="-1">No Record Found</option>
                                                </c:otherwise>
                                            </c:choose>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="col-lg-6 text-center">
                                    <div style="width: 200px; height: 200px;display: inline-block;position: relative">
                                        <div id="profilePicturePreviewContainerId" style="width: 200px; height: 200px;">
                                            <img id="profilePicturePreview" src="${pageContext.request.contextPath}/assets/img/default-profile-pic.png" alt="Your Profile Image Preview" />
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-6 text-center">
                                    <img id="profilePictureResizePreview" style="width: 200px; height: 200px;" src="${pageContext.request.contextPath}/assets/img/default-profile-pic.png" alt="Your Profile Image Preview" />
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="col-lg-12">
                                    <div class="form-group text-center">
                                        <input name="profilePictureStr" type="text" readonly="" hidden="" value=""/>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label">${labels['domain.user.address']}</label>
                                <textarea rows="7" class="form-control forceValidate" placeholder="" name="address"></textarea>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
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
        #UserListFilterHeader th {
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
        }
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

            $('.scroll-content').mCustomScrollbar(javatmp.settings.mCustomScrollbarOptions);


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
            function enabled() {
                updateUserButton.prop("disabled", false);
                deleteUserButton.prop("disabled", false);
                activateUserButton.prop("disabled", false);
                deActivateUserButton.prop("disabled", false);
            }
            disabled();
            $.fn.dataTable.ext.errMode = 'none';
            var table = userTableElement.DataTable({
                // https://datatables.net/reference/option/dom
                dom: "<'row'>" +
                        "<'row'<'col-sm-12'tr>>" +
                        "<'row'<'col-sm-6 col-md-2 pt-2'l><'col-sm-6 col-md-3'i><'col-sm-12 col-md-7'p>>",
//                dom: "<'row'<'col-sm-12 p-0'tr>>" +
//                        "<'row'<'col-sm-4'i><'col-sm-4'p><'col-sm-4 pt-2 text-right'l>>"
//                ,
//                select: true,
                select: "single",
                scrollY: 250,
                scrollX: true,
                "autoWidth": false,
                fixedColumns: true,
                scrollCollapse: false,
                "searching": true,
                searchDelay: 500,
                orderCellsTop: true, // important to for two row header with filteration below header column names.
                "processing": true,
                "serverSide": true,
                "rowCallback": function (row, data, index) {
                    // replace the contents of the first column (rowid) with an edit link
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
                "ajax": {
                    "type": "POST",
                    "url": javatmp.settings.contextPath + "/user/ListUsersController",
                    dataType: "json",
                    contentType: "application/json; charset=UTF-8",
                    "data": function (currentDate) {
                        currentDate._ajaxGlobalBlockUI = false; // window blocked until data return
                        return JSON.stringify(currentDate);
                    },
                    "dataSrc": function (json) {
                        json["recordsTotal"] = json.data.recordsTotal;
                        json["recordsFiltered"] = json.data.recordsFiltered;
                        return json.data.data;
                    }
                },
                columns: [
                    {data: 'id',
                        "createdCell111": function (td, cellData, rowData, row, col) {
                            console.log(table.init().columns[col]);
                            $(td).css({"width": "1000px", "background-color": "red"});
                            $(td).addClass("text-white");
                            $(title).css({"width": "100rem"});
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
                    {data: 'email', name: "email", width: "9rem", "render": javatmp.plugins.DataTableColRenderWrapper("10rem")},
                    {data: 'status', name: "status", width: "7rem",
                        "render": function (data, type, row) {
                            var statusMap = {"0": {label: "Deactive", style: "warning"}, "1": {label: "Active", style: "success"}};
                            if (type === "display") {
                                return "<p class='m-0 p-0' style='width: 7rem;'><span class='badge badge-" + statusMap[data].style + "'>" + statusMap[data].label + "</span></p>";
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

            var form = $('#SearchForUserProfileFormId');
            var birthDateInputMask = javatmp.plugins.inputmaskWrapperForDate(form.find("input[name='birthDate']"));
            var birthDateDatePicker = javatmp.plugins.daterangepickerWrapperForDate(form.find("input[name='birthDate']"));
            var addressEditor = javatmp.plugins.summernoteWrapper(form.find("textarea[name='address']"));
            var langSelect = javatmp.plugins.select2Wrapper(form.find("select[name='lang']"));
            var timezoneSelect = javatmp.plugins.select2Wrapper(form.find("select[name='timezone']"));
            var themeSelect = javatmp.plugins.select2WrapperForTheme(form.find("select[name='theme']"));
            var countryIdSelect = javatmp.plugins.select2WrapperForCountry(form.find("select[name='countryId']"));
            var profilePicScrollbars = javatmp.plugins.mCustomScrollbarForProfilePicture(form.find("#profilePicturePreviewContainerId"));

            table.on('select', function (e, dt, type, indexes) {
                //                alert("select");
                var rowsData = table.rows(indexes).data().toArray();
                var rowData = rowsData[0];
                enabled();

                var rowObject = rowData;
                window.javatmp.plugins.populateForm(form, rowObject);
                form.find("textarea[name='address']").summernote('code', rowObject.address);
//                    form.find("textarea[name='address']").summernote('triggerEvent', 'change');
                form.find("input[name='birthDate']").val(moment(rowObject.birthDate, javatmp.settings.networkDateFormat).locale('en').format(javatmp.settings.dateFormat));

                var image = form.find("img[id='profilePicturePreview']");
                var resizeImage = form.find("img[id='profilePictureResizePreview']");

                var avatarImageSrc = javatmp.settings.contextPath + "/assets/img/default-profile-pic.png";
                if (rowObject.profilePicDocumentId) {
                    avatarImageSrc = javatmp.settings.contextPath
                            + "/ViewUploadedFileController?documentId=" + rowObject.profilePicDocumentId
                            + "&randomHash=" + rowObject.profilePicDocument.randomHash
                            + "&viewType=inline";
                }

                image.attr('src', avatarImageSrc);
                resizeImage.attr('src', avatarImageSrc);

            }).on('deselect', function (e, dt, type, indexes) {
                //                alert("descelect");
                var rowsData = table.rows(indexes).data().toArray();
                var rowData = rowsData[0];
                disabled();
                //                alert("descelect" + JSON.stringify(rowData));
            });

            addNewUserPopupButton.on("click", function (event) {
                var passData = {};
                passData.callback = "actionCallback";
                BootstrapModalWrapperFactory.createAjaxModal({
                    message: '<div class="text-center"><i class="fa fa-sync fa-spin fa-3x fa-fw text-primary"></i></div>',
                    passData: passData,
                    updateSizeAfterDataFetchTo: "modal-lg", // default is  or null for standard or "modal-sm"
                    size: "modal-lg",
                    url: javatmp.settings.contextPath + "/user/GetCreateNewUserPopupController",
                    ajaxContainerReadyEventName: javatmp.settings.javaTmpAjaxContainerReady
                });

            });
            updateUserButton.on("click", function (event) {
                //                var selectedCount = table.rows({selected: true}).count();
                var selectedData = table.rows({selected: true}).data();
                if (selectedData.length > 0) {
                    var selectedRecord = selectedData[0];
                    //                    alert("row[" + JSON.stringify(selectedRecord) + "]");
                    var passData = {};
                    passData.callback = "actionCallback";
                    passData.id = selectedRecord.id;
                    BootstrapModalWrapperFactory.createAjaxModal({
                        message: '<div class="text-center"><i class="fa fa-sync fa-spin fa-3x fa-fw text-primary"></i></div>',
                        passData: passData,
                        updateSizeAfterDataFetchTo: "modal-lg", // default is  or null for standard or "modal-sm"
                        size: "modal-lg",
                        url: javatmp.settings.contextPath + "/user/GetUpdateUserPopupController",
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
            window.actionCallback = function (callbackData) {
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