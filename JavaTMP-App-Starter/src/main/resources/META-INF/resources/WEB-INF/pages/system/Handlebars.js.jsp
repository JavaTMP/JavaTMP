<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="dynamic-ajax-content grid-gutter-padding">
    <h4 class="my-3">Handlebars.js template plugin</h4>
    <hr/>
    <div class="row">
        <div class="col">
            <div class="alert alert-info mt-3">
                <p>Handlebars provides the power necessary to let you build semantic templates effectively with no frustration. Handlebars is largely compatible with Mustache templates. In most cases it is possible to swap out Mustache with Handlebars and continue using your current templates.</p>
                <p>
                    <a target="_blank" class="btn btn-info" href="https://github.com/wycats/handlebars.js">Demo Site</a>
                    <a target="_blank" class="btn btn-info" href="https://github.com/wycats/handlebars.js">github source code</a>
                </p>
            </div>
            <div class="card">
                <div class="card-header">
                    Basic Example
                    <div class="options float-right">
                        <a href="#" class="settings"><i class="fa fa-cog"></i></a>
                        <a href="#" class="collapse"><i class="fa fa-chevron-up"></i></a>
                        <a href="#" class="reload"><i class="fa fa-sync"></i></a>
                        <a href="#" class="fullscreen"><i class=" fa fa-expand"></i></a>
                        <a href="#" class="remove"><i class="fa fa-times"></i></a>
                    </div>
                </div>
                <div class="card-body">
                    <h5 class="card-title text-primary">Tempalte Text:</h5>
                    <pre><code>
* {{name}}
* {{age}}
* {{company}}
* {{{company}}}
                    </code></pre>
                    <h5 class="card-title text-primary">Tempalte View:</h5>
                    <pre><code>
{
  &quot;name&quot;: &quot;JavaTMP&quot;,
  &quot;company&quot;: &quot;&lt;b&gt;GitHub&lt;/b&gt;&quot;
}
                    </code></pre>
                    <h5 class="card-title text-primary">Handlebars Result:</h5>
                    <pre><code id="tpl-output1">
                    </code></pre>
                    <h5 class="card-title text-primary">Remote Handlebars Result: (Go to <code>.\src\java\com\javatmp\module\message\ViewHandlebarsMessageController.java</code> to see implementation class)</h5>
                    <pre><code id="tpl-output2">
                    </code></pre>
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
                var source = `
* {{name}}
* {{age}}
* {{company}}
* {{{company}}}
`;
                var view = {
                    "name": "JavaTMP",
                    "company": "<b>GitHub</b>"
                };
                var template = Handlebars.compile(source);

                $('#tpl-output1').html(template(view));

                $.getJSON(javatmp.settings.contextPath + "/message/ViewHandlebarsMessageController", function (data) {
                    $('#tpl-output2').html(data.data);
                });

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