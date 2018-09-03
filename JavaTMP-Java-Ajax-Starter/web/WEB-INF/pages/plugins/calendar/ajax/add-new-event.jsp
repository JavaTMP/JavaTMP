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
                            <input id="new-event-form-start-date" name="start" type="text" placeholder="Event Start Date" class="form-control required Date-and-Time">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-lg-2 col-form-label" for="textinput3">Event End Date</label>
                        <div class="col-lg-10">
                            <input id="new-event-form-end-date" name="end" type="text" placeholder="Event End Date" class="form-control required Date-and-Time">
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
                var eventForm = $('#new-event-form');
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
                        eventForm.trigger("submit");
                    }
                });

                var closeAnyWay = false;
                var callbackData = {success: false, cancel: true};
                modal.setOnDestroy(function (modalWrapper) {
                    if (closeAnyWay) {
                        modalWrapper.setOnDestroy(null);
                        // here we run passing function name as a remote callback
                        javatmp.util.waitForFinalEvent(function () {
                            if ($.isFunction(modal.options.passData.callback)) {
                                modal.options.passData.callback.apply();
                            } else if ($.type(modal.options.passData.callback) === "string") {
                                javatmp.util.executeFunctionByName(modal.options.passData.callback, window, callbackData);
                            }
                        }, 200, "add-new-event-callback");
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
//                    var form_data = new FormData(eventForm); //Creates new FormData object
                    var form_data = $(this).serializeArray();
                    function objectifyForm(formArray) {//serialize data function

                        var returnArray = {};
                        for (var i = 0; i < formArray.length; i++) {
                            returnArray[formArray[i]['name']] = formArray[i]['value'];
                        }
                        return returnArray;
                    }
                    form_data = objectifyForm(form_data);
                    form_data.start = moment(form_data.start, 'DD/MM/YYYY HH:mm').format("YYYY-MM-DDTHH:mm:ss.SSSZ");
                    form_data.end = moment(form_data.end, 'DD/MM/YYYY HH:mm').format("YYYY-MM-DDTHH:mm:ss.SSSZ");
                    $.ajax({
                        type: httpType,
                        url: post_url,
                        data: form_data,
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
                    startDate: moment(),
                    singleDatePicker: true,
                    showDropdowns: true,
                    timePicker: true,
                    timePickerIncrement: 1,
                    timePicker24Hour: true,
                    autoApply: true,
                    autoUpdateInput: true,
                    minDate: '01/01/1900 00:00:00',
                    maxDate: '31/12/2099 23:59:59',
//                    maxDate: '',
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
//                $("#new-event-form-start-date").data('daterangepicker').minDate = moment();
                //                $("#new-event-form-end-date").data('daterangepicker').minDate = $("#new-event-form-start-date").data('daterangepicker').minDate;
                var modalZIndex = modal.originalModal.css('zIndex');
                $(".daterangepicker").css('z-index', modalZIndex + 1);
                $(".daterangepicker > .ranges").hide();
                $('.Date-and-Time').inputmask({
                    alias: "datetime",
                    inputformat: "dd/mm/yyyy HH:MM",
                    displayFormat: true,
                    hourFormat: "24",
                    clearmaskonlostfocus: false
                });
            });
        });
    </script>
</div>