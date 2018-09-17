<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="dynamic-ajax-content">
    <table cellspacing="0" class="table table-condensed table-bordered table-hover" id="UsersListTableId">
        <thead>
            <tr id="UserListMainHeader">
                <th style="width: 75px;"><p style="width: 75px;">ID</p></th>
                <th style="width: 150px;"><p style="width: 150px;">Username</p></th>
            </tr>
            <tr id="UserListFilterHeader">
                <th style="width: 75px;">
                    <input id="userlist-id-filter" class="form-control"/>
                </th>
                <th style="width: 150px;">
                    <input id="userlist-username-filter" class="form-control"/>
                </th>
            </tr>
        </thead>
        <tbody>

        </tbody>
    </table>
    <!--<link href="components/" rel="stylesheet">-->
    <style type="text/css">
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
            // here we can reference the container bootstrap modal by its id
            // passed as parameter to request by name "ajaxModalId"
            // or for demo purposese ONLY we can get a reference top modal
            // in current open managed instances in BootstrapModalWrapperFactory
            var currentParentModal = BootstrapModalWrapperFactory.globalModals[BootstrapModalWrapperFactory.globalModals.length - 1];
            //            console.log(currentParentModal.options.id);
            $("#" + currentParentModal.options.id).on(javatmp.settings.javaTmpAjaxContainerReady, function (event, modal) {
                // fire AFTER all transition done and your ajax content is shown to user.

                modal.updateTitle("Select User");
                modal.updateClosable(true);
                modal.addButton({
                    label: "Close",
                    cssClass: "btn btn-danger mr-auto",
                    action: function (modalWrapper, button, buttonData, originalEvent) {
                        return modalWrapper.hide();
                    }
                });
                var selectUserButton = modal.addButton({
                    label: "Select User",
                    cssClass: "btn btn-primary",
                    action: function (modalWrapper, button, buttonData, originalEvent) {
                        var selectedData = table.rows({selected: true}).data();
                        if (selectedData.length > 0) {
                            var selectedRecord = selectedData[0];
                            callbackData.success = true;
                            callbackData.cancel = false;
                            callbackData.userSelected = selectedRecord;
                            return modalWrapper.hide();
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
                        if ($.isFunction(modal.options.passData.callback)) {
                            modal.options.passData.callback.apply();
                        } else if ($.type(modal.options.passData.callback) === "string") {
                            javatmp.util.executeFunctionByName(modal.options.passData.callback, window, callbackData);
                        }
                    }, 200, "@usersLookupPopup");
                    return true;
                });
                modal.originalModal.find(".modal-footer").addClass("justify-content-start");
                modal.originalModal.find(".modal-body").addClass("pt-0");

                var userTableElement = $('#UsersListTableId');

                $.fn.dataTable.ext.errMode = 'none';
                var table = userTableElement.DataTable({
                    dom: "<'row'<'col-sm-12'tr>>" +
                            "<'row'<'col-sm-6'i><'col-sm-6 text-right'l>>"
                            + "<'row'<'col-sm-12'p>>"
                    ,
                    //                select: true,
                    select: "single",
                    scrollY: 300,
                    scrollX: true,
                    "autoWidth": false,
                    fixedColumns: true,
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
                        var idFilterInput = $("#userlist-id-filter");
                        idFilterInput.on('keyup', function () {
                            var $this = $(this);
                            javatmp.util.waitForFinalEvent(function () {
                                var val = $.fn.dataTable.util.escapeRegex($this.val());
                                api.column(0).search(val ? val : '', true, false).draw();
                            }, 200, "@userlist-main-table-filter");
                        });
                        var usernameFilterInput = $("#userlist-username-filter");
                        usernameFilterInput.on('keyup', function () {
                            var $this = $(this);
                            javatmp.util.waitForFinalEvent(function () {
                                var val = $.fn.dataTable.util.escapeRegex($this.val());
                                api.column(1).search(val ? val : '', true, false).draw();
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
                        {
                            data: 'id', className: "", name: "id", width: 75,
                            "render": function (data, type, row) {
                                if (type === "display") {
                                    return "<p class='m-0 p-0' style='width: 75px;'>" + data + "</p>";
                                } else {
                                    return data;
                                }
                            }
                        },
                        {
                            data: 'userName', name: "userName", width: 150,
                            "render": function (data, type, row) {
                                if (type === "display") {
                                    return "<p class='m-0 p-0' style='width: 150px;'>" + data + "</p>";
                                } else {
                                    return data;
                                }
                            }
                        }
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