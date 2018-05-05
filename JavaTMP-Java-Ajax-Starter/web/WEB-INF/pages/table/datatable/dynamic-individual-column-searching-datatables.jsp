<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="dynamic-ajax-content">
    <div class="page-header">
        <h1>Dynamic Individual Column Searching Datatables</h1>
    </div>
    <div class="row">
        <div class="col-lg-12">
            <div id="table-panel" class="card">
                <div class="card-header">
                    Users Table
                    <div class="options float-right">
                        <a class="settings"><i class="fa fa-cog"></i></a>
                        <a href="#" class="collapse"><i class="fa fa-chevron-up"></i></a>
                        <a href="#" class="reload"><i class="fa fa-sync"></i></a>
                        <a href="#" class="fullscreen"><i class=" fa fa-expand"></i></a>
                        <a href="#" class="remove"><i class="fa fa-times"></i></a>
                    </div>
                </div>

                <table cellspacing="0" class="table table-condensed table-bordered table-hover table-striped" id="defalut-dataTables-example">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>First name</th>
                            <th>Last name</th>
                            <th>Position</th>
                            <th>Office</th>
                            <th>Age</th>
                            <th>Start date</th>
                            <th>Salary</th>
                            <th>Extn.</th>
                            <th>E-mail</th>
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
                        </tr>
                    </thead>
                    <tbody></tbody>
                </table>
            </div>
        </div>
    </div>
    <style type="text/css">
        table{
            /*margin: 0 auto;*/
            /*width: 100%;*/
            /*clear: both;*/
            /*border-collapse: collapse;*/
            table-layout: fixed;
            word-wrap:break-word;
        }
        #filterHeader > th {
            padding: 0;
        }
    </style>

    <script type="text/javascript">
        jQuery(function ($) {
            // any code put here will be run after content attach to ajax output container and before
            // controll return to main javascript file.
            $.fn.dataTable.ext.errMode = 'none';
            var table = $('#defalut-dataTables-example').DataTable({
//                responsive: true,
                dom: "<'row'<'col-sm-6'i>>" +
                        "<'row'<'col-sm-12 px-0'tr>>" +
                        "<'row'<'col-sm-5'l><'col-sm-7'p>>",
                scrollY: 400,
                scrollX: true,
                "autoWidth": false,
                fixedColumns: true,
                scrollCollapse: false,
                "searching": true,
                searchDelay: 500,
                orderCellsTop: true, // important to for two row header with filteration below header column names.
                "processing": true,
                "serverSide": true,
                "drawCallback": function (settings) {
//                    alert('DataTables has redrawn the table');
                },
                initComplete: function () {
                    this.api().columns().every(function (index) {

                        var column = this;
                        var input = $('<input class="form-control" style="width:100%;" />')
                                .appendTo($("#filterHeader").find('th').eq(index).empty())
                                .on('change', function () {
                                    var val = $.fn.dataTable.util.escapeRegex($(this).val());
                                    column.search(val ? val : '', true, false).draw();
                                });

//                        column.data().unique().sort().each(function (d, j) {
//                            select.append('<option value="' + d + '">' + d + '</option>');
//                        });
                    });
                },
                "ajax": {
                    "url": javatmp.settings.contextPath + "/user/ListUsersController",
                    "data": function (currentDate) {
                        currentDate._ajaxGlobalBlockUI = false; // window blocked until data return
                    },
                    "dataSrc": function (json) {
                        json["recordsTotal"] = json.data.recordsTotal;
                        json["recordsFiltered"] = json.data.recordsFiltered;
                        return json.data.data;
                    }
                },
                columns: [
                    {data: 'id', "width": 50},
                    {data: 'firstName', "width": 100},
                    {data: 'lastName', "width": 100},
                    {data: 'position', "width": 225},
                    {data: 'office', "width": 100},
                    {
                        data: 'birthOfDate', "type": "date", "width": 35,
                        "render": function (data, type, row) {
                            return Math.ceil(moment().diff(moment(data, "YYYY-MM-DDTHH:mm:ss.SSSZ"), 'years', true));
                        }
                    },
                    {
                        data: 'joiningDate', "type": "date", "width": 150,
                        "render": function (data, type, row) {
                            return moment(data, "YYYY-MM-DDTHH:mm:ss.SSSZ").format("DD/MM/YYYY HH:mm");
                        }},
                    {data: 'salary', "width": 100, "type": "num", render: $.fn.dataTable.render.number(',', '.', 2, '$')},
                    {data: 'mobile', "width": 100},
                    {data: 'email', "width": 300}
                ]
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
        }
        );
    </script>
</div>