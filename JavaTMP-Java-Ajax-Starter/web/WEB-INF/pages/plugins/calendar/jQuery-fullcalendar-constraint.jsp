<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="dynamic-ajax-content">
    <div class="page-header">
        <h1>jQuery FullCalendar Constraint</h1>
    </div>
    <div class="row">
        <div class="col-lg-12">
            <div class="alert alert-info">
                <p>Full-sized drag & drop event calendar (jQuery plugin)</p>
                <p>
                    <a class="btn btn-info" target="_blank" href="https://fullcalendar.io/"><i class="fa fa-external-link-alt-alt fa-fw"></i>Demo Page</a>
                    <a class="btn btn-info" target="_blank" href="https://github.com/fullcalendar/fullcalendar"><i class="fa fa-external-link-alt-alt fa-fw"></i>github.com Page</a>
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

        $('#calendar').fullCalendar({
            header: {
                left: 'prev,next today',
                center: 'title',
                right: 'month,agendaWeek,agendaDay,listMonth'
            },
            buttonText: {
                listMonth: 'Month List'
            },
            defaultDate: '2018-02-12',
            navLinks: true, // can click day/week names to navigate views
            businessHours: true, // display business hours
            editable: true,
            events: [
                {
                    title: 'Business Lunch',
                    start: '2018-02-03T13:00:00',
                    constraint: 'businessHours'
                },
                {
                    title: 'Meeting',
                    start: '2018-02-13T11:00:00',
                    constraint: 'availableForMeeting', // defined below
                    color: '#257e4a'
                },
                {
                    title: 'Conference',
                    start: '2018-02-18',
                    end: '2018-02-20'
                },
                {
                    title: 'Party',
                    start: '2018-02-29T20:00:00'
                },

                // areas where "Meeting" must be dropped
                {
                    id: 'availableForMeeting',
                    start: '2018-02-11T10:00:00',
                    end: '2018-02-11T16:00:00',
                    rendering: 'background'
                },
                {
                    id: 'availableForMeeting',
                    start: '2018-02-13T10:00:00',
                    end: '2018-02-13T16:00:00',
                    rendering: 'background'
                },

                // red areas where no events can be dropped
                {
                    start: '2018-02-24',
                    end: '2018-02-28',
                    overlap: false,
                    rendering: 'background',
                    color: '#ff9f89'
                },
                {
                    start: '2018-02-06',
                    end: '2018-02-08',
                    overlap: false,
                    rendering: 'background',
                    color: '#ff9f89'
                }
            ]
        });

        jQuery(function ($) {
            // any code put here will be run after content attach to ajax output container and before
            // controll return to main javascript file.
            // <--- HERE --->
            //

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