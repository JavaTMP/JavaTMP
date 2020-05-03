<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="dynamic-ajax-content grid-gutter-padding pt-3">
    <div class="form-row">
        <div class="col-md-6">
            <div class="card shadow mb-3">
                <div class="card-header">
                    Static USA
                    <div class="options float-right">
                        <a load-on-starup="true"
                           href="${pageContext.request.contextPath}/pages/static/chart/echarts-cardlet/map/USAMapCardlet"
                           class="reload"
                           actionableWrapperType="ajax-area-in-card">
                            <i class="fa fa-sync"></i>
                        </a>
                        <a href="javascript:;" class="fullscreen"><i class=" fa fa-expand"></i></a>
                    </div>
                </div>
                <div class="card-body p-0"></div>
            </div>
        </div>
        <div class="col-md-6">
            <div class="card shadow mb-3">
                <div class="card-header">
                    Static UAE
                    <div class="options float-right">
                        <a load-on-starup="true"
                           href="${pageContext.request.contextPath}/pages/static/chart/echarts-cardlet/map/UAEMapCardlet"
                           class="reload"
                           actionableWrapperType="ajax-area-in-card">
                            <i class="fa fa-sync"></i>
                        </a>
                        <a href="javascript:;" class="fullscreen"><i class=" fa fa-expand"></i></a>
                    </div>
                </div>
                <div class="card-body p-0"></div>
            </div>
        </div>
    </div>
    <div class="form-row">
        <div class="col-md-12">
            <div class="card shadow mb-3">
                <div class="card-header">
                    World With scatter type
                    <div class="options float-right">
                        <a load-on-starup="true"
                           href="${pageContext.request.contextPath}/pages/static/chart/echarts-cardlet/map/WorldMapWithScatterCardlet"
                           class="reload"
                           actionableWrapperType="ajax-area-in-card">
                            <i class="fa fa-sync"></i>
                        </a>
                        <a href="javascript:;" class="fullscreen"><i class=" fa fa-expand"></i></a>
                    </div>
                </div>
                <div class="card-body p-0"></div>
            </div>
        </div>
    </div>
    <style type="text/css">
    </style>
    <script type="text/javascript">
        jQuery(function ($) {
            $(javatmp.settings.defaultOutputSelector).on(javatmp.settings.javaTmpAjaxContainerReady, function (event) {
                $(javatmp.settings.defaultOutputSelector).find("[load-on-starup=true]").each(function () {
                    $(this).trigger("click");
                });
                $(javatmp.settings.defaultOutputSelector).on(javatmp.settings.javaTmpContainerRemoveEventName, function (event) {
                    $(javatmp.settings.defaultOutputSelector).off("click");
                    return true;
                });
            });
        });
    </script>
</div>
