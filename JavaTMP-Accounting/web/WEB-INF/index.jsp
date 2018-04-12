<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="${labels["global.language"]}" dir="${labels["global.direction"]}">
    <head>
        <title>JavaTMP - Java Bootstrap Admin and Dashboard Template</title>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link href="${pageContext.request.contextPath}/assets/dist/css/javatmp-plugins-all.min.css" rel="stylesheet" type="text/css"/>
        <link href='${pageContext.request.contextPath}/assets/dist/css/javatmp-plugins-print-all.min.css' rel='stylesheet' media='print' />
        <link id="themeStyleSheet" href="${pageContext.request.contextPath}/assets/dist/css/javatmp-default.min.css" rel="stylesheet" type="text/css"/>
    </head>
    <body class="sidebar-active">
        <nav class="main-javatmp-navbar navbar fixed-top my-0 py-0">
            <a class="navbar-brand mr-auto py-0 d-none d-md-inline" href="${pageContext.request.contextPath}">
                JavaTMP
                <span class="d-none d-xl-inline"> Accounting System</span>
            </a>
            <ul class="main-navbar-menu nav ml-auto">
                <li class="nav-item py-0 dropdown">
                    <a class="nav-link user-profile-menu-item dropdown-toggle" data-toggle="dropdown" href="#">
                        <img class="user-profile-pic rounded-circle"
                             src="${pageContext.request.contextPath}/assets/img/avatar/profile_pic_min.png" alt=""/>
                        <span class="user-profile-menu-item-info d-none d-md-inline-block">
                            <small>Welcome,</small>
                            Admin John smith
                        </span>
                    </a>
                    <ul class="dropdown-menu dropdown-menu-right">
                        <li>
                            <a class="dropdown-item" href="#"><i class="far fa-lg fa-fw fa-user"></i>User Profile</a>
                        </li>
                        <li class="dropdown-divider"></li>
                        <li>
                            <a class="dropdown-item" href="#"><i class="fa fa-lg fa-fw fa-square"></i>Lock Screen</a>
                        </li>
                        <li>
                            <a class="dropdown-item" href="${pageContext.request.contextPath}/logout">
                                <i class="fa fa-lg fa-fw fa-sign-out-alt"></i>
                                Logout
                            </a>
                        </li>
                    </ul>
                </li>
            </ul>
            <button class="navbar-toggler sidebar-toggler-button my-1 ml-1" type="button">
                <span class="navbar-toggler-icon"></span>
            </button>
        </nav>
        <div class="container-fluid">
            <div class="row">
                <div class="col-12 m-0 p-0">
                    <div class="sidebar scroll-content">
                        <div class="sidebar-shortcut-button text-center m-1">
                            <button class="btn btn-primary"
                                    actionType="action-ref-href"
                                    action-ref-by-href="${pageContext.request.contextPath}/pages/home"
                                    data-toggle="tooltip" data-placement="auto"
                                    title="JavaTMP Home Page">
                                <i class="fa fa-home fa-fw"></i>
                            </button>
                            <button class="btn btn-primary"
                                    actionType="action-ref-href"
                                    action-ref-by-href="${pageContext.request.contextPath}/pages/home"
                                    data-toggle="tooltip" data-placement="auto"
                                    title="JavaTMP Home Page">
                                <i class="fa fa-home fa-fw"></i>
                            </button>
                            <button class="btn btn-primary"
                                    actionType="action-ref-href"
                                    action-ref-by-href="${pageContext.request.contextPath}/pages/home"
                                    data-toggle="tooltip" data-placement="auto"
                                    title="JavaTMP Home Page">
                                <i class="fa fa-home fa-fw"></i>
                            </button>
                            <button class="btn btn-primary"
                                    actionType="action-ref-href"
                                    action-ref-by-href="${pageContext.request.contextPath}/pages/home"
                                    data-toggle="tooltip" data-placement="auto"
                                    title="JavaTMP Home Page">
                                <i class="fa fa-home fa-fw"></i>
                            </button>
                            <button class="btn btn-primary"
                                    actionType="action-ref-href"
                                    action-ref-by-href="${pageContext.request.contextPath}/pages/home"
                                    data-toggle="tooltip" data-placement="auto"
                                    title="JavaTMP Home Page">
                                <i class="fa fa-home fa-fw"></i>
                            </button>
                            <button class="btn btn-primary"
                                    actionType="action-ref-href"
                                    action-ref-by-href="${pageContext.request.contextPath}/pages/home"
                                    data-toggle="tooltip" data-placement="auto"
                                    title="JavaTMP Home Page">
                                <i class="fa fa-home fa-fw"></i>
                            </button>
                        </div>
                        <div class="sidebar-menu-filter-form mx-2 my-1">
                            <form autocomplete="off" class="search-menu-form">
                                <div class="has-feedback-icon has-clear">
                                    <input id="filter-menu-id" type="text" class="form-control" placeholder="Search menu ..." autocomplete="off"/>
                                    <span class="form-control-clear fa fa-times d-none"></span>
                                </div>
                            </form>
                        </div>
                        <ul class="metismenu">
                            <li>
                                <a href="${pageContext.request.contextPath}/pages/home">
                                    <i class="fa fa-lg fa-fw fa-home"></i>
                                    Home
                                </a>
                            </li>
                            <li>
                                <a class="has-arrow" href="#">
                                    <i class="far fa-lg fa-fw fa-object-group"></i>
                                    Accounting
                                </a>
                                <ul>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/pages/accounting/chart-of-accounts">
                                            <i class="fa fa-lg fa-fw fa-sitemap"></i>
                                            Chart Of Accounts
                                        </a>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/pages/accounting/general-ledger">
                                            <i class="fa fa-lg fa-fw fa-book"></i>
                                            General Ledger
                                        </a>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/pages/accounting/transaction">
                                            <i class="far fa-lg fa-fw fa-edit"></i>
                                            Create Transaction
                                        </a>
                                    </li>
                                </ul>
                            </li>
                            <li>
                                <a class="has-arrow" href="#">
                                    <i class="far fa-lg fa-fw fa-chart-bar"></i>
                                    Reports
                                </a>
                                <ul>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/pages/reports/profit-loss-income">
                                            <i class="far fa-lg fa-fw fa-chart-bar"></i>
                                            Trail Balance
                                        </a>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/pages/reports/trial-balance">
                                            <i class="far fa-lg fa-fw fa-chart-bar"></i>
                                            Income Statement
                                        </a>
                                    </li>
                                </ul>
                            </li>
                            <li>
                                <a class="has-arrow" href="#">
                                    <i class="fa fa-lg fa-fw fa-cog"></i>
                                    System
                                </a>
                                <ul>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/pages/system/user-profile">
                                            <i class="far fa-lg fa-fw fa-user"></i>
                                            User Profile
                                        </a>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/pages/system/activities-notifications">
                                            <i class="fa fa-lg fa-fw fa-cog"></i>
                                            Activities And Notifications
                                        </a>
                                    </li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                    <div class="main-content">
                        <div class="main-breadcrumb-bar d-flex flex-row">
                            <ol class="breadcrumb"></ol>
                            <div class="breadcrumb-submenu">
                                <a class="float-right min-tools-button">
                                    <i class="fa fa-sync-alt  faa-spin animated-hover text-primary"></i>
                                </a>
                            </div>
                        </div>
                        <div class="main-body-content-container"></div>
                    </div>
                </div>
            </div>
        </div>
        <div class="main-footer-bar">
            <div class="footer-content">
                <a href="http://www.javatmp.com" target="_blank"><span>&copy; 2018 javatmp.com</span></a>
            </div>
        </div>
        <script src="${pageContext.request.contextPath}/assets/dist/js/javatmp-plugins-all.min.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/assets/dist/js/javatmp.min.js" type="text/javascript"></script>
        <!-- custom style for sidebar menu search text field -->
        <style type="text/css">
            .has-feedback-icon {
                position: relative;
            }
            .search-menu-form .fa.form-control-clear {
                pointer-events: initial;  /* or - auto // or -  unset  */
                line-height: 1.5;
                padding: .375rem .75rem;
                font-size: 1rem;
                z-index: 10;
                pointer-events: auto;
                cursor: pointer;
                position: absolute;
                right: 0;
                top: 0;
            }
            ::-ms-clear {
                display: none;
            }

            /* Extra large devices (large desktops, 1200px and up) */
            @media (min-width: 1200px){
                .modal-lg {
                    max-width: 1024px;
                }
            }
            @media (min-width: 1400px){
                .modal-lg {
                    max-width: 1200px;
                }
            }
        </style>
        <script type="text/javascript">
            jQuery(function ($) {
                $("body").on("click", '.disabled', function (event) {
                    event.stopPropagation();
                    event.preventDefault();
                    return false;
                });

                $("body").on("click", ".dropdown-menu-header,.dropdown-menu-footer", function (event) {
                    event.stopPropagation();
                });

                // tooltip demo
                $('.sidebar').tooltip({
                    selector: "[data-toggle=tooltip]",
                    container: ".sidebar"
                });

                $.scrollUp({zIndex: 1000, scrollText: '<i class="fa fa-arrow-up"></i>'});

                $('#filter-menu-id').on('input propertychange', function () {
                    var $this = $(this);
                    var visible = Boolean($this.val());
                    $this.siblings('.form-control-clear').toggleClass('d-none', !visible);
                }).trigger('propertychange').trigger('keyup');
                $('.form-control-clear').click(function () {
                    $(this).siblings('input[type="text"]').val('')
                            .trigger('propertychange').trigger('keyup').focus();
                });

                $('#filter-menu-id').keyup(function () {
                    var text = $(this).val().toLowerCase();
                    $('.metismenu li').each(function () {
                        if ($(this).text().toLowerCase().indexOf(text) === -1) {
                            $(this).hide();
                            $(this).children().removeClass("active");
                            $(this).children().removeClass("in");
                        } else {
                            $(this).show();
                            $(this).children("ul").css({height: "auto"});
                            $(this).parentsUntil(".metismenu", "li").addClass("active");
                            $(this).parentsUntil(".metismenu", "ul").addClass("in");
                        }
                    });
                });
            });
        </script>
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
                    if (ajaxOptions.url.indexOf("${pageContext.request.contextPath}/assets/data") === -1) {
                        var ajaxurl = window.location.pathname + "#" + ajaxOptions.url;
                        ga('send', 'pageview', ajaxurl);
                    }
                });
            });
        </script>
        <!-- /build -->
        <script type="text/javascript">
            jQuery(function ($) {
                javatmp.init({
                    httpMethod: "GET",
                    dataType: "html",
                    updateURLHash: true,
                    defaultPassData: {_ajax: "ajax", _ajaxGlobalBlockUI: true},
                    defaultOutputSelector: '.main-body-content-container',
                    defaultUrl: '${pageContext.request.contextPath}/pages/home'
                });
            });
        </script>
    </body>
</html>

























