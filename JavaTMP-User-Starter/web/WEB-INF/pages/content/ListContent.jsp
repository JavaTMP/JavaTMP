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
                                    action-name="addNewContentButton"
                                    type="button" class="addNewContentButton btn btn-primary">
                                    <i class="fa fa-external-link-alt fa-fw"></i>
                                    Add Content
                                </button>
                                <button
                                    id="UserList-AddNewUserByWizardPopupId"
                                    action-name="Add-New-User-By-Wizard-Popup-Action"
                                    type="button"
                                    class="btn btn-primary">
                                    Add User By Wizard Popup
                                </button>
                                <button action-name="Update-Complete-User-Action" id="UserList-UpdateSelectedUserId" type="button" class="btn btn-primary">
                                    <i class="fa fa-user-edit fa-fw"></i>
                                    ${labels['page.btn.updateCompleteUser']}
                                </button>
                                <button action-name="Delete-User-Action" id="UserList-DeleteSelectedUserId" type="button" class="btn btn-primary">
                                    <i class="fa fa-user-times fa-fw text-danger"></i>
                                    ${labels['page.btn.deleteUser']}
                                </button>
                                <button action-name="Activate-User-Action" id="UserList-ActivateSelectedUserId" type="button" class="btn btn-primary">
                                    <i class="fa fa-user-check fa-fw text-success"></i>
                                    ${labels['page.btn.activateUser']}
                                </button>
                                <button action-name="Deactivate-User-Action" id="UserList-DeactivateSelectedUserId" type="button" class="btn btn-primary">
                                    <i class="fa fa-user-slash fa-fw text-warning"></i>
                                    ${labels['page.btn.deactivateUser']}
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

                $(".addNewContentButton", javatmp.settings.defaultOutputSelector).on("click", function (event) {
                    var passData = {};
                    passData.callback = "actionCallback";
                    BootstrapModalWrapperFactory.createAjaxModal({
                        message: '<div class="text-center"><i class="fa fa-sync fa-spin fa-3x fa-fw text-primary"></i></div>',
                        title: "${labels['global.loadingText']}",
                        passData: passData,
                        updateSizeAfterDataFetchTo: "modal-lg", // default is  or null for standard or "modal-sm"
                        size: "modal-lg",
                        url: javatmp.settings.contextPath + "/pages/content/CreateNewContent",
                        ajaxContainerReadyEventName: javatmp.settings.javaTmpAjaxContainerReady
                    });
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