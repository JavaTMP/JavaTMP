<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="row d-flex align-items-center">
    <div class="col-6 text-center">
        <span class="d-block display-4 counter todayVisitUserPieChartCard_totalCount">0</span>
    </div>
    <div class="col-6 text-left">
        <div class="todayVisitUserPieChart" style="min-height: 100px"></div>
    </div>
</div>
<script type="text/javascript">
    // get cardletId from request parameter:
    jQuery(function ($) {
        var currentCardletId = '<c:out value="${param.cardletId}"/>';
        var cardletElement = $("#" + currentCardletId);
        cardletElement.on(javatmp.settings.javaTmpAjaxContainerReady, function (event) {
            var todayVisitUserPieChart = echarts.init($('.todayVisitUserPieChart', cardletElement)[0]);
            var todayVisitUserPieChartOption = {
                tooltip: {
                    trigger: 'item',
                    formatter: "{a} <br/>{b}: {c} ({d}%)",
                    textStyle: {
                        fontFamily: $("body").css("font-family"),
                        fontSize: $("body").css("font-size"),
                        align: javatmp.settings.floatDefault
                    }
                },
                hover: true,
                color: ['#007bff', '#dae0e5'],
                series: [
                    {
                        clockwise: !javatmp.settings.isRTL,
                        name: '${labels['page.home.VisitorsToday']}',
                        type: 'pie',
                        radius: '85%',
                        avoidLabelOverlap: false,
                        hoverOffset: 4,
                        label: {
                            normal: {show: false},
                            textStyle: {
                                fontFamily: $("body").css("font-family"),
                                fontSize: $("body").css("font-size"),
                                align: javatmp.settings.floatDefault
                            }
                        },
                        data: [
                            {value: 0, name: '${labels['page.home.VisitorsToday.VisitToday']}'},
                            {value: 0, name: '${labels['page.home.VisitorsToday.NotVisitingToday']}'}
                        ]
                    }
                ]
            };
            todayVisitUserPieChart.setOption(todayVisitUserPieChartOption);
            var cardBody = cardletElement;
            javatmp.plugins.blockWrapper(cardBody);
            javatmp.plugins.ajaxJsonAction({
                url: javatmp.settings.contextPath + "/stats/GetVisitingUsersCountController",
                success: function (remoteContent) {
                    var visitingToday = remoteContent[0];
                    var notVisitingTodayOrLoginYet = remoteContent[1];

                    todayVisitUserPieChartOption.series[0].data[0].value = visitingToday;
                    todayVisitUserPieChartOption.series[0].data[1].value = notVisitingTodayOrLoginYet;
                    $('.todayVisitUserPieChartCard_totalCount', cardletElement).html(visitingToday).counterUp({
                        delay: 10,
                        time: 1000
                    });
                    todayVisitUserPieChart.setOption(todayVisitUserPieChartOption);
                },
                complete: function (jqXHR, textStatus) {
                    $(cardletElement).unblock();
                }
            });

            var ContainerResizeEventHandler = function (event) {
                todayVisitUserPieChart.resize();
            };

            $(javatmp.settings.defaultOutputSelector).on(javatmp.settings.javaTmpContainerResizeEventName, ContainerResizeEventHandler);

            cardletElement.on(javatmp.settings.javaTmpContainerRemoveEventName, function (event) {
                $(javatmp.settings.defaultOutputSelector).off(javatmp.settings.javaTmpContainerResizeEventName, ContainerResizeEventHandler);
                return true;
            });
        });
    });
</script>