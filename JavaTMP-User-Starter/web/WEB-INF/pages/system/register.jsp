<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="${labels["global.language"]}" dir="${labels["global.direction"]}">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
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
                                            <input class="form-control" type="text" placeholder="${labels['domain.user.firstName']}"
                                                   name="firstName" data-rule-required="true">
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-6">
                                        <div class="form-group">
                                            <label class="control-label">${labels['domain.user.lastName']}</label>
                                            <input class="form-control" type="text" placeholder="${labels['domain.user.lastName']}"
                                                   name="lastName" data-rule-required="true">
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-6">
                                        <div class="form-group">
                                            <label class="control-label">${labels['domain.user.birthDate']}</label>
                                            <input dir="ltr" class="form-control"  type="text" name="birthDate"
                                                   data-rule-required="true" data-rule-validDate="true" data-rule-dateBeforeNow="true">
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-6">
                                        <div class="form-group">
                                            <label class="control-label">${labels['domain.user.email']}</label>
                                            <input class="form-control" type="text" placeholder="${labels['domain.user.email']}"
                                                   name="email" data-rule-required="true" data-rule-email="true"
                                                   data-rule-minlength="5" data-rule-maxlength="50">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="col-lg-3 col-md-6">
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
                                    <div class="col-lg-3 col-md-6">
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
                                    <div class="col-lg-3 col-md-6">
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
                                    <div class="col-lg-3 col-md-6">
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
                                    <div class="col-lg-4 col-md-6">
                                        <div class="form-group">
                                            <label class="control-label">${labels['domain.user.userName']}</label>
                                            <input class="form-control" type="text" autocomplete="off" placeholder="${labels['domain.user.userName']}"
                                                   name="userName" data-rule-required="true" data-rule-minlength="6" data-rule-maxlength="20">
                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-6">
                                        <div class="form-group">
                                            <label class="control-label">${labels['domain.user.password']}</label>
                                            <input class="form-control" type="password" autocomplete="off"
                                                   placeholder="${labels['domain.user.password']}"
                                                   name="password" data-rule-required="true">
                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-6">
                                        <div class="form-group">
                                            <label class="control-label">${labels['domain.user.reTypePassword']}</label>
                                            <input class="form-control" type="password" autocomplete="off"
                                                   placeholder="${labels['domain.user.reTypePassword']}" name="rpassword"
                                                   data-rule-required="true" data-rule-equalto="form input[name='password']">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="col-lg-5  col-md-7">
                                        <div class="form-group">
                                            <label>${labels["page.register.captchaLabelText"]}</label>
                                            <img src="${pageContext.request.contextPath}/CaptchaImageController?_cancelGzip" class="d-block mt-1 mb-2" alt=""/>
                                            <input name="captchaAnswer" type="text" class="form-control" data-rule-required="true" />
                                        </div>
                                    </div>
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
        <script src="${pageContext.request.contextPath}/assets/app/js/javatmp.plugins.js?v=43" type="text/javascript"></script>
        <script type="text/javascript">
            (function ($) {
                var defaults = {
                    defaultPassData: {_ajax: "ajax", _ajaxGlobalBlockUI: true, _handleAjaxErrorGlobally: true},
                    defaultUrl: '${pageContext.request.contextPath}/pages/home/home',
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

                javatmp.plugins.init({
                    locale: "${labels["global.language"]}",
                    direction: "${labels["global.direction"]}",
                    isRTL: ${labels['global.direction'] == 'ltr' ? 'false' : 'true'},
                    defaultSelectPlaceholder: "${labels['page.text.kindlySelect']}",
                    dateFormat: javatmp.settings.dateFormat,
                    dateTimeFormat: javatmp.settings.dateTimeFormat
                });

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
                validator = form.validate();

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
