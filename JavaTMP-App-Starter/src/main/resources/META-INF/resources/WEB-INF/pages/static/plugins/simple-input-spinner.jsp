<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="dynamic-ajax-content grid-gutter-padding">
    <h4 class="my-3">Simple Input Spinner</h4>
    <hr/>
    <div class="row">
        <div class="col-2">
            <div class="input-group number-spinner">
                <span class="input-group-prepend">
                    <button class="btn btn-primary" data-dir="up"><span class="fas fa-plus"></span></button>
                </span>
                <input type="text" class="form-control text-center" value="1">
                <span class="input-group-append">
                    <button class="btn btn-secondary" data-dir="down"><span class="fas fa-minus"></span></button>
                </span>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-2">
            <div class="input-group number-spinner mt-3">
                <input type="text" class="form-control" value="42">
                <span class="input-group-append">
                    <button class="btn btn-primary btn-sm" data-dir="up" type="button">+</button>
                    <button class="btn btn-secondary btn-sm" data-dir="down" type="button">-</button>
                </span>
                <div class="input-group-btn-vertical">

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

                // Your custom specific page code here:

                $('.number-spinner input').on('mousewheel DOMMouseScroll', function (e) {
                    var isUp = false;
                    if (typeof e.originalEvent.detail === 'number' && e.originalEvent.detail !== 0) {
                        if (e.originalEvent.detail > 0) {
                            console.log('Down');
                            isUp = false;
                        } else if (e.originalEvent.detail < 0) {
                            console.log('Up');
                            isUp = true;
                        }
                    } else if (typeof e.originalEvent.wheelDelta === 'number') {
                        if (e.originalEvent.wheelDelta < 0) {
                            console.log('Down');
                        } else if (e.originalEvent.wheelDelta > 0) {
                            console.log('Up');
                            isUp = true;
                        }
                    }

                    if (isUp) {
                        $(this).closest('.number-spinner').find('button[data-dir="up"]').trigger("click");
                    } else { // is down
                        $(this).closest('.number-spinner').find('button[data-dir="down"]').trigger("click");
                    }

                });

                $('.number-spinner input').focusin(function () {
                    console.log("focus");
                }).focusout(function () {
                    console.log("focusout");
                });
                $(javatmp.settings.defaultOutputSelector).on('click', '.number-spinner button', function () {
                    var btn = $(this),
                            oldValue = btn.closest('.number-spinner').find('input').val().trim(),
                            newVal = 0;

                    if (btn.attr('data-dir') === 'up') {
                        newVal = parseInt(oldValue) + 1;
                    } else {
                        if (oldValue > 1) {
                            newVal = parseInt(oldValue) - 1;
                        } else {
                            newVal = 1;
                        }
                    }
                    btn.closest('.number-spinner').find('input').val(newVal);
                });

            });
        });
    </script>
</div>