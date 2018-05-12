<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="dynamic-ajax-content">
    <div class="row">
        <div class="col-lg-12">
            <div class="card" id="compose-message-id">
                <div class="card-header d-flex align-items-center py-2">
                    <div class="btn-group d-inline float-left" role="group">
                        <button id="compose-message-send-id" type="button" class="btn btn-sm btn-success">Send</button>
                        <button id="compose-message-discard-id" type="button" class="btn btn-sm btn-danger">Discard & Close Dialog</button>
                    </div>
                </div>
                <div class="card-body">
                    <div class="row">
                        <div class="col-lg-12">
                            <form class="form-horizontal" id="createMessageForm" action="#" method="POST" enctype="multipart/form-data">
                                <div class="form-group row">
                                    <label for="currentUserName" class="col-sm-2 col-form-label">Your Name</label>
                                    <div class="col-sm-10">
                                        <input type="text" readonly class="form-control-plaintext" id="currentUserName" value="${sessionScope.user.firstName}&nbsp;${sessionScope.user.lastName}">
                                    </div>
                                </div>
                                <div class="form-group form-row">
                                    <label for="messageUsersToDropdown" class="col-sm-2 col-form-label">Select Users</label>
                                    <div class="col-sm-10">
                                        <select name="messageTos" id="messageUsersToDropdown" class="form-control forceValidate" multiple></select>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-lg-2 col-form-label" for="textinput4">Subject</label>
                                    <div class="col-lg-10">
                                        <input id="textinput4" name="messageTitle" type="text" placeholder="Subject of your Message" class="form-control input-md">
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <div class="col-lg-12">
                                        <textarea class="form-control ajax-email-body forceValidate" rows="8" name="messageContentText"></textarea>
                                    </div>
                                </div>

                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <style type="text/css">
        .remoteUsers-dropdown .select2-results__option--highlighted .text-muted {
            color: white!important;
        }
    </style>
    <script type="text/javascript">
