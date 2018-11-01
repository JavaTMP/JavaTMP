<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="${labels["global.language"]}" dir="${labels["global.direction"]}">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>${labels["global.page.title"]}</title>

        <link href="${pageContext.request.contextPath}/assets/dist/css/javatmp-plugins-all.min.css" rel="stylesheet" type="text/css"/>
        <link href='${pageContext.request.contextPath}/assets/dist/css/javatmp-plugins-print-all.min.css' rel='stylesheet' media='print' />
        <c:if test="${labels['global.direction'] == 'ltr'}">
            <link id="themeStyleSheet" href="${pageContext.request.contextPath}/assets/dist/css/javatmp-${labels['global.defaultThemeName']}.min.css" rel="stylesheet" type="text/css"/>
        </c:if>
        <c:if test="${labels['global.direction'] == 'rtl'}">
            <link id="themeStyleSheet" href="${pageContext.request.contextPath}/assets/dist/css/javatmp-${labels['global.defaultThemeName']}-rtl.min.css" rel="stylesheet" type="text/css"/>
        </c:if>
        <!-- Include language support font -->
        <link href="${pageContext.request.contextPath}/assets/dist/css/font-family-${labels['global.language']}.min.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div id="oneTimeOverlay" style="position: fixed;width: 100%;height: 100%;top: 0px;left: 0;right: 0;bottom: 0;background-color: rgba(255,255,255,1);z-index: 1000000;cursor: wait;">${labels['global.loadingText']}</div>
        <div class="container-fluid">
            <div class="row justify-content-center">
                <div class="col-lg-7 col-md-8 col-sm-9" >
                    <div class="card mt-2 bg-light shadow">
                        <div class="card-header">
                            ${labels["page.register.registerCardTitleText"]}
                        </div>
                        <div class="card-body">
                            <form id="main-register-form" method="POST" role="form" action="${pageContext.request.contextPath}/register">
                                <div class="form-row">
                                    <div class="col-lg-3 col-md-6">
                                        <div class="form-group">
                                            <label class="control-label">${labels['domain.user.firstName']}</label>
                                            <input class="form-control" type="text" placeholder="${labels['domain.user.firstName']}" name="firstName">
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-6">
                                        <div class="form-group">
                                            <label class="control-label">${labels['domain.user.lastName']}</label>
                                            <input class="form-control" type="text" placeholder="${labels['domain.user.lastName']}" name="lastName">
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-6">
                                        <div class="form-group">
                                            <label class="control-label">${labels['domain.user.birthDate']}</label>
                                            <input dir="ltr" class="form-control"  type="text" name="birthDate">
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-6">
                                        <div class="form-group">
                                            <label class="control-label">${labels['domain.user.email']}</label>
                                            <input class="form-control" type="text" placeholder="${labels['domain.user.email']}" name="email">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="col-lg-3 col-md-6">
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
                                    <div class="col-lg-3 col-md-6">
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
                                    <div class="col-lg-3 col-md-6">
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
                                    <div class="col-lg-3 col-md-6">
                                        <div class="form-group">
                                            <label class="control-label">${labels['domain.user.timezone']}</label>
                                            <select name="timezone" class="form-control">
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
                                    <div class="col-lg-4 col-md-6">
                                        <div class="form-group">
                                            <label class="control-label">${labels['domain.user.userName']}</label>
                                            <input class="form-control" type="text" autocomplete="off" placeholder="${labels['domain.user.userName']}"
                                                   name="userName">
                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-6">
                                        <div class="form-group">
                                            <label class="control-label">${labels['domain.user.password']}</label>
                                            <input class="form-control" type="password" autocomplete="off"
                                                   placeholder="${labels['domain.user.password']}" name="password">
                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-6">
                                        <div class="form-group">
                                            <label class="control-label">${labels['domain.user.reTypePassword']}</label>
                                            <input class="form-control" type="password" autocomplete="off" placeholder="${labels['domain.user.reTypePassword']}"
                                                   name="rpassword">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="col-lg-5  col-md-7">
                                        <div class="form-group">
                                            <label for="captchaCharactersTextField">${labels["page.register.captchaLabelText"]}</label>
                                            <img src="${pageContext.request.contextPath}/CaptchaImageController?_cancelGzip" class="d-block mt-1 mb-2" alt=""/>
                                            <input name="captchaAnswer" type="text" class="form-control required" id="captchaCharactersTextField"/>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="col-lg-12">
                                        <div class="form-group">
                                            <div class="custom-control custom-checkbox">
                                                <input name="tnc" type="checkbox" class="custom-control-input" id="customCheck1">
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
                                <div class="form-row">
                                    <div class="col-lg-12">
                                        <div class="form-group">
                                            <button type="submit" id="register-submit-btn" class="btn btn-primary">${labels["page.btn.registerNewUser"]}</button>
                                            <a href="${pageContext.request.contextPath}/login" class="btn btn-secondary">${labels["page.btn.returnToLoginPage"]}</a>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <style type="text/css">

        </style>
        <script src="${pageContext.request.contextPath}/assets/dist/js/javatmp-plugins-all.min.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/assets/dist/js/javatmp-plugins-all-locale-${labels["global.language"]}.min.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/assets/dist/js/javatmp.min.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/assets/app/js/javatmp.plugins.js?62371063" type="text/javascript"></script>
        <script type="text/javascript">
            (function ($) {
                String.prototype.composeTemplate = (function () {
                    var re = /\{{(.+?)\}}/g;
                    return function (o) {
                        return this.replace(re, function (_, k) {
                            return typeof o[k] !== 'undefined' ? o[k] : '';
                        });
                    };
                }());

                var defaults = {
                    defaultPassData: {_ajax: "ajax", _ajaxGlobalBlockUI: true, _handleAjaxErrorGlobally: true},
                    defaultUrl: '${pageContext.request.contextPath}/pages/home',
                    floatDefault: "${labels['global.floatDefault']}",
                    floatReverse: "${labels['global.floatReverse']}",
                    direction: "${labels['global.direction']}",
                    isRTL: ${labels['global.direction'] == 'ltr' ? 'false' : 'true'},
                    contextPath: '${pageContext.request.contextPath}',
                    networkDateFormat: "YYYY-MM-DDTHH:mm:ss.SSSZ",
                    dateFormat: "DD/MM/YYYY",
                    dateTimeFormat: "DD/MM/YYYY HH:mm",
                    dateTimeSecondFormat: "DD/MM/YYYY HH:mm:ss",
                    labels: {},
                    httpMethod: "GET",
                    dataType: "html",
                    updateURLHash: true
                };

                defaults.labels = {
                    "loadingText": "${labels['global.loadingText']}",
                    "page.text.kindlySelect": '${labels['page.text.kindlySelect']}',
                    "goToLoginPage": "${labels['action.register.goToLoginPage']}",
                    "global.language": "${labels['global.language']}"
                };

                javatmp.init(defaults);
                javatmp.ajax.init({
                    defaultPassData: javatmp.settings.defaultPassData
                });

                moment.locale(javatmp.settings.labels['global.language']);

                jQuery.validator.addMethod("validDate", function (value, element) {
                    return this.optional(element) || moment(value, javatmp.settings.dateFormat, true).isValid();
                }, "Please enter a valid date in the format DD/MM/YYYY");
                jQuery.validator.addMethod("dateBeforeNow", function (value, element, params) {
                    if (this.optional(element) || value === "")
                        return true;
                    if (moment(value, javatmp.settings.dateFormat).isBefore(moment().set({hour: 0, minute: 0, second: 0, millisecond: 0})))
                        return true;
                    return false;
                }, 'Must be less than Now.');
                // https://www.sanwebe.com/2016/07/ajax-form-submit-examples-using-jquery
                // https://stackoverflow.com/questions/1960240/jquery-ajax-submit-form
                var form = $('#main-register-form');
                var validator = null;
                var alertError = null;
                form.on("submit", function (event) {
                    event.preventDefault();
                    if (!$(this).valid()) {
                        return;
                    }
                    $('#' + alertError).remove();
                    var httpType = $(this).attr("method");
                    var post_url = $(this).attr("action"); //get form action url
                    //                    var form_data = new FormData(form); //Creates new FormData object
                    var formData = $(this).serializeArray();
                    for (var i = 0; i < formData.length; i++) {
                        if (formData[i].name === "birthDate") {
                            var value = formData[i].value;
                            var newDate = moment(value, javatmp.settings.dateFormat).locale('en').format(javatmp.settings.networkDateFormat);
                            formData[i].value = newDate;
                            break;
                        }
                    }
                    $.ajax({
                        type: httpType,
                        url: post_url,
                        //                        processData: false,
                        //                        contentType: false,
                        data: formData,
                        success: function (data) {
                            if (data.overAllStatus) {
                                alertError = BootstrapAlertWrapper.createAlert({
                                    container: form,
                                    place: "prepent",
                                    type: "success",
                                    message: data.message + " . ",
                                    close: true
                                });
                                $('<a>', {
                                    text: javatmp.settings.labels.goToLoginPage,
                                    class: '',
                                    href: data.redirectURL
                                }).appendTo("#" + alertError);
                            } else {
                                // show error to user
                                alertError = BootstrapAlertWrapper.createAlert({
                                    container: form,
                                    place: "prepent",
                                    type: "danger",
                                    message: data.message,
                                    close: true
                                });
                            }
                        },
                        error: function (data) {
                            alert("error" + JSON.stringify(data));
                        }
                    });
                });
                validator = form.validate({
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
                        birthDate: {
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
                        password: {
                            required: true,
                            minlength: 6,
                            maxlength: 20
                        },
                        rpassword: {
                            required: true,
                            equalTo: $("input[name='password']", form)
                        },
                        tnc: {
                            required: true
                        },
                        lang: {
                            required: true
                        },
                        timezone: {
                            required: true
                        },
                        theme: {
                            required: true
                        }
                    },
                    highlight: function (element) {
                        $(element).closest('.form-group').removeClass('has-success').addClass('has-error');
                    },
                    unhighlight: function (element) {
                        $(element).closest('.form-group').removeClass('has-error').addClass('has-success');
                    },
                    errorElement: 'small',
                    errorClass: 'form-text text-danger',
                    errorPlacement: function (error, element) {
                        if (element.length) {
                            var targetParent = $(element).parent();
                            if (targetParent.hasClass("form-check") || targetParent.hasClass("custom-control")) {
                                targetParent = targetParent.parent();
                            }
                            targetParent.append(error);
                        }
                    }
                });

                var birthDateInputMask = javatmp.plugins.inputmaskWrapperForDate(form.find("input[name='birthDate']"));
                var birthDateDatePicker = javatmp.plugins.daterangepickerWrapperForDate(form.find("input[name='birthDate']"));
                var addressEditor = javatmp.plugins.summernoteWrapper(form.find("textarea[name='address']"));
                var langSelect = javatmp.plugins.select2Wrapper(form.find("select[name='lang']"));
                var timezoneSelect = javatmp.plugins.select2Wrapper(form.find("select[name='timezone']"));
                var themeSelect = javatmp.plugins.select2WrapperForTheme(form.find("select[name='theme']"));
                var countryIdSelect = javatmp.plugins.select2WrapperForCountry(form.find("select[name='countryId']"));

                form.find("select[name='timezone']").val(moment.tz.guess()).trigger('change.select2');
            }(jQuery));
        </script>
        <script type="text/javascript">
            jQuery(function ($) {
                $("form [type=submit]").prop("disabled", false);
                $("#oneTimeOverlay").remove();
            });
        </script>
    </body>
</html>
