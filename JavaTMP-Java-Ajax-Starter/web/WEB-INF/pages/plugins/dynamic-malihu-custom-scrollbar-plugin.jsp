<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="dynamic-ajax-content">
    <div class="page-header">
        <h1>Dynamic Malihu Custom Scrollbar Plugin</h1>
    </div>
    <div class="row">
        <div class="col">
            <div class="alert alert-info">
                <p>Highly customizable custom scrollbar jQuery plugin, featuring vertical/horizontal scrollbars, scrolling momentum, mouse-wheel, keyboard and touch support.</p>
                <p>
                    <a class="btn btn-info" target="_blank" href="http://manos.malihu.gr/jquery-custom-content-scroller/">Configuration Page</a>
                    <a class="btn btn-info" target="_blank" href="http://manos.malihu.gr/repository/custom-scrollbar/demo/examples/complete_examples.html">Demo Page</a>
                    <a class="btn btn-info" target="_blank" href="https://github.com/malihu/malihu-custom-scrollbar-plugin">github.com Project Link</a>
                </p>
            </div>
            <div class="card">
                <div class="card-header">
                    Scroll to bottom or top to load additional content
                    <div class="options float-right">
                        <a class="settings"><i class="fa fa-cog"></i></a>
                        <a href="#" class="collapse"><i class="fa fa-chevron-up"></i></a>
                        <a href="#" class="reload"><i class="fa fa-sync"></i></a>
                        <a href="#" class="fullscreen"><i class=" fa fa-expand"></i></a>
                        <a href="#" class="remove"><i class="fa fa-times"></i></a>
                    </div>
                </div>
                <div class="card-body">
                    <div id="infinite-scroll" class="list-group-flush list-group content">
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--
    Reference Your external Stylesheet file here
    if your feature or plugins could not support to run globally.
    <link href="components/" rel="stylesheet">
    -->
    <style type="text/css">
        /* theme: "minimal", "minimal-dark" */


    </style>
    <style type="text/css">
        /*
        Embed CSS styling for current page.
        */
        .content {
            overflow: auto;
            position: relative;
            /*width: 740px;*/
            border: 1px solid #DDD;
            height: 400px;
        }
    </style>
    <style type="text/css">
        #infinite-scroll .offset{
            display: block;
            width: 100%;
            height: auto;
            color: #ffed0d;
            -webkit-border-radius: 3px;
            -moz-border-radius: 3px;
            border-radius: 3px;
        }
    </style>

    <!--
    Reference Your external Javascript file here
    if your feature or plugins could not support to run globally.
    <script src="components/"></script>
    -->
    <script type="text/javascript">
        // You could write safely Javascript code here too as our template
        // should load mandatory libraries and plugins before.
        // <--- HERE --->
        //

        var template =
                '<div class="list-group-item list-group-item-action">' +
                '    <div class="media">' +
                '        <img class="mr-3" src="{{contextPath}}/assets/img/64x64.gif" alt="Generic placeholder image"/>' +
                '        <div class="media-body">' +
                '            <h5 class="mt-0 d-flex justify-content-between"><span>{{title}}</span><time class="timeago" datetime="{{creationDate}}">{{formatedDate}}</time></h5>' +
                '            {{contentText}}' +
                '        </div>' +
                '    </div>' +
                '</div>';
        //Compose template string
        String.prototype.composeTemplate = (function () {
            var re = /\{{(.+?)\}}/g;
            return function (o) {
                return this.replace(re, function (_, k) {
                    return typeof o[k] !== 'undefined' ? o[k] : '';
                });
            };
        }());
        jQuery(function ($) {
            // any code put here will be run after content attach to ajax output container and before
            // controll return to main javascript file.
            // <--- HERE --->
            //

            var indicatorTemplate = '<div class="fetch-indicator text-center m-2 p-2"><i class="fa fa-sync fa-spin fa-3x fa-fw text-primary"></i></div>';
            var workingDown = false;
            var workingTop = false;
            var pageRequested = 1;
            var recordPerPage = 20;
            var allCount = Number.MAX_SAFE_INTEGER;
            var currentFetchedCount = 0;
            $("#infinite-scroll").mCustomScrollbar({
                theme: "javatmp",
                alwaysShowScrollbar: 2,
                scrollButtons: {
                    enable: false
                },
                mouseWheel: {
                    preventDefault: true
                },
                callbacks: {
                    onInit: function () {
                    },
                    onScroll: function () {
                        console.log("top = " + this.mcs.top + " , direction = " + this.mcs.direction);
                    },
                    onTotalScrollBack: function () {
                        if (!workingTop) {
                            console.log("** onTotalScrollBack currentFetch [" + currentFetchedCount + "], allCount [" + allCount + "]");
                            if (currentFetchedCount < allCount) {
                                workingTop = true;
                                $("#infinite-scroll").mCustomScrollbar('scrollTo', 'top', {scrollInertia: 20});
                                this.mcs.content.prepend(indicatorTemplate);
                                var that = this;
                                var passData = {
                                    "_ajaxGlobalBlockUI": false,
                                    numOfRowsPerPage: recordPerPage,
                                    requestedPageNum: pageRequested
                                };
                                pageRequested++;
                                $.ajax({
                                    url: javatmp.settings.contextPath + "/cms/ListContentController",
                                    data: passData,
                                    success: function (response, textStatus, jqXHR) {
                                        that.mcs.content.find(".fetch-indicator").remove();
                                        var data = response.data.records;
                                        allCount = response.data.allCount;
                                        $.each(data, function (index, row) {
                                            currentFetchedCount++;
                                            var readyData = template.composeTemplate({
                                                'contentId': row.contentId,
                                                'title': row.title,
                                                'contentText': row.summaryText,
                                                'creationDate': row.creationDate,
                                                'formatedDate': moment(row.creationDate).format("YYYY/MM/DD HH:mm:ss"),
                                                'contextPath': javatmp.settings.contextPath
                                            });
                                            that.mcs.content.prepend(readyData);
                                            that.mcs.content.find("time.timeago").timeago();
                                        });
                                        $(that).mCustomScrollbar("scrollTo", 1);
                                        workingTop = false;
                                    }
                                });
                            }
                        }
                    },
                    onTotalScroll: function () {
                        if (!workingDown) {
                            console.log("** onTotalScroll currentFetch [" + currentFetchedCount + "], allCount [" + allCount + "]");
                            if (currentFetchedCount < allCount) {
                                workingDown = true;
                                this.mcs.content.append(indicatorTemplate);
                                var that = this;
                                var passData = {
                                    "_ajaxGlobalBlockUI": false,
                                    numOfRowsPerPage: recordPerPage,
                                    requestedPageNum: pageRequested
                                };
                                pageRequested++;
                                $.ajax({
                                    url: javatmp.settings.contextPath + "/cms/ListContentController",
                                    data: passData,
                                    success: function (response, textStatus, jqXHR) {
                                        that.mcs.content.find(".fetch-indicator").remove();
                                        var data = response.data.records;
                                        allCount = response.data.allCount;
                                        $.each(data, function (index, row) {
                                            currentFetchedCount++;
                                            var readyData = template.composeTemplate({
                                                'contentId': row.contentId,
                                                'title': row.title,
                                                'contentText': row.summaryText,
                                                'creationDate': row.creationDate,
                                                'formatedDate': moment(row.creationDate).format("YYYY/MM/DD HH:mm:ss"),
                                                'contextPath': javatmp.settings.contextPath
                                            });
                                            that.mcs.content.append(readyData);
                                            that.mcs.content.find("time.timeago").timeago();
                                        });
                                        workingDown = false;
                                    }
                                });
                            }
                        }
                    },
                    onTotalScrollBackOffset: 0,
                    onTotalScrollOffset: 200,
                    alwaysTriggerOffsets: true
                }
            });



            $(javatmp.settings.defaultOutputSelector).on(javatmp.settings.javaTmpAjaxContainerReady, function (event) {
                // fire AFTER all transition done and your ajax content is shown to user.
                console.log("** Start Populate content dynamically ***");
                $("#infinite-scroll").mCustomScrollbar("update");
                if (!workingDown) {
                    if (currentFetchedCount < allCount) {
                        workingDown = true;
                        $("#infinite-scroll .mCSB_container").append(indicatorTemplate);
                        var passData = {
                            "_ajaxGlobalBlockUI": false,
                            numOfRowsPerPage: recordPerPage,
                            requestedPageNum: pageRequested
                        };
                        pageRequested++;
                        $.ajax({
                            url: javatmp.settings.contextPath + "/cms/ListContentController",
                            data: passData,
                            success: function (response, textStatus, jqXHR) {
                                $("#infinite-scroll .mCSB_container").find(".fetch-indicator").remove();
                                var data = response.data.records;
                                allCount = response.data.allCount;
                                $.each(data, function (index, row) {
                                    currentFetchedCount++;
                                    var readyData = template.composeTemplate({
                                        'contentId': row.contentId,
                                        'title': row.title,
                                        'contentText': row.summaryText,
                                        'creationDate': row.creationDate,
                                        'formatedDate': moment(row.creationDate).format("YYYY/MM/DD HH:mm:ss"),
                                        'contextPath': javatmp.settings.contextPath
                                    });
                                    $("#infinite-scroll .mCSB_container").append(readyData);
                                    $("#infinite-scroll .mCSB_container").find("time.timeago").timeago();
                                });
                                workingDown = false;
                                $("#infinite-scroll").mCustomScrollbar("scrollTo", 1);
                            }
                        });
                    }
                }
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
             * When another sidebar menu item pressed and before container issues new ajax request.
             * You can cancel, destroy, or remove any thing here before replace main output ajax container.
             * return false or event.preventDefault() will cancel ajax and stay you in the current page and do nothing.
             **/
            $(javatmp.settings.defaultOutputSelector).on(javatmp.settings.javaTmpContainerRemoveEventName, function (event) {
                $(javatmp.settings.defaultOutputSelector).off(javatmp.settings.cardFullscreenCompress);
                $(javatmp.settings.defaultOutputSelector).off(javatmp.settings.cardFullscreenExpand);
                return true;
            });
        });
    </script>
</div>