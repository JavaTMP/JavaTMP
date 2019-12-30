<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="dynamic-ajax-content">
    <h4 class="m-3">Video Blocks</h4>
    <hr class="mx-3"/>
    <div class="row">
        <div class="col-lg-12">
            <section class="pt-5 pb-5">
                <div class="container pb-5 pt-5">
                    <div class="row align-items-center justify-content-between ">
                        <div class="col-12 col-md-5 pr-md-5 ">
                            <h1 class="mb-3 mt-5 display-4 font-weight-bold">Hello.</h1>
                            <p class="lead  ">A collection of coded HTML and CSS elements to help your build your new website. Clean design, fully responsive and based on Bootstrap.</p>
                            <div class="  d-flex mt-3 mb-1">
                                <a class="btn btn-success btn-lg  mt-md-3  " href="javascript:;" role="button">Learn more now</a>
                            </div>
                        </div>
                        <div class="col-12 col-md-7  mt-4 mt-md-0">
                            <div class="embed-responsive embed-responsive-16by9 shadow-lg rounded overflow-hidden">
                                <iframe class="embed-responsive-item" src="https://www.youtube.com/embed/zpOULjyy-n8?rel=0" allowfullscreen=""></iframe>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <hr/>
            <section class="pt-5 pb-5">
                <div class="container">
                    <div class="row align-items-center justify-content-center">
                        <div class="col-12 col-md-8 text-center">
                            <h1 class="mb-3 mt-5">Section with video</h1>
                            <p class="lead  ">A collection of coded HTML and CSS elements to help your build your new website. Clean design, fully responsive and based on Bootstrap 4.</p>
                            <div class="  d-flex justify-content-center mb-5 mt-3">
                                <a class="btn btn-primary btn-raised    mt-md-3 " href="javascript:;" role="button">Download Now</a>
                                <a class="btn btn-outline-secondary  mt-md-3 ml-md-3" href="javascript:;" role="button">Learn more now</a>
                            </div>
                        </div>
                        <div class="col-12 col-md-10   mt-4 mt-md-0">
                            <div class="embed-responsive embed-responsive-16by9 shadow-lg">
                                <iframe class="embed-responsive-item" src="https://www.youtube.com/embed/zpOULjyy-n8?rel=0" allowfullscreen=""></iframe>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <hr/>

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
            });
        });
    </script>
</div>