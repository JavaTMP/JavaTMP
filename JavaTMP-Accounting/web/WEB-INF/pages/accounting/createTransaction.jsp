<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="dynamic-ajax-content">
    <h5 class="my-3">Create Transaction</h5>
    <hr/>
    <div class="row">
        <div class="col-lg-12 col-md-12">
            <div class="card">
                <div class="card-header">
                    Create New Journal Entry Transaction
                    <div class="options float-right">
                        <a href="#" class="collapse"><i class="fa fa-chevron-up"></i></a>
                        <a href="#" class="fullscreen"><i class=" fa fa-expand"></i></a>
                    </div>
                </div>
                <div class="card-body">
                    <div class="row">
                        <div class="col">
                            <form accept-charset="UTF-8" autocomplete="off" id="addNewTransaction" class="form" action="${pageContext.request.contextPath}/accounting/CreateTransaction" method="post" novalidate="novalidate">
                                <div class="form-row">
                                    <div class="col-md-8">
                                        <div class="form-row">
                                            <div class="col-md-6">
                                                <div class="form-group form-row">
                                                    <label class="control-label col-sm-4 col-form-label">code</label>
                                                    <div class="col-sm-8">
                                                        <input class="form-control" type="text" placeholder=""
                                                               name="code" value=""
                                                               data-rule-required="true"
                                                               >
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group form-row">
                                                    <label class="control-label col-sm-4 col-form-label">entity</label>
                                                    <div class="col-sm-8">
                                                        <input class="form-control" type="text" placeholder=""
                                                               name="entity" value=""
                                                               data-rule-required="false"
                                                               >
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group form-row">
                                                    <label class="control-label col-sm-4 col-form-label">Date</label>
                                                    <div class="col-sm-8">
                                                        <input class="form-control" type="text" placeholder=""
                                                               name="transactionDate" value=""
                                                               data-rule-required="true">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group form-row">
                                                    <label class="control-label col-sm-4 col-form-label">specialNumber</label>
                                                    <div class="col-sm-8">
                                                        <input class="form-control" type="text" placeholder=""
                                                               name="specialNumber" value=""
                                                               data-rule-required="false"
                                                               >
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-12">
                                                <div class="form-group form-row">
                                                    <label class="control-label col-sm-2 col-form-label">note</label>
                                                    <div class="col-sm-10">
                                                        <input class="form-control" type="text" placeholder=""
                                                               name="note" value=""
                                                               data-rule-required="false"
                                                               >
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="table-responsive">
                                    <table class="table table-bordered table-hover custom-invoice-table" id="tab_logic">
                                        <thead>
                                            <tr>
                                                <th style="width: 3rem;" class="text-center">#</th>
                                                <th class="text-center">Account</th>
                                                <th class="text-center" style="width: 12rem;">ModuleId</th>
                                                <th class="text-center" style="width: 12rem;">Moduel List</th>
                                                <th class="text-center" style="width: 12rem;">moduleTypeId</th>
                                                <th style="width: 8rem;" class="text-center">Debit</th>
                                                <th style="width: 8rem;" class="text-center">Credit</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr id='rowTemplate' style="display: none;">
                                                <td style="width: 3rem;">1</td>
                                                <td>
                                                    <select class="accountListSelect form-control">
                                                        <c:choose>
                                                            <c:when test="${fn:length(requestScope.accounts) > 0}">
                                                                <option value="">${labels['page.text.kindlySelect']}</option>
                                                                <c:forEach items="${requestScope.accounts}" var="account">
                                                                    <option  value="${account.id}">${account.accountCode} - ${account.name}</option>
                                                                </c:forEach>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <option value="">${labels['page.text.noRecordFound']}</option>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </select>
                                                </td>
                                                <td>
                                                    <select class="moduleId form-control" data-rule-required="false">
                                                        <c:choose>
                                                            <c:when test="${fn:length(requestScope.modules) > 0}">
                                                                <option value="">${labels['page.text.kindlySelect']}</option>
                                                                <c:forEach items="${requestScope.modules}" var="module">
                                                                    <option  value="${module.id}">${module.name}</option>
                                                                </c:forEach>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <option value="">${labels['page.text.noRecordFound']}</option>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </select>
                                                </td>
                                                <td>
                                                    <select class="moduleRefId form-control" data-rule-required="false">
                                                        <c:choose>
                                                            <c:when test="${fn:length(requestScope.moduleTypeIds) > 0}">
                                                                <option value="">${labels['page.text.kindlySelect']}</option>
                                                                <c:forEach items="${requestScope.moduleTypeIds}" var="moduleTypeId">
                                                                    <option  value="${moduleTypeId.id}">${moduleTypeId.name}</option>
                                                                </c:forEach>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <option value="">${labels['page.text.noRecordFound']}</option>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </select>
                                                </td>
                                                <td>
                                                    <select class="moduleTypeId form-control" data-rule-required="false">
                                                        <c:choose>
                                                            <c:when test="${fn:length(requestScope.moduleTypeIds) > 0}">
                                                                <option value="">${labels['page.text.kindlySelect']}</option>
                                                                <c:forEach items="${requestScope.moduleTypeIds}" var="moduleTypeId">
                                                                    <option  value="${moduleTypeId.id}">${moduleTypeId.name}</option>
                                                                </c:forEach>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <option value="">${labels['page.text.noRecordFound']}</option>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </select>
                                                </td>
                                                <td style="width: 8rem;">
                                                    <input class="form-control accountDebitField" type="number" placeholder='0.00' step="0.01" min="0" value="0.00"/></td>
                                                <td style="width: 8rem;">
                                                    <input class="form-control accountCreditField" type="number" placeholder='0.00' step="0.01" min="0" value="0.00"/></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                                <div class="row mb-1">
                                    <div class="col-md-12">
                                        <button type="button" id="add_row" class="btn btn-primary float-left">Add Row</button>
                                        <button type="button" id='delete_row' class="float-right btn btn-default">Delete Row</button>
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="col-lg-12">
                                        <div class="form-group">
                                            <input type="submit" class="btn btn-success" value="Post New Transaction"/>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
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
    </style>
    <style type="text/css">
        /*
        Embed CSS styling for current page.
        */
        .custom-invoice-table tbody td {
            padding: 0;
        }
        .custom-invoice-table tbody td:first-child {
            text-align: center;
            vertical-align: middle;
        }
        .custom-invoice-table > tbody > tr > td > input {
            border-radius: 0;
        }
        .custom-invoice-table > tbody > tr > td > .input-group > .form-control {
            border-radius: 0;
        }
        .custom-invoice-table > tbody > tr > td > .input-group > .input-group-append > .input-group-text {
            border-radius: 0;
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
            function calc() {

            }
            var i = 0;
            $("#add_row").click(function () {
                var newRowId = "row" + i;
                var newRowObject = $("#rowTemplate").clone(false).attr("id", newRowId).css({"display": ""});
                var actualRow = $('#tab_logic').append(newRowObject).find("#" + newRowId);
                actualRow.find('td:first-child').html(i + 1);
                actualRow.find("select.accountListSelect").attr("name", "accounttransactionList[][accountId]");
                actualRow.find("input.accountDebitField").attr("name", "accounttransactionList[][debit]");
                actualRow.find("input.accountCreditField").attr("name", "accounttransactionList[][credit]");
                actualRow.find("select.moduleId").attr("name", "accounttransactionList[][moduleId]");
                actualRow.find("select.moduleRefId").attr("name", "accounttransactionList[][moduleRefId]");
                actualRow.find("select.moduleTypeId").attr("name", "accounttransactionList[][moduleTypeId]");

                javatmp.plugins.select2Wrapper(actualRow.find("select.accountListSelect"));
                i++;
            });

            $("#delete_row").click(function () {
                if (i > 0) {
                    $("#row" + (i - 1)).find("select.accountListSelect").select2('destroy');
                    $("#row" + (i - 1)).remove();
                    i--;
                }
                calc();
            });

            $('#tab_logic tbody').on('keyup change', function () {
                calc();
            });

            $("#add_row").trigger("click");
            $("#add_row").trigger("click");

            var form = $('#addNewTransaction');
            var validator = null;

            form.on("submit", function (event) {
                event.preventDefault();
                if (!$(this).valid()) {
                    return false;
                }
                var formObj = $(this).serializeObject();
                formObj.voucherTypeId = 1; // General Ledger Voucher
                formObj.transactionDate = moment(formObj.transactionDate, javatmp.settings.dateFormat).locale('en').format(javatmp.settings.networkDateFormat);
                console.log(JSON.stringify(formObj));
                window.javatmp.plugins.ajaxAction(
                        $(this).attr("action"),
                        formObj,
                        function (data) {
                        }
                );
            });

            // initialize jQuery Validation plugin using global data.
            validator = form.validate();

            var transactionDateInputMask = javatmp.plugins.inputmaskWrapperForDate(form.find("input[name='transactionDate']"));
            var transactionDateDatePicker = javatmp.plugins.daterangepickerWrapperForDate(form.find("input[name='transactionDate']"));

            var transactionTypeIdSelect = javatmp.plugins.select2Wrapper(form.find("select[name='transactionTypeId']"));
            var moduleIdSelect = javatmp.plugins.select2Wrapper(form.find("select[name='moduleId']"));

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