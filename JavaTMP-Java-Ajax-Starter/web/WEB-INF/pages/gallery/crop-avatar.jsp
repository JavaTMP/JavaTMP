<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="dynamic-ajax-content">
    <div class="page-header">
        <h1>Crop Avatar</h1>
    </div>
    <div class="row">
        <div class="col">
            <div class="card">
                <div class="card-header">

                    <div class="options float-right">
                        <a href="#" class="settings"><i class="fa fa-cog"></i></a>
                        <a href="#" class="collapse"><i class="fa fa-chevron-up"></i></a>
                        <a href="#" class="reload"><i class="fa fa-sync"></i></a>
                        <a href="#" class="fullscreen"><i class=" fa fa-expand"></i></a>
                        <a href="#" class="remove"><i class="fa fa-times"></i></a>
                    </div>
                </div>
                <div class="card-body">
                    <div id="crop-avatar">

                        <!-- Current avatar -->
                        <div class="avatar-view" title="Change the avatar">
                            <img src="${pageContext.request.contextPath}/assets/img/crop/picture.jpg" alt=""/>
                        </div>

                        <!-- Cropping modal -->
                        <div class="modal fade" id="avatar-modal" aria-hidden="true" aria-labelledby="avatar-modal-label" role="dialog" tabindex="-1">
                            <div class="modal-dialog modal-lg">
                                <div class="modal-content">
                                    <form class="avatar-form" action="${pageContext.request.contextPath}/UploadController" enctype="multipart/form-data" method="post">
                                        <div class="modal-header">
                                            <h4 class="modal-title" id="avatar-modal-label">Change Avatar</h4>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <div class="modal-body">
                                            <div class="avatar-body">

                                                <!-- Upload image and data -->
                                                <div class="avatar-upload">
                                                    <input type="hidden" class="avatar-src">
                                                    <input type="hidden" class="avatar-data">
                                                    <label for="avatarInput">Local upload</label>
                                                    <input type="file" class="avatar-input" id="avatarInput" name="avatar_file">
                                                </div>

                                                <!-- Crop and preview -->
                                                <div class="row">
                                                    <div class="col-md-9">
                                                        <div class="avatar-wrapper"></div>
                                                    </div>
                                                    <div class="col-md-3">
                                                        <div class="avatar-preview preview-lg"></div>
                                                        <div class="avatar-preview preview-md"></div>
                                                        <div class="avatar-preview preview-sm"></div>
                                                    </div>
                                                </div>

                                                <div class="row avatar-btns">
                                                    <div class="col-md-9">
                                                        <div class="btn-group">
                                                            <button type="button" class="btn btn-primary" data-method="rotate" data-option="-90" title="Rotate -90 degrees">Rotate Left</button>
                                                            <button type="button" class="btn btn-primary" data-method="rotate" data-option="-15">-15deg</button>
                                                            <button type="button" class="btn btn-primary" data-method="rotate" data-option="-30">-30deg</button>
                                                            <button type="button" class="btn btn-primary" data-method="rotate" data-option="-45">-45deg</button>
                                                        </div>
                                                        <div class="btn-group">
                                                            <button type="button" class="btn btn-primary" data-method="rotate" data-option="90" title="Rotate 90 degrees">Rotate Right</button>
                                                            <button type="button" class="btn btn-primary" data-method="rotate" data-option="15">15deg</button>
                                                            <button type="button" class="btn btn-primary" data-method="rotate" data-option="30">30deg</button>
                                                            <button type="button" class="btn btn-primary" data-method="rotate" data-option="45">45deg</button>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-3">
                                                        <button type="submit" class="btn btn-primary btn-block avatar-save">Done</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- <div class="modal-footer">
                                          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                        </div> -->
                                    </form>
                                </div>
                            </div>
                        </div><!-- /.modal -->

                        <!-- Loading state -->
                        <div class="loading" aria-label="Loading" role="img" tabindex="-1"></div>
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
        .avatar-view {
            display: block;
            margin: 15% auto 5%;
            height: 220px;
            width: 220px;
            border: 3px solid #fff;
            border-radius: 5px;
            box-shadow: 0 0 5px rgba(0,0,0,.15);
            cursor: pointer;
            overflow: hidden;
        }
        .avatar-view img {
            width: 100%;
        }

        .avatar-body {
            padding-right: 15px;
            padding-left: 15px;
        }

        .avatar-upload {
            overflow: hidden;
        }

        .avatar-upload label {
            display: block;
            float: left;
            clear: left;
            width: 100px;
        }

        .avatar-upload input {
            display: block;
            margin-left: 110px;
        }

        .avatar-alert {
            margin-top: 10px;
            margin-bottom: 10px;
        }

        .avatar-wrapper {
            height: 364px;
            width: 100%;
            margin-top: 15px;
            box-shadow: inset 0 0 5px rgba(0,0,0,.25);
            background-color: #fcfcfc;
            overflow: hidden;
        }

        .avatar-wrapper img {
            display: block;
            height: auto;
            max-width: 100%;
        }

        .avatar-preview {
            float: left;
            margin-top: 15px;
            margin-right: 15px;
            border: 1px solid #eee;
            border-radius: 4px;
            background-color: #fff;
            overflow: hidden;
        }

        .avatar-preview:hover {
            border-color: #ccf;
            box-shadow: 0 0 5px rgba(0,0,0,.15);
        }

        .avatar-preview img {
            width: 100%;
        }

        .preview-lg {
            height: 184px;
            width: 184px;
            margin-top: 15px;
        }

        .preview-md {
            height: 100px;
            width: 100px;
        }

        .preview-sm {
            height: 50px;
            width: 50px;
        }

        @media (min-width: 992px) {
            .avatar-preview {
                float: none;
            }
        }

        .avatar-btns {
            margin-top: 30px;
            margin-bottom: 15px;
        }

        .avatar-btns .btn-group {
            margin-right: 5px;
        }

        .loading {
            display: none;
            position: absolute;
            top: 0;
            right: 0;
            bottom: 0;
            left: 0;
            background: #fff url("${pageContext.request.contextPath}/assets/img/crop/loading.gif") no-repeat center center;
            opacity: .75;
            filter: alpha(opacity=75);
            z-index: 20140628;
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
            var console = window.console || {log: function () {}};

            function CropAvatar($element) {
                this.$container = $element;

                this.$avatarView = this.$container.find('.avatar-view');
                this.$avatar = this.$avatarView.find('img');
                this.$avatarModal = this.$container.find('#avatar-modal');
                this.$loading = this.$container.find('.loading');

                this.$avatarForm = this.$avatarModal.find('.avatar-form');
                this.$avatarUpload = this.$avatarForm.find('.avatar-upload');
                this.$avatarSrc = this.$avatarForm.find('.avatar-src');
                this.$avatarData = this.$avatarForm.find('.avatar-data');
                this.$avatarInput = this.$avatarForm.find('.avatar-input');
                this.$avatarSave = this.$avatarForm.find('.avatar-save');
                this.$avatarBtns = this.$avatarForm.find('.avatar-btns');

                this.$avatarWrapper = this.$avatarModal.find('.avatar-wrapper');
                this.$avatarPreview = this.$avatarModal.find('.avatar-preview');
                this.init();
            }

            CropAvatar.prototype = {
                constructor: CropAvatar,

                support: {
                    fileList: !!$('<input type="file">').prop('files'),
                    blobURLs: !!window.URL && URL.createObjectURL,
                    formData: !!window.FormData
                },

                init: function () {
                    this.support.datauri = this.support.fileList && this.support.blobURLs;

                    if (!this.support.formData) {
                        this.initIframe();
                    }

                    this.initTooltip();
                    this.initModal();
                    this.addListener();
                },

                addListener: function () {
                    this.$avatarView.on('click', $.proxy(this.click, this));
                    this.$avatarInput.on('change', $.proxy(this.change, this));
                    this.$avatarForm.on('submit', $.proxy(this.submit, this));
                    this.$avatarBtns.on('click', $.proxy(this.rotate, this));
                },

                initTooltip: function () {
                    this.$avatarView.tooltip({
                        placement: 'bottom'
                    });
                },

                initModal: function () {
                    this.$avatarModal.modal({
                        show: false
                    });
                },

                initPreview: function () {
                    var url = this.$avatar.attr('src');

                    this.$avatarPreview.html('<img src="' + url + '">');
                },

                initIframe: function () {
                    var target = 'upload-iframe-' + (new Date()).getTime();
                    var $iframe = $('<iframe>').attr({
                        name: target,
                        src: ''
                    });
                    var _this = this;

                    // Ready ifrmae
                    $iframe.one('load', function () {

                        // respond response
                        $iframe.on('load', function () {
                            var data;

                            try {
                                data = $(this).contents().find('body').text();
                            } catch (e) {
                                console.log(e.message);
                            }

                            if (data) {
                                try {
                                    data = $.parseJSON(data);
                                } catch (e) {
                                    console.log(e.message);
                                }

                                _this.submitDone(data);
                            } else {
                                _this.submitFail('Image upload failed!');
                            }

                            _this.submitEnd();

                        });
                    });

                    this.$iframe = $iframe;
                    this.$avatarForm.attr('target', target).after($iframe.hide());
                },

                click: function () {
                    this.$avatarModal.modal('show');
                    this.initPreview();
                },

                change: function () {
                    var files;
                    var file;

                    if (this.support.datauri) {
                        files = this.$avatarInput.prop('files');

                        if (files.length > 0) {
                            file = files[0];

                            if (this.isImageFile(file)) {
                                if (this.url) {
                                    URL.revokeObjectURL(this.url); // Revoke the old one
                                }

                                this.url = URL.createObjectURL(file);
                                this.startCropper();
                            }
                        }
                    } else {
                        file = this.$avatarInput.val();

                        if (this.isImageFile(file)) {
                            this.syncUpload();
                        }
                    }
                },

                submit: function () {
                    if (!this.$avatarSrc.val() && !this.$avatarInput.val()) {
                        return false;
                    }

                    if (this.support.formData) {
                        this.ajaxUpload();
                        return false;
                    }
                },

                rotate: function (e) {
                    var data;

                    if (this.active) {
                        data = $(e.target).data();

                        if (data.method) {
                            this.$img.cropper(data.method, data.option);
                        }
                    }
                },

                isImageFile: function (file) {
                    if (file.type) {
                        return /^image\/\w+$/.test(file.type);
                    } else {
                        return /\.(jpg|jpeg|png|gif)$/.test(file);
                    }
                },

                startCropper: function () {
                    var _this = this;

                    if (this.active) {
                        this.$img.cropper('replace', this.url);
                    } else {
                        this.$img = $('<img src="' + this.url + '">');
                        this.$avatarWrapper.empty().html(this.$img);
                        this.$img.cropper({
                            aspectRatio: 1,
                            preview: this.$avatarPreview,
                            crop: function (e) {
                                var json = [
                                    '{"x":' + e.x,
                                    '"y":' + e.y,
                                    '"height":' + e.height,
                                    '"width":' + e.width,
                                    '"rotate":' + e.rotate + '}'
                                ].join();

                                _this.$avatarData.val(json);
                            }
                        });

                        this.active = true;
                    }

                    this.$avatarModal.one('hidden.bs.modal', function () {
                        _this.$avatarPreview.empty();
                        _this.stopCropper();
                    });
                },

                stopCropper: function () {
                    if (this.active) {
                        this.$img.cropper('destroy');
                        this.$img.remove();
                        this.active = false;
                    }
                },

                ajaxUpload: function () {
                    var url = this.$avatarForm.attr('action');
                    var data = new FormData(this.$avatarForm[0]);
                    var _this = this;

                    $.ajax(url, {
                        type: 'post',
                        data: data,
                        dataType: 'json',
                        processData: false,
                        contentType: false,

                        beforeSend: function () {
                            _this.submitStart();
                        },

                        success: function (data) {
                            _this.submitDone(data);
                        },

                        error: function (XMLHttpRequest, textStatus, errorThrown) {
                            _this.submitFail(textStatus || errorThrown);
                        },

                        complete: function () {
                            _this.submitEnd();
                        }
                    });
                },

                syncUpload: function () {
                    this.$avatarSave.click();
                },

                submitStart: function () {
                    this.$loading.fadeIn();
                },

                submitDone: function (data) {
                    console.log(data);

                    if ($.isPlainObject(data) && data.state === 200) {
                        if (data.result) {
                            this.url = data.result;

                            if (this.support.datauri || this.uploaded) {
                                this.uploaded = false;
                                this.cropDone();
                            } else {
                                this.uploaded = true;
                                this.$avatarSrc.val(this.url);
                                this.startCropper();
                            }

                            this.$avatarInput.val('');
                        } else if (data.message) {
                            this.alert(data.message);
                        }
                    } else {
                        this.alert('Failed to response');
                    }
                },

                submitFail: function (msg) {
                    this.alert(msg);
                },

                submitEnd: function () {
                    this.$loading.fadeOut();
                },

                cropDone: function () {
                    this.$avatarForm.get(0).reset();
                    this.$avatar.attr('src', this.url);
                    this.stopCropper();
                    this.$avatarModal.modal('hide');
                },

                alert: function (msg) {
                    var $alert = [
                        '<div class="alert alert-danger avatar-alert alert-dismissable">',
                        '<button type="button" class="close" data-dismiss="alert">&times;</button>',
                        msg,
                        '</div>'
                    ].join('');

                    this.$avatarUpload.after($alert);
                }
            };


            var cropAvatarMain = new CropAvatar($('#crop-avatar'));


            $(javatmp.settings.defaultOutputSelector).on(javatmp.settings.javaTmpAjaxContainerReady, function (event) {
                // fire AFTER all transition done and your ajax content is shown to user.
            });

            $(javatmp.settings.defaultOutputSelector).on(javatmp.settings.javaTmpContainerResizeEventName, function (event) {
                // fire when user resize browser window or sidebar hide / show
            });

            $(javatmp.settings.defaultOutputSelector).on(javatmp.settings.cardFullscreenCompress, function (event, card) {
                // when card compress by pressing the top right tool button
            });

            $(javatmp.settings.defaultOutputSelector).on(javatmp.settings.cardFullscreenExpand, function (event, card) {
                // when card Expand by pressing the top right tool button
            });

            /**
             * When another sidebar menu item pressed and before container issues new ajax request.
             * You can cancel, destroy, or remove any thing here before replace main output ajax container.
             * return false or event.preventDefault() will cancel ajax and stay you in the current page and do nothing.
             **/
            $(javatmp.settings.defaultOutputSelector).on(javatmp.settings.javaTmpContainerRemoveEventName, function (event) {
                $(javatmp.settings.defaultOutputSelector).off(javatmp.settings.cardFullscreenCompress);
                $(javatmp.settings.defaultOutputSelector).off(javatmp.settings.cardFullscreenExpand);
                return true;
            });
        });
    </script>
</div>