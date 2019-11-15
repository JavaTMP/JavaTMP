<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="dynamic-ajax-content grid-gutter-padding">
    <div class="row">
        <div class="col-lg-12">
            <form accept-charset="UTF-8" autocomplete="off" id="addNewAccountPopup" class="form"
                  action="${pageContext.request.contextPath}/accounting/UpdateAccountPopup" method="post" novalidate="novalidate">
                <div class="form-row">
                    <div class="col-lg-12">
                        <div class="form-group form-row">
                            <label class="control-label col-sm-5 col-form-label">Id</label>
                            <div class="col-sm-7">
                                <input readonly="readonly" class="form-control-plaintext" type="text" name="id"
                                       value="${requestScope.account.id}">
                            </div>
                        </div>
                        <div class="form-group form-row">
                            <label class="control-label col-sm-5 col-form-label">Creation Date</label>
                            <div class="col-sm-7">
                                <input disabled="" readonly="readonly" class="form-control-plaintext disabled" type="text" name="creationDate"
                                       value="${requestScope.account.creationDate}">
                            </div>
                        </div>
                        <div class="form-group form-row">
                            <label class="text-sm-right control-label col-sm-5 col-form-label">Account Code</label>
                            <div class="col-sm-7">
                                <input class="form-control" type="text" placeholder=""
                                       name="accountCode" value="${requestScope.account.accountCode}"
                                       data-rule-required="true"
                                       >
                            </div>
                        </div>
                        <div class="form-group form-row">
                            <label class="text-sm-right control-label col-sm-5 col-form-label">Account Name</label>
                            <div class="col-sm-7">
                                <input class="form-control" type="text" placeholder=""
                                       name="name" value="${requestScope.account.name}"
                                       data-rule-required="true"
                                       >
                            </div>
                        </div>
                        <div class="form-group form-row">
                            <label class="text-sm-right control-label col-sm-5 col-form-label">Description</label>
                            <div class="col-sm-7">
                                <input class="form-control" type="text" placeholder=""
                                       name="description" value="${requestScope.account.description}"
                                       data-rule-required="true"
                                       >
                            </div>
                        </div>
                        <div class="form-group form-row">
                            <label class="text-sm-right control-label col-sm-5 col-form-label">Account Group</label>
                            <div class="col-sm-7">
                                <select name="accountGroupId" class="form-control">
                                    <c:choose>
                                        <c:when test="${fn:length(requestScope.accountGroups) > 0}">
                                            <option value="">${labels['page.text.kindlySelect']}</option>
                                            <c:forEach items="${requestScope.accountGroups}" var="accountGroup">
                                                <option ${requestScope.account.accountGroup == accountGroup.id ? 'selected="selected"' : ''} value="${accountGroup.id}">${accountGroup.name}</option>
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
                            <label class="text-sm-right control-label col-sm-5 col-form-label">Account Balance</label>
                            <div class="col-sm-7">
                                <input class="form-control" type="text" placeholder=""
                                       name="balance" value="${requestScope.account.balance}"
                                       data-rule-required="true"
                                       >
                            </div>
                        </div>
                        <div class="form-group form-row">
                            <label class="text-sm-right control-label col-sm-5 col-form-label">Status</label>
                            <div class="col-sm-7">
                                <select name="status" class="custom-select" data-rule-required="true">
                                    <option ${requestScope.account.status == 1 ? 'selected="selected"' : ''} value="1">Active</option>
                                    <option ${requestScope.account.status == 0 ? 'selected="selected"' : ''} value="0">Inactive</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group form-row">
                            <label class="text-sm-right control-label col-sm-5 col-form-label">Parent Account</label>
                            <div class="col-sm-7">
                                <select name="parentAccountId" class="form-control">
                                    <c:choose>
                                        <c:when test="${fn:length(requestScope.accounts) > 0}">
                                            <option value="">${labels['page.text.kindlySelect']}</option>
                                            <c:forEach items="${requestScope.accounts}" var="account">
                                                <option ${requestScope.account.parentAccountId == account.id ? 'selected="selected"' : ''} value="${account.id}">${account.accountCode} - ${account.name}</option>
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
                            <label class="text-sm-right control-label col-sm-5 col-form-label">Cash Flow Type</label>
                            <div class="col-sm-7">
                                <select name="cashFlowId" class="custom-select" data-rule-required="false">
                                    <option ${requestScope.account.cashFlowId == null ? 'selected="selected"' : ''} value="">${labels['page.text.kindlySelect']}</option>
                                    <option ${requestScope.account.cashFlowId == 1 ? 'selected="selected"' : ''} value="1">Operating</option>
                                    <option ${requestScope.account.cashFlowId == 2 ? 'selected="selected"' : ''} value="2">Investing</option>
                                    <option ${requestScope.account.cashFlowId == 3 ? 'selected="selected"' : ''} value="3">Financing</option>
                                </select>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <!--<link href="components/" rel="stylesheet">-->
    <style type="text/css">

    </style>
