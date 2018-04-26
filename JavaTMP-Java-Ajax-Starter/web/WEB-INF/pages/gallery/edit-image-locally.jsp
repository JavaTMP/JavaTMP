<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="dynamic-ajax-content">
    <div class="page-header">
        <h1>Edit Image Locally Using jQuery Cropper.js plugin</h1>
    </div>
    <div class="row">
        <div class="col">
            <div class="card my-3">
                <div class="card-header d-flex align-items-center justify-content-between py-1 px-3">
                    <ul class="nav">
                        <li class="nav-item">
                            <a id="ImportWithBLOB-btn-id" class="nav-link" href="javascript:void(0);">
                                <i class="fa fa-upload fa-fw fa-lg"></i>Import With BLOB</a>
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
                            <div class="img-container">
                                <img id="image" src="asasa" alt="" class="img-responsive" />
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
            background-color: #f7f7f7;
            width: 100%;
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
            var URL = window.URL || window.webkitURL;
            $(javatmp.settings.defaultOutputSelector).on(javatmp.settings.javaTmpAjaxContainerReady, function (event) {
                // fire AFTER all transition done and your ajax content is shown to user.

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

                            if (uploadedImageURL) {
                                URL.revokeObjectURL(uploadedImageURL);
                            }

                            uploadedImageURL = URL.createObjectURL(file);
                            $image.cropper('destroy').attr('src', uploadedImageURL).cropper({
                                viewMode: 1,
                                aspectRatio: 1 / 1
                            });
                            $inputImage.val('');
                        } else {
                            window.alert('Please choose an image file.');
                        }
                    }
                });

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
                $image.cropper("destroy");
                return true;
            });
        });
    </script>
</div>