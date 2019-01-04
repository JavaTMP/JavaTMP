<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="dynamic-ajax-content">
    <h5 class="my-3">General Ledger</h5>
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
                    <table id="GeneralLedgerAccountsTable" class="table table-sm table-condensed table-hover table-bordered">
                        <thead>
                            <tr>
                                <th></th>
                                <th>Account Code</th>
                                <th>Account Name</th>
                                <th>Debit</th>
                                <th>Credit</th>
                                <th>Balance</th>
                                <th>Account Group</th>
                                <th>Id</th>
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

            var currencyRenderFunc = function (data, type, row, meta) {
                if (type === "display") {
                    return numeral(data).format('(0,0.00)');
                } else {
                    return data;
                }
            };

            var generalLedgerAccountsTable = $('#GeneralLedgerAccountsTable');
            var table = generalLedgerAccountsTable.DataTable({
                // https://datatables.net/reference/option/dom
                dom: "<'row'>" +
                        "<'row'<'col-sm-12'tr>>" +
                        "<'row'>",
                //                dom: "<'row'<'col-sm-12 p-0'tr>>" +
                //                        "<'row'<'col-sm-4'i><'col-sm-4'p><'col-sm-4 pt-2 text-right'l>>"
                //                ,
                //                select: true,
                keys: true,
                select: "single",
                scrollY: false,
                scrollX: false,
                "autoWidth": false,
                scrollCollapse: true,
                "searching": true,
                searchDelay: 500,
                orderCellsTop: true, // important to for two row header with filteration below header column names.
                "processing": true,
                "serverSide": true,
                "ordering": false,
                "order": [[1, 'asc']],
                "pageLength": 1000000,
                fixedColumns: false,
                "rowCallback": function (row, data, index) {
                    $(row).attr("data-row-id", data.id);
                },
                "drawCallback": function (settings) {

                },
                initComplete: function (settings, json) {
                    var api = this.api();
                    // prepare id filter search field:
                },
                "ajax": {
                    "type": "POST",
                    "url": javatmp.settings.contextPath + "/accounting/GeneralLedger",
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
                        "class": "details-control",
                        "orderable": false,
                        "data": null,
                        "defaultContent": ""
                    },
                    {data: 'accountCode', name: "accountCode"},
                    {data: 'name', name: "name"},
                    {data: 'debit', name: "debit", "render": currencyRenderFunc},
                    {data: 'credit', name: "credit", "render": currencyRenderFunc},
                    {data: 'balance', name: "balance", "render": currencyRenderFunc},
                    {data: 'accountgroup.name', name: "accountGroup"},
                    {data: 'id', name: "id"}
                ]
            });

            function format(d, transDivId) {
                return `<div class="ml-0 my-0 p-1 border" id="` + transDivId + `">
                            <table id="detail-table` + transDivId + `" cellspacing="0" class="table table-sm table-condensed table-bordered">
                                <thead>
                                    <tr>
                                        <th>id</th>
                                        <th>transactionId</th>
                                        <th>accountId</th>
                                        <th>moduleId</th>
                                        <th>moduleRefId</th>
                                        <th>moduleTypeId</th>
                                        <th>amount</th>
                                        <th>status</th>
                                        <th>description</th>
                                    </tr>
                                </thead>
                                <tbody></tbody>
                            </table>
                        </div>`;
            }

            function generateDetailTable(d, transDivId) {
                var detailsTable = $("#detail-table" + transDivId);
                var table = detailsTable.DataTable({
                    // https://datatables.net/reference/option/dom
                    dom: "<'row'>" +
                            "<'row'<'col-sm-12'tr>>" +
                            "<'row'>",
                    //                dom: "<'row'<'col-sm-12 p-0'tr>>" +
                    //                        "<'row'<'col-sm-4'i><'col-sm-4'p><'col-sm-4 pt-2 text-right'l>>"
                    //                ,
                    //                select: true,
                    keys: true,
                    select: "single",
                    scrollY: true,
                    scrollX: true,
                    "autoWidth": false,
                    scrollCollapse: false,
                    "searching": true,
                    searchDelay: 500,
                    orderCellsTop: true, // important to for two row header with filteration below header column names.
                    "processing": true,
                    "serverSide": true,
                    "rowCallback": function (row, data, index) {
                    },
                    "drawCallback": function (settings) {
                    },
                    initComplete: function (settings, json) {
                        var api = this.api();
                        // prepare id filter search field:
                    },
                    "ajax": {
                        "type": "POST",
                        "url": javatmp.settings.contextPath + "/accounting/ListEntries",
                        dataType: "json",
                        contentType: "application/json; charset=UTF-8",
                        "data": function (currentDate) {
                            currentDate._ajaxGlobalBlockUI = false; // window blocked until data return
                            currentDate.columns[2].search.value = d.id;
                            return JSON.stringify(currentDate);
                        },
                        "dataSrc": function (json) {
                            json["recordsTotal"] = json.data.recordsTotal;
                            json["recordsFiltered"] = json.data.recordsFiltered;
                            return json.data.data;
                        }
                    },
                    columns: [
                        {data: 'id', name: "id"},
                        {data: 'transactionId', "visible": true, name: "transactionId"},
                        {data: 'accountId', name: "accountId"},
                        {data: 'moduleId', name: "moduleId"},
                        {data: 'moduleRefId', name: "moduleRefId"},
                        {data: 'moduleTypeId', name: "moduleTypeId"},
                        {data: 'amount', name: "amount"},
                        {data: 'status', "visible": true, name: "status"},
                        {data: 'description', "visible": true, name: "description"}
                    ]
                });
            }

            $('tbody', generalLedgerAccountsTable).on('click', 'td.details-control', function () {
                var tr = $(this).closest('tr');
                var row = table.row(tr);
                var glAcctEntriesDivId = "gl-acct-entries-" + row.data().id;
                if (row.child.isShown()) {
                    // This row is already open - close it
                    row.child.hide();
                    tr.removeClass('shown');
                } else {
                    // Open this row
                    row.child(format(row.data(), glAcctEntriesDivId)).show();
                    generateDetailTable(row.data(), glAcctEntriesDivId);
                    tr.addClass('shown');
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