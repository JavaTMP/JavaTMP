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
                                <input readonly="readonly" class="form-control-plaintext" type="text" name="id" value="${requestScope.user.id}">
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-9">
                        <div class="form-group form-row">
                            <label class="control-label col-sm-3 col-form-label">${labels['domain.user.status']}</label>
                            <div class="col-sm-9">
                                <select name="status" class="custom-select">
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
                                    <input class="form-control" type="text" placeholder="${labels['domain.user.firstName']}" name="firstName" value="${requestScope.user.firstName}">
                                </div>
                            </div>
                            <div class="col-lg-3">
                                <div class="form-group">
                                    <label class="control-label">${labels['domain.user.lastName']}</label>
                                    <input class="form-control" type="text" placeholder="${labels['domain.user.lastName']}" name="lastName" value="${requestScope.user.lastName}">
                                </div>
                            </div>
                            <div class="col-lg-3">
                                <div class="form-group">
                                    <label class="control-label">${labels['domain.user.birthDate']}</label>
                                    <input dir="ltr" class="form-control"  type="text" name="birthOfDateStr" value="<fmt:formatDate pattern='dd/MM/yyyy' timeZone="${sessionScope.user.timezone}" value='${requestScope.user.birthDate}'/>">
                                </div>
                            </div>
                            <div class="col-lg-3">
                                <div class="form-group">
                                    <label class="control-label">${labels['domain.user.email']}</label>
                                    <input class="form-control" type="text" placeholder="Email" name="email" value="${requestScope.user.email}">
                                </div>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="col-lg-3">
                                <div class="form-group">
                                    <label class="control-label">${labels['domain.user.country']}</label>
                                    <select name="countryId" class="form-control">
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
                                    <select name="lang" class="form-control">
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
                                    <select name="theme" class="form-control">
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
                                    <select name="timezone" class="form-control">
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
                                           name="userName" value="${requestScope.user.userName}">
                                </div>
                            </div>
                            <div class="col-lg-3">
                                <div class="form-group">
                                    <label class="control-label">${labels['domain.user.currentPassword']}</label>
                                    <input class="form-control" type="password" autocomplete="off"
                                           placeholder="Old Password" name="oldPassword">
                                </div>
                            </div>
                            <div class="col-lg-3">
                                <div class="form-group">
                                    <label class="control-label">${labels['domain.user.newPassword']}</label>
                                    <input class="form-control" type="password" autocomplete="off"
                                           placeholder="New Password" name="password">
                                </div>
                            </div>
                            <div class="col-lg-3">
                                <div class="form-group">
                                    <label class="control-label">${labels['domain.user.reTypeNewPassword']}</label>
                                    <input class="form-control" type="password" autocomplete="off" placeholder="Re-type Your New Password"
                                           name="rpassword">
                                </div>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="col-lg-12">
                                <div class="form-group">
                                    <label for="exampleFormControlFile1">${labels['domain.user.Document']}</label>
                                    <div class="custom-file">
                                        <input name="profilePicture" type="file" class="custom-file-input" id="validatedCustomFile">
                                        <label class="custom-file-label" for="validatedCustomFile">Choose Profile Picture file...</label>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-6 text-center">
                                <div style="width: 200px; height: 200px;display: inline-block;position: relative">
                                    <div id="profilePicturePreviewContainerId" style="width: 200px; height: 200px;">
                                        <img id="profilePicturePreview" src="${pageContext.request.contextPath}/ViewUploadedFileController?documentId=${requestScope.user.profilePicDocument.documentId}&amp;randomHash=${requestScope.user.profilePicDocument.randomHash}&amp;viewType=inline" alt="Your Profile Image Preview" />
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-6 text-center">
                                <img id="profilePictureResizePreview" style="width: 200px; height: 200px;" src="${pageContext.request.contextPath}/ViewUploadedFileController?documentId=${requestScope.user.profilePicDocument.documentId}&amp;randomHash=${requestScope.user.profilePicDocument.randomHash}&amp;viewType=inline" alt="Your Profile Image Preview" />
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
                            <textarea rows="5" class="form-control forceValidate" placeholder="" name="address">${requestScope.user.address}</textarea>
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
            var form = $('#AddNewUserPopupFormId');
            var validator = null;
            modal.updateTitle("Update Complete User");
            modal.updateClosable(true);
            modal.updateSize("modal-lg");
            modal.addButton({
                label: "Close",
                cssClass: "btn btn-danger mr-auto",
                action: function (modalWrapper, button, buttonData, originalEvent) {
                    return modalWrapper.hide();
                }
            });
            modal.addButton({
                label: "Update Complete User",
                cssClass: "btn btn-primary",
                action: function (modalWrapper, button, buttonData, originalEvent) {
                    form.trigger("submit");
                }
            });
            var closeAnyWay = false;
            var callbackData = {success: false, cancel: true};
            modal.setOnDestroy(function (modalWrapper) {
                if (closeAnyWay) {
                    modalWrapper.setOnDestroy(null);
                    // here we run passing function name as a remote callback
                    javatmp.util.waitForFinalEvent(function () {
                        if ($.isFunction(modal.options.passData.callback)) {
                            modal.options.passData.callback.apply();
                        } else if ($.type(modal.options.passData.callback) === "string") {
                            javatmp.util.executeFunctionByName(modal.options.passData.callback, window, callbackData);
                        }
                    }, 200, "update-user-callback");
                    return true;
                }
                BootstrapModalWrapperFactory.confirm({
                    title: "Confirm",
                    message: "Are You Sure You want to Close ?",
                    onConfirmAccept: function () {
                        closeAnyWay = true;
                        modalWrapper.hide();
                    }
                });
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
                        if (formData[i].name === "birthOfDateStr") {
                            var value = formData[i].value;
                            var newDate = moment(value, "DD/MM/YYYY").locale('en').format("YYYY-MM-DDTHH:mm:ss.SSSZ");
                            formData.push({"name": "birthDate", "value": newDate});
                            break;
                        }
                    }

                },
                success: function (response, statusText, xhr, $form) {
//                    form.find("textarea[name='address']").summernote('code', '');
//                    form.resetForm();
//                    form.find(".form-group.has-success").removeClass(".has-success");
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

            validator = form.validate($.extend(true, {}, javatmp.settings.jqueryValidationDefaultOptions, {
                ignore1: ":hidden:not(.forceValidate)",
                ignore: ":hidden:not(.forceValidate), [contenteditable='true']:not([name])",
                rules: {
                    firstName: {
                        required: true
                    },
                    lastName: {
                        required: true
                    },
                    email: {
                        required: true,
                        email: true,
                        minlength: 5,
                        maxlength: 50
                    },
                    birthOfDateStr: {
                        required: true,
                        validDate: true,
                        dateBeforeNow: true
                    },
                    countryId: {
                        required: true
                    },
                    address: {
                        required: true,
                        maxlength: 400
                    },
                    userName: {
                        required: true
                    },
                    oldPassword: {
                        required: true,
                        minlength: 5,
                        maxlength: 20
                    },
                    password: {
                        required: true,
                        minlength: 5,
                        maxlength: 20
                    },
                    rpassword: {
                        required: true,
                        equalTo: $("input[name='password']", form)
                    },
                    profilePicture: {
                        required: false
                    },
                    tnc: {
                        required: true
                    },
                    note: {
                        required: true,
                        summernoteRequired: true
                    },
                    lang: {
                        required: true
                    },
                    timezone: {
                        required: true
                    },
                    theme: {
                        required: true
                    },
                    status: {
                        required: true
                    }
                },
                messages: {
                    firstName: {
                        required: "Kindly provide us with your first name"
                    },
                    lastName: {
                        required: "Kindly provide us with your last name"
                    },
                    email: {
                        required: "Kindly provide your email address",
                        email: "Kindly provide a valid email address"
                    },
                    birthOfDateStr: {
                        required: "Kindly provide your Birth Of Date",
                        validDate: "Kindly Provide a valid date value in format DD/MM/YYYY",
                        dateBeforeNow: "Kindly Provide a date in the past before today at least"
                    },
                    countryId: {
                        required: "Kindly select your nationality"
                    },
                    address: {
                        required: "Kindly provide your address"
                    },
                    note: {
                        summernoteRequired: "Kindly Provide a note"
                    }
                }
            }));
//            form.find("input[name='birthOfDateStr']").css({
//                "text-align": javatmp.settings.floatDefault
//            });
            var modalZIndex = modal.originalModal.css('zIndex');
            form.find("input[name='birthOfDateStr']").inputmask({
                alias: "datetime",
                placeholder: "dd/mm/yyyy",
                inputFormat: "dd/mm/yyyy",
                displayFormat: true,
                hourFormat: "24",
                clearMaskOnLostFocus: false
            });
            form.find("input[name='birthOfDateStr']").daterangepicker({
                "opens": javatmp.settings.floatReverse,
                startDate: moment().format("DD/MM/YYYY"),
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
                    format: 'DD/MM/YYYY'
                }
            }, function (start, end, label) {
                var formatedDateSelected = moment(start).format("DD/MM/YYYY");
                form.find("input[name='birthOfDateStr']").val(formatedDateSelected).trigger("change");
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
//            alert(modal.options.id);
//            $.fn.select2.defaults.set("dropdownParent", "#" + modal.options.id);
            form.find("select[name='lang']").select2({
                allowClear: true,
                containerCssClass: ':all:',
                width: '',
                dropdownCssClass: "select2-lang-dropdown"
            }).on("select2:open", function () {
                $(".select2-lang-dropdown", ".select2-container").css('z-index', modalZIndex);
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
                $(".select2-theme-dropdown", ".select2-container").css('z-index', modalZIndex);
            });
            form.find("select[name='timezone']").select2({
                allowClear: true,
                containerCssClass: ':all:',
                width: '',
                dropdownCssClass: "select2-timezone-dropdown"
            }).on("select2:open", function () {
                $(".select2-timezone-dropdown", ".select2-container").css('z-index', modalZIndex);
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
                $(".select2-countryId-dropdown", ".select2-container").css('z-index', modalZIndex);
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
                            $("#profilePicturePreviewContainerId").mCustomScrollbar("update");
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