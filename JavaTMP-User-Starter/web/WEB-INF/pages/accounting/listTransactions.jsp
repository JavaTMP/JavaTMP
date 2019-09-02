<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="dynamic-ajax-content grid-gutter-padding">
    <h5 class="my-3">Transactions List</h5>
    <hr/>
    <div class="row">
        <div class="col">
            <div class="card">
                <div class="card-header">
                    <div class="options float-right">
                        <a href="#" class="collapse"><i class="fa fa-chevron-up"></i></a>
                        <a href="#" class="fullscreen"><i class=" fa fa-expand"></i></a>
                    </div>
                </div>
                <div class="card-body p-1">
                    <table cellspacing="0" class="table table-sm table-condensed table-bordered" id="TransactionList">
                        <thead>
                            <tr>
                                <th></th>
                                <th style="width: 3rem;"><p class="m-0 p-0" style="width: 3rem;">ID</p></th>
                                <th style="width: 10rem;"><p class="m-0 p-0" style="width: 10rem;">Code</p></th>
                                <th style="width: 10rem;"><p class="m-0 p-0" style="width: 10rem;">Transaction Date</p></th>
                                <th style="width: 10rem;"><p class="m-0 p-0" style="width: 10rem;">note</p></th>
                                <th style="width: 10rem;"><p class="m-0 p-0" style="width: 10rem;">specialNumber</p></th>
                                <th style="width: 10rem;"><p class="m-0 p-0" style="width: 10rem;">entity</p></th>
                                <th style="width: 10rem;"><p class="m-0 p-0" style="width: 10rem;">status</p></th>
                                <th style="width: 10rem;"><p class="m-0 p-0" style="width: 10rem;">voucherTypeId</p></th>
                                <th style="width: 10rem;"><p class="m-0 p-0" style="width: 10rem;">creationDate</p></th>
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
        #TransactionList tbody tr {
            cursor: pointer;
        }

        td.details-control {
            font-family: 'Font Awesome 5 Free';
            font-weight: 900;
            cursor: pointer;
            text-align: center;
            width: 1.25em;
        }
        td.details-control:before {
            content: "\f105";
        }
        tr.shown td.details-control:before {
            content: "\f107";
        }
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

            var listTableElement = $('#TransactionList');
            var table = javatmp.plugins.DataTableAjaxWrapper(listTableElement, {
                "order": [[1, 'asc']],
                "rowCallback": function (row, data, index) {
                    $(row).attr("data-row-id", data.id);
                },
                "ajax": {
                    "url": javatmp.settings.contextPath + "/accounting/listTransactions"
                },
                columns: [
                    {
                        "class": "details-control",
                        "orderable": false,
                        "data": null,
                        "defaultContent": ""
                    },
                    {data: 'id', name: "id", width: "3rem", "render": javatmp.plugins.DataTableColRenderWrapper("3rem")},
                    {data: 'code', name: "code", width: "10rem", "render": javatmp.plugins.DataTableColRenderWrapper("10rem")},
                    {data: 'transactionDate', name: "transactionDate", "type": "date", width: "10rem", "render": javatmp.plugins.DataTableColRenderWrapper("10rem")},
                    {data: 'note', name: "note", width: "10rem", "render": javatmp.plugins.DataTableColRenderWrapper("10rem")},
                    {data: 'specialNumber', name: "specialNumber", width: "10rem", "render": javatmp.plugins.DataTableColRenderWrapper("10rem")},
                    {data: 'entity', name: "entity", width: "10rem", "render": javatmp.plugins.DataTableColRenderWrapper("10rem")},
                    {data: 'status', name: "status", width: "10rem", "render": javatmp.plugins.DataTableColRenderWrapper("10rem")},
                    {data: 'voucherTypeId', name: "voucherTypeId", width: "10rem", "render": javatmp.plugins.DataTableColRenderWrapper("10rem")},
                    {data: 'creationDate', name: "creationDate", "type": "date", width: "10rem", "render": javatmp.plugins.DataTableColRenderWrapper("10rem")}
                ]
            });
            function format(d, transDivId) {
                return `<table id="detail-table` + transDivId + `" cellspacing="0" class="table table-sm table-condensed table-bordered">
                                <thead>
                                    <tr>
                                        <th style="width: 3rem;"><p class="m-0 p-0" style="width: 3rem;">id</p></th>
                                        <th style="width: 10rem;"><p class="m-0 p-0" style="width: 10rem;">transactionId</p></th>
                                        <th style="width: 10rem;"><p class="m-0 p-0" style="width: 10rem;">accountId</p></th>
                                        <th style="width: 10rem;"><p class="m-0 p-0" style="width: 10rem;">amount</p></th>
                                        <th style="width: 10rem;"><p class="m-0 p-0" style="width: 10rem;">status</p></th>
                                        <th style="width: 10rem;"><p class="m-0 p-0" style="width: 10rem;">description</p></th>
                                    </tr>
                                </thead>
                                <tbody></tbody>
                            </table>`;
            }

            function generateDetailTable(d, transDivId) {
                var detailsTable = $("#detail-table" + transDivId);
                var table = javatmp.plugins.DataTableAjaxWrapper(detailsTable, {
                    "ajax": {
                        "url": javatmp.settings.contextPath + "/accounting/ListEntries",
                        "data": function (currentDate) {
                            currentDate._ajaxGlobalBlockUI = false; // window blocked until data return
                            currentDate.columns[1].search.value = d.id;
                            return JSON.stringify(currentDate);
                        }
                    },
                    columns: [
                        {data: 'id', name: "id", width: "3rem", "render": javatmp.plugins.DataTableColRenderWrapper("3rem")},
                        {data: 'transactionId', "visible": true, name: "transactionId", width: "10rem", "render": javatmp.plugins.DataTableColRenderWrapper("10rem")},
                        {data: 'accountId', name: "accountId", width: "10rem", "render": javatmp.plugins.DataTableColRenderWrapper("10rem")},
                        {data: 'amount', name: "amount", width: "10rem", "render": javatmp.plugins.DataTableColRenderWrapper("10rem")},
                        {data: 'status', "visible": true, name: "status", width: "10rem", "render": javatmp.plugins.DataTableColRenderWrapper("10rem")},
                        {data: 'description', "visible": true, name: "description", width: "10rem", "render": javatmp.plugins.DataTableColRenderWrapper("10rem")}
                    ]
                });
            }

