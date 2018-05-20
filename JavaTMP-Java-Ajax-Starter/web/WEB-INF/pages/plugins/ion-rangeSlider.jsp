<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="dynamic-ajax-content">
    <div class="page-header">
        <h1>Ion Range Slider</h1>
    </div>
    <div class="row">
        <div class="col-lg-12">
            <div class="alert alert-info">
                <p>Ion.RangeSlider. Is an easy, flexible and responsive range slider with tons of options.</p>
                <p><span class="text-danger">NO SUPPORT FOR RTL IN CURRENT 2.2.0 version</span></p>
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
                                <div class="form-group">
                                    <label>Basic With Default Options:</label>
                                    <input id="Basic-With-Default-Options" type="text" class="form-control" name="example_name" value="" />
                                    <p class="help-block">Start without params.</p>
                                </div>
                                <div class="form-group">
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
                                <div class="form-group">
                                    <label>Range using strings</label>
                                    <input id="advance-4" type="text" class="form-control" name="example_name" value="" />
                                    <p class="help-block">Range using strings.</p>
                                </div>
                                <div class="form-group">
                                    <label>Range with Formatting Number:</label>
                                    <input id="advance-5" type="text" class="form-control" name="example_name" value="" />
                                    <p class="help-block">Prettify visual look of numbers.</p>
                                </div>
                                <div class="form-group">
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
    <script type="text/javascript">
        jQuery(document).ready(function () {
            (function ($) {
                $("#Basic-With-Default-Options").ionRangeSlider();
                $("#Range-Slider-Id").ionRangeSlider({
                    min: 100,
                    max: 1000,
                    to_min: 110,
                    to_max: 950,
                    from_shadow: true,
                    to_shadow: true,
                    from: 550
                });
                $("#advance-1").ionRangeSlider({
                    type: "double",
                    grid: true,
                    min: 0,
                    max: 1000,
                    to_min: 100,
                    to_max: 900,
                    from_min: 100,
                    from_max: 900,
                    from: 200,
                    to: 800,
                    from_shadow: false,
                    to_shadow: true,
                    prefix: "$"
                });
                $("#advance-2").ionRangeSlider({
                    type: "double",
                    grid: true,
                    min: -1000,
                    max: 1000,
                    from: -500,
                    from_shadow: true,
                    to_shadow: true,
                    to: 500
                });
                $("#advance-3").ionRangeSlider({
                    type: "double",
                    grid: true,
                    min: -1000,
                    max: 1000,
                    from: -500,
                    to: 500,
                    from_shadow: true,
                    to_shadow: true,
                    step: 100
                });
                $("#advance-4").ionRangeSlider({
                    grid: true,
                    from: 3,
                    from_shadow: true,
                    to_shadow: true,
                    values: [
                        "January", "February", "March",
                        "April", "May", "June",
                        "July", "August", "September",
                        "October", "November", "December"
                    ]
                });
                $("#advance-5").ionRangeSlider({
                    grid: true,
                    min: 1000,
                    max: 1000000,
                    from: 300000,
                    step: 1000,
                    prettify_enabled: true,
                    from_shadow: true,
                    to_shadow: true,
                    prettify_separator: ","
                });
                $("#advance-6").ionRangeSlider({
                    grid: true,
                    min: 1000,
                    max: 1000000,
                    from: 300000,
                    step: 1000,
                    prettify_enabled: true,
                    from_shadow: true,
                    to_shadow: true,
                    prettify_separator: ",",
                    disable: true
                });
//                $("#Range-Slider-Id").ionRangeSlider({
//                    hide_min_max: true,
//                    keyboard: true,
//                    min: 0,
//                    max: 5000,
//                    from: 1000,
//                    to: 4000,
//                    type: 'double',
//                    step: 1,
//                    prefix: "$",
//                    grid: true
//                });
            }(jQuery));
        });
    </script>
</div>