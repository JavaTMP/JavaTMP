<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
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
                                <div class="table-responsive-sm">
                                    <table class="table table-bordered table-hover custom-invoice-table" id="tab_logic">
                                        <thead>
                                            <tr>
                                                <th style="width: 3rem;" class="text-center">#</th>
                                                <th style="width: 20rem;" class="text-center">Account</th>
                                                <th style="width: 12rem;" class="text-center">ModuleId</th>
                                                <th style="width: 12rem;">Moduel List</th>
                                                <th style="width: 12rem;">moduleTypeId</th>
                                                <th style="width: 15rem;">Cost Centre</th>
                                                <th style="width: 10rem;" class="text-center">Debit</th>
                                                <th style="width: 10rem;" class="text-center">Credit</th>
                                                <th style="width: 20rem;" class="text-center">Description</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr id='rowTemplate' style="display: none;">
                                                <td style="width: 3rem;">1</td>
                                                <td style="width: 20rem;">
                                                    <select class="select2wrapper form-control accountListSelect">
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
                                                <td style="width: 12rem;">
                                                    <select class="select2wrapper moduleId form-control" data-rule-required="false">
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
                                                <td style="width: 12rem;">
                                                    <select class="select2wrapper moduleRefId form-control" data-rule-required="false">
                                                        <c:choose>
                                                            <c:when test="${fn:length(requestScope.moduleTypeIds) > 0}">
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
                                                <td style="width: 12rem;">
                                                    <select class="select2wrapper moduleTypeId form-control" data-rule-required="false">
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
                                                <td style="width: 15rem;">
                                                    <select class="select2wrapper costCenters form-control" data-rule-required="false">
                                                        <c:choose>
                                                            <c:when test="${fn:length(requestScope.costcenters) > 0}">
                                                                <option value="">${labels['page.text.kindlySelect']}</option>
                                                                <c:forEach items="${requestScope.costcenters}" var="costCenter">
                                                                    <option  value="${costCenter.id}">${costCenter.name}</option>
                                                                </c:forEach>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <option value="">${labels['page.text.noRecordFound']}</option>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </select>
                                                </td>
                                                <td style="width: 10rem;">
                                                    <input class="form-control accountDebitField" type="number" placeholder='0.00' step="0.01" min="0" value="0.00"/>
                                                </td>
                                                <td style="width: 10rem;">
                                                    <input class="form-control accountCreditField" type="number" placeholder='0.00' step="0.01" min="0" value="0.00"/>
                                                </td>
                                                <td style="width: 15rem;">
                                                    <input class="form-control description" type="text"/>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                                <div class="row mb-1">
                                    <div class="col-md-12">
                                        <button type="button" id="add_row" class="btn btn-primary float-left">Add Row</button>
                                        <button type="button" id='delete_row' class="float-right btn btn-secondary">Delete Row</button>
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
                actualRow.find("select.accountListSelect").attr("name", "accounttransactionList[" + i + "][accountId]");
                actualRow.find("input.accountDebitField").attr("name", "accounttransactionList[" + i + "][debit]");
                actualRow.find("input.accountCreditField").attr("name", "accounttransactionList[" + i + "][credit]");
                actualRow.find("select.moduleId").attr("name", "accounttransactionList[" + i + "][moduleId]");
                actualRow.find("select.moduleRefId").attr("name", "accounttransactionList[" + i + "][moduleRefId]");
                actualRow.find("select.moduleTypeId").attr("name", "accounttransactionList[" + i + "][moduleTypeId]");
                actualRow.find("input.description").attr("name", "accounttransactionList[" + i + "][description]");
