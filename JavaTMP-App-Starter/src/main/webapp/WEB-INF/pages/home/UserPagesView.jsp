<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="row d-flex align-items-center">
    <div class="col-6 text-center">
        <span class="d-block display-4 counter today_totalCount">0</span>
    </div>
    <div class="col-6 text-center">
        <span class="d-block display-4 counter all_totalCount">0</span>
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
                }),
                url: javatmp.settings.contextPath + "/stats/getUserActivitiesCount",
                success: function (remoteContent) {
                    $('.all_totalCount', cardletElement).html(remoteContent).counterUp({
                        delay: 10,
                        time: 1000
                    });
                },
                complete: function (jqXHR, textStatus) {
                    $(cardletElement).unblock();
                }
            });
            javatmp.plugins.ajaxJsonAction({
                data: JSON.stringify({
                    advancedSearchQuery:{
                        "condition": "AND",
                        "rules": [
                            {
                                "field": "creationDate",
                                "type": "date",
                                "operator": "greater_or_equal",
                                "value": "18/04/2020"
                            }
                        ]
                    }
                }),
                url: javatmp.settings.contextPath + "/stats/getUserActivitiesCount",
                success: function (remoteContent) {
                    $('.today_totalCount', cardletElement).html(remoteContent).counterUp({
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
