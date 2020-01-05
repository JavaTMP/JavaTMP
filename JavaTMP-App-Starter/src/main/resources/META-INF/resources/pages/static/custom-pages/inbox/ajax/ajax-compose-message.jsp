<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="dynamic-ajax-content grid-gutter-padding">
    <div class="row">
        <div class="col-lg-12">
            <form class="form-horizontal" id="fileupload" action="#" method="POST" enctype="multipart/form-data">
                <div class="form-group row">
                    <label class="col-lg-2 col-form-label text-right-lg" for="textinput1">To</label>
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

                <div class="form-group row">
                    <div class="col-lg-12">
                        <textarea class="form-control ajax-email-body" rows="8" name="textarea"></textarea>
                    </div>
                </div>
            </form>
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
                $("#" + currentParentModal.options.id).find('.ajax-email-body').summernote({
                    height: 100,
                    dialogsInBody: true
                });

                modal.updateTitle("Compose Message");
                modal.updateClosable(true);
                modal.updateSize("modal-lg");
                modal.addButton({
                    label: "Draft",
                    cssClass: "btn btn-warning",
                    action: function (button, buttonData, originalEvent) {
                        BootstrapModalWrapperFactory.createModal({
                            title: "Confirm",
                            message: 'Are You sure you want to draft ?',
                            closable: true,
                            closeByBackdrop: true
                        }).show();
                    }
                });
                modal.addButton({
                    label: "Send",
                    cssClass: "btn btn-success",
                    action: function (button, buttonData, originalEvent) {
                        BootstrapModalWrapperFactory.createModal({
                            title: "Confirm",
                            message: 'Are You sure you want to send ?',
                            closable: true,
                            closeByBackdrop: true
                        }).show();
                    }
                });
                modal.addButton({
                    label: "Open Another Compose Message",
                    cssClass: "btn btn-info",
                    action: function (button, buttonData, originalEvent) {
                        BootstrapModalWrapperFactory.createAjaxModal({
                            message: '<div class="text-center"><i class="fa fa-sync fa-spin fa-3x fa-fw text-primary"></i></div>',
                            closable: false,
                            size: "modal-lg",
                            closeByBackdrop: false,
                            ajax: {
                                url: "pages/custom-pages/inbox/ajax/ajax-compose-message.html"
                            },
                            ajaxContainerReadyEventName: javatmp.settings.javaTmpAjaxContainerReady
                        });
                    }
                });
                modal.addButton({
                    label: "Discard And Open Inbox Messages",
                    cssClass: "btn btn-danger",
                    action: function (button, buttonData, originalEvent) {
                        this.setOnDestroy(null);
                        $("#" + currentParentModal.options.id).find('.ajax-email-body').summernote("destroy");
                        this.hide();
                        BootstrapModalWrapperFactory.createAjaxModal({
                            message: '<div class="text-center"><i class="fa fa-sync fa-spin fa-3x fa-fw text-primary"></i></div>',
                            closable: false,
                            size: "modal-xl",
                            closeByBackdrop: false,
                            ajax: {
                                url: "pages/custom-pages/inbox/ajax/ajax-inbox-messages.html"
                            },
                            ajaxContainerReadyEventName: javatmp.settings.javaTmpAjaxContainerReady
                        });
                    }
                });
                modal.addButton({
                    template: "<a href='javascript:void(0)'></a>",
                    label: "Discard",
                    cssClass: "btn btn-link text-danger",
                    action: function (button, buttonData, originalEvent) {
                        return this.hide();
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
            });
        });
    </script>
</div>