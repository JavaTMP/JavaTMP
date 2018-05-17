<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="dynamic-ajax-content">
    <div class="page-header">
        <h1>Dynamic Messages Using Malihu Scrollable</h1>
    </div>
    <div class="row">
        <div class="col">
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
                '<a class="p-1 list-group-item list-group-item-action" actionType="ajax-model" href="${pageContext.request.contextPath}/pages/custom-pages/inbox/ajax/ajax-view-message">' +
                '    <div class="media">' +
                '        <img class="mr-1" src="{{contextPath}}/assets/img/64x64.gif" alt="Generic placeholder image"/>' +
                '        <div class="media-body">' +
                '            <div class="mt-0 d-flex justify-content-between">' +
                '                <strong>{{senderFirstName}} {{senderLastName}}</strong>' +
                '                <span class="text-muted">' +
                '                    <small><em><time class="timeago" datetime="{{creationDate}}">{{formatedDate}}</time></em></small>' +
                '                </span>' +
                '            </div>' +
                '            {{messageTitle}}' +
                '        </div>' +
                '    </div>' +
                '</a>';

        //Compose template string

        jQuery(function ($) {
            // any code put here will be run after content attach to ajax output container and before
            // controll return to main javascript file.
            // <--- HERE --->
            //

            var indicatorTemplate = '<div class="fetch-indicator text-center m-2 p-2"><i class="fa fa-sync fa-spin fa-3x fa-fw text-primary"></i></div>';
            var workingDown = false;
            var workingTop = false;
            var startFrom = 0;
            var recordPerPage = 10;
            var allCount = Number.MAX_SAFE_INTEGER;
            var currentFetchedCount = 0;
            var toUserId = javatmp.user.id;
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
                                    "start": startFrom,
                                    "length": recordPerPage,
                                    "order[0][column]": 0,
                                    "order[0][dir]": "ASC",
                                    "columns[0][data]": "creationDate",
                                    "columns[1][data]": "toUserId",
                                    "columns[1][search][value]": toUserId
                                };
                                $.ajax({
                                    url: javatmp.settings.contextPath + "/user/ListMessagesController",
                                    data: passData,
                                    success: function (response, textStatus, jqXHR) {
                                        that.mcs.content.find(".fetch-indicator").remove();
                                        var data = response.data.data;
                                        allCount = response.data.recordsTotal;
                                        $.each(data, function (index, row) {
                                            currentFetchedCount++;
                                            var readyData = template.composeTemplate({
                                                'messageId': row.messageId,
                                                'messageTitle': row.messageTitle,
                                                'messageContentText': row.messageContentText,
                                                'senderFirstName': row.fromUser.firstName,
                                                'senderLastName': row.fromUser.lastName,
                                                'creationDate': row.creationDate,
                                                'formatedDate': moment(row.creationDate).format("YYYY/MM/DD HH:mm:ss"),
                                                'contextPath': javatmp.settings.contextPath
                                            });
                                            that.mcs.content.prepend(readyData);
                                            that.mcs.content.find("time.timeago").timeago();
                                        });
                                        $(that).mCustomScrollbar("scrollTo", 1);
                                        startFrom += data.length;
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
                                    "start": startFrom,
                                    "length": recordPerPage,
                                    "order[0][column]": 0,
                                    "order[0][dir]": "ASC",
                                    "columns[0][data]": "creationDate",
                                    "columns[1][data]": "toUserId",
                                    "columns[1][search][value]": toUserId
                                };
                                $.ajax({
                                    url: javatmp.settings.contextPath + "/user/ListMessagesController",
                                    data: passData,
                                    success: function (response, textStatus, jqXHR) {
                                        that.mcs.content.find(".fetch-indicator").remove();
                                        var data = response.data.data;
                                        allCount = response.data.recordsTotal;
                                        $.each(data, function (index, row) {
                                            currentFetchedCount++;
                                            var readyData = template.composeTemplate({
                                                'messageId': row.messageId,
                                                'messageTitle': row.messageTitle,
                                                'messageContentText': row.messageContentText,
                                                'senderFirstName': row.fromUser.firstName,
                                                'senderLastName': row.fromUser.lastName,
                                                'creationDate': row.creationDate,
                                                'formatedDate': moment(row.creationDate).format("YYYY/MM/DD HH:mm:ss"),
                                                'contextPath': javatmp.settings.contextPath
                                            });
                                            that.mcs.content.append(readyData);
                                            that.mcs.content.find("time.timeago").timeago();
                                        });
                                        workingDown = false;
                                        startFrom += data.length;
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
                console.log("** Start Populate content dynamically (!workingDown) is (" + (!workingDown) + ")");
                if (!workingDown) {
                    console.log("currentFetchedCount < allCount is (" + (currentFetchedCount < allCount) + ")");
                    if (currentFetchedCount < allCount) {
                        workingDown = true;
                        $("#infinite-scroll .mCSB_container").append(indicatorTemplate);
                        var passData = {
                            "_ajaxGlobalBlockUI": false,
                            "start": startFrom,
                            "length": recordPerPage,
                            "order[0][column]": 0,
                            "order[0][dir]": "ASC",
                            "columns[0][data]": "creationDate",
                            "columns[1][data]": "toUserId",
                            "columns[1][search][value]": toUserId

                        };
                        $.ajax({
                            url: javatmp.settings.contextPath + "/user/ListMessagesController",
                            data: passData,
                            success: function (response, textStatus, jqXHR) {
                                $("#infinite-scroll .mCSB_container").find(".fetch-indicator").remove();
                                var data = response.data.data;
                                allCount = response.data.recordsTotal;
                                $.each(data, function (index, row) {
                                    currentFetchedCount++;
                                    var readyData = template.composeTemplate({
                                        'messageId': row.messageId,
                                        'messageTitle': row.messageTitle,
                                        'messageContentText': row.messageContentText,
                                        'senderFirstName': row.fromUser.firstName,
                                        'senderLastName': row.fromUser.lastName,
                                        'creationDate': row.creationDate,
                                        'formatedDate': moment(row.creationDate).format("YYYY/MM/DD HH:mm:ss"),
                                        'contextPath': javatmp.settings.contextPath
                                    });
                                    $("#infinite-scroll .mCSB_container").append(readyData);
                                    $("#infinite-scroll .mCSB_container").find("time.timeago").timeago();
                                });
                                $("#infinite-scroll").mCustomScrollbar("scrollTo", 1);
                                workingDown = false;
                                startFrom += data.length;
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