<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="dynamic-ajax-content">
    <div class="page-header">
        <h1>Dynamic Cards Content</h1>
    </div>
    <div class="row">
        <div class="col-lg-12">
            <div class="card card-primary" style="">
                <div class="card-header">
                    Dynamic Panel Content Examples
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
                        <div class="col-lg-6 card-container-col">
                            <div class="card card-default mb-3">
                                <div class="card-header">
                                    Simple Text Content
                                    <div class="options float-right">
                                        <a href="#" class="settings"><i class="fa fa-cog"></i></a>
                                        <a href="#" class="collapse"><i class="fa fa-chevron-up"></i></a>
                                        <a href="${pageContext.request.contextPath}/card/AjaxTextContentCardController" class="reload"><i class="fa fa-sync"></i></a>
                                        <a href="#" class="fullscreen"><i class=" fa fa-expand"></i></a>
                                        <a href="#" class="remove"><i class="fa fa-times"></i></a>
                                    </div>
                                </div>
                                <div class="card-body">
                                    <p>Press reload button above to fetch content</p>
                                </div>
                            </div>
                            <div class="card card-primary mb-3">
                                <div class="card-header">
                                    JSP Content
                                    <div class="options float-right">
                                        <a href="#" class="settings"><i class="fa fa-cog"></i></a>
                                        <a href="#" class="collapse"><i class="fa fa-chevron-up"></i></a>
                                        <a href="${pageContext.request.contextPath}/card/ajaxJSPContentCardController" class="reload"><i class="fa fa-sync"></i></a>
                                        <a href="#" class="fullscreen"><i class=" fa fa-expand"></i></a>
                                        <a href="#" class="remove"><i class="fa fa-times"></i></a>
                                    </div>
                                </div>
                                <div class="card-body">
                                    <p>Press reload button above to fetch content</p>
                                </div>
                            </div>
                            <div class="card card-danger mb-3">
                                <div class="card-header">
                                    Fetch Error Content on startup
                                    <div class="options float-right">
                                        <a class="settings"><i class="fa fa-cog"></i></a>
                                        <a href="#" class="collapse"><i class="fa fa-chevron-up"></i></a>
                                        <a load-on-starup="true" href="${pageContext.request.contextPath}/not-exist-url" class="reload"><i class="fa fa-sync"></i></a>
                                        <a href="#" class="fullscreen"><i class=" fa fa-expand"></i></a>
                                        <a href="#" class="remove"><i class="fa fa-times"></i></a>
                                    </div>
                                </div>
                                <div class="card-body">
                                    <p>Press reload button above to fetch content</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6 card-container-col">
                            <div class="card card-success mb-3">
                                <div class="card-header">
                                    Sleep For 5 Seconds
                                    <div class="options float-right">
                                        <a href="#" class="settings"><i class="fa fa-cog"></i></a>
                                        <a href="#" class="collapse"><i class="fa fa-chevron-up"></i></a>
                                        <a href="${pageContext.request.contextPath}/util/AjaxSleeperController?sleep=5" class="reload"><i class="fa fa-sync"></i></a>
                                        <a href="#" class="fullscreen"><i class=" fa fa-expand"></i></a>
                                        <a href="#" class="remove"><i class="fa fa-times"></i></a>
                                    </div>
                                </div>
                                <div class="card-body">
                                    <p>Press reload button above to fetch content</p>
                                </div>
                            </div>
                            <div class="card card-danger mb-3">
                                <div class="card-header">
                                    Error Content
                                    <div class="options float-right">
                                        <a class="settings"><i class="fa fa-cog"></i></a>
                                        <a href="#" class="collapse"><i class="fa fa-chevron-up"></i></a>
                                        <a href="${pageContext.request.contextPath}/not-exist-url" class="reload"><i class="fa fa-sync"></i></a>
                                        <a href="#" class="fullscreen"><i class=" fa fa-expand"></i></a>
                                        <a href="#" class="remove"><i class="fa fa-times"></i></a>
                                    </div>
                                </div>
                                <div class="card-body">
                                    <p>Press reload button above to fetch content</p>
                                </div>
                            </div>
                            <div class="card card-primary mb-3">
                                <div class="card-header">
                                    Fetch JSP Content on startup
                                    <div class="options float-right">
                                        <a href="#" class="settings"><i class="fa fa-cog"></i></a>
                                        <a href="#" class="collapse"><i class="fa fa-chevron-up"></i></a>
                                        <a load-on-starup="true" href="${pageContext.request.contextPath}/card/ajaxJSPContentCardController" class="reload"><i class="fa fa-sync"></i></a>
                                        <a href="#" class="fullscreen"><i class=" fa fa-expand"></i></a>
                                        <a href="#" class="remove"><i class="fa fa-times"></i></a>
                                    </div>
                                </div>
                                <div class="card-body">
                                    <p>Press reload button above to fetch content</p>
                                </div>
                            </div>
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
        .card-container-col {
            min-height: 50px;
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
                $(javatmp.settings.defaultOutputSelector).find(".card-container-col").sortable({
                    connectWith: ".card-container-col",
                    items: '> .card',
                    handle: ".card-header",
                    cancel: ".options",
                    placeholder: "card-placeholder",
                    opacity: 0.9,
                    revert: true,
                    forceHelperSize: true,
                    forcePlaceholderSize: true,
                    tolerance: 'pointer',
                    start: function (e, ui) {
                        ui.placeholder.width(ui.item.width());
                        ui.placeholder.height(ui.item.height());
                        ui.placeholder.addClass(ui.item.attr("class"));
                    }
                });

                $(javatmp.settings.defaultOutputSelector).on('click', '.card > .card-header > .options > a.reload', function (e) {
                    e.preventDefault();
                    var cardBody = $(this).closest(".card").children(".card-body");
                    var href = $(this).attr("href");

                    $(cardBody).block({message: null,
                        overlayCSS: {
                            backgroundColor: '#000',
                            opacity: 0.4
                        }});


                    $.ajax({
                        type: "GET",
                        cache: false,
                        url: href,
                        data: {_ajaxGlobalBlockUI: false, _handleAjaxErrorGlobally: false},
                        dataType: "html",
                        success: function (remoteContent) {
                            toastr.success('Data successfully fetched from Server', 'SUCCESS', {
                                timeOut: 4000,
                                progressBar: true,
                                rtl: javatmp.settings.isRTL,
                                positionClass: javatmp.settings.isRTL === true ? "toast-top-left" : "toast-top-right"
                            });
                            cardBody.html(remoteContent);
                            $(cardBody).unblock();
                        },
                        error: function (xhr, ajaxOptions, thrownError) {
                            $(cardBody).unblock();
                            var msg = 'Error on reloading the card. Please check your remote server url.';
                            toastr.error(msg, xhr.statusText + " : " + xhr.status, {
                                timeOut: 4000,
                                progressBar: true,
                                rtl: javatmp.settings.isRTL,
                                positionClass: javatmp.settings.isRTL === true ? "toast-top-left" : "toast-top-right"
                            });
                            cardBody.html("<div class='text-danger'>" + msg + "</div>");
                        },
                        statusCode: {
                            401: function (jqXHR, textStatus, errorThrown) {
                                javatmp.settings.handle401Error(jqXHR, textStatus, errorThrown);
                            }
                        }
                    });
                });
                $(javatmp.settings.defaultOutputSelector).find("[load-on-starup=true]").each(function () {
                    $(this).trigger("click");
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
                $(javatmp.settings.defaultOutputSelector).off('click', '.card > .card-header > .options > a.reload');
                $(javatmp.settings.defaultOutputSelector).find(".card-container-col").sortable('destroy');
                $(javatmp.settings.defaultOutputSelector).off();
                return true;
            });
        });
    </script>
</div>