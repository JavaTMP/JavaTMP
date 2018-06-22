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
            <tr id="filterHeader">
                <th></th>
                <th></th>
                <th></th>
                <th></th>
                <th></th>
                <th></th>
                <th></th>
                <th></th>
                <th></th>
                <th></th>
                <th></th>
                <th></th>
                <th></th>
                <th></th>
            </tr>
        </thead>
        <tbody></tbody>
    </table>
    <style type="text/css">
        table.dataTable tbody tr {
            cursor: pointer;
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
                dom: "<'row'<'col-sm-12 px-0'tr>>" +
                        "<'row'<'col-sm-6'i><'col-sm-6 pt-2 text-right'l>>" +
                        "<'row'<'col-sm-12'p>>",
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
                },
                "ajax": {
                    "type": "POST",
                    "url": javatmp.settings.contextPath + "/user/ListUsersController",
                    dataType: "json",
                    contentType: "application/json; charset=UTF-8",
                    "data": function (currentDate) {
                        currentDate._ajaxGlobalBlockUI = false; // window blocked until data return
                        currentDate._ajaxGlobalBlockUI = false;
                        return JSON.stringify(currentDate);
                    },
                    "dataSrc": function (json) {
                        json["recordsTotal"] = json.data.recordsTotal;
                        json["recordsFiltered"] = json.data.recordsFiltered;
                        return json.data.data;
                    }
                },
                columns: [
                    {data: 'id', "width": 50, className: ""},
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
                        "width": 100,
                        "render": function (data, type, row) {
                            if (type === "sort" || type === 'type' || type === 'filter') {
                                return data;
                            } else {
                                return "<p class='m-0 p-0' style='width: 150px;'>" + data + "</p>";
                            }

                        }
                    },
                    {
                        data: 'birthDate', "type": "date", "width": 150,
                        "render": function (data, type, row) {
                            if (type === "sort" || type === 'type' || type === 'filter') {
                                return moment(data, "YYYY-MM-DDTHH:mm:ss.SSSZ").format('DD/MM/YYYY HH:mm');
                            } else {
                                return "<p class='m-0 p-0' style='width: 150px;'>" + moment(data, "YYYY-MM-DDTHH:mm:ss.SSSZ").format('DD/MM/YYYY') + "</p>";
                            }
                        }
                    },
                    {
                        data: 'birthDate', "type": "date", "width": 35,
                        "render": function (data, type, row) {
                            return Math.ceil(moment().diff(moment(data, "YYYY-MM-DDTHH:mm:ss.SSSZ"), 'years', true));
                        }
                    },
                    {data: 'email', "width": 150},
                    {data: 'status', "width": 150},
                    {
                        data: 'countryId',
                        "render": function (data, type, row) {
                            if (type === "sort" || type === 'type' || type === 'filter') {
                                return data;
                            } else {
                                return "<p class='m-0 p-0' style='width: 150px;'>" + data + "</p>";
                            }

                        }
                    },
                    {data: 'address', "width": 150,
                        "render": function (data, type, row) {
                            if (type === "sort" || type === 'type' || type === 'filter') {
                                return data;
                            } else {
                                return "<p class='m-0 p-0' style='width: 150px;'>Will Be Show</p>";
                            }

                        }
                    },
                    {data: 'lang', "width": 150},
                    {data: 'theme', "width": 150},
                    {data: 'timezone', "width": 150},
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