<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="row">
    <div class="col-lg-12">
        <div class="map" style="min-height: 500px"></div>
    </div>
</div>
<%--https://code.highcharts.com/mapdata/--%>
<%--https://github.com/echarts-maps/echarts-countries-js--%>
<%--https://github.com/echarts-maps/echarts-mapmaker--%>
<script src="${pageContext.request.contextPath}/assets/data/United_Arab_Emirates.js?v=4"
        type="text/javascript"></script>
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

            myChart.showLoading();

            let option = {
                title: {
                    text: 'UAE Map',
                    subtext: 'Map Of United Arab Emirates',
                    sublink: 'http://www.javatmp.com/',
                    left: 'right'
                },
                tooltip: {

                    trigger: 'item',
                    showDelay: 0,
                    transitionDuration: 0.2,
                    formatter: function (params) {
                        var value = (params.value + '').split('.');
                        value = value[0].replace(/(\d{1,3})(?=(?:\d{3})+(?!\d))/g, '$1,');
                        return params.seriesName + '<br/>' + params.name + ': ' + value;
                    }
                },
                visualMap: {
                    left: 'right',
                    min: (1000000),
                    max: (13000000),
                    inRange: {
                        color: ['#ffffff', '#F6FFE8', '#C3FFB5', '#90FF82', '#5DD84F']
                    },
                    text: ['High', 'Low'],           // 文本，默认为数值文本
                    calculable: true
                },
                toolbox: {
                    show: true,
                    //orient: 'vertical',
                    left: 'left',
                    top: 'top',
                    feature: {
                        dataView: {
                            lang: ['data view', 'turn off', 'refresh'],
                            title: "Data View",
                            readOnly: false
                        },
                        restore: {
                            title: "Refresh Restore"
                        },
                        saveAsImage: {
                            title: "Save As Image"
                        }
                    }
                },
                series: [
                    {
                        name: 'UAE FAKE People Estimates',
                        type: 'map',
                        roam: true,
                        map: 'UAE',
                        emphasis: {
                            label: {
                                show: true
                            }
                        },
                        data: [
                            {name: 'Abu Dhabi', value: 11731449},
                            {name: 'Dubai', value: 4822023},
                            {name: 'Sharjah', value: 6553255},
                            {name: 'Ajman', value: 2949131},
                            {name: 'Umm Al Qaywayn', value: 1941430},
                            {name: 'Ras Al Khaymah', value: 5187582},
                            {name: 'Fujayrah', value: 3590347}
                        ]
                    }
                ]
            };

            myChart.setOption(option);
            myChart.hideLoading();


            $(javatmp.settings.defaultOutputSelector).on(javatmp.settings.javaTmpContainerResizeEventName, function (event) {
                $(chartDiv).css({"width": "100%"});
                myChart.resize();
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
