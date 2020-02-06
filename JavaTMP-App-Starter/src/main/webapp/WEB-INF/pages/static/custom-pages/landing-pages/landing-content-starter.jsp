<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en" dir="ltr" class="">
    <head>
        <title>JavaTMP Landing Empty Starter Page</title>
        <meta name="description" content="Bootstrap Template by javatmp.com">
        <meta name="keywords" content="Bootstrap admin and dashboard template built using HTML 5 , CSS 3 , jQuery , Bootstrap 4 and Java">

        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link href="${pageContext.request.contextPath}/assets/dist/css/javatmp-plugins-all.min.css" rel="stylesheet" type="text/css"/>
        <link href='${pageContext.request.contextPath}/assets/dist/css/javatmp-plugins-print-all.min.css' rel='stylesheet' media='print' />
        <link id="themeStyleSheet" href="${pageContext.request.contextPath}/assets/dist/css/javatmp-schooly.min.css" rel="stylesheet" type="text/css"/>
        <link href="${pageContext.request.contextPath}/assets/dist/css/font-family.min.css" rel="stylesheet" type="text/css"/>
    </head>
    <body data-spy="scroll" data-target="#sidemenu" data-offset="30">
        <div id="oneTimeOverlay" style="position: fixed;width: 100%;height: 100%;top: 0px;left: 0;right: 0;bottom: 0;background-color: rgba(255,255,255,1);z-index: 1000000;cursor: wait;">Loading ...</div>
        <div class="jumbotron mb-0 d-flex align-items-center flex-column justify-content-center text-center min-100" id="header">
            <h1 class="display-3">Welcome To JavaTMP Bootstrap Template</h1>
            <p>Bootstrap admin and dashboard template built using HTML 5 , CSS 3 , jQuery , Bootstrap 4 and Java</p>
            <p class="lead">
                <a class="btn btn-primary btn-lg" href="http://www.javatmp.com" role="button">Home Page</a>
                <a class="btn btn-primary btn-lg" href="#mainNavbar" role="button">Check Out</a>
            </p>
        </div>
        <nav class="navbar navbar-dark bg-primary navbar-expand-md sticky-top" id="mainNavbar">
            <div class="container">
                <a class="navbar-brand" href="#">JavaTMP</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="navbar-collapse collapse" id="navbarNav">
                    <ul class="navbar-nav">
                        <li class="nav-item"><a href="#" class="nav-link">Link</a></li>
                        <li class="nav-item"><a href="#" class="nav-link">Link</a></li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="javascript:;" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                dropdown
                            </a>
                            <div class="dropdown-menu w-auto shadow mt-2 mx-lg-2 p-0 mx-0" aria-labelledby="navbarDropdown">
                                <a class="dropdown-item d-flex flex-nowrap align-items-center px-0 py-3" href="#">
                                    <div class="flex-shrink-1 text-center px-3">
                                        <i class="far fa-user-circle fa-fw fa-2x"></i>
                                    </div>
                                    <div class="pl-0 pr-4">
                                        <h5 class="mb-0">Settings</h5>
                                        Changes options and profile
                                    </div>
                                </a>
                                <a class="dropdown-item d-flex flex-nowrap align-items-center px-0 py-3" href="#">
                                    <div class="flex-shrink-1 text-center px-3"><i class="far fa-dot-circle fa-fw fa-2x"></i></div>
                                    <div class="pl-0 pr-4">
                                        <h5 class="mb-0">Favorites</h5>
                                        View your saved items
                                    </div>
                                </a>
                                <a class="dropdown-item d-flex flex-nowrap align-items-center px-0 py-3" href="#">
                                    <div class="flex-shrink-1 text-center px-3">
                                        <i class="far fa-arrow-alt-circle-right fa-fw fa-2x"></i>
                                    </div>
                                    <div class="pl-0 pr-4">
                                        <h5 class="mb-0">Heading</h5>
                                        Some other item can go here
                                    </div>
                                </a>
                            </div>
                        </li>
                    </ul>
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item">
                            <a href="#Documentation" class="nav-link" class="btn btn-primary" role="button">Documentation</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
        <div class="container mt-4" id="content">
            <div class="row h-100 my-5">
                <aside class="col-md-3 mt-5">
                    <div class="alert alert-primary">This template contains sample placeholder content.</div>
                    <div class="my-3 sticky-top" id="sidemenu">
                        <div class="pt-5">
                            <ul class="nav nav-pills flex-md-column flex-row justify-content-between bg-light">
                                <li class="nav-item"><a href="#sec0" class="nav-link active">Main</a></li>
                                <li class="nav-item"><a href="#sec1" class="nav-link">Consistent</a></li>
                                <li class="nav-item"><a href="#sec2" class="nav-link">Responsive</a></li>
                                <li class="nav-item">
                                    <a href="#sec3" class="nav-link">Compatible</a>
                                    <ul class="nav flex-md-column small d-none d-md-flex pl-3">
                                        <li class="nav-item"><a href="#sec3a" class="nav-link">Element Styles</a></li>
                                        <li class="nav-item"><a href="#sec3b" class="nav-link">The Grid</a></li>
                                    </ul>
                                </li>
                                <li class="nav-item"><a href="#sec4" class="nav-link">Customization</a></li>
                                <li class="nav-item"><a href="#sec5" class="nav-link">Themes</a></li>
                                <li class="nav-item"><a href="#sec6" class="nav-link">JavaScript</a></li>
                            </ul>
                        </div>
                    </div>
                </aside>
                <main class="col">
                    <div class="row">
                        <div class="col">
                            <span class="anchor" id="sec0"></span>
                            <h1>Main Heading</h1>
                            <p class="lead mb-3">Beautiful content starts here.</p>

                            <span class="anchor" id="sec1"></span>
                            <h4>Consistent</h4>

                            <p>Foremost, Bootstrap provides a consistent, uniform appearance and design. With very little effort, Bootstrap
                                can be used to transform a hodge-podge site into a professional, visually appealing design.</p>

                            <span class="anchor" id="sec2"></span>
                            <h4>Responsive</h4>

                            <p>Sites created with Bootstrap are designed to look & function well on any device including desktops, laptops, tablets and smartphones. Bootstrap is "mobile-first" which means the design for smaller mobile devices is considered foremost.</p>

                            <hr>

                            <span class="anchor" id="sec3"></span>
                            <h4>Compatible</h4>
                            <p>Bootstrap is a mature, tested code-base that is entirely based on standards and cross-browser compliance. Sites that properly utilize what
                                Bootstrap offers will also benefit from this compatibility. The CSS is the most essential part of Bootstrap. The Bootstrap CSS can be used alone, without the Bootstrap JavaScript components. Generally speaking, Bootstrapâs CSS provides two thingsâ¦</p>

                            <div class="pl-4">
                                <span class="anchor" id="sec3a"></span>
                                <h6>Element Styles</h6>
                                <p>
                                    These are built-in styles for HTML elements such as Buttons, fonts, colors, badges, typography, progress bars, alerts, etcâ¦ Using any of these Bootstrap Components is very easy. Itâs just a matter of referencing the appropriate Bootstrap CSS class in the HTML markup.
                                </p>
                                <br>

                                <span class="anchor" id="sec3b"></span>
                                <h6>The Bootstrap Grid</h6>
                                <p>Layout helpers using ârowsâ and âcolumnsâ. The Bootstrap Grid System is used for layout, specifically Responsive Layouts. Understanding how it works is vital to understanding Bootstrap. The Grid is made up of groupings of Rows & Columns inside 1 or more Containers.</p>
                            </div>

                            <hr>

                            <span class="anchor" id="sec4"></span>
                            <h4>Customization</h4>
                            <p>You may want to customize Bootstrap for several reasons. You may want to change some aspect of the look or styles such as colors, fonts, or borders. You may want to change some aspect of the responsive layout like grid breakpoints or gutter widths. Additionally, you may want to extend Bootstrap classes with new custom classes (ie; btn-custom).</p>

                            <span class="anchor" id="sec5"></span>
                            <h4>Creating Themes</h4>
                            <p>Of course customization is important since not everyone wants that overly recognizable Bootstrap look. Using the methods (CSS or SASS) described itâs fairly easy to transform your Bootstrap 4 sites with a unique look. Once you understand the basic of customization you're on the way to creating custom Bootstrap themes.</p>

                            <span class="anchor" id="sec6"></span>
                            <h4>JavaScript</h4>
                            <p>The Bootstrap documentation, has a very large âComponentsâ section that includes most of the stylized CSS Components that I explained before. However, thereâs overlap between the Bootstrap CSS and JavaScript Components. CSS is used to style Components, while JavaScript is used to make Components functional.

                                Some Bootstrap Components only provide CSS-driven formatting and style so they donât utilize JavaScript. These CSS-only Components were explored earlier in the Bootstrap CSS section: Badges, Breadcrumbs, Buttons, Cards, Form inputs, Jumbotron, Pagination.</p>
                        </div>
                        <div class="col-lg-4 col-12">
                            <div class="card mb-3">
                                <div class="card-body">
                                    <h5 class="card-title">Card title</h5>
                                    <h6 class="mb-2 text-muted">Card subtitle</h6>
                                    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the
                                        card's content.</p>
                                    <a href="#" class="card-link">Card link</a>
                                    <a href="#" class="card-link">Another link</a>
                                </div>
                            </div>
                            <div class="card mb-3">
                                <div class="card-body">
                                    <h5 class="card-title">Card title</h5>
                                    <h6 class="mb-2 text-muted">Card subtitle</h6>
                                    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the
                                        card's content.</p>
                                    <a href="#" class="card-link">Card link</a>
                                    <a href="#" class="card-link">Another link</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </main>
            </div>
        </div>
        <section class="mb-0 mt-0">
            <footer class="text-light">
                <div class="   bg-dark pt-5 pb-5">
                    <div class="container">
                        <div class="row">
                            <div class="col-xs-6 col-sm-3">
                                <a href="javascript:;">
                                    <svg class="d-block mb-4" width="36" height="36" viewBox="0 0 612 612" xmlns="http://www.w3.org/2000/svg" focusable="false">
                                    <path fill="currentColor" d="M510 8a94.3 94.3 0 0 1 94 94v408a94.3 94.3 0 0 1-94 94H102a94.3 94.3 0 0 1-94-94V102a94.3 94.3 0 0 1 94-94h408m0-8H102C45.9 0 0 45.9 0 102v408c0 56.1 45.9 102 102 102h408c56.1 0 102-45.9 102-102V102C612 45.9 566.1 0 510 0z"></path>
                                    <path fill="currentColor" d="M196.77 471.5V154.43h124.15c54.27 0 91 31.64 91 79.1 0 33-24.17 63.72-54.71 69.21v1.76c43.07 5.49 70.75 35.82 70.75 78 0 55.81-40 89-107.45 89zm39.55-180.4h63.28c46.8 0 72.29-18.68 72.29-53 0-31.42-21.53-48.78-60-48.78h-75.57zm78.22 145.46c47.68 0 72.73-19.34 72.73-56s-25.93-55.37-76.46-55.37h-74.49v111.4z"></path>
                                    </svg>
                                </a>
                                <address class="color-light-20">
                                    1600 Amphitheatre Parkway
                                    <br> Mountain View, CA 94043
                                </address>
                                <ul class="list-unstyled list-light">
                                    <li>
                                        <a href="javascript:;">Disclaimer</a>
                                    </li>
                                </ul>
                            </div>
                            <div class="col-xs-6 col-sm-3">
                                <h4 class="my-2">Product</h4>
                                <ul class="list-unstyled list-light">
                                    <li>
                                        <a href="javascript:;">Pricing</a>
                                    </li>
                                    <li>
                                        <a href="javascript:;">Features</a>
                                    </li>
                                    <li>
                                        <a href="javascript:;">Customers</a>
                                    </li>
                                    <li>
                                        <a href="javascript:;">Store</a>
                                    </li>
                                </ul>
                            </div>
                            <br style="clear:both" class="hidden-sm-up">
                            <div class="col-xs-6 col-sm-3">
                                <h4 class="my-2">Company</h4>
                                <ul class="list-unstyled list-light">
                                    <li>
                                        <a href="javascript:;">About Us</a>
                                    </li>
                                    <li>
                                        <a href="javascript:;">Blog</a>
                                    </li>
                                    <li>
                                        <a href="javascript:;">Careers</a>
                                    </li>
                                    <li>
                                        <a href="javascript:;">Press</a>
                                    </li>
                                    <li>
                                        <a href="javascript:;">Events</a>
                                    </li>
                                    <li>
                                        <a href="javascript:;">Contact</a>
                                    </li>
                                </ul>
                            </div>
                            <div class="col-xs-6 col-sm-3">
                                <h4 class="my-2">Connect</h4>
                                <ul class="list-unstyled list-light">
                                    <li>
                                        <a href="javascript:;">Support</a>
                                    </li>
                                    <li>
                                        <a href="javascript:;">Social</a>
                                    </li>
                                    <li>
                                        <a href="javascript:;">Community</a>
                                    </li>
                                </ul>
                                <p class="color-light mt-2">Stay up-to-date!</p>
                                <form>
                                    <div class="form-group">
                                        <div class="input-group mb-3">
                                            <input type="text" class="form-control form-control-sm" placeholder="Email" aria-label="Email" aria-describedby="basic-addon2">
                                            <div class="input-group-append">
                                                <button class="btn btn-primary btn-sm" type="button">Ok</button>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                        <hr>
                        <div class="row f-flex justify-content-between" style="justify-content: space-between;">
                            <div class="col-md-8 text-xs-center  text-left text-secondary my-1">
                                <p class="mt-2  text-light"> © Copyright 2017 • All Rights Reserved |
                                    <a class=" " href="javascript:;">Disclaimer</a> |
                                    <a class=" " href="javascript:;">Contact</a>
                                </p>
                            </div>
                            <div class="col-md-4 text-xs-center   text-lg-right text-secondary my-1">
                                <div class="btn-container  mt-1 text-md-right text-sm-center">
                                    <div class="mb-1 mr-3 align-self-right pt-0 d-inline-block">
                                        <a href="javascript:;" role="button" class="text-light p-2 m-2 btn btn-round btn-rised btn-icon btn-primary">
                                            <i class="fab fa-twitter fa-lg color-light" aria-hidden="true"></i>
                                        </a>
                                        <a href="javascript:;" role="button" class="text-light p-2 m-2 btn btn-round btn-rised btn-icon btn-primary">
                                            <i class="fab fa-facebook fa-lg" aria-hidden="true"></i>
                                        </a>
                                        <a href="javascript:;" role="button" class="text-light p-2 m-2 btn btn-round btn-rised btn-icon btn-primary">
                                            <i class="fab fa-linkedin fa-lg" aria-hidden="true"></i>
                                        </a>
                                        <a href="javascript:;" role="button" class="text-light p-2 m-2 btn btn-rised btn-round btn-icon btn-primary">
                                            <i class="fab fa-google-plus fa-lg" aria-hidden="true"></i>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </footer>
        </section>
        <style type="text/css">
            .min-100 {
                min-height: 100vh;
            }
            #sidemenu {
                z-index: 1010;
            }
            /* only show subitems when parent is active*/
            #sidemenu .nav-item .nav-link.active + .nav .nav-item {
                display: list-item;
            }
            #sidemenu .nav-item .nav-item {
                display: none;
            }

            .anchor{
                display: block;
                height: 70px;
                margin-top: -70px;
                visibility: hidden;
            }

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

                // navigation
                var navToggler = $('.navbar-toggler');
                $("[href^='#']", "*").on('click', function (e) {
                    e.preventDefault();

                    if (navToggler.is(':visible')) {
                        navToggler.click();
                    }

                    var hash = this.hash;
                    var scrollToValue = 0;
                    console.log(hash);
                    if (hash && hash !== "") {
                        scrollToValue = $(hash).offset().top;
                    } else {

                    }
                    $('html, body').animate({
                        scrollTop: scrollToValue
                    }, 700, 'easeInOutExpo', function () {
                        window.location.hash = hash;
                    });
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