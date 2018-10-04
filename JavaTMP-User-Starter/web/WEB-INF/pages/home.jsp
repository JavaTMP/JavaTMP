<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div id="UsersMngHomePageDynamicAjaxCont" class="dynamic-ajax-content pt-3">
    <div class="form-row">
        <div class="col-xl-3 col-lg-6 col-md-6">
            <div class="card shadow mb-3 bg-white" id="userStatusPieChartCard">
                <div class="card-header bg-white">
                    ${labels['page.home.RegisteredUsers']}
                    <div class="options float-right">
                        <a load-on-starup="true" href="javascript:;" class="reload"><i class="fa fa-sync"></i></a>
                    </div>
                </div>
                <div class="card-body p-1">
                    <div class="row d-flex align-items-center">
                        <div class="col-6 text-center">
                            <span class="d-block display-4 counter" id="userStatusPieChartCard_totalCount">0</span>
                        </div>
                        <div class="col-6 text-left">
                            <div id="userStatusPieChart" style="min-height: 100px"></div>
                        </div>
                    </div>
                </div>
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
                        <a load-on-starup="true" href="javascript:;" class="reload"><i class="fa fa-sync"></i></a>
                    </div>
                </div>
                <div class="card-body p-1 bg-white">
                    <div class="row d-flex align-items-center">
                        <div class="col-6 text-center">
                            <span class="d-block display-4 counter" id="todayVisitUserPieChartCard_totalCount">0</span>
                        </div>
                        <div class="col-6 text-left">
                            <div id="todayVisitUserPieChart" style="min-height: 100px"></div>
                        </div>
                    </div>
                </div>
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
                        <a load-on-starup="true" href="javascript:;" class="reload"><i class="fa fa-sync"></i></a>
                    </div>
                </div>
                <div class="card-body p-1 bg-white">
                    <div class="row d-flex align-items-center">
                        <div class="col-6 text-center">
                            <span class="d-block display-4 counter" id="pageViewActivitesPerHourChartCard_totalCount">0</span>
                            <span class="d-block muted small">${labels['page.home.AllPageViews']}</span>
                        </div>
                        <div class="col-6 text-left">
                            <div id="pageViewActivitesPerHourChart" style="min-height: 100px"></div>
                        </div>
                    </div>
                </div>
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
                        <a load-on-starup="true" href="javascript:;" class="reload"><i class="fa fa-sync"></i></a>
                    </div>
                </div>
                <div class="card-body p-1 bg-white">
                    <div class="row d-flex align-items-center">
                        <div class="col-7 text-center">
                            <span class="d-block display-4 counter" id="loadtimePerHourChartCard_totalCount">0</span>
                            <span class="d-block muted small">${labels['page.home.AvgLoadTime']}</span>
                        </div>
                        <div class="col-5">
                            <div id="loadtimePerHourChart" style="min-height: 100px"></div>
                        </div>
                    </div>
                </div>
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
                        <a load-on-starup="true" href="javascript:;" class="reload"><i class="fa fa-sync"></i></a>
                        <a href="javascript:;" class="fullscreen"><i class=" fa fa-expand"></i></a>
                    </div>
                </div>
                <div class="card-body bg-white p-0">
                    <div class="row">
                        <div class="col-lg-12">
                            <div id="UsersLocationsInTheWorld" style="min-height: 300px"></div>
                        </div>
                    </div>
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
                delay: 10,
                time: 1000
            });
            var userStatusPieChart = echarts.init(document.getElementById('userStatusPieChart'));
            var todayVisitUserPieChart = echarts.init(document.getElementById('todayVisitUserPieChart'));
            var pageViewActivitesPerHourChart = echarts.init(document.getElementById('pageViewActivitesPerHourChart'));
            var loadtimePerHourChart = echarts.init(document.getElementById('loadtimePerHourChart'));
            var UsersLocationsInTheWorld = echarts.init(document.getElementById('UsersLocationsInTheWorld'));
            var UsersBirthdayPerMonths = echarts.init(document.getElementById('UsersBirthdayPerMonths'));
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
                            {value: 0, name: 'Active'},
                            {value: 0, name: 'Deactive'}
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
                            {value: 0, name: 'Visit Today'},
                            {value: 0, name: 'Not Visiting or login yet'}
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
                        data: []
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
                        data: [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
                    }
                ]
            };
            loadtimePerHourChart.setOption(loadtimePerHourChartOption);
            var UsersLocationsInTheWorldOption = {
                tooltip: {
                    trigger: 'item',
                    formatter: function (params) {
                        var value = (params.value + '').split('.');
                        value = value[0].replace(/(\d{1,3})(?=(?:\d{3})+(?!\d))/g, '$1,');
                        return params.seriesName + '<br/>' + params.name + ' : ' + value;
                    }
                },
                visualMap: {
                    min: 0,
                    max: 100,
                    left: javatmp.settings.floatDefault,
                    top: 'bottom',
                    text: ['High', 'Low'],
                    seriesIndex: [0],
                    inRange: {
                        color: ['#ffffff', '#007bff']
                    },
                    calculable: true
                },
                series: [
                    {
                        name: "Country",
                        type: 'map',
                        map: 'world',
                        roam: true,
                        itemStyle: {
                            normal: {
                                borderWidth: 0.3,
                                borderColor: 'black'
                            },
                            emphasis: {
                                label: {show: true}
                                // shadowOffsetX: 0,
                                // shadowOffsetY: 0,
                                // shadowBlur: 20,
                                // shadowColor: 'rgba(0, 0, 0, 0.3)'
                            }
                        },
                        data: null
                    }
                ]
            };
            UsersLocationsInTheWorld.setOption(UsersLocationsInTheWorldOption);
            var monthsName = moment.months();
            var barChartOption = {
                grid: {
                    show: false,
//                    top: 25,
                    bottom: 30,
                    left: 45,
                    right: 45
                },
                title: {
                    show: false,
                    text: "Users Birthday Frequencies",
                    x: 'center',
                    y: 0,
                    textStyle: {
                        fontWeight: "normal",
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

            UsersBirthdayPerMonths.setOption(barChartOption);

            $(javatmp.settings.defaultOutputSelector).on("click", "#userStatusPieChartCard a.reload", function (e) {
                e.preventDefault();

                var cardBody = $(this).closest(".card").children(".card-body");
                var href = javatmp.settings.contextPath + "/stats/GetRegisteredUsersStatusesController";

                $(cardBody).block({message: javatmp.settings.label.loadingText,
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
                        var activeUsersCount = remoteContent.data[1][1];
                        var inactiveUsersCount = remoteContent.data[0][1];
                        var allUsersCount = activeUsersCount + inactiveUsersCount;

                        userStatusPieChartOption.series[0].data[0].value = activeUsersCount;
                        userStatusPieChartOption.series[0].data[1].value = inactiveUsersCount;
                        $("#userStatusPieChartCard_totalCount").html(allUsersCount).counterUp({
                            delay: 10,
                            time: 1000
                        });
                        userStatusPieChart.setOption(userStatusPieChartOption);



                        userStatusPieChart.on('click', function (params) {
                            console.log(params);
                        });

                        userStatusPieChart.on('legendselectchanged', function (params) {
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

            $(javatmp.settings.defaultOutputSelector).on("click", "#todayVisitUserPieChartCard a.reload", function (e) {
                e.preventDefault();

                var cardBody = $(this).closest(".card").children(".card-body");
                var href = javatmp.settings.contextPath + "/stats/GetVisitingUsersCountController";

                $(cardBody).block({message: javatmp.settings.label.loadingText,
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
                        var visitingToday = remoteContent.data[0];
                        var notVisitingTodayOrLoginYet = remoteContent.data[1];

                        todayVisitUserPieChartOption.series[0].data[0].value = visitingToday;
                        todayVisitUserPieChartOption.series[0].data[1].value = notVisitingTodayOrLoginYet;
                        $("#todayVisitUserPieChartCard_totalCount").html(visitingToday).counterUp({
                            delay: 10,
                            time: 1000
                        });
                        todayVisitUserPieChart.setOption(todayVisitUserPieChartOption);

                        todayVisitUserPieChart.on('click', function (params) {
                            console.log(params);
                        });

                        todayVisitUserPieChart.on('legendselectchanged', function (params) {
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

            $(javatmp.settings.defaultOutputSelector).on("click", "#pageViewActivitesPerHourChartCard a.reload", function (e) {
                e.preventDefault();

                var cardBody = $(this).closest(".card").children(".card-body");
                var href = javatmp.settings.contextPath + "/stats/GetUsersPageViewsPerHourCountController";

                $(cardBody).block({message: javatmp.settings.label.loadingText,
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
                        var totalPages = 0;
                        var outputHoursArray = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
                        for (var i = 0; i < dataArray.length; i++) {
                            outputHoursArray[dataArray[i][0]] += dataArray[i][1];
                            totalPages += dataArray[i][1];
                        }

                        $("#pageViewActivitesPerHourChartCard_totalCount").attr("title", totalPages).html(totalPages).counterUp({
                            delay: 10,
                            time: 1000,
                            formatter: function (n) {
                                return numeral(n).format('0 a');
                            }
                        });

                        pageViewActivitesPerHourChartOption = $.extend(true, pageViewActivitesPerHourChartOption, {
                            series: [
                                {
                                    data: outputHoursArray
                                }
                            ]
                        });
                        pageViewActivitesPerHourChart.setOption(pageViewActivitesPerHourChartOption);

                        pageViewActivitesPerHourChart.on('click', function (params) {
                            console.log(params);
                        });

                        pageViewActivitesPerHourChart.on('legendselectchanged', function (params) {
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

            $(javatmp.settings.defaultOutputSelector).on("click", "#loadtimePerHourChartCard a.reload", function (e) {
                e.preventDefault();

                var cardBody = $(this).closest(".card").children(".card-body");
                var href = javatmp.settings.contextPath + "/stats/GetAvgLoadTimePerHourController";

                $(cardBody).block({message: javatmp.settings.label.loadingText,
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
                        var totalAvgs = 0;
                        var avgLoadTime = 0;
                        var outputHoursArray = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
                        for (var i = 0; i < dataArray.length; i++) {
                            outputHoursArray[dataArray[i][0]] += dataArray[i][1];
                            totalAvgs += dataArray[i][1];
                        }
                        avgLoadTime = totalAvgs / dataArray.length;
                        // from: https://stackoverflow.com/questions/11832914/round-to-at-most-2-decimal-places-only-if-necessary
                        avgLoadTime = Math.round((avgLoadTime + 0.00001) * 100) / 100;
                        $("#loadtimePerHourChartCard_totalCount").attr("title", avgLoadTime).html(avgLoadTime).counterUp({
                            delay: 10,
                            time: 1000,
                            formatter: function (n) {
                                return numeral(n).format('0.00 a');
                            }
                        });

                        loadtimePerHourChartOption = $.extend(true, loadtimePerHourChartOption, {
                            series: [
                                {
                                    data: outputHoursArray
                                }
                            ]
                        });
                        loadtimePerHourChart.setOption(loadtimePerHourChartOption);

                        loadtimePerHourChart.on('click', function (params) {
                            console.log(params);
                        });

                        loadtimePerHourChart.on('legendselectchanged', function (params) {
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

            $(javatmp.settings.defaultOutputSelector).on("click", "#UsersLocationsInTheWorldCard a.reload", function (e) {
                e.preventDefault();

                var cardBody = $(this).closest(".card").children(".card-body");
                var href = javatmp.settings.contextPath + "/stats/GetUsersLocationsCountController";

                $(cardBody).block({message: javatmp.settings.label.loadingText,
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
                        var outputCountries = [];
                        var maxValue = 0;
                        for (var i = 0; i < dataArray.length; i++) {
                            var countryItem = {};
                            countryItem["name"] = dataArray[i][0];
                            countryItem["value"] = dataArray[i][1];
                            if (dataArray[i][1] > maxValue) {
                                maxValue = dataArray[i][1];
                            }
                            outputCountries.push(countryItem);
                        }

                        UsersLocationsInTheWorldOption = $.extend(true, UsersLocationsInTheWorldOption, {
                            visualMap: {
                                max: maxValue
                            },
                            series: [
                                {
                                    data: outputCountries
                                }
                            ]
                        });

                        UsersLocationsInTheWorld.setOption(UsersLocationsInTheWorldOption);

                        UsersLocationsInTheWorld.on('click', function (params) {
                            console.log(params);
                        });

                        UsersLocationsInTheWorld.on('legendselectchanged', function (params) {
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

            $(javatmp.settings.defaultOutputSelector).on("click", "#UsersBirthdayPerMonthsCard a.reload", function (e) {
                e.preventDefault();

                var cardBody = $(this).closest(".card").children(".card-body");
                var href = javatmp.settings.contextPath + "/stats/GetUsersBirthdayCountController";

                $(cardBody).block({message: javatmp.settings.label.loadingText,
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

                        barChartOption = $.extend(true, barChartOption, {
                            series: [
                                {
                                    data: outputMonthsArray
                                }
                            ]
                        });

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
                    userStatusPieChart.resize();
                    todayVisitUserPieChart.resize();
                    pageViewActivitesPerHourChart.resize();
                    loadtimePerHourChart.resize();
                    UsersLocationsInTheWorld.resize();
                    UsersBirthdayPerMonths.resize();
                }, 100, "@users-dashboard-page-resize");
            });

            $(javatmp.settings.defaultOutputSelector).on(javatmp.settings.cardFullscreenCompress, function (event, card) {
                // when card compress by pressing the top right tool button
                var cardId = card.attr("id");
                if (cardId === "UsersLocationsInTheWorldCard") {
                    $('#UsersLocationsInTheWorld').css({"minHeight": 300});
                    UsersLocationsInTheWorld.resize();
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
                    UsersLocationsInTheWorld.resize();
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