<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="dynamic-ajax-content grid-gutter-padding">
    <table cellspacing="0" class="table table-condensed table-bordered table-hover" id="UsersListTableId">
        <thead>
            <tr>
                <th>${labels['domain.user.id']}</th>
                <th>${labels['domain.user.userName']}</th>
                <th>${labels['domain.user.firstName']}</th>
                <th>${labels['domain.user.lastName']}</th>
            </tr>
            <tr>
                <th style="width: 3rem;">
                    <input id="userlist-id-filter" class="form-control"/>
                </th>
                <th style="width: 10rem;">
                    <input id="userlist-username-filter" class="form-control"/>
                </th>
                <th style="width: 10rem;">
                    <input id="userlist-firstname-filter" class="form-control"/>
                </th>
                <th style="width: 10rem;">
                    <input id="userlist-lastname-filter" class="form-control"/>
                </th>
            </tr>
        </thead>
        <tbody>

        </tbody>
    </table>
    <!--<link href="components/" rel="stylesheet">-->
    <style type="text/css">
        table.dataTable tbody tr {
            cursor: pointer;
        }
    </style>
    <script type="text/javascript">
        jQuery(function ($) {
            // here we can reference the container bootstrap modal by its id
            // passed as parameter to request by name "ajaxModalId"
            // or for demo purposese ONLY we can get a reference top modal
            // in current open managed instances in BootstrapModalWrapperFactory
            var currentParentModal = BootstrapModalWrapperFactory.globalModals[BootstrapModalWrapperFactory.globalModals.length - 1];
            //            console.log(currentParentModal.options.id);
            $("#" + currentParentModal.options.id).on(javatmp.settings.javaTmpAjaxContainerReady, function (event, modal) {
                // fire AFTER all transition done and your ajax content is shown to user.

                modal.updateTitle(javatmp.settings.labels["user.dialog.selectUserLookup.title"]);
                modal.updateClosable(true);
                modal.addButton({
                    label: javatmp.settings.labels["user.dialog.selectUserLookup.cancelBtn"],
                    cssClass: "btn btn-danger mr-auto",
                    action: function (button, buttonData, originalEvent) {
                        return this.hide();
                    }
                });
                var selectUserButton = modal.addButton({
                    label: javatmp.settings.labels["user.dialog.selectUserLookup.selectBtn"],
                    cssClass: "btn btn-primary",
                    action: function (button, buttonData, originalEvent) {
                        var selectedData = table.rows({selected: true}).data();
                        if (selectedData.length > 0) {
                            var selectedRecord = selectedData[0];
                            callbackData.success = true;
                            callbackData.cancel = false;
                            callbackData.userSelected = selectedRecord;
                            return this.hide();
                        } else {
                            BootstrapModalWrapperFactory.showMessage("Kindly Select a record from the table");
                        }
                    }
                });
                var callbackData = {success: false, cancel: true};
                modal.setOnDestroy(function (modalWrapper) {
                    modalWrapper.setOnDestroy(null);
                    // here we run passing function name as a remote callback
                    javatmp.util.waitForFinalEvent(function () {
                        if ($.isFunction(modal.options.ajax.passData.callback)) {
                            modal.options.ajax.passData.callback.apply(modal, callbackData);
                        } else if ($.type(modal.options.ajax.passData.callback) === "string") {
                            javatmp.util.executeFunctionByName(modal.options.ajax.passData.callback, window, callbackData);
                        }
                    }, 200, "@usersLookupPopup");
                    return true;
                });
                modal.originalModal.find(".modal-footer").addClass("justify-content-start");
                modal.originalModal.find(".modal-body").addClass("pt-0");
                var userTableElement = $('#UsersListTableId');
                var table = userTableElement.DataTable({
                    dom: "<'row'<'col-sm-12'tr>>" +
                            "<'row'<'col-sm-12'i>>"
                            + "<'row'<'col-sm-4'l><'col-sm-8'p>>"
                    ,
                    //                select: true,
                    keys: true,
                    select: "single",
                    scrollY: 300,
                    scrollX: true,
                    "autoWidth": false,
                    scrollCollapse: true,
                    "searching": true,
                    searchDelay: 500,
                    orderCellsTop: true, // important to for two row header with filteration below header column names.
                    "processing": true,
                    "serverSide": true,
                    "rowCallback": function (row, data, index) {
                    },
                    "drawCallback": function (settings) {
                        selectUserButton.prop("disabled", true);
                    },
                    initComplete: function (settings, json) {
                        var api = this.api();
                        // prepare id filter search field:
                        var idFilterInput = $("#userlist-id-filter").on('keyup', javatmp.plugins.DataTableColFilterEventWrapper(api, 0));
                        var usernameFilterInput = $("#userlist-username-filter").on('keyup', javatmp.plugins.DataTableColFilterEventWrapper(api, 1));
                        var firstNameFilterInput = $("#userlist-firstname-filter").on('keyup', javatmp.plugins.DataTableColFilterEventWrapper(api, 2));
                        var lastNameFilterInput = $("#userlist-lastname-filter").on('keyup', javatmp.plugins.DataTableColFilterEventWrapper(api, 3));
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
                        {data: 'id', className: "", name: "id", width: "3rem", "render": javatmp.plugins.DataTableColRenderWrapper("6rem")},
                        {data: 'userName', name: "userName", width: "10rem", "render": javatmp.plugins.DataTableColRenderWrapper("10rem")},
                        {data: 'firstName', name: "firstName", width: "10rem", "render": javatmp.plugins.DataTableColRenderWrapper("10rem")},
                        {data: 'lastName', name: "lastName", width: "10rem", "render": javatmp.plugins.DataTableColRenderWrapper("10rem")}
                    ]
                });
                table.on('select', function (e, dt, type, indexes) {
                    selectUserButton.prop("disabled", false);
                }).on('deselect', function (e, dt, type, indexes) {
                    selectUserButton.prop("disabled", true);
                });
            });
        });
    </script>
</div>