<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="row">
    <div class="col-lg-12">
        <div id="UsersBirthdayPerMonths" style="min-height: 300px"></div>
    </div>
</div>
<script type="text/javascript">
    // get cardletId from request parameter:
    jQuery(function ($) {
        var currentCardletId = '<c:out value="${param.cardletId}"/>';
        var cardletElement = $("#" + currentCardletId);
        cardletElement.on(javatmp.settings.javaTmpAjaxContainerReady, function (event) {
            var containerCard = cardletElement.closest(".card");
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


            var UsersBirthdayPerMonths = echarts.init(document.getElementById('UsersBirthdayPerMonths'));

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
                    formatter: formaterFunction
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
//                    axisLabel: {
//                        interval: 0
//                    },
                        axisLabel: {
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

            $(cardBody).block({message: javatmp.settings.labels["global.loadingText"],
                overlayCSS: {
                    backgroundColor: '#000',
                    opacity: 0.7
                }});

            $.ajax({
                "type": "POST",
                cache: false,
                url: javatmp.settings.contextPath + "/stats/GetUsersBirthdayCountController",
                dataType: "json",
                contentType: "application/json; charset=UTF-8",
                data: null,
                success: function (remoteContent) {
                    var dataArray = remoteContent.data;

                    var outputMonthsArray = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
                    for (var i = 0; i < dataArray.length; i++) {
                        outputMonthsArray[dataArray[i][0] - 1] += dataArray[i][1];
                    }

                    barChartOption.series[0].data = outputMonthsArray;

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

            cardletElement.on(javatmp.settings.javaTmpContainerResizeEventName, function (event) {
                UsersBirthdayPerMonths.resize();
            });

            containerCard.on(javatmp.settings.cardFullscreenCompress, function (event, card) {
                // when card compress by pressing the top right tool button
                var cardId = $(card).attr("id");
                if (cardId === "UsersBirthdayPerMonthsCard") {
                    $('#UsersBirthdayPerMonths').css({"minHeight": 300});
                    UsersBirthdayPerMonths.resize();
                }
            });

            containerCard.on(javatmp.settings.cardFullscreenExpand, function (event, card) {
                // when card compress by pressing the top right tool button
                var cardId = $(card).attr("id");
                if (cardId === "UsersBirthdayPerMonthsCard") {
                    $('#UsersBirthdayPerMonths').css({"minHeight": 500});
                    UsersBirthdayPerMonths.resize();
                }
            });

            cardletElement.on(javatmp.settings.javaTmpContainerRemoveEventName, function (event) {
                cardletElement.off(javatmp.settings.cardFullscreenCompress);
                cardletElement.off(javatmp.settings.cardFullscreenExpand);
                return true;
            });

        });
    });
</script>