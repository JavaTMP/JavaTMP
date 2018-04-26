<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="dynamic-ajax-content">
    <div class="page-header">
        <h1>File Uploader Servlet</h1>
    </div>
    <div class="row">
        <div class="col-lg-12">
            <div class="alert alert-info">
                <p><strong>Implementing Simple AJAX File Upload from scratch using jQuery Form Plugin</strong></p>
                <p>
                    The Form Plugin supports use of XMLHttpRequest Level 2 and FormData objects on browsers
                    that support these features. Files upload will occur seamlessly through the XHR object
                    and progress updates are available as the upload proceeds. For older browsers,
                    a fallback technology is used which involves iframes
                </p>
                <p>
                    <a class="btn btn-info" target="_blank" href="http://malsup.com/jquery/form/">http://malsup.com/jquery/form/</a>
                    <a class="btn btn-info" target="_blank" href="https://github.com/jquery-form/form">https://github.com/jquery-form/form</a>
                    <a class="btn btn-info" target="_blank" href="https://www.abeautifulsite.net/whipping-file-inputs-into-shape-with-bootstrap-3">Styling file input with bootstrap 3 article</a>
                </p>
            </div>
            <div class="card my-3">
                <div class="card-header">
                    Examples
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
                                <div id="status"></div>
                            </form>
                        </div>
                    </div>
                    <div class="row mt-1">
                        <div class="col-lg-12">
                            <table id="formPluginAjaxUpload" class="table table-bordered table-hover table-striped responsive">
                                <thead>
                                    <tr>
                                        <th width="50px">#</th>
                                        <th>File Name</th>
                                        <th width="100px">Creation Date</th>
                                        <th width="75px">Link</th>
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
    <!--<link href="components/" rel="stylesheet">-->
    <!--<script src="components/"></script>-->
    <script type="text/javascript">
        jQuery(document).ready(function () {
            (function ($) {

            }(jQuery));
        });
    </script>
    <script type="text/javascript">
        jQuery(document).ready(function () {
            (function ($) {
// We can attach the `fileselect` event to all file inputs on the page
                $("#updateFormId input[type=file]").attr("accept", "*/*").on("change", function () {


                });
                $(document).on('change', ':file', function () {
                    var max = 1000 * 1024 * 1024; // 1024MB
                    for (var i = 0; i < this.files.length; i++) {
                        if (this.files && this.files[i].size > max) {
                            alert("[" + this.files[i].name + " ] File too large."); // Do your thing to handle the error.
                            this.value = null; // Clears the field.
                        }
                    }
                    var input = $(this),
                            numFiles = input.get(0).files ? input.get(0).files.length : 1,
                            label = input.val().replace(/\\/g, '/').replace(/.*\//, '');
                    input.trigger('fileselect', [numFiles, label]);
                    var fileMsg = "Number of File Selected is " + numFiles + "<br/><br/>";
                    if (input.get(0).files && input.get(0).files.length > 0) {
                        for (var i = 0; i < input.get(0).files.length; i++) {
                            var file = input.get(0).files[i];
                            fileMsg += "# [" + (i + 1) + "][" + file.name + "]<br/>";
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

                        function uploadSelectedFiles() {
                            var statusBar = $('#status');
                            $('#updateFormId').ajaxForm({
                                url: javatmp.settings.contextPath + '/UploadController',
                                beforeSerialize: function ($form, options) {
                                    // return false to cancel submit
                                },
                                beforeSubmit: function (arr, $form, options) {
                                    // The array of form data takes the following form:
                                    // [ { name: 'username', value: 'jresig' }, { name: 'password', value: 'secret' } ]

                                    // return false to cancel submit
                                },
                                beforeSend: function () {
                                    statusBar.empty();
                                    $('.progress-bar').css({width: '0%'});
                                    $('.progress-bar').text("0%");
                                },
                                uploadProgress: function (event, position, total, percentComplete) {
                                    $('.progress-bar').css({width: percentComplete + '%'});
                                    $('.progress-bar').text(percentComplete + '%');
                                    console.log(percentComplete, position, total);
                                },
                                success: function () {
                                    $('.progress-bar').css({width: '100%'});
                                    $('.progress-bar').text("100%");

                                    var tbody = $('#formPluginAjaxUpload').children('tbody');
                                    var table = tbody.length ? tbody : $('#formPluginAjaxUpload');
                                    var row = '<tr>' +
                                            '<td>{{id}}</td>' +
                                            '<td>{{name}}</td>' +
                                            '<td>{{phone}}</td>' +
                                            '<td>{{link}}</td>' +
                                            '</tr>';
                                    //Add row
                                    table.append(row.composeTemplate({
                                        'id': 3,
                                        'name': 'Lee',
                                        'phone': '123 456 789',
                                        'link': ''
                                    }));

                                },
                                complete: function (xhr) {
                                    statusBar.html(xhr.responseText);
                                },
                                error: function (xhr, status, error, $form) {
                                    BootstrapModalWrapperFactory.createModal({
                                        title: "ERROR",
                                        message: "error[" + xhr + "][" + status + "][" + error + "][" + $form + "]"
                                    }).show();
                                }
                            }).submit();
                        }
                    }


                });
                // We can watch for our custom `fileselect` event like this
                $(document).ready(function () {
                    $(':file').on('fileselect', function (event, numFiles, label) {

                        var input = $(this).parents('.input-group').find(':text');
                        var log = numFiles > 1 ? numFiles + ' files selected' : label;

                    });
                });
            }(jQuery));
        });
    </script>
    <script type="text/javascript">
        jQuery(document).ready(function () {
            (function ($) {
                //Compose template string
                String.prototype.composeTemplate = (function () {
                    var re = /\{{(.+?)\}}/g;
                    return function (o) {
                        return this.replace(re, function (_, k) {
                            return typeof o[k] !== 'undefined' ? o[k] : '';
                        });
                    }
                }());

            }(jQuery));
        });
    </script>
</div>