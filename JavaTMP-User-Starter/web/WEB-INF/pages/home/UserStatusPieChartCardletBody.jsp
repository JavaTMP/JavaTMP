<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="row d-flex align-items-center">
    <div class="col-6 text-center">
        <span class="d-block display-4 counter" id="userStatusPieChartCard_totalCount">0</span>
    </div>
    <div class="col-6 text-left">
        <div id="userStatusPieChart" style="min-height: 100px"></div>
    </div>
</div>
<script type="text/javascript">
    // get cardletId from request parameter:
    jQuery(function ($) {
        var currentCardletId = '<c:out value="${param.cardletId}"/>';
        var cardletElement = $("#" + currentCardletId);
        cardletElement.on(javatmp.settings.javaTmpAjaxContainerReady, function (event) {
            var userStatusPieChart = echarts.init(document.getElementById('userStatusPieChart'));
            var userStatusPieChartOption = {
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
                color: ['#28a745', '#ffc107'],
                series: [
                    {
                        clockwise: !javatmp.settings.isRTL,
                        name: '${labels['page.home.RegisteredUsers']}',
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
                                fontFamily: $("body").css("font-family"),
                                fontSize: $("body").css("font-size"),
                                align: javatmp.settings.floatDefault
                            }
                        },
                        data: [
                            {value: 0, name: '${labels['page.home.RegisteredUsers.active']}'},
                            {value: 0, name: '${labels['page.home.RegisteredUsers.inactive']}'}
                        ]
                    }
                ]
            };
            userStatusPieChart.setOption(userStatusPieChartOption);

            cardletElement.block({message: javatmp.settings.labels["global.loadingText"],
                overlayCSS: {
                    backgroundColor: '#000',
                    opacity: 0.7
                }});

            $.ajax({
                "type": "POST",
                cache: false,
                url: javatmp.settings.contextPath + "/stats/GetRegisteredUsersStatusesController",
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

                    $(cardletElement).unblock();
                },
                error: function (xhr, ajaxOptions, thrownError) {
                    $(cardletElement).unblock();
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