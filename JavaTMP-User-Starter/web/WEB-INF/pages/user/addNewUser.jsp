<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="dynamic-ajax-content">
    <h5 class="my-3">${labels['sidebar.menuItem.users.addNewUser']}</h5>
    <hr/>
    <div class="row">
        <div class="col-lg-12">
            <form enctype="multipart/form-data"
                  autocomplete="off"
                  id="jquery-form-plugin-test-id"
                  class="form"
                  action="${pageContext.request.contextPath}/user/CreateUserController"
                  method="post"
                  novalidate="novalidate">
                <div class="form-row">
                    <div class="col-lg-12">
                        <div class="form-row">
                            <div class="col-lg-3">
                                <div class="form-group">
                                    <label class="control-label">${labels['domain.user.firstName']}</label>
                                    <input class="form-control" type="text" placeholder="${labels['domain.user.firstName']}"
                                           name="firstName"
                                           data-rule-required="true">
                                </div>
                            </div>
                            <div class="col-lg-3">
                                <div class="form-group">
                                    <label class="control-label">${labels['domain.user.lastName']}</label>
                                    <input class="form-control" type="text" placeholder="${labels['domain.user.lastName']}"
                                           name="lastName"
                                           data-rule-required="true">
                                </div>
                            </div>
                            <div class="col-lg-3">
                                <div class="form-group">
                                    <label class="control-label">${labels['domain.user.birthDate']}</label>
                                    <input dir="ltr" class="form-control"
                                           type="text" name="birthDate"
                                           data-rule-required="true"
                                           data-rule-validDate="true"
                                           data-rule-dateBeforeNow="true">
                                </div>
                            </div>
                            <div class="col-lg-3">
                                <div class="form-group">
                                    <label class="control-label">${labels['domain.user.email']}</label>
                                    <input class="form-control"
                                           type="text" placeholder="${labels['domain.user.email']}" name="email"
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
                                                    <option ${requestScope.user.countryId == country.countryId ? 'selected="selected"' : ''} value="${country.countryId}">${country.countryName}</option>
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
                                                <c:forEach items="${requestScope.timezones}" var="timezone">
                                                    <option value="${timezone.timezoneId}">${timezone.timezoneName}</option>
                                                </c:forEach>
                                            </c:when>
                                            <c:otherwise>
                                                <option value="">${labels['page.text.noRecordFound']}</option>
                                            </c:otherwise>
                                        </c:choose>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="col-lg-4">
                                <div class="form-group">
                                    <label class="control-label">${labels['domain.user.userName']}</label>
                                    <input class="form-control" type="text" autocomplete="off"
                                           placeholder="${labels['domain.user.userName']}"
                                           name="userName"
                                           data-rule-required="true"
                                           data-rule-minlength="6"
                                           data-rule-maxlength="20">
                                </div>
                            </div>
                            <div class="col-lg-4">
                                <div class="form-group">
                                    <label class="control-label">${labels['domain.user.password']}</label>
                                    <input class="form-control required" type="password" autocomplete="off"
                                           placeholder="${labels['domain.user.password']}" name="password"
                                           data-rule-required="true">
                                </div>
                            </div>
                            <div class="col-lg-4">
                                <div class="form-group">
                                    <label class="control-label">${labels['domain.user.reTypePassword']}</label>
                                    <input class="form-control required" type="password" autocomplete="off"
                                           placeholder="${labels['domain.user.reTypePassword']}"
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
                                        <input name="profilePicture" type="file" class="custom-file-input" id="validatedCustomFile"
                                               data-rule-required="true">
                                        <label class="custom-file-label" for="validatedCustomFile">${labels['domain.user.Document']}</label>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-6 text-center">
                                <div style="width: 200px; height: 200px;display: inline-block;position: relative">
                                    <div id="profilePicturePreviewContainerId" style="width: 200px; height: 200px;">
                                        <img id="profilePicturePreview" src="${pageContext.request.contextPath}/assets/img/default-profile-pic.png" alt="Your Profile Image Preview" />
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-6 text-center">
                                <img id="profilePictureResizePreview" style="width: 200px; height: 200px;" src="${pageContext.request.contextPath}/assets/img/default-profile-pic.png" alt="Your Profile Image Preview" />
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
                            <textarea class="form-control forceValidate" placeholder="" name="address"
                                      data-rule-summernoteRequired="true"
                                      data-rule-maxlength="400"></textarea>
                        </div>
                        <div class="form-row">
                            <div class="col-lg-12">
                                <div class="form-group">
                                    <div class="custom-control custom-checkbox">
                                        <input name="tnc" type="checkbox" class="custom-control-input" id="tncInputId"
                                               data-rule-required="true">
                                        <label class="custom-control-label" for="tncInputId">
                                            ${labels["page.register.agreeLabelText"]}
                                            <a href="javascript:;">${labels["page.register.termsOfService"]}</a>
                                            ${labels["page.register.and"]}
                                            <a href="javascript:;">${labels["page.register.privacyPolicy"]}</a>
                                        </label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="col-lg-12">
                                <div class="form-group mt-3">
                                    <button type="submit" id="register-submit-btn" class="btn btn-primary">${labels['domain.user.CreateNewUser']}</button>
                                </div>
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
        var form = $('#jquery-form-plugin-test-id');
        var validator = null;
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
//                    form.find("textarea[name='address']").summernote('code', '');
//                    form.resetForm();
//                    form.find(".form-group.has-success").removeClass(".has-success");
                BootstrapModalWrapperFactory.createModal({
                    title: "Response",
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

        var birthDateInputMask = javatmp.plugins.inputmaskWrapperForDate(form.find("input[name='birthDate']"));
        var birthDateDatePicker = javatmp.plugins.daterangepickerWrapperForDate(form.find("input[name='birthDate']"));
        var addressEditor = javatmp.plugins.summernoteWrapper(form.find("textarea[name='address']"));
        var langSelect = javatmp.plugins.select2Wrapper(form.find("select[name='lang']"));
        var timezoneSelect = javatmp.plugins.select2Wrapper(form.find("select[name='timezone']"));
        var themeSelect = javatmp.plugins.select2WrapperForTheme(form.find("select[name='theme']"));
        var countryIdSelect = javatmp.plugins.select2WrapperForCountry(form.find("select[name='countryId']"));
        var profilePicScrollbars = javatmp.plugins.mCustomScrollbarForProfilePicture(form.find("#profilePicturePreviewContainerId"));

        form.find("select[name='timezone']").val(moment.tz.guess()).trigger('change');

        form.find("input[name='profilePicture']").on("change", function () {
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
    }(jQuery));
</script>
</div>