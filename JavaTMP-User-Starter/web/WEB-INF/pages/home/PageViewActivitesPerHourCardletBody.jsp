<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="row d-flex align-items-center">
    <div class="col-7 text-center">
        <span class="d-block display-4 counter" id="pageViewActivitesPerHourChartCard_totalCount">0</span>
        <span class="d-block muted small">${labels['page.home.AllPageViews']}</span>
    </div>
    <div class="col-5 text-left">
        <div id="pageViewActivitesPerHourChart" style="min-height: 100px"></div>
    </div>
</div>
<script type="text/javascript">
    // get cardletId from request parameter:
    jQuery(function ($) {
        var currentCardletId = '<c:out value="${param.cardletId}"/>';
        var cardletElement = $("#" + currentCardletId);
        cardletElement.on(javatmp.settings.javaTmpAjaxContainerReady, function (event) {
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
            var pageViewActivitesPerHourChart = echarts.init(document.getElementById('pageViewActivitesPerHourChart'));

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
                    text: "${labels['page.home.PageViewsPerHour']}",
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
                    data: ['Page View'],
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
                        show: false,
                        inverse: javatmp.settings.isRTL,
                        data: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23],
                        //                        axisLabel: {
                        //                            interval: 0
                        //                        },
                        textStyle: {
                            fontFamily: $("body").css("font-family"),
                            fontSize: $("body").css("font-size"),
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
                            fontFamily: $("body").css("font-family"),
                            fontSize: $("body").css("font-size"),
                            align: javatmp.settings.floatDefault
                        }
                    }
                ],
                color: ['#007bff'],
                series: [
                    {
                        name: '${labels['page.home.PageViewsPerHour']}',
                        type: 'bar',
                        data: []
                    }
                ]
            };

            pageViewActivitesPerHourChart.setOption(pageViewActivitesPerHourChartOption);

            var cardBody = cardletElement;

            $(cardBody).block({message: javatmp.settings.labels["global.loadingText"],
                overlayCSS: {
                    backgroundColor: '#000',
                    opacity: 0.7
                }});

            $.ajax({
                "type": "POST",
                cache: false,
                url: javatmp.settings.contextPath + "/stats/GetUsersPageViewsPerHourCountController",
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
        cardletElement.on(javatmp.settings.javaTmpContainerRemoveEventName, function (event) {
            return true;
        });
    });
</script>