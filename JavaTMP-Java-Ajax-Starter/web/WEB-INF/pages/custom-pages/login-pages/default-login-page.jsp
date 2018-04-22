<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>JavaTMP - Bootstrap Components Template Default Login Page</title>

        <link href="${pageContext.request.contextPath}/assets/dist/css/javatmp-plugins-all.min.css" rel="stylesheet" type="text/css"/>
        <link href='${pageContext.request.contextPath}/assets/dist/css/javatmp-plugins-print-all.min.css' rel='stylesheet' media='print' />
        <link id="themeStyleSheet" href="${pageContext.request.contextPath}/assets/dist/css/javatmp-default.min.css" rel="stylesheet" type="text/css"/>
    </head>
    <body class="login">
        <div id="oneTimeOverlay" style="position: fixed;width: 100%;height: 100%;top: 0px;left: 0;right: 0;bottom: 0;background-color: rgba(255,255,255,0);z-index: 1000000;cursor: wait;"></div>
        <div class="container-fluid">
            <div class="row justify-content-center">
                <div class="col-xl-3 col-lg-3 col-md-6">
                    <div class="card my-3">
                        <div class="card-header">
                            Please Sign In
                        </div>
                        <div class="card-body">
                            <div class="custom-alerts alert alert-info alert-dismissible fade show" role="alert">
                                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                                <p>A fake user has been created with username [${requestScope.fakeUser.userName}] and password [${requestScope.fakeUser.userName}].</p>
                            </div>
                            <form id="main-login-form" method="POST" role="form" action="${pageContext.request.contextPath}/login">
                                <div class="form-group">
                                    <input class="form-control required" placeholder="Username" name="userName" type="text" autofocus value="${requestScope.fakeUser.userName}">
                                </div>
                                <div class="form-group">
                                    <input class="form-control required" placeholder="Password" name="password" type="password" value="${requestScope.fakeUser.userName}">
                                </div>
                                <button disabled="" type="submit" href="javascript:;" class="btn btn-lg btn-primary btn-block">Login</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <style type="text/css">

        </style>
        <script src="${pageContext.request.contextPath}/assets/dist/js/javatmp-plugins-all.min.js" type="text/javascript"></script>
        <script type="text/javascript">
            (function ($) {
                // https://www.sanwebe.com/2016/07/ajax-form-submit-examples-using-jquery
                // https://stackoverflow.com/questions/1960240/jquery-ajax-submit-form
                var loginForm = $('#main-login-form');
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
