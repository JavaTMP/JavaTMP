<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="row d-flex align-items-center">
    <div class="col-7 text-center">
        <span class="d-block display-4 counter" id="loadtimePerHourChartCard_totalCount">0</span>
        <span class="d-block muted small">${labels['page.home.AvgLoadTime']}</span>
    </div>
    <div class="col-5">
        <div id="loadtimePerHourChart" style="min-height: 100px"></div>
    </div>
</div>
<script type="text/javascript">
    // get cardletId from request parameter:
    jQuery(function ($) {
        var currentCardletId = '<c:out value="${param.cardletId}"/>';
        var cardletElement = $("#" + currentCardletId);
        cardletElement.on(javatmp.settings.javaTmpAjaxContainerReady, function (event) {

            var loadtimePerHourChart = echarts.init(document.getElementById('loadtimePerHourChart'));

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
                    text: "${labels['page.home.LoadTimePerHour']}",
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
                    formatter: javatmp.settings.isRTL === true ? javatmp.plugins.echartCustomTooltipFormatter : null
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
                color: ['#dc3545'],
                series: [
                    {
                        name: '${labels['page.home.LoadTimePerHour']}',
                        type: 'line',
                        data: [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
                    }
                ]
            };
            loadtimePerHourChart.setOption(loadtimePerHourChartOption);

            var cardBody = cardletElement;
            javatmp.plugins.blockWrapper(cardBody);
            javatmp.plugins.ajaxJsonAction({
                url: javatmp.settings.contextPath + "/stats/GetAvgLoadTimePerHourController",
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
                },
                complete: function (jqXHR, textStatus) {
                    $(cardBody).unblock();
                }
            });

            var ContainerResizeEventHandler = function (event) {
                loadtimePerHourChart.resize();
            };

            $(javatmp.settings.defaultOutputSelector).on(javatmp.settings.javaTmpContainerResizeEventName, ContainerResizeEventHandler);

            cardletElement.on(javatmp.settings.javaTmpContainerRemoveEventName, function (event) {
                $(javatmp.settings.defaultOutputSelector).off(javatmp.settings.javaTmpContainerResizeEventName, ContainerResizeEventHandler);
                return true;
            });

        });
    });
</script>