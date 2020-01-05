<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="dynamic-ajax-content grid-gutter-padding">
    <div class="row">
        <div class="col-lg-12">
            <div class="col-lg-12">
                <form class="form-horizontal" id="manage-event-form" action="${pageContext.request.contextPath}/calendar/updateEvent" method="POST">
                    <div class="form-group row">
                        <label class="col-lg-2 col-form-label" for="textinput1">Event Id</label>
                        <div class="col-lg-10">
                            <input name="id" type="text" placeholder="Event ID" class="form-control required" disabled="" autofocus="" value="${requestScope.event.id}">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-lg-2 col-form-label" for="textinput1">Event Title</label>
                        <div class="col-lg-10">
                            <input name="title" type="text" placeholder="Event Title" class="form-control required" autofocus="" value="${requestScope.event.title}">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-lg-2 col-form-label" for="textinput2">Event Start Date</label>
                        <div class="col-lg-4">
                            <input id="new-event-form-start-date" name="start" type="text" placeholder="Event Start Date" class="form-control required Date-and-Time" value="<fmt:formatDate pattern='dd/MM/yyyy HH:mm' timeZone="UTC" value='${requestScope.event.startDate}'/>">
                        </div>
                        <label class="col-lg-2 col-form-label" for="textinput3">Event End Date</label>
                        <div class="col-lg-4">
                            <input id="new-event-form-end-date" name="end" type="text" placeholder="Event End Date" class="form-control required Date-and-Time" value="<fmt:formatDate pattern='dd/MM/yyyy HH:mm' timeZone="UTC" value='${requestScope.event.endDate}'/>">
                        </div>
                    </div>
                    <div class="form-group row">

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
        function convertFormToJson(formObject) {
            var formData = {};
            var $disabledFields = formObject.find('[disabled]');
            $disabledFields.prop('disabled', false); // enable fields so they are included
            var formArray = formObject.serializeArray();
            $disabledFields.prop('disabled', true); // back to disabled
            for (var i = 0; i < formArray.length; i++) {
                formData[formArray[i]['name']] = formArray[i]['value'];
            }
            return formData;
        }
        jQuery(function ($) {
            // here we can reference the container bootstrap modal by its id
            // passed as parameter to request by name "ajaxModalId"
            // or for demo purposese ONLY we can get a reference top modal
            // in current open managed instances in BootstrapModalWrapperFactory
            var currentParentModal = BootstrapModalWrapperFactory.globalModals[BootstrapModalWrapperFactory.globalModals.length - 1];
//            console.log(currentParentModal.options.id);
            $("#" + currentParentModal.options.id).on(javatmp.settings.javaTmpAjaxContainerReady, function (event, modal) {
                // fire AFTER all transition done and your ajax content is shown to user.
                var eventForm = $('#manage-event-form');
                var validator = null;
                var alertError = null;
                modal.updateTitle("Update Event \"" + eventForm.find("input[name='title']").val() + "\"");
                modal.updateClosable(true);

                modal.addButton({
                    label: "Close Dialog",
                    cssClass: "btn btn-secondary mr-auto",
                    action: function (button, buttonData, originalEvent) {
                        return this.hide();
                    }
                });
                modal.addButton({
                    label: "Delete Event",
                    cssClass: "btn btn-danger",
                    action: function (button, buttonData, originalEvent) {
                        var formData = convertFormToJson(eventForm);
                        BootstrapModalWrapperFactory.createModal({
                            message: "Are You sure you want to DELETE Event ?",
                            title: "Alert",
                            closable: false,
                            closeByBackdrop: false,
                            buttons: [
                                {
                                    label: "Cancel",
                                    cssClass: "btn btn-secondary",
                                    action: function (button, buttonData, originalEvent) {
                                        return this.hide();
                                    }
                                },
                                {
                                    label: "Delete Event ID '" + formData.id + "'",
                                    cssClass: "btn btn-danger",
                                    action: function (button, buttonData, originalEvent) {
                                        this.hide();
                                        var m = BootstrapModalWrapperFactory.createModal({
                                            message: '<div class="text-center"><i class="fa fa-sync fa-spin fa-3x fa-fw text-primary"></i></div>',
                                            closable: false,
                                            closeByBackdrop: false,
                                            closeByKeyboard: false
                                        });
                                        m.originalModal.find(".modal-dialog").css({transition: 'all 0.5s'});
                                        m.show();
                                        formData.start = moment(formData.start, 'DD/MM/YYYY HH:mm').format("YYYY-MM-DDTHH:mm:ss.SSSZ");
                                        formData.end = moment(formData.end, 'DD/MM/YYYY HH:mm').format("YYYY-MM-DDTHH:mm:ss.SSSZ");
                                        $.ajax({
                                            type: "POST",
                                            url: javatmp.settings.contextPath + "/calendar/deleteEvent",
                                            data: JSON.stringify(formData),
                                            dataType: "json",
                                            contentType: "application/json; charset=UTF-8",
                                            success: function (data) {
                                                m.updateMessage(data.message);
                                                m.updateClosable(true);
                                                m.updateTitle("Deleted Action Response");
                                                callbackData.cancel = false;
                                                callbackData.success = true;
                                                callbackData.event = formData;
                                                toastr.success(data.message, 'SUCCESS', {
                                                    timeOut: 3000,
                                                    progressBar: true,
                                                    rtl: javatmp.settings.isRTL,
                                                    positionClass: javatmp.settings.isRTL === true ? "toast-top-left" : "toast-top-right"
                                                });
                                            },
                                            error: function (data) {
                                                callbackData.success = false;
                                                alert("error" + JSON.stringify(data));
                                            }
                                        });
                                    }
                                }
                            ]
                        }).show();
                    }
                });
                modal.addButton({
                    label: "Update Event",
                    cssClass: "btn btn-primary",
                    action: function (button, buttonData, originalEvent) {
                        eventForm.trigger("submit");
                    }
                });

                modal.originalModal.find(".modal-footer").addClass("justify-content-start");

                var closeAnyWay = false;
                var callbackData = {success: false, cancel: true};
                modal.setOnDestroy(function (modalWrapper) {
                    if (closeAnyWay) {
                        modalWrapper.setOnDestroy(null);
                        // here we run passing function name as a remote callback
                        javatmp.util.waitForFinalEvent(function () {
                            if ($.isFunction(modal.options.localData.callback)) {
                                modal.options.localData.callback.apply(callbackData, [callbackData]);
                            } else if ($.type(modal.options.localData.callback) === "string") {
                                javatmp.util.executeFunctionByName(modal.options.localData.callback, window, callbackData);
                            }
                        }, 200, "manage-event-callback");
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

                eventForm.on("submit", function (event) {
                    event.preventDefault();
                    if (!$(this).valid()) {
                        return;
                    }
//                    $('#' + alertError).remove();
                    var httpType = $(this).attr("method");
                    var post_url = $(this).attr("action"); //get form action url

                    // https://stackoverflow.com/a/4748748/1461221
                    // Find disabled inputs, and remove the "disabled" attribute
//                    var disabled = $(this).find(':input:disabled').removeAttr('disabled');
//                    // serialize the form
//                    var form_data = $(this).serializeArray();
//                    // re-disabled the set of inputs that you previously enabled
//                    disabled.attr('disabled', 'disabled');
                    var form_data = null;
                    form_data = convertFormToJson($(this));
                    form_data.start = moment(form_data.start, 'DD/MM/YYYY HH:mm').format("YYYY-MM-DDTHH:mm:ss.SSSZ");
                    form_data.end = moment(form_data.end, 'DD/MM/YYYY HH:mm').format("YYYY-MM-DDTHH:mm:ss.SSSZ");
                    $.ajax({
                        type: httpType,
                        url: post_url,
                        data: JSON.stringify(form_data),
                        dataType: "json",
                        contentType: "application/json; charset=UTF-8",
                        success: function (data) {
                            callbackData.cancel = false;
                            callbackData.success = true;
                            callbackData.event = form_data;
                            toastr.success(data.message, 'SUCCESS', {
                                timeOut: 2500,
                                progressBar: true,
                                rtl: javatmp.settings.isRTL,
                                positionClass: javatmp.settings.isRTL === true ? "toast-top-left" : "toast-top-right"
                            });
                            alertError = BootstrapAlertWrapper.createAlert({
                                container: eventForm,
                                place: "prepent",
                                type: "info",
                                message: data.message,
                                focus: false,
                                close: true,
                                reset: false
                            });
                        },
                        error: function (data) {
                            callbackData.success = false;
                            alert("error" + JSON.stringify(data));
                        }
                    });
                });
                validator = eventForm.validate($.extend(true, {}, javatmp.settings.jqueryValidationDefaultOptions, {
                    rules: {
                        title: {
                            required: true
                        },
                        start: {
                            required: true,
                            validDateTime: true,
                            dateEqualOrLessThan: '#new-event-form-end-date'
                        },
                        end: {
                            required: true,
                            validDateTime: true,
                            dateEqualOrGreaterThan: "#new-event-form-start-date"
                        }
                    },
                    messages: {
                        title: {
                            required: "Kindly enter the title of this event"
                        },
                        start: {
                            required: "Kindly enter the start date of this event",
                            validDateTime: "Kindly enter a valid date format 'DD/MM/YYYY HH:MI'",
                            dateLessThan: "Kindly enter a date less than the end date of this event"
                        },
                        end: {
                            required: "Kindly enter the end date of this event",
                            validDateTime: "Kindly enter a valid date format 'DD/MM/YYYY HH:MI'",
                            dateGreaterThan: "Kindly enter a date greater than the start date of this event"
                        }
                    }
                }));

                $('.Date-and-Time').css({
                    direction: "ltr",
                    "text-align": javatmp.settings.floatDefault
                });
                $('.Date-and-Time').daterangepicker({
                    "opens": javatmp.settings.floatReverse,
//                    startDate: moment(),
                    singleDatePicker: true,
                    showDropdowns: true,
                    timePicker: true,
                    timePickerIncrement: 1,
                    timePicker24Hour: true,
                    autoApply: true,
                    autoUpdateInput: true,
                    minDate: '01/01/1900 00:00:00',
                    maxDate: '31/12/2099 23:59:59',
//                    minDate: '20/04/2018 00:00:00',
//                    minDate: moment(),
                    locale: {
                        "direction": javatmp.settings.direction,
                        format: 'DD/MM/YYYY HH:mm'
                    }
                });
                $("#new-event-form-start-date").on("hide.daterangepicker", function () {
                    eventForm.valid();
                    $("#new-event-form-end-date").data('daterangepicker').minDate = $("#new-event-form-start-date").data('daterangepicker').startDate;
                });
                $("#new-event-form-end-date").on("hide.daterangepicker", function () {
                    eventForm.valid();
                    $("#new-event-form-start-date").data('daterangepicker').maxDate = $("#new-event-form-end-date").data('daterangepicker').startDate;
                });
                $("#new-event-form-start-date").data('daterangepicker').maxDate = $("#new-event-form-end-date").data('daterangepicker').startDate;
                $("#new-event-form-end-date").data('daterangepicker').minDate = $("#new-event-form-start-date").data('daterangepicker').startDate;
                var modalZIndex = modal.originalModal.css('zIndex');
                $(".daterangepicker").css('z-index', modalZIndex + 1);
                $(".daterangepicker > .ranges").hide();
                $('.Date-and-Time').inputmask({
                    alias: "datetime",
                    placeholder: "dd/mm/yyyy HH:MM",
                    inputFormat: "dd/mm/yyyy HH:MM",
                    displayFormat: true,
                    hourFormat: "24",
                    clearMaskOnLostFocus: false
                });
            });
        });
    </script>
</div>