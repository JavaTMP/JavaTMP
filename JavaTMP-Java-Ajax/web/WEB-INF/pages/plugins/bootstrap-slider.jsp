<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="dynamic-ajax-content grid-gutter-padding">
    <div class="row">
        <div class="col-lg-12">
            <div class="alert alert-info my-3">
                <p>Slider for Bootstrap</p>
                <br/>
                <p>
                    <a class="btn btn-info" target="_blank" href="http://seiyria.com/bootstrap-slider/"><i class="fa fa-external-link-alt fa-fw"></i>Demo Page</a>
                    <a class="btn btn-info" target="_blank" href="https://github.com/seiyria/bootstrap-slider"><i class="fa fa-external-link-alt fa-fw"></i>github.com Page</a>
                </p>
            </div>
            <div class="card my-3">
                <div class="card-header">
                    bootstrap-slider Plugin
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
                            <form role="form" action="#" method="post" role="form" class="form-horizontal">
                                <div class="form-group">
                                    <label class="col-md-2 control-label">Basic Example</label>
                                    <div class="col-md-5">
                                        <input class="form-control" id="ex1" data-slider-id='ex1Slider' type="text" data-slider-min="0" data-slider-max="20" data-slider-step="1" data-slider-value="14"/>
                                        <p class="help-block">Basic example with custom formatter and colored selected region via CSS.</p>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-2 control-label">Filter by price interval:</label>
                                    <div class="col-md-5">
                                        <input class="form-control" id="ex2" type="text" class="span2" value="" data-slider-min="10" data-slider-max="1000" data-slider-step="5" data-slider-value="[250,450]"/>
                                        <p class="help-block">Range selector, options specified via data attribute.</p>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-2 control-label">With Event</label>
                                    <div class="col-md-5">
                                        <input class="form-control" id="ex6" type="text" data-slider-min="-5" data-slider-max="20" data-slider-step="1" data-slider-value="3"/>
                                        <p class="help-block"><span id="ex6CurrentSliderValLabel">Current Slider Value: <span id="ex6SliderVal" style="color: #D15B47;">3</span></span></p>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-2 control-label">Vertical Slider</label>
                                    <div class="col-md-5">
                                        <input class="form-control" id="ex4" type="text" data-slider-min="-5" data-slider-max="20" data-slider-step="1" data-slider-value="-3" data-slider-orientation="vertical"/>
                                        <p class="help-block">Vertical Slider with reversed values (largest to smallest).</p>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-2 control-label">Fixed Tooltip</label>
                                    <div class="col-md-5">
                                        <input class="form-control" id="ex8" data-slider-id='ex1Slider' type="text" data-slider-min="0" data-slider-max="20" data-slider-step="1" data-slider-value="14"/>
                                        <p class="help-block">Tooltip can always be displayed.</p>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-2 control-label">Marks with Tick</label>
                                    <div class="col-md-5">
                                        <input class="form-control" id="ex13" type="text" data-slider-value="0" data-slider-step="100" data-slider-ticks="[0, 100, 200, 300, 400]" data-slider-ticks-snap-bounds="30" data-slider-ticks-labels='["$0", "$100", "$200", "$300", "$400"]'/>
                                        <p class="help-block">Using tick marks and labels.</p>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-2 control-label">Using Data Provide Attribute</label>
                                    <div class="col-md-5">
                                        <input class="form-control" id="ex19" type="text"
                                               data-provide="bootstrapSlider"
                                               data-slider-ticks="[1, 2, 3]"
                                               data-slider-ticks-labels='["short", "medium", "long"]'
                                               data-slider-min="1"
                                               data-slider-max="3"
                                               data-slider-step="1"
                                               data-slider-value="3"
                                               data-slider-tooltip="hide"/>
                                        <p class="help-block">Auto-Register <code>data-provide="slider"</code> Elements.<span style="color: #D15B47;">&nbsp;(Not dynamically working with AJAX Content)</span></p>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-2 control-label">Highlight ranges</label>
                                    <div class="col-md-5">
                                        <input class="form-control" id="ex22" type="text"
                                               data-slider-id="slider22"
                                               data-slider-min="0"
                                               data-slider-max="20"
                                               data-slider-step="1"
                                               data-slider-value="14"
                                               data-slider-rangeHighlights='[{ "start": 2, "end": 5, "class": "category1" },
                                               { "start": 7, "end": 8, "class": "category2" },
                                               { "start": 17, "end": 19 },
                                               { "start": 17, "end": 24 }, //not visible -  out of slider range
                                               { "start": -3, "end": 19 }]'/>
                                        <p class="help-block">Highlight ranges on slider with <b>rangeHighlights</b> attribute</p>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-2 control-label">Square Handler</label>
                                    <div class="col-md-5">
                                        <input
                                            data-provide="slider"
                                            type="text"
                                            class="form-control"
                                            value=""
                                            data-slider-min="0"
                                            data-slider-max="255"
                                            data-slider-step="1"
                                            data-slider-value="128"
                                            data-slider-id="RC"
                                            id="R"
                                            data-slider-tooltip="hide"
                                            data-slider-handle="square" />
                                        <p class="help-block">style the selection and handles via CSS.</p>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-2 control-label">Triangle Handler</label>
                                    <div class="col-md-5">
                                        <input
                                            data-provide="slider"
                                            type="text"
                                            class="form-control"
                                            value=""
                                            data-slider-min="0"
                                            data-slider-max="255"
                                            data-slider-step="1"
                                            data-slider-value="128"
                                            data-slider-id="BC"
                                            id="B"
                                            data-slider-tooltip="hide"
                                            data-slider-handle="triangle" />
                                        <p class="help-block">style the selection and handles via CSS.</p>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-2 control-label">Disabled slider</label>
                                    <div class="col-md-5">
                                        <input
                                            class="form-control"
                                            id="ex7"
                                            type="text"
                                            data-slider-min="0"
                                            data-slider-max="20"
                                            data-slider-step="1"
                                            data-slider-value="5"
                                            data-slider-enabled="false" />
                                        <label><input id="ex7-enabled" type="checkbox"/> Enabled</label>
                                        <p class="help-block">style the selection and handles via CSS.</p>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <style type="text/css">
        #slider22 .slider-selection {
            background: #81bfde;
        }
        #slider22 .slider-rangeHighlight {
            background: #f70616;
        }
        #slider22 .slider-rangeHighlight.category1 {
            background: #FF9900;
        }
        #slider22 .slider-rangeHighlight.category2 {
            background: #99CC00;
        }
    </style>
    <script type="text/javascript">
        jQuery(function ($) {
            // any code put here will be run after content attach to ajax output container and before
            // controll return to main javascript file.
            $('[data-provide="slider"]').bootstrapSlider();
            $('#ex1').bootstrapSlider({
                formatter: function (value) {
                    return 'Current value: ' + value;
                }
            });
            $("#ex2").bootstrapSlider({});

            $("#ex6").bootstrapSlider();
            $("#ex6").on("slide", function (slideEvt) {
                $("#ex6SliderVal").text(slideEvt.value);
            });

            $("#ex4").bootstrapSlider({
                reversed: true
            });

            $("#ex8").bootstrapSlider({
                tooltip: 'always'
            });

            $("#ex13").bootstrapSlider({
                ticks: [0, 100, 200, 300, 400],
                ticks_labels: ['$0', '$100', '$200', '$300', '$400'],
                ticks_snap_bounds: 30
            });

            $("#ex19").bootstrapSlider({});

            $('#ex22').bootstrapSlider({
                id: 'slider22',
                min: 0,
                max: 20,
                step: 1,
                value: 14,
                rangeHighlights: [{"start": 2, "end": 5, "class": "category1"},
                    {"start": 7, "end": 8, "class": "category2"},
                    {"start": 17, "end": 19},
                    {"start": 17, "end": 24},
                    {"start": -3, "end": 19}]});

            $("#ex7").bootstrapSlider();

            $("#ex7-enabled").click(function () {
                if (this.checked) {
                    // With JQuery
                    $("#ex7").bootstrapSlider("enable");

//                    // Without JQuery
//                    slider.enable();
                } else {
                    // With JQuery
                    $("#ex7").bootstrapSlider("disable");

//                    // Without JQuery
//                    slider.disable();
                }
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
             * When another sidebar menu item pressed and before container replaced with new ajax content.
             * You can cancel, destroy, or remove any thing here before replace main output ajax container.
             * returning false will cancel the new request and do nothing.
             **/
            $(javatmp.settings.defaultOutputSelector).on(javatmp.settings.javaTmpContainerRemoveEventName, function (event) {
                $(javatmp.settings.defaultOutputSelector).off(javatmp.settings.cardFullscreenCompress);
                $(javatmp.settings.defaultOutputSelector).off(javatmp.settings.cardFullscreenExpand);
                return true;
            });
        });
    </script>
</div>