//        console.log("currentParentModal.options.id");
//        var currentParentModal = BootstrapModalWrapperFactory.globalModals[BootstrapModalWrapperFactory.globalModals.length - 1];
//        console.log(currentParentModal.options.id);
        jQuery(function ($) {
            // here we can reference the container bootstrap modal by its id
            // passed as parameter to request by name "ajaxModalId"
            // or for demo purposese ONLY we can get a reference top modal
            // in current open managed instances in BootstrapModalWrapperFactory
            var validator = null;
            var summerNote = null;
            var currentParentModal = BootstrapModalWrapperFactory.globalModals[BootstrapModalWrapperFactory.globalModals.length - 1];
//            console.log(currentParentModal.options.id);
            $("#" + currentParentModal.options.id).on(javatmp.settings.javaTmpAjaxContainerReady, function (event, modal) {
                // fire AFTER all transition done and your ajax content is shown to user.
                summerNote = $("#" + currentParentModal.options.id).find('.ajax-email-body');
                summerNote.summernote({
                    height: 100,
                    dialogsInBody: true
                });

                modal.updateTitle("Compose Message");
                modal.updateClosable(true);
                modal.updateSize("modal-lg");

                modal.addButton({
                    label: "Open Another Compose Message",
                    cssClass: "btn btn-info",
                    action: function (modalWrapper, button, buttonData, originalEvent) {
                        BootstrapModalWrapperFactory.createAjaxModal({
                            message: '<div class="text-center"><i class="fa fa-sync fa-spin fa-3x fa-fw text-primary"></i></div>',
                            closable: false,
                            closeByBackdrop: false,
                            url: javatmp.settings.contextPath + "/pages/custom-pages/inbox/ajax/ajax-compose-message",
                            ajaxContainerReadyEventName: javatmp.settings.javaTmpAjaxContainerReady
                        });
                    }
                });
                modal.addButton({
                    label: "Close And Open Inbox Messages",
                    cssClass: "btn btn-info",
                    action: function (modalWrapper, button, buttonData, originalEvent) {
                        modalWrapper.setOnDestroy(null);
                        $("#" + currentParentModal.options.id).find('.ajax-email-body').summernote("destroy");
                        modalWrapper.hide();
                        BootstrapModalWrapperFactory.createAjaxModal({
                            message: '<div class="text-center"><i class="fa fa-sync fa-spin fa-3x fa-fw text-primary"></i></div>',
                            closable: false,
                            closeByBackdrop: false,
                            url: javatmp.settings.contextPath + "/pages/custom-pages/inbox/ajax/ajax-inbox-messages",
                            ajaxContainerReadyEventName: javatmp.settings.javaTmpAjaxContainerReady
                        });
                    }
                });
                var closeButton = modal.addButton({
                    label: "Close",
                    cssClass: "btn btn-primary",
                    action: function (modalWrapper, button, buttonData, originalEvent) {
                        return modalWrapper.hide();
                    }
                });

                var closeAnyWay = false;
                modal.setOnDestroy(function (modalWrapper) {
                    if (closeAnyWay) {
                        modalWrapper.setOnDestroy(null);
                        return true;
                    }
                    BootstrapModalWrapperFactory.confirm({
                        title: "Confirm",
                        message: "Are You Sure You want to Close ?",
                        onConfirmAccept: function () {
                            closeAnyWay = true;
                            $("#" + currentParentModal.options.id).find('.ajax-email-body').summernote("destroy");
                            modalWrapper.hide();
                        },
                        onConfirmCancel: function () {
                        }
                    });
                    return false;
                });

                $("#messageUsersToDropdown").select2({
                    allowClear: true,
                    theme: "bootstrap",
                    dir: javatmp.settings.direction,
                    placeholder: "Recipients Of Your Message",
                    width: '',
                    containerCssClass: ':all:',
                    ajax: {
                        url: javatmp.settings.contextPath + "/user/ListUsersController",
                        dataType: 'json',
                        delay: 250,
                        cache: true,
                        data: function (params) {
                            return {
                                _ajaxGlobalBlockUI: false,
                                "start": (params.page ? params.page - 1 : 0) * 10,
                                "length": 10,
                                "draw": 1,
                                "search[value]": params.term
                            };
                        },
                        processResults: function (data, params) {
                            // parse the results into the format expected by Select2
                            // since we are using custom formatting functions we do not need to
                            // alter the remote JSON data, except to indicate that infinite
                            // scrolling can be used
                            params.page = params.page || 1;

                            // https://stackoverflow.com/questions/14819865/select2-ajax-method-not-selecting
                            var actualResult = [];
                            for (var i = 0; i < data.data.data.length; i++) {
                                actualResult.push({
                                    id: data.data.data[i].id,
                                    text: data.data.data[i].firstName + " " + data.data.data[i].lastName,
                                    firstName: data.data.data[i].firstName,
                                    lastName: data.data.data[i].lastName,
                                    position: data.data.data[i].position,
                                    office: data.data.data[i].office,
                                    email: data.data.data[i].email
                                });
                            }
                            console.log("params.page [" + params.page + "] total [" + data.data.recordsTotal + "] isMore [" + ((params.page * 10) < data.data.recordsTotal) + "]");
                            return {
                                results: actualResult,
                                pagination: {
                                    more: (params.page * 10) < data.data.recordsTotal
                                }
                            };
                        }
                    },
                    escapeMarkup: function (markup) {
                        return markup;
                    },
                    templateResult: formatUser,
                    templateSelection: formatUserSelection,
                    dropdownCssClass: "remoteUsers-dropdown",
                    closeOnSelect: false
                }).on("select2:select", function () {
//                    (this).focus();
                }).on("select2:open", function () {
                    // select2 postpone dropdown creation in ajax mode until first result come so,
                    // we should add z-index after select2 dropdown creation.
                    var modalZIndex = modal.originalModal.css('zIndex');
                    modalZIndex = modalZIndex + 1;
                    $(".remoteUsers-dropdown", ".select2-container--bootstrap").css('z-index', modalZIndex);
                });
                function formatUser(repo) {
                    if (repo.loading)
                        return repo.text;
                    var template =
                            '    <div class="media">' +
                            '        <img class="mr-1" src="{{contextPath}}/assets/img/64x64.gif" alt="user profile image"/>' +
                            '        <div class="media-body">' +
                            '            <div class="mt-0 d-flex justify-content-between">' +
                            '                <strong>{{firstName}} {{lastName}}</strong>' +
                            '                <span class="text-muted">' +
                            '                    <small><em>{{office}} office</em></small>' +
                            '                </span>' +
                            '            </div>' +
                            '            {{position}}' +
                            '            <div class="small">{{email}}</div>' +
                            '        </div>' +
                            '    </div>';
                    String.prototype.composeTemplate = (function () {
                        var re = /\{{(.+?)\}}/g;
                        return function (o) {
                            return this.replace(re, function (_, k) {
                                return typeof o[k] !== 'undefined' ? o[k] : '';
                            });
                        };
                    }());
                    var readyData = template.composeTemplate({
                        'messageId': repo.id,
                        'position': repo.position,
                        'firstName': repo.firstName,
                        'lastName': repo.lastName,
                        'office': repo.office,
                        'email': repo.email,
                        'contextPath': javatmp.settings.contextPath
                    });

                    return readyData;
                }

                function formatUserSelection(repo) {
                    return repo.text || repo.firstName + " " + repo.lastName + " (" + repo.id + ")";
                }


                $("#compose-message-discard-id").on("click", function () {
                    closeButton.trigger("click");
                });
                var createMessageForm = $('#createMessageForm');
                $("#compose-message-send-id").on("click", function () {

                    summerNote.summernote('triggerEvent', 'change');
                    if (!createMessageForm.valid()) {
                        return false;
                    }

                    BootstrapModalWrapperFactory.createModal({
                        message: "Are You sure you want to Send This Message ?",
                        title: "Alert",
                        closable: false,
                        closeByBackdrop: false,
                        buttons: [
                            {
                                label: "Cancel",
                                cssClass: "btn btn-secondary",
                                action: function (modalWrapper, button, buttonData, originalEvent) {
                                    return modalWrapper.hide();
                                }
                            },
                            {
                                label: "Yes, Send it",
                                cssClass: "btn btn-primary",
                                action: function (modalWrapper, button, buttonData, originalEvent) {
                                    modalWrapper.hide();
                                    var m = BootstrapModalWrapperFactory.createModal({
                                        message: '<div class="text-center"><i class="fa fa-sync fa-spin fa-3x fa-fw text-primary"></i></div>',
                                        closable: false,
                                        closeByBackdrop: false,
                                        closeByKeyboard: false
                                    });
                                    m.originalModal.find(".modal-dialog").css({transition: 'all 0.5s'});
                                    m.show();
                                    var formData = {};
                                    var $disabledFields = createMessageForm.find('[hidden]');
                                    $disabledFields.prop('disabled', false); // enable fields so they are included
                                    var formArray = createMessageForm.serializeArray();
                                    $disabledFields.prop('disabled', true); // back to disabled
                                    // add default parameters:
                                    $.each(javatmp.settings.defaultPassData, function (index, value) {
                                        formArray.push({name: index, value: value});
                                    });
                                    $.ajax({
                                        type: "POST",
                                        url: javatmp.settings.contextPath + "/message/CreateMessageController",
                                        data: formArray,
                                        success: function (data) {
                                            m.updateMessage(data.message);
                                            m.updateClosable(true);
                                            m.updateTitle("Create Message Response");
                                            toastr.success(data.message, 'SUCCESS', {
                                                timeOut: 3000,
                                                progressBar: true,
                                                rtl: javatmp.settings.isRTL,
                                                positionClass: javatmp.settings.isRTL === true ? "toast-top-left" : "toast-top-right"
                                            });
                                        },
                                        error: function (data) {
                                            alert("error" + JSON.stringify(data));
                                        }
                                    });
                                }
                            }
                        ]
                    }).show();
                });

                jQuery.validator.addMethod("summernoteRequired", function (value, element, params) {
                    if (this.optional(element))
                        return true;
                    if (value !== "" && value !== "<p><br></p>")
                        return true;
                    return false;
                }, 'Kindly Provide a value');

                validator = createMessageForm.validate($.extend(true, {}, window.jqueryValidationDefaultOptions, {
//                    ignore: ":hidden",
                    ignore: ":hidden:not(.forceValidate), [contenteditable='true']:not([name])",
                    rules: {
                        messageTos: {
                            required: true
                        },
                        messageTitle: {
                            required: true,
                            minlength: 5,
                            maxlength: 50
                        },
                        messageContentText: {
                            required: true,
                            summernoteRequired: true
                        }
                    },
                    messages: {
                        messageTos: {
                            required: "Kindly provide choose your reciever users"
                        },
                        messageTitle: {
                            required: "Kindly provide your message title"
                        },
                        messageContentText: {
                            required: "Kindly provide your message content",
                            summernoteRequired: "Kindly provide your message content"
                        }
                    }
                }));

            });
        });
    </script>
</div>