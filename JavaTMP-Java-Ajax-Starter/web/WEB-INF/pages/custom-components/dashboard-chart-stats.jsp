<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="dynamic-ajax-content">
    <div class="page-header">
        <h1>Dashboard Chart Stats</h1>
    </div>
    <div class="form-row">
        <div class="col-xl-3 col-lg-6 col-md-6">
            <div class="card mb-3 bg-light" id="userStatusPieChartCard">
                <div class="card-header">
                    Registered Users
                    <div class="options float-right">
                        <a load-on-starup="true" href="javascript:;" class="reload"><i class="fa fa-sync"></i></a>
                    </div>
                </div>
                <div class="card-body p-1">
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
                    <a href="javascript:;" class="d-flex">
                        View Details
                        <span class="ml-auto">
                            <i class="fa fa-arrow-circle-next"></i>
                        </span>
                    </a>
                </div>
            </div>
        </div>
        <div class="col-xl-3 col-lg-6 col-md-6">
            <div class="card mb-3 bg-light" id="todayVisitUserPieChartCard">
                <div class="card-header">
                    Visitors Today
                    <div class="options float-right">
                        <a load-on-starup="true" href="javascript:;" class="reload"><i class="fa fa-sync"></i></a>
                    </div>
                </div>
                <div class="card-body p-1">
                    <div class="row d-flex align-items-center">
                        <div class="col-6 text-center">
                            <span class="d-block display-4 counter">8</span>
                        </div>
                        <div class="col-6 text-left">
                            <div id="todayVisitUserPieChart" style="width: 100%;min-height: 100px"></div>
                        </div>
                    </div>
                </div>
                <div class="card-footer">
                    <a href="javascript:;" class="d-flex">
                        View Details
                        <span class="ml-auto">
                            <i class="fa fa-arrow-circle-next"></i>
                        </span>
                    </a>
                </div>
            </div>
        </div>
        <div class="col-xl-3 col-lg-6 col-md-6">
            <div class="card mb-3 bg-light" id="pageViewActivitesPerHourChartCard">
                <div class="card-header">
                    Page Views Per Hour
                    <div class="options float-right">
                        <a load-on-starup="true" href="javascript:;" class="reload"><i class="fa fa-sync"></i></a>
                    </div>
                </div>
                <div class="card-body p-1">
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
                    <a href="javascript:;" class="d-flex">
                        View Details
                        <span class="ml-auto">
                            <i class="fa fa-arrow-circle-next"></i>
                        </span>
                    </a>
                </div>
            </div>
        </div>
        <div class="col-xl-3 col-lg-6 col-md-6">
            <div class="card mb-3 bg-light" id="loadtimePerHourChartCard">
                <div class="card-header">
                    Load Time Per Hour
                    <div class="options float-right">
                        <a load-on-starup="true" href="javascript:;" class="reload"><i class="fa fa-sync"></i></a>
                    </div>
                </div>
                <div class="card-body p-1">
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
                    <a href="javascript:;" class="d-flex">
                        View Details
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
        <div class="col-12 col-lg-4 col-md-6">
            <div class="card mb-3 bg-light">
                <div class="card-header text-center">
                    <span class="text-warning">New Feedbacks</span>
                    <h3 class="display-4 counter text-warning">21,128</h3>
                </div>
                <div class="card-body text-center px-0">
                    <div id="userFeedbackPercentagePieChart" style="width: 100%;min-height: 200px"></div>
                    <div class="d-flex mt-3">
                        <div class="flex-fill border-right text-center">
                            <h1><span class="counter">90</span><span>%</span></h1>
                            <span class="text-success"><i class="fa fa-thumbs-up"></i> Positive</span>
                        </div>
                        <div class="flex-fill text-center">
                            <h1><span class="counter">10</span><span>%</span></h1>
                            <span class="text-danger"><i class="fa fa-thumbs-down"></i> Negative</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-12 col-lg-4 col-md-6">
            <div class="card mb-3 bg-light">
                <div class="card-header text-center">
                    <span class="text-success">New Subscribers</span>
                    <h3 class="display-4 counter text-success">13,854</h3>
                </div>
                <div class="card-body text-center px-0">
                    <div id="userNewSubscribersLineChart" style="width: 100%;min-height: 200px"></div>
                    <div class="d-flex mt-3">
                        <div class="flex-fill text-center">
                            <h1 class="counter">1465</h1>
                            <span class="text-success">
                                <i class="fa fa-heart"></i> Average Monthly Subscribers
                            </span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-12 col-lg-4 col-md-6">
            <div class="card mb-3 bg-light">
                <div class="card-header text-center">
                    <span class="text-primary">Total Users</span>
                    <h3 class="display-4 counter text-primary">55,423</h3>
                </div>
                <div class="card-body text-center px-0">
                    <div id="userGenerNewBarChart" style="width: 100%;min-height: 200px"></div>
                    <div class="d-flex mt-3">
                        <div class="flex-fill border-right text-center">
                            <h1><span class="counter">56</span><span>%</span></h1>
                            <span class="text-success"><i class="fa fa-male"></i> Male</span>
                        </div>
                        <div class="flex-fill text-center">
                            <h1><span class="counter">44</span><span>%</span></h1>
                            <span class="text-danger"><i class="fa fa-female"></i> Female</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="form-row">
        <div class="col-lg-4 col-md-6 col-12">
            <div class="card mb-3 text-warning border border-warning">
                <div class="card-body pb-1">
                    <div class="media d-flex">
                        <div class="media-body">
                            <h1 class="display-4">$12,439</h1>
                            <span class="text-muted">Total Cost</span>
                        </div>
                        <div class="align-self-top">
                            <i class="far fa-star display-4"></i>
                        </div>
                    </div>
                </div>
                <div id="TotalCostLineWithAreaChart" style="width: 100%;min-height: 60px"></div>
            </div>
        </div>
        <div class="col-lg-4 col-md-6 col-12">
            <div class="card mb-3 text-success border border-success">
                <div class="card-body pb-1">
                    <div class="media d-flex">
                        <div class="media-body">
                            <h1 class="display-4">$33,755</h1>
                            <span class="text-muted">Total Sales</span>
                        </div>
                        <div class="align-self-top">
                            <i class="fa fa-chart-bar display-4"></i>
                        </div>
                    </div>
                </div>
                <div id="TotalSalesLineWithAreaChart" style="width: 100%;min-height: 60px"></div>
            </div>
        </div>
        <div class="col-lg-4 col-md-6 col-12">
            <div class="card mb-3 text-primary border border-primary">
                <div class="card-body pb-1">
                    <div class="media d-flex">
                        <div class="media-body">
                            <h1 class="display-4">$21,316</h1>
                            <span class="text-muted">Total Revenue</span>
                        </div>
                        <div class="align-self-top">
                            <i class="fa fa-wallet display-4"></i>
                        </div>
                    </div>
                </div>
                <div id="TotalRevenueLineWithAreaChart" style="width: 100%;min-height: 60px"></div>
            </div>
        </div>
    </div>
    <div class="form-row">
        <div class="col-xl-4 col-lg-6 col-12">
            <div class="card mb-3 text-danger border border-danger">
                <div class="card-body">
                    <div class="form-row">
                        <div class="col-xl-5 col-lg-5 col-12">
                            <h3>$12,439</h3>
                            <span class="text-muted">Total Cost</span>
                        </div>
                        <div class="col-xl-7 col-lg-7 col-12">
                            <div id="TotalCostBarChartSmallSize" style="min-height: 65px"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-xl-4 col-lg-6 col-12">
            <div class="card mb-3 text-warning border border-warning">
                <div class="card-body">
                    <div class="form-row">
                        <div class="col-xl-5 col-lg-5 col-12">
                            <h3>$33,755</h3>
                            <span class="text-muted">Total Sales</span>
                        </div>
                        <div class="col-xl-7 col-lg-7 col-12">
                            <div id="TotalSalesLineChartSmallSize" style="min-height: 65px"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-xl-4 col-lg-6 col-12">
            <div class="card mb-3 text-success border border-success">
                <div class="card-body">
                    <div class="form-row">
                        <div class="col-xl-5 col-lg-5 col-12">
                            <h3>$21,316</h3>
                            <span class="text-muted">Total Revenue</span>
                        </div>
                        <div class="col-xl-7 col-lg-7 col-12">
                            <div id="TotalRevenueLineChartSmallSize" style="min-height: 65px"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-xl-4 col-lg-6 col-12">
            <div class="card mb-3 text-primary border border-primary">
                <div class="card-body">
                    <div class="form-row">
                        <div class="col-xl-7 col-lg-7 col-12">
                            <div id="TotalLineChartSmallSizeCombined" style="min-height: 65px"></div>
                        </div>
                        <div class="col-xl-5 col-lg-5 col-12 text-right">
                            <h3>$12,439</h3>
                            <span class="text-muted">Total Cost</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-xl-4 col-lg-6 col-12">
            <div class="card mb-3 text-success border border-success">
                <div class="card-body">
                    <div class="form-row">
                        <div class="col-xl-7 col-lg-7 col-12">
                            <div id="TotalSalesLineChartSmallSizeCombined" style="min-height: 65px"></div>
                        </div>
                        <div class="col-xl-5 col-lg-5 col-12 text-right">
                            <h3>$33,755</h3>
                            <span class="text-muted">Total Sales</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-xl-4 col-lg-6 col-12">
            <div class="card mb-3 text-dark border border-dark">
                <div class="card-body">
                    <div class="form-row">
                        <div class="col-xl-7 col-lg-7 col-12">
                            <div id="TotalRevenueBarWithLineChartSmallSizeCombined" style="min-height: 65px"></div>
                        </div>
                        <div class="col-xl-5 col-lg-5 col-12 text-right">
                            <h3>$21,316</h3>
                            <span class="text-muted">Total Revenue</span>
                        </div>
                    </div>
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
                delay: 50,
                time: 1000
            });
            var userStatusPieChart = echarts.init(document.getElementById('userStatusPieChart'));
            var todayVisitUserPieChart = echarts.init(document.getElementById('todayVisitUserPieChart'));
            var pageViewActivitesPerHourChart = echarts.init(document.getElementById('pageViewActivitesPerHourChart'));
            var loadtimePerHourChart = echarts.init(document.getElementById('loadtimePerHourChart'));
            var userFeedbackPercentagePieChart = echarts.init(document.getElementById('userFeedbackPercentagePieChart'));
            var userNewSubscribersLineChart = echarts.init(document.getElementById('userNewSubscribersLineChart'));
            var userGenerNewBarChart = echarts.init(document.getElementById('userGenerNewBarChart'));
            var TotalCostLineWithAreaChart = echarts.init(document.getElementById('TotalCostLineWithAreaChart'));
            var TotalSalesLineWithAreaChart = echarts.init(document.getElementById('TotalSalesLineWithAreaChart'));
            var TotalRevenueLineWithAreaChart = echarts.init(document.getElementById('TotalRevenueLineWithAreaChart'));
            var TotalCostBarChartSmallSize = echarts.init(document.getElementById('TotalCostBarChartSmallSize'));
            var TotalSalesLineChartSmallSize = echarts.init(document.getElementById('TotalSalesLineChartSmallSize'));
            var TotalRevenueLineChartSmallSize = echarts.init(document.getElementById('TotalRevenueLineChartSmallSize'));
            var TotalLineChartSmallSizeCombined = echarts.init(document.getElementById('TotalLineChartSmallSizeCombined'));
            var TotalSalesLineChartSmallSizeCombined = echarts.init(document.getElementById('TotalSalesLineChartSmallSizeCombined'));
            var TotalRevenueBarWithLineChartSmallSizeCombined = echarts.init(document.getElementById('TotalRevenueBarWithLineChartSmallSizeCombined'));
            var userStatusPieChartOption = {
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
            userStatusPieChart.setOption(userStatusPieChartOption);
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
                            {value: 8, name: 'Visit'},
                            {value: 18, name: 'Not login yet'}
                        ]
                    }
                ]
            };
            todayVisitUserPieChart.setOption(todayVisitUserPieChartOption);
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
                        data: [24, 44, 81, 11, 32, 41, 27, 5, 4, 71, 51, 22, 0, 0, 43, 451, 413, 90, 27, 5, 4, 71, 51, 22]
                    }
                ]
            };
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
                        data: [24, 44, 81, 11, 32, 41, 27, 5, 4, 71, 51, 22, 24, 44, 81, 11, 32, 41, 27, 5, 4, 71, 51, 22]
                    }
                ]
            };
            loadtimePerHourChart.setOption(loadtimePerHourChartOption);
            var userFeedbackPercentagePieChartOption = {
                tooltip: {
                    trigger: 'item',
                    formatter: "{a} <br/>{b}: {c} ({d}%)"
                },
                legend: {
                    show: false,
                    orient: 'vertical',
                    x: 'left'
                },
                series: [
                    {
                        name: 'feedback',
                        type: 'pie',
                        radius: ['70%', '90%'],
                        avoidLabelOverlap: false,
                        label: {
                            normal: {
                                show: false,
                                position: 'center'
                            },
                            emphasis: {
                                show: true,
                                textStyle: {
                                    fontSize: '21'
                                }
                            }
                        },
                        labelLine: {
                            normal: {
                                show: true
                            }
                        },
                        data: [
                            {value: 90, name: 'Positive', itemStyle: {color: "#28a745"}},
                            {value: 10, name: 'Negative', itemStyle: {color: "#dc3545"}}
                        ]
                    }
                ]
            };
            userFeedbackPercentagePieChart.setOption(userFeedbackPercentagePieChartOption);
            var userNewSubscribersLineChartOption = {
                grid: {
                    show: false,
                    top: 0,
                    bottom: 0,
                    left: 0,
                    right: 0
                },
                tooltip: {
                    trigger: 'axis',
                    formatter: "{a} <br/>{b}: {c}"
                },
                xAxis: {
                    show: false,
                    type: 'category',
                    boundaryGap: false,
                    data: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30]
                },
                yAxis: {
                    show: false
                },
                series: [{
                        name: "New Subscriber",
                        data: [800, 932, 901, 934, 900, 1000, 950, 1050, 1100, 1210, 1200, 1230, 1245, 1250, 1260, 1275, 1290, 1333, 1350, 1312, 1250, 1040, 1055, 1050, 1100, 1190, 1201, 1200, 1099, 1000],
                        type: 'line',
                        symbol: "circle",
                        showSymbol: false,
                        smooth: true,
                        itemStyle: {
                            color: "#28a745",
                            show: false
                        },
                        lineStyle: {
                            color: "#28a745",
                            shadowColor: 'rgba(30, 17, 69, 0.5)',
                            shadowBlur: 10},
                        areaStyle: {
                            color: "#28a745",
                            opacity: 0.2
                        }
                    }]
            };
            userNewSubscribersLineChart.setOption(userNewSubscribersLineChartOption);
            var userGenerNewBarChartOption = {
                grid: {
                    show: false,
                    top: 0,
                    bottom: 0,
                    left: 0,
                    right: 0
                },
                tooltip: {
                    trigger: 'axis',
                    textStyle: {
                        fontFamily: "Open Sans",
                        align: javatmp.settings.floatDefault
                    },
                    formatter: formaterFunction
                },
                xAxis: {
                    show: false,
                    type: 'category',
                    data: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30]
                },
                yAxis: {
                    show: false,
                    type: 'value'
                },
                series: [{
                        name: "Male New Users",
                        type: 'bar',
                        data: [10, 22, 13, 44, 55, 76, 67, 70, 69, 110, 100, 121, 105, 80, 88, 100, 124, 119, 125, 130, 140, 150, 140, 170, 125, 177, 227, 244, 229, 200],
                        itemStyle: {
                            color: "#007bff",
                            barBorderColor: "#0062cc",
                            barBorderWidth: 1,
                            barBorderRadius: [5, 5, 0, 0],
                            opacity: 0.8

                        },
                        emphasis: {
                            itemStyle: {
                                opacity: 1
                            }
                        }
                    }, {
                        name: "Female New Users",
                        type: 'bar',
                        data: [6, 12, 23, 34, 85, 56, 67, 77, 59, 101, 111, 112, 100, 84, 77, 87, 99, 88, 110, 139, 160, 121, 188, 140, 154, 190, 210, 240, 229, 220],
                        itemStyle: {
                            color: "#dc3545",
                            barBorderColor: "#b21f2d",
                            barBorderWidth: 1,
                            barBorderRadius: [5, 5, 0, 0],
                            opacity: 0.8
                        },
                        emphasis: {
                            itemStyle: {
                                opacity: 1
                            }
                        }
                    }]
            };
            userGenerNewBarChart.setOption(userGenerNewBarChartOption);
            var TotalCostLineWithAreaChartOption = {
                grid: {
                    show: false,
                    top: 5,
                    bottom: 0,
                    left: 0,
                    right: 0
                },
                tooltip: {
                    trigger: 'axis',
                    formatter: "{a} <br/>{b}: {c}"
                },
                xAxis: {
                    show: false,
                    type: 'category',
                    boundaryGap: false,
                    data: [11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30]
                },
                yAxis: {
                    show: false
                },
                series: [{
                        name: "New Subscriber",
                        data: [1200, 1730, 1245, 750, 1400, 1410, 1500, 1700, 2000, 2200, 1500, 900, 1500, 2000, 2500, 1700, 1300, 900, 700, 550],
                        type: 'line',
                        symbol: "circle",
                        showSymbol: false,
                        smooth: true,
                        itemStyle: {
                            color: "#c69500",
                            show: false
                        },
                        lineStyle: {
                            color: "#ffc107"
                        },
                        areaStyle: {
                            color: "#ffc107",
                            opacity: 0.5
                        }
                    }]
            };
            TotalCostLineWithAreaChart.setOption(TotalCostLineWithAreaChartOption);
            var TotalSalesLineWithAreaChartOption = {
                grid: {
                    show: false,
                    top: 5,
                    bottom: 0,
                    left: 0,
                    right: 0
                },
                tooltip: {
                    trigger: 'axis',
                    formatter: "{a} <br/>{b}: {c}"
                },
                xAxis: {
                    show: false,
                    type: 'category',
                    boundaryGap: false,
                    data: [11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30]
                },
                yAxis: {
                    show: false
                },
                series: [{
                        name: "New Subscriber",
                        data: [1200, 1730, 1245, 750, 1400, 1410, 1500, 1700, 2000, 2200, 1500, 900, 1500, 2000, 2500, 1700, 1300, 900, 700, 550],
                        type: 'line',
                        symbol: "circle",
                        showSymbol: false,
                        smooth: false,
                        itemStyle: {
                            color: "#1c7430",
                            show: false
                        },
                        lineStyle: {
                            color: "#28a745"
                        },
                        areaStyle: {
                            color: "#28a745",
                            opacity: 0.5
                        }
                    }]
            };
            TotalSalesLineWithAreaChart.setOption(TotalSalesLineWithAreaChartOption);
            var TotalRevenueLineWithAreaChartOption = {
                grid: {
                    show: false,
                    top: 5,
                    bottom: 0,
                    left: 0,
                    right: 0
                },
                tooltip: {
                    trigger: 'axis',
                    formatter: "{a} <br/>{b}: {c}"
                },
                xAxis: {
                    show: false,
                    type: 'category',
                    boundaryGap: false,
                    data: [11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30]
                },
                yAxis: {
                    show: false
                },
                series: [{
                        name: "New Subscriber",
                        data: [1200, 1730, 1245, 750, 1400, 1410, 1500, 1700, 2000, 2200, 1500, 900, 1500, 2000, 2500, 1700, 1300, 900, 700, 550],
                        type: 'line',
                        symbol: "circle",
                        showSymbol: true,
                        smooth: false,
                        itemStyle: {
                            color: "#007bff",
                            show: true
                        },
                        lineStyle: {
                            color: "#007bff"
                        },
                        areaStyle: {
                            color: "#007bff",
                            opacity: 0.5
                        }
                    }]
            };
            TotalRevenueLineWithAreaChart.setOption(TotalRevenueLineWithAreaChartOption);
            var TotalCostBarChartSmallSizeOption = {
                grid: {
                    show: false,
                    top: 0,
                    bottom: 0,
                    left: 0,
                    right: 0
                },
                title: {
                    show: false,
                    text: "Total Cost",
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
                    data: ['Total Cost'],
                    x: 'center',
                    y: '30px',
                    textStyle: {
                        fontFamily: "Open Sans",
                        align: javatmp.settings.floatDefault
                    }
                },
                //                calculable: true,
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
                        name: 'Total Cost',
                        type: 'bar',
                        data: [24, 44, 81, 11, 32, 41, 27, 15, 14, 71, 51, 22, 21, 18, 43, 65, 48, 90, 27, 15, 14, 71, 51, 22]
                    }
                ]
            };
            TotalCostBarChartSmallSize.setOption(TotalCostBarChartSmallSizeOption);
            var TotalSalesLineChartSmallSizeOption = {
                grid: {
                    show: false,
                    top: 0,
                    bottom: 0,
                    left: 0,
                    right: 0
                },
                title: {
                    show: false,
                    text: "Total Sales",
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
                    data: ['Total Sales'],
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
                color: ['#ffc107'],
                series: [
                    {
                        name: 'Total Sales',
                        type: 'line',
                        data: [24, 44, 81, 11, 32, 41, 27, 5, 4, 71, 51, 22, 24, 44, 81, 11, 32, 41, 27, 5, 4, 71, 51, 22]
                    }
                ]
            };
            TotalSalesLineChartSmallSize.setOption(TotalSalesLineChartSmallSizeOption);
            var TotalRevenueLineChartSmallSizeOption = {
                grid: {
                    show: false,
                    top: 3,
                    bottom: 3,
                    left: 3,
                    right: 3
                },
                title: {
                    show: false,
                    text: "Total Revenue",
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
                    data: ['Total Revenue'],
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
                color: ['#28a745'],
                series: [
                    {
                        name: 'Total Revenue',
                        type: 'line',
                        symbol: "circle",
                        showSymbol: false,
                        smooth: true,
                        data: [24, 44, 81, 11, 32, 41, 27, 5, 4, 71, 51, 22, 24, 44, 81, 11, 32, 41, 27, 5, 4, 71, 51, 22]
                    }
                ]
            };
            TotalRevenueLineChartSmallSize.setOption(TotalRevenueLineChartSmallSizeOption);
            var TotalLineChartSmallSizeCombinedOption = {
                tooltip: {
                    trigger: 'axis',
                    axisPointer: {
                        type: 'shadow'
                    },
                    textStyle: {
                        fontFamily: "Open Sans",
                        align: javatmp.settings.floatDefault
                    },
                    formatter: formaterFunction
                },
                grid: {
                    left: 0,
                    right: 0,
                    bottom: 0,
                    top: 0
                },
                xAxis: [
                    {
                        show: false,
                        type: 'category',
                        inverse: javatmp.settings.isRTL,
                        textStyle: {
                            fontFamily: "Open Sans",
                            align: javatmp.settings.floatDefault
                        },
                        data: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23]
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
                color: ['#dc3545', '#ffc107', '#28a745'],
                series: [
                    {
                        name: 'Cost',
                        type: 'bar',
                        stack: 'main',
                        data: [24, 66, 33, 21, 32, 41, 33, 65, 14, 71, 66, 55, 24, 44, 65, 50, 32, 41, 45, 45, 84, 71, 51, 22]
                    },
                    {
                        name: 'Sales',
                        type: 'bar',
                        stack: 'main',
                        data: [12, 44, 33, 22, 32, 41, 44, 25, 64, 71, 64, 67, 24, 44, 44, 50, 55, 41, 55, 55, 34, 71, 51, 22]
                    },
                    {
                        name: 'Revenue',
                        type: 'bar',
                        stack: 'main',
                        data: [55, 11, 22, 32, 32, 41, 27, 35, 74, 71, 67, 77, 24, 44, 22, 44, 32, 41, 27, 65, 44, 71, 51, 22]
                    }
                ]
            };
            TotalLineChartSmallSizeCombined.setOption(TotalLineChartSmallSizeCombinedOption);
            var TotalSalesLineChartSmallSizeCombinedOption = {
                tooltip: {
                    trigger: 'axis',
                    axisPointer: {
                        type: 'shadow'
                    }
                },
                grid: {
                    left: 0,
                    right: 0,
                    bottom: 0,
                    top: 0
                },
                xAxis: [
                    {
                        show: false,
                        type: 'category',
                        data: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23],
                        inverse: javatmp.settings.isRTL,
                        textStyle: {
                            fontFamily: "Open Sans",
                            align: javatmp.settings.floatDefault
                        }
                    }
                ],
                yAxis: [
                    {
                        show: false,
                        type: 'value',
                        position: javatmp.settings.floatDefault,
                        textStyle: {
                            fontFamily: "Open Sans",
                            align: javatmp.settings.floatDefault
                        }
                    }
                ],
                color: ['#dc3545', '#ffc107'],
                series: [
                    {
                        name: 'Sales',
                        type: 'bar',
                        stack: 'main',
                        data: [12, 44, 33, 22, 32, 41, 44, 25, 64, 71, 64, 67, 24, 44, 44, 50, 55, 41, 55, 55, 34, 71, 51, 22]
                    },
                    {
                        name: 'Revenue',
                        type: 'bar',
                        stack: 'main',
                        data: [-55, -11, -22, -32, -32, -41, -27, -35, -74, -71, -67, -77, -24, -44, -22, -44, -32, -41, -27, -65, -44, -71, -51, -22]
                    }
                ]
            };
            TotalSalesLineChartSmallSizeCombined.setOption(TotalSalesLineChartSmallSizeCombinedOption);
            var TotalRevenueBarWithLineChartSmallSizeCombinedOption = {
                tooltip: {
                    trigger: 'axis',
                    axisPointer: {
                        type: 'shadow'
                    }
                },
                grid: {
                    left: 0,
                    right: 0,
                    bottom: 0,
                    top: 0
                },
                xAxis: [
                    {
                        show: false,
                        type: 'category',
                        data: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23],
                        inverse: javatmp.settings.isRTL,
                        textStyle: {
                            fontFamily: "Open Sans",
                            align: javatmp.settings.floatDefault
                        }
                    }
                ],
                yAxis: [
                    {
                        show: false,
                        type: 'value',
                        position: javatmp.settings.floatDefault,
                        textStyle: {
                            fontFamily: "Open Sans",
                            align: javatmp.settings.floatDefault
                        }
                    }
                ],
                color: ['#dc3545', '#ffc107', '#28a745'],
                series: [
                    {
                        name: 'Cost',
                        type: 'bar',
                        stack: 'main',
                        data: [24, 44, 25, 21, 32, 41, 33, 65, 14, 71, 66, 55, 24, 44, 65, 50, 32, 41, 45, 45, 84, 71, 51, 22]
                    },
                    {
                        name: 'Sales',
                        type: 'bar',
                        stack: 'main',
                        data: [12, 66, 33, 36, 50, 51, 44, 25, 64, 71, 64, 67, 14, 34, 44, 50, 55, 41, 55, 55, 34, 71, 51, 22]
                    },
                    {
                        name: 'Revenue',
                        type: 'line',
                        symbol: "circle",
                        showSymbol: true,
                        smooth: true,
                        data: [12, 22, 8, 15, 18, 10, 27, -35, 55, 0, 1, 10, -10, -10, -21, 44, 32, 41, 27, 65, -50, 5, 10, 2]
                    }
                ]
            };
            TotalRevenueBarWithLineChartSmallSizeCombined.setOption(TotalRevenueBarWithLineChartSmallSizeCombinedOption);
            $(javatmp.settings.defaultOutputSelector).on(javatmp.settings.javaTmpAjaxContainerReady, function (event) {
                // fire AFTER all transition done and your ajax content is shown to user.
            });

            $(javatmp.settings.defaultOutputSelector).on(javatmp.settings.javaTmpContainerResizeEventName, function (event) {
                // fire when user resize browser window or sidebar hide / show
                javatmp.waitForFinalEvent(function () {
                    userStatusPieChart.resize();
                    todayVisitUserPieChart.resize();
                    pageViewActivitesPerHourChart.resize();
                    loadtimePerHourChart.resize();
                    userFeedbackPercentagePieChart.resize();
                    userNewSubscribersLineChart.resize();
                    userGenerNewBarChart.resize();
                    TotalCostLineWithAreaChart.resize();
                    TotalSalesLineWithAreaChart.resize();
                    TotalRevenueLineWithAreaChart.resize();
                    TotalCostBarChartSmallSize.resize();
                    TotalSalesLineChartSmallSize.resize();
                    TotalRevenueLineChartSmallSize.resize();
                    TotalLineChartSmallSizeCombined.resize();
                    TotalSalesLineChartSmallSizeCombined.resize();
                    TotalRevenueBarWithLineChartSmallSizeCombined.resize();
                }, 220, "@dashboard-chart-stats-page-resize");
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