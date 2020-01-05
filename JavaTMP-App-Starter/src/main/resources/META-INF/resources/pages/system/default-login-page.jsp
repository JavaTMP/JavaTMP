<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <body class="login bg-light pt-5">
        <div id="oneTimeOverlay" style="position: fixed;width: 100%;height: 100%;top: 0px;left: 0;right: 0;bottom: 0;background-color: rgba(255,255,255,1);z-index: 1000000;cursor: wait;">${labels['global.loadingText']}</div>
        <div class="container-fluid">
            <div class="row justify-content-center">
                <div class="col-xl-3 col-lg-3 col-md-6">
                    <div class="card my-3 bg-light shadow">
                        <div class="card-header">
                            ${labels['page.login.loginCardTitle']}
                        </div>
                        <div class="card-body">
                            <form id="main-login-form" method="POST" role="form" action="${pageContext.request.contextPath}/login">
                                <div class="form-group">
                                    <label class="control-label col-form-label">${labels['domain.user.userName']}</label>
                                    <input class="form-control" placeholder="${labels['domain.user.userName']}"
                                           name="userName" type="text" autofocus value="user123"
                                           data-rule-required="true">
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-form-label">${labels['domain.user.password']}</label>
                                    <input class="form-control" placeholder="${labels['domain.user.password']}"
                                           name="password" type="password" value="user123"
                                           data-rule-required="true">
                                </div>
                                <button disabled="" type="submit" href="javascript:;" class="btn btn-lg btn-primary btn-block">${labels['page.btn.login']}</button>
                                <a href="${pageContext.request.contextPath}/register" class="btn btn-success btn-block">${labels['page.btn.registerPage']}</a>
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
        <script src="${pageContext.request.contextPath}/assets/app/js/javatmp.plugins.wrapper.js?v=40" type="text/javascript"></script>
        <script type="text/javascript">
            (function ($) {
                javatmp.plugins.init({
                    locale: "${labels["global.language"]}",
                    direction: "${labels["global.direction"]}",
                    isRTL: ${labels['global.direction'] == 'ltr' ? 'false' : 'true'},
                    defaultSelectPlaceholder: "${labels['page.text.kindlySelect']}"
                });
                // https://www.sanwebe.com/2016/07/ajax-form-submit-examples-using-jquery
                // https://stackoverflow.com/questions/1960240/jquery-ajax-submit-form
                var loginForm = $('#main-login-form');
                var validator = null;
                var alertError = null;
                loginForm.on("submit", function (event) {
                    $('#' + alertError).remove();
                    event.preventDefault();
                    if (!$(this).valid()) {
                        return;
                    }
                    $.ajax({
                        type: $(this).attr("method"),
                        url: $(this).attr("action"),
                        data: $(this).serializeArray(),
                        success: function (data) {
                            if (data.overAllStatus) {
                                window.location.replace(data.message);
                            } else {
                                // show error to user
                                var alertError = BootstrapAlertWrapper.createAlert({
                                    container: loginForm,
                                    place: "prepent",
                                    type: "danger",
                                    message: data.message,
                                    close: false
                                });
                            }
                        },
                        error: function (data) {
                            alert("error" + JSON.stringify(data));
                        }
                    });
                });

                validator = loginForm.validate();

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
