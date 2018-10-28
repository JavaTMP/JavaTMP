<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="dynamic-ajax-content">
    <div class="row">
        <div class="col-lg-12">
            <form enctype="multipart/form-data" autocomplete="off" id="AddNewUserPopupFormId" class="form"
                  action="${pageContext.request.contextPath}/user/CreateUserController" method="post" novalidate="novalidate">
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
                            <div class="col-lg-3">
                                <div class="form-group">
                                    <label class="control-label">${labels['domain.user.theme']}</label>
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
                            <div class="col-lg-3">
                                <div class="form-group">
                                    <label class="control-label">${labels['domain.user.timezone']}</label>
                                    <select name="timezone" class="form-control" data-rule-required="true">
                                        <option value="">${labels['page.text.kindlySelect']}</option>
                                        <c:choose>
                                            <c:when test="${fn:length(requestScope.timezones) > 0}">
                                                <option value="">Choose ...</option>
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
                        <div class="form-group">
                            <label class="control-label">${labels['domain.user.address']}</label>
                            <textarea rows="5" class="form-control forceValidate" placeholder="" name="address"
                                      data-rule-summernoteRequired="true"
                                      data-rule-maxlength="400"></textarea>
                        </div>
                        <div class="form-row">
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
        currentParentModal.originalModal.find(".modal-body").css({"max-height": "70vh", "overflow-y": "auto"});
