<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="dynamic-ajax-content grid-gutter-padding">
    <h5 class="my-3">Trial Balance</h5>
    <hr/>
    <div class="row">
        <div class="col-lg-7 col-md-7">
            <div class="card">
                <div class="card-header">
                    <div class="options float-right">
                        <a href="#" class="collapse"><i class="fa fa-chevron-up"></i></a>
                        <a href="#" class="fullscreen"><i class=" fa fa-expand"></i></a>
                    </div>
                </div>
                <div class="card-body p-0">
                    <div class="table-responsive">
                        <table class="table table-sm table-bordered table-hover trialBalanceAccountTable">
                            <thead>
                                <tr>
                                    <th style="width: 10rem;" class="text-center">Account Code</th>
                                    <th class="text-center">Account Name</th>
                                    <th style="width: 10rem;" class="text-center">Debit</th>
                                    <th style="width: 10rem;" class="text-center">Credit</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:choose>
                                    <c:when test="${fn:length(requestScope.accounts) > 0}">
                                        <c:forEach items="${requestScope.accounts}" var="account">
                                            <fmt:formatNumber type="currency" currencySymbol="" minFractionDigits="2" maxFractionDigits="2" value="${account.balance}" var="formatedBalance"/>
                                            <tr accountId="${account.id}">
                                                <td style="width: 10rem;">${account.accountCode}</td>
                                                <td>${account.name}</td>
                                                <td style="width: 5rem;">${account.accountgroup.type.debitSign == 1 ? formatedBalance : ""}</td>
                                                <td style="width: 5rem;">${account.accountgroup.type.creditSign == 1 ? formatedBalance : ""}</td>
                                            </tr>
                                        </c:forEach>
                                        <fmt:formatNumber type="currency" currencySymbol="" minFractionDigits="2" maxFractionDigits="2" value="${totalBalance.debit}" var="formatedTotalBalanceDebit"/>
                                        <fmt:formatNumber type="currency" currencySymbol="" minFractionDigits="2" maxFractionDigits="2" value="${totalBalance.credit}" var="formatedTotalBalanceCredit"/>
                                        <tr accountId="0">
                                            <td colspan="2" class="text-right">Total:</td>
                                            <td style="width: 5rem;">${formatedTotalBalanceDebit}</td>
                                            <td style="width: 5rem;">${formatedTotalBalanceCredit}</td>
                                        </tr>
                                    </c:when>
                                    <c:otherwise>
                                        <tr><td colspan="4">${labels['page.text.noRecordFound']}</td></tr>
                                        </c:otherwise>
                                    </c:choose>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--
    Reference Your external Stylesheet file here
    if your feature or plugins could not support to run globally.
    <link href="components/" rel="stylesheet">
    -->
    <style type="text/css">
        /*
        Embed CSS styling for current page.
        */
        .trialBalanceAccountTable tbody tr{
            cursor: pointer;
        }
    </style>

    <!--
    Reference Your external Javascript file here
    if your feature or plugins could not support to run globally.
    <script src="components/"></script>
    -->
    <script type="text/javascript">
        // You could write safely Javascript code here too as our template
        // should load mandatory libraries and plugins before.
        // <--- HERE --->
        //

        jQuery(function ($) {
            // any code put here will be run after content attach to ajax output container and before
            // controll return to main javascript file.
            // <--- HERE --->
            //

            $(".trialBalanceAccountTable tbody tr").click(function () {
                if ($(this).hasClass("table-active"))
                    $(this).removeClass('table-active');
                else
                    $(this).addClass('table-active').siblings().removeClass('table-active');
            });

            $(javatmp.settings.defaultOutputSelector).on(javatmp.settings.javaTmpAjaxContainerReady, function (event) {
                // fire AFTER all transition done and your ajax content is shown to user.
            });

            $(javatmp.settings.defaultOutputSelector).on(javatmp.settings.javaTmpContainerResizeEventName, function (event) {
                // fire when user resize browser window or sidebar hide / show
            });

            $(javatmp.settings.defaultOutputSelector).on(javatmp.settings.cardFullscreenCompress, function (event, card) {
                // when card compress by pressing the top right tool button
            });

            $(javatmp.settings.defaultOutputSelector).on(javatmp.settings.cardFullscreenExpand, function (event, card) {
                // when card Expand by pressing the top right tool button
            });

            /**
             * When another sidebar menu item pressed and before container issues new ajax request.
             * You can cancel, destroy, or remove any thing here before replace main output ajax container.
             * return false or event.preventDefault() will cancel ajax and stay you in the current page and do nothing.
             **/
            $(javatmp.settings.defaultOutputSelector).on(javatmp.settings.javaTmpContainerRemoveEventName, function (event) {
                $(javatmp.settings.defaultOutputSelector).off(javatmp.settings.cardFullscreenCompress);
                $(javatmp.settings.defaultOutputSelector).off(javatmp.settings.cardFullscreenExpand);
                return true;
            });
        });
    </script>
</div>