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
                                    <input class="form-control required" type="text" placeholder="${labels['domain.user.firstName']}" name="firstName">
                                </div>
                            </div>
                            <div class="col-lg-3">
                                <div class="form-group">
                                    <label class="control-label">${labels['domain.user.lastName']}</label>
                                    <input class="form-control required" type="text" placeholder="${labels['domain.user.lastName']}" name="lastName">
                                </div>
                            </div>
                            <div class="col-lg-3">
                                <div class="form-group">
                                    <label class="control-label">${labels['domain.user.birthDate']}</label>
                                    <input dir="ltr" class="form-control required"
                                           type="text" name="birthOfDateStr"
                                           data-rule-validDate="true"
                                           data-rule-dateBeforeNow="true">
                                </div>
                            </div>
                            <div class="col-lg-3">
                                <div class="form-group">
                                    <label class="control-label">${labels['domain.user.email']}</label>
                                    <input class="form-control required email"
                                           type="text" placeholder="${labels['domain.user.email']}" name="email"
                                           data-rule-minlength="5" data-rule-maxlength="50">
                                </div>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="col-lg-3">
                                <div class="form-group">
                                    <label class="control-label">${labels['domain.user.country']}</label>
                                    <select name="countryId" class="form-control required">
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
                                    <select name="lang" class="form-control required">
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
                                    <select name="theme" class="form-control required">
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
                                    <select name="timezone" class="form-control required">
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
                                    <input class="form-control required" type="text" autocomplete="off"
                                           placeholder="${labels['domain.user.userName']}"
                                           name="userName"
                                           data-rule-minlength="6"
                                           data-rule-maxlength="20">
                                </div>
                            </div>
                            <div class="col-lg-4">
                                <div class="form-group">
                                    <label class="control-label">${labels['domain.user.password']}</label>
                                    <input class="form-control required" type="password" autocomplete="off"
                                           placeholder="${labels['domain.user.password']}" name="password">
                                </div>
                            </div>
                            <div class="col-lg-4">
                                <div class="form-group">
                                    <label class="control-label">${labels['domain.user.reTypePassword']}</label>
                                    <input class="form-control required" type="password" autocomplete="off"
                                           placeholder="${labels['domain.user.reTypePassword']}"
                                           name="rpassword"
                                           data-rule-equalto="form input[name='password']">
                                </div>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="col-lg-12">
                                <div class="form-group">
                                    <label for="exampleFormControlFile1">${labels['domain.user.Document']}</label>
                                    <div class="custom-file">
                                        <input name="profilePicture" type="file" class="custom-file-input required" id="validatedCustomFile">
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
                                        <input name="tnc" type="checkbox" class="custom-control-input required" id="tncInputId">
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
                        var newDate = moment(value, javatmp.settings.dateFormat).locale('en').format(javatmp.settings.networkDateFormat);
                        formData.push({"name": "birthDate", "value": newDate});
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
                BootstrapModalWrapperFactory.createModal({
                    title: xhr.statusText + " : " + xhr.status,
                    message: "error[" + xhr + "][" + status + "][" + error + "][" + $form + "]"
                }).show();
            }
        });
        // pre-submit callback
        // initialize jQuery Validation plugin using global data.
        validator = form.validate($.extend(true, {}, javatmp.settings.jqueryValidationDefaultOptions, {}));

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
            form.find("input[name='birthOfDateStr']").val(formatedDateSelected).trigger("change");
        });
        $(".daterangepicker.dropdown-menu").css('z-index', 600 + 1);
        form.find("textarea[name='address']").summernote({
            direction: javatmp.settings.direction,
            lang: javatmp.user.lang === "ar" ? "ar-AR" : javatmp.user.lang,
            height: 200,
            dialogsInBody: true
        });
        $.fn.select2.defaults.set("theme", "bootstrap");
        $.fn.select2.defaults.set("dir", javatmp.settings.direction);
        $.fn.select2.defaults.set("placeholder", javatmp.settings.labels['page.text.kindlySelect']);

        form.find("select[name='lang']").select2({
            allowClear: true,
            containerCssClass: ':all:',
            width: ''
        });
        form.find("select[name='theme']").select2({
            allowClear: true,
            containerCssClass: ':all:',
            width: '',
            escapeMarkup: function (markup) {
                return markup;
            },
            templateSelection: formatThemeSelection,
            templateResult: formatThemeResult
        });
        form.find("select[name='timezone']").select2({
            allowClear: true,
            containerCssClass: ':all:',
            width: ''
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
            }
        }).on("select2:select", function () {
            (this).focus();
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