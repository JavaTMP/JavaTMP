<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="dynamic-ajax-content">
    <div class="row">
        <div class="col-lg-12">
            <div class="card" id="fullcalendar-add-new-event">
                <div class="card-header d-flex align-items-center py-2">
                </div>
                <div class="card-body">
                    <div class="row">
                        <div class="col-lg-12">
                            <form class="form-horizontal" id="new-event-form" action="#" method="POST">
                                <div class="form-group row">
                                    <label class="col-lg-2 col-form-label" for="textinput1">To</label>
                                    <div class="col-lg-10">
                                        <input id="textinput1" name="textinput" type="text" placeholder="Recipients Of Your Email" class="form-control">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-lg-2 col-form-label" for="textinput2">Cc</label>
                                    <div class="col-lg-10">
                                        <input id="textinput2" name="textinput" type="text" placeholder="Carbon Copy" class="form-control input-md">
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label class="col-lg-2 col-form-label" for="textinput3">Bcc</label>
                                    <div class="col-lg-10">
                                        <input id="textinput3" name="textinput" type="text" placeholder="Blind Carbon Copy" class="form-control input-md">
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label class="col-lg-2 col-form-label" for="textinput4">Subject</label>
                                    <div class="col-lg-10">
                                        <input id="textinput4" name="textinput" type="text" placeholder="Subject of your email" class="form-control input-md">
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
                modal.updateTitle("Add New Diary Event");
                modal.updateClosable(true);
                modal.updateSize("modal-lg");
                modal.addButton({
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
                            modalWrapper.hide();
                        },
                        onConfirmCancel: function () {
                        }
                    });
                    return false;
                });
            });
        });
    </script>
</div>