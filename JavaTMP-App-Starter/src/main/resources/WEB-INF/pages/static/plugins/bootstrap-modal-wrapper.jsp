<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="dynamic-ajax-content grid-gutter-padding">
    <div class="row">
        <div class="col">
            <div class="alert alert-info mt-3">
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
                            <h1 class="mt-3 text-primary">Bootstrap Modal Wrapper Plugin Demo</h1>
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
                            <button id="longBodyContent" type="button" class="btn btn-primary">
                                Long Body Content
                            </button>
                            <button id="h1ForTitle" type="button" class="btn btn-primary">
                                H1 for title
                            </button>
                            <button id="fullscreenfeatures" type="button" class="btn btn-primary">
                                Fullscreen modal
                            </button>
                            <button id="customTemplateForButtons" type="button" class="btn btn-primary">
                                A link for buttons
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
                            <button id="ajaxContentinXLargeModal" type="button" class="btn btn-primary m-3">
                                Remote Ajax Content Fetcher in X Large Modal
                            </button>
                            <button id="ajaxContentinSmallToXLargeModal" type="button" class="btn btn-primary m-3">
                                Remote Ajax Content Fetcher in Small then X large Modal
                            </button>

                            <h2 class="mt-3 text-primary">Original Bootstrap events</h2>
                            <button id="logConsoleModal" type="button" class="btn btn-primary">
                                Log Events On the console
                            </button>
                            <h2 class="mt-3 text-primary">Centered Bootstrap Modals</h2>
                            <button id="centeredBootModal" type="button" class="btn btn-primary">
                                Centered Bootstrap Modal
                            </button>
                            <h2 class="mt-3 text-primary">Draggable Bootstrap Modals</h2>
                            <button id="DraggableBootstrapModal1" type="button" class="btn btn-primary">
                                Draggable Bootstrap Modal Using Jquery UI
                            </button>
                            <button id="DraggableBootstrapModal2" type="button" class="btn btn-primary ml-1">
                                Draggable Bootstrap Modal Using Jquery
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
    <style type="text/css">
        .bootstrap-modal-wrapper-fullscreen {
            position: fixed;
            top: 0;
            right: 0;
            bottom: 0;
            left: 0;
            overflow: hidden;
        }
        .bootstrap-modal-wrapper-fullscreen .modal-dialog {
            position: fixed;
            margin: 0;
            width: 100%;
            height: 100%;
            padding: 0;top: 0;
            right: 0;
            bottom: 0;
            left: 0;
            max-height: 100%;
            max-width: 100%;
            display: flex;
        }
        .bootstrap-modal-wrapper-fullscreen .modal-dialog .modal-content {
            height: 100vh;
            max-height: 100vh;
            overflow: hidden;
        }
        .bootstrap-modal-wrapper-fullscreen .modal-dialog .modal-content .modal-header,
        .bootstrap-modal-wrapper-fullscreen .modal-dialog .modal-content .modal-footer {
            flex-shrink: 0;
        }
        .bootstrap-modal-wrapper-fullscreen .modal-dialog .modal-content .modal-body {
            overflow-y: auto;
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

            $(javatmp.settings.defaultOutputSelector).on(javatmp.settings.javaTmpAjaxContainerReady, function (event) {
                // fire AFTER all transition done and your ajax content is shown to user.
                console.log("initial z-index [" + BootstrapModalWrapperFactory.options.starterZIndex + "]");
                BootstrapModalWrapperFactory.options.starterZIndex = 15000;
                console.log("initial z-index after update [" + BootstrapModalWrapperFactory.options.starterZIndex + "]");
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
                                action: function (button, buttonData, originalEvent) {
                                    return this.hide();
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
                                action: function (button, buttonData, originalEvent) {
                                    return this.hide();
                                }
                            },
                            {
                                label: "Create alert",
                                cssClass: "btn btn-primary",
                                action: function (button, buttonData, originalEvent) {
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
                                action: function (button, buttonData, originalEvent) {
                                    return this.hide();
                                }
                            },
                            {
                                label: "Update Title & Message",
                                cssClass: "btn btn-primary",
                                action: function (button, buttonData, originalEvent) {
                                    this.updateTitle("New Title");
                                    this.updateMessage("Updated message content");
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
                                action: function (button, buttonData, originalEvent) {
                                    return this.hide();
                                }
                            },
                            {
                                label: "Make Me Extra Large",
                                cssClass: "btn btn-primary",
                                action: function (button, buttonData, originalEvent) {
                                    this.originalModal.find(".modal-dialog").css({transition: 'all 0.4s'});
                                    this.updateSize("modal-xl");
                                }
                            },
                            {
                                label: "Make Me Large",
                                cssClass: "btn btn-primary",
                                action: function (button, buttonData, originalEvent) {
                                    this.originalModal.find(".modal-dialog").css({transition: 'all 0.4s'});
                                    this.updateSize("modal-lg");
                                }
                            },
                            {
                                label: "Make Me Small",
                                cssClass: "btn btn-primary",
                                action: function (button, buttonData, originalEvent) {
                                    this.originalModal.find(".modal-dialog").css({transition: 'all 0.4s'});
                                    this.updateSize("modal-sm");
                                }
                            },
                            {
                                label: "Make Me Default",
                                cssClass: "btn btn-primary",
                                action: function (button, buttonData, originalEvent) {
                                    this.originalModal.find(".modal-dialog").css({transition: 'all 0.4s'});
                                    this.updateSize(null);
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
                                action: function (button, buttonData, originalEvent) {
                                    return this.hide();
                                }
                            },
                            {
                                label: "Add Button",
                                cssClass: "btn btn-primary",
                                action: function (button, buttonData, originalEvent) {
                                    this.addButton({
                                        id: "id-" + (++buttonsCount),
                                        label: "New " + buttonsCount,
                                        cssClass: "btn btn-secondary",
                                        action: function (button, buttonData, originalEvent) {
                                            BootstrapModalWrapperFactory.showMessage("nothing only to show attached event to button id [" + buttonData.id + "]");
                                            return true;
                                        }
                                    });
                                }
                            },
                            {
                                label: "Delete Button",
                                cssClass: "btn btn-primary",
                                action: function (button, buttonData, originalEvent) {
                                    this.removeButton("id-" + (buttonsCount--));
                                }
                            }
                        ]
                    }).show();
                });
                $("#ajaxContent").on("click", function (event) {
                    var m = BootstrapModalWrapperFactory.createModal({
                        message: '<div class="text-center">Loading</div>',
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
                            action: function (button, buttonData, originalEvent) {
                                return this.hide();
                            }
                        });
                    }, 2000);
                });
                $("#ajaxContentinSmallToXLargeModal").on("click", function (event) {
                    var m = BootstrapModalWrapperFactory.createAjaxModal({
                        message: '<div class="text-center">Loading</div>',
                        closable: true,
                        title: "AJAX Content",
                        closeByBackdrop: false,
                        sendId: true, // default is true which send the modal id as a url parameter.
                        idParameter: "ajaxModalIdTestingName", // default name for url parameter containing id of the modal is "ajaxModalId"
                        updateSizeAfterDataFetchTo: "modal-xl", // default is "modal-lg" or null for standard or "modal-sm"
                        size: "modal-sm",
                        ajax: {
                            url: "pages/custom-pages/inbox/ajax/blank-ajax-response.html"
                        },
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
                        ajax: {
                            url: "pages/custom-pages/inbox/ajax/blank-ajax-response.html"
                        },
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
                        ajax: {
                            url: "pages/custom-pages/inbox/ajax/blank-ajax-response.html"
                        },
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
                        ajax: {
                            url: "pages/custom-pages/inbox/ajax/blank-ajax-response.html"
                        },
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
                $("#ajaxContentinXLargeModal").on("click", function (event) {
                    var m = BootstrapModalWrapperFactory.createAjaxModal({
                        message: '<div class="text-center">Loading</div>',
                        closable: true,
                        title: "AJAX Content",
                        closeByBackdrop: false,
                        sendId: true, // default is true which send the modal id as a url parameter.
                        idParameter: "ajaxModalIdTestingName", // default name for url parameter containing id of the modal is "ajaxModalId"
                        updateSizeAfterDataFetchTo: "modal-xl", // default is  or null for standard or "modal-sm"
                        size: "modal-xl",
                        ajax: {
                            url: "pages/custom-pages/inbox/ajax/blank-ajax-response.html"
                        },
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
                $("#centeredBootModal").on("click", function (event) {
                    var centeredBootModal = BootstrapModalWrapperFactory.createModal({
                        message: "Simple Centered Bootstrap Message body",
                        closable: false,
                        closeByBackdrop: true,
                        centered: true
                    });
                    centeredBootModal.show();
                });

                $("#longBodyContent").on("click", function (event) {
                    var longContent = "";
                    for (var i = 0; i < 20; i++) {
                        longContent += "<p>Cras mattis consectetur purus sit amet fermentum. Cras justo odio, dapibus ac facilisis in, egestas eget quam. Morbi leo risus, porta ac consectetur ac, vestibulum at eros.</p>";
                    }
                    var dialog = BootstrapModalWrapperFactory.createModal({
                        title: "Long Body Content",
                        message: longContent,
                        closable: false,
                        closeByBackdrop: true,
                        centered: true,
                        buttons: [
                            {
                                label: "Set Scrollable True",
                                cssClass: "btn btn-secondary",
                                action: function (button, buttonData, originalEvent) {
                                    return this.updateModalDialogScrollable(true);
                                }
                            },
                            {
                                label: "Set Scrollable False",
                                cssClass: "btn btn-secondary",
                                action: function (button, buttonData, originalEvent) {
                                    return this.updateModalDialogScrollable(false);
                                }
                            },
                            {
                                label: "Close",
                                cssClass: "btn btn-secondary",
                                action: function (button, buttonData, originalEvent) {
                                    return this.hide();
                                }
                            }
                        ]
                    });
                    dialog.show();
                });

                $("#h1ForTitle").on("click", function (event) {
                    var dialog = BootstrapModalWrapperFactory.createModal({
                        title: "Long Body Content",
                        modalTitleContainer: "<h1 class='modal-title'></h1>",
                        message: "modal dialog body content",
                        closable: true,
                        closeByBackdrop: true,
                        centered: true,
                        buttons: [
                            {
                                label: "Close",
                                cssClass: "btn btn-secondary",
                                action: function (button, buttonData, originalEvent) {
                                    return this.hide();
                                }
                            }
                        ]
                    });
                    dialog.show();
                });

                $("#fullscreenfeatures").on("click", function (event) {
                    var lineOfText = "<p>Cras mattis consectetur purus sit amet fermentum. Cras justo odio, dapibus ac facilisis in, egestas eget quam. Morbi leo risus, porta ac consectetur ac, vestibulum at eros.</p>";
                    var longContent = "";
                    for (var i = 0; i < 2; i++) {
                        longContent += lineOfText;
                    }
                    var dialog = BootstrapModalWrapperFactory.createModal({
                        title: "Fullscreen Long Body Content",
                        message: longContent,
                        closable: false,
                        closeByBackdrop: true,
                        centered: true,
                        modalDialogScrollable: false,
                        buttons: [
                            {
                                label: "Set Scrollable True",
                                cssClass: "btn btn-secondary",
                                action: function (button, buttonData, originalEvent) {
                                    return this.updateModalDialogScrollable(true);
                                }
                            },
                            {
                                label: "Set Scrollable False",
                                cssClass: "btn btn-secondary",
                                action: function (button, buttonData, originalEvent) {
                                    return this.updateModalDialogScrollable(false);
                                }
                            },
                            {
                                label: "Add More Content",
                                cssClass: "btn btn-secondary",
                                action: function (button, buttonData, originalEvent) {
                                    var currentBody = $(dialog.originalModal).find(".modal-body").html();
                                    for (var i = 0; i < 5; i++) {
                                        currentBody += lineOfText;
                                    }
                                    $(dialog.originalModal).find(".modal-body").html(currentBody);
                                }
                            },
                            {
                                label: "Add Fullscreen",
                                cssClass: "btn btn-secondary",
                                action: function (button, buttonData, originalEvent) {
                                    $(dialog.originalModal).addClass("bootstrap-modal-wrapper-fullscreen");
                                }
                            },
                            {
                                label: "Remove Fullscreen",
                                cssClass: "btn btn-secondary",
                                action: function (button, buttonData, originalEvent) {
                                    $(dialog.originalModal).removeClass("bootstrap-modal-wrapper-fullscreen");
                                }
                            },
                            {
                                label: "Close",
                                cssClass: "btn btn-secondary",
                                action: function (button, buttonData, originalEvent) {
                                    return this.hide();
                                }
                            }
                        ]
                    });
                    $(dialog.originalModal).addClass("bootstrap-modal-wrapper-fullscreen");
                    dialog.show();
                });
                $("#customTemplateForButtons").on("click", function (event) {
                    var lineOfText = "<p>Cras mattis consectetur purus sit amet fermentum. Cras justo odio, dapibus ac facilisis in, egestas eget quam. Morbi leo risus, porta ac consectetur ac, vestibulum at eros.</p>";
                    var longContent = "";
                    for (var i = 0; i < 2; i++) {
                        longContent += lineOfText;
                    }
                    var dialog = BootstrapModalWrapperFactory.createModal({
                        title: "Fullscreen Long Body Content",
                        message: longContent,
                        closable: false,
                        closeByBackdrop: true,
                        centered: true,
                        modalDialogScrollable: false,
                        buttons: [
                            {
                                template: "<a href='javascript:void(0)'></a>",
                                label: "Set Scrollable True",
                                cssClass: "btn btn-link",
                                action: function (button, buttonData, originalEvent) {
                                    return this.updateModalDialogScrollable(true);
                                }
                            },
                            {
                                template: "<a href='javascript:void(0)'></a>",
                                label: "Set Scrollable False",
                                cssClass: "btn btn-link",
                                action: function (button, buttonData, originalEvent) {
                                    return this.updateModalDialogScrollable(false);
                                }
                            },
                            {
                                template: "<a href='javascript:void(0)'></a>",
                                label: "Add More Content",
                                cssClass: "btn btn-link",
                                action: function (button, buttonData, originalEvent) {
                                    var currentBody = $(dialog.originalModal).find(".modal-body").html();
                                    for (var i = 0; i < 5; i++) {
                                        currentBody += lineOfText;
                                    }
                                    $(dialog.originalModal).find(".modal-body").html(currentBody);
                                }
                            },
                            {
                                template: "<a href='javascript:void(0)'></a>",
                                label: "Add Fullscreen",
                                cssClass: "btn btn-link",
                                action: function (button, buttonData, originalEvent) {
                                    $(dialog.originalModal).addClass("bootstrap-modal-wrapper-fullscreen");
                                }
                            },
                            {
                                template: "<a href='javascript:void(0)'></a>",
                                label: "Remove Fullscreen",
                                cssClass: "btn btn-link",
                                action: function (button, buttonData, originalEvent) {
                                    $(dialog.originalModal).removeClass("bootstrap-modal-wrapper-fullscreen");
                                }
                            },
                            {
                                template: "<a href='javascript:void(0)'></a>",
                                label: "Close",
                                cssClass: "btn btn-link text-danger bg-light",
                                action: function (button, buttonData, originalEvent) {
                                    return this.hide();
                                }
                            }
                        ]
                    });
                    dialog.show();
                });

                $("#DraggableBootstrapModal1").on("click", function (event) {
                    var dialog = BootstrapModalWrapperFactory.createModal({
                        title: "Draggable Bootstrap Modal",
                        message: "Draggable Bootstrap Modal Using <b>Jquery UI</b> Body Content",
                        closable: true,
                        closeByBackdrop: true,
//                        centered: true,
                        buttons: [
                            {
                                label: "Close",
                                cssClass: "btn btn-secondary",
                                action: function (button, buttonData, originalEvent) {
                                    return this.hide();
                                }
                            }
                        ]
                    });
                    $(dialog.originalModal).on('shown.bs.modal', function (e) {
                        var $this = $(this).find(".modal-content");
                        $this.draggable({
                            containment: [
                                0,
                                $(document).scrollTop(),
                                window.innerWidth - $this.outerWidth(),
                                $(document).scrollTop() + window.innerHeight - (($this.outerHeight(true) > window.innerHeight) ? 1 : $this.outerHeight(true) + 1)
                            ],
                            scroll: false,
                            cursor: "move",
                            handle: '.modal-header',
                            scrollSensitivity: 100,
                            scrollSpeed: 100,
                            start: function (event, ui) {
                            },
                            drag: function (event, ui) {
                                return true;
                            }
                        });
                    });
                    dialog.show();
                });
                $("#DraggableBootstrapModal2").on("click", function (event) {
                    var dialog = BootstrapModalWrapperFactory.createModal({
                        title: "Draggable Bootstrap Modal",
                        message: "Draggable Bootstrap Modal Using <b>Jquery</b> Body Content",
                        closable: true,
                        closeByBackdrop: true,
//                        centered: true,
                        buttons: [
                            {
                                label: "Close",
                                cssClass: "btn btn-secondary",
                                action: function (button, buttonData, originalEvent) {
                                    return this.hide();
                                }
                            }
                        ]
                    });
                    $(dialog.originalModal).on('shown.bs.modal', function (e) {
                        // https://stackoverflow.com/questions/2424191/how-do-i-make-an-element-draggable-in-jquery
                        // https://stackoverflow.com/questions/8569095/draggable-div-without-jquery-ui
                        // http://tovic.github.io/dte-project/jquery-draggable/index.html

                        var $this = $(this).find(".modal-content");
                        var handle = $this.find('.modal-header');
                        var containment = [
                            0,
                            $(document).scrollTop(),
                            window.innerWidth - $this.outerWidth(),
                            $(document).scrollTop() + window.innerHeight - (($this.outerHeight(true) > window.innerHeight) ? 1 : $this.outerHeight(true) + 1)
                        ];
                        function handle_mousedown(e) {
                            window.my_dragging = {};
                            my_dragging.pageX0 = e.pageX;
                            my_dragging.pageY0 = e.pageY;
                            my_dragging.elem = $this;
                            my_dragging.offset0 = $(my_dragging.elem).offset();
                            function handle_dragging(e) {

                                var left = my_dragging.offset0.left + (e.pageX - my_dragging.pageX0);
                                var top = my_dragging.offset0.top + (e.pageY - my_dragging.pageY0);
                                if ((left > 0 && left < (window.innerWidth - $this.outerWidth())) && (top > $(document).scrollTop() && (top < ($(document).scrollTop() + window.innerHeight - (($this.outerHeight(true) > window.innerHeight) ? 1 : $this.outerHeight(true) + 1))))) {
                                    $(my_dragging.elem)
                                            .offset({top: top, left: left});
                                }
                            }
                            function handle_mouseup(e) {
                                $('body')
                                        .off('mousemove', handle_dragging)
                                        .off('mouseup', handle_mouseup);
                            }
                            $('body')
                                    .on('mouseup', handle_mouseup)
                                    .on('mousemove', handle_dragging);
                        }
                        $(handle).mousedown(handle_mousedown);
                    });
                    dialog.show();
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