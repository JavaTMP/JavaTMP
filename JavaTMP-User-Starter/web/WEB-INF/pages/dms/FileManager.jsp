<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="dynamic-ajax-content grid-gutter-padding">
    <div class="row">
        <div class="col-lg-12">
            <div class="card my-3">
                <div class="card-header">
                    File Manager
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
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 upload-actions-btn">
                            <form id="updateFormId" role="form" method="POST" enctype="multipart/form-data">
                                <div class="form-group">
                                    <label for="exampleFormControlFile1">Add New File</label>
                                    <div class="custom-file">
                                        <input name="file" type="file" class="custom-file-input" id="validatedCustomFile" required multiple>
                                        <label class="custom-file-label" for="validatedCustomFile">Choose file...</label>
                                    </div>
                                    <span class="help-block">
                                        Try selecting one or more files and watch the feedback
                                    </span>
                                </div>
                                <div class="progress">
                                    <div class="progress-bar bg-success" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100">
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                    <div class="row mt-1">
                        <div class="col-lg-12">
                            <div class="table-responsive">
                                <table id="formPluginAjaxUpload" class="table table-condensed table-bordered table-hover table-striped display nowrap">
                                    <thead>
                                        <tr>
                                            <th width="100px">#</th>
                                            <th>Document Name</th>
                                            <th width="125px">Document Size</th>
                                            <th width="150px">Content Type</th>
                                            <th width="250px">Creation Date</th>
                                            <th width="100px">View Inline</th>
                                            <th width="135px">View Attachment</th>
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
            var alertMessage;

            var row = '<tr>' +
                    '<td>{{id}}</td>' +
                    '<td>{{documentName}}</td>' +
                    '<td>{{documentSize}}</td>' +
                    '<td>{{contentType}}</td>' +
                    '<td>{{creationDate}}</td>' +
                    '<td><a class="" target="_blank" href="{{contextPath}}/dms/ViewUploadedFileController?documentId={{link}}&amp;randomHash={{randomHash}}&amp;viewType=inline">View Inline</a></td>' +
                    '<td><a class="" target="" href="{{contextPath}}/dms/ViewUploadedFileController?documentId={{link}}&amp;randomHash={{randomHash}}&amp;viewType=attachment">View As Attachment</a></td>' +
                    '</tr>';
            function uploadSelectedFiles() {
                $('#updateFormId').ajaxForm({
                    url: javatmp.settings.contextPath + '/dms/UploadController',
                    beforeSerialize: function ($form, options) {
                        $("#" + alertMessage).remove();
                    },
                    beforeSubmit: function (arr, $form, options) {
                        // The array of form data takes the following form:
                        // [ { name: 'username', value: 'jresig' }, { name: 'password', value: 'secret' } ]

                        // return false to cancel submit
                    },
                    beforeSend: function () {
                        $('.progress-bar').css({width: '0%'});
                        $('.progress-bar').text("0%");
                    },
                    uploadProgress: function (event, position, total, percentComplete) {
                        $('.progress-bar').css({width: percentComplete + '%'});
                        $('.progress-bar').text(percentComplete + '%');
                    },
                    success: function (response, statusText, xhr, $form) {
                        alertMessage = BootstrapAlertWrapper.createAlert({
                            container: $('#updateFormId'),
                            place: "prepent",
                            type: "info",
                            message: response.message,
                            focus: false,
                            close: true,
                            reset: true
                        });
                        $('.progress-bar').css({width: '100%'});
                        $('.progress-bar').text("100%");

                        // remove emptyUploadedFilesSizeRowId if response data length more than one:
                        if (response.data.length) {
                            $("#emptyUploadedFilesSizeRowId").remove();
                        }
                        //Add row
                        for (var i = 0; i < response.data.length; i++) {
                            table.row.add(response.data[i]);
                        }
                        table.draw();
                    },
                    complete: function (xhr) {
                        $("#updateFormId")[0].reset();
                        $('#updateFormId').trigger("reset");
                        $("#updateFormId input[type=file]").val(null).next("label").text("Choose file...");

                    },
                    timeout: 160 * 1000,
                    error: function (xhr, status, error, $form) {
                        BootstrapModalWrapperFactory.createModal({
                            title: xhr.statusText + " : " + xhr.status,
                            message: "error[" + xhr + "][" + status + "][" + error + "][" + $form + "]"
                        }).show();
                    }
                }).submit();
            }

            table = $(tableSelector).DataTable({
//                responsive: true,
                dom: "<'row'<'col-sm-12'tr>>" +
                        "<'row'<'col-sm-6'i><'col-sm-6 pt-2 text-right'l>>" +
                        "<'row'<'col-sm-12'p>>",
                scrollY: 400,
                scrollX: true,
                "autoWidth": false,
//                fixedColumns: true,
//                "deferLoading": 0, // here
                scrollCollapse: true,
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
                    "url": javatmp.settings.contextPath + "/dms/FileManagerPageController",
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
                    {data: 'documentId', name: 'documentId'},
                    {data: 'documentName', name: 'documentName'},
                    {data: 'documentSize', name: 'documentSize'},
                    {data: 'contentType', name: 'contentType'},
                    {
                        data: 'creationDate',
                        name: 'creationDate',
                        "type": "date",
                        "render": function (data, type, row) {
                            return moment(data, "YYYY-MM-DDTHH:mm:ss.SSSZ").format("DD/MM/YYYY HH:mm");
                        }
                    },
                    {data: 'viewInline', name: 'viewInline',
                        "render": function (data, type, row, meta) {
                            if (type === "sort" || type === 'type' || type === 'filter') {
                                return data;
                            } else if (type === "display") {
                                return '<a class="" target="" href="' + javatmp.settings.contextPath + '/dms/ViewUploadedFileController?documentId=' + row.documentId + '&amp;randomHash=' + row.randomHash + '&amp;viewType=inline">View As Attachment</a>';
                            } else {
                                return data;
                            }
                        }
                    },
                    {data: 'viewAttachment', name: 'viewAttachment',
                        "render": function (data, type, row, meta) {
                            if (type === "sort" || type === 'type' || type === 'filter') {
                                return data;
                            } else if (type === "display") {
                                return '<a class="" target="" href="' + javatmp.settings.contextPath + '/dms/ViewUploadedFileController?documentId=' + row.documentId + '&amp;randomHash=' + row.randomHash + '&amp;viewType=attachment">View As Attachment</a>';
                            } else {
                                return data;
                            }
                        }
                    }
                ]
            });

            $(javatmp.settings.defaultOutputSelector).on(javatmp.settings.javaTmpAjaxContainerReady, function (event) {
                // fire AFTER all transition done and your ajax content is shown to user.
                // We can attach the `fileselect` event to all file inputs on the page
                $("#updateFormId input[type=file]").attr("accept", "*/*").on("change", function () {
                    var max = 1 * 50 * 1024; // 50kb
                    for (var i = 0; i < this.files.length; i++) {
                        if (this.files && this.files[i].size > max) {
                            alert("[" + this.files[i].name + " ] File too large."); // Do your thing to handle the error.
                            this.value = null; // Clears the field.
                        }
                    }
                    var input = $(this),
                            numFiles = input.get(0).files ? input.get(0).files.length : 1,
                            label = input.val().replace(/\\/g, '/').replace(/.*\//, '');
                    var fileMsg = "Number of File Selected is " + numFiles;
                    $(this).next("label").text(fileMsg);
                    if (input.get(0).files && input.get(0).files.length > 0) {
                        for (var i = 0; i < input.get(0).files.length; i++) {
                            var file = input.get(0).files[i];
                            fileMsg += '<br>[' + (i + 1) + "][" + file.name + "]";
                        }
                        BootstrapModalWrapperFactory.confirm({
                            title: "Confirm",
                            message: "Are You Sure You want to Upload the following Files<br/>" + fileMsg,
                            onConfirmAccept: function () {
                                uploadSelectedFiles();
                            },
                            onConfirmCancel: function () {

                            }
                        });
                    }
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
                $("#updateFormId input[type=file]").off("change");
                table.clear();
                table.destroy(true);
                return true;
            });
        });
    </script>
</div>