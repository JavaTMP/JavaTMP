<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="dynamic-ajax-content">
    <div class="page-header">
        <h1>Ion Range Slider</h1>
    </div>
    <div class="row">
        <div class="col-lg-12">
            <div class="alert alert-info">
                <p>Ion.RangeSlider. Is an easy, flexible and responsive range slider with tons of options.</p>
                <br/>
                <p>
                    <a class="btn btn-info" target="_blank" href="http://ionden.com/a/plugins/ion.rangeSlider/en.html"><i class="fa fa-external-link-alt fa-fw"></i>Demo Page</a>
                    <a class="btn btn-info" target="_blank" href="https://github.com/IonDen/ion.rangeSlider"><i class="fa fa-external-link-alt fa-fw"></i>github.com Page</a>
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
                            <form role="form">
                                <div class="form-group single-ionRangeSlider">
                                    <label>Basic With Set min, max and start value Options:</label>
                                    <input id="Basic-With-Default-Options" type="text" class="form-control" name="example_name" value="" />
                                    <p class="help-block">Start with <small>min, max, from</small>.</p>
                                </div>
                                <div class="form-group single-ionRangeSlider">
                                    <label>Basic With Set min, max and start value and grid Options:</label>
                                    <input id="Basic-With-Default-Options-grid" type="text" class="form-control" name="example_name" value="" />
                                    <p class="help-block">Start with <small>min, max, from</small>.</p>
                                </div>
                                <div class="form-group single-ionRangeSlider">
                                    <label>Set min, max, and start values</label>
                                    <input id="Range-Slider-Id" type="text" class="form-control" name="example_name" value="" />
                                    <p class="help-block">Set min value, max value and start point.</p>
                                </div>
                                <div class="form-group">
                                    <label>Range with values</label>
                                    <input id="advance-1" type="text" class="form-control" name="example_name" value="" />
                                    <p class="help-block">Set type to double and specify range, also showing grid and adding prefix "$".</p>
                                </div>
                                <div class="form-group">
                                    <label>Range with negative values</label>
                                    <input id="advance-2" type="text" class="form-control" name="example_name" value="" />
                                    <p class="help-block">Set up range with negative values.</p>
                                </div>
                                <div class="form-group">
                                    <label>Range using step 100</label>
                                    <input id="advance-3" type="text" class="form-control" name="example_name" value="" />
                                    <p class="help-block">Range using step 100.</p>
                                </div>
                                <div class="form-group single-ionRangeSlider">
                                    <label>Range using strings</label>
                                    <input id="advance-4" type="text" class="form-control" name="example_name" value="" />
                                    <p class="help-block">Range using strings.</p>
                                </div>
                                <div class="form-group single-ionRangeSlider">
                                    <label>Range with Formatting Number:</label>
                                    <input id="advance-5" type="text" class="form-control" name="example_name" value="" />
                                    <p class="help-block">Prettify visual look of numbers.</p>
                                </div>
                                <div class="form-group single-ionRangeSlider">
                                    <label>You can lock your slider, by using disable option:</label>
                                    <input id="advance-6" type="text" class="form-control" name="example_name" value="" />
                                    <p class="help-block">using <code>disable: true</code></p>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <style type="text/css">

    </style>
    <script type="text/javascript">
        jQuery(document).ready(function () {
            (function ($) {
                var flipperRTLFunction = function (min, max) {
                    return function (num) {
                        var tmp_min = min,
                                tmp_max = max,
                                tmp_num = num;
                        tmp_min = 0;
                        tmp_max = max - min;
                        tmp_num = num - min;
                        tmp_num = tmp_max - tmp_num;
                        console.log("num is = " + num + " , return is = " + (tmp_num + min));
                        return tmp_num + min;
                    };
                };
                var min = 10;
                var max = 90;
                var from = 30;
                from = (javatmp.settings.isRTL === true) ? ((max + min) - from) : from;
                $("#Basic-With-Default-Options").ionRangeSlider({
                    min: min,
                    max: max,
                    from: from,
                    prettify: (javatmp.settings.isRTL === true) ? flipperRTLFunction(min, max) : null,
                    onStart: function (data) {
                        console.log("onStart:");
                        console.log(data);
                    },
                    onChange: function (data) {
                        console.log("onChange:");
                        console.log(data);
                    },
                    onFinish: function (data) {
                        console.log("onFinish:");
                        console.log(data);
                    },
                    onUpdate: function (data) {
                        console.log("onUpdate:");
                        console.log(data);
                    }
                });
                $("#Basic-With-Default-Options-grid").ionRangeSlider({
                    min: min,
                    max: max,
                    from: from,
                    grid: true,
                    prettify: (javatmp.settings.isRTL === true) ? flipperRTLFunction(min, max) : null,
                    onStart: function (data) {
                        console.log("onStart:");
                        console.log(data);
                    },
                    onChange: function (data) {
                        console.log("onChange:");
                        console.log(data);
                    },
                    onFinish: function (data) {
                        console.log("onFinish:");
                        console.log(data);
                    },
                    onUpdate: function (data) {
                        console.log("onUpdate:");
                        console.log(data);
                    }
                });
                min = -100;
                max = 1000;
                from = 550;
                from = (javatmp.settings.isRTL === true) ? ((max + min) - from) : from;
                $("#Range-Slider-Id").ionRangeSlider({
                    min: min,
                    max: max,
                    from: from,
                    grid: true,
                    to_min: 110,
                    to_max: 950,
                    from_shadow: true,
                    to_shadow: true,
                    prettify: (javatmp.settings.isRTL === true) ? flipperRTLFunction(min, max) : null,
                    onStart: function (data) {
                        console.log("onStart:");
                        console.log(data);
                    },
                    onChange: function (data) {
                        console.log("onChange:");
                        console.log(data);
                    },
                    onFinish: function (data) {
                        console.log("onFinish:");
                        console.log(data);
                    },
                    onUpdate: function (data) {
                        console.log("onUpdate:");
                        console.log(data);
                    }
                });
                min = 0;
                max = 1000;
                from = 200;
                var to = 800;
                console.log("old from = " + from + " , to = " + to);
//                from = (javatmp.settings.isRTL === true) ? ((max + min) - from) : from;
//                to = (javatmp.settings.isRTL === true) ? ((max + min) - to) : to;

                console.log("new from = " + from + " , to = " + to);
                $("#advance-1").ionRangeSlider({
                    type: "double",
                    grid: true,
                    min: min,
                    max: max,
                    to_min: 100,
                    to_max: 900,
                    from_min: 100,
                    from_max: 900,
                    from: from,
                    to: to,
                    from_shadow: false,
                    to_shadow: true,
                    prefix: "$",
                    prettify: (javatmp.settings.isRTL === true) ? flipperRTLFunction(min, max) : null,
                    onStart: function (data) {
                        console.log("onStart:");
                        console.log(data);
                    },
                    onChange: function (data) {
                        console.log("onChange:");
                        console.log(data);
                    },
                    onFinish: function (data) {
                        console.log("onFinish:");
                        console.log(data);
                    },
                    onUpdate: function (data) {
                        console.log("onUpdate:");
                        console.log(data);
                    }
                });
                min = -1000;
                max = 1000;
                from = -500;
                to = 500;
                $("#advance-2").ionRangeSlider({
                    type: "double",
                    grid: true,
                    min: min,
                    max: max,
                    from: from,
                    from_shadow: true,
                    to_shadow: true,
                    to: to,
                    prettify: (javatmp.settings.isRTL === true) ? flipperRTLFunction(min, max) : null,
                    onStart: function (data) {
                        console.log("onStart:");
                        console.log(data);
                    },
                    onChange: function (data) {
                        console.log("onChange:");
                        console.log(data);
                    },
                    onFinish: function (data) {
                        console.log("onFinish:");
                        console.log(data);
                    },
                    onUpdate: function (data) {
                        console.log("onUpdate:");
                        console.log(data);
                    }
                });
                min = -1000;
                max = 1000;
                from = -500;
                to = 500;
                $("#advance-3").ionRangeSlider({
                    type: "double",
                    grid: true,
                    min: min,
                    max: max,
                    from: from,
                    to: to,
                    from_shadow: true,
                    to_shadow: true,
                    step: 100,
                    prettify: (javatmp.settings.isRTL === true) ? flipperRTLFunction(min, max) : null,
                    onStart: function (data) {
                        console.log("onStart:");
                        console.log(data);
                    },
                    onChange: function (data) {
                        console.log("onChange:");
                        console.log(data);
                    },
                    onFinish: function (data) {
                        console.log("onFinish:");
                        console.log(data);
                    },
                    onUpdate: function (data) {
                        console.log("onUpdate:");
                        console.log(data);
                    }
                });
                min = 0;
                max = 11;
                from = 3;
                from = (javatmp.settings.isRTL === true) ? ((max + min) - from) : from;
                $("#advance-4").ionRangeSlider({
                    grid: true,
                    from: from,
                    from_shadow: true,
                    to_shadow: true,
                    values: [
                        "January", "February", "March",
                        "April", "May", "June",
                        "July", "August", "September",
                        "October", "November", "December"
                    ].reverse(),
                    onStart: function (data) {
                        console.log("onStart:");
                        console.log(data);
                    },
                    onChange: function (data) {
                        console.log("onChange:");
                        console.log(data);
                    },
                    onFinish: function (data) {
                        console.log("onFinish:");
                        console.log(data);
                    },
                    onUpdate: function (data) {
                        console.log("onUpdate:");
                        console.log(data);
                    }
                });
                min = 1000;
                max = 1000000;
                from = 300000;
                from = (javatmp.settings.isRTL === true) ? ((max + min) - from) : from;
                $("#advance-5").ionRangeSlider({
                    grid: true,
                    min: min,
                    max: max,
                    from: from,
                    step: 1000,
                    prettify_enabled: true,
                    from_shadow: true,
                    to_shadow: true,
                    prettify_separator: ",",
                    prettify: (javatmp.settings.isRTL === true) ? flipperRTLFunction(min, max) : null,
                    onStart: function (data) {
                        console.log("onStart:");
                        console.log(data);
                    },
                    onChange: function (data) {
                        console.log("onChange:");
                        console.log(data);
                    },
                    onFinish: function (data) {
                        console.log("onFinish:");
                        console.log(data);
                    },
                    onUpdate: function (data) {
                        console.log("onUpdate:");
                        console.log(data);
                    }
                });
                min = 1000;
                max = 1000000;
                from = 300000;
                from = (javatmp.settings.isRTL === true) ? ((max + min) - from) : from;
                $("#advance-6").ionRangeSlider({
                    grid: true,
                    min: min,
                    max: max,
                    from: from,
                    step: 1000,
                    prettify_enabled: true,
                    from_shadow: true,
                    to_shadow: true,
                    prettify_separator: ",",
                    disable: true,
                    prettify: (javatmp.settings.isRTL === true) ? flipperRTLFunction(min, max) : null,
                    onStart: function (data) {
                        console.log("onStart:");
                        console.log(data);
                    },
                    onChange: function (data) {
                        console.log("onChange:");
                        console.log(data);
                    },
                    onFinish: function (data) {
                        console.log("onFinish:");
                        console.log(data);
                    },
                    onUpdate: function (data) {
                        console.log("onUpdate:");
                        console.log(data);
                    }
                });
            }(jQuery));
        });
    </script>
</div>