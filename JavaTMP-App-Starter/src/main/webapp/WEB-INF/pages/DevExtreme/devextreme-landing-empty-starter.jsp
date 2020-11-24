<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en" class="">
    <head>
        <title>DevExtreme Landing Empty Starter Demo Page</title>
        <meta name="description" content="Bootstrap Template by javatmp.com">
        <meta name="keywords" content="Bootstrap admin and dashboard template built using HTML 5 , CSS 3 , jQuery , Bootstrap 4 and Java">

        <!-- DevExtreme themes -->
        <link rel="stylesheet" href="https://cdn3.devexpress.com/jslib/20.1.7/css/dx.common.css">
        <link rel="stylesheet" href="https://cdn3.devexpress.com/jslib/20.1.7/css/dx.light.css">

        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link href="${pageContext.request.contextPath}/assets/dist/css/javatmp-plugins-all.min.css" rel="stylesheet" type="text/css"/>
        <link href="${pageContext.request.contextPath}/assets/dist/css/javatmp-plugins-print-all.min.css" rel='stylesheet' media='print' />
        <link id="themeStyleSheet" href="${pageContext.request.contextPath}/assets/dist/css/javatmp-schooly.min.css" rel="stylesheet" type="text/css"/>
        <link href="${pageContext.request.contextPath}/assets/dist/css/font-family-en.min.css" rel="stylesheet" type="text/css"/>
    </head>
    <body class="dx-viewport">
        <div id="oneTimeOverlay" style="position: fixed;width: 100%;height: 100%;top: 0px;left: 0;right: 0;bottom: 0;background-color: rgba(255,255,255,1);z-index: 1000000;cursor: wait;">Loading ...</div>
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="jumbotron mt-5">
                        <h1 class="display-3">Hello,</h1>
                        <h1 class="display-4">Welcome To DevExtreme Landing Empty Starter Demo Page</h1>
                        <button id="buttonContainer"></button>
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

        <!-- DevExtreme library -->
        <script type="text/javascript" src="https://cdn3.devexpress.com/jslib/20.1.7/js/dx.all.js"></script>
        <!-- <script type="text/javascript" src="https://cdn3.devexpress.com/jslib/20.1.7/js/dx.web.js"></script> -->
        <!-- <script type="text/javascript" src="https://cdn3.devexpress.com/jslib/20.1.7/js/dx.viz.js"></script> -->
        <!-- <script type="text/javascript" src="https://cdn3.devexpress.com/jslib/20.1.7/js/dx.viz-web.js"></script> -->

        <script type="text/javascript">
            jQuery(function ($) {
                var defaults = {};
//                index.init(defaults);
                javatmp.plugins.init(defaults);

                var popupOptions = {
                    width: 660,
                    height: 540,
                    dragEnabled:true,
                    resizeEnabled:true,
                    onContentReady: function () {
                        // alert("onContentReady");
                    },
                    contentTemplate: function() {
                        var result = "<b>Welcome</b>";
                        return result;
                    },
                    showTitle: true,
                    visible: false,
                    dragEnabled: false,
                    closeOnOutsideClick: true
                };

                $("#buttonContainer").dxButton({
                    text: "Click me!",
                    onClick: function () {
                        $(".popup-property-details").remove();
                        var container = $("<div />")
                            .addClass("popup-property-details")
                            .appendTo($("body"));
                        var popup = container.dxPopup(popupOptions).dxPopup("instance");
                        popup.option("title", "hello World");
                        popup.show();
                    }
                });

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
