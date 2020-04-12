<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="dynamic-ajax-content grid-gutter-padding">
    <div class="row">
        <div class="col-lg-12">
            <div class="alert alert-info mt-3">
                <p>DataTables has the ability to apply searching to a specific column through the <code>column().search()</code> method (note that the name of the method is search not filter since filter() is used to apply a filter to a result set).</p>
                <p>
                    <a class="btn btn-info" target="_blank" href="https://datatables.net/examples/api/multi_filter_select.html">
                        <i class="fa fa-external-link-alt fa-fw"></i>
                        Demo Page
                    </a>
                    <a class="btn btn-info" target="_blank" href="https://datatables.net/">
                        <i class="fa fa-external-link-alt fa-fw"></i>Datatables Home Page
                    </a>
                </p>
            </div>
            <div class="card my-3" id="table-panel">
                <div class="card-header">
                    Dynamic Datatables Creation
                    <div class="options float-right">
                        <a class="settings"><i class="fa fa-cog"></i></a>
                        <a href="#" class="collapse"><i class="fa fa-chevron-up"></i></a>
                        <a href="#" class="reload"><i class="fa fa-sync"></i></a>
                        <a href="#" class="fullscreen"><i class=" fa fa-expand"></i></a>
                        <a href="#" class="remove"><i class="fa fa-times"></i></a>
                    </div>
                </div>
                <div class="card-body">
                    <div class="row">
                        <div class="col-lg-12">
                            <table id="example" class="display table table-bordered table-hover" cellspacing="0" width="100%">
                            </table>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12">
                            <table id="example1" class="display table table-bordered table-hover" cellspacing="0" width="100%">
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <style type="text/css">
    </style>
    <script type="text/javascript">
        jQuery(function ($) {
            // any code put here will be run after content attach to ajax output container and before
            // controll return to main javascript file.
            var table = $('#example').DataTable({
                scrollY: 400,
                scrollCollapse: true,
                orderCellsTop: true, // important to for two row header with filteration below header column names.
                headerCallback: function (thead, data, start, end, display) {
//                    console.log($(thead).html());
                },
                initComplete: function (settings, json) {
                    console.log(settings);
                    console.log(json);
                    var columnsCount = this.api().columns().count();
                    console.log("columns count = " + columnsCount + " , " + settings.aoColumns.length);
                    var colHeader = this.api().columns(0).header();
                    console.log(colHeader);
                    var headerTag = $(colHeader).parents("thead");
                    console.log(headerTag);
//                    var filterHeaders = $("<tr></tr>").appendTo($(headerTag));
                    var options = this.api().init();
                    var filterHeaders = null;
                    if (options.orderCellsTop && options.orderCellsTop === true) {
                        $(headerTag).append("<tr></tr>");
                        filterHeaders = $(headerTag).find("tr").last();
                    } else {
                        $(headerTag).prepend("<tr></tr>");
                        filterHeaders = $(headerTag).find("tr").first();
                    }
                    console.log("start printing columns headers");
                    this.api().columns().every(function (index) {
                        var column = this;
                        var select = $('<input class="form-control"/>')
                                .appendTo($('<th></th>').appendTo($(filterHeaders)))
                                .on('keyup', function () {
                                    console.log($(this).val());
                                    var val = $.fn.dataTable.util.escapeRegex($(this).val());
                                    column.search(val ? val : '', true, false).draw();
                                });
                    });
                    this.api().columns.adjust();
                },

                columns: [
                    {data: 'id', name: "id", title: "ID", width: "6rem"},
                    {data: 'userName', name: "userName", title: "User Name", width: "10rem"},
                    {data: 'firstName', name: "firstName", title: "First Name", width: "8rem"},
                    {data: 'lastName', name: "lastName", title: "Last Name", width: "8rem"},
                    {data: 'birthDate', name: "birthDate", title: "BirthDate", "type": "date", width: "9rem"}
                ]
            });

            function randomDate(start, end) {
                return new Date(start.getTime() + Math.random() * (end.getTime() - start.getTime()));
            }

            var table1 = $('#example1').DataTable({
                scrollY: 400,
                scrollCollapse: true,
                orderCellsTop: true, // important to for two row header with filteration below header column names.
                headerCallback: function (thead, data, start, end, display) {
//                    console.log($(thead).html());
                },
                initComplete: function (settings, json) {
                },

                columns: [
                    {data: 'id', name: "id", title: "ID", width: "6rem"},
                    {data: 'userName', name: "userName", title: "User Name", width: "10rem"},
                    {data: 'firstName', name: "firstName", title: "First Name", width: "8rem"},
                    {data: 'lastName', name: "lastName", title: "Last Name", width: "8rem"},
                    {data: 'birthDate', name: "birthDate", title: "BirthDate", "type": "date", width: "9rem"}
                ]
            });


            $(javatmp.settings.defaultOutputSelector).on(javatmp.settings.javaTmpAjaxContainerReady, function (event) {
                // fire AFTER all transition done and your ajax content is shown to user.
                javatmp.util.waitForFinalEvent(function () {
                    for (var i = 1; i <= 50; i++) {
                        var rowNode = table.row.add({
                            id: i,
                            userName: 'user ' + i,
                            firstName: 'user ' + i,
                            lastName: 'last ' + i,
                            birthDate: moment(randomDate(new Date(1950, 0, 1), new Date(2000, 0, 1)))}).draw(false).node();
                        var rowNode1 = table1.row.add({
                            id: i,
                            userName: 'user ' + i,
                            firstName: 'user ' + i,
                            lastName: 'last ' + i,
                            birthDate: moment(randomDate(new Date(1950, 0, 1), new Date(2000, 0, 1)))}).draw(false).node();
//                $(rowNode).css('color', 'red').animate({color: 'black'});
                    }
                }, 10);


            });

            $(javatmp.settings.defaultOutputSelector).on(javatmp.settings.javaTmpContainerResizeEventName, function (event) {
                // fire when user resize browser window or sidebar hide / show
                table.columns.adjust().draw();
                table1.columns.adjust().draw();
            });
            $(javatmp.settings.defaultOutputSelector).on(javatmp.settings.cardFullscreenCompress, function (event, card) {
                // when card compress by pressing the top right tool button
                table.columns.adjust().draw();
                table1.columns.adjust().draw();
            });
            $(javatmp.settings.defaultOutputSelector).on(javatmp.settings.cardFullscreenExpand, function (event, card) {
                // when card Expand by pressing the top right tool button
                table.columns.adjust().draw();
                table1.columns.adjust().draw();
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
                table.destroy();
                table1.destroy();
                return true;
            });
        });
    </script>
</div>