<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="dynamic-ajax-content pt-3">
    <div class="form-row">
        <div class="col-xl-3 col-lg-6 col-md-6">
            <div class="card shadow mb-3 bg-white" id="userStatusPieChartCard">
                <div class="card-header bg-white">
                    ${labels['page.home.RegisteredUsers']}
                    <div class="options float-right">
                        <a load-on-starup="true" href="${pageContext.request.contextPath}/pages/home/UserStatusPieChartCardletBody" class="reload"><i class="fa fa-sync"></i></a>
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
                        <a load-on-starup="true" href="${pageContext.request.contextPath}/pages/home/TodayVisitUserPieChartCardletBody" class="reload"><i class="fa fa-sync"></i></a>
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
                        <a load-on-starup="true" href="${pageContext.request.contextPath}/pages/home/PageViewActivitesPerHourCardletBody" class="reload">
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
                        <a load-on-starup="true" href="${pageContext.request.contextPath}/pages/home/LoadtimePerHourChartCardletBody" class="reload"><i class="fa fa-sync"></i></a>
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
                        <a load-on-starup="true" href="${pageContext.request.contextPath}/pages/home/UsersLocationsInTheWorldCardletBody" class="reload"><i class="fa fa-sync"></i></a>
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
                        <a load-on-starup="true" href="${pageContext.request.contextPath}/pages/home/UsersBirthdayPerMonthsCardletBody" class="reload"><i class="fa fa-sync"></i></a>
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

            var usersStatusCardletBody = $("#userStatusPieChartCard > .card-body");
            window.javatmp.plugins.bootstrapActionableWrapper(usersStatusCardletBody);

            $(javatmp.settings.defaultOutputSelector).on("click", "#userStatusPieChartCard a.reload", function (e) {
                usersStatusCardletBody.BootstrapActionable("populateByLinkEvent", {
                    linkElement: $(this), linkEvent: e
                });
            });

            var todayVisitUserCardletBody = $("#todayVisitUserPieChartCard > .card-body");
            window.javatmp.plugins.bootstrapActionableWrapper(todayVisitUserCardletBody);
            $(javatmp.settings.defaultOutputSelector).on("click", "#todayVisitUserPieChartCard a.reload", function (e) {
                todayVisitUserCardletBody.BootstrapActionable("populateByLinkEvent", {
                    linkElement: $(this), linkEvent: e
                });
            });

            var pageViewActivitesPerHourChartCard = $("#pageViewActivitesPerHourChartCard > .card-body");
            window.javatmp.plugins.bootstrapActionableWrapper(pageViewActivitesPerHourChartCard);

            $(javatmp.settings.defaultOutputSelector).on("click", "#pageViewActivitesPerHourChartCard a.reload", function (e) {
                pageViewActivitesPerHourChartCard.BootstrapActionable("populateByLinkEvent", {
                    linkElement: $(this), linkEvent: e
                });
            });

            var loadtimePerHourChartCard = $("#loadtimePerHourChartCard > .card-body");
            window.javatmp.plugins.bootstrapActionableWrapper(loadtimePerHourChartCard);
            $(javatmp.settings.defaultOutputSelector).on("click", "#loadtimePerHourChartCard a.reload", function (e) {
                loadtimePerHourChartCard.BootstrapActionable("populateByLinkEvent", {
                    linkElement: $(this), linkEvent: e
                });
            });

            var UsersLocationsInTheWorldCard = $("#UsersLocationsInTheWorldCard > .card-body");
            window.javatmp.plugins.bootstrapActionableWrapper(UsersLocationsInTheWorldCard);
            $(javatmp.settings.defaultOutputSelector).on("click", "#UsersLocationsInTheWorldCard a.reload", function (e) {
                UsersLocationsInTheWorldCard.BootstrapActionable("populateByLinkEvent", {
                    linkElement: $(this), linkEvent: e
                });
            });

            var UsersBirthdayPerMonthsCard = $("#UsersBirthdayPerMonthsCard > .card-body");
            window.javatmp.plugins.bootstrapActionableWrapper(UsersBirthdayPerMonthsCard);
            $(javatmp.settings.defaultOutputSelector).on("click", "#UsersBirthdayPerMonthsCard a.reload", function (e) {
                UsersBirthdayPerMonthsCard.BootstrapActionable("populateByLinkEvent", {
                    linkElement: $(this), linkEvent: e
                });
            });

            $(javatmp.settings.defaultOutputSelector).on(javatmp.settings.javaTmpAjaxContainerReady, function (event) {
                // fire AFTER all transition done and your ajax content is shown to user.
                $(javatmp.settings.defaultOutputSelector).find("[load-on-starup=true]").each(function () {
                    $(this).trigger("click");
                });
            });
            $(javatmp.settings.defaultOutputSelector).on(javatmp.settings.javaTmpContainerResizeEventName, function (event) {
                // fire when user resize browser window or sidebar hide / show
                // we resize the current charts:
                javatmp.util.waitForFinalEvent(function () {
                    UsersLocationsInTheWorldCard.triggerHandler(javatmp.settings.javaTmpContainerResizeEventName);
                    UsersBirthdayPerMonthsCard.triggerHandler(javatmp.settings.javaTmpContainerResizeEventName);
                }, 100, "@users-dashboard-page-resize");
            });

            $(javatmp.settings.defaultOutputSelector).on(javatmp.settings.cardFullscreenCompress, function (event, card) {
                // when card compress by pressing the top right tool button
                var cardId = card.attr("id");
                if (cardId === "UsersLocationsInTheWorldCard") {
                    $('#UsersLocationsInTheWorld').css({"minHeight": 300});
                    UsersLocationsInTheWorldCard.triggerHandler(javatmp.settings.cardFullscreenCompress, card);
                } else if (cardId === "UsersBirthdayPerMonthsCard") {
                    $('#UsersBirthdayPerMonths').css({"minHeight": 300});
                    UsersBirthdayPerMonthsCard.triggerHandler(javatmp.settings.cardFullscreenCompress, card);
                }
            });
            $(javatmp.settings.defaultOutputSelector).on(javatmp.settings.cardFullscreenExpand, function (event, card) {
                // when card compress by pressing the top right tool button
                var cardId = card.attr("id");
                if (cardId === "UsersLocationsInTheWorldCard") {
                    $('#UsersLocationsInTheWorld').css({"minHeight": 700});
                    UsersLocationsInTheWorldCard.triggerHandler(javatmp.settings.cardFullscreenExpand, card);
                } else if (cardId === "UsersBirthdayPerMonthsCard") {
                    $('#UsersBirthdayPerMonths').css({"minHeight": 500});
                    UsersBirthdayPerMonthsCard.triggerHandler(javatmp.settings.cardFullscreenExpand, card);
                }
            });
            /**
             * When another sidebar menu item pressed and before container replaced with new ajax content.
             * You can cancel, destroy, or remove any thing here before replace main output ajax container.
             * returning false will cancel the new request and do nothing.
             *
             * @@argument event event event may reference the event that causes the request to destroy.
             **/
            $(javatmp.settings.defaultOutputSelector).on(javatmp.settings.javaTmpContainerRemoveEventName, function (event) {
                $(javatmp.settings.defaultOutputSelector).off(javatmp.settings.cardFullscreenCompress);
                $(javatmp.settings.defaultOutputSelector).off(javatmp.settings.cardFullscreenExpand);
                $(javatmp.settings.defaultOutputSelector).off("click");
                return true;
            });
        });
    </script>
</div>