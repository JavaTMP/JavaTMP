<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>JavaTMP - Bootstrap Components Template 404 Page</title>
        <link href="${pageContext.request.contextPath}/assets/dist/css/javatmp-plugins-all.min.css" rel="stylesheet" type="text/css"/>
        <link href="${pageContext.request.contextPath}/assets/dist/css/javatmp-plugins-print-all.min.css" rel='stylesheet' media='print' />
        <link id="themeStyleSheet" href="${pageContext.request.contextPath}/assets/dist/css/javatmp-default.min.css" rel="stylesheet" type="text/css"/>
        <link href="${pageContext.request.contextPath}/assets/dist/css/font-family-en.min.css" rel="stylesheet" type="text/css"/>
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
                            <a href="${pageContext.request.contextPath}/"> Return home </a> or try the search bar below.
                        </p>
                        <form action="${pageContext.request.contextPath}/">
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
