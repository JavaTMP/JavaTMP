<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="dynamic-ajax-content grid-gutter-padding">
    <h4 class="my-3">
        Event Calendar
    </h4>
    <hr/>
    <div class="row">
        <div class="col">
            <div class="card">
                <div class="card-header d-flex align-items-center justify-content-between py-1 px-3">
                    <ul class="nav">
                        <li class="nav-item">
                            <a id="populateFakeDatabase" class="nav-link" href="javascript:void(0);"><i class="fas fa-history fa-fw fa-lg"></i>Populate Fake Database</a>
                        </li>
                        <li class="nav-item">
                            <a id="addNewEvent" class="nav-link" href="javascript:void(0);"><i class="far fa-edit fa-fw fa-lg"></i>Add New Event</a>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="dropdown-toggle nav-link" href="javascript:void(0);" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="far fa-list-alt fa-fw fa-lg"></i>Change View
                            </a>
                            <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                <a newCalendarView="listDay" class="dropdown-item changeCalendarViewMenuItem" href="javascript:void(0);">Day List View</a>
                                <a newCalendarView="listWeek" class="dropdown-item changeCalendarViewMenuItem" href="javascript:void(0);">Week List View</a>
                                <a newCalendarView="listMonth" class="dropdown-item changeCalendarViewMenuItem" href="javascript:void(0);">Month List View</a>
                                <a newCalendarView="listYear" class="dropdown-item changeCalendarViewMenuItem" href="javascript:void(0);">Year List View</a>
                            </div>
                        </li>
                    </ul>
                    <div class="options">
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
                var targetHeader = {
                    left: 'prev,next today',
                    center: 'title',
                    right: 'month,agendaWeek,agendaDay'
                };
                if (javatmp.settings.isRTL) {
                    targetHeader = $.extend(targetHeader, {
                        right: targetHeader.left,
                        left: targetHeader.right
                    });
                }
                $('#web-diary-calendar').fullCalendar({
                    isRTL: javatmp.settings.isRTL,
                    locale: javatmp.user.lang,
                    header: targetHeader,
                    defaultView: 'month',
                    navLinks: true,
                    editable: true,
                    allDaySlot: false,
                    selectable: true,
                    eventLimit: true,
                    slotDuration: '00:15:00',
                    slotLabelInterval: "01:00",
                    timezone: 'UTC',
//                    timezone: 'local',
                    events: function (start, end, timezone, callback) {
                        $.ajax({
                            cache: false,
                            url: javatmp.settings.contextPath + '/calendar/getDiaryEvents',
                            dataType: 'json',
                            data: {
                                start: start.unix(),
                                end: end.unix(),
                                timezone: timezone
                            },
                            success: function (message) {
                                var events = [];
                                if (!!message.data) {
                                    $.map(message.data, function (r) {
                                        events.push({
                                            id: r.id,
                                            title: r.title,
                                            start: r.startDate,
                                            end: r.endDate
                                        });
                                    });
                                }
                                callback(events);
                            }
                        });
                    },
                    eventClick: function (calEvent, jsEvent, view) {
                        manageEvent(calEvent.id);
                    },
                    eventDrop: function (event, dayDelta, minuteDelta, allDay, revertFunc) {
                        if (confirm("Confirm move?")) {
                            updateEvent(event);
                        } else {
                            revertFunc();
                        }
                    },
                    eventResize: function (event, dayDelta, minuteDelta, revertFunc) {
                        if (confirm("Confirm change appointment length?")) {
                            updateEvent(event);
                        } else {
                            revertFunc();
                        }
                    },
                    dayClick: function (date, allDay, jsEvent, view) {
                        addNewEvent(date);
                    }
//                    ,
//                    eventRender: function (event, element, view) {
//                        $(element).addClass("bg-danger text-white");
//                    }
                });
                $(".changeCalendarViewMenuItem").on("click", function () {
                    var targetView = $(this).attr("newCalendarView");
                    $('#web-diary-calendar').fullCalendar('changeView', targetView);
                });
                function manageEvent(eventId) {
                    var passData = {};
                    passData.callback = "fullcalendarCallback";
                    passData.id = eventId;
                    BootstrapModalWrapperFactory.createAjaxModal({
                        message: '<div class="text-center"><i class="fa fa-sync fa-spin fa-3x fa-fw text-primary"></i></div>',
                        closable: false,
                        //                        title: "AJAX Content",
                        size: "modal-lg",
                        closeByBackdrop: false,
                        passData: passData,
                        url: javatmp.settings.contextPath + "/calendar/ManageEventController",
                        ajaxContainerReadyEventName: javatmp.settings.javaTmpAjaxContainerReady
                    });
                }
                function addNewEvent(date) {
                    var passData = {};
                    passData.callback = "fullcalendarCallback";
                    //                    passData.callback = "testing.refreshFullcalendarEventsWindow";

                    if (date) {
                        passData.date = moment(date).format();
                    }
                    BootstrapModalWrapperFactory.createAjaxModal({
                        message: '<div class="text-center"><i class="fa fa-sync fa-spin fa-3x fa-fw text-primary"></i></div>',
                        closable: false,
                        //                        title: "AJAX Content",
                        closeByBackdrop: false,
                        passData: passData,
                        url: javatmp.settings.contextPath + "/pages/event/ajax/add-new-event",
                        ajaxContainerReadyEventName: javatmp.settings.javaTmpAjaxContainerReady
                    });
                }
                window.fullcalendarCallback = function (callbackData) {
                    //                    alert(JSON.stringify(callbackData));
                    if (callbackData.cancel === true) {
                    } else {
                        BootstrapModalWrapperFactory.createModal({
                            message: "You have updated the event. Press Refresh to Refetch Events for FullCalendar OR Cancel to keep old events",
                            title: "Alert",
                            closable: false,
                            closeByBackdrop: false,
                            buttons: [
                                {
                                    label: "Cancel",
                                    cssClass: "btn btn-secondary",
                                    action: function (modalWrapper, button, buttonData, originalEvent) {
                                        return modalWrapper.hide();
                                    }
                                },
                                {
                                    label: "Refresh",
                                    cssClass: "btn btn-primary",
                                    action: function (modalWrapper, button, buttonData, originalEvent) {
                                        $('#web-diary-calendar').fullCalendar('refetchEvents');
                                        return modalWrapper.hide();
                                    }
                                }
                            ]
                        }).show();
                    }
                };
                function updateEvent(event) {
                    var dataRow = {
                        'id': event.id,
                        'title': event.title,
                        'start': event.start,
                        'end': event.end
                    };
                    $.ajax({
                        type: 'POST',
                        url: javatmp.settings.contextPath + "/calendar/updateEvent",
                        dataType: "json",
                        contentType: "application/json; charset=UTF-8",
                        data: JSON.stringify(dataRow),
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
                                            javatmp.util.waitForFinalEvent(function () {
                                                $('#web-diary-calendar').fullCalendar('refetchEvents');
                                            }, 100, "fullCalendar-update-event");
                                            modalWrapper.hide();
                                        }
                                    }
                                ]
                            });
                            modalWrapper.show();
                        }
                    });
                }

                $('#addNewEvent').click(function () {
                    addNewEvent();
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
                                            javatmp.util.waitForFinalEvent(function () {
                                                $('#web-diary-calendar').fullCalendar('refetchEvents');
                                            }, 100, "fullCalendar-populateFakeDatabase");
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
        }
        );
    </script>
</div>