// Add event listener for opening and closing details
            $('tbody', listTableElement).on('click', 'td.details-control', function () {
                var tr = $(this).closest('tr');
                var row = table.row(tr);
                var transDivId = "trans-" + row.data().id;
                if (row.child.isShown()) {
                    // This row is already open - close it
                    row.child.hide();
                    tr.removeClass('shown');
                } else {
                    // Open this row
                    row.child(format(row.data(), transDivId)).show();
                    generateDetailTable(row.data(), transDivId);
                    tr.addClass('shown');
                }
            });
            var addNewPopupButton = $("#TableList-AddNewPopupId");
            addNewPopupButton.on("click", function (event) {
                BootstrapModalWrapperFactory.createAjaxModal({
                    message: '<div class="text-center"><i class="fa fa-sync fa-spin fa-3x fa-fw text-primary"></i></div>',
                    title: "${labels['global.loadingText']}",
                    passData: {},
                    updateSizeAfterDataFetchTo: null, // default is  or null for standard or "modal-sm"
                    //                        size: "modal-lg",
                    url: javatmp.settings.contextPath + "/customer/AddNewCustomerPopup",
                    ajaxContainerReadyEventName: javatmp.settings.javaTmpAjaxContainerReady,
                    localData: {
                        callback: function (callbackData) {
                            if (callbackData.cancel === true) {
                            } else {
                                table.columns.adjust().draw();
                            }
                        }
                    }
                });
            });
            var updateSelectedButton = $("#TableList-UpdatePopupId");
            updateSelectedButton.on("click", function (event) {

                BootstrapModalWrapperFactory.showMessage("<span class='text-danger'>Sorry This feature is not supported yet</span>");
                return;
                //                var selectedCount = table.rows({selected: true}).count();
                var selectedData = table.rows({selected: true}).data();
                if (selectedData.length > 0) {
                    var selectedRecord = selectedData[0];
                    BootstrapModalWrapperFactory.createAjaxModal({
                        message: '<div class="text-center"><i class="fa fa-sync fa-spin fa-3x fa-fw text-primary"></i></div>',
                        passData: selectedRecord,
                        updateSizeAfterDataFetchTo: null, // default is  or null for standard or "modal-sm"
                        //                            size: "modal-lg",
                        url: javatmp.settings.contextPath + "/accounting/UpdateAccountPopup",
                        ajaxContainerReadyEventName: javatmp.settings.javaTmpAjaxContainerReady,
                        localData: {
                            callback: function (callbackData) {
                                if (callbackData.cancel === true) {
                                } else {
                                    table.columns.adjust().draw();
                                }
                            }
                        }
                    });
                } else {
                    BootstrapModalWrapperFactory.showMessage("Kindly Select a record from the table");
                }
            });
            var deleteSelectedButton = $("#TableList-DeletePopupId");
            deleteSelectedButton.on("click", function (event) {
                var selectedData = table.rows({selected: true}).data();
                if (selectedData.length > 0) {
                    var selectedRecord = selectedData[0];
                    window.javatmp.plugins.confirmAjaxAction(
                            "Delete Customer Confirmation",
                            "Are You Sure You want to delete selected Customer ?",
                            "Delete Customer",
                            javatmp.settings.labels["global.cancel"],
                            javatmp.settings.contextPath + "/customer/DeleteCustomer",
                            selectedRecord,
                            function (data) {
                                table.columns.adjust().draw();
                            }
                    );
                } else {
                    BootstrapModalWrapperFactory.showMessage("Kindly Select a record from the table");
                }
            });
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
             * When another sidebar menu item pressed and before container issues new ajax request.
             * You can cancel, destroy, or remove any thing here before replace main output ajax container.
             * return false or event.preventDefault() will cancel ajax and stay you in the current page and do nothing.
             **/
            $(javatmp.settings.defaultOutputSelector).on(javatmp.settings.javaTmpContainerRemoveEventName, function (event) {
                $(javatmp.settings.defaultOutputSelector).off(javatmp.settings.cardFullscreenCompress);
                $(javatmp.settings.defaultOutputSelector).off(javatmp.settings.cardFullscreenExpand);
                table.clear();
                table.destroy(true);
                return true;
            });
        });
    </script>
</div>