<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="dynamic-ajax-content grid-gutter-padding">
    <h4 class="my-3">JavaTMP Custom Build-in Themes</h4>
    <hr/>
    <div class="form-row">
        <div class="col-6 col-sm-6 col-md-4 col-lg-2 col-xl-2 text-center">
            <a class="applyTheme" themeName="default"  href="javascript:void(0);">
                <img class="img-thumbnail" src="assets/img/themes/default.png" alt=""/>
            </a>
        </div>
        <div class="col-6 col-sm-6 col-md-4 col-lg-2 col-xl-2 text-center">
            <a class="applyTheme" themeName="ace"  href="javascript:void(0);">
                <img class="img-thumbnail" src="assets/img/themes/ace.png" alt=""/>
            </a>
        </div>
        <div class="col-6 col-sm-6 col-md-4 col-lg-2 col-xl-2 text-center">
            <a class="applyTheme" themeName="schooly"  href="javascript:void(0);">
                <img class="img-thumbnail" src="assets/img/themes/schooly.png" alt=""/>
            </a>
        </div>
        <div class="col-6 col-sm-6 col-md-4 col-lg-2 col-xl-2 text-center">
            <a class="applyTheme" themeName="greenish"  href="javascript:void(0);">
                <img class="img-thumbnail" src="assets/img/themes/greenish.png" alt=""/>
            </a>
        </div>
        <div class="col-6 col-sm-6 col-md-4 col-lg-2 col-xl-2 text-center">
            <a class="applyTheme" themeName="purplish"  href="javascript:void(0);">
                <img class="img-thumbnail" src="assets/img/themes/purplish.png" alt=""/>
            </a>
        </div>
    </div>
    <style type="text/css">
    </style>
    <script type="text/javascript">
        jQuery(function ($) {
            // any code put here will be run after content attach to ajax output container and before
            // controll return to main javascript file.
            $(javatmp.settings.defaultOutputSelector).on(javatmp.settings.javaTmpAjaxContainerReady, function (event) {
                // fire AFTER all transition done and your ajax content is shown to user.
                $(".applyTheme").on("click", function () {
                    var themeName = $(this).attr("themeName");
                    var styleId = "#themeStyleSheet";
                    var newUrl = "assets/dist/css/javatmp-" + themeName;
                    if (javatmp.settings.isRTL === true) {
                        newUrl += "-rtl";
                    }
                    newUrl += ".min.css";
                    $(styleId).attr("href", newUrl);
                });
            });

            $(javatmp.settings.defaultOutputSelector).on(javatmp.settings.javaTmpContainerResizeEventName, function (event) {
                // fire when user resize browser window or sidebar hide / show
            });

            /**
             * When another sidebar menu item pressed and before container replaced with new ajax content.
             * You can cancel, destroy, or remove any thing here before replace main output ajax container.
             * returning false will cancel the new request and do nothing.
             **/
            $(javatmp.settings.defaultOutputSelector).on(javatmp.settings.javaTmpContainerRemoveEventName, function (event) {
                return true;
            });
        });
    </script>
</div>