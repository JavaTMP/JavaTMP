<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="dynamic-ajax-content">
    <div class="row">
        <div class="col">
            <div class="card my-3 bg-light shadow testingCardItem">
                <div class="card-header">
                    title
                    <div class="options float-right">
                        <a href="#" class="collapse"><i class="fa fa-chevron-up"></i></a>
                        <a href="#" class="fullscreen"><i class=" fa fa-expand"></i></a>
                        <a href="${pageContext.request.contextPath}/pages/home/UserStatusPieChartCardletBody" load-on-starup="true" class="reload"><i class="fa fa-sync"></i></a>
                    </div>
                </div>
                <div class="card-body" id=""></div>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        jQuery(function ($) {
            var card = $('.testingCardItem');
            var cardBody = card.children(".card-body");

            $(javatmp.settings.defaultOutputSelector).on(javatmp.settings.javaTmpAjaxContainerReady, function (event) {
                // fire AFTER all transition done and your ajax content is shown to user.
                cardBody.BootstrapActionable({
                    containerRemoveEventName: javatmp.settings.javaTmpContainerRemoveEventName,
                    containerReadyEventName: javatmp.settings.javaTmpAjaxContainerReady,
                    ajaxMethodType: javatmp.settings.httpMethod,
                    ajaxCache: true,
                    ajaxDefaultData: javatmp.settings.defaultPassData,
                    ajaxDataType: javatmp.settings.dataType,
                    ajaxBeforeSend: function (jqXHR, settings) {
                        var element = this.linkElement;
                        var outputDiv = this.outputElement;
                        var outputElementId = $(outputDiv).attr('id');
                        if (!!!outputElementId) {
                            outputElementId = javatmp.util.getUniqueID("cardlet");
                            $(outputDiv).attr("id", outputElementId);
                        }
                        var url = settings.url;
                        var separator = url.indexOf('?') > -1 ? '&' : '?';
                        url += separator + encodeURIComponent("cardletId") + "=" + encodeURIComponent(outputElementId);
                        settings.url = url;
//                        alert(settings.url);
                    }
                });

                $("a.reload", card).on("click", function (e) {
                    cardBody.BootstrapActionable("populateByLinkEvent", {
                        linkElement: $(this),
                        linkEvent: e
                    });
                });
                $(javatmp.settings.defaultOutputSelector).find("[load-on-starup=true]").each(function () {
                    $(this).trigger("click");
                });
            });

            $(javatmp.settings.defaultOutputSelector).on(javatmp.settings.javaTmpContainerRemoveEventName, function (event) {
                $(".testingCardItem a.reload").off();
                return true;
            });
        });
    </script>
</div>