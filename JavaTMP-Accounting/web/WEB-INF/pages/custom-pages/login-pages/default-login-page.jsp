<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>JavaTMP - Bootstrap Components Template Default Login Page</title>

        <!-- Bootstrap CSS -->
        <link href="../../../components/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>

        <!-- Plugins CSS -->
        <link href="../../components/font-awesome/web-fonts-with-css/css/fontawesome-all.min.css" rel="stylesheet" type="text/css"/>
    </head>
    <body class="login">
        <div class="container-fluid">
            <div class="row justify-content-center">
                <div class="col-md-4">
                    <div class="card my-3">
                        <div class="card-header">
                            Please Sign In
                        </div>
                        <div class="card-body">
                            <form role="form" action="/JavaTMP-Static-Ajax-Starter/#pages/home.html">
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
        <script src="../../../components/jquery/dist/jquery.min.js" type="text/javascript"></script>
        <script src="../../../components/popper.js/dist/umd/popper.min.js" type="text/javascript"></script>
        <script src="../../../components/bootstrap/dist/js/bootstrap.min.js" type="text/javascript"></script>
        <script type="text/javascript">
            jQuery(document).ready(function () {
                (function ($) {

                }(jQuery));
            });
        </script>
    </body>
</html>
