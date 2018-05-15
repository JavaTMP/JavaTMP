<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="dynamic-ajax-content">
    <div class="page-header">
        <h1>Dynamic Datatables</h1>
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
                <div class="card-body">
                    <table width="100%" cellspacing="0" class="table table-bordered table-hover display nowrap table-striped" id="defalut-dataTables-example">
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
                        </thead>
                        <tbody></tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <script type="text/javascript">
        jQuery(function ($) {
            // any code put here will be run after content attach to ajax output container and before
            // controll return to main javascript file.
            $.fn.dataTable.ext.errMode = 'none';
            var table = $('#defalut-dataTables-example').DataTable({
//                responsive: true,
                scrollY: 400,
                scrollX: true,
                scrollCollapse: false,
                "searching": true,
                searchDelay: 500,
                "autoWidth": false,
                fixedColumns: true,
                fixedHeader: true,
                "processing": true,
                "serverSide": true,
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
                    {data: 'id'},
                    {data: 'firstName'},
                    {data: 'lastName'},
                    {data: 'position'},
                    {data: 'office'},
                    {
                        data: 'birthOfDate', "type": "date",
                        "render": function (data, type, row) {
                            return Math.ceil(moment().diff(moment(data, "YYYY-MM-DDTHH:mm:ss.SSSZ"), 'years', true));
                        }
                    },
                    {
                        data: 'joiningDate', "type": "date",
                        "render": function (data, type, row) {
                            return moment(data, "YYYY-MM-DDTHH:mm:ss.SSSZ").format("DD/MM/YYYY HH:mm");
                        }},
                    {data: 'salary', "type": "num", render: $.fn.dataTable.render.number(',', '.', 2, '$')},
                    {data: 'mobile'},
                    {data: 'email'}
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
//                table.clear().draw();
                table.destroy(true);
                return true;
            });
        }
        );
    </script>
</div>