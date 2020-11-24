<%@page contentType="text/html" pageEncoding="UTF-8" %>
<div class="dynamic-ajax-content grid-gutter-padding">
    <h4 class="my-3">DevExtreme Introduction</h4>
    <hr/>
    <div class="row">
        <div class="col-lg-12">
            <div class="alert alert-info">
                <p>
                    DevExtreme is a premium HTML5 JavaScript Component Suite for Responsive Web Development.
                    DevExtreme includes a comprehensive collection of high-performance and responsive
                    UI widgets for use in traditional web and next-gen mobile applications.
                    The suite ships with a feature-complete data grid, interactive charts widgets, data editors,
                    and much more. With DevExtreme, you’ll deliver amazing user experiences
                    for today’s modern web browsers.
                </p>
                <p>
                    <a class="btn btn-success" target="_blank" href="https://js.devexpress.com/">Home Page</a>
                    <a class="btn btn-success" target="_blank" href="https://github.com/DevExpress/DevExtreme">Github Repository</a>
                    <a class="btn btn-success" target="_blank" href="https://js.devexpress.com/Buy/">Pricing</a>
                    <a class="btn btn-success" target="_blank" href="https://js.devexpress.com/Licensing/">Licensing</a>
                    <a class="btn btn-success" target="_blank" href="https://js.devexpress.com/Demos/WidgetsGallery/">Demo</a>
                    <a class="btn btn-success" target="_blank" href="https://js.devexpress.com/Documentation/Guide/Common/Distribution_Channels/ZIP_Archive/">Offline Demo</a>
                </p>
            </div>
            <a class="btn btn-info btn-lg"
               target="_blank"
               href="${pageContext.request.contextPath}/pages/DevExtreme/devextreme-landing-empty-starter">
                DevExtreme Landing Empty Starter Demo Page
            </a>
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
    <!-- DevExtreme library -->
    <!--    <script type="text/javascript" src="https://cdn3.devexpress.com/jslib/20.1.7/js/dx.all.js"></script>-->
    <!-- <script type="text/javascript" src="https://cdn3.devexpress.com/jslib/20.1.7/js/dx.web.js"></script> -->
    <!-- <script type="text/javascript" src="https://cdn3.devexpress.com/jslib/20.1.7/js/dx.viz.js"></script> -->
    <!-- <script type="text/javascript" src="https://cdn3.devexpress.com/jslib/20.1.7/js/dx.viz-web.js"></script> -->
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

            });
        });
    </script>
</div>
