<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="dynamic-ajax-content grid-gutter-padding">
    <h4 class="my-3">Edit Profile Image</h4>
    <hr/>
    <div class="row">
        <div class="col">
            <div class="card">
                <div class="card-header d-flex align-items-center justify-content-between py-1 px-3">
                    <ul class="nav">
                        <li class="nav-item">
                            <a id="ImportWithBLOB-btn-id" class="nav-link" href="javascript:void(0);">
                                <i class="fa fa-upload fa-fw fa-lg"></i>Import With BLOB</a>
                        </li>
                        <li class="nav-item">
                            <a id="ShowCroppedImage-btn-id" class="nav-link" href="javascript:void(0);">
                                <i class="far fa-image fa-fw fa-lg"></i>Show Cropped Image</a>
                        </li>
                        <li class="nav-item">
                            <a href="javascript:void(0);" class="nav-link"
                               actionType="action-ref-href" action-ref-by-href="${pageContext.request.contextPath}/pages/dms/FileManager" >
                                <i class="far fa-lg fa-fw fa-image"></i>
                                File Manager
                            </a>
                        </li>
                        <li class="nav-item">
                            <a id="ImportCurrentProfileImage" class="nav-link" href="javascript:void(0);">
                                <i class="fas fa-file-import fa-fw fa-lg"></i>
                                Import Current Image
                            </a>
                        </li>
                    </ul>
                    <div class="options float-right">
                        <a href="#" class="settings"><i class="fa fa-cog"></i></a>
                        <a href="#" class="collapse"><i class="fa fa-chevron-up"></i></a>
                        <a href="#" class="reload"><i class="fa fa-sync"></i></a>
                        <a href="#" class="fullscreen"><i class=" fa fa-expand"></i></a>
                        <a href="#" class="remove"><i class="fa fa-times"></i></a>
                    </div>
                </div>
                <div class="card-body">
                    <form id="updateFormId" role="form" method="POST" enctype="multipart/form-data">
                        <div class="form-group">
                            <div class="custom-file">
                                <input  type="file" class="custom-file-input" id="inputImage" name="file" accept=".jpg,.jpeg,.png,.gif,.bmp,.tiff">
                                <label class="custom-file-label" for="validatedCustomFile">Choose file...</label>
                            </div>
                            <span class="help-block">
                                Select or press above button to open image browsers.
                            </span>
                        </div>
                    </form>
                    <div class="row">
                        <div class="col-12">
                            <div class="img-container d-inline-block">
                                <c:choose>
                                    <c:when test="${not empty sessionScope.user.profilePicDocument.documentId and not empty sessionScope.user.profilePicDocument.randomHash}">
                                        <img id="image" class="img-responsive" src="${pageContext.request.contextPath}/ViewUploadedFileController?documentId=${sessionScope.user.profilePicDocument.documentId}&amp;randomHash=${sessionScope.user.profilePicDocument.randomHash}&amp;viewType=inline" alt=""/>
                                    </c:when>
                                    <c:otherwise>
                                        <img id="image" class="img-responsive" src="${pageContext.request.contextPath}/assets/img/default-profile-pic.png" alt=""/>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
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
        .img-container,
        .img-preview {
            width: 100%;
            /*height: 500px;*/
            text-align: center;
        }
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

            // Import image
            var $inputImage = $('#inputImage');
            var $image = $('#image');
            var uploadedImageType = 'image/jpeg';
            var uploadedImageURL;
            var uploadedImageName;
            var URL = window.URL || window.webkitURL;
            var result;
            var cropperOptions = {
                viewMode: 1,
                aspectRatio: 4 / 5
            };
            var croppedImageModal;
            var uplodateModal;

            var defaultImageSrc = $image.attr('src');

            $(javatmp.settings.defaultOutputSelector).on(javatmp.settings.javaTmpAjaxContainerReady, function (event) {
                // fire AFTER all transition done and your ajax content is shown to user.

                $("#ImportCurrentProfileImage").on("click", function () {
                    $image.cropper('destroy').attr('src', defaultImageSrc).cropper(cropperOptions);
                });

                $("#ImportWithBLOB-btn-id").on("click", function () {
                    $inputImage.focus().trigger("click");
                });
                $("#ShowCroppedImage-btn-id").on("click", function () {
                    result = $image.cropper("getCroppedCanvas", cropperOptions);
                    if (result) {
                        croppedImageModal = BootstrapModalWrapperFactory.createModal({
                            title: "Cropped Image",
                            message: result
                        });
                        croppedImageModal.addButton({
                            label: "Close",
                            cssClass: "btn btn-secondary",
                            action: function (modalWrapper, button, buttonData, originalEvent) {
                                modalWrapper.hide();
                            }
                        });
                        croppedImageModal.addButton({
                            label: "<i class='fas fa-cloud-upload-alt fa-fw fa-lg'></i>&nbsp;Upload",
                            cssClass: "btn btn-primary",
                            action: function (modalWrapper, button, buttonData, originalEvent) {
                                result.toBlob(function (blob) {
                                    var formData = new FormData();
                                    blob.type = uploadedImageType;
                                    formData.append('croppedImage', blob, uploadedImageName);

                                    $.ajax(javatmp.settings.contextPath + '/dms/UploadController', {
                                        method: "POST",
                                        data: formData,
                                        processData: false,
                                        contentType: false,
                                        dataType: "json",
                                        success: function (response, statusText, xhr) {
                                            toastr.success(response.message, 'SUCCESS', {
                                                timeOut: 3000,
                                                progressBar: true,
                                                rtl: javatmp.settings.isRTL,
                                                positionClass: javatmp.settings.isRTL === true ? "toast-top-left" : "toast-top-right"
                                            });
                                            var table = "";
                                            var row = '<div>' +
                                                    '<p>Document Id : {{id}}</p>' +
                                                    '<p>Document Name : {{documentName}}</p>' +
                                                    '<p>Content Type : {{contentType}}</p>' +
                                                    '<p>Creation Date : {{creationDate}}</p>' +
                                                    '<p>Link To View Inline : <a target="_blank" class="" href="{{contextPath}}/ViewUploadedFileController?documentId={{link}}&amp;randomHash={{randomHash}}&amp;viewType=inline">View Inline</a></p>' +
                                                    '<p>Link To View As attachement : <a target="_blank" class="" href="{{contextPath}}/ViewUploadedFileController?documentId={{link}}&amp;randomHash={{randomHash}}&amp;viewType=attachment">View As Attachment</a></p>' +
                                                    '<p><a href="javascript:void(0);" class="" actionType="action-ref-href" action-ref-by-href="{{contextPath}}/pages/dms/FileManager">Go To File Manager To See Uploaded Files</a></p>' +
                                                    '</div>';
                                            for (var i = 0; i < response.data.length; i++) {
                                                var tempRow = row.composeTemplate({
                                                    'id': response.data[i].documentId,
                                                    'documentName': response.data[i].documentName,
                                                    'contentType': response.data[i].contentType,
                                                    'creationDate': moment(response.data[i].creationDate, "YYYY-MM-DDTHH:mm:ss").format("DD/MM/YYYY HH:mm"),
                                                    'link': response.data[i].documentId,
                                                    'randomHash': response.data[i].randomHash,
                                                    'contextPath': javatmp.settings.contextPath
                                                });
                                                table += tempRow;
                                            }
                                            uplodateModal = BootstrapModalWrapperFactory.createModal({
                                                title: "Server Uplod Response",
                                                message: table
                                            });
                                            uplodateModal.show();
                                        },
                                        error: function (xhr, status, error) {
                                            var errorObj = $.parseJSON(xhr.responseText);
                                            BootstrapModalWrapperFactory.createModal({
                                                title: xhr.statusText + " : " + xhr.status,
                                                message: errorObj.message
                                            }).show();
                                        }
                                    });
                                }, uploadedImageType);
                            }
                        });
                        croppedImageModal.originalModal.find(".modal-body").addClass("text-center");
                        croppedImageModal.originalModal.find(".modal-footer").append('<a id="downloadBtn-id" download="cropped.jpg" class="btn btn-primary" href="' + result.toDataURL(uploadedImageType) + '"><i class="far fa-image fa-fw fa-lg"></i>Download</a>');
                        croppedImageModal.show();
                        setTimeout(function () {
                            if (typeof $("#downloadBtn-id")[0].download === 'undefined') {
                                $("#downloadBtn-id").addClass('disabled');
                            }
                        }, 400);

                    }
                });

                $inputImage.change(function () {
                    var files = this.files;
                    var file;

                    if ($image.data('cropper')) {
                        $image.cropper("destroy");
                    }

                    if (files && files.length) {
                        file = files[0];

                        if (/^image\/\w+$/.test(file.type)) {
                            uploadedImageType = file.type;
                            uploadedImageName = file.name;
                            if (uploadedImageURL) {
                                URL.revokeObjectURL(uploadedImageURL);
                            }

                            uploadedImageURL = URL.createObjectURL(file);
                            $image.cropper('destroy').attr('src', uploadedImageURL).cropper(cropperOptions);
                            $inputImage.val('');

                            // bug in ie11
                            setTimeout(function () {
                                $image.cropper("resize");
                            }, 10);

                        } else {
                            window.alert('Please choose an image file.');
                        }
                    }
                });

                $image.cropper(cropperOptions);

            });

            $(javatmp.settings.defaultOutputSelector).on(javatmp.settings.javaTmpContainerResizeEventName, function (event) {
                // fire when user resize browser window or sidebar hide / show
                $image.cropper("resize");
            });

            $(javatmp.settings.defaultOutputSelector).on(javatmp.settings.cardFullscreenCompress, function (event, card) {
                // when card compress by pressing the top right tool button
                $image.cropper("resize");
            });

            $(javatmp.settings.defaultOutputSelector).on(javatmp.settings.cardFullscreenExpand, function (event, card) {
                // when card Expand by pressing the top right tool button
                $image.cropper("resize");
            });

            /**
             * When another sidebar menu item pressed and before container issues new ajax request.
             * You can cancel, destroy, or remove any thing here before replace main output ajax container.
             * return false or event.preventDefault() will cancel ajax and stay you in the current page and do nothing.
             **/
            $(javatmp.settings.defaultOutputSelector).on(javatmp.settings.javaTmpContainerRemoveEventName, function (event) {
                $(javatmp.settings.defaultOutputSelector).off(javatmp.settings.cardFullscreenCompress);
                $(javatmp.settings.defaultOutputSelector).off(javatmp.settings.cardFullscreenExpand);
                uplodateModal = uplodateModal && uplodateModal.hide();
                croppedImageModal = croppedImageModal && croppedImageModal.hide();

                $image.cropper("destroy");
                $inputImage.off();
                return true;
            });
        });</script>
</div>