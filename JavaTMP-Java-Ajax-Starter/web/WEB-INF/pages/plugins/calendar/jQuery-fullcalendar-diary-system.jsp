<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="dynamic-ajax-content">
    <div class="page-header">
        <h1>Web diary system Using jQuery FullCalendar plugin</h1>
    </div>
    <div class="row">
        <div class="col">
            <div class="card">
                <div class="card-header">
                    <nav class="nav d-inline">
                        <a id="populateFakeDatabase" class="d-inline nav-link" href="javascript:void(0);">Populate Fake Database</a>
                    </nav>
                    <div class="options float-right">
                        <a href="#" class="settings"><i class="fa fa-cog"></i></a>
                        <a href="#" class="collapse"><i class="fa fa-chevron-up"></i></a>
                        <a href="#" class="reload"><i class="fa fa-sync"></i></a>
                        <a href="#" class="fullscreen"><i class=" fa fa-expand"></i></a>
                        <a href="#" class="remove"><i class="fa fa-times"></i></a>
                    </div>
                </div>
                <div class="card-body">
                    <div id="web-diary-calendar"></div>
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
                $('#web-diary-calendar').fullCalendar({
                    header: {
                        left: 'prev,next today',
                        center: 'title',
                        right: 'month,agendaWeek,agendaDay'
                    },
                    defaultView: 'month',
                    editable: true,
                    allDaySlot: false,
                    selectable: true,
                    slotDuration: '00:15:00',
                    slotLabelInterval: "01:00",
                    events: javatmp.settings.contextPath + '/calendar/getDiaryEvents'
                });
                $('#populateFakeDatabase').click(function () {
                    $.ajax({
                        type: 'POST',
                        url: javatmp.settings.contextPath + "/calendar/populateFakeDatabase",
                        success: function (response) {
                            var modalWrapper = BootstrapModalWrapperFactory.createModal({
                                message: response.message,
                                title: "Remote Response",
                                closable: false,
                                closeByBackdrop: false,
                                buttons: [
                                    {
                                        label: "Return And Refresh",
                                        cssClass: "btn btn-success",
                                        action: function (modalWrapper, button, buttonData, originalEvent) {
                                            javatmp.waitForFinalEvent(function () {
                                                $('#web-diary-calendar').fullCalendar('refetchEvents');
                                            }, 100, "");
                                            modalWrapper.hide();

                                        }
                                    }
                                ]
                            });
                            modalWrapper.show();
                        }
                    });
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