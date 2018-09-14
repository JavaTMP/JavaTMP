<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="dynamic-ajax-content">
    <div class="page-header">
        <h1>Bootstrap Date Range Picker</h1>
    </div>
    <div class="row">
        <div class="col-lg-12">
            <div class="alert alert-info">
                <p>Date range picker component for Bootstrap</p>
                <p>
                    <a target="_blank" class="btn btn-info" href="http://www.daterangepicker.com/">Demo Site</a>
                    <a target="_blank" class="btn btn-info" href="https://github.com/dangrossman/bootstrap-daterangepicker">github source code</a>
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
                            <div class="form-group">
                                <label class="">Default Date Range Picker</label>
                                <input id="default-drp" class="form-control" size="16" type="text" value="">
                            </div>
                            <div class="form-group">
                                <label class="">with range</label>
                                <input id="default-drp-with-options" class="form-control" size="16" type="text" value="">
                            </div>
                            <div class="form-group">
                                <label class="">Date and Time</label>
                                <input id="Date-and-Time" class="form-control" size="16" type="text" value="">
                            </div>
                            <div class="form-group">
                                <label class="">Single Date Picker</label>
                                <input id="single_date_picker" class="form-control" size="16" type="text" value="">
                            </div>
                            <div class="form-group">
                                <label class="">Predefined Ranges</label>
                                <div id="reportrange" class="float-right" style="color: black;background: #fff; cursor: pointer; padding: 5px 10px; border: 1px solid #ccc; width: 100%">
                                    <i class="glyphicon glyphicon-calendar fa fa-calendar"></i>&nbsp;&nbsp;
                                    <span></span>&nbsp;&nbsp;<b class="caret fa fa-angle-down"></b>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="card my-3">
                <div class="card-header">
                    Configuration Builder
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
                            <div class="well configurator">
                                <form>
                                    <div class="row">
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label for="parentEl">parentEl</label>
                                                <input type="text" class="form-control" id="parentEl" value="" placeholder="body">
                                            </div>
                                            <div class="form-group">
                                                <label for="startDate">startDate</label>
                                                <input type="text" class="form-control" id="startDate" value="07/01/2015">
                                            </div>
                                            <div class="form-group">
                                                <label for="endDate">endDate</label>
                                                <input type="text" class="form-control" id="endDate" value="07/15/2015">
                                            </div>
                                            <div class="form-group">
                                                <label for="minDate">minDate</label>
                                                <input type="text" class="form-control" id="minDate" value="" placeholder="MM/DD/YYYY">
                                            </div>
                                            <div class="form-group">
                                                <label for="maxDate">maxDate</label>
                                                <input type="text" class="form-control" id="maxDate" value="" placeholder="MM/DD/YYYY">
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="checkbox">
                                                <label>
                                                    <input type="checkbox" id="autoApply"> autoApply
                                                </label>
                                            </div>
                                            <div class="checkbox">
                                                <label>
                                                    <input type="checkbox" id="singleDatePicker"> singleDatePicker
                                                </label>
                                            </div>
                                            <div class="checkbox">
                                                <label>
                                                    <input type="checkbox" id="showDropdowns"> showDropdowns
                                                </label>
                                            </div>
                                            <div class="checkbox">
                                                <label>
                                                    <input type="checkbox" id="showWeekNumbers"> showWeekNumbers
                                                </label>
                                            </div>
                                            <div class="checkbox">
                                                <label>
                                                    <input type="checkbox" id="showISOWeekNumbers"> showISOWeekNumbers
                                                </label>
                                            </div>
                                            <div class="checkbox">
                                                <label>
                                                    <input type="checkbox" id="timePicker"> timePicker
                                                </label>
                                            </div>
                                            <div class="checkbox">
                                                <label>
                                                    <input type="checkbox" id="timePicker24Hour"> timePicker24Hour
                                                </label>
                                            </div>
                                            <div class="form-group">
                                                <label for="timePickerIncrement">timePickerIncrement (in minutes)</label>
                                                <input type="text" class="form-control" id="timePickerIncrement" value="1">
                                            </div>
                                            <div class="checkbox">
                                                <label>
                                                    <input type="checkbox" id="timePickerSeconds"> timePickerSeconds
                                                </label>
                                            </div>
                                            <div class="checkbox">
                                                <label>
                                                    <input type="checkbox" id="dateLimit"> dateLimit (with example date range span)
                                                </label>
                                            </div>
                                            <div class="checkbox">
                                                <label>
                                                    <input type="checkbox" id="ranges"> ranges (with example predefined ranges)
                                                </label>
                                            </div>
                                            <div class="checkbox">
                                                <label>
                                                    <input type="checkbox" id="locale"> locale (with example settings)
                                                </label>
                                                <label id="rtl-wrap">
                                                    <input type="checkbox" id="rtl"> RTL (right-to-left)
                                                </label>
                                            </div>
                                            <div class="checkbox">
                                                <label>
                                                    <input type="checkbox" id="alwaysShowCalendars"> alwaysShowCalendars
                                                </label>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="checkbox">
                                                <label>
                                                    <input type="checkbox" id="linkedCalendars" checked="checked"> linkedCalendars
                                                </label>
                                            </div>
                                            <div class="checkbox">
                                                <label>
                                                    <input type="checkbox" id="autoUpdateInput" checked="checked"> autoUpdateInput
                                                </label>
                                            </div>
                                            <div class="checkbox">
                                                <label>
                                                    <input type="checkbox" id="showCustomRangeLabel" checked="checked"> showCustomRangeLabel
                                                </label>
                                            </div>
                                            <div class="form-group">
                                                <label for="opens">opens</label>
                                                <select id="opens" class="form-control">
                                                    <option value="right" selected>right</option>
                                                    <option value="left">left</option>
                                                    <option value="center">center</option>
                                                </select>
                                            </div>
                                            <div class="form-group">
                                                <label for="drops">drops</label>
                                                <select id="drops" class="form-control">
                                                    <option value="down" selected>down</option>
                                                    <option value="up">up</option>
                                                </select>
                                            </div>
                                            <div class="form-group">
                                                <label for="buttonClasses">buttonClasses</label>
                                                <input type="text" class="form-control" id="buttonClasses" value="btn btn-sm">
                                            </div>
                                            <div class="form-group">
                                                <label for="applyClass">applyClass</label>
                                                <input type="text" class="form-control" id="applyClass" value="btn-success">
                                            </div>
                                            <div class="form-group">
                                                <label for="cancelClass">cancelClass</label>
                                                <input type="text" class="form-control" id="cancelClass" value="btn-default">
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </div>
                            <div class="row">
                                <div class="col-md-4 col-md-offset-2 demo">
                                    <label>Your Date Range Picker</label>
                                    <div class="input-group">
                                        <input type="text" id="config-demo" class="form-control">
                                        <i class="glyphicon glyphicon-calendar fa fa-calendar"></i>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <h4>Configuration</h4>

                                    <div class="well">
                                        <textarea id="config-text" style="height: 300px; width: 100%; padding: 10px"></textarea>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <style type="text/css">
        .demo { position: relative; }
        .demo i {
            position: absolute;
            bottom: 10px;
            right: 10px;
            top: auto;
            cursor: pointer;
            z-index: 3;
        }
        [dir=rtl] .demo i {
            left: 10px;
        }
    </style>
    <script type="text/javascript">
        jQuery(function ($) {
            // any code put here will be run after content attach to ajax output container and before
            // controll return to main javascript file.

            // fire AFTER all transition done and your ajax content is shown to user.
            $(javatmp.settings.defaultOutputSelector).on(javatmp.settings.javaTmpAjaxContainerReady, function (event) {
                $('#default-drp').daterangepicker({"opens": "right",
                    locale: {
                        "direction": javatmp.settings.direction,
                        format: 'YYYY-MM-DD'
                    }});
                $('#default-drp-with-options').daterangepicker({
                    "opens": javatmp.settings.floatDefault,
                    locale: {
                        "direction": javatmp.settings.direction,
                        format: 'YYYY-MM-DD'
                    },
                    startDate: '2017-01-01',
                    endDate: '2017-01-31'
                }, function (start, end, label) {
                    alert("A new date range was chosen: " + start.format('YYYY-MM-DD') + ' to ' + end.format('YYYY-MM-DD'));
                });
                $('#Date-and-Time').daterangepicker({
                    timePicker: true,
                    timePickerIncrement: 30,
                    "opens": javatmp.settings.floatDefault,
                    locale: {
                        "direction": javatmp.settings.direction,
                        format: 'MM/DD/YYYY h:mm A'
                    }

                });
                $('#single_date_picker').daterangepicker({
                    "opens": javatmp.settings.floatDefault,
                    singleDatePicker: true,
                    showDropdowns: true,
                    locale: {
                        "direction": javatmp.settings.direction,
                        format: 'MM/DD/YYYY h:mm A'
                    }
                });

                var start = moment().subtract(29, 'days');
                var end = moment();

                function cb(start, end) {
                    $('#reportrange span').html(start.format('MMMM D, YYYY') + ' - ' + end.format('MMMM D, YYYY'));
                }

                $('#reportrange').daterangepicker({
                    "opens": javatmp.settings.floatReverse,
                    startDate: start,
                    endDate: end,
                    locale: {
                        "direction": javatmp.settings.direction,
                        format: 'MM/DD/YYYY h:mm A'
                    },
                    ranges: {
                        'Today': [moment(), moment()],
                        'Yesterday': [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
                        'Last 7 Days': [moment().subtract(6, 'days'), moment()],
                        'Last 30 Days': [moment().subtract(29, 'days'), moment()],
                        'This Month': [moment().startOf('month'), moment().endOf('month')],
                        'Last Month': [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')]
                    }
                }, cb);
                cb(start, end);
            });

            // fire when user resize browser window or sidebar hide / show
            $(javatmp.settings.defaultOutputSelector).on(javatmp.settings.javaTmpContainerResizeEventName, function (event) {

            });
            $(javatmp.settings.defaultOutputSelector).on(javatmp.settings.cardFullscreenCompress, function (event, card) {
                // when card compress by pressing the top right tool button

            });
            $(javatmp.settings.defaultOutputSelector).on(javatmp.settings.cardFullscreenExpand, function (event, card) {
                // when card Expand by pressing the top right tool button
            });
            // When another menu item pressed and before container replaced with new ajax content.
            $(javatmp.settings.defaultOutputSelector).on(javatmp.settings.javaTmpContainerRemoveEventName, function (event) {
                $(javatmp.settings.defaultOutputSelector).off(javatmp.settings.cardFullscreenCompress);
                $(javatmp.settings.defaultOutputSelector).off(javatmp.settings.cardFullscreenExpand);
                return true;
            });
        });
    </script>
    <script type="text/javascript">
        jQuery(document).ready(function () {
            (function ($) {
                $('#config-text').keyup(function () {
                    eval($(this).val());
                });

                $('.configurator input, .configurator select').change(function () {
                    updateConfig();
                });

                $('.demo i').click(function () {
                    $(this).parent().find('input').click();
                });

                $('#startDate').daterangepicker({
                    singleDatePicker: true,
                    startDate: moment().subtract(6, 'days')
                });

                $('#endDate').daterangepicker({
                    singleDatePicker: true,
                    startDate: moment()
                });

                updateConfig();

                function updateConfig() {
                    var options = {};

                    if ($('#singleDatePicker').is(':checked'))
                        options.singleDatePicker = true;

                    if ($('#showDropdowns').is(':checked'))
                        options.showDropdowns = true;

                    if ($('#showWeekNumbers').is(':checked'))
                        options.showWeekNumbers = true;

                    if ($('#showISOWeekNumbers').is(':checked'))
                        options.showISOWeekNumbers = true;

                    if ($('#timePicker').is(':checked'))
                        options.timePicker = true;

                    if ($('#timePicker24Hour').is(':checked'))
                        options.timePicker24Hour = true;

                    if ($('#timePickerIncrement').val().length && $('#timePickerIncrement').val() !== 1)
                        options.timePickerIncrement = parseInt($('#timePickerIncrement').val(), 10);

                    if ($('#timePickerSeconds').is(':checked'))
                        options.timePickerSeconds = true;

                    if ($('#autoApply').is(':checked'))
                        options.autoApply = true;

                    if ($('#dateLimit').is(':checked'))
                        options.dateLimit = {days: 7};

                    if ($('#ranges').is(':checked')) {
                        options.ranges = {
                            'Today': [moment(), moment()],
                            'Yesterday': [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
                            'Last 7 Days': [moment().subtract(6, 'days'), moment()],
                            'Last 30 Days': [moment().subtract(29, 'days'), moment()],
                            'This Month': [moment().startOf('month'), moment().endOf('month')],
                            'Last Month': [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')]
                        };
                    }

                    if ($('#locale').is(':checked')) {
                        $('#rtl-wrap').show();
                        options.locale = {
                            direction: $('#rtl').is(':checked') ? 'rtl' : 'ltr',
                            format: 'MM/DD/YYYY HH:mm',
                            separator: ' - ',
                            applyLabel: 'Apply',
                            cancelLabel: 'Cancel',
                            fromLabel: 'From',
                            toLabel: 'To',
                            customRangeLabel: 'Custom',
                            daysOfWeek: ['Su', 'Mo', 'Tu', 'We', 'Th', 'Fr', 'Sa'],
                            monthNames: ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'],
                            firstDay: 1
                        };
                    } else {
                        $('#rtl-wrap').hide();
                    }

                    if (!$('#linkedCalendars').is(':checked'))
                        options.linkedCalendars = false;

                    if (!$('#autoUpdateInput').is(':checked'))
                        options.autoUpdateInput = false;

                    if (!$('#showCustomRangeLabel').is(':checked'))
                        options.showCustomRangeLabel = false;

                    if ($('#alwaysShowCalendars').is(':checked'))
                        options.alwaysShowCalendars = true;

                    if ($('#parentEl').val().length)
                        options.parentEl = $('#parentEl').val();

                    if ($('#startDate').val().length)
                        options.startDate = $('#startDate').val();

                    if ($('#endDate').val().length)
                        options.endDate = $('#endDate').val();

                    if ($('#minDate').val().length)
                        options.minDate = $('#minDate').val();

                    if ($('#maxDate').val().length)
                        options.maxDate = $('#maxDate').val();

                    if ($('#opens').val().length && $('#opens').val() != 'right')
                        options.opens = $('#opens').val();

                    if ($('#drops').val().length && $('#drops').val() != 'down')
                        options.drops = $('#drops').val();

                    if ($('#buttonClasses').val().length && $('#buttonClasses').val() != 'btn btn-sm')
                        options.buttonClasses = $('#buttonClasses').val();

                    if ($('#applyClass').val().length && $('#applyClass').val() != 'btn-success')
                        options.applyClass = $('#applyClass').val();

                    if ($('#cancelClass').val().length && $('#cancelClass').val() != 'btn-default')
                        options.cancelClass = $('#cancelClass').val();

                    $('#config-text').val("$('#demo').daterangepicker(" + JSON.stringify(options, null, '    ') + ", function(start, end, label) {\n  console.log(\"New date range selected: ' + start.format('YYYY-MM-DD') + ' to ' + end.format('YYYY-MM-DD') + ' (predefined range: ' + label + ')\");\n});");

                    $('#config-demo').daterangepicker(options, function (start, end, label) {
                        console.log('New date range selected: ' + start.format('YYYY-MM-DD') + ' to ' + end.format('YYYY-MM-DD') + ' (predefined range: ' + label + ')');
                    });

                }
            }(jQuery));
        });
    </script>
</div>