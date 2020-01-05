<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="com.javatmp.util.Constants" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="countries" scope="request" value="${applicationScope[Constants.SERVICES_FACTORY_ATTRIBUTE_NAME].getCountryService().getCountries(sessionScope[Constants.LOG_IN_USER_NAME])}"/>
<c:set var="languages" scope="request" value="${applicationScope[Constants.SERVICES_FACTORY_ATTRIBUTE_NAME].getLanguageService().getLanguages(sessionScope[Constants.LOG_IN_USER_NAME])}"/>
<c:set var="themes" scope="request" value="${applicationScope[Constants.SERVICES_FACTORY_ATTRIBUTE_NAME].getThemeService().getThemes(sessionScope[Constants.LOG_IN_USER_NAME])}"/>
<c:set var="timezones" scope="request" value="${applicationScope[Constants.SERVICES_FACTORY_ATTRIBUTE_NAME].getTimezoneService().getTimezones(sessionScope[Constants.LOG_IN_USER_NAME])}"/>

<div class="dynamic-ajax-content grid-gutter-padding">
    <form id="AddNewUserPopupFormId" enctype="multipart/form-data" autocomplete="off" class="form"
          action="${pageContext.request.contextPath}/user/CreateUserController" method="post" novalidate="novalidate">
        <div class="row dynamic-form-wizard">
            <div class="col-lg-3">
                <div class="nav flex-column nav-pills" id="v-pills-tab" role="tablist" aria-orientation="vertical">
                    <a class="disabled nav-item nav-link" id="step1-" data-toggle="pill" href="#v-pills-home" role="tab" aria-controls="v-pills-home" aria-selected="true">
                        1. Personal Informaiton
                    </a>
                    <a class="disabled nav-item nav-link" id="step3-" data-toggle="pill" href="#v-pills-profile" role="tab" aria-controls="v-pills-messages" aria-selected="false">
                        3. Profile Informaiton
                    </a>
                    <a class="disabled nav-item nav-link" id="step2-" data-toggle="pill" href="#v-pills-messages" role="tab" aria-controls="v-pills-profile" aria-selected="false">
                        2. Address Information
                    </a>
                    <a class="disabled nav-item nav-link" id="step4-" data-toggle="pill" href="#v-pills-settings" role="tab" aria-controls="v-pills-settings" aria-selected="false">
                        4. Send And Create New User
                    </a>
                </div>
            </div>
            <div class="col-lg-9">
                <div class="tab-content" id="v-pills-tabContent">
                    <div class="tab-pane fade" id="v-pills-home" role="tabpanel" aria-labelledby="step1-">
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
                                            <input dir="ltr" class="form-control"  type="text"
                                                   name="birthDate"
                                                   data-rule-required="true"
                                                   data-rule-validDate="true"
                                                   data-rule-dateBeforeNow="true">
                                        </div>
                                    </div>
                                    <div class="col-lg-3">
                                        <div class="form-group">
                                            <label class="control-label">${labels['domain.user.email']}</label>
                                            <input class="form-control" type="text" placeholder="${labels['domain.user.email']}"
                                                   name="email"
                                                   data-rule-required="true"
                                                   data-rule-email="true"
                                                   data-rule-minlength="5"
                                                   data-rule-maxlength="50">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="v-pills-profile" role="tabpanel" aria-labelledby="step2-">
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
                                                    <option value="${timezone.timezonetranslationPK.timezoneId}">${timezone.timezoneNameDescription}</option>
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
                                    <input class="form-control" type="password" autocomplete="off"
                                           placeholder="${labels['domain.user.password']}" name="password"
                                           data-rule-required="true">
                                </div>
                            </div>
                            <div class="col-lg-4">
                                <div class="form-group">
                                    <label class="control-label">${labels['domain.user.reTypePassword']}</label>
                                    <input class="form-control" type="password" autocomplete="off" placeholder="${labels['domain.user.reTypePassword']}"
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
                    </div>
                    <div class="tab-pane fade" id="v-pills-messages" role="tabpanel" aria-labelledby="step3-">
                        <div class="form-row">
                            <div class="col-lg-12">
                                <div class="form-group">
                                    <label class="control-label">${labels['domain.user.address']}</label>
                                    <textarea rows="5" class="form-control" placeholder="" name="address"
                                              data-rule-summernoteRequired="true"
                                              data-rule-maxlength="400"></textarea>
                                </div>
                            </div>
                            <div class="col-lg-12">
                                <div class="form-group">
                                    <div class="custom-control custom-checkbox">
                                        <input name="tnc" type="checkbox" class="custom-control-input" id="customCheck1"
                                               data-rule-required="true">
                                        <label class="custom-control-label" for="customCheck1">
                                            ${labels["page.register.agreeLabelText"]}
                                            <a href="javascript:;">${labels["page.register.termsOfService"]}</a>
                                            ${labels["page.register.and"]}
                                            <a href="javascript:;">${labels["page.register.privacyPolicy"]}</a>
                                        </label>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="v-pills-settings" role="tabpanel" aria-labelledby="step4-">
                        <div class="alert alert-success text-center">
                            <span>Thank you, All information have been filled correctly, You can Submit the form Remotely now</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
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
        //        console.log("currentParentModal.options.id");
        //        var currentParentModal = BootstrapModalWrapperFactory.globalModals[BootstrapModalWrapperFactory.globalModals.length - 1];
        //        console.log(currentParentModal.options.id);
        jQuery(function ($) {
            // here we can reference the container bootstrap modal by its id
            // passed as parameter to request by name "ajaxModalId"
            // or for demo purposese ONLY we can get a reference top modal
            // in current open managed instances in BootstrapModalWrapperFactory
            var currentParentModal = BootstrapModalWrapperFactory.globalModals[BootstrapModalWrapperFactory.globalModals.length - 1];
            //            console.log(currentParentModal.options.id);
            $("#" + currentParentModal.options.id).on(javatmp.settings.javaTmpAjaxContainerReady, function (event, modal) {
                // fire AFTER all transition done and your ajax content is shown to user.

                modal.originalModal.removeAttr("tabindex");
                modal.updateTitle("${labels['domain.user.CreateNewUser']}");
                modal.updateClosable(true);
                modal.updateSize("modal-lg");

                var form = $("#AddNewUserPopupFormId");
                var validator;
                var wizardDiv = modal.originalModal.find(".dynamic-form-wizard");

                // activiate first tab
                var firstTab = $(".nav .nav-link:first", wizardDiv);
                var targetPanelId = $(firstTab).attr("href");
                $(firstTab).removeClass("disabled");
                $(targetPanelId).addClass("active");
                console.log("id of target = " + $(targetPanelId).attr("id"));
                $(firstTab).tab('show');

                var callbackData = {success: false, cancel: true};
                modal.originalModal.on('hidden.bs.modal', function (e) {
                    // here we run passing function name as a remote callback
                    javatmp.util.waitForFinalEvent(function () {
                        if ($.isFunction(modal.options.localData.callback)) {
                            modal.options.localData.callback.call(callbackData, callbackData);
                        } else if ($.type(modal.options.localData.callback) === "string") {
                            javatmp.util.executeFunctionByName(modal.options.localData.callback, window, callbackData);
                        }
                    }, 20, "hidden.bs.modal");
                });
                var closeButton = modal.addButton({
                    label: "${labels['global.cancel']}",
                    cssClass: "btn btn-danger mr-auto",
                    action: function (button, buttonData, originalEvent) {
                        validator.destroy();
                        return this.hide();
                    }
                });
                var previousButton = modal.addButton({
                    label: "Previous",
                    cssClass: "btn btn-primary",
                    action: function (button, buttonData, originalEvent) {
                        var currentActiveElement = $(".nav .nav-link.active", wizardDiv);
                        var previousElement = $(currentActiveElement).prev();
                        console.log("prev-button current[" + $(currentActiveElement).attr("id") + "], next [" + $(previousElement).attr("id") + "]");
                        if ($(previousElement).length > 0) {
                            $(previousElement).tab('show');
                        }
                    }
                });
                var nextButton = modal.addButton({
                    label: "Next",
                    cssClass: "btn btn-primary",
                    action: function (button, buttonData, originalEvent) {
                        var currentActiveElement = $(".nav .nav-link.active", wizardDiv);
                        var nextActiveElement = $(currentActiveElement).next();
                        console.log("next-button current[" + $(currentActiveElement).attr("id") + "], next [" + $(nextActiveElement).attr("id") + "]");
                        if (!form.valid()) {
                            return false;
                        }
                        if ($(nextActiveElement).length > 0) {
                            $(nextActiveElement).removeClass("disabled");
                            $(nextActiveElement).tab('show');
                        }
                    }
                });
                var sendButton = modal.addButton({
                    label: "Send",
                    cssClass: "btn btn-success",
                    action: function (button, buttonData, originalEvent) {
                        form.trigger("submit");
                    }
                });

                $(sendButton).hide();

                modal.originalModal.find(".modal-footer").addClass("justify-content-start");

                $('[data-toggle="pill"]').on('show.bs.tab', function (e) {
                    console.log("show.bs.tab = " + $(e.target).attr("id")); // newly activated tab
                    console.log("show.bs.tab = " + $(e.relatedTarget).attr("id")); // previous active tab
                    //                    e.preventDefault();
                });
                $('[data-toggle="pill"]').on('shown.bs.tab', function (e) {
                    console.log("shown.bs.tab = " + $(e.target).attr("id")); // newly activated tab
                    console.log("shown.bs.tab = " + $(e.relatedTarget).attr("id")); // previous active tab
                    var currentShownElement = $(e.target);
                    console.log("current shown is " + $(currentShownElement).attr("id"));
                    if ($(currentShownElement).attr("href") === "#v-pills-messages") {
                        console.log("Reache #v-pills-messages");
                        $("#v-pills-messages", wizardDiv).find("textarea[name='address']").addClass('forceValidate');
                    }
                    if ($(currentShownElement).prev().length > 0) {
                        $(previousButton).prop("disabled", false);
                        $(previousButton).removeClass("disabled");
                    } else {
                        $(previousButton).prop("disabled", true);
                        $(previousButton).addClass("disabled");
                    }
                    if ($(currentShownElement).next().length > 0) {
                        $(nextButton).prop("disabled", false);
                        $(nextButton).removeClass("disabled");
                        $(sendButton).prop("disabled", true);
                        $(sendButton).addClass("disabled");
                        $(nextButton).show(200);
                        $(sendButton).hide(200);
                    } else {
                        $(nextButton).prop("disabled", true);
                        $(nextButton).addClass("disabled");
                        $(sendButton).prop("disabled", false);
                        $(sendButton).removeClass("disabled");
                        $(nextButton).hide(200);
                        $(sendButton).show(200);
                    }
                });
                $('[data-toggle="pill"]').on('hidden.bs.tab', function (e) {
                    console.log("hidden.bs.tab = " + $(e.target).attr("id")); // newly activated tab
                    console.log("hidden.bs.tab = " + $(e.relatedTarget).attr("id")); // previous active tab
                    //                    e.preventDefault();
                });
                $('[data-toggle="pill"]').on('hide.bs.tab', function (e) {
                    var currentTab = $(e.target);
                    var newTab = $(e.relatedTarget);
                    console.log("hide.bs.tab currentTab = " + $(currentTab).attr("id")); // newly activated tab
                    console.log("hide.bs.tab newTab = " + $(newTab).attr("id")); // previous active tab
                    //                    e.preventDefault();
                    //                    return false;
                    var newTabIsSmaller = false;
                    $(currentTab).prevAll().each(function (index, element) {
                        if ($(element).attr("id") === $(newTab).attr("id")) {
                            newTabIsSmaller = true;
                        }
                    });
                    console.log("is previous [" + newTabIsSmaller + "]");
                    if (newTabIsSmaller) {
                        return true;
                    }
                    if (!form.valid()) {
                        return false;
                    }
                });

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