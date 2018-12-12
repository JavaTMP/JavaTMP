<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="dynamic-ajax-content">
    <div class="row">
        <div class="col-lg-12">
            <form accept-charset="UTF-8" autocomplete="off" id="addNewAccountPopup" class="form"
                  action="${pageContext.request.contextPath}/accounting/AddNewAccountPopup" method="post" novalidate="novalidate">
                <div class="form-row">
                    <div class="col-lg-12">
                        <div class="form-group form-row">
                            <label class="text-sm-right control-label col-sm-5 col-form-label">accountCode</label>
                            <div class="col-sm-7">
                                <input class="form-control" type="text" placeholder=""
                                       name="accountCode" value=""
                                       data-rule-required="true"
                                       >
                            </div>
                        </div>
                        <div class="form-group form-row">
                            <label class="text-sm-right control-label col-sm-5 col-form-label">name</label>
                            <div class="col-sm-7">
                                <input class="form-control" type="text" placeholder=""
                                       name="name" value=""
                                       data-rule-required="true"
                                       >
                            </div>
                        </div>
                        <div class="form-group form-row">
                            <label class="text-sm-right control-label col-sm-5 col-form-label">description</label>
                            <div class="col-sm-7">
                                <input class="form-control" type="text" placeholder=""
                                       name="description" value="description"
                                       data-rule-required="true"
                                       >
                            </div>
                        </div>
                        <div class="form-group form-row">
                            <label class="text-sm-right control-label col-sm-5 col-form-label">accountGroup</label>
                            <div class="col-sm-7">
                                <select name="accountGroup" class="form-control">
                                    <c:choose>
                                        <c:when test="${fn:length(requestScope.accountGroups) > 0}">
                                            <option value="">${labels['page.text.kindlySelect']}</option>
                                            <c:forEach items="${requestScope.accountGroups}" var="accountGroup">
                                                <option  value="${accountGroup.id}">${accountGroup.name}</option>
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
                            <label class="text-sm-right control-label col-sm-5 col-form-label">balance</label>
                            <div class="col-sm-7">
                                <input class="form-control" type="text" placeholder=""
                                       name="balance" value="0.00"
                                       data-rule-required="true"
                                       >
                            </div>
                        </div>
                        <div class="form-group form-row">
                            <label class="text-sm-right control-label col-sm-5 col-form-label">status</label>
                            <div class="col-sm-7">
                                <select name="status" class="custom-select" data-rule-required="true">
                                    <option value="1">Active</option>
                                    <option value="0">Inactive</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group form-row">
                            <label class="text-sm-right control-label col-sm-5 col-form-label">parentAccountId</label>
                            <div class="col-sm-7">
                                <select name="parentAccountId" class="form-control">
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
                            </div>
                        </div>
                        <div class="form-group form-row">
                            <label class="text-sm-right control-label col-sm-5 col-form-label">cashFlowId</label>
                            <div class="col-sm-7">
                                <select name="cashFlowId" class="custom-select" data-rule-required="false">
                                    <option value="">${labels['page.text.kindlySelect']}</option>
                                    <option value="1">Operating</option>
                                    <option value="2">Investing</option>
                                    <option value="3">Financing</option>
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

            modal.updateTitle("Add New Account");
            modal.updateClosable(true);
            modal.addButton({
                label: "${labels['global.cancel']}",
                cssClass: "btn btn-danger mr-auto",
                action: function (modalWrapper, button, buttonData, originalEvent) {
                    return modalWrapper.hide();
                }
            });
            modal.addButton({
                label: "Create New Account",
                cssClass: "btn btn-primary",
                action: function (modalWrapper, button, buttonData, originalEvent) {
                    form.trigger("submit");
                }
            });
            var callbackData = {success: false, cancel: true};
            modal.originalModal.on('hidden.bs.modal', function (e) {
                // here we run passing function name as a remote callback

                if ($.isFunction(modal.options.localData.callback)) {
                    modal.options.localData.callback.call(null, callbackData);
                } else if ($.type(modal.options.localData.callback) === "string") {
                    javatmp.util.executeFunctionByName(modal.options.localData.callback, window, callbackData);
                }

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
                            action: function (modalWrapper, button, buttonData, originalEvent) {
                                return modalWrapper.hide();
                            }
                        },
                        {
                            label: "${labels['dialog.confirmClosing.yesBtn']}",
                            cssClass: "btn btn-primary",
                            action: function (modalWrapper, button, buttonData, originalEvent) {
                                modalInstance.setOnDestroy(null);
                                modalInstance.hide();
                                return modalWrapper.hide();
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

            var modalZIndex = modal.originalModal.css('zIndex');
            var creationDateInputMask = javatmp.plugins.inputmaskWrapperForDate(form.find("input[name='creationDate']"));
            var creationDateDatePicker = javatmp.plugins.daterangepickerWrapperForDate(form.find("input[name='creationDate']"), {
                parentEl: modal.originalModal
            });
            var parentAccountIdSelect = javatmp.plugins.select2Wrapper(form.find("select[name='parentAccountId']"), {
                dropdownParent: modal.originalModal
            });

            var accountGroupSelect = javatmp.plugins.select2Wrapper(form.find("select[name='accountGroup']"), {
                dropdownParent: modal.originalModal
            });
            var themeSelect = javatmp.plugins.select2WrapperForTheme(form.find("select[name='theme']"), {
                dropdownParent: modal.originalModal
            });

            var countryIdSelect = javatmp.plugins.select2WrapperForCountry(form.find("select[name='countryId']"), {
                dropdownParent: modal.originalModal
            });

            var profilePicScrollbars = javatmp.plugins.mCustomScrollbarForProfilePicture(form.find("#profilePicturePreviewContainerId"));

            form.find("select[name='timezone']").val(moment.tz.guess()).trigger('change.select2');
            form.find("input[name='profilePicture'][type=file]").on("change", function () {
                if (this.files && this.files[0]) {
                    var reader = new FileReader();
                    reader.onload = function (e) {
                        var image = form.find("img[id='profilePicturePreview']");
                        var resizeImage = form.find("img[id='profilePictureResizePreview']");
                        image.one("load", function () {
//                            var currentImageHeight = this.height;
//                            if (currentImageHeight > 250) {
//                                $("#profilePicturePreviewContainerId").height(250);
//                            } else {
//                                $("#profilePicturePreviewContainerId").height(currentImageHeight);
//                            }
                            form.find("#profilePicturePreviewContainerId").mCustomScrollbar("update");
                        });
                        image.attr('src', e.target.result);
                        resizeImage.attr('src', e.target.result);
                    };
                    reader.readAsDataURL(this.files[0]);
                }
            });
        });
    });
</script>
</div>