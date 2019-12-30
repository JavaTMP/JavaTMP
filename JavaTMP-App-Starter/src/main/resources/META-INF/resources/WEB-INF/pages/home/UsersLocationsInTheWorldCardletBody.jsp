<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="row">
    <div class="col-lg-12">
        <div class="UsersLocationsInTheWorld" style="min-height: 300px"></div>
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
            chartDiv = $('.UsersLocationsInTheWorld', cardletElement)[0];
            var UsersLocationsInTheWorld = echarts.init(chartDiv);

            var UsersLocationsInTheWorldOption = {
                tooltip: {
                    trigger: 'item',
                    textStyle: {
                        fontFamily: $("body").css("font-family"),
                        fontSize: $("body").css("font-size"),
                        align: javatmp.settings.floatDefault
                    },
                    formatter: function (params) {
                        if (params.value) {
                            console.log("value = " + params.value);
                            var value = (params.value + '').split('.');
                            value = value[0].replace(/(\d{1,3})(?=(?:\d{3})+(?!\d))/g, '$1,');
                            return params.seriesName + '<br/>' + params.name + ' : ' + value;
                        }
                    }
                },
                visualMap: {
                    min: 0,
                    max: 100,
                    left: javatmp.settings.floatDefault,
                    top: 'bottom',
                    text: ['${labels['page.home.UsersLocations.high']}', '${labels['page.home.UsersLocations.low']}'],
                    seriesIndex: [0],
                    inRange: {
                        color: ['#ffffff', '#007bff']
                    },
                    textStyle: {
                        fontFamily: $("body").css("font-family"),
                        fontSize: $("body").css("font-size"),
                        align: javatmp.settings.floatDefault
                    },
                    calculable: true
                },
                series: [
                    {
                        name: "${labels['page.home.UsersLocations']}",
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

            var cardBody = cardletElement;

            javatmp.plugins.blockWrapper(cardBody);

            javatmp.plugins.ajaxJsonAction({
                url: javatmp.settings.contextPath + "/stats/GetUsersLocationsCountController",
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
                },
                complete: function (jqXHR, textStatus) {
                    $(cardBody).unblock();
                }
            });

            $(javatmp.settings.defaultOutputSelector).on(javatmp.settings.javaTmpContainerResizeEventName, function (event) {
                $(chartDiv).css({"width": "100%"});
                UsersLocationsInTheWorld.resize();
            });

            containerCard.on(javatmp.settings.cardFullscreenCompress, function (event, card) {
                // when card compress by pressing the top right tool button
                $(chartDiv).css({"minHeight": 300});
                UsersLocationsInTheWorld.resize();
            });
            containerCard.on(javatmp.settings.cardFullscreenExpand, function (event, card) {
                // when card compress by pressing the top right tool button
                $(chartDiv).css({"minHeight": "90vh"});
                UsersLocationsInTheWorld.resize();
            });

            cardletElement.on(javatmp.settings.javaTmpContainerRemoveEventName, function (event) {
                containerCard.off(javatmp.settings.cardFullscreenCompress);
                containerCard.off(javatmp.settings.cardFullscreenExpand);
                return true;
            });
        });
    });
</script>