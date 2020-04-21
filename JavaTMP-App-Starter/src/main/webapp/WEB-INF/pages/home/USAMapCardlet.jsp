<%@page contentType="text/html" pageEncoding="UTF-8"%>
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

            myChart.showLoading();

            $.get(javatmp.settings.contextPath + '/assets/data/USA.json', function (usaJson) {
                myChart.hideLoading();

                echarts.registerMap('USA', usaJson, {
                    // Alaska: {              // 把阿拉斯加移到美国主大陆左下方
                    //     left: -131,
                    //     top: 25,
                    //     width: 15
                    // },
                    // Hawaii: {
                    //     left: -110,        // 夏威夷
                    //     top: 28,
                    //     width: 5
                    // },
                    // 'Puerto Rico': {       // 波多黎各
                    //     left: -76,
                    //     top: 26,
                    //     width: 2
                    // }
                });
                option = {
                    title: {
                        text: 'USA Population Estimates (2012)',
                        subtext: 'Data from www.census.gov',
                        sublink: 'http://www.census.gov/popest/data/datasets.html',
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
                        min: 500000,
                        max: 38000000,
                        inRange: {
                            color: ['#ffffff', '#007bff', '#0048CC', '#001599', '#000066']
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
                            name: 'USA PopEstimates',
                            type: 'map',
                            roam: true,
                            map: 'USA',
                            emphasis: {
                                label: {
                                    show: true
                                }
                            },
                            // 文本位置修正
                            textFixed: {
                                Alaska: [20, -20]
                            },
                            data:[
                                {name: 'Alabama', value: 4822023},
                                {name: 'Alaska', value: 731449},
                                {name: 'Arizona', value: 6553255},
                                {name: 'Arkansas', value: 2949131},
                                {name: 'California', value: 38041430},
                                {name: 'Colorado', value: 5187582},
                                {name: 'Connecticut', value: 3590347},
                                {name: 'Delaware', value: 917092},
                                {name: 'District of Columbia', value: 632323},
                                {name: 'Florida', value: 19317568},
                                {name: 'Georgia', value: 9919945},
                                {name: 'Hawaii', value: 1392313},
                                {name: 'Idaho', value: 1595728},
                                {name: 'Illinois', value: 12875255},
                                {name: 'Indiana', value: 6537334},
                                {name: 'Iowa', value: 3074186},
                                {name: 'Kansas', value: 2885905},
                                {name: 'Kentucky', value: 4380415},
                                {name: 'Louisiana', value: 4601893},
                                {name: 'Maine', value: 1329192},
                                {name: 'Maryland', value: 5884563},
                                {name: 'Massachusetts', value: 6646144},
                                {name: 'Michigan', value: 9883360},
                                {name: 'Minnesota', value: 5379139},
                                {name: 'Mississippi', value: 2984926},
                                {name: 'Missouri', value: 6021988},
                                {name: 'Montana', value: 1005141},
                                {name: 'Nebraska', value: 1855525},
                                {name: 'Nevada', value: 2758931},
                                {name: 'New Hampshire', value: 1320718},
                                {name: 'New Jersey', value: 8864590},
                                {name: 'New Mexico', value: 2085538},
                                {name: 'New York', value: 19570261},
                                {name: 'North Carolina', value: 9752073},
                                {name: 'North Dakota', value: 699628},
                                {name: 'Ohio', value: 11544225},
                                {name: 'Oklahoma', value: 3814820},
                                {name: 'Oregon', value: 3899353},
                                {name: 'Pennsylvania', value: 12763536},
                                {name: 'Rhode Island', value: 1050292},
                                {name: 'South Carolina', value: 4723723},
                                {name: 'South Dakota', value: 833354},
                                {name: 'Tennessee', value: 6456243},
                                {name: 'Texas', value: 26059203},
                                {name: 'Utah', value: 2855287},
                                {name: 'Vermont', value: 626011},
                                {name: 'Virginia', value: 8185867},
                                {name: 'Washington', value: 6897012},
                                {name: 'West Virginia', value: 1855413},
                                {name: 'Wisconsin', value: 5726398},
                                {name: 'Wyoming', value: 576412},
                                {name: 'Puerto Rico', value: 3667084}
                            ]
                        }
                    ]
                };

                myChart.setOption(option);
            });

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