//                actualRow.find("select.costCenters").attr("name", "accounttransactionList[" + i + "][costcenterList][][id]");
                actualRow.find("select.costCenters").attr("name", "accounttransactionList[" + i + "][costcenterList][0][id]");
                javatmp.plugins.select2Wrapper(actualRow.find("select.select2wrapper"));
                i++;
            });

            $(document).on("change", "select.moduleId", function (event) {
                var currentSelectName = $(this).attr("name");
                var currentSelectVal = $(this).val();

                var parentRow = $(this).parents("tr");
                console.log(parentRow + " > " + currentSelectName + " > " + currentSelectVal);
                if (currentSelectVal) {
                    window.javatmp.plugins.ajaxJsonAction({
                        url: javatmp.settings.contextPath + "/entity/moduleItemList",
                        data: JSON.stringify({moduleId: currentSelectVal}),
                        success: function (response) {
//                            alert(JSON.stringify(response.data));
                            $("select.moduleRefId", parentRow).empty(); // Remove all <option> child tags.
                            $("select.moduleRefId", parentRow).append(// Append an object to the inside of the select box
                                    $("<option></option>") // Yes you can do this.
                                    .text("Kindly Select")
                                    .val(""));
                            $.each(response.data, function (index, item) { // Iterates through a collection
                                $("select.moduleRefId", parentRow).append(// Append an object to the inside of the select box
                                        $("<option></option>") // Yes you can do this.
                                        .text(item.name)
                                        .val(item.id));
                            });
                            $("select.moduleRefId", parentRow).trigger("change");
                        },
                        error: function (data) {

                        },
                        complete: function (jqXHR, textStatus) {

                        }
                    });
                } else {
                    $("select.moduleRefId", parentRow).empty().trigger("change"); // Remove all <option> child tags.
                }
            });
            $(document).on("change", "select.moduleRefId", function (event) {
                var currentSelectName = $(this).attr("name");
                var currentSelectVal = $(this).val();
                var parentRow = $(this).parents("tr");
                var currentModuleVal = $("select.moduleId", parentRow).val();
                console.log(parentRow + " > " + currentSelectName + " > " + currentSelectVal);
                if (currentSelectVal) {
                    var moduleTypeIds = {
                        1: [{"Trade Receivable": 1}, {"PDC - Collection": 2}, {"Returne CHQ - Collection": 3}],
                        2: [{"Trade Payable": 4}, {"PDC - Payment": 5}, {"Returne CHQ - Payments": 6}],
                        3: [{"Payroll": 7}, {"Annual Leave": 8}, {"Unpaid Leave": 9}, {"Employee Advances": 10}, {"End Of Service": 11}],
                        4: [{"Purchase": 12}, {"Sale - Inventory": 13}, {"Sale - Cost": 14}, {"Sale - Acc. Disposal": 15}, {"Sale - Profit": 16}],
                        5: [{"Purchase": 17}, {"Depreciation": 18}, {"Sale - Cost Disposal": 19}, {"Wastage/Writte-off": 20}],
                        6: [{"Service Sale Income": 23}, {"Service Sale Discount": 24}]
                    };
                    $("select.moduleTypeId", parentRow).empty(); // Remove all <option> child tags.
                    $("select.moduleTypeId", parentRow).append(// Append an object to the inside of the select box
                            $("<option></option>") // Yes you can do this.
                            .text("Kindly Select")
                            .val(""));
                    $.each(moduleTypeIds[currentModuleVal], function (index, item) { // Iterates through a collection
                        $.each(item, function (k, v) {
                            $("select.moduleTypeId", parentRow).append(// Append an object to the inside of the select box
                                    $("<option></option>") // Yes you can do this.
                                    .text(k)
                                    .val(v));
                        });
                    });
                    $("select.moduleTypeId", parentRow).trigger("change");
                } else {
                    $("select.moduleTypeId", parentRow).empty().trigger("change"); // Remove all <option> child tags.
                }
            });

            $(document).on("change", "select.moduleTypeId", function (event) {
                var currentSelectName = $(this).attr("name");
                var currentSelectVal = $(this).val();
                var parentRow = $(this).parents("tr");
                var currentModuleVal = $("select.moduleId", parentRow).val();
                var currentModuleRefIdVal = $("select.moduleRefId", parentRow).val();
                if (currentSelectVal) {
                    window.javatmp.plugins.ajaxJsonAction({
                        url: javatmp.settings.contextPath + "/entity/ModuleItemAccount",
                        data: JSON.stringify({moduleId: currentModuleVal, moduleTypeId: currentSelectVal, moduleRefId: currentModuleRefIdVal}),
                        success: function (response) {
                            $("select.accountListSelect", parentRow).empty();
                            $.each(response.data, function (index, item) {
                                $("select.accountListSelect", parentRow).append(
                                        $("<option></option>")
                                        .text(item.name)
                                        .val(item.id));
                            });
                            $("select.accountListSelect", parentRow).trigger("change");
                        },
                        error: function (data) {
                        },
                        complete: function (jqXHR, textStatus) {
                        }
                    });
                } else {
                    $("select.accountListSelect", parentRow).empty().trigger("change"); // Remove all <option> child tags.
                    $("#rowTemplate").find("select.accountListSelect option").each(function () {
                        if ($(this).val() === "")
                            return;
                        $("select.accountListSelect", parentRow).append(
                                $("<option></option>")
                                .text($(this).text()))
                                .val($(this).val());
                    });
                    $("select.accountListSelect", parentRow).trigger("change");
                }
            });


            $("#delete_row").click(function () {
                if (i > 0) {
                    $("#row" + (i - 1)).find("select.select2wrapper").select2('destroy');
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
                var testFormObj = $(this).serializeArray();
                console.log(testFormObj);
                var formObj = $(this).serializeObject();
                formObj.voucherTypeId = 1; // General Ledger Voucher
                formObj.transactionDate = moment(formObj.transactionDate, javatmp.settings.dateFormat).locale('en').format(javatmp.settings.networkDateFormat);
                console.log(JSON.stringify(formObj));

                function getClass(object) {
                    return Object.prototype.toString.call(object).slice(8, -1);
                }

                applyParameters = function (jsonObj, p) {
                    console.log("processing key [" + p + "]");
                    if (getClass(jsonObj) !== 'String') {
                        for (var key in jsonObj) {
                            if (jsonObj.hasOwnProperty(key)) {
                                if (jsonObj[key] !== "") {
                                    applyParameters(jsonObj[key]);
                                } else {
                                    console.log("jsonObj[key] equal empty [" + jsonObj + "]");
                                    jsonObj[key] = null;
                                }
                            }
                        }
                    }
                };
                applyParameters(formObj);

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
                $(document).off("change", "select.moduleId");
                $(document).off("change", "select.moduleRefId");
                $(document).off("change", "select.moduleTypeId");
                return true;
            });
        }
        );
    </script>
</div>