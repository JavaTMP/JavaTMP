<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="row d-flex align-items-center">
    <div class="col-12 text-center">
        <span class="d-block display-4 counter userStatusPieChartCard_totalCount">0</span>
    </div>
</div>
<div class="d-flex mt-3 border-top">
    <div class="flex-fill text-center">
        <a href="javascript:;" class="d-flex text-white p-2">
            ${labels['global.viewDetails']}
            <span class="ml-auto">
                <i class="fa fa-arrow-circle-next"></i>
            </span>
        </a>
    </div>
</div>
<script type="text/javascript">
    // get cardletId from request parameter:
    jQuery(function ($) {
        var currentCardletId = '<c:out value="${param.cardletId}"/>';
        var cardletElement = $("#" + currentCardletId);
        cardletElement.on(javatmp.settings.javaTmpAjaxContainerReady, function (event) {
            javatmp.plugins.blockWrapper(cardletElement);
            javatmp.plugins.ajaxJsonAction({
                data: JSON.stringify({
                    start: 0,
                    length: 1000000,
                }),
                url: javatmp.settings.contextPath + "/stats/getUsersCount",
                success: function (remoteContent) {
                    var allUsersCount = remoteContent;
                    $('.userStatusPieChartCard_totalCount', cardletElement).html(allUsersCount).counterUp({
                        delay: 10,
                        time: 1000
                    });
                },
                complete: function (jqXHR, textStatus) {
                    $(cardletElement).unblock();
                }
            });
            var ContainerResizeEventHandler = function (event) {
            };

            $(javatmp.settings.defaultOutputSelector).on(javatmp.settings.javaTmpContainerResizeEventName, ContainerResizeEventHandler);

            cardletElement.on(javatmp.settings.javaTmpContainerRemoveEventName, function (event) {
                $(javatmp.settings.defaultOutputSelector).off(javatmp.settings.javaTmpContainerResizeEventName, ContainerResizeEventHandler);
                return true;
            });
        });
    });
</script>
