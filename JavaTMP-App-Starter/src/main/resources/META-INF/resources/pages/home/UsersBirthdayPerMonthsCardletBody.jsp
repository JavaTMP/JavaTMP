<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="row">
    <div class="col-lg-12">
        <div class="UsersBirthdayPerMonths" style="min-height: 300px"></div>
    </div>
</div>
<script type="text/javascript">
    // get cardletId from request parameter:
    jQuery(function ($) {
        var currentCardletId = '<c:out value="${param.cardletId}"/>';
        var cardletElement = $("#" + currentCardletId);
        var containerCard = null;
        var chartDiv = null;

        cardletElement.on(javatmp.settings.javaTmpAjaxContainerReady, function (event) {
            containerCard = cardletElement.closest(".card");
            chartDiv = $('.UsersBirthdayPerMonths', cardletElement)[0];

            var UsersBirthdayPerMonths = echarts.init(chartDiv);

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
                    formatter: javatmp.settings.isRTL === true ? javatmp.plugins.echartCustomTooltipFormatter : null
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
//                        axisTick: {
//                            show: true,
//                            alignWithLabel: true,
//                            interval: 0
//                        },
                        axisLabel: {
//                            interval: 0,
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

            var cardBody = cardletElement;

            var cardBody = $(this).closest(".card").children(".card-body");

            javatmp.plugins.blockWrapper(cardBody);
            javatmp.plugins.ajaxJsonAction({
                url: javatmp.settings.contextPath + "/stats/GetUsersBirthdayCountController",
                success: function (remoteContent) {
                    var dataArray = remoteContent;

                    var outputMonthsArray = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
                    for (var i = 0; i < dataArray.length; i++) {
                        outputMonthsArray[dataArray[i][0] - 1] += dataArray[i][1];
                    }

                    barChartOption.series[0].data = outputMonthsArray;

                    UsersBirthdayPerMonths.setOption(barChartOption);
                },
                complete: function (jqXHR, textStatus) {
                    $(cardBody).unblock();
                }
            });

            $(javatmp.settings.defaultOutputSelector).on(javatmp.settings.javaTmpContainerResizeEventName, function (event) {
                UsersBirthdayPerMonths.resize();
            });

            containerCard.on(javatmp.settings.cardFullscreenCompress, function (event, card) {
                // when card compress by pressing the top right tool button
                $(chartDiv).css({"minHeight": 300});
                UsersBirthdayPerMonths.resize();
            });
            containerCard.on(javatmp.settings.cardFullscreenExpand, function (event, card) {
                // when card compress by pressing the top right tool button
                $(chartDiv).css({"minHeight": "90vh"});
                UsersBirthdayPerMonths.resize();
            });

            cardletElement.on(javatmp.settings.javaTmpContainerRemoveEventName, function (event) {
                containerCard.off(javatmp.settings.cardFullscreenCompress);
                containerCard.off(javatmp.settings.cardFullscreenExpand);
                return true;
            });

        });
    });
</script>