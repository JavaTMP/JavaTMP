<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<div class="dynamic-ajax-content grid-gutter-padding">
    <h4 class="my-3">Bootswatch Themes</h4>
    <hr/>
    <div class="form-row">
        <div class="col-lg-12">
            <div class="alert alert-info">
                <p>Bootswatch is a collection of open source themes for Bootstrap that are easy to install and customize.</p>
                <p class="text-warning">Note that because we apply our font family at end of css files list, any custom font used in bootswatch themes will be override by ours.</p>
                <p class="text-danger">Note that we apply the Bootswatch themes without any tweeks or modifications.</p>
                <p>
                    <a class="btn btn-info" target="_blank" href="https://bootswatch.com/">Demo Page</a>
                    <a class="btn btn-info" target="_blank" href="https://github.com/thomaspark/bootswatch">github.com Project Link</a>
                </p>
            </div>
        </div>
    </div>
    <div class="form-row">
        <div class="col-6 col-sm-6 col-md-4 col-lg-2 col-xl-2 text-center">
            <a class="applyTheme" themeName="cerulean" href="javascript:void(0);">
                <img class="img-thumbnail" src="${pageContext.request.contextPath}/assets/img/themes/cerulean.png" alt=""/>
            </a>
        </div>
        <div class="col-6 col-sm-6 col-md-4 col-lg-2 col-xl-2 text-center">
            <a class="applyTheme" themeName="cosmo"  href="javascript:void(0);">
                <img class="img-thumbnail" src="${pageContext.request.contextPath}/assets/img/themes/cosmo.png" alt=""/>
            </a>
        </div>
        <div class="col-6 col-sm-6 col-md-4 col-lg-2 col-xl-2 text-center">
            <a class="applyTheme" themeName="cyborg"  href="javascript:void(0);">
                <img class="img-thumbnail" src="${pageContext.request.contextPath}/assets/img/themes/cyborg.png" alt=""/>
            </a>
        </div>
        <div class="col-6 col-sm-6 col-md-4 col-lg-2 col-xl-2 text-center">
            <a class="applyTheme" themeName="darkly"  href="javascript:void(0);">
                <img class="img-thumbnail" src="${pageContext.request.contextPath}/assets/img/themes/darkly.png" alt=""/>
            </a>
        </div>
        <div class="col-6 col-sm-6 col-md-4 col-lg-2 col-xl-2 text-center">
            <a class="applyTheme" themeName="flatly"  href="javascript:void(0);">
                <img class="img-thumbnail" src="${pageContext.request.contextPath}/assets/img/themes/flatly.png" alt=""/>
            </a>
        </div>
        <div class="col-6 col-sm-6 col-md-4 col-lg-2 col-xl-2 text-center">
            <a class="applyTheme" themeName="journal"  href="javascript:void(0);">
                <img class="img-thumbnail" src="${pageContext.request.contextPath}/assets/img/themes/journal.png" alt=""/>
            </a>
        </div>
    </div>
    <div class="form-row mt-3">
        <div class="col-6 col-sm-6 col-md-4 col-lg-2 col-xl-2 text-center">
            <a class="applyTheme" themeName="litera" href="javascript:void(0);">
                <img class="img-thumbnail" src="${pageContext.request.contextPath}/assets/img/themes/litera.png" alt=""/>
            </a>
        </div>
        <div class="col-6 col-sm-6 col-md-4 col-lg-2 col-xl-2 text-center">
            <a class="applyTheme" themeName="lumen"  href="javascript:void(0);">
                <img class="img-thumbnail" src="${pageContext.request.contextPath}/assets/img/themes/lumen.png" alt=""/>
            </a>
        </div>
        <div class="col-6 col-sm-6 col-md-4 col-lg-2 col-xl-2 text-center">
            <a class="applyTheme" themeName="lux"  href="javascript:void(0);">
                <img class="img-thumbnail" src="${pageContext.request.contextPath}/assets/img/themes/lux.png" alt=""/>
            </a>
        </div>
        <div class="col-6 col-sm-6 col-md-4 col-lg-2 col-xl-2 text-center">
            <a class="applyTheme" themeName="materia"  href="javascript:void(0);">
                <img class="img-thumbnail" src="${pageContext.request.contextPath}/assets/img/themes/materia.png" alt=""/>
            </a>
        </div>
        <div class="col-6 col-sm-6 col-md-4 col-lg-2 col-xl-2 text-center">
            <a class="applyTheme" themeName="minty"  href="javascript:void(0);">
                <img class="img-thumbnail" src="${pageContext.request.contextPath}/assets/img/themes/minty.png" alt=""/>
            </a>
        </div>
        <div class="col-6 col-sm-6 col-md-4 col-lg-2 col-xl-2 text-center">
            <a class="applyTheme" themeName="pulse"  href="javascript:void(0);">
                <img class="img-thumbnail" src="${pageContext.request.contextPath}/assets/img/themes/pulse.png" alt=""/>
            </a>
        </div>
    </div>
    <div class="form-row mt-3">
        <div class="col-6 col-sm-6 col-md-4 col-lg-2 col-xl-2 text-center">
            <a class="applyTheme" themeName="sandstone" href="javascript:void(0);">
                <img class="img-thumbnail" src="${pageContext.request.contextPath}/assets/img/themes/sandstone.png" alt=""/>
            </a>
        </div>
        <div class="col-6 col-sm-6 col-md-4 col-lg-2 col-xl-2 text-center">
            <a class="applyTheme" themeName="simplex"  href="javascript:void(0);">
                <img class="img-thumbnail" src="${pageContext.request.contextPath}/assets/img/themes/simplex.png" alt=""/>
            </a>
        </div>
        <div class="col-6 col-sm-6 col-md-4 col-lg-2 col-xl-2 text-center">
            <a class="applyTheme" themeName="sketchy"  href="javascript:void(0);">
                <img class="img-thumbnail" src="${pageContext.request.contextPath}/assets/img/themes/sketchy.png" alt=""/>
            </a>
        </div>
        <div class="col-6 col-sm-6 col-md-4 col-lg-2 col-xl-2 text-center">
            <a class="applyTheme" themeName="slate"  href="javascript:void(0);">
                <img class="img-thumbnail" src="${pageContext.request.contextPath}/assets/img/themes/slate.png" alt=""/>
            </a>
        </div>
        <div class="col-6 col-sm-6 col-md-4 col-lg-2 col-xl-2 text-center">
            <a class="applyTheme" themeName="solar"  href="javascript:void(0);">
                <img class="img-thumbnail" src="${pageContext.request.contextPath}/assets/img/themes/solar.png" alt=""/>
            </a>
        </div>
        <div class="col-6 col-sm-6 col-md-4 col-lg-2 col-xl-2 text-center">
            <a class="applyTheme" themeName="spacelab"  href="javascript:void(0);">
                <img class="img-thumbnail" src="${pageContext.request.contextPath}/assets/img/themes/spacelab.png" alt=""/>
            </a>
        </div>
    </div>
    <div class="form-row mt-3">
        <div class="col-6 col-sm-6 col-md-4 col-lg-2 col-xl-2 text-center">
            <a class="applyTheme" themeName="superhero" href="javascript:void(0);">
                <img class="img-thumbnail" src="${pageContext.request.contextPath}/assets/img/themes/superhero.png" alt=""/>
            </a>
        </div>
        <div class="col-6 col-sm-6 col-md-4 col-lg-2 col-xl-2 text-center">
            <a class="applyTheme" themeName="united"  href="javascript:void(0);">
                <img class="img-thumbnail" src="${pageContext.request.contextPath}/assets/img/themes/united.png" alt=""/>
            </a>
        </div>
        <div class="col-6 col-sm-6 col-md-4 col-lg-2 col-xl-2 text-center">
            <a class="applyTheme" themeName="yeti"  href="javascript:void(0);">
                <img class="img-thumbnail" src="${pageContext.request.contextPath}/assets/img/themes/yeti.png" alt=""/>
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