</style>
<script type="text/javascript">
    jQuery(function ($) {
        // here we can reference the container bootstrap modal by its id
        // passed as parameter to request by name "ajaxModalId"
        // or for demo purposese ONLY we can get a reference top modal
        // in current open managed instances in BootstrapModalWrapperFactory
        var currentParentModal = BootstrapModalWrapperFactory.globalModals[BootstrapModalWrapperFactory.globalModals.length - 1];
//            console.log(currentParentModal.options.id);
        $("#" + currentParentModal.options.id).on(javatmp.settings.javaTmpAjaxContainerReady, function (event, modal) {
            // fire AFTER all transition done and your ajax content is shown to user.

            var form = $('#addNewAccountPopup');
            var validator = null;

            modal.updateTitle("Update Account");
            modal.updateClosable(true);
            modal.addButton({
                label: "${labels['global.cancel']}",
                cssClass: "btn btn-danger mr-auto",
                action: function (button, buttonData, originalEvent) {
                    return this.hide();
                }
            });
            modal.addButton({
                label: "Update Account",
                cssClass: "btn btn-primary",
                action: function (button, buttonData, originalEvent) {
                    form.trigger("submit");
                }
            });
            var callbackData = {success: false, cancel: true};
            modal.originalModal.on('hidden.bs.modal', function (e) {
                // here we run passing function name as a remote callback
                javatmp.util.waitForFinalEvent(function () {
                    if ($.isFunction(modal.options.localData.callback)) {
                        modal.options.localData.callback.apply(callbackData, [callbackData]);
                    } else if ($.type(modal.options.localData.callback) === "string") {
                        javatmp.util.executeFunctionByName(modal.options.localData.callback, window, callbackData);
                    }
                }, 100, "@updateAccountPopup");
            });
            modal.setOnDestroy(function (modalInstance) {
                BootstrapModalWrapperFactory.createModal({
                    title: "${labels['dialog.confirmClosing.title']}",
                    message: "${labels['dialog.confirmClosing.msg']}",
                    closable: false,
                    closeByBackdrop: false,
                    buttons: [
                        {
                            label: "${labels['dialog.confirmClosing.noBtn']}",
                            cssClass: "btn btn-secondary",
                            action: function (button, buttonData, originalEvent) {
                                return this.hide();
                            }
                        },
                        {
                            label: "${labels['dialog.confirmClosing.yesBtn']}",
                            cssClass: "btn btn-primary",
                            action: function (button, buttonData, originalEvent) {
                                modalInstance.setOnDestroy(null);
                                modalInstance.hide();
                                return this.hide();
                            }
                        }
                    ]
                }).show();
                return false;
            });
            modal.originalModal.find(".modal-footer").addClass("justify-content-start");

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
                        if (formData[i].name === "creationDate") {
                            var value = formData[i].value;
                            var newDate = moment(value, javatmp.settings.dateFormat).locale('en').format(javatmp.settings.networkDateFormat);
                            formData[i].value = newDate;
                            break;
                        }
                    }
                },
                success: function (response, statusText, xhr, $form) {
                    callbackData.cancel = false;
                    callbackData.success = true;
                    BootstrapModalWrapperFactory.createModal({
                        title: "${labels['global.response']}",
                        message: response.message
                    }).show();
                },
                error: function (xhr, status, error, $form) {
                    callbackData.cancel = true;
                    callbackData.success = false;
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
            // pre-submit callback

            // initialize jQuery Validation plugin using global data.
            validator = form.validate();

            var parentAccountIdSelect = javatmp.plugins.select2Wrapper(form.find("select[name='parentAccountId']"), {
                dropdownParent: modal.originalModal
            });

            var accountGroupSelect = javatmp.plugins.select2Wrapper(form.find("select[name='accountGroup']"), {
                dropdownParent: modal.originalModal
            });
        });
    });
</script>
</div>