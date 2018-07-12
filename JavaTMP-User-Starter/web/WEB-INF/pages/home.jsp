<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="dynamic-ajax-content">
    <div class="row">
        <div class="col-lg-3 col-md-6">
            <div class="card my-3">
                <div class="card-header">
                    Registered Users
                </div>
                <div class="card-body p-1 bg-light">
                    <div class="row d-flex align-items-center">
                        <div class="col-6 text-center">
                            <span class="d-block display-4 counter">26</span>
                        </div>
                        <div class="col-6 text-left">
                            <div id="userStatusPieChart" style="width: 100%;min-height: 100px"></div>
                        </div>
                    </div>
                </div>
                <div class="card-footer">
                    <a href="#" actionType="action-ref-href" action-ref-by-href="${pageContext.request.contextPath}/user/GetListUsersPage">
                        View Details
                        <span class="float-right">
                            <i class="fa fa-arrow-circle-right"></i>
                        </span>
                    </a>
                </div>
            </div>
        </div>
        <div class="col-lg-3 col-md-6">
            <div class="card my-3">
                <div class="card-header">
                    Visitors Today
                </div>
                <div class="card-body p-1 bg-light">
                    <div class="row d-flex align-items-center">
                        <div class="col-6 text-center">
                            <span class="d-block display-4 counter">1</span>
                        </div>
                        <div class="col-6 text-left">
                            <div id="todayVisitUserPieChart" style="width: 100%;min-height: 100px"></div>
                        </div>
                    </div>
                </div>
                <div class="card-footer">
                    <a href="#" actionType="action-ref-href" action-ref-by-href="${pageContext.request.contextPath}/user/GetListUsersPage">
                        View Details
                        <span class="float-right">
                            <i class="fa fa-arrow-circle-right"></i>
                        </span>
                    </a>
                </div>
            </div>
        </div>
        <div class="col-lg-3 col-md-6">
            <div class="card my-3">
                <div class="card-header">
                    Page Views Per Hour
                </div>
                <div class="card-body p-1 bg-light">
                    <div class="row d-flex align-items-center">
                        <div class="col-6 text-center">
                            <span class="d-block display-4 counter">527</span>
                            <span class="d-block muted small">all Page Views</span>
                        </div>
                        <div class="col-6 text-left">
                            <div id="pageViewActivitesPerHourChart" style="width: 100%;min-height: 100px"></div>
                        </div>
                    </div>
                </div>
                <div class="card-footer">
                    <a href="#" actionType="action-ref-href" action-ref-by-href="${pageContext.request.contextPath}/user/GetListUsersPage">
                        View Details
                        <span class="float-right">
                            <i class="fa fa-arrow-circle-right"></i>
                        </span>
                    </a>
                </div>
            </div>
        </div>
        <div class="col-lg-3 col-md-6">
            <div class="card my-3">
                <div class="card-header">
                    Load Time Per Hour
                </div>
                <div class="card-body p-1 bg-light">
                    <div class="row d-flex align-items-center">
                        <div class="col-6 text-center">
                            <span class="d-block display-4 counter">211</span>
                            <span class="d-block muted small">Avg Load Time</span>
                        </div>
                        <div class="col-6 text-left">
                            <div id="loadtimePerHourChart" style="width: 100%;min-height: 100px"></div>
                        </div>
                    </div>
                </div>
                <div class="card-footer">
                    <a href="#" actionType="action-ref-href" action-ref-by-href="${pageContext.request.contextPath}/user/GetListUsersPage">
                        View Details
                        <span class="float-right">
                            <i class="fa fa-arrow-circle-right"></i>
                        </span>
                    </a>
                </div>
                </a>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-lg-6">
            <div class="card" id="BarChart">
                <div class="card-header">
                    Bar Chart
                    <div class="options float-right">
                        <a href="javascript:;" class="settings"><i class="fa fa-cog"></i></a>
                        <a href="javascript:;" class="collapse"><i class="fa fa-chevron-up"></i></a>
                        <a load-on-starup="true" href="javascript:;" class="reload"><i class="fa fa-sync"></i></a>
                        <a href="javascript:;" class="fullscreen"><i class=" fa fa-expand"></i></a>
                        <a href="javascript:;" class="remove"><i class="fa fa-times"></i></a>
                    </div>
                </div>
                <div class="card-body bg-light">
                    <div class="row">
                        <div class="col-lg-12">
                            <div id="bar-1-canvas" style="width: 100%;min-height: 300px"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-6">
            <div class="card" id="BarChart">
                <div class="card-header">
                    Quick Shortcut Buttons
                    <div class="options float-right">
                        <a href="javascript:;" class="settings"><i class="fa fa-cog"></i></a>
                        <a href="javascript:;" class="collapse"><i class="fa fa-chevron-up"></i></a>
                        <a load-on-starup="true" href="javascript:;" class="reload"><i class="fa fa-sync"></i></a>
                        <a href="javascript:;" class="fullscreen"><i class=" fa fa-expand"></i></a>
                        <a href="javascript:;" class="remove"><i class="fa fa-times"></i></a>
                    </div>
                </div>
                <div class="card-body bg-light">
                    <div class="form-row">
                        <div class="col-6 col-sm-6 col-md-6 col-lg-3 col-xl-3 text-center">
                            <button type="button" class="javatmp-btn btn btn-primary btn-block my-2"
                                actionType="action-ref-href" action-ref-by-href="${pageContext.request.contextPath}/user/GetListUsersPage" >
                                User List
                            </button>
                        </div>
                        <div class="col-6 col-sm-6 col-md-6 col-lg-3 col-xl-3 text-center">
                            <button type="button" class="javatmp-btn btn btn-primary btn-block my-2"
                                actionType="action-ref-href" action-ref-by-href="${pageContext.request.contextPath}/user/CreateUserController">
                                Add New User
                            </button>
                        </div>
                        <div class="col-6 col-sm-6 col-md-6 col-lg-3 col-xl-3 text-center">
                            <button type="button" class="javatmp-btn btn btn-primary btn-block my-2"
                                actionType="action-ref-href" action-ref-by-href="${pageContext.request.contextPath}/pages/user/current-user-profile" >
                                Current User Profile
                            </button>
                        </div>
                        <div class="col-6 col-sm-6 col-md-6 col-lg-3 col-xl-3 text-center">
                            <button type="button" class="logout-home-btn-id javatmp-btn btn btn-primary btn-block my-2"
                                actionType="action-ref-href" action-ref-by-href="${pageContext.request.contextPath}/logout" >
                                Logout
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <style type="text/css">
        .javatmp-btn {
            height: 100px;
            white-space: normal;
            max-width: 215px;
            margin: auto;
        }
        .javatmp-btn:hover {
            cursor: pointer;
        }
        .javatmp-btn > i {
            display: block;
        }
    </style>
    <script type="text/javascript">
        jQuery(function ($) {
            // any code put here will be run after content attach to ajax output container and before
            // controll return to main javascript file.

            $('.counter').counterUp({
                delay: 10,
                time: 1000
            });

            var userStatusPieChart = echarts.init(document.getElementById('userStatusPieChart'));
            var todayVisitUserPieChart = echarts.init(document.getElementById('todayVisitUserPieChart'));
            var pageViewActivitesPerHourChart = echarts.init(document.getElementById('pageViewActivitesPerHourChart'));

            var option = {
                tooltip: {
                    trigger: 'item',
                    formatter: "{a} <br/>{b}: {c} ({d}%)",
                    textStyle: {
                        fontFamily: "Open Sans",
                        align: javatmp.settings.floatDefault
                    }
                },
                hover: true,
                color: ['#28a745', '#ffc107'],
                series: [
                    {
                        clockwise: !javatmp.settings.isRTL,
                        name: 'Registered User Statuses',
                        type: 'pie',
                        radius: '85%',
                        avoidLabelOverlap: false,
                        hoverOffset: 4,
                        label: {
                            normal: {
                                show: false,
                                position: 'center'
                            },
                            textStyle: {
                                fontFamily: "Open Sans",
                                align: javatmp.settings.floatDefault
                            }
                        },
                        data: [
                            {value: 18, name: 'Active'},
                            {value: 32, name: 'Deactive'}
                        ]
                    }
                ]
            };

            userStatusPieChart.setOption(option);

            var todayVisitUserPieChartOption = {
                tooltip: {
                    trigger: 'item',
                    formatter: "{a} <br/>{b}: {c} ({d}%)",
                    textStyle: {
                        fontFamily: "Open Sans",
                        align: javatmp.settings.floatDefault
                    }
                },
                hover: true,
                color: ['#007bff', '#dae0e5'],
                series: [
                    {
                        clockwise: !javatmp.settings.isRTL,
                        name: 'Visiting User Today',
                        type: 'pie',
                        radius: '85%',
                        avoidLabelOverlap: false,
                        hoverOffset: 4,
                        label: {
                            normal: {show: false},
                            textStyle: {
                                fontFamily: "Open Sans",
                                align: javatmp.settings.floatDefault
                            }
                        },
                        data: [
                            {value: 1, name: 'Visit'},
                            {value: 25, name: 'Not login yet'}
                        ]
                    }
                ]
            };

            todayVisitUserPieChart.setOption(todayVisitUserPieChartOption);

            var formaterFunction = null;

            if (javatmp.settings.isRTL === true) {
                formaterFunction = function (params) {
                    return [
                        '<span>' + params[0].axisValue + '</span>',
                        "<br/>",
                        formatTooltipLine(params[0].color, params[0].seriesName + ':' + params[0].data)
                    ].join('');
                };
            }

            var pageViewActivitesPerHourChartOption = {
                grid: {
                    show: false,
                    top: 5,
                    bottom: 15,
                    left: 0,
                    right: 0
                },
                title: {
                    show: false,
                    text: "Users Page View Frequencies Per Hours",
                    x: 'center',
                    y: 0,
                    textStyle: {
                        fontFamily: "Open Sans",
                        align: javatmp.settings.floatDefault
                    }
                },
                tooltip: {
                    trigger: 'axis',
                    textStyle: {
                        fontFamily: "Open Sans",
                        align: javatmp.settings.floatDefault
                    },
                    formatter: formaterFunction
                },
                legend: {
                    show: false,
                    align: javatmp.settings.floatDefault,
                    data: ['Page View'],
                    x: 'center',
                    y: '30px',
                    textStyle: {
                        fontFamily: "Open Sans",
                        align: javatmp.settings.floatDefault
                    }
                },
                calculable: true,
                xAxis: [
                    {
                        show: false,
                        inverse: javatmp.settings.isRTL,
                        data: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23],
                        //                        axisLabel: {
                        //                            interval: 0
                        //                        },
                        textStyle: {
                            fontFamily: "Open Sans",
                            align: javatmp.settings.floatDefault
                        }
                    }
                ],
                yAxis: [
                    {
                        show: false,
                        position: javatmp.settings.floatDefault,
                        type: 'value',
                        textStyle: {
                            fontFamily: "Open Sans",
                            align: javatmp.settings.floatDefault
                        }
                    }
                ],
                color: ['#007bff'],
                series: [
                    {
                        name: 'Pages Per Hour',
                        type: 'bar',
                        data: []
                    }
                ]
            };

            pageViewActivitesPerHourChartOption = $.extend(true, pageViewActivitesPerHourChartOption, {
                series: [
                    {
                        data: [24, 44, 81, 11, 32, 41, 27, 5, 4, 71, 51, 22, 0, 0, 43, 451, 413, 90, 27, 5, 4, 71, 51, 22]
                    }
                ]
            });
            pageViewActivitesPerHourChart.setOption(pageViewActivitesPerHourChartOption);

            var loadtimePerHourChartOption = {
                grid: {
                    show: false,
                    top: 5,
                    bottom: 15,
                    left: 0,
                    right: 0
                },
                title: {
                    show: false,
                    text: "Users Page View Frequencies Per Hours",
                    x: 'center',
                    y: 0,
                    textStyle: {
                        fontFamily: "Open Sans",
                        align: javatmp.settings.floatDefault
                    }
                },
                tooltip: {
                    trigger: 'axis',
                    textStyle: {
                        fontFamily: "Open Sans",
                        align: javatmp.settings.floatDefault
                    },
                    formatter: formaterFunction
                },
                legend: {
                    show: false,
                    align: javatmp.settings.floatDefault,
                    data: ['Page View'],
                    x: 'center',
                    y: '30px',
                    textStyle: {
                        fontFamily: "Open Sans",
                        align: javatmp.settings.floatDefault
                    }
                },
                calculable: true,
                xAxis: [
                    {
                        show: false,
                        inverse: javatmp.settings.isRTL,
                        data: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23],
                        //                        axisLabel: {
                        //                            interval: 0
                        //                        },
                        textStyle: {
                            fontFamily: "Open Sans",
                            align: javatmp.settings.floatDefault
                        }
                    }
                ],
                yAxis: [
                    {
                        show: false,
                        position: javatmp.settings.floatDefault,
                        type: 'value',
                        textStyle: {
                            fontFamily: "Open Sans",
                            align: javatmp.settings.floatDefault
                        }
                    }
                ],
                color: ['#dc3545'],
                series: [
                    {
                        name: 'Average Load Time Per Hour',
                        type: 'line',
                        data: []
                    }
                ]
            };

            loadtimePerHourChartOption = $.extend(true, loadtimePerHourChartOption, {
                series: [
                    {
                        data: [24, 44, 81, 11, 32, 41, 27, 5, 4, 71, 51, 22, 24, 44, 81, 11, 32, 41, 27, 5, 4, 71, 51, 22]
                    }
                ]
            });

            var loadtimePerHourChart = echarts.init(document.getElementById('loadtimePerHourChart'));
            loadtimePerHourChart.setOption(loadtimePerHourChartOption);

            var monthsName = moment.months();
            var barChartOption = {
                title: {
                    text: "Users Birthday Frequencies",
                    x: 'center',
                    y: 0,
                    textStyle: {
                        fontFamily: "Open Sans",
                        align: javatmp.settings.floatDefault
                    }
                },
                tooltip: {
                    trigger: 'axis',
                    textStyle: {
                        fontFamily: "Open Sans",
                        align: javatmp.settings.floatDefault
                    },
                    formatter: formaterFunction
                },
                legend: {
                    align: javatmp.settings.floatDefault,
                    data: ['Birthday'],
                    x: 'center',
                    y: '30px',
                    textStyle: {
                        fontFamily: "Open Sans",
                        align: javatmp.settings.floatDefault
                    }
                },
                calculable: true,
                xAxis: [
                    {
                        inverse: javatmp.settings.isRTL,
                        data: monthsName,
//                        axisLabel: {
//                            interval: 0
//                        },
                        textStyle: {
                            fontFamily: "Open Sans",
                            align: javatmp.settings.floatDefault
                        }
                    }
                ],
                yAxis: [
                    {
                        position: javatmp.settings.floatDefault,
                        type: 'value',
                        textStyle: {
                            fontFamily: "Open Sans",
                            align: javatmp.settings.floatDefault
                        }
                    }
                ],
                color: ['#007bff'],
                series: [
                    {
                        name: 'Birthday',
                        type: 'bar',
                        data: []
                    }
                ]
            };
            
            var months = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
            barChartOption = $.extend(true, barChartOption, {
                series: [
                    {
                        data: [24, 44.6, 81, 11, 32, 41, 27, 5.9, 4.2, 71.8, 51.6, 22.8]
                    }
                ]
            });

            var barChart = echarts.init(document.getElementById('bar-1-canvas'));
            barChart.setOption(barChartOption);
            
            $(javatmp.settings.defaultOutputSelector).on(javatmp.settings.javaTmpAjaxContainerReady, function (event) {
                // fire AFTER all transition done and your ajax content is shown to user.
                $(".logout-home-btn-id").on("click", function () {
                    window.location.replace($(this).attr("action-ref-by-href"));
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