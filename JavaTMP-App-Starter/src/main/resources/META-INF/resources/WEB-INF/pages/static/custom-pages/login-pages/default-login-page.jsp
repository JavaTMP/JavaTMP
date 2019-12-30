<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>JavaTMP - Bootstrap Components Template Default Login Page</title>

        <link href="${pageContext.request.contextPath}/assets/dist/css/javatmp-plugins-all.min.css" rel="stylesheet" type="text/css"/>
        <link href="${pageContext.request.contextPath}/assets/dist/css/javatmp-plugins-print-all.min.css" rel='stylesheet' media='print' />
        <link id="themeStyleSheet" href="${pageContext.request.contextPath}/assets/dist/css/javatmp-schooly.min.css" rel="stylesheet" type="text/css"/>
        <link href="${pageContext.request.contextPath}/assets/dist/css/font-family-en.min.css" rel="stylesheet" type="text/css"/>
    </head>
    <body class="login">
        <div class="container-fluid">
            <div class="row justify-content-center">
                <div class="col-md-3">
                    <div class="card my-3">
                        <div class="card-header">
                            Please Sign In
                        </div>
                        <div class="card-body">
                            <form role="form" action="/JavaTMP-Static-Ajax/#pages/home.html">
                                <div class="form-group">
                                    <input class="form-control" placeholder="E-mail" name="email" type="email" autofocus>
                                </div>
                                <div class="form-group">
                                    <input class="form-control" placeholder="Password" name="password" type="password" value="">
                                </div>
                                <div class="checkbox">
                                    <label>
                                        <input name="remember" type="checkbox" value="Remember Me">Remember Me
                                    </label>
                                </div>
                                <button type="submit" href="javascript:;" class="btn btn-lg btn-primary btn-block">Login</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <style type="text/css">

        </style>
        <script src="${pageContext.request.contextPath}/assets/dist/js/javatmp-plugins-all.min.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/assets/dist/js/javatmp.min.js" type="text/javascript"></script>
        <script type="text/javascript">
            jQuery(document).ready(function () {
                (function ($) {

                }(jQuery));
            });
        </script>
    </body>
</html>
