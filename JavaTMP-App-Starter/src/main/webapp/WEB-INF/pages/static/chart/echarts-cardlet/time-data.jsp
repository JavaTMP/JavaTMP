<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="row">
    <div class="col-lg-12">
        <div class="map" style="min-height: 500px"></div>
    </div>
</div>
<script type="text/javascript">
    // get cardletId from request parameter:
    jQuery(function ($) {
        var currentCardletId = '<c:out value="${param.cardletId}"/>';
        var cardletElement = $("#" + currentCardletId);
        var containerCard = null;
        var chartDiv = null;
        var myChart = null;
        cardletElement.on(javatmp.settings.javaTmpAjaxContainerReady, function (event) {
            containerCard = cardletElement.closest(".card");
            chartDiv = $('.map', cardletElement)[0];
            myChart = echarts.init(chartDiv);
            javatmp.plugins.blockWrapper(cardletElement);

            let option = {
                // color: ["#009C95", "#21ba45"],
                grid: {
                    containLabel : true
                },
                title: {
                    text: 'Random Current Time',
                    textStyle: {
                        fontFamily: $("body").css("font-family"),
                        fontSize: $("body").css("font-size"),
                        align: javatmp.settings.floatDefault
                    }
                },
                tooltip: {
                    trigger: 'axis'
                },
                calculable: true,
                xAxis: [
                    {
                        nameGap: false,
                        type: 'time',
                        boundaryGap: "auto",
                        axisLabel: {
                            formatter: (function (value) {
                                return moment(value).format('HH:mm:ss');
                            }),
                            interval: 0
                            // ,
                            // rotate: 30 //If the label names are too long you can manage this by rotating the label.
                        }
                    }
                ],
                yAxis: [
                    {
                        nameGap: false,
                        type: 'value'
                    }
                ],
                series: [
                    {
                        name: 'Random Value',
                        type: 'bar',
                        smooth: true,
                        itemStyle: {normal: {areaStyle: {type: 'default'}}},
                        data: []
                    }
                ]
            }

            myChart.setOption(option);

            function addValue() {
                console.log("add value run");
                let rand = Math.floor(Math.random() * 25); // from 0 to 24
                let slot = [moment().format(javatmp.settings.networkDateFormat), rand];
                option.series[0].data.push(slot);
                if(option.series[0].data.length > 60) {
                    option.series[0].data.shift();
                }
                myChart.setOption(option);
                // myChart.resize();
                setTimeout(addValue, 1000);
            }

            setTimeout(addValue, 1000);


            $(cardletElement).unblock();

            $(javatmp.settings.defaultOutputSelector).on(javatmp.settings.javaTmpContainerResizeEventName, function (event) {
                javatmp.util.waitForFinalEvent(function () {
                    $(chartDiv).css({"width": "100%"});
                    myChart.resize();
                }, 200, "@world-scatter-map");
            });

            containerCard.on(javatmp.settings.cardFullscreenCompress, function (event, card) {
                // when card compress by pressing the top right tool button
                $(chartDiv).css({"minHeight": 500});
                myChart.resize();
            });
            containerCard.on(javatmp.settings.cardFullscreenExpand, function (event, card) {
                // when card compress by pressing the top right tool button
                $(chartDiv).css({"minHeight": "90vh"});
                myChart.resize();
            });

            cardletElement.on(javatmp.settings.javaTmpContainerRemoveEventName, function (event) {
                containerCard.off(javatmp.settings.cardFullscreenCompress);
                containerCard.off(javatmp.settings.cardFullscreenExpand);
                return true;
            });
        });
    });
</script>
