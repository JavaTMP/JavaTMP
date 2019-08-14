<div class="dynamic-ajax-content grid-gutter-padding">
    <h4 class="my-3">jQuery Easing Plugin</h4>
    <hr/>
    <div class="row">
        <div class="col-lg-12">
            <div class="alert alert-info">
                <p>Animate on scroll library.</p>
                <p>
                    <a class="btn btn-info" target="_blank" href="http://gsgd.co.uk/sandbox/jquery/easing/">Demo Page</a>
                    <a class="btn btn-info" target="_blank" href="https://github.com/gdsmith/jquery.easing">github.com Project Link</a>
                </p>
            </div>
            <div class="card my-3">
                <div class="card-body">
                    <h1>Demo of all easing styles</h1>
                    <p id=status>Choose an easing method and press Run</p>
                    <p>
                        <label for=easing>Easing: </label>
                        <select id=easing></select><br />
                        <label for=duration> Duration (seconds): </label>
                        <input type=text id=duration size=10 value=1000 /><br />
                        <button id=run>Run</button>
                    </p>
                    <div id=bounds>
                        <div id="box"></div>
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
    <style type="text/css" media="screen">
        #bounds {
            width: 250px;
            height: 250px;
            border: 1px solid #888;
        }
        #box {
            height: 50px;
            width: 50px;
            background: black;
        }
    </style>
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

                $(javatmp.settings.defaultOutputSelector).on(javatmp.settings.javaTmpContainerResizeEventName, function (event) {
                    // fire when user resize browser window or sidebar hide / show
                });

                /**
                 * When another sidebar menu item pressed and before container issues new ajax request.
                 * You can cancel, destroy, or remove any thing here before replace main output ajax container.
                 * return false or event.preventDefault() will cancel ajax and stay you in the current page and do nothing.
                 **/
                $(javatmp.settings.defaultOutputSelector).on(javatmp.settings.javaTmpContainerRemoveEventName, function (event) {
                    var newLink = $(event._newTarget);
                    return true;
                });

                // custom code run once all transition done and your ajax content is shown to user.
                var easings = $.map($.easing, function (fn, key) {
                    return jQuery.isFunction(fn) ?
                            "<option value='" + key + "'>" + key + "</option>" :
                            null;
                }),
                        current = 0,
                        positions = [
                            {
                                marginTop: "0px",
                                marginLeft: "0px"
                            }, {
                                marginTop: "200px",
                                marginLeft: "200px"
                            }
                        ];

                $("#easing").html(easings);
                $("#run").on("click", function () {
                    var duration = +$("#duration").val(),
                            easing = $("#easing").val(),
                            start = Date.now();

                    if (Number.isNaN(duration)) {
                        duration = 1000;
                        $("#duration").val(duration);
                    }

                    $("#status").text("Animating...");

                    // Alternate positions
                    current = current ^ 1;
                    $("#box").animate(positions[current], duration, easing,
                            function () {
                                $("#status").text("Done (" + (Date.now() - start) / 1000 + " seconds)");
                            }
                    );
                });


            });
        });
    </script>
</div>