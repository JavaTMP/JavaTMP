<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="dynamic-ajax-content grid-gutter-padding">
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
            var table = javatmp.plugins.DataTableAjaxWrapper(generalLedgerAccountsTable, {
                "order": [[1, 'asc']],
                "pageLength": 100,
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
                    "url": javatmp.settings.contextPath + "/accounting/GeneralLedger"
                },
                columns: [
                    {title: '', "class": "details-control", "orderable": false, "data": null, "defaultContent": ""},
                    {title: 'Account Code', data: 'accountCode', name: "accountCode"},
                    {title: 'Account Name', data: 'name', name: "name"},
                    {title: 'Debit', data: 'debit', name: "debit", "render": currencyRenderFunc},
                    {title: 'Credit', data: 'credit', name: "credit", "render": currencyRenderFunc},
                    {title: 'Balance', data: 'balance', name: "balance", "render": currencyRenderFunc},
                    {title: 'Account Group', data: 'accountgroup.name', name: "accountGroup"},
                    {title: 'Id', data: 'id', name: "id"}
                ]
            });

            function format(d, transDivId) {
                return `<div class="ml-0 my-0 p-1 border" id="` + transDivId + `">
                            <table id="detail-table` + transDivId + `" cellspacing="0" class="table table-sm table-condensed table-bordered">
                            </table>
                        </div>`;
            }

            function generateDetailTable(d, transDivId) {
                var detailsTable = $("#detail-table" + transDivId);
                var table = javatmp.plugins.DataTableAjaxWrapper(detailsTable, {
                    "order": [[0, "asc"], [3, "asc"]],
                    "ajax": {
                        "url": javatmp.settings.contextPath + "/accounting/ListEntries",
                        "data": function (currentDate) {
                            currentDate._ajaxGlobalBlockUI = false; // window blocked until data return
                            currentDate.columns[5].search.value = d.id;
                            return JSON.stringify(currentDate);
                        }
                    },
                    columns: [
                        {title: 'entryDate', data: 'entryDate', name: "entryDate", "type": "date", width: "7rem", "render": javatmp.plugins.DataTableColRenderWrapper("7rem")},
                        {title: 'sourceDocument', data: 'sourceDocument', name: "sourceDocument"},
                        {title: 'code', data: 'code', name: "code"},
                        {title: 'id', data: 'id', name: "id"},
                        {title: 'transactionId', data: 'transactionId', "visible": true, name: "transactionId"},
                        {title: 'accountId', data: 'accountId', name: "accountId", "visible": false},
                        {title: 'debit', data: 'debit', name: "debit", "render": currencyRenderFunc},
                        {title: 'credit', data: 'credit', name: "credit", "render": currencyRenderFunc},
                        {title: 'balance', data: 'accountBalance', name: "accountBalance", "render": currencyRenderFunc},
                        {title: 'status', data: 'status', "visible": false, name: "status"},
                        {title: 'description', data: 'description', "visible": true, name: "description"}
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