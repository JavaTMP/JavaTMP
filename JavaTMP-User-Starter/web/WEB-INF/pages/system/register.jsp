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
        <div id="oneTimeOverlay" style="position: fixed;width: 100%;height: 100%;top: 0px;left: 0;right: 0;bottom: 0;background-color: rgba(255,255,255,1);z-index: 1000000;cursor: wait;">Loading ...</div>
        <div class="container-fluid">
            <div class="row justify-content-center">
                <div class="col-sm-8">
                    <div class="card mt-2">
                        <div class="card-header">
                            Register New User Account
                        </div>
                        <div class="card-body">
                            <form id="main-register-form" method="POST" role="form" action="${pageContext.request.contextPath}/register">
                                <div class="form-row">
                                    <div class="col-lg-3">
                                        <div class="form-group">
                                            <label class="control-label">First Name</label>
                                            <input class="form-control" type="text" placeholder="First Name" name="firstName">
                                        </div>
                                    </div>
                                    <div class="col-lg-3">
                                        <div class="form-group">
                                            <label class="control-label">Last Name</label>
                                            <input class="form-control" type="text" placeholder="Last Name" name="lastName">
                                        </div>
                                    </div>
                                    <div class="col-lg-3">
                                        <div class="form-group">
                                            <label class="control-label">Your date of birth</label>
                                            <input dir="ltr" class="form-control"  type="text" name="birthOfDateStr">
                                        </div>
                                    </div>
                                    <div class="col-lg-3">
                                        <div class="form-group">
                                            <label class="control-label">Email</label>
                                            <input class="form-control" type="text" placeholder="Email" name="email">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="col-lg-3">
                                        <div class="form-group">
                                            <label class="control-label">Country</label>
                                            <select name="countryId" class="form-control">
                                                <c:choose>
                                                    <c:when test="${fn:length(requestScope.countries) > 0}">
                                                        <option value="">Choose ...</option>
                                                        <c:forEach items="${requestScope.countries}" var="country">
                                                            <option ${requestScope.user.countryId == country.countryId ? 'selected="selected"' : ''} value="${country.countryId}">${country.countryName}</option>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <option value="">No Record Found</option>
                                                    </c:otherwise>
                                                </c:choose>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-lg-3">
                                        <div class="form-group">
                                            <label class="control-label">Interface Language</label>
                                            <select name="lang" class="form-control">
                                                <c:choose>
                                                    <c:when test="${fn:length(requestScope.languages) > 0}">
                                                        <option value="">Choose ...</option>
                                                        <c:forEach items="${requestScope.languages}" var="language">
                                                            <option ${requestScope.user.lang == language.languageId ? 'selected="selected"' : ''} value="${language.languageId}">${language.languageName}</option>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <option value="">No Record Found</option>
                                                    </c:otherwise>
                                                </c:choose>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-lg-3">
                                        <div class="form-group">
                                            <label class="control-label">Interface Theme</label>
                                            <select name="theme" class="form-control">
                                                <c:choose>
                                                    <c:when test="${fn:length(requestScope.themes) > 0}">
                                                        <option value="">Choose ...</option>
                                                        <c:forEach items="${requestScope.themes}" var="theme">
                                                            <option ${requestScope.user.theme == theme.themeId ? 'selected="selected"' : ''} value="${theme.themeId}">${theme.themeName}</option>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <option value="">No Record Found</option>
                                                    </c:otherwise>
                                                </c:choose>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-lg-3">
                                        <div class="form-group">
                                            <label class="control-label">Timezone</label>
                                            <select name="timezone" class="form-control">
                                                <option value="">Choose ...</option>
                                                <c:choose>
                                                    <c:when test="${fn:length(requestScope.timezones) > 0}">
                                                        <c:forEach items="${requestScope.timezones}" var="timezone">
                                                            <option value="${timezone.timezoneId}">${timezone.timezoneName}</option>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <option value="">No Record Found</option>
                                                    </c:otherwise>
                                                </c:choose>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="col-lg-4">
                                        <div class="form-group">
                                            <label class="control-label">Username</label>
                                            <input class="form-control" type="text" autocomplete="off" placeholder="Username"
                                                   name="userName">
                                        </div>
                                    </div>
                                    <div class="col-lg-4">
                                        <div class="form-group">
                                            <label class="control-label">Password</label>
                                            <input class="form-control" type="password" autocomplete="off" id="password"
                                                   placeholder="Password" name="password">
                                        </div>
                                    </div>
                                    <div class="col-lg-4">
                                        <div class="form-group">
                                            <label class="control-label">Re-type Your Password</label>
                                            <input class="form-control" type="password" autocomplete="off" placeholder="Re-type Your Password"
                                                   name="rpassword">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <label for="exampleFormControlFile1">Profile Picture</label>
                                            <div class="custom-file">
                                                <input name="profilePicture" type="file" class="custom-file-input" id="validatedCustomFile">
                                                <label class="custom-file-label" for="validatedCustomFile">Choose Profile Picture</label>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <img class="img-fluid" id="profilePictureResizePreview" style="width: 100%;" src="${pageContext.request.contextPath}/assets/img/default-profile-pic.png" alt="Your Profile Image Preview" />
                                        </div>
                                    </div>
                                    <div class="col-md-9">
                                        <div class="form-group">
                                            <label class="control-label">address</label>
                                            <textarea rows="8" class="form-control forceValidate" placeholder="" name="address"></textarea>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="col-lg-12">
                                        <div class="form-group">
                                            <div class="custom-control custom-checkbox">
                                                <input name="tnc" type="checkbox" class="custom-control-input" id="customCheck1">
                                                <label class="custom-control-label" for="customCheck1">
                                                    I agree to the
                                                    <a href="javascript:;">Terms of Service </a> &amp;
                                                    <a href="javascript:;">Privacy Policy </a>
                                                </label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="col-lg-12">
                                        <div class="form-group">
                                            <button type="submit" id="register-submit-btn" class="btn btn-primary">Create New User Account</button>
                                        </div>
                                    </div>
                                </div>

                                <!--                                <button disabled="" type="submit" href="javascript:;" class="btn btn-lg btn-primary btn-block"></button>-->
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
        <script type="text/javascript">
            (function ($) {
                // https://www.sanwebe.com/2016/07/ajax-form-submit-examples-using-jquery
                // https://stackoverflow.com/questions/1960240/jquery-ajax-submit-form
                var loginForm = $('#main-register-form');
                var validator = null;
                var alertError = null;
                loginForm.on("submit", function (event) {
                    event.preventDefault();
                    if (!$(this).valid()) {
                        return;
                    }
                    $('#' + alertError).remove();
                    var httpType = $(this).attr("method");
                    var post_url = $(this).attr("action"); //get form action url
                    //                    var form_data = new FormData(loginForm); //Creates new FormData object
                    var form_data = $(this).serializeArray();
                    $.ajax({
                        type: httpType,
                        url: post_url,
                        //                        processData: false,
                        //                        contentType: false,
                        data: form_data,
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

                validator = loginForm.validate({
                    rules: {
                        username: {
                            required: true
                        },
                        password: {
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
