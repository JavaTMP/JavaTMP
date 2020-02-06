<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="dynamic-ajax-content grid-gutter-padding">
    <h4 class="my-3">AOS - Animate On Scroll Plugin</h4>
    <hr/>
    <div class="row">
        <div class="col-lg-12">
            <div class="alert alert-info">
                <p>Animate on scroll library.</p>
                <p>
                    <a class="btn btn-info" target="_blank" href="http://michalsnik.github.io/aos/">Demo Page</a>
                    <a class="btn btn-info" target="_blank" href="https://github.com/michalsnik/aos">github.com Project Link</a>
                    <a class="btn btn-info" target="_blank" href="https://css-tricks.com/aos-css-driven-scroll-animation-library/">Online article</a>
                </p>
            </div>
            <div class="card my-3">
                <div class="card-body">
                    <div data-id="1" class="aos-item bg-primary text-light my-1" data-aos="fade-up"></div>
                    <div data-id="2" class="aos-item bg-primary text-light my-1" data-aos="fade-down"></div>
                    <div data-id="3" class="aos-item bg-primary text-light my-1" data-aos="zoom-out-down"></div>
                    <div data-id="4" class="aos-item bg-primary text-light my-1" data-aos="flip-down"></div>
                    <div data-id="5" class="aos-item bg-primary text-light my-1" data-aos="flip-up"></div>
                    <div data-id="6" class="aos-item bg-primary text-light my-1" data-aos="fade-down"></div>
                    <div data-id="7" class="aos-item bg-primary text-light my-1" data-aos="fade-in"></div>
                    <div data-id="8" class="aos-item bg-primary text-light my-1" data-aos="fade-down"></div>
                    <div data-id="9" class="aos-item bg-primary text-light my-1" data-aos="fade-in"></div>
                    <div data-id="10" class="aos-item bg-primary text-light my-1" data-aos="fade-down" data-aos-id="super-duper"></div>
                    <div data-id="11" class="aos-item bg-primary text-light my-1" data-aos="fade-up"></div>
                    <div data-id="12" class="aos-item bg-primary text-light my-1" data-aos="fade-down"></div>
                    <div data-id="13" class="aos-item bg-primary text-light my-1" data-aos="fade-in"></div>
                    <div data-id="14" class="aos-item bg-primary text-light my-1" data-aos="fade-up"></div>
                    <div data-id="15" class="aos-item bg-primary text-light my-1" data-aos="fade-in"></div>
                    <div data-id="16" class="aos-item bg-primary text-light my-1" data-aos="fade-up"></div>
                    <div data-id="17" class="aos-item bg-primary text-light my-1" data-aos="fade-down"></div>
                    <div data-id="18" class="aos-item bg-primary text-light my-1" data-aos="fade-up"></div>
                    <div data-id="19" class="aos-item bg-primary text-light my-1" data-aos="zoom-out"></div>
                    <div data-id="20" class="aos-item bg-primary text-light my-1" data-aos="fade-up"></div>
                    <div data-id="21" class="aos-item bg-primary text-light my-1" data-aos="zoom-out"></div>
                    <div data-id="22" class="aos-item bg-primary text-light my-1" data-aos="fade-in"></div>
                    <div data-id="23" class="aos-item bg-primary text-light my-1" data-aos="zoom-out-up"></div>
                    <div data-id="24" class="aos-item bg-primary text-light my-1" data-aos="fade-right"></div>
                    <div data-id="25" class="aos-item bg-primary text-light my-1" data-aos="fade-left"></div>
                    <div data-id="26" class="aos-item bg-primary text-light my-1" data-aos="fade-up-right"></div>
                    <div data-id="27" class="aos-item bg-primary text-light my-1" data-aos="fade-up-left"></div>
                    <div data-id="28" class="aos-item bg-primary text-light my-1" data-aos="fade-down-right"></div>
                    <div data-id="29" class="aos-item bg-primary text-light my-1" data-aos="fade-down-left"></div>
                    <div data-id="30" class="aos-item bg-primary text-light my-1" data-aos="zoom-out-down"></div>
                    <div data-id="31" class="aos-item bg-primary text-light my-1" data-aos="zoom-out-down"></div>
                    <div data-id="32" class="aos-item bg-primary text-light my-1" data-aos="zoom-out-down"></div>
                    <div data-id="33" class="aos-item bg-primary text-light my-1" data-aos="zoom-out-down"></div>
                    <div data-id="34" class="aos-item bg-primary text-light my-1" data-aos="zoom-out-down"></div>
                    <div data-id="35" class="aos-item bg-primary text-light my-1" data-aos="zoom-out-down"></div>
                    <div data-id="36" class="aos-item bg-primary text-light my-1" data-aos="zoom-out-down"></div>
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

        .aos-item {
            display: block;
            margin-left: auto;
            margin-right: auto;
            width: 250px;
            height: 300px;
            padding: 20px;
        }

        .aos-item::before {
            content: attr(data-id) " - " attr(data-aos);
            position: relative;
            width: 100%;
            height: 100%;
            float: left;
            line-height: 260px;
            text-align: center;

        }
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
                AOS.init({
                    mirror: true
                });

                $(document).on('aos:in', function (e) {
                    console.log('AOS - in:', e.detail);
                });

            });
        });
    </script>
</div>