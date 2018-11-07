<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div id="UsersMngHomePageDynamicAjaxCont" class="dynamic-ajax-content pt-3">
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
                <div class="card-body bg-white p-0">
                </div>
            </div>
        </div>
        <div class="col-lg-6">
            <div class="card shadow mb-3 bg-white" id="UsersBirthdayPerMonthsCard">
                <div class="card-header bg-white">
                    ${labels['page.home.UsersBirthdayPerMonths']}
                    <div class="options float-right">
                        <a load-on-starup="true" href="javascript:;" class="reload"><i class="fa fa-sync"></i></a>
                        <a href="javascript:;" class="fullscreen"><i class=" fa fa-expand"></i></a>
                    </div>
                </div>
                <div class="card-body bg-white p-0">
                    <div class="row">
                        <div class="col-lg-12">
                            <div id="UsersBirthdayPerMonths" style="min-height: 300px"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <style type="text/css">
        /*        #UsersMngHomePageDynamicAjaxCont .card {
                    -webkit-box-shadow: 0 10px 40px 0 rgba(62, 57, 107, 0.07), 0 2px 9px 0 rgba(62, 57, 107, 0.06);
                    box-shadow: 0 10px 40px 0 rgba(62, 57, 107, 0.07), 0 2px 9px 0 rgba(62, 57, 107, 0.06);
                }*/
    </style>
    <script type="text/javascript">
        jQuery(function ($) {
            // any code put here will be run after content attach to ajax output container and before
            // controll return to main javascript file.

            var formatTooltipLine = function (color, value) {
                return "<span style='display:inline-block;width:10px;height:10px;border-radius:50%;background-color:" + color + ";margin-" + javatmp.settings.floatReverse + ":5px;'></span><span>" + value + "</span>";
            };

            var formaterFunction = null;
            if (javatmp.settings.isRTL === true) {
                formaterFunction = function (params) {
                    var retStr = "";
                    for (var i = 0; i < params.length; i++) {
                        retStr += [
                            '<span>' + params[i].axisValue + '</span>',
                            "<br/>",
                            formatTooltipLine(params[i].color, params[i].seriesName + ':' + params[i].data)
                        ].join('');
                    }
                    return retStr;
                };
            }

            $('.counter').counterUp({
                delay: 0,
                time: 500
            });

            var UsersBirthdayPerMonths = echarts.init(document.getElementById('UsersBirthdayPerMonths'));

            var monthsName = moment.months();

            var barChartOption = {
                grid: {
                    show: false,
                    top: 30,
                    bottom: 30,
                    left: 30,
                    right: 30
                },
                title: {
                    show: false,
                    text: "${labels['page.home.UsersBirthdayPerMonths']}",
                    x: 'center',
                    y: 0,
                    textStyle: {
                        fontFamily: $("body").css("font-family"),
                        fontSize: $("body").css("font-size"),
                        align: javatmp.settings.floatDefault
                    }
                },
                tooltip: {
                    trigger: 'axis',
                    textStyle: {
                        fontFamily: $("body").css("font-family"),
                        fontSize: $("body").css("font-size"),
                        align: javatmp.settings.floatDefault
                    },
                    formatter: formaterFunction
                },
                legend: {
                    show: false,
                    align: javatmp.settings.floatDefault,
                    data: ['Birthday'],
                    x: 'center',
                    y: '30px',
                    textStyle: {
                        fontFamily: $("body").css("font-family"),
                        fontSize: $("body").css("font-size"),
                        align: javatmp.settings.floatDefault
                    }
                },
                calculable: true,
                xAxis: [
                    {
                        inverse: javatmp.settings.isRTL,
                        data: monthsName,
//                    axisLabel: {
//                        interval: 0
//                    },
                        axisLabel: {
                            fontFamily: $("body").css("font-family"),
                            fontSize: $("body").css("font-size")
                        },
                        textStyle: {
                            fontFamily: $("body").css("font-family"),
                            fontSize: $("body").css("font-size"),
                            align: javatmp.settings.floatDefault
                        }
                    }
                ],
                yAxis: {
                    position: javatmp.settings.floatDefault,
                    type: 'value',
                    textStyle: {
                        fontFamily: $("body").css("font-family"),
                        fontSize: $("body").css("font-size"),
                        align: javatmp.settings.floatDefault
                    }
                },
                color: ['#007bff'],
                series: [{
                        name: '${labels['page.home.UsersBirthdayPerMonths']}',
                        type: 'bar',
                        data: []
                    }]
            };

            UsersBirthdayPerMonths.setOption(barChartOption);
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

            $(javatmp.settings.defaultOutputSelector).on("click", "#UsersBirthdayPerMonthsCard a.reload", function (e) {
                e.preventDefault();

                var cardBody = $(this).closest(".card").children(".card-body");
                var href = javatmp.settings.contextPath + "/stats/GetUsersBirthdayCountController";

                $(cardBody).block({message: javatmp.settings.labels["global.loadingText"],
                    overlayCSS: {
                        backgroundColor: '#000',
                        opacity: 0.7
                    }});

                $.ajax({
                    "type": "POST",
                    cache: false,
                    url: href,
                    dataType: "json",
                    contentType: "application/json; charset=UTF-8",
                    data: null,
                    success: function (remoteContent) {
                        var dataArray = remoteContent.data;

                        var outputMonthsArray = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
                        for (var i = 0; i < dataArray.length; i++) {
                            outputMonthsArray[dataArray[i][0] - 1] += dataArray[i][1];
                        }

                        barChartOption.series[0].data = outputMonthsArray;

                        UsersBirthdayPerMonths.setOption(barChartOption);

                        UsersBirthdayPerMonths.on('click', function (params) {
                            console.log(params);
                        });

                        UsersBirthdayPerMonths.on('legendselectchanged', function (params) {
                            console.log(params);
                        });

                        $(cardBody).unblock();
                    },
                    error: function (xhr, ajaxOptions, thrownError) {
                        $(cardBody).unblock();
                        var msg = 'Error on reloading the card. Please check your remote server url';
                        toastr.error(msg, 'ERROR', {
                            timeOut: 2500,
                            progressBar: true,
                            rtl: javatmp.settings.isRTL,
                            positionClass: javatmp.settings.isRTL === true ? "toast-top-left" : "toast-top-right"
                        });
                        // clean the bar graph
                    }
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
                    UsersBirthdayPerMonths.resize();
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
                    UsersBirthdayPerMonths.resize();
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
                    UsersBirthdayPerMonths.resize();
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