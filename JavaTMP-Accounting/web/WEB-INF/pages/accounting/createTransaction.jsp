<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="dynamic-ajax-content">
    <h5 class="my-3">Create Transaction</h5>
    <hr/>
    <div class="row justify-content-md-center">
        <div class="col-lg-6 col-md-9">
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
                                    <div class="col-md-12">
                                        <div class="form-group form-row">
                                            <label class="text-sm-right control-label col-sm-5 col-form-label">referenceCode</label>
                                            <div class="col-sm-7">
                                                <input class="form-control" type="text" placeholder=""
                                                       name="referenceCode" value=""
                                                       data-rule-required="true"
                                                       >
                                            </div>
                                        </div>
                                        <div class="form-group form-row">
                                            <label class="text-sm-right control-label col-sm-5 col-form-label">transactionTypeId</label>
                                            <div class="col-sm-7">
                                                <select name="transactionTypeId" class="form-control" data-rule-required="true">
                                                    <c:choose>
                                                        <c:when test="${fn:length(requestScope.transactiontypes) > 0}">
                                                            <option value="">${labels['page.text.kindlySelect']}</option>
                                                            <c:forEach items="${requestScope.transactiontypes}" var="transactiontype">
                                                                <option  value="${transactiontype.id}">${transactiontype.name}</option>
                                                            </c:forEach>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <option value="">${labels['page.text.noRecordFound']}</option>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="form-group form-row">
                                            <label class="text-sm-right control-label col-sm-5 col-form-label">moduleId</label>
                                            <div class="col-sm-7">
                                                <select name="moduleId" class="form-control" data-rule-required="true">
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
                                            </div>
                                        </div>
                                        <div class="form-group form-row">
                                            <label class="text-sm-right control-label col-sm-5 col-form-label">transactionDate</label>
                                            <div class="col-sm-7">
                                                <input class="form-control" type="text" placeholder=""
                                                       name="transactionDate" value=""
                                                       data-rule-required="true"
                                                       >
                                            </div>
                                        </div>
                                        <div class="form-group form-row">
                                            <label class="text-sm-right control-label col-sm-5 col-form-label">description</label>
                                            <div class="col-sm-7">
                                                <input class="form-control" type="text" placeholder=""
                                                       name="description" value=""
                                                       data-rule-required="true"
                                                       >
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
                                                <th style="width: 8rem;" class="text-center">Debit</th>
                                                <th style="width: 8rem;" class="text-center">Credit</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr id='addr0'>
                                                <td style="width: 3rem;">1</td>
                                                <td><input type="text" name='accounttransactionList.accountId'  placeholder='Enter Account Name' class="form-control"/></td>
                                                <td style="width: 8rem;"><input type="number" name='accounttransactionList.amount' placeholder='0.00' class="form-control" step="0.01" min="0"/></td>
                                                <td style="width: 8rem;"><input type="number" name='accounttransactionList.amount' placeholder='0.00' class="form-control" step="0.01" min="0"/></td>
                                            </tr>
                                            <tr id='addr1'>
                                                <td style="width: 3rem;">2</td>
                                                <td><input type="text" name='accounttransactionList.accountId'  placeholder='Enter Account Name' class="form-control"/></td>
                                                <td style="width: 8rem;"><input type="number" name='accounttransactionList.amount' placeholder='0.00' class="form-control" step="0.01" min="0"/></td>
                                                <td style="width: 8rem;"><input type="number" name='accounttransactionList.amount' placeholder='0.00' class="form-control" step="0.01" min="0"/></td>
                                            </tr>
                                            <tr id='addr2'></tr>
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
            var i = 2;
            $("#add_row").click(function () {
                b = i - 1;
                $('#addr' + i).html($('#addr' + b).html()).find('td:first-child').html(i + 1);
                $('#tab_logic').append('<tr id="addr' + (i + 1) + '"></tr>');
                i++;
            });

            $("#delete_row").click(function () {
                if (i > 2) {
                    $("#addr" + (i - 1)).html('');
                    i--;
                }
                calc();
            });

            $('#tab_logic tbody').on('keyup change', function () {
                calc();
            });

            $('#tax').on('keyup change', function () {
                calc_total();
            });

            var form = $('#addNewTransaction');
            var validator = null;

            form.ajaxForm({
                clearForm: false, // clear all form fields after successful submit
                resetForm: false, // reset the form after successful submit
                beforeSerialize: function ($form, options) {
                    if (!$form.valid()) {
                        return false;
                    }
                },
                beforeSubmit: function (formData, jqForm, options) {
                    for (var i = 0; i < formData.length; i++) {
                        if (formData[i].name === "transactionDate") {
                            var value = formData[i].value;
                            var newDate = moment(value, javatmp.settings.dateFormat).locale('en').format(javatmp.settings.networkDateFormat);
                            formData[i].value = newDate;
                            break;
                        }
                    }

                },
                success: function (response, statusText, xhr, $form) {
                    BootstrapModalWrapperFactory.createModal({
                        title: "${labels['global.response']}",
                        message: response.message
                    }).show();
                },
                error: function (xhr, status, error, $form) {
                    var errorMsg = xhr.responseText;
                    try {
                        var jsonData = $.parseJSON(errorMsg);
                        errorMsg = jsonData.message;
                    } catch (error) {
                    }
                    BootstrapModalWrapperFactory.createModal({
                        title: "${labels['global.error']}" + " : " + xhr.status,
                        message: errorMsg
                    }).show();
                }
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