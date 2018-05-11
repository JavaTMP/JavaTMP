<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="dynamic-ajax-content">
    <div class="row">
        <div class="col-lg-12">
            <div class="card">
                <div class="card-header">
                    ${requestScope.message.messageTitle}
                </div>
                <div class="card-body">
                    <div class="row">
                        <div class="col-lg-12">
                            <img src="${pageContext.request.contextPath}/assets/img/64x64.gif" class="" style="">
                            <span class="">${requestScope.message.fromUser.firstName}&nbsp;${requestScope.message.fromUser.lastName}</span>
                            <span>&lt;${requestScope.message.fromUser.email}&gt; </span> on ${requestScope.message.creationDate}
                            <div class="float-right">
                                <div class="btn-group">
                                    <a class="btn btn-primary dropdown-toggle" data-toggle="dropdown" href="javascript:;"
                                       aria-expanded="false">
                                        Options
                                    </a>
                                    <ul class="dropdown-menu dropdown-menu-right">
                                        <li>
                                            <a class="dropdown-item" href="javascript:;">Reply</a>
                                        </li>
                                        <li>
                                            <a class="dropdown-item" href="javascript:;">Forward</a>
                                        </li>
                                        <li>
                                            <a class="dropdown-item" href="javascript:;">Delete</a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                    <hr/>
                    <div class="row">
                        <div class="col-12">
                            ${requestScope.message.messageContentText}
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        jQuery(function ($) {

            // here we can reference the container bootstrap modal by its id
            // passed as parameter to request by name "ajaxModalId"
            // or for demo purposese ONLY we can get a reference top modal
            // in current open managed instances in BootstrapModalWrapperFactory
            var currentParentModal = BootstrapModalWrapperFactory.globalModals[BootstrapModalWrapperFactory.globalModals.length - 1];

            $("#" + currentParentModal.options.id).on(javatmp.settings.javaTmpAjaxContainerReady, function (event, modal) {
                // fire AFTER all transition done and your ajax content is shown to user.
                modal.updateSize("modal-lg");
                modal.updateTitle("View Message");
                modal.updateClosable(true);
                modal.addButton({
                    label: "Compose A New Message",
                    cssClass: "btn btn-danger",
                    action: function (modalWrapper, button, buttonData, originalEvent) {
                        setTimeout(function () {
                            BootstrapModalWrapperFactory.createAjaxModal({
                                message: '<div class="text-center"><i class="fa fa-sync fa-spin fa-3x fa-fw text-primary"></i></div>',
                                closable: false,
                                closeByBackdrop: false,
                                url: javatmp.settings.contextPath + "/pages/custom-pages/inbox/ajax/ajax-compose-message",
                                ajaxContainerReadyEventName: javatmp.settings.javaTmpAjaxContainerReady
                            });
                        }, 300);
                    }
                }, true);
                modal.addButton({
                    label: "Close",
                    cssClass: "btn btn-primary",
                    action: function (modalWrapper, button, buttonData, originalEvent) {
                        return modalWrapper.hide();
                    }
                }, true);



            });
        });
    </script>
</div>