<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en" class="">
    <head>
        <title>JavaTMP Landing Empty Starter Page</title>
        <meta name="description" content="Bootstrap Template by javatmp.com">
        <meta name="keywords" content="Bootstrap admin and dashboard template built using HTML 5 , CSS 3 , jQuery , Bootstrap 4 and Java">

        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link href="${pageContext.request.contextPath}/assets/dist/css/javatmp-plugins-all.min.css" rel="stylesheet" type="text/css"/>
        <link href="${pageContext.request.contextPath}/assets/dist/css/javatmp-plugins-print-all.min.css" rel='stylesheet' media='print' />
        <link id="themeStyleSheet" href="${pageContext.request.contextPath}/assets/dist/css/javatmp-schooly.min.css" rel="stylesheet" type="text/css"/>
        <link href="${pageContext.request.contextPath}/assets/dist/css/font-family-en.min.css" rel="stylesheet" type="text/css"/>
    </head>
    <body class="">
        <div id="oneTimeOverlay" style="position: fixed;width: 100%;height: 100%;top: 0px;left: 0;right: 0;bottom: 0;background-color: rgba(255,255,255,1);z-index: 1000000;cursor: wait;">Loading ...</div>
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="jumbotron mt-5 bg-white">
                        <h1 class="display-3">Hello,</h1>
                        <h1 class="display-4">Welcome To JavaTMP Bootstrap Starter Template Page</h1>
                        <p class="lead my-5">
                            A starter JavaTMP bootstrap template page with a huge collection of plugins and UI components
                            and works seamlessly on all major web browsers, tablets and phones.
                            It's a great boilerplate for starting a new Bootstrap project with curated set
                            of tested front-end resources which combined to simplify your development.
                        </p>

                        <a class="btn btn-primary btn-lg" href="http://www.javatmp.com" role="button">Home</a>
                        <a class="btn btn-primary btn-lg" href="http://help.javatmp.com/" role="button">Documentation</a>
                    </div>
                    <div class="text-center">
                        <a href="http://www.javatmp.com" target="_blank"><span>All Rights Reserved &copy; 2020 javatmp.com</span></a>
                    </div>
                </div>
            </div>
        </div>
        <style type="text/css">

        </style>
        <script src="${pageContext.request.contextPath}/assets/dist/js/javatmp-plugins-all.min.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/assets/dist/js/javatmp-plugins-all-locale-en.min.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/assets/dist/js/javatmp.min.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/assets/app/js/javatmp.plugins.wrapper.js" type="text/javascript"></script>
        <script type="text/javascript">
            jQuery(function ($) {
                var defaults = {};
//                index.init(defaults);
                javatmp.plugins.init(defaults);
            });
        </script>
        <!-- You could put here Your google analytics script tag -->
        <!-- build:remove -->
        <script>
            (function (i, s, o, g, r, a, m) {
                i['GoogleAnalyticsObject'] = r;
                i[r] = i[r] || function () {
                    (i[r].q = i[r].q || []).push(arguments);
                }, i[r].l = 1 * new Date();
                a = s.createElement(o),
                        m = s.getElementsByTagName(o)[0];
                a.async = 1;
                a.src = g;
                m.parentNode.insertBefore(a, m);
            })(window, document, 'script', 'https://www.google-analytics.com/analytics.js', 'ga');

            ga('create', 'UA-104738122-1', 'auto');
        </script>
        <script type="text/javascript">
            jQuery(function ($) {
                $(document).ajaxComplete(function (event, xhr, ajaxOptions) {
                    if (ajaxOptions.url.indexOf("assets/data") === -1) {
                        var ajaxurl = window.location.pathname + "#" + ajaxOptions.url;
                        ga('send', 'pageview', ajaxurl);
                    }
                });
            });
        </script>
        <!-- /build -->
        <script type="text/javascript">
            jQuery(function ($) {
                $("#oneTimeOverlay").remove();
            });
        </script>
    </body>
</html>
