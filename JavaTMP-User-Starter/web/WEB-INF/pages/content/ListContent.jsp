<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="dynamic-ajax-content grid-gutter-padding">
    <div class="row">
        <div class="col-lg-12">
            <div class="card my-3">
                <div class="card-header">
                    Content Manager
                    <div class="options float-right">
                        <a href="#" class="collapse"><i class="fa fa-chevron-up"></i></a>
                        <a href="#" class="fullscreen"><i class=" fa fa-expand"></i></a>
                    </div>
                </div>
                <div class="card-body">
                    <div class="row mt-1">
                        <div class="col-lg-12">
                            <div class="content-list-btn-toolbar" role="toolbar" aria-label="Toolbar with button groups">
                                <button
                                    action-name="addNewContentAction"
                                    type="button" class="btn btn-primary">
                                    <i class="fas fa-plus fa-fw"></i>
                                    Add
                                </button>
                                <button action-name="updateContentAction" type="button" class="btn btn-primary">
                                    <i class="far fa-edit fa-fw"></i>
                                    Update
                                </button>
                                <button action-name="deleteContentAction" type="button" class="btn btn-primary">
                                    <i class="fas fa-ban fa-fw text-danger"></i>
                                    Delete
                                </button>
                                <button
                                    action-name="viewContentAction" type="button" class="btn btn-primary"
                                    actionType="action-ref-href"
                                    action-ref-by-href="${pageContext.request.contextPath}/pages/content/ViewContent">
                                    <i class="far fa-eye fa-fw text-success"></i>
                                    View
                                </button>
                            </div>
                            <div class="table-responsive">
                                <table id="formPluginAjaxUpload" class="table table-condensed table-bordered table-hover table-striped display nowrap">
                                    <thead>
                                        <tr>
                                            <th>contentId</th>
                                            <th>title</th>
                                            <th>createdBy</th>
                                            <th>status</th>
                                            <th>Creation Date</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <style type="text/css">
        table.dataTable tbody tr {
            cursor: pointer;
        }
    </style>
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
            $.fn.dataTable.ext.errMode = 'none';
            var tableSelector = '#formPluginAjaxUpload';
            var table;

            $(javatmp.settings.defaultOutputSelector).on(javatmp.settings.javaTmpAjaxContainerReady, function (event) {
                // fire AFTER all transition done and your ajax content is shown to user.

                var actionCallback = function (callbackData) {
                    if (callbackData.cancel === true) {
                    } else {
                        table.columns.adjust().draw();
                    }
                };

                table = $(tableSelector).DataTable({
//                responsive: true,
                    dom: "<'row'<'col-sm-12'tr>>" +
                            "<'row'<'col-sm-6'i><'col-sm-6 pt-2 text-right'l>>" +
                            "<'row'<'col-sm-12'p>>",
                    scrollY: 400,
                    scrollX: true,
                    "autoWidth": false,
                    keys: true,
                    select: "single",
//                fixedColumns: true,
//                "deferLoading": 0, // here
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
                        });
                    },
                    "ajax": {
                        "type": "POST",
                        "url": javatmp.settings.contextPath + "/cms/ListContent",
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
                        {data: 'contentId', name: 'contentId'},
                        {data: 'title', name: 'title'},
                        {data: 'createdBy', name: 'createdBy'},
                        {data: 'status', name: 'status'},
                        {
                            data: 'creationDate',
                            name: 'creationDate',
                            "type": "date",
                            "render": function (data, type, row) {
                                return moment(data, "YYYY-MM-DDTHH:mm:ss.SSSZ").format("DD/MM/YYYY HH:mm");
                            }
                        }
                    ]
                });

                $("[action-name='addNewContentAction']", javatmp.settings.defaultOutputSelector).on("click", function (event) {
                    BootstrapModalWrapperFactory.createAjaxModal({
                        message: '<div class="text-center"><i class="fa fa-sync fa-spin fa-3x fa-fw text-primary"></i></div>',
                        title: "${labels['global.loadingText']}",
                        updateSizeAfterDataFetchTo: "modal-lg", // default is  or null for standard or "modal-sm"
                        size: "modal-lg",
                        localData: {
                            callback: actionCallback
                        },
                        ajax: {
                            url: javatmp.settings.contextPath + "/pages/content/CreateNewContent",
                            data: {}
                        },
                        ajaxContainerReadyEventName: javatmp.settings.javaTmpAjaxContainerReady
                    });
                });
                $("[action-name='updateContentAction']", javatmp.settings.defaultOutputSelector).on("click", function (event) {
                    //                var selectedCount = table.rows({selected: true}).count();
                    var selectedData = table.rows({selected: true}).data();
                    if (selectedData.length > 0) {
                        var selectedRecord = selectedData[0];
                        var passData = {};
                        passData.contentId = selectedRecord.contentId;
                        BootstrapModalWrapperFactory.createAjaxModal({
                            message: '<div class="text-center"><i class="fa fa-sync fa-spin fa-3x fa-fw text-primary"></i></div>',
                            updateSizeAfterDataFetchTo: "modal-lg", // default is  or null for standard or "modal-sm"
                            size: "modal-lg",
                            localData: {
                                callback: actionCallback
                            },
                            ajax: {
                                url: javatmp.settings.contextPath + "/content/UpdateContent",
                                data: passData
                            },
                            ajaxContainerReadyEventName: javatmp.settings.javaTmpAjaxContainerReady
                        });
                    } else {
                        BootstrapModalWrapperFactory.showMessage("Kindly Select a record from the table");
                    }
                });
                $("[action-name='deleteContentAction']", javatmp.settings.defaultOutputSelector).on("click", function (event) {
                    var selectedData = table.rows({selected: true}).data();
                    if (selectedData.length > 0) {
                        var selectedRecord = selectedData[0];
                        window.javatmp.plugins.confirmAjaxAction(
                                javatmp.settings.labels["dialog.delete.title"],
                                javatmp.settings.labels["dialog.delete.message"],
                                "Delete",
                                javatmp.settings.labels["global.cancel"],
                                javatmp.settings.contextPath + "/content/DeleteContent",
                                selectedRecord,
                                function (data) {
                                    table.draw();
                                }
                        );
                    } else {
                        BootstrapModalWrapperFactory.showMessage("Kindly Select a record from the table");
                    }
                });

                $("[action-name='viewContentAction']", javatmp.settings.defaultOutputSelector).on("click", function (event) {
                    var selectedData = table.rows({selected: true}).data();
                    if (selectedData.length > 0) {
                        var selectedRecord = selectedData[0];
                        $(javatmp.settings.defaultOutputSelector).data("passData", selectedRecord);
                    } else {
                        event.preventDefault();
                        BootstrapModalWrapperFactory.showMessage("Kindly Select a record from the table");
                        return false;
                    }
                });

                $(javatmp.settings.defaultOutputSelector).on(javatmp.settings.javaTmpContainerResizeEventName, function (event) {
                    // fire when user resize browser window or sidebar hide / show
                    table.columns.adjust();
                });

                $(javatmp.settings.defaultOutputSelector).on(javatmp.settings.cardFullscreenCompress, function (event, card) {
                    // when card compress by pressing the top right tool button
                    table.columns.adjust();
                });

                $(javatmp.settings.defaultOutputSelector).on(javatmp.settings.cardFullscreenExpand, function (event, card) {
                    // when card Expand by pressing the top right tool button
                    table.columns.adjust();
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
        });
    </script>
</div>