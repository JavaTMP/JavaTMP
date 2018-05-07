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
                            <th>
                                <div class="form-group m-0">
                                    <select id="remotePositionsSelectId" class="form-control">
                                        <!--<option value=""></option>-->
                                    </select>
                                </div>
                            </th>
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
        #table-panel table.dataTable {
            margin: 0!important;
        }
        #table-panel table.dataTable .dataTables_paginate {
            text-align: center!important;
        }
        table#defalut-dataTables-example {
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
                        } else if (index === 3) {
                            var input = $("#remotePositionsSelectId");
                            input.select2({
                                theme: "bootstrap",
                                dir: javatmp.settings.direction,
                                allowClear: true,
                                placeholder: "-- Filter --",
                                containerCssClass: ':all:',
                                multiple: false,
                                minimumResultsForSearch: 0,
//                                width: '242',
//                                dropdownAutoWidth: true
                            });
                            $.ajax({
                                type: 'GET',
                                url: javatmp.settings.contextPath + '/user/ListUsersPositionsController'
                            }).then(function (data) {
                                // create the option and append to Select2
                                var select2Data = [];
                                for (var i = 0; i < data.data.length; i++) {
                                    var row = data.data[i];
                                    var option = new Option(row, row, false, false);
                                    input.append(option);
                                    select2Data.push({
                                        id: row,
                                        text: row
                                    });
                                }
                                input.val(null).trigger('change');
                                input.on('select2:select', function (e) {
                                    var selectedId = "";
                                    var selectedRows = $(this).select2('data');
                                    if (selectedRows.length > 0) {
                                        var selectedRow = selectedRows[0];
                                        selectedId = selectedRow.id;
                                    }
                                    column.search(selectedId ? selectedId : '', true, false).draw();
                                });
                                input.on('select2:close', function (e) {
                                    var selectedId = "";
                                    var selectedRows = $(this).select2('data');
//                                    alert(JSON.stringify(selectedRows));
                                    if (selectedRows.length === 0) {
                                        column.search(selectedId, true, false).draw();
                                    }
                                });
                            });
                        } else if (index == 6) {
                            var input = $('<input class="form-control" />')
                                    .appendTo($("#filterHeader").find('th').eq(index).empty())
                                    .on('change', function () {
                                        var val = $(this).val();
                                        column.search(val ? val : '', true, false).draw();
                                    });
                            input.inputmask({
                                alias: "date",
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
                    {data: 'position', "width": 200},
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
                    {data: 'email', "width": 200}
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