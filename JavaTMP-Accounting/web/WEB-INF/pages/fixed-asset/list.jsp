<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="dynamic-ajax-content">
    <h5 class="my-3">Customer List</h5>
    <hr/>
    <div class="row">
        <div class="col">
            <table cellspacing="0" class="table table-condensed table-bordered table-hover" id="list">
                <thead>
                    <tr>
                        <th style="width: 5rem;"><p class="m-0 p-0" style="width: 5rem;">id</p></th>
                        <th style="width: 9rem;"><p class="m-0 p-0" style="width: 9rem;">${labels['domain.user.userName']}</p></th>
                        <th style="width: 7rem;"><p class="m-0 p-0" style="width: 7rem;">${labels['domain.user.firstName']}</p></th>
                        <th style="width: 7rem;"><p class="m-0 p-0" style="width: 7rem;">${labels['domain.user.lastName']}</p></th>
                        <th style="width: 8rem;"><p class="m-0 p-0" style="width: 8rem;">${labels['domain.user.birthDate']}</p></th>
                        <th style="width: 3rem;"><p class="m-0 p-0" style="width: 3rem;">${labels['domain.user.age']}</p></th>
                        <th style="width: 12rem;"><p class="m-0 p-0" style="width: 12rem;">${labels['domain.user.email']}</p></th>
                        <th style="width: 10rem;"><p class="m-0 p-0" style="width: 10rem;">${labels['domain.user.status']}</p></th>
                        <th style="width: 8rem;"><p class="m-0 p-0" style="width: 8rem;">${labels['domain.user.country']}</p></th>
                        <th style="width: 10rem;"><p class="m-0 p-0" style="width: 10rem;">${labels['domain.user.lang']}</p></th>
                        <th style="width: 10rem;"><p class="m-0 p-0" style="width: 10rem;">${labels['domain.user.theme']}</p></th>
                        <th style="width: 10rem;"><p class="m-0 p-0" style="width: 10rem;">${labels['domain.user.timezone']}</p></th>
                        <th style="width: 8rem;"><p class="m-0 p-0" style="width: 8rem;">${labels['domain.user.creationDate']}</p></th>
                    </tr>
                </thead>
                <tbody></tbody>
            </table>
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

                },
                initComplete: function (settings, json) {
                    var api = this.api();
                    // prepare id filter search field:
                },
                "ajax": {
                    "type": "POST",
                    "url": javatmp.settings.contextPath + "/accounting/ListGeneralLedger",
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
                        "createdCell": function (td, cellData, rowData, row, col) {
                            console.log(table.init().columns[col]);
                            $(td).addClass("text-center");
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
                    {data: 'email', name: "email", width: "14rem", "render": javatmp.plugins.DataTableColRenderWrapper("14rem")},
                    {data: 'status', className: "text-center", name: "status", width: "12rem",
                        "render": javatmp.plugins.DataTableColRenderWrapper("12rem")
                    },
                    {data: 'countryId', name: "countryId", width: "9rem", "render": javatmp.plugins.DataTableColRenderWrapper("9rem")},
                    {data: 'lang', name: "lang", width: "10rem", "render": javatmp.plugins.DataTableColRenderWrapper("10rem")},
                    {data: 'theme', name: "theme", width: "10rem", "render": javatmp.plugins.DataTableColRenderWrapper("10rem")},
                    {data: 'timezone', name: "timezone", width: "11rem", "render": javatmp.plugins.DataTableColRenderWrapper("11rem")},
                    {data: 'creationDate', "type": "date", name: "creationDate", width: "9rem", "render": javatmp.plugins.DataTableColRenderWrapper("9rem")}
                ]
            });
            $(javatmp.settings.defaultOutputSelector).on(javatmp.settings.javaTmpAjaxContainerReady, function (event) {
                // fire AFTER all transition done and your ajax content is shown to user.
            });

            $(javatmp.settings.defaultOutputSelector).on(javatmp.settings.javaTmpContainerResizeEventName, function (event) {
                // fire when user resize browser window or sidebar hide / show
            });

            $(javatmp.settings.defaultOutputSelector).on(javatmp.settings.cardFullscreenCompress, function (event, card) {
                // when card compress by pressing the top right tool button
            });

            $(javatmp.settings.defaultOutputSelector).on(javatmp.settings.cardFullscreenExpand, function (event, card) {
                // when card Expand by pressing the top right tool button
            });

            /**
             * When another sidebar menu item pressed and before container issues new ajax request.
             * You can cancel, destroy, or remove any thing here before replace main output ajax container.
             * return false or event.preventDefault() will cancel ajax and stay you in the current page and do nothing.
             **/
            $(javatmp.settings.defaultOutputSelector).on(javatmp.settings.javaTmpContainerRemoveEventName, function (event) {
                $(javatmp.settings.defaultOutputSelector).off(javatmp.settings.cardFullscreenCompress);
                $(javatmp.settings.defaultOutputSelector).off(javatmp.settings.cardFullscreenExpand);
                return true;
            });
        });
    </script>
</div>