<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="dynamic-ajax-content grid-gutter-padding">
    <div class="row">
        <div class="col-lg-12">
            <div class="card my-3">
                <div class="card-header">
                    Action Thumbnail Gallery
                    <div class="options float-right">
                        <a class="settings"><i class="fa fa-cog"></i></a>
                        <a href="#" class="collapse"><i class="fa fa-chevron-up"></i></a>
                        <a href="#" class="reload"><i class="fa fa-sync"></i></a>
                        <a href="#" class="fullscreen"><i class=" fa fa-expand"></i></a>
                        <a href="#" class="remove"><i class="fa fa-times"></i></a>
                    </div>
                </div>
                <div class="card-body">
                    <div class="row">
                        <div class="col-lg-3 col-md-4 col-xs-6">
                            <a href="${pageContext.request.contextPath}/assets/img/gallery/1.jpg" title="Nature Portfolio" class="zoom card-img-top">
                                <img class="img-fluid" src="${pageContext.request.contextPath}/assets/img/gallery/1.jpg" alt="Nature Portfolio" />
                                <span class="overlay"><i class="fa fa-arrows-alt"></i></span>
                            </a>
                        </div>
                        <div class="col-lg-3 col-md-4 col-xs-6">
                            <a href="${pageContext.request.contextPath}/assets/img/gallery/2.jpg" title="Food Portfolio" class="zoom">
                                <img class="img-fluid" src="${pageContext.request.contextPath}/assets/img/gallery/2.jpg" alt="Food Portfolio" />
                                <span class="overlay"><i class="fa fa-arrows-alt"></i></span>
                            </a>
                        </div>
                        <div class="col-lg-3 col-md-4 col-xs-6">
                            <a href="${pageContext.request.contextPath}/assets/img/gallery/3.jpg" title="Sports Portfolio" class="zoom">
                                <img class="img-fluid" src="${pageContext.request.contextPath}/assets/img/gallery/3.jpg" alt="Sports Portfolio" />
                                <span class="overlay"><i class="fa fa-arrows-alt"></i></span>
                            </a>
                        </div>
                        <div class="col-lg-3 col-md-4 col-xs-6">
                            <a href="${pageContext.request.contextPath}/assets/img/gallery/4.jpg" title="People Portfolio" class="zoom">
                                <img class="img-fluid" src="${pageContext.request.contextPath}/assets/img/gallery/4.jpg" alt="People Portfolio" />
                                <span class="overlay"><i class="fa fa-arrows-alt"></i></span>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--<link href="components/" rel="stylesheet">-->
    <style type="text/css">
        .zoom {
            position: relative;
            overflow: hidden;
            display: block;
            transition: all 0.9s;
            -moz-transition: all 0.9s;
            -webkit-transition: all 0.9s;
            -o-transition: all 0.9s;
        }
        .zoom:hover {
            -webkit-box-shadow: 0 0 12px rgba(0, 123, 255, 0.6);
            box-shadow: 0 0 12px rgba(0, 123, 255, 0.6);
            transform: scale(1.1);
        }
        .zoom img {
            display: block;
            transition: all 0.9s;
            -moz-transition: all 0.9s;
            -webkit-transition: all 0.9s;
            -o-transition: all 0.9s;
        }
        .zoom:hover img {
            transform: scale(1.3);
            -ms-transform: scale(1.3);
            -webkit-transform: scale(1.3);
            -o-transform: scale(1.3);
            -moz-transform: scale(1.3);
        }
        .zoom span.overlay {
            position: absolute;
            top: 0;
            left: 0;
            visibility: hidden;
            height: 100%;
            width: 100%;
            background-color: #000;
            opacity: 0;
            transition: opacity .5s ease-out;
            -moz-transition: opacity .5s ease-out;
            -webkit-transition: opacity .5s ease-out;
            -o-transition: opacity .5s ease-out;
        }
        .zoom:hover span.overlay {
            display: block;
            visibility: visible;
            opacity: 0.50;
            -moz-opacity: 0.50;
            -webkit-opacity: 0.50;
            filter: alpha(opacity=60);
            -ms-filter: "progid:DXImageTransform.Microsoft.Alpha(Opacity=65)";
        }
        .zoom:hover span.overlay i {
            position: absolute;
            top: 45%;
            left: 0%;
            width: 100%;
            font-size: 2.25em;
            color: #fff !important;
            text-align: center;
            opacity: 1;
            -moz-opacity: 1;
            -webkit-opacity: 1;
            filter: alpha(opacity=1);
            -ms-filter: "progid:DXImageTransform.Microsoft.Alpha(Opacity=1)";
        }
    </style>
    <!--<script src="components/"></script>-->
    <script type="text/javascript">
        jQuery(function ($) {
            // any code put here will be run after content attach to ajax output container and before
            // controll return to main javascript file.


            $(javatmp.settings.defaultOutputSelector).on(javatmp.settings.javaTmpAjaxContainerReady, function (event) {
                // fire AFTER all transition done and your ajax content is shown to user.
            });

            $(javatmp.settings.defaultOutputSelector).on(javatmp.settings.javaTmpContainerResizeEventName, function (event) {
                // fire when user resize browser window or sidebar hide / show
            });
            $(javatmp.settings.defaultOutputSelector).on(javatmp.settings.cardFullscreenCompress, function (event, card) {
                // when card compress by pressing the top right tool button
            });
            $(javatmp.settings.defaultOutputSelector).on(javatmp.settings.cardFullscreenExpand, function (event, card) {
                // when card Expand by pressing the top right tool button
            });

            /**
             * When another sidebar menu item pressed and before container replaced with new ajax content.
             * You can cancel, destroy, or remove any thing here before replace main output ajax container.
             * returning false will cancel the new request and do nothing.
             **/
            $(javatmp.settings.defaultOutputSelector).on(javatmp.settings.javaTmpContainerRemoveEventName, function (event) {
                $(javatmp.settings.defaultOutputSelector).off(javatmp.settings.cardFullscreenCompress);
                $(javatmp.settings.defaultOutputSelector).off(javatmp.settings.cardFullscreenExpand);
                return true;
            });
        });
    </script>
</div>