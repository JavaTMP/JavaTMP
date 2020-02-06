<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="dynamic-ajax-content grid-gutter-padding pt-3">
    <div class="form-row">
        <div class="col-xl-3 col-lg-6 col-md-6">
            <div class="card shadow mb-3">
                <div class="card-header">
                    ${labels['page.home.RegisteredUsers']}
                    <div class="options float-right">
                        <a load-on-starup="true"
                           href="${pageContext.request.contextPath}/pages/home/UserStatusPieChartCardletBody"
                           class="reload"
                           actionableWrapperType="ajax-area-in-card">
                            <i class="fa fa-sync"></i>
                        </a>
                    </div>
                </div>
                <div class="card-body p-1"></div>
                <div class="card-footer">
                    <a href="javascript:;" class="d-flex">
                        ${labels['global.viewDetails']}
                        <span class="ml-auto">
                            <i class="fa fa-arrow-circle-next"></i>
                        </span>
                    </a>
                </div>
            </div>
        </div>
        <div class="col-xl-3 col-lg-6 col-md-6">
            <div class="card shadow mb-3">
                <div class="card-header">
                    ${labels['page.home.VisitorsToday']}
                    <div class="options float-right">
                        <a load-on-starup="true"
                           href="${pageContext.request.contextPath}/pages/home/TodayVisitUserPieChartCardletBody"
                           class="reload"
                           actionableWrapperType="ajax-area-in-card">
                            <i class="fa fa-sync"></i>
                        </a>
                    </div>
                </div>
                <div class="card-body p-1"></div>
                <div class="card-footer">
                    <a href="javascript:;" class="d-flex">
                        ${labels['global.viewDetails']}
                        <span class="ml-auto">
                            <i class="fa fa-arrow-circle-next"></i>
                        </span>
                    </a>
                </div>
            </div>
        </div>
        <div class="col-xl-3 col-lg-6 col-md-6">
            <div class="card shadow mb-3">
                <div class="card-header">
                    ${labels['page.home.PageViewsPerHour']}
                    <div class="options float-right">
                        <a load-on-starup="true"
                           href="${pageContext.request.contextPath}/pages/home/PageViewActivitesPerHourCardletBody"
                           class="reload"
                           actionableWrapperType="ajax-area-in-card">
                            <i class="fa fa-sync"></i>
                        </a>
                    </div>
                </div>
                <div class="card-body p-1"></div>
                <div class="card-footer">
                    <a href="javascript:;" class="d-flex">
                        ${labels['global.viewDetails']}
                        <span class="ml-auto">
                            <i class="fa fa-arrow-circle-next"></i>
                        </span>
                    </a>
                </div>
            </div>
        </div>
        <div class="col-xl-3 col-lg-6 col-md-6">
            <div class="card shadow mb-3">
                <div class="card-header">
                    ${labels['page.home.LoadTimePerHour']}
                    <div class="options float-right">
                        <a load-on-starup="true"
                           href="${pageContext.request.contextPath}/pages/home/LoadtimePerHourChartCardletBody"
                           class="reload"
                           actionableWrapperType="ajax-area-in-card">
                            <i class="fa fa-sync"></i>
                        </a>
                    </div>
                </div>
                <div class="card-body p-1"></div>
                <div class="card-footer">
                    <a href="javascript:;" class="d-flex">
                        ${labels['global.viewDetails']}
                        <span class="ml-auto">
                            <i class="fa fa-arrow-circle-next"></i>
                        </span>
                    </a>
                </div>
                </a>
            </div>
        </div>
    </div>
    <div class="form-row">
        <div class="col-lg-6">
            <div class="card shadow mb-3">
                <div class="card-header">
                    ${labels['page.home.UsersLocations']}
                    <div class="options float-right">
                        <a load-on-starup="true"
                           href="${pageContext.request.contextPath}/pages/home/UsersLocationsInTheWorldCardletBody"
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
        <div class="col-lg-6">
            <div class="card shadow mb-3">
                <div class="card-header">
                    ${labels['page.home.UsersBirthdayPerMonths']}
                    <div class="options float-right">
                        <a load-on-starup="true"
                           href="${pageContext.request.contextPath}/pages/home/UsersBirthdayPerMonthsCardletBody"
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