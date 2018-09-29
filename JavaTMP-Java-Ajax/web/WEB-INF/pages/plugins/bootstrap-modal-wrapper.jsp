<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="dynamic-ajax-content">
    <div class="row">
        <div class="col">
            <div class="alert alert-info my-3">
                <p>Bootstrap modal wrapper factory for creating dynamic and nested stacked dialog instances.</p>
                <p>
                    <a class="btn btn-info" target="_blank" href="https://www.javatmp.com/pages/javatmp-bootstrap-modal-wrapper">Demo Page</a>
                    <a class="btn btn-info" target="_blank" href="https://github.com/JavaTMP/bootstrap-modal-wrapper">github.com Project Link</a>
                </p>
            </div>
            <div class="card my-3">
                <div class="card-header">
                    Bootstrap Modal Wrapper Plugin
                    <div class="options float-right">
                        <a href="#" class="settings"><i class="fa fa-cog"></i></a>
                        <a href="#" class="collapse"><i class="fa fa-chevron-up"></i></a>
                        <a href="#" class="reload"><i class="fa fa-sync"></i></a>
                        <a href="#" class="fullscreen"><i class=" fa fa-expand"></i></a>
                        <a href="#" class="remove"><i class="fa fa-times"></i></a>
                    </div>
                </div>
                <div class="card-body">
                    <div class="row">
                        <div class="col">
                            <h2 class="mt-3 text-primary">Predefined Modal Types</h2>
                            <button id="simple-message" type="button" class="btn btn-primary">
                                Basic Message
                            </button>
                            <button id="simple-alert" type="button" class="btn btn-primary">
                                Basic Alert
                            </button>
                            <button id="simple-confirm" type="button" class="btn btn-primary">
                                Basic Confirm
                            </button>
                            <h2 class="mt-3 text-primary">Using Generic Modal Factory's createModal method</h2>
                            <button id="onlyBody" type="button" class="btn btn-primary">
                                Only Body
                            </button>
                            <button id="onlyBodyWithHeader" type="button" class="btn btn-primary">
                                Body & Title
                            </button>
                            <button id="disableClose" type="button" class="btn btn-primary">
                                Disable Close
                            </button>
                            <button id="disableCloseBackdrop" type="button" class="btn btn-primary">
                                Disable Close & Backdrop
                            </button>
                            <button id="multiModal" type="button" class="btn btn-primary">
                                Multi Modals
                            </button>
                            <h2 class="mt-3 text-primary">Update Contents on the fly</h2>
                            <button id="updateTitleContent" type="button" class="btn btn-primary">
                                Update Title and Content
                            </button>
                            <button id="updateModalSize" type="button" class="btn btn-primary">
                                Update Modal Size
                            </button>
                            <button id="updateButtons" type="button" class="btn btn-primary">
                                Update Buttons
                            </button>
                            <button id="ajaxContent" type="button" class="btn btn-primary">
                                Fake Ajax Content Uploader
                            </button>
                            <h2 class="mt-3 text-primary">Bootstrap Ajax Content Modal</h2>
                            <button id="ajaxContentinSmallModal" type="button" class="btn btn-primary m-3">
                                Remote Ajax Content Fetcher in Small Modal
                            </button>
                            <button id="ajaxContentinDefaultModal" type="button" class="btn btn-primary m-3">
                                Remote Ajax Content Fetcher in Default Modal
                            </button>
                            <button id="ajaxContentinLargeModal" type="button" class="btn btn-primary m-3">
                                Remote Ajax Content Fetcher in Large Modal
                            </button>
                            <button id="ajaxContentinSmallToLargeModal" type="button" class="btn btn-primary m-3">
                                Remote Ajax Content Fetcher in Small then large Modal
                            </button>
                            <h2 class="mt-3 text-primary">Original Bootstrap events</h2>
                            <button id="logConsoleModal" type="button" class="btn btn-primary">
                                Log Events On the console
                            </button>
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

            $(javatmp.settings.defaultOutputSelector).on(javatmp.settings.javaTmpAjaxContainerReady, function (event) {
                // fire AFTER all transition done and your ajax content is shown to user.
                $("#simple-message").on("click", function (event) {
                    BootstrapModalWrapperFactory.showMessage("Delfault Message to show to user");
                });
                $("#simple-alert").on("click", function (event) {
                    BootstrapModalWrapperFactory.alert("Delfault alert <b>with only message</b>");
                });
                $("#simple-confirm").on("click", function (event) {
                    BootstrapModalWrapperFactory.confirm({
                        title: "Confirm",
                        message: "Are You Sure ?",
                        onConfirmAccept: function () {
                            BootstrapModalWrapperFactory.alert("Thank you for ACCEPTING the previous confiramtion dialog");
                        },
                        onConfirmCancel: function () {
                            BootstrapModalWrapperFactory.alert("Thank you for CANCELING the previous confiramtion dialog");
                        }
                    });
                });
                $("#onlyBody").on("click", function (event) {
                    var onlyBody = BootstrapModalWrapperFactory.createModal({
                        message: "Simple Message body",
                        closable: false,
                        closeByBackdrop: true
                    });
                    onlyBody.show();
                });
                $("#onlyBodyWithHeader").on("click", function (event) {
                    var modalWrapper = BootstrapModalWrapperFactory.createModal({
                        message: "Simple Message body",
                        title: "Header Title",
                        closable: true,
                        closeByBackdrop: true
                    });
                    modalWrapper.show();
                });
                $("#disableClose").on("click", function (event) {
                    var modalWrapper = BootstrapModalWrapperFactory.createModal({
                        message: "Simple Message body",
                        title: "Header Title",
                        closable: false,
                        closeByBackdrop: true
                    });
                    modalWrapper.show();
                });
                $("#disableCloseBackdrop").on("click", function (event) {
                    var modalWrapper = BootstrapModalWrapperFactory.createModal({
                        message: "Simple Message body",
                        title: "Header Title",
                        closable: false,
                        closeByBackdrop: false,
                        buttons: [
                            {
                                label: "Close Me",
                                cssClass: "btn btn-primary",
                                action: function (modalWrapper, button, buttonData, originalEvent) {
                                    return modalWrapper.hide();
                                }
                            }
                        ]
                    });
                    modalWrapper.show();
                });
                $("#multiModal").on("click", function (event) {
                    var modalWrapper = BootstrapModalWrapperFactory.createModal({
                        message: "Simple Message body",
                        title: "Header Title",
                        closable: false,
                        closeByBackdrop: false,
                        buttons: [
                            {
                                label: "Close",
                                cssClass: "btn btn-secondary",
                                action: function (modalWrapper, button, buttonData, originalEvent) {
                                    return modalWrapper.hide();
                                }
                            },
                            {
                                label: "Create alert",
                                cssClass: "btn btn-primary",
                                action: function (modalWrapper, button, buttonData, originalEvent) {
                                    BootstrapModalWrapperFactory.alert("Alert Modal Created");
                                }
                            }
                        ]
                    }).show();
                });
                $("#updateTitleContent").on("click", function (event) {
                    BootstrapModalWrapperFactory.createModal({
                        message: "Simple Message body",
                        title: "Header Title",
                        closable: false,
                        closeByBackdrop: false,
                        buttons: [
                            {
                                label: "Close",
                                cssClass: "btn btn-secondary",
                                action: function (modalWrapper, button, buttonData, originalEvent) {
                                    return modalWrapper.hide();
                                }
                            },
                            {
                                label: "Update Title & Message",
                                cssClass: "btn btn-primary",
                                action: function (modalWrapper, button, buttonData, originalEvent) {
                                    modalWrapper.updateTitle("New Title");
                                    modalWrapper.updateMessage("Updated message content");
                                }
                            }
                        ]
                    }).show();
                });
                $("#updateModalSize").on("click", function (event) {
                    BootstrapModalWrapperFactory.createModal({
                        message: "Simple Message body",
                        title: "Header Title",
                        closable: false,
                        closeByBackdrop: false,
                        buttons: [
                            {
                                label: "Close",
                                cssClass: "btn btn-secondary",
                                action: function (modalWrapper, button, buttonData, originalEvent) {
                                    return modalWrapper.hide();
                                }
                            },
                            {
                                label: "Make Me Large",
                                cssClass: "btn btn-primary",
                                action: function (modalWrapper, button, buttonData, originalEvent) {
                                    modalWrapper.originalModal.find(".modal-dialog").css({transition: 'all 0.4s'});
                                    modalWrapper.updateSize("modal-lg");
                                }
                            },
                            {
                                label: "Make Me Small",
                                cssClass: "btn btn-primary",
                                action: function (modalWrapper, button, buttonData, originalEvent) {
                                    modalWrapper.originalModal.find(".modal-dialog").css({transition: 'all 0.4s'});
                                    modalWrapper.updateSize("modal-sm");
                                }
                            },
                            {
                                label: "Make Me Default",
                                cssClass: "btn btn-primary",
                                action: function (modalWrapper, button, buttonData, originalEvent) {
                                    modalWrapper.originalModal.find(".modal-dialog").css({transition: 'all 0.4s'});
                                    modalWrapper.updateSize(null);
                                }
                            }
                        ]
                    }).show();
                });
                $("#updateButtons").on("click", function (event) {
                    var buttonsCount = 0;
                    BootstrapModalWrapperFactory.createModal({
                        message: "Simple Message body",
                        title: "Header Title",
                        closable: false,
                        closeByBackdrop: false,
                        buttons: [
                            {
                                label: "Close",
                                cssClass: "btn btn-secondary",
                                action: function (modalWrapper, button, buttonData, originalEvent) {
                                    return modalWrapper.hide();
                                }
                            },
                            {
                                label: "Add Button",
                                cssClass: "btn btn-primary",
                                action: function (modalWrapper, button, buttonData, originalEvent) {
                                    modalWrapper.addButton({
                                        id: "id-" + (++buttonsCount),
                                        label: "New " + buttonsCount,
                                        cssClass: "btn btn-secondary",
                                        action: function (modalWrapper, button, buttonData, originalEvent) {
                                            BootstrapModalWrapperFactory.showMessage("nothing only to show attached event to button id [" + buttonData.id + "]");
                                            return true;
                                        }
                                    });
                                }
                            },
                            {
                                label: "Delete Button",
                                cssClass: "btn btn-primary",
                                action: function (modalWrapper, button, buttonData, originalEvent) {
                                    modalWrapper.removeButton("id-" + (buttonsCount--));
                                }
                            }
                        ]
                    }).show();
                });
                $("#ajaxContent").on("click", function (event) {
                    var m = BootstrapModalWrapperFactory.createModal({
                        message: '<div class="text-center"><i class="fa fa-sync fa-spin fa-3x fa-fw text-primary"></i></div>',
                        closable: false,
                        closeByBackdrop: false
                    });
                    m.originalModal.find(".modal-dialog").css({transition: 'all 0.5s'});
                    m.show();
                    setTimeout(function () {
                        m.updateSize("modal-lg");
                        m.updateTitle("Message Received");
                        m.updateMessage("Message Content");
                        m.addButton({
                            label: "Close",
                            cssClass: "btn btn-secondary",
                            action: function (modalWrapper, button, buttonData, originalEvent) {
                                return modalWrapper.hide();
                            }
                        });
                    }, 2000);
                });
                $("#ajaxContentinSmallToLargeModal").on("click", function (event) {
                    var m = BootstrapModalWrapperFactory.createAjaxModal({
                        message: '<div class="text-center">Loading</div>',
                        closable: true,
                        title: "AJAX Content",
                        closeByBackdrop: false,
                        sendId: true, // default is true which send the modal id as a url parameter.
                        idParameter: "ajaxModalIdTestingName", // default name for url parameter containing id of the modal is "ajaxModalId"
                        updateSizeAfterDataFetchTo: "modal-lg", // default is "modal-lg" or null for standard or "modal-sm"
                        size: "modal-sm",
                        url: javatmp.settings.contextPath + "/pages/custom-pages/inbox/ajax/ajax-compose-message",
                        ajaxContainerReadyEventName: javatmp.settings.javaTmpAjaxContainerReady,
                        localData: {
                            para1: "any value 1",
                            object1: {m: 1, n: 3},
                            array1: [1, 2, 3, 4, 5],
                            funRef: function () {
                                alert("running from the modal itself");
                            }
                        } // Javascript Object kept in the settings object and available from within modal functions by options.localData
                    });
                });
                $("#ajaxContentinSmallModal").on("click", function (event) {
                    var m = BootstrapModalWrapperFactory.createAjaxModal({
                        message: '<div class="text-center">Loading</div>',
                        closable: true,
                        title: "AJAX Content",
                        closeByBackdrop: false,
                        sendId: true, // default is true which send the modal id as a url parameter.
                        idParameter: "ajaxModalIdTestingName", // default name for url parameter containing id of the modal is "ajaxModalId"
                        updateSizeAfterDataFetchTo: "modal-sm", // default is "modal-lg" or null for standard or "modal-sm"
                        size: "modal-sm",
                        url: javatmp.settings.contextPath + "/pages/custom-pages/inbox/ajax/ajax-compose-message",
                        ajaxContainerReadyEventName: javatmp.settings.javaTmpAjaxContainerReady,
                        localData: {
                            para1: "any value 1",
                            object1: {m: 1, n: 3},
                            array1: [1, 2, 3, 4, 5],
                            funRef: function () {
                                alert("running from the modal itself");
                            }
                        } // Javascript Object kept in the settings object and available from within modal functions by options.localData
                    });
                });
                $("#ajaxContentinDefaultModal").on("click", function (event) {
                    var m = BootstrapModalWrapperFactory.createAjaxModal({
                        message: '<div class="text-center">Loading</div>',
                        closable: true,
                        title: "AJAX Content",
                        closeByBackdrop: false,
                        sendId: true, // default is true which send the modal id as a url parameter.
                        idParameter: "ajaxModalIdTestingName", // default name for url parameter containing id of the modal is "ajaxModalId"
                        updateSizeAfterDataFetchTo: null, // default is "modal-lg" or null for standard or "modal-sm"
                        size: null,
                        url: javatmp.settings.contextPath + "/pages/custom-pages/inbox/ajax/ajax-compose-message",
                        ajaxContainerReadyEventName: javatmp.settings.javaTmpAjaxContainerReady,
                        localData: {
                            para1: "any value 1",
                            object1: {m: 1, n: 3},
                            array1: [1, 2, 3, 4, 5],
                            funRef: function () {
                                alert("running from the modal itself");
                            }
                        } // Javascript Object kept in the settings object and available from within modal functions by options.localData
                    });
                });
                $("#ajaxContentinLargeModal").on("click", function (event) {
                    var m = BootstrapModalWrapperFactory.createAjaxModal({
                        message: '<div class="text-center">Loading</div>',
                        closable: true,
                        title: "AJAX Content",
                        closeByBackdrop: false,
                        sendId: true, // default is true which send the modal id as a url parameter.
                        idParameter: "ajaxModalIdTestingName", // default name for url parameter containing id of the modal is "ajaxModalId"
                        updateSizeAfterDataFetchTo: "modal-lg", // default is  or null for standard or "modal-sm"
                        size: "modal-lg",
                        url: javatmp.settings.contextPath + "/pages/custom-pages/inbox/ajax/ajax-compose-message",
                        ajaxContainerReadyEventName: javatmp.settings.javaTmpAjaxContainerReady,
                        localData: {
                            para1: "any value 1",
                            object1: {m: 1, n: 3},
                            array1: [1, 2, 3, 4, 5],
                            funRef: function () {
                                alert("running from the modal itself");
                            }
                        } // Javascript Object kept in the settings object and available from within modal functions by options.localData
                    });
                });



                $("#logConsoleModal").on("click", function (event) {
                    var modalWrapper = BootstrapModalWrapperFactory.createModal({
                        message: "Simple Message body",
                        title: "Header Title",
                        closable: true,
                        closeByBackdrop: true
                    });
                    modalWrapper.originalModal.find(".modal-header").addClass("bg-primary text-white");
                    modalWrapper.originalModal.on('show.bs.modal', function (e) {
                        // do something...
                        console.log('show.bs.modal');
                    }).on('shown.bs.modal', function (e) {
                        // do something...
                        console.log('shown.bs.modal');
                    }).on('hide.bs.modal', function (e) {
                        // do something...
                        console.log('hide.bs.modal');
                    }).on('hidden.bs.modal', function (e) {
                        // do something...
                        console.log('hidden.bs.modal');
                    });
                    modalWrapper.show();
                });

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