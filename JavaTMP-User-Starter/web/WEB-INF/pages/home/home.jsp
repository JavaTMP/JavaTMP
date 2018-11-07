<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="dynamic-ajax-content pt-3">
    <div class="form-row">
        <div class="col-xl-3 col-lg-6 col-md-6">
            <div class="card shadow mb-3 bg-white" id="userStatusPieChartCard">
                <div class="card-header bg-white">
                    ${labels['page.home.RegisteredUsers']}
                    <div class="options float-right">
                        <a load-on-starup="true"
                           href="${pageContext.request.contextPath}/pages/home/UserStatusPieChartCardletBody"
                           class="reload"
                           actionType="ajax-area-in-card">
                            <i class="fa fa-sync"></i>
                        </a>
                    </div>
                </div>
                <div class="card-body p-1"></div>
                <div class="card-footer bg-white">
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
            <div class="card shadow mb-3 bg-white" id="todayVisitUserPieChartCard">
                <div class="card-header bg-white">
                    ${labels['page.home.VisitorsToday']}
                    <div class="options float-right">
                        <a load-on-starup="true"
                           href="${pageContext.request.contextPath}/pages/home/TodayVisitUserPieChartCardletBody"
                           class="reload"
                           actionType="ajax-area-in-card">
                            <i class="fa fa-sync"></i>
                        </a>
                    </div>
                </div>
                <div class="card-body p-1 bg-white"></div>
                <div class="card-footer bg-white">
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
            <div class="card shadow mb-3 bg-white" id="pageViewActivitesPerHourChartCard">
                <div class="card-header bg-white">
                    ${labels['page.home.PageViewsPerHour']}
                    <div class="options float-right">
                        <a load-on-starup="true"
                           href="${pageContext.request.contextPath}/pages/home/PageViewActivitesPerHourCardletBody"
                           class="reload"
                           actionType="ajax-area-in-card">
                            <i class="fa fa-sync"></i>
                        </a>
                    </div>
                </div>
                <div class="card-body p-1 bg-white"></div>
                <div class="card-footer bg-white">
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
            <div class="card shadow mb-3 bg-white" id="loadtimePerHourChartCard">
                <div class="card-header bg-white">
                    ${labels['page.home.LoadTimePerHour']}
                    <div class="options float-right">
                        <a load-on-starup="true"
                           href="${pageContext.request.contextPath}/pages/home/LoadtimePerHourChartCardletBody"
                           class="reload"
                           actionType="ajax-area-in-card">
                            <i class="fa fa-sync"></i>
                        </a>
                    </div>
                </div>
                <div class="card-body p-1 bg-white"></div>
                <div class="card-footer bg-white">
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
            <div class="card shadow mb-3 bg-white" id="UsersLocationsInTheWorldCard">
                <div class="card-header bg-white">
                    ${labels['page.home.UsersLocations']}
                    <div class="options float-right">
                        <a load-on-starup="true"
                           href="${pageContext.request.contextPath}/pages/home/UsersLocationsInTheWorldCardletBody"
                           class="reload"
                           actionType="ajax-area-in-card">
                            <i class="fa fa-sync"></i>
                        </a>
                        <a href="javascript:;" class="fullscreen"><i class=" fa fa-expand"></i></a>
                    </div>
                </div>
                <div class="card-body bg-white p-0"></div>
            </div>
        </div>
        <div class="col-lg-6">
            <div class="card shadow mb-3 bg-white" id="UsersBirthdayPerMonthsCard">
                <div class="card-header bg-white">
                    ${labels['page.home.UsersBirthdayPerMonths']}
                    <div class="options float-right">
                        <a load-on-starup="true"
                           href="${pageContext.request.contextPath}/pages/home/UsersBirthdayPerMonthsCardletBody"
                           class="reload"
                           actionType="ajax-area-in-card">
                            <i class="fa fa-sync"></i>
                        </a>
                        <a href="javascript:;" class="fullscreen"><i class=" fa fa-expand"></i></a>
                    </div>
                </div>
                <div class="card-body bg-white p-0"></div>
            </div>
        </div>
    </div>
    <style type="text/css">
    </style>
    <script type="text/javascript">
        jQuery(function ($) {
            $("body").on("click", '[actionType]', function (event) {
                var actionType = $(this).attr("actionType") ? $(this).attr("actionType") : "ajax";
                if (actionType === "ajax-area-in-card") {
                    var actionOutputArea = $(this).closest(".card").children(".card-body");
                    window.javatmp.plugins.bootstrapActionableWrapper(actionOutputArea)
                            .BootstrapActionable("populateByLinkEvent", {
                                linkElement: $(this), linkEvent: event
                            });
                }
            });
            $(javatmp.settings.defaultOutputSelector).on(javatmp.settings.javaTmpAjaxContainerReady, function (event) {
                $(javatmp.settings.defaultOutputSelector).find("[load-on-starup=true]").each(function () {
                    $(this).trigger("click");
                });
            });
            $(javatmp.settings.defaultOutputSelector).on(javatmp.settings.javaTmpContainerRemoveEventName, function (event) {
                $(javatmp.settings.defaultOutputSelector).off("click");
                $("body").off("click", '[actionType]');
                return true;
            });
        });
    </script>
</div>