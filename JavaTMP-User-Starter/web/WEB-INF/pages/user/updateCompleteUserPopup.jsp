<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="dynamic-ajax-content">
    <div class="row">
        <div class="col-lg-12">
            <form enctype="multipart/form-data" autocomplete="off" id="AddNewUserPopupFormId" class="form"
                  action="${pageContext.request.contextPath}/user/UpdateCompleteUserController" method="post" novalidate="novalidate">
                <div class="form-row">
                    <div class="col-sm-3">
                        <div class="form-group form-row">
                            <label class="control-label col-sm-3 col-form-label">${labels['domain.user.id']}</label>
                            <div class="col-sm-9">
                                <input readonly="readonly" class="form-control-plaintext" type="text" name="id"
                                       value="${requestScope.user.id}">
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-9">
                        <div class="form-group form-row">
                            <label class="control-label col-sm-3 col-form-label">${labels['domain.user.status']}</label>
                            <div class="col-sm-9">
                                <select name="status" class="custom-select" data-rule-required="true">
                                    <option ${requestScope.user.status == 1 ? 'selected="selected"' : ''} value="1">Activated</option>
                                    <option ${requestScope.user.status == 0 ? 'selected="selected"' : ''} value="0">Deactivated</option>
                                </select>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="form-row">
                    <div class="col-lg-12">
                        <div class="form-row">
                            <div class="col-lg-3">
                                <div class="form-group">
                                    <label class="control-label">${labels['domain.user.firstName']}</label>
                                    <input class="form-control" type="text" placeholder="${labels['domain.user.firstName']}"
                                           name="firstName" value="${requestScope.user.firstName}"
                                           data-rule-required="true">
                                </div>
                            </div>
                            <div class="col-lg-3">
                                <div class="form-group">
                                    <label class="control-label">${labels['domain.user.lastName']}</label>
                                    <input class="form-control" type="text" placeholder="${labels['domain.user.lastName']}"
                                           name="lastName" value="${requestScope.user.lastName}"
                                           data-rule-required="true">
                                </div>
                            </div>
                            <div class="col-lg-3">
                                <div class="form-group">
                                    <label class="control-label">${labels['domain.user.birthDate']}</label>
                                    <input dir="ltr" class="form-control"  type="text" name="birthDate"
                                           value="<fmt:formatDate pattern='dd/MM/yyyy' timeZone="${sessionScope.user.timezone}" value='${requestScope.user.birthDate}'/>"
                                           data-rule-required="true"
                                           data-rule-validDate="true"
                                           data-rule-dateBeforeNow="true">
                                </div>
                            </div>
                            <div class="col-lg-3">
                                <div class="form-group">
                                    <label class="control-label">${labels['domain.user.email']}</label>
                                    <input class="form-control" type="text" placeholder="Email" name="email"
                                           value="${requestScope.user.email}"
                                           data-rule-required="true"
                                           data-rule-email="true"
                                           data-rule-minlength="5"
                                           data-rule-maxlength="50">
                                </div>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="col-lg-3">
                                <div class="form-group">
                                    <label class="control-label">${labels['domain.user.country']}</label>
                                    <select name="countryId" class="form-control" data-rule-required="true">
                                        <c:choose>
                                            <c:when test="${fn:length(requestScope.countries) > 0}">
                                                <option value="">${labels['page.text.kindlySelect']}</option>
                                                <c:forEach items="${requestScope.countries}" var="country">
                                                    <option ${requestScope.user.countryId == country.countrytranslationPK.countryId ? 'selected="selected"' : ''} value="${country.countrytranslationPK.countryId}">${country.countryName}</option>
                                                </c:forEach>
                                            </c:when>
                                            <c:otherwise>
                                                <option value="">${labels['page.text.noRecordFound']}</option>
                                            </c:otherwise>
                                        </c:choose>
                                    </select>
                                </div>
                            </div>
                            <div class="col-lg-3">
                                <div class="form-group">
                                    <label class="control-label">${labels['domain.user.lang']}</label>
                                    <select name="lang" class="form-control" data-rule-required="true">
                                        <c:choose>
                                            <c:when test="${fn:length(requestScope.languages) > 0}">
                                                <option value="">${labels['page.text.kindlySelect']}</option>
                                                <c:forEach items="${requestScope.languages}" var="language">
                                                    <option ${requestScope.user.lang == language.languagetranslationPK.languageId ? 'selected="selected"' : ''} value="${language.languagetranslationPK.languageId}">${language.languageName}</option>
                                                </c:forEach>
                                            </c:when>
                                            <c:otherwise>
                                                <option value="">${labels['page.text.noRecordFound']}</option>
                                            </c:otherwise>
                                        </c:choose>
                                    </select>
                                </div>
                            </div>
                            <div class="col-lg-3">
                                <div class="form-group">
                                    <label class="control-label">${labels['domain.user.theme']}</label>
                                    <select name="theme" class="form-control" data-rule-required="true">
                                        <c:choose>
                                            <c:when test="${fn:length(requestScope.themes) > 0}">
                                                <option value="">${labels['page.text.kindlySelect']}</option>
                                                <c:forEach items="${requestScope.themes}" var="theme">
                                                    <option ${requestScope.user.theme == theme.themetranslationPK.themeId ? 'selected="selected"' : ''} value="${theme.themetranslationPK.themeId}">${theme.themeName}</option>
                                                </c:forEach>
                                            </c:when>
                                            <c:otherwise>
                                                <option value="">${labels['page.text.noRecordFound']}</option>
                                            </c:otherwise>
                                        </c:choose>
                                    </select>
                                </div>
                            </div>
                            <div class="col-lg-3">
                                <div class="form-group">
                                    <label class="control-label">${labels['domain.user.timezone']}</label>
                                    <select name="timezone" class="form-control" data-rule-required="true">
                                        <option value="">${labels['page.text.kindlySelect']}</option>
                                        <c:choose>
                                            <c:when test="${fn:length(requestScope.timezones) > 0}">
                                                <option value="">Choose ...</option>
                                                <c:forEach items="${requestScope.timezones}" var="timezone">
                                                    <option ${requestScope.user.timezone == timezone.timezoneId ? 'selected="selected"' : ''}  value="${timezone.timezoneId}">${timezone.timezoneName}</option>
                                                </c:forEach>
                                            </c:when>
                                            <c:otherwise>
                                                <option value="-1">${labels['page.text.noRecordFound']}</option>
                                            </c:otherwise>
                                        </c:choose>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="col-lg-3">
                                <div class="form-group">
                                    <label class="control-label">${labels['domain.user.userName']}</label>
                                    <input class="form-control" type="text" autocomplete="off" placeholder="Username"
                                           name="userName" value="${requestScope.user.userName}"
                                           data-rule-required="true"
                                           data-rule-minlength="6"
                                           data-rule-maxlength="20">
                                </div>
                            </div>
                            <div class="col-lg-3">
                                <div class="form-group">
                                    <label class="control-label">${labels['domain.user.currentPassword']}</label>
                                    <input class="form-control" type="password" autocomplete="off"
                                           placeholder="Old Password" name="oldPassword"
                                           data-rule-required="true">
                                </div>
                            </div>
                            <div class="col-lg-3">
                                <div class="form-group">
                                    <label class="control-label">${labels['domain.user.newPassword']}</label>
                                    <input class="form-control" type="password" autocomplete="off"
                                           placeholder="New Password" name="password"
                                           data-rule-required="true">
                                </div>
                            </div>
                            <div class="col-lg-3">
                                <div class="form-group">
                                    <label class="control-label">${labels['domain.user.reTypeNewPassword']}</label>
                                    <input class="form-control" type="password" autocomplete="off" placeholder="Re-type Your New Password"
                                           name="rpassword"
                                           data-rule-required="true"
                                           data-rule-equalto="form input[name='password']">
                                </div>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="col-lg-12">
                                <div class="form-group">
                                    <label for="exampleFormControlFile1">${labels['domain.user.Document']}</label>
                                    <div class="custom-file">
                                        <input name="profilePicture" type="file" class="custom-file-input"
                                               id="validatedCustomFile"
                                               data-rule-required="false">
                                        <label class="custom-file-label" for="validatedCustomFile">Choose Profile Picture file...</label>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-6 text-center">
                                <div style="width: 200px; height: 200px;display: inline-block;position: relative">
                                    <div id="profilePicturePreviewContainerId" style="width: 200px; height: 200px;">
                                        <c:choose>
                                            <c:when test="${not empty requestScope.user.profilePicDocument.documentId and not empty requestScope.user.profilePicDocument.randomHash}">
                                                <img width="200" height="200" id="profilePicturePreview" src="${pageContext.request.contextPath}/ViewUploadedFileController?documentId=${requestScope.user.profilePicDocument.documentId}&amp;randomHash=${requestScope.user.profilePicDocument.randomHash}&amp;viewType=inline" alt="Your Profile Image Preview" />
                                            </c:when>
                                            <c:otherwise>
                                                <img width="200" height="200" id="profilePicturePreview" src="${pageContext.request.contextPath}/assets/img/default-profile-pic.png" alt=""/>
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-6 text-center">
                                <c:choose>
                                    <c:when test="${not empty requestScope.user.profilePicDocument.documentId and not empty requestScope.user.profilePicDocument.randomHash}">
                                        <img id="profilePictureResizePreview" style="width: 200px; height: 200px;" src="${pageContext.request.contextPath}/ViewUploadedFileController?documentId=${requestScope.user.profilePicDocument.documentId}&amp;randomHash=${requestScope.user.profilePicDocument.randomHash}&amp;viewType=inline" alt="Your Profile Image Preview" />
                                    </c:when>
                                    <c:otherwise>
                                        <img id="profilePictureResizePreview" style="width: 200px; height: 200px;" src="${pageContext.request.contextPath}/assets/img/default-profile-pic.png" alt=""/>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="col-lg-12">
                                <div class="form-group text-center">
                                    <input name="profilePictureStr" type="text" readonly="" hidden="" value=""/>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label">${labels['domain.user.address']}</label>
                            <textarea rows="5" class="form-control forceValidate" placeholder="" name="address"
                                      data-rule-summernoteRequired="true"
                                      data-rule-maxlength="400">${requestScope.user.address}</textarea>
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
        $("#" + currentParentModal.options.id).on(javatmp.settings.javaTmpAjaxContainerReady, function (event, modal) {
            // fire AFTER all transition done and your ajax content is shown to user.

            var form = $('#AddNewUserPopupFormId');
            var validator = null;
            modal.updateTitle("${labels['user.dialog.updateCompleteUser.title']}");
            modal.updateClosable(true);
            modal.updateSize("modal-lg");
            modal.addButton({
                label: "${labels['global.cancel']}",
                cssClass: "btn btn-danger mr-auto",
                action: function (modalWrapper, button, buttonData, originalEvent) {
                    return modalWrapper.hide();
                }
            });
            modal.addButton({
                label: "${labels['user.dialog.updateCompleteUser.btn']}",
                cssClass: "btn btn-primary",
                action: function (modalWrapper, button, buttonData, originalEvent) {
                    form.trigger("submit");
                }
            });
            var callbackData = {success: false, cancel: true};
            modal.originalModal.on('hidden.bs.modal', function (e) {
                // here we run passing function name as a remote callback
                javatmp.util.waitForFinalEvent(function () {
                    if ($.isFunction(modal.options.passData.callback)) {
                        modal.options.passData.callback.apply();
                    } else if ($.type(modal.options.passData.callback) === "string") {
                        javatmp.util.executeFunctionByName(modal.options.passData.callback, window, callbackData);
                    }
                }, 200, "@update-user-callback");
            });
            modal.setOnDestroy(function (modalInstance) {
                BootstrapModalWrapperFactory.createModal({
                    title: "${labels['dialog.confirmClosing.title']}",
                    message: "${labels['dialog.confirmClosing.msg']}",
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
                    $("#summernote").summernote('triggerEvent', 'change');
                    if (!$form.valid()) {
                        return false;
                    }
                },
                beforeSubmit: function (formData, jqForm, options) {
                    for (var i = 0; i < formData.length; i++) {
                        if (formData[i].name === "birthDate") {
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
                        title: "Response",
                        message: response.message
                    }).show();
                },
                error: function (xhr, status, error, $form) {
                    callbackData.cancel = true;
                    callbackData.success = false;
                    var resultText = xhr.responseText;
                    var errorMsg = resultText;
                    var obj = JSON.parse(resultText);
                    errorMsg = obj.message;
                    BootstrapModalWrapperFactory.createModal({
                        title: xhr.statusText + " : " + xhr.status,
                        message: errorMsg
                    }).show();
                }
            });
            // pre-submit callback

            // initialize jQuery Validation plugin using global data.
            validator = form.validate();

            var birthDateInputMask = javatmp.plugins.inputmaskWrapperForDate(form.find("input[name='birthDate']"));
            var birthDateDatePicker = javatmp.plugins.daterangepickerWrapperForDate(form.find("input[name='birthDate']"), {
                parentEl: modal.originalModal
            });
            var addressEditor = javatmp.plugins.summernoteWrapper(form.find("textarea[name='address']"));
            var langSelect = javatmp.plugins.select2Wrapper(form.find("select[name='lang']"), {
                dropdownParent: modal.originalModal
            });

            var timezoneSelect = javatmp.plugins.select2Wrapper(form.find("select[name='timezone']"), {
                dropdownParent: modal.originalModal
            });
            var themeSelect = javatmp.plugins.select2WrapperForTheme(form.find("select[name='theme']"), {
                dropdownParent: modal.originalModal
            });

            var countryIdSelect = javatmp.plugins.select2WrapperForCountry(form.find("select[name='countryId']"), {
                dropdownParent: modal.originalModal
            });

            var profilePicScrollbars = javatmp.plugins.mCustomScrollbarForProfilePicture(form.find("#profilePicturePreviewContainerId"));

            form.find("#profilePicturePreview").removeAttr("width").removeAttr("height");
            form.find("input[name='profilePicture'][type=file]").on("change", function () {
                if (this.files && this.files[0]) {
                    var reader = new FileReader();
                    reader.onload = function (e) {
                        var image = form.find("img[id='profilePicturePreview']");
                        var resizeImage = form.find("img[id='profilePictureResizePreview']");
                        image.one("load", function () {
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