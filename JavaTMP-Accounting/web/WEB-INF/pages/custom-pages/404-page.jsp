<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>JavaTMP - Bootstrap Components Template 404 Page</title>

        <!-- Bootstrap CSS -->
        <link href="../../components/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>

        <!-- Plugins CSS -->
        <link href="../../components/font-awesome/web-fonts-with-css/css/fontawesome-all.min.css" rel="stylesheet" type="text/css"/>
    </head>
    <body class="page-404">
        <div class="container-fluid">
            <div class="row justify-content-center mt-3 mb-2">
                <div class="col-lg-3">
                    <div class="number text-danger text-center">404</div>
                </div>
            </div>
            <div class="row justify-content-center">
                <div class="col-lg-3">
                    <div class="details text-center">
                        <h3>Oops! You're lost.</h3>
                        <p>
                            We can not find the page you're looking for.
                            <br/>
                            <a href="/JavaTMP-Static-Ajax-Starter/#pages/home.html"> Return home </a> or try the search bar below.
                        </p>
                        <form action="/JavaTMP-Static-Ajax-Starter/#pages/home.html">
                            <div class="input-group">
                                <input type="text" class="form-control" placeholder="keyword...">
                                <span class="input-group-append">
                                    <button type="submit" class="btn btn-danger">
                                        <i class="fa fa-search"></i>
                                    </button>
                                </span>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <style type="text/css">
            .page-404 .number {
                line-height: 128px;
                font-size: 128px;
            }
        </style>
        <script src="../../components/jquery/dist/jquery.min.js" type="text/javascript"></script>
        <script src="../../components/popper.js/dist/umd/popper.min.js" type="text/javascript"></script>
        <script src="../../components/bootstrap/dist/js/bootstrap.min.js" type="text/javascript"></script>
        <script type="text/javascript">
            jQuery(document).ready(function () {
                (function ($) {


                }(jQuery));
            });
        </script>
    </body>
</html>
