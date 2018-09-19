<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="dynamic-ajax-content">
    <div class="page-header">
        <h1>JavaTMP Custom Build-in Themes</h1>
    </div>
    <div class="row">
        <div class="col-6 col-sm-6 col-md-4 col-lg-2 col-xl-2 text-center px-2">
            <a class="applyTheme" themeName="default"  href="javascript:void(0);">
                <img class="img-thumbnail" src="${pageContext.request.contextPath}/assets/img/themes/Default.png" alt=""/>
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
                    $.ajax({
                        cache: false,
                        type: javatmp.settings.httpMethod,
                        url: javatmp.settings.contextPath + "/updateTheme",
                        data: {"theme": themeName},
                        beforeSend: function () {
                        },
                        success: function (response, textStatus, jqXHR) {
                            var modalMessage = null;
                            var redirectURL = null;
                            try {
                                var ResponseMessage = JSON.parse(jqXHR.responseText);
                                modalMessage = ResponseMessage.message;
                                redirectURL = ResponseMessage.redirectURL;
                            } catch (ex) {
                                modalMessage = jqXHR.responseText;
                                redirectURL = javatmp.settings.contextPath + "/";
                            }
//                            window.location.replace(redirectURL);
                            window.location.reload(true);
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            alert("error");

                        }
                    });

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