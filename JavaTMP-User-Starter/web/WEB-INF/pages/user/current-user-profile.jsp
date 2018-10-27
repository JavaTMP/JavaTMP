<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="dynamic-ajax-content">
    <div class="row">
        <div class="col">
            <div class="card my-3 bg-light shadow">
                <div class="card-header">
                    ${labels['sidebar.menuItem.system.UserProfileSettings']}
                    <div class="options float-right">
                        <a href="#" class="collapse"><i class="fa fa-chevron-up"></i></a>
                        <a href="#" class="fullscreen"><i class=" fa fa-expand"></i></a>
                    </div>
                </div>
                <div class="card-body">
                    <div class="row">
                        <div class="col-lg-12">
                            <form accept-charset="UTF-8" enctype="multipart/form-data" autocomplete="off" id="UpdateCurrentUserFormId" class="form"
                                  action="${pageContext.request.contextPath}/user/CurrentUserProfileController" method="post" novalidate="novalidate">
                                <div class="form-row">
                                    <div class="col-lg-3 col-md-4 col-sm-6">
                                        <div class="form-group form-row">
                                            <label class="text-right control-label col-sm-5 col-form-label">${labels['domain.user.id']}</label>
                                            <div class="col-sm-7">
                                                <input readonly="readonly" class="form-control-plaintext" type="text" name="id" value="${requestScope.user.id}">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-4 col-sm-6">
                                        <div class="form-group form-row">
                                            <label class="text-right control-label col-sm-5 col-form-label">${labels['domain.user.status']}</label>
                                            <div class="col-sm-7">
                                                <select name="status" class="custom-select" data-rule-required="true">
                                                    <option ${requestScope.user.status == 1 ? 'selected="selected"' : ''} value="1">Activated</option>
                                                    <option ${requestScope.user.status == 0 ? 'selected="selected"' : ''} value="0">Deactivated</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="col-lg-3 col-md-4 col-sm-6">
                                        <div class="form-group form-row">
                                            <label class="text-right control-label col-sm-5 col-form-label">${labels['domain.user.firstName']}</label>
                                            <div class="col-sm-7">
                                                <input class="form-control" type="text" placeholder="${labels['domain.user.firstName']}"
                                                       name="firstName" value="${requestScope.user.firstName}" data-rule-required="true">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-4 col-sm-6">
                                        <div class="form-group form-row">
                                            <label class="text-right control-label col-sm-5 col-form-label">${labels['domain.user.lastName']}</label>
                                            <div class="col-sm-7">
                                                <input class="form-control" type="text" placeholder="${labels['domain.user.lastName']}"
                                                       name="lastName" value="${requestScope.user.lastName}" data-rule-required="true">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-4 col-sm-6">
                                        <div class="form-group form-row">
                                            <label class="text-right control-label col-sm-5 col-form-label">${labels['domain.user.birthDate']}</label>
                                            <div class="col-sm-7">
                                                <input dir="ltr" class="form-control"  type="text" name="birthDate"
                                                       value="<fmt:formatDate pattern='dd/MM/yyyy' timeZone="${sessionScope.user.timezone}" value='${requestScope.user.birthDate}'/>"
                                                       data-rule-required="true"
                                                       data-rule-validDate="true"
                                                       data-rule-dateBeforeNow="true">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-4 col-sm-6">
                                        <div class="form-group form-row">
                                            <label class="text-right control-label col-sm-5 col-form-label">${labels['domain.user.email']}</label>
                                            <div class="col-sm-7">
                                                <input class="form-control" type="text" placeholder="${labels['domain.user.email']}"
                                                       name="email" value="${requestScope.user.email}"
                                                       data-rule-required="true"
                                                       data-rule-email="true"
                                                       data-rule-minlength="5"
                                                       data-rule-maxlength="50">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-4 col-sm-6">
                                        <div class="form-group form-row">
                                            <label class="text-right control-label col-sm-5 col-form-label">${labels['domain.user.country']}</label>
                                            <div class="col-sm-7">
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
                                    </div>
                                    <div class="col-lg-3 col-md-4 col-sm-6">
                                        <div class="form-group form-row">
                                            <label class="text-right control-label col-sm-5 col-form-label">${labels['domain.user.lang']}</label>
                                            <div class="col-sm-7">
                                                <select name="lang" class="form-control" data-rule-required="true">
                                                    <c:choose>
                                                        <c:when test="${fn:length(requestScope.languages) > 0}">
                                                            <option value="">${labels['page.text.kindlySelect']}</option>
                                                            <c:forEach items="${requestScope.languages}" var="language">
                                                                <option ${requestScope.user.lang == language.languageId ? 'selected="selected"' : ''} value="${language.languageId}">${language.languageName}</option>
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
                                    <div class="col-lg-3 col-md-4 col-sm-6">
                                        <div class="form-group form-row">
                                            <label class="text-right control-label col-sm-5 col-form-label">${labels['domain.user.theme']}</label>
                                            <div class="col-sm-7">
                                                <select name="theme" class="form-control" data-rule-required="true">
                                                    <c:choose>
                                                        <c:when test="${fn:length(requestScope.themes) > 0}">
                                                            <option value="">${labels['page.text.kindlySelect']}</option>
                                                            <c:forEach items="${requestScope.themes}" var="theme">
                                                                <option ${requestScope.user.theme == theme.themeId ? 'selected="selected"' : ''} value="${theme.themeId}">${theme.themeName}</option>
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
                                    <div class="col-lg-3 col-md-4 col-sm-6">
                                        <div class="form-group form-row">
                                            <label class="text-right control-label col-sm-5 col-form-label">${labels['domain.user.timezone']}</label>
                                            <div class="col-sm-7">
                                                <select name="timezone" class="form-control" data-rule-required="true">
                                                    <option value="">${labels['page.text.kindlySelect']}</option>
                                                    <c:choose>
                                                        <c:when test="${fn:length(requestScope.timezones) > 0}">
                                                            <option value="">${labels['page.text.kindlySelect']}</option>
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
                                </div>
                                <div class="form-row">
                                    <div class="col-lg-3 col-md-4 col-sm-6">
                                        <div class="form-group form-row">
                                            <label class="text-right control-label col-sm-5 col-form-label">${labels['domain.user.userName']}</label>
                                            <div class="col-sm-7">
                                                <input class="form-control" type="text" autocomplete="off" placeholder="${labels['domain.user.userName']}"
                                                       name="userName" value="${requestScope.user.userName}"
                                                       data-rule-required="true"
                                                       data-rule-minlength="6"
                                                       data-rule-maxlength="20">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-4 col-sm-6">
                                        <div class="form-group form-row">
                                            <label class="text-right control-label col-sm-5 col-form-label">${labels['domain.user.currentPassword']}</label>
                                            <div class="col-sm-7">
                                                <input class="form-control" type="password" autocomplete="off"
                                                       placeholder="${labels['domain.user.currentPassword']}" name="oldPassword"
                                                       data-rule-required="true">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-4 col-sm-6">
                                        <div class="form-group form-row">
                                            <label class="text-right control-label col-sm-5 col-form-label">${labels['domain.user.newPassword']}</label>
                                            <div class="col-sm-7">
                                                <input class="form-control" type="password" autocomplete="off"
                                                       placeholder="${labels['domain.user.newPassword']}" name="password"
                                                       data-rule-required="true">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-4 col-sm-6">
                                        <div class="form-group form-row">
                                            <label class="text-right control-label col-sm-5 col-form-label">${labels['domain.user.reTypeNewPassword']}</label>
                                            <div class="col-sm-7">
                                                <input class="form-control" type="password" autocomplete="off" placeholder="${labels['domain.user.reTypeNewPassword']}"
                                                       name="rpassword"
                                                       data-rule-required="true"
                                                       data-rule-equalto="form input[name='password']">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="col-lg-12">
                                        <div class="form-group form-row">
                                            <label class="text-right control-label col-sm-1 col-form-label" for="exampleFormControlFile1">${labels['domain.user.Document']}</label>
                                            <div class="col-sm-6">
                                                <div class="custom-file">
                                                    <input name="profilePicture" type="file" class="custom-file-input"
                                                           id="validatedCustomFile">
                                                    <label class="custom-file-label" for="validatedCustomFile">${labels['domain.user.Document']}</label>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="col-lg-6 text-center">
                                        <div style="width: 200px; height: 200px;display: inline-block;position: relative">
                                            <div id="profilePicturePreviewContainerId" style="width: 200px; height: 200px;">
                                                <c:choose>
                                                    <c:when test="${not empty requestScope.user.profilePicDocument.documentId and not empty requestScope.user.profilePicDocument.randomHash}">
                                                        <img id="profilePicturePreview" src="${pageContext.request.contextPath}/ViewUploadedFileController?documentId=${requestScope.user.profilePicDocument.documentId}&amp;randomHash=${requestScope.user.profilePicDocument.randomHash}&amp;viewType=inline" alt="Your Profile Image Preview" />
                                                    </c:when>
                                                    <c:otherwise>
                                                        <img id="profilePicturePreview" src="${pageContext.request.contextPath}/assets/img/default-profile-pic.png" alt=""/>
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
                                <div class="form-row">
                                    <div class="col-lg-12">
                                        <div class="form-group">
                                            <label class="text-right control-label">${labels['domain.user.address']}</label>
                                            <textarea rows="5" class="form-control forceValidate"
                                                      placeholder="${labels['domain.user.address']}"
                                                      name="address"
                                                      data-rule-summernoteRequired="true"
                                                      data-rule-maxlength="400">${requestScope.user.address}</textarea>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="col-lg-12">
                                        <div class="form-group">
                                            <input type="submit" class="btn btn-primary" value="${labels['page.btn.updateYourProfile']}"/>
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
            var form = $('#UpdateCurrentUserFormId');
            var validator = null;
//
//            form.ajaxForm({
//                clearForm: false, // clear all form fields after successful submit
//                resetForm: false, // reset the form after successful submit
//                beforeSerialize: function ($form, options) {
//                    $("#summernote").summernote('triggerEvent', 'change');
//                    if (!$form.valid()) {
//                        return false;
//                    }
//                },
//                beforeSubmit: function (formData, jqForm, options) {
//                    for (var i = 0; i < formData.length; i++) {
//                        if (formData[i].name === "birthDate") {
//                            var value = formData[i].value;
//                            var newDate = moment(value, javatmp.settings.dateFormat).locale('en').format(javatmp.settings.networkDateFormat);
//                            formData[i].value = newDate;
//                            break;
//                        }
//                    }
//
//                },
//                success: function (response, statusText, xhr, $form) {
//                    var successModal = BootstrapModalWrapperFactory.createModal({
//                        title: "Response",
//                        message: response.message,
//                        buttons: [
//                            {
//                                label: "Close And Refresh",
//                                cssClass: "btn btn-primary",
//                                action: function (modalWrapper, button, buttonData, originalEvent) {
//                                    javatmp.util.waitForFinalEvent(function () {
//                                        window.location.reload(true);
//                                    }, 200, "@update-current-user-profile");
//                                    return modalWrapper.hide();
//                                }
//                            }
//                        ]
//                    });
//                    successModal.show();
//                },
//                error: function (xhr, status, error, $form) {
//                    var resultText = xhr.responseText;
//                    var errorMsg = resultText;
//                    var obj = JSON.parse(resultText);
//                    errorMsg = obj.message;
//                    BootstrapModalWrapperFactory.createModal({
//                        title: xhr.statusText + " : " + xhr.status,
//                        message: errorMsg
//                    }).show();
//                }
//            });

            form.on("submit", function (event) {
                event.preventDefault();
                if (!$(this).valid()) {
                    return;
                }
                var httpType = $(this).attr("method");
                var post_url = $(this).attr("action"); //get form action url
                var form_data = new FormData(this); //Creates new FormData object
                var newDate = moment(form_data.get("birthDate"), javatmp.settings.dateFormat).locale('en').format(javatmp.settings.networkDateFormat);
                form_data.set("birthDate", newDate);
//                var form_data = $(this).serializeArray();
                $.ajax({
                    type: httpType,
                    url: post_url,
                    data: form_data,
                    dataType: "json",
                    contentType: false,
                    cache: false,
                    processData: false,
                    success: function (response, statusText, xhr) {
                        var successModal = BootstrapModalWrapperFactory.createModal({
                            title: "Response",
                            message: response.message,
                            buttons: [
                                {
                                    label: "Close And Refresh",
                                    cssClass: "btn btn-primary",
                                    action: function (modalWrapper, button, buttonData, originalEvent) {
                                        javatmp.util.waitForFinalEvent(function () {
                                            window.location.reload(true);
                                        }, 200, "@update-current-user-profile");
                                        return modalWrapper.hide();
                                    }
                                }
                            ]
                        });
                        successModal.show();
                    },
                    error: function (xhr, status, error) {
                        var errorMsg = xhr.responseText;
                        try {
                            var jsonData = $.parseJSON(errorMsg);
                            errorMsg = jsonData.message;
                        } catch (error) {
                            errorMsg = errorMsg || "xhr.responseText [" + errorMsg + "] can not be converted to valid JSON Object";
                            console.error(errorMsg);
                        }
                        BootstrapModalWrapperFactory.createModal({
                            title: "${labels['global.error']}" + " : " + xhr.status,
                            message: errorMsg
                        }).show();
                    }
                });
            });

            validator = form.validate($.extend(true, {}, javatmp.settings.jqueryValidationDefaultOptions, {}));
            var birthDateInputMask = javatmp.plugins.inputmaskWrapperForDate(form.find("input[name='birthDate']"));
            var birthDateDatePicker = javatmp.plugins.daterangepickerWrapperForDate(form.find("input[name='birthDate']"));
            var addressEditor = javatmp.plugins.summernoteWrapper(form.find("textarea[name='address']"));
            var langSelect = javatmp.plugins.select2Wrapper(form.find("select[name='lang']"));
            var timezoneSelect = javatmp.plugins.select2Wrapper(form.find("select[name='timezone']"));
            var themeSelect = javatmp.plugins.select2WrapperForTheme(form.find("select[name='theme']"));
            var countryIdSelect = javatmp.plugins.select2WrapperForCountry(form.find("select[name='countryId']"));
            var profilePicScrollbars = javatmp.plugins.mCustomScrollbarForProfilePicture(form.find("#profilePicturePreviewContainerId"));

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