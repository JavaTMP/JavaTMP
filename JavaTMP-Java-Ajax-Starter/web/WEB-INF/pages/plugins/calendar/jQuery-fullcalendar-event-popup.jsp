<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="dynamic-ajax-content">
    <div class="page-header">
        <h1>jQuery FullCalendar</h1>
    </div>
    <div class="row">
        <div class="col-lg-12">
            <div class="alert alert-info">
                <p>Full-sized drag & drop event calendar (jQuery plugin)</p>
                <p>
                    <a class="btn btn-info" target="_blank" href="https://fullcalendar.io/"><i class="fa fa-external-link-alt fa-fw"></i>Demo Page</a>
                    <a class="btn btn-info" target="_blank" href="https://github.com/fullcalendar/fullcalendar"><i class="fa fa-external-link-alt fa-fw"></i>github.com Page</a>
                    <a class="btn btn-info" target="_blank" href="https://fullcalendar.io/docs/localization"><i class="fa fa-external-link-alt fa-fw"></i>FullCalendar Localization</a>
                </p>
            </div>
            <div class="card my-3">
                <div class="card-header">
                    Examples
                    <div class="options float-right">
                        <a class="settings"><i class="fa fa-cog"></i></a>
                        <a href="#" class="collapse"><i class="fa fa-chevron-up"></i></a>
                        <a href="#" class="reload"><i class="fa fa-sync"></i></a>
                        <a href="#" class="fullscreen"><i class=" fa fa-expand"></i></a>
                        <a href="#" class="remove"><i class="fa fa-times"></i></a>
                    </div>
                </div>
                <div class="card-body">
                    <div class="row">
                        <div class="col-lg-12">
                            <div id="calendar"/>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <style type="text/css">

    </style>
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


            var date = new Date();
            var d = date.getDate();
            var m = date.getMonth();
            var y = date.getFullYear();

            var calendar = $('#calendar').fullCalendar({
                header: {
                    left: 'prev,next today',
                    center: 'title',
                    right: 'month,agendaWeek,agendaDay,listDay,listWeek'
                },
                selectable: true,
                eventLimit: true, // allow "more" link when too many events
                selectHelper: true,
                eventClick: function (calEvent, jsEvent, view) {
                    $(this).popover('hide');
                    var modalTempalte =
                            'Event: ' + calEvent.title + "<br/>" +
                            'Coordinates: ' + jsEvent.pageX + ',' + jsEvent.pageY + "<br/>" +
                            'View: ' + view.name;
                    BootstrapModalWrapperFactory.showMessage(modalTempalte);

                },
                eventRender: function (event, element) {
                    var endDate = (typeof event.end === "undefined") || (event.end === null) ? event.start : event.end;
                    element.popover({
                        animation: true,
                        delay: 300,
                        html: true,
                        content: '<b>Start: </b>:' + moment(event.start).format('DD/MM/YYYY') + "<br/><b>Finish: </b>:" + moment(endDate).format('DD/MM/YYYY'),
                        trigger: 'hover'
                    });
                },
                select: function (start, end, allDay) {
                    var title = prompt('Event Title:');
                    if (title) {
                        calendar.fullCalendar('renderEvent',
                                {
                                    title: title,
                                    start: start,
                                    end: end,
                                    allDay: allDay
                                },
                                true // make the event "stick"
                                );
                    }
                    calendar.fullCalendar('unselect');
                },
                editable: true,
                events: [
                    {
                        title: 'All Day Event',
                        start: new Date(y, m, 1)
                    },
                    {
                        title: 'Long Event',
                        start: new Date(y, m, 1),
                        end: new Date(y, m, 5)
                    },
                    {
                        title: 'Repeating Event',
                        start: new Date(y, m, 3, 16, 0),
                        allDay: false
                    },
                    {
                        title: 'Repeating Event',
                        start: new Date(y, m, 2, 16, 0),
                        allDay: false
                    },
                    {
                        title: 'Meeting',
                        start: new Date(y, m, 5, 10, 30),
                        allDay: false
                    },
                    {
                        title: 'Long Event',
                        start: new Date(y, m, d - 5),
                        end: new Date(y, m, d - 2)
                    },
                    {
                        id: 999,
                        title: 'Repeating Event',
                        start: new Date(y, m, d - 3, 16, 0),
                        allDay: false
                    },
                    {
                        id: 999,
                        title: 'Repeating Event',
                        start: new Date(y, m, d + 4, 16, 0),
                        allDay: false
                    },
                    {
                        title: 'Meeting',
                        start: new Date(y, m, d, 10, 30),
                        allDay: false
                    },
                    {
                        title: 'Lunch',
                        start: new Date(y, m, d, 12, 0),
                        end: new Date(y, m, d, 14, 0),
                        allDay: false
                    },
                    {
                        title: 'Birthday Party',
                        start: new Date(y, m, d + 1, 19, 0),
                        end: new Date(y, m, d + 1, 22, 30),
                        allDay: false
                    },
                    {
                        title: 'Click for Google',
                        start: new Date(y, m, 28),
                        end: new Date(y, m, 29),
                        url: 'https://google.com/'
                    }
                ]
            });

            $(javatmp.settings.defaultOutputSelector).on(javatmp.settings.javaTmpAjaxContainerReady, function (event) {
                // fire AFTER all transition done and your ajax content is shown to user.
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