<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="dynamic-ajax-content">
    <div class="row">
        <div class="col">
            <span>Mohamed sulibi</span>
        </div>
    </div>
    <script type="text/javascript">
        jQuery(function ($) {
            $('.testingCardItem .card-body').on(javatmp.settings.javaTmpAjaxContainerReady, function (event) {
                alert("cardlet content initialise");

            });
            $('.testingCardItem .card-body').on(javatmp.settings.javaTmpContainerRemoveEventName, function (event) {
                alert("cardlet content destory");
                return true;
            });
        });
    </script>
</div>