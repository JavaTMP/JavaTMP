<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="dynamic-ajax-content grid-gutter-padding">
    <h5 class="my-3">Account Ledger</h5>
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
                    <div class="ml-0 my-0 p-1 border">
                        <table id="account-ledger" cellspacing="0" class="table table-sm table-condensed table-bordered">
                            <thead>
                                <tr>
                                    <th>entryDate</th>
                                    <th>sourceDocument</th>
                                    <th>code</th>
                                    <th>id</th>
                                    <th>transactionId</th>
                                    <th>accountId</th>
                                    <th>moduleId</th>
                                    <th>moduleRefId</th>
                                    <th>moduleTypeId</th>
                                    <th>debit</th>
                                    <th>credit</th>
                                    <th>balance</th>
                                    <th>status</th>
                                    <th>description</th>
                                </tr>
                            </thead>
                            <tbody></tbody>
                        </table>
                    </div>
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

            var currencyRenderFunc = function (data, type, row, meta) {
                if (type === "display") {
                    return numeral(data).format('(0,0.00)');
                } else {
                    return data;
                }
            };

            var detailsTable = $("#account-ledger");
            var table = null;

            $(javatmp.settings.defaultOutputSelector).on(javatmp.settings.javaTmpAjaxContainerReady, function (event) {
                // fire AFTER all transition done and your ajax content is shown to user.
                var passData = $(javatmp.settings.defaultOutputSelector).data("passData");
                table = detailsTable.DataTable({
                    // https://datatables.net/reference/option/dom
                    dom: "<'row'<'col-sm-12'tr>>" +
                            "<'row'<'col-sm-4'i><'col-sm-4'p><'col-sm-4 pt-2 text-right'l>>",
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
                    "order": [[0, "asc"], [3, "asc"]],
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
                            if (passData && passData.id && passData.id > 0) {
                                currentDate.columns[5].search.value = passData.id;
                            }
                            return JSON.stringify(currentDate);
                        },
                        "dataSrc": function (json) {
                            json["recordsTotal"] = json.data.recordsTotal;
                            json["recordsFiltered"] = json.data.recordsFiltered;
                            return json.data.data;
                        }
                    },
                    columns: [
                        {data: 'entryDate', name: "entryDate", "type": "date", width: "7rem", "render": javatmp.plugins.DataTableColRenderWrapper("7rem")},
                        {data: 'sourceDocument', name: "sourceDocument"},
                        {data: 'code', name: "code"},
                        {data: 'id', name: "id"},
                        {data: 'transactionId', "visible": true, name: "transactionId"},
                        {data: 'accountId', name: "accountId", "visible": true},
                        {data: 'moduleId', name: "moduleId"},
                        {data: 'moduleRefId', name: "moduleRefId"},
                        {data: 'moduleTypeId', name: "moduleTypeId"},
                        {data: 'debit', name: "debit", "render": currencyRenderFunc},
                        {data: 'credit', name: "credit", "render": currencyRenderFunc},
                        {data: 'accountBalance', name: "accountBalance", "render": currencyRenderFunc},
                        {data: 'status', "visible": false, name: "status"},
                        {data: 'description', "visible": true, name: "description"}
                    ]
                });

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