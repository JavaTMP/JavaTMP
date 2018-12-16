<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="dynamic-ajax-content">
    <h5 class="my-3">Customer List</h5>
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
                    <table cellspacing="0" class="table table-sm table-condensed table-bordered table-hover" id="list">
                        <thead>
                            <tr>
                                <th style="width: 3rem;"><p class="m-0 p-0" style="width: 3rem;">ID</p></th>
                                <th style="width: 10rem;"><p class="m-0 p-0" style="width: 10rem;">Code</p></th>
                                <th style="width: 10rem;"><p class="m-0 p-0" style="width: 10rem;">Transaction Date</p></th>
                                <th style="width: 10rem;"><p class="m-0 p-0" style="width: 10rem;">creationDate Date</p></th>
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
        table.dataTable tbody tr {
            cursor: pointer;
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

            var listTableElement = $('#list');
            var table = listTableElement.DataTable({
                // https://datatables.net/reference/option/dom
                dom: "<'row'>" +
                        "<'row'<'col-sm-12'tr>>" +
                        "<'row'<'col-sm-6 col-md-2 pt-2'l><'col-sm-6 col-md-3'i><'col-sm-12 col-md-7'p>>",
                //                dom: "<'row'<'col-sm-12 p-0'tr>>" +
                //                        "<'row'<'col-sm-4'i><'col-sm-4'p><'col-sm-4 pt-2 text-right'l>>"
                //                ,
                //                select: true,
                keys: true,
                select: "single",
                scrollY: 250,
                scrollX: true,
                "autoWidth": false,
                scrollCollapse: false,
                "searching": true,
                searchDelay: 500,
                orderCellsTop: true, // important to for two row header with filteration below header column names.
                "processing": true,
                "serverSide": true,
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
                    "url": javatmp.settings.contextPath + "/accounting/listTransactions",
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
                    {data: 'id', name: "id", width: "3rem", "render": javatmp.plugins.DataTableColRenderWrapper("3rem")},
                    {data: 'code', name: "code", width: "10rem", "render": javatmp.plugins.DataTableColRenderWrapper("10rem")},
                    {data: 'transactionDate', name: "transactionDate", "type": "date", width: "10rem", "render": javatmp.plugins.DataTableColRenderWrapper("10rem")},
                    {data: 'creationDate', name: "creationDate", "type": "date", width: "10rem", "render": javatmp.plugins.DataTableColRenderWrapper("10rem")}
                ]
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