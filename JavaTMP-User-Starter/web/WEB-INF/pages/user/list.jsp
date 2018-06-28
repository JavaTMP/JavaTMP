<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="dynamic-ajax-content m-0 p-0">
    <div class="user-list-btn-toolbar my-3" role="toolbar" aria-label="Toolbar with button groups">
        <button type="button" class="btn btn-primary"
                actionType="action-ref-href"
                action-ref-by-href="${pageContext.request.contextPath}/user/CreateUserController">
            <i class="fa fa-fw fa-user"></i>
            Add New User
        </button>
        <button id="UserList-AddNewUserPopupId" type="button" class="btn btn-primary">
            <i class="fa fa-external-link-alt fa-fw"></i>
            Add New User Popup
        </button>
        <button id="UserList-UpdateSelectedUserId" type="button" class="btn btn-primary">
            <i class="fa fa-user-edit fa-fw"></i>
            Update Complete User
        </button>
    </div>
    <table cellspacing="0" class="table table-condensed table-bordered table-hover" id="UsersListTableId">
        <thead>
            <tr>
                <th>ID</th>
                <th>Username</th>
                <th>First name</th>
                <th>Last name</th>
                <th>Date Of Birth</th>
                <th>Age</th>
                <th>E-mail</th>
                <th>Status</th>
                <th>Country Name</th>
                <th>Address</th>
                <th>Language</th>
                <th>Theme</th>
                <th>Timezone</th>
                <th>Creation Date</th>
            </tr>
            <tr id="UserListFilterHeader">
                <th style="width: 100px;">
                    <input id="userlist-id-filter" class="form-control"/>
                </th>
                <th style="width: 150px;">
                    <input id="userlist-username-filter" class="form-control"/>
                </th>
                <th style="width: 150px;">
                    <input id="userlist-firstname-filter" class="form-control"/>
                </th>
                <th style="width: 150px;">
                    <input id="userlist-lastname-filter" class="form-control"/>
                </th>
                <th style="width: 200px;">
                    <input id="userlist-birthdate-filter" class="form-control"/>
                </th>
                <th style="width: 100px;">
                    <input id="userlist-age-filter" class="form-control"/>
                </th>
                <th style="width: 200px;">
                    <input id="userlist-email-filter" class="form-control"/>
                </th>
                <th style="width: 100px;">
                    <select id="userlist-status-filter" class="custom-select">
                        <option value="">-- ALL --</option>
                        <option value="1">Activated</option>
                        <option value="0">Deactivated</option>
                        <option value="-1">Deleted</option>
                    </select>
                </th>
                <th style="width: 200px;">
                    <input id="userlist-country-filter" class="form-control"/>
                </th>
                <th style="width: 150px;">
                    <input id="userlist-address-filter" class="form-control"/>
                </th>
                <th style="width: 100px;">
                    <input id="userlist-language-filter" class="form-control"/>
                </th>
                <th style="width: 100px;">
                    <input id="userlist-theme-filter" class="form-control"/>
                </th>
                <th style="width: 150px;">
                    <input id="userlist-timezone-filter" class="form-control"/>
                </th>
                <th style="width: 200px;">
                    <input id="userlist-creationdate-filter" class="form-control"/>
                </th>
            </tr>
        </thead>
        <tbody></tbody>
    </table>
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
    </style>
    <script type="text/javascript">
        jQuery(function ($) {
            // any code put here will be run after content attach to ajax output container and before
            // controll return to main javascript file.
            var addNewUserPopupButton = $("#UserList-AddNewUserPopupId");
            var updateUserButton = $("#UserList-UpdateSelectedUserId");
            var userTableElement = $('#UsersListTableId');
//            updateUserButton.addClass("disabled");
            function disabled() {
                updateUserButton.prop("disabled", true);
            }
            function enabled() {
                updateUserButton.prop("disabled", false);
            }
            disabled();
            $.fn.dataTable.ext.errMode = 'none';
            var table = userTableElement.DataTable({
                //                responsive: true,
                dom: "<'row'<'col-sm-12 p-0'tr>>" +
                        "<'row'<'col-sm-6'i><'col-sm-6 pt-2 text-right'p>>"
//                        + "<'row'<'col-sm-12'p>>"
                ,
//                select: true,
                select: "single",
                scrollY: 400,
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
                    // replace the contents of the first column (rowid) with an edit link
                    $(row).attr("data-row-id", data.id);
                },
                "drawCallback": function (settings) {
                    disabled();
                },
                initComplete: function (settings, json) {
                    var api = this.api();
                    // prepare id filter search field:
                    var idFilterInput = $("#userlist-id-filter");
                    idFilterInput.on('keyup change', function () {
                        var $this = $(this);
                        javatmp.waitForFinalEvent(function () {
                            var val = $.fn.dataTable.util.escapeRegex($this.val());
                            api.column(0).search(val ? val : '', true, false).draw();
                        }, 400, "@userlist-id-filter");
                    });
                    var usernameFilterInput = $("#userlist-username-filter");
                    usernameFilterInput.on('keyup change', function () {
                        var $this = $(this);
                        javatmp.waitForFinalEvent(function () {
                            var val = $.fn.dataTable.util.escapeRegex($this.val());
                            api.column(1).search(val ? val : '', true, false).draw();
                        }, 400, "@userlist-username-filter");
                    });
                    var firstNameFilterInput = $("#userlist-firstname-filter");
                    firstNameFilterInput.on('keyup change', function () {
                        var $this = $(this);
                        javatmp.waitForFinalEvent(function () {
                            var val = $.fn.dataTable.util.escapeRegex($this.val());
                            api.column(2).search(val ? val : '', true, false).draw();
                        }, 400, "@userlist-firstname-filter");
                    });
                    var lastNameFilterInput = $("#userlist-lastname-filter");
                    lastNameFilterInput.on('keyup change', function () {
                        var $this = $(this);
                        javatmp.waitForFinalEvent(function () {
                            var val = $.fn.dataTable.util.escapeRegex($this.val());
                            api.column(3).search(val ? val : '', true, false).draw();
                        }, 400, "@userlist-lastname-filter");
                    });

                    var birthdateFilterInput = $("#userlist-birthdate-filter");
                    birthdateFilterInput.on('change', function () {
                        var $this = $(this);
                        javatmp.waitForFinalEvent(function () {
                            var val = $this.val();
                            api.column(4).search(val ? val : '', true, false).draw();
                        }, 400, "@userlist-birthdate-filter");
                    });
                    birthdateFilterInput.inputmask({
                        alias: "datetime",
                        placeholder: "dd/mm/yyyy",
                        inputFormat: "dd/mm/yyyy",
                        displayFormat: true,
                        hourFormat: "24",
                        clearMaskOnLostFocus: false
                    });
                    // should be for age 5

                    var emailFilterInput = $("#userlist-email-filter");
                    emailFilterInput.on('keyup change', function () {
                        var $this = $(this);
                        javatmp.waitForFinalEvent(function () {
                            var val = $.fn.dataTable.util.escapeRegex($this.val());
                            api.column(6).search(val ? val : '', true, false).draw();
                        }, 400, "@userlist-email-filter");
                    });

                    var statusFilterInput = $("#userlist-status-filter");
                    statusFilterInput.on('change', function () {
                        var $this = $(this);
                        javatmp.waitForFinalEvent(function () {
//                            var val = $.fn.dataTable.util.escapeRegex($this.val());
                            var val = $this.val();
                            api.column(7).search(val ? val : '', false, false).draw();
                        }, 400, "@userlist-status-filter");
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
                    {data: 'id', className: "",
                        "render": function (data, type, row) {
                            if (type === "display") {
                                return "<p class='m-0 p-0' style='width: 100px;'>" + data + "</p>";
                            } else {
                                return data;
                            }

                        }
                    },
                    {
                        data: 'userName',
                        "render": function (data, type, row) {
                            if (type === "sort" || type === 'type' || type === 'filter') {
                                return data;
                            } else {
                                return "<p class='m-0 p-0' style='width: 150px;'>" + data + "</p>";
                            }
                        }
                    },
                    {
                        data: 'firstName',
                        "render": function (data, type, row) {
                            if (type === "sort" || type === 'type' || type === 'filter') {
                                return data;
                            } else {
                                return "<p class='m-0 p-0' style='width: 150px;'>" + data + "</p>";
                            }

                        }
                    },
                    {
                        data: 'lastName',
                        "render": function (data, type, row) {
                            if (type === "sort" || type === 'type' || type === 'filter') {
                                return data;
                            } else {
                                return "<p class='m-0 p-0' style='width: 150px;'>" + data + "</p>";
                            }

                        }
                    },
                    {
                        data: 'birthDate', "type": "date",
                        "render": function (data, type, row) {
                            if (type === "sort" || type === 'type' || type === 'filter') {
                                return moment(data, "YYYY-MM-DDTHH:mm:ss.SSSZ").format('DD/MM/YYYY HH:mm');
                            } else {
                                return "<p class='m-0 p-0' style='width: 200px;'>" + moment(data, "YYYY-MM-DDTHH:mm:ss.SSSZ").format('DD/MM/YYYY') + "</p>";
                            }
                        }
                    },
                    {
                        data: 'birthDate', "type": "date",
                        "render": function (data, type, row) {
                            data = Math.ceil(moment().diff(moment(data, "YYYY-MM-DDTHH:mm:ss.SSSZ"), 'years', true));
                            if (type === "display") {
                                return "<p class='m-0 p-0' style='width: 100px;'>" + data + "</p>";
                            } else {
                                return data;
                            }
                        }
                    },
                    {data: 'email',
                        "render": function (data, type, row) {
                            if (type === "display") {
                                return "<p class='m-0 p-0 text-truncate' style='width: 200px;'>" + data + "</p>";
                            } else {
                                return data;
                            }

                        }
                    },
                    {data: 'status',
                        "render": function (data, type, row) {

                            var statusMap = {"-1": {label: "Deleted", style: "danger"}, "0": {label: "Deactive", style: "warning"}, "1": {label: "Active", style: "success"}};

                            if (type === "display") {
                                return "<p class='m-0 p-0' style='width: 100px;'><span class='badge badge-" + statusMap[data].style + "'>" + statusMap[data].label + "</span></p>";
                            } else {
                                return data;
                            }

                        }
                    },
                    {
                        data: 'countryId',
                        "render": function (data, type, row) {
                            if (type === "sort" || type === 'type' || type === 'filter') {
                                return data;
                            } else {
                                return "<p class='m-0 p-0' style='width: 200px;'>" + data + "</p>";
                            }

                        }
                    },
                    {data: 'address',
                        "render": function (data, type, row) {
                            if (type === "sort" || type === 'type' || type === 'filter') {
                                return data;
                            } else {
                                return "<p class='m-0 p-0' style='width: 150px;'>Will Be Show</p>";
                            }

                        }
                    },
                    {data: 'lang',
                        "render": function (data, type, row) {
                            if (type === "display") {
                                return "<p class='m-0 p-0' style='width: 100px;'>" + data + "</p>";
                            } else {
                                return data;
                            }

                        }
                    },
                    {data: 'theme',
                        "render": function (data, type, row) {
                            if (type === "display") {
                                return "<p class='m-0 p-0' style='width: 100px;'>" + data + "</p>";
                            } else {
                                return data;
                            }

                        }
                    },
                    {data: 'timezone',
                        "render": function (data, type, row) {
                            if (type === "display") {
                                return "<p class='m-0 p-0 text-truncate' style='width: 150px;'>" + data + "</p>";
                            } else {
                                return data;
                            }

                        }
                    },
                    {data: 'creationDate', "type": "date",
                        "render": function (data, type, row) {
                            if (type === "sort" || type === 'type' || type === 'filter') {
                                return moment(data, "YYYY-MM-DDTHH:mm:ss.SSSZ").format('DD/MM/YYYY HH:mm');
                            } else {
                                return "<p class='m-0 p-0' style='width: 200px;'>" + moment(data, "YYYY-MM-DDTHH:mm:ss.SSSZ").format('DD/MM/YYYY HH:mm') + "</p>";
                            }

                        }}
                ]
            });

            $('tbody', userTableElement).on('contextmenu', 'tr', function () {
                var rowId = $(this).data("row-id");
                if ($(this).hasClass("selected") === false) {
                    table.row(this).select();
                }
                alert("context on " + rowId);
            });

            table.on('select', function (e, dt, type, indexes) {
//                alert("select");
                var rowsData = table.rows(indexes).data().toArray();
                var rowData = rowsData[0];
                enabled();
//                alert("select" + JSON.stringify(rowData));
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
                        url: javatmp.settings.contextPath + "/user/GetUpdateUserPopupController",
                        ajaxContainerReadyEventName: javatmp.settings.javaTmpAjaxContainerReady
                    });
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