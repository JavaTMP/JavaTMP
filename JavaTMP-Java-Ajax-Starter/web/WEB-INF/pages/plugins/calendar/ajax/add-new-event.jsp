<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="dynamic-ajax-content">
    <div class="row">
        <div class="col-lg-12">
            <div class="col-lg-12">
                <form class="form-horizontal" id="new-event-form" action="${pageContext.request.contextPath}/calendar/addNewEvent" method="POST">
                    <div class="form-group row">
                        <label class="col-lg-2 col-form-label" for="textinput1">Event Title</label>
                        <div class="col-lg-10">
                            <input name="title" type="text" placeholder="Event Title" class="form-control required" autofocus="">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-lg-2 col-form-label" for="textinput2">Event Start Date</label>
                        <div class="col-lg-10">
                            <input id="new-event-form-start-date" name="start" type="text" placeholder="Event Start Date" class="form-control required">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-lg-2 col-form-label" for="textinput3">Event End Date</label>
                        <div class="col-lg-10">
                            <input id="new-event-form-end-date" name="end" type="text" placeholder="Event End Date" class="form-control required">
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <style type="text/css">
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
            var currentParentModal = BootstrapModalWrapperFactory.globalModals[BootstrapModalWrapperFactory.globalModals.length - 1];
//            console.log(currentParentModal.options.id);
            $("#" + currentParentModal.options.id).on(javatmp.settings.javaTmpAjaxContainerReady, function (event, modal) {
                // fire AFTER all transition done and your ajax content is shown to user.
                var loginForm = $('#new-event-form');
                var validator = null;
                var alertError = null;
                modal.updateTitle("Add New Diary Event");
                modal.updateClosable(true);
                modal.updateSize("modal-lg");
                modal.addButton({
                    label: "Close",
                    cssClass: "btn btn-danger",
                    action: function (modalWrapper, button, buttonData, originalEvent) {
                        return modalWrapper.hide();
                    }
                });
                modal.addButton({
                    label: "Add New Event",
                    cssClass: "btn btn-primary",
                    action: function (modalWrapper, button, buttonData, originalEvent) {
                        loginForm.trigger("submit");
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
                            modalWrapper.hide();
                        },
                        onConfirmCancel: function () {
                        }
                    });
                    return false;
                });

                loginForm.on("submit", function (event) {
                    event.preventDefault();
                    if (!$(this).valid()) {
                        return;
                    }
                    $('#' + alertError).remove();
                    var httpType = $(this).attr("method");
                    var post_url = $(this).attr("action"); //get form action url
//                    var form_data = new FormData(loginForm); //Creates new FormData object
                    var form_data = $(this).serializeArray();
                    function objectifyForm(formArray) {//serialize data function

                        var returnArray = {};
                        for (var i = 0; i < formArray.length; i++) {
                            returnArray[formArray[i]['name']] = formArray[i]['value'];
                        }
                        return returnArray;
                    }
                    form_data = objectifyForm(form_data);
                    form_data.start = moment(form_data.start, 'DD/MM/YYYY HH:mm').format("YYYY-MM-DDTHH:mm:ss");
                    form_data.end = moment(form_data.end, 'DD/MM/YYYY HH:mm').format("YYYY-MM-DDTHH:mm:ss");
                    $.ajax({
                        type: httpType,
                        url: post_url,
                        data: form_data,
                        success: function (data) {
                            alertError = BootstrapAlertWrapper.createAlert({
                                container: loginForm,
                                place: "prepent",
                                type: "info",
                                message: data.message,
                                close: true
                            });
                        },
                        error: function (data) {
                            alert("error" + JSON.stringify(data));
                        }
                    });
                });

                jQuery.validator.addMethod("validDate", function (value, element) {
                    return this.optional(element) || moment(value, "DD/MM/YYYY HH:mm").isValid();
                }, "Please enter a valid date in the format DD/MM/YYYY HH:mm");

                validator = loginForm.validate({
                    rules: {
                        title: {
                            required: true
                        },
                        start: {
                            required: true,
                            validDate: true
//                            dateLessThan: '#new-event-form-end-date'
                        },
                        end: {
                            required: true,
                            validDate: true
//                            dateGreaterThan: "#new-event-form-start-date"
                        }
                    },
                    highlight: function (element) {
                        $(element).closest('.form-group').removeClass('has-success').addClass('has-error');
                    },
                    unhighlight: function (element) {
                        $(element).closest('.form-group').removeClass('has-error').addClass('has-success');
                    },
                    errorElement: 'small',
                    errorClass: 'form-text text-danger',
                    errorPlacement: function (error, element) {
                        if (element.length) {
                            var targetParent = $(element).parent();
                            if (targetParent.hasClass("form-check") || targetParent.hasClass("custom-control")) {
                                targetParent = targetParent.parent();
                            }
                            targetParent.append(error);
                        }
                    }
                });
            });
        });
    </script>
</div>