//            console.log(currentParentModal.options.id);
        $("#" + currentParentModal.options.id).on(javatmp.settings.javaTmpAjaxContainerReady, function (event, modal) {
            // fire AFTER all transition done and your ajax content is shown to user.

            var form = $('#AddNewUserPopupFormId');
            var validator = null;

            modal.updateTitle("${labels['domain.user.CreateNewUser']}");
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
                label: "${labels['user.btn.CreateNewUserAction']}",
                cssClass: "btn btn-primary",
                action: function (modalWrapper, button, buttonData, originalEvent) {
                    form.trigger("submit");
                }
            });
            var closeAnyWay = false;
            var callbackData = {success: false, cancel: true};
            modal.originalModal.on('hidden.bs.modal', function (e) {
                // here we run passing function name as a remote callback
                javatmp.util.waitForFinalEvent(function () {
                    if ($.isFunction(modal.options.passData.callback)) {
                        modal.options.passData.callback.apply();
                    } else if ($.type(modal.options.passData.callback) === "string") {
                        javatmp.util.executeFunctionByName(modal.options.passData.callback, window, callbackData);
                    }
                }, 100, "@addNewUserPopup");
            });
            modal.setOnDestroy(function (modalInstance) {
                if (closeAnyWay) {
//                    modalWrapper.setOnDestroy(null);
                    return true;
                }
//                BootstrapModalWrapperFactory.confirm({
//                    title: "Confirm",
//                    message: "Are You Sure You want to Close ?",
//                    onConfirmAccept: function () {
//                        closeAnyWay = true;
//                        modalInstance.hide();
//                    }
//                });
                BootstrapModalWrapperFactory.createModal({
                    message: "Are You Sure You want to Close ?",
                    title: "Confirm",
                    closable: false,
                    closeByBackdrop: false,
                    buttons: [
                        {
                            label: javatmp.settings.labels["global.no"],
                            cssClass: "btn btn-secondary",
                            action: function (modalWrapper, button, buttonData, originalEvent) {
                                return modalWrapper.hide();
                            }
                        },
                        {
                            label: javatmp.settings.labels["global.yes"],
                            cssClass: "btn btn-primary",
                            action: function (modalWrapper, button, buttonData, originalEvent) {
                                closeAnyWay = true;
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
                clearForm: true, // clear all form fields after successful submit
//                resetForm: true, // reset the form after successful submit
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
            validator = form.validate($.extend(true, {}, javatmp.settings.jqueryValidationDefaultOptions, {}));

            var modalZIndex = modal.originalModal.css('zIndex');
            form.find("input[name='birthDate']").inputmask({
                alias: "datetime",
                placeholder: "dd/mm/yyyy",
                inputFormat: "dd/mm/yyyy",
                displayFormat: true,
                hourFormat: "24",
                clearMaskOnLostFocus: false
            });
            form.find("input[name='birthDate']").daterangepicker({
                "opens": javatmp.settings.floatReverse,
                startDate: moment().format(javatmp.settings.dateFormat),
                singleDatePicker: true,
                showDropdowns: true,
                timePicker: false,
                timePickerIncrement: 1,
                timePicker24Hour: true,
                autoApply: true,
                autoUpdateInput: false,
                minDate: '01/01/1900',
                maxDate: '31/12/2099',
                //                    maxDate: '',
                //                    minDate: moment(),
                locale: {
                    "direction": javatmp.settings.direction,
                    format: javatmp.settings.dateFormat
                }
            }, function (start, end, label) {
                var formatedDateSelected = moment(start).locale('en').format(javatmp.settings.dateFormat);
                form.find("input[name='birthDate']").val(formatedDateSelected).trigger("change");
            });
            $(".daterangepicker").css('z-index', modalZIndex + 1);

            form.find("textarea[name='address']").summernote({
                direction: javatmp.settings.direction,
                lang: javatmp.user.lang === "ar" ? "ar-AR" : javatmp.user.lang,
                height: 100,
                dialogsInBody: true
            });
            modal.originalModal.removeAttr('tabindex');

            $.fn.select2.defaults.set("theme", "bootstrap");
            $.fn.select2.defaults.set("dir", javatmp.settings.direction);
            $.fn.select2.defaults.set("placeholder", javatmp.settings.labels['page.text.kindlySelect']);

            form.find("select[name='lang']").select2({
                allowClear: true,
                containerCssClass: ':all:',
                width: '',
                dropdownCssClass: "select2-lang-dropdown"
            }).on("select2:open", function () {
                $(".select2-lang-dropdown", ".select2-container").css('z-index', modalZIndex + 1);
            });
            form.find("select[name='theme']").select2({
                allowClear: true,
                containerCssClass: ':all:',
                width: '',
                escapeMarkup: function (markup) {
                    return markup;
                },
                templateSelection: formatThemeSelection,
                templateResult: formatThemeResult,
                dropdownCssClass: "select2-theme-dropdown"
            }).on("select2:open", function () {
                $(".select2-theme-dropdown", ".select2-container").css('z-index', modalZIndex + 1);
            });
            form.find("select[name='timezone']").select2({
                allowClear: true,
                containerCssClass: ':all:',
                width: '',
                dropdownCssClass: "select2-timezone-dropdown"
            }).on("select2:open", function () {
                $(".select2-timezone-dropdown", ".select2-container").css('z-index', modalZIndex + 1);
            });
            form.find("select[name='countryId']").select2({
                theme: "bootstrap",
                dir: javatmp.settings.direction,
                allowClear: true,
                containerCssClass: ':all:',
                width: '',
                templateSelection: formatCountrySelection,
                templateResult: formatCountry,
                escapeMarkup: function (markup) {
                    return markup;
                },
                dropdownCssClass: "select2-countryId-dropdown"
            }).on("select2:select", function () {
                (this).focus();
            }).on("select2:open", function () {
                $(".select2-countryId-dropdown", ".select2-container").css('z-index', modalZIndex + 1);
            });
            function formatCountry(repo) {
                if (repo.loading)
                    return repo.text;
                var imagePath = javatmp.settings.contextPath + "/assets/img/flags/" + repo.id.toLowerCase() + ".png";
                var template =
                        '    <div class="media d-flex align-items-center">' +
                        '        <img class="mr-1" src="{{imagePath}}" alt="{{countryText}}"/>' +
                        '        <div class="media-body">' +
                        '            <strong>{{countryText}} ({{countryId}})</strong>' +
                        '        </div>' +
                        '    </div>';
                var readyData = template.composeTemplate({
                    'imagePath': imagePath,
                    'countryText': repo.text,
                    'countryId': repo.id
                });
                return readyData;
            }
            function formatCountrySelection(repo) {
                if (!repo.id) {
                    return repo.text;
                }

                var imagePath = javatmp.settings.contextPath + "/assets/img/flags/" + repo.id.toLowerCase() + ".png";
                var template =
                        '    <div class="media d-flex align-items-center">' +
                        '        <img class="mr-1" src="{{imagePath}}" alt="{{countryText}}"/>' +
                        '        <div class="media-body">' +
                        '            <span>{{countryText}} ({{countryId}})</span>' +
                        '        </div>' +
                        '    </div>';
                var readyData = template.composeTemplate({
                    'imagePath': imagePath,
                    'countryText': repo.text,
                    'countryId': repo.id
                });
                return readyData;
            }
            function formatThemeSelection(repo) {
                if (!repo.id) {
                    return repo.text;
                }

                var imagePath = javatmp.settings.contextPath + "/assets/img/themes/" + repo.text + ".png";
                var template =
                        '    <div class="media d-flex align-items-center">' +
                        '        <img style="height: 1.5rem;" class="mr-1" src="{{imagePath}}" alt="{{themeName}}"/>' +
                        '        <div class="media-body">' +
                        '            <span>{{themeName}}</span>' +
                        '        </div>' +
                        '    </div>';
                var readyData = template.composeTemplate({
                    'imagePath': imagePath,
                    'themeName': repo.text
                });
                return readyData;
            }
            function formatThemeResult(repo) {
                if (!repo.id) {
                    return repo.text;
                }

                var imagePath = javatmp.settings.contextPath + "/assets/img/themes/" + repo.text + ".png";
                var template =
                        '    <div class="media d-flex align-items-center">' +
                        '        <img style="height: 75px;" class="mr-1" src="{{imagePath}}" alt="{{themeName}}"/>' +
                        '        <div class="media-body">' +
                        '            <span>{{themeName}}</span>' +
                        '        </div>' +
                        '    </div>';
                var readyData = template.composeTemplate({
                    'imagePath': imagePath,
                    'themeName': repo.text
                });
                return readyData;
            }
            form.find("#profilePicturePreviewContainerId").mCustomScrollbar({
                axis: "yx",
                theme: "javatmp",
                scrollInertia: 0,
                advanced: {
                    updateOnContentResize: true,
                    autoExpandHorizontalScroll: true,
                    updateOnImageLoad: true
                },
                mouseWheel: {
                    preventDefault: true,
                    scrollAmount: 85
                }
            });
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
//                            $("#profilePicturePreviewContainerId").mCustomScrollbar("update");
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