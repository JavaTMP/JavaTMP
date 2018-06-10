<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="dynamic-ajax-content">
    <div class="page-header">
        <h1>Users List</h1>
    </div>

    <table cellspacing="0" class="table table-condensed table-bordered table-hover table-striped" id="defalut-dataTables-example">
        <thead>
            <tr>
                <th>ID</th>
                <th>Username</th>
                <th>First name</th>
                <th>Last name</th>
                <th>Age</th>
                <th>E-mail</th>
            </tr>
            <tr id="filterHeader">
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

    </style>
    <script type="text/javascript">
        jQuery(function ($) {
            // any code put here will be run after content attach to ajax output container and before
            // controll return to main javascript file.

            $.fn.select2.defaults.set("theme", "bootstrap");
            $.fn.select2.defaults.set("dir", javatmp.settings.direction);

            $.fn.dataTable.ext.errMode = 'none';
            var table = $('#defalut-dataTables-example').DataTable({
                //                responsive: true,
                dom: "<'row'<'col-sm-12 px-0'tr>>" +
                        "<'row'<'col-sm-6'i><'col-sm-6 pt-2 text-right'l>>" +
                        "<'row'<'col-sm-12'p>>",
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
                        if (index === 0) {
                            var input = $('<input id="id-search-input-id" class="form-control"/>')
                                    .appendTo($("#filterHeader").find('th').eq(0).empty())
                                    .on('keyup change', function () {
                                        var val = $.fn.dataTable.util.escapeRegex($(this).val());
                                        column.search(val ? val : '', true, false).draw();
                                    });
                        } else if (index === 4) {
                            var input = $('<input class="form-control" />')
                                    .appendTo($("#filterHeader").find('th').eq(index).empty())
                                    .on('change', function () {
                                        var val = $(this).val();
                                        column.search(val ? val : '', true, false).draw();
                                    });
                            input.inputmask({
                                alias: "datetime",
                                placeholder: "dd/mm/yyyy",
                                inputFormat: "dd/mm/yyyy",
                                displayFormat: true,
                                hourFormat: "24",
                                clearMaskOnLostFocus: false
                            });
                            input.daterangepicker({
                                "opens": javatmp.settings.floatDefault,
                                //                    startDate: false,
                                singleDatePicker: true,
                                showDropdowns: true,
                                timePicker: false,
                                timePickerIncrement: 1,
                                timePicker24Hour: true,
                                autoApply: true,
                                autoUpdateInput: false,
                                minDate: '01/01/1900',
                                maxDate: '31/12/2099',
                                //                    maxDate: '',
                                //                    minDate: moment(),
                                locale: {
                                    "direction": javatmp.settings.direction,
                                    format: 'DD/MM/YYYY'
                                }
                            }, function (start, end, label) {
                                var formatedDateSelected = moment(start).format("DD/MM/YYYY");
                                $(input).val(formatedDateSelected).trigger("change");
                            });

                        } else {
                            var input = $('<input class="form-control" />')
                                    .appendTo($("#filterHeader").find('th').eq(index).empty())
                                    .on('keyup change', function () {
                                        var val = $.fn.dataTable.util.escapeRegex($(this).val());
                                        column.search(val ? val : '', true, false).draw();
                                    });
                        }

                    });
                },
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
                    {data: 'id', "width": 50},
                    {data: 'userName', "width": 100},
                    {data: 'firstName', "width": 100},
                    {data: 'lastName', "width": 100},
                    {
                        data: 'birthDate', "type": "date", "width": 35,
                        "render": function (data, type, row) {
                            return Math.ceil(moment().diff(moment(data, "YYYY-MM-DDTHH:mm:ss.SSSZ"), 'years', true));
                        }
                    },
                    {data: 'email', "width": 150}
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
        });
    </script>
</div>