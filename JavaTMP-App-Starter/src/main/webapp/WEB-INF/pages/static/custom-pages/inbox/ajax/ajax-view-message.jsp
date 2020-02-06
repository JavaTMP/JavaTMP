<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="dynamic-ajax-content grid-gutter-padding">
    <div class="row">
        <div class="col-lg-12">
            <div class="card">
                <div class="card-header">
                    Lorem ipsum dolor sit amet
                </div>
                <div class="card-body">
                    <div class="row">
                        <div class="col-lg-12">
                            <img src="assets/img/avatar/profile_pic_min.png" class="" style="">
                            <span class="">Customer Support</span>
                            <span>&lt;support@javatmp.com&gt; </span> on 12:00 PM 1 JAN 2018
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
                            <p>
                                Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diem nonummy nibh euismod tincidunt ut lacreet dolore magna aliguam erat volutpat. Ut wisis enim ad minim veniam, quis nostrud exerci tution ullam corper suscipit lobortis nisi ut aliquip ex ea commodo consequat. Duis te feugi facilisi. Duis autem dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit au gue duis dolore te feugat nulla facilisi.
                            </p>
                            <p>
                                Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diem nonummy nibh euismod tincidunt ut lacreet dolore magna aliguam erat volutpat. Ut wisis enim ad minim veniam, quis nostrud exerci tution ullam corper suscipit lobortis nisi ut aliquip ex ea commodo consequat. Duis te feugi facilisi. Duis autem dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit au gue duis dolore te feugat nulla facilisi.
                            </p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="card my-3">
                <div class="card-header">
                    Attachments
                    <a class="float-right" href="javascript:;">Download all attachments</a>
                </div>
                <div class="card-body">
                    <div class="row">
                        <div class="col-lg-4">
                            <div class="card mb-3">
                                <img class="card-img-top img-fluid" alt="100%x180" src="assets/img/gallery/1.jpg">
                                <div class="card-footer d-flex align-items-center">
                                    <small class="text-muted">1.jpg</small>
                                    <a href="#" class="btn btn-primary ml-auto">Download</a>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4">
                            <div class="card mb-3">
                                <img class="card-img-top img-fluid" alt="100%x180" src="assets/img/gallery/2.jpg">
                                <div class="card-footer d-flex align-items-center">
                                    <small class="text-muted">2.jpg</small>
                                    <a href="#" class="btn btn-primary ml-auto">Download</a>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4">
                            <div class="card mb-3">
                                <img class="card-img-top img-fluid" alt="100%x180" src="assets/img/gallery/3.jpg">
                                <div class="card-footer d-flex align-items-center">
                                    <small class="text-muted">3.jpg</small>
                                    <a href="#" class="btn btn-primary ml-auto">Download</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row mb-3">
                        <div class="col-lg-4">
                            <div class="card mb-3">
                                <img class="card-img-top img-fluid" alt="100%x180" src="assets/img/gallery/4.jpg">
                                <div class="card-footer d-flex align-items-center">
                                    <small class="text-muted">4.jpg</small>
                                    <a href="#" class="btn btn-primary ml-auto">Download</a>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4">
                            <div class="card mb-3">
                                <img class="card-img-top img-fluid" alt="100%x180" src="assets/img/gallery/5.jpg">
                                <div class="card-footer d-flex align-items-center">
                                    <small class="text-muted">5.jpg</small>
                                    <a href="#" class="btn btn-primary ml-auto">Download</a>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4">
                            <div class="card mb-3">
                                <img class="card-img-top img-fluid" alt="100%x180" src="assets/img/gallery/6.jpg">
                                <div class="card-footer d-flex align-items-center">
                                    <small class="text-muted">6.jpg</small>
                                    <a href="#" class="btn btn-primary ml-auto">Download</a>
                                </div>
                            </div>
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
                    action: function (button, buttonData, originalEvent) {
                        setTimeout(function () {
                            BootstrapModalWrapperFactory.createAjaxModal({
                                message: '<div class="text-center"><i class="fa fa-sync fa-spin fa-3x fa-fw text-primary"></i></div>',
                                closable: false,
                                closeByBackdrop: false,
                                size: "modal-lg",
                                ajax: {
                                    url: "pages/custom-pages/inbox/ajax/ajax-compose-message.html"
                                },
                                ajaxContainerReadyEventName: javatmp.settings.javaTmpAjaxContainerReady
                            });
                        }, 300);
                    }
                });
                modal.addButton({
                    label: "Close",
                    cssClass: "btn btn-primary",
                    action: function (button, buttonData, originalEvent) {
                        return this.hide();
                    }
                });
            });
        });
    </script>
</div>