<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="dynamic-ajax-content grid-gutter-padding">
    <h4 class="my-3">
        List User Messages
    </h4>
    <hr/>
    <div class="row">
        <div class="col">
            <div class="card">
                <div class="card-header d-flex align-items-center">
                    <button class="fakeRecivedNewMsg btn-sm btn btn-primary">send you random newest msgs</button>
                    Scroll to bottom or top to load additional content
                    <div class="options float-right ml-auto">
                        <a class="settings"><i class="fa fa-cog"></i></a>
                        <a href="#" class="collapse"><i class="fa fa-chevron-up"></i></a>
                        <a href="#" class="reload"><i class="fa fa-sync"></i></a>
                        <a href="#" class="fullscreen"><i class=" fa fa-expand"></i></a>
                        <a href="#" class="remove"><i class="fa fa-times"></i></a>
                    </div>
                </div>
                <div class="card-body p-0">
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
                '<a class="p-2 list-group-item list-group-item-action" actionType="ajax-model" href="{{contextPath}}/message/ViewMessageController?messageId={{messageId}}"' +
                ' data-actionable-options=\'{"size":"modal-lg", "title": "Loading Compose Message .."}\'>' +
                '    <div class="media">' +
                '        <img class="col-fixed-3 mr-1" src="{{contextPath}}/ViewUploadedFileController?documentId={{documentId}}&amp;randomHash={{randomHash}}&amp;viewType=inline" alt="Generic placeholder image"/>' +
                '        <div class="media-body">' +
                '            <div class="mt-0 d-flex justify-content-between">' +
                '                <strong>{{senderFirstName}} {{senderLastName}}</strong>' +
                '                <span class="text-muted mr-3">' +
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
            var recordPerPage = 25;
            var oldestCount = Number.MAX_SAFE_INTEGER;
            var currentFetchedCount = 0;
            var toUserId = javatmp.user.id;
            var oldestDate;
            var newestDate;
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
                            workingTop = true;
                            $("#infinite-scroll").mCustomScrollbar('scrollTo', 'top', {scrollInertia: 20});
                            this.mcs.content.prepend(indicatorTemplate);
                            var that = this;
                            var passData = {
                                _ajaxGlobalBlockUI: false,
                                start: 0,
                                length: recordPerPage,
                                order: [
                                    {"column": 0, "dir": "desc"}
                                ],
                                columns: [{
                                        "name": "creationDate", "data": "creationDate",
                                        search: {
                                            "value": moment(newestDate).format("YYYY-MM-DDTHH:mm:ss.SSSZ"),
                                            "operatorType": "newerThan"
                                        }
                                    },
                                    {
                                        "name": "toUserId", "data": "toUserId",
                                        search: {
                                            "value": toUserId
                                        }
                                    }
                                ]
                            };
                            console.log("Try fetching any message newer than [" + moment(newestDate).format("YYYY/MM/DD HH:mm:ss.SSS Z") + "]");
                            $.ajax({
                                "type": "POST",
                                url: javatmp.settings.contextPath + "/message/ListMessagesController",
                                dataType: "json",
                                contentType: "application/json; charset=UTF-8",
                                data: JSON.stringify(passData),
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
                                            'contextPath': javatmp.settings.contextPath,
                                            'documentId': row.fromUser.profilePicDocumentId,
                                            'randomHash': row.fromUser.profilePicDocument.randomHash
                                        });
                                        if (moment(newestDate).isBefore(moment(row.creationDate))) {
                                            console.log("newestDate [" + moment(newestDate).format("YYYY/MM/DD HH:mm:ss") + "] become [" + moment(row.creationDate).format("YYYY/MM/DD HH:mm:ss") + "]");
                                            newestDate = moment(row.creationDate);
                                        }
                                        $(readyData).hide().prependTo(that.mcs.content).fadeIn(1000);
//                                        that.mcs.content.prepend(readyData);
                                        that.mcs.content.find("time.timeago").timeago();
                                    });
                                    $(that).mCustomScrollbar("scrollTo", 1);
                                    workingTop = false;
                                }
                            });
                        }
                    },
                    onTotalScroll: function () {
                        if (!workingDown) {
                            console.log("** onTotalScroll currentFetch [" + currentFetchedCount + "], allCount [" + oldestCount + "]");
                            if (oldestCount > 0) {
                                workingDown = true;
                                this.mcs.content.append(indicatorTemplate);
                                var that = this;
                                oldestDate = oldestDate || moment();
                                var passData = {
                                    _ajaxGlobalBlockUI: false,
                                    start: 0,
                                    length: recordPerPage,
                                    order: [
                                        {"column": 0, "dir": "asc"}
                                    ],
                                    columns: [{
                                            "name": "creationDate", "data": "creationDate",
                                            search: {
                                                "value": moment(oldestDate).format("YYYY-MM-DDTHH:mm:ss.SSSZ"),
                                                "operatorType": "olderThan"
                                            }
                                        },
                                        {
                                            "name": "toUserId", "data": "toUserId",
                                            search: {
                                                "value": toUserId
                                            }
                                        }
                                    ]
                                };
                                $.ajax({
                                    "type": "POST",
                                    url: javatmp.settings.contextPath + "/message/ListMessagesController",
                                    dataType: "json",
                                    contentType: "application/json; charset=UTF-8",
                                    data: JSON.stringify(passData),
                                    success: function (response, textStatus, jqXHR) {
                                        that.mcs.content.find(".fetch-indicator").remove();
                                        var data = response.data.data;
                                        oldestCount = response.data.recordsTotal;
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
                                                'contextPath': javatmp.settings.contextPath,
                                                'documentId': row.fromUser.profilePicDocumentId,
                                                'randomHash': row.fromUser.profilePicDocument.randomHash
                                            });
                                            if (moment(oldestDate).isAfter(moment(row.creationDate))) {
                                                console.log("oldest [" + moment(oldestDate).format("YYYY/MM/DD HH:mm:ss") + "] become [" + moment(row.creationDate).format("YYYY/MM/DD HH:mm:ss") + "]");
                                                oldestDate = moment(row.creationDate);
                                            }

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
                console.log("** Start Populate content dynamically (!workingDown) is (" + (!workingDown) + ")");
                if (!workingDown) {
                    if (oldestCount > 0) {
                        workingDown = true;
                        $("#infinite-scroll .mCSB_container").append(indicatorTemplate);
                        oldestDate = oldestDate || moment();
                        var passData = {
                            _ajaxGlobalBlockUI: false,
                            start: 0,
                            length: recordPerPage,
                            order: [
                                {"column": 0, "dir": "asc"}
                            ],
                            columns: [{
                                    "name": "creationDate", "data": "creationDate",
                                    search: {
                                        "value": moment(oldestDate).format("YYYY-MM-DDTHH:mm:ss.SSSZ"),
                                        "operatorType": "olderThan"
                                    }
                                },
                                {
                                    "name": "toUserId", "data": "toUserId",
                                    search: {
                                        "value": toUserId
                                    }
                                }
                            ]
                        };
                        $.ajax({
                            "type": "POST",
                            url: javatmp.settings.contextPath + "/message/ListMessagesController",
                            dataType: "json",
                            contentType: "application/json; charset=UTF-8",
                            data: JSON.stringify(passData),
                            success: function (response, textStatus, jqXHR) {
                                $("#infinite-scroll .mCSB_container").find(".fetch-indicator").remove();
                                var data = response.data.data;
                                oldestCount = response.data.recordsTotal;
                                $.each(data, function (index, row) {
                                    if (index === 0) {
                                        newestDate = moment(row.creationDate);
                                        console.log("newest date become [" + moment(newestDate).format("YYYY/MM/DD HH:mm:ss") + "]");
                                    }
                                    currentFetchedCount++;
                                    var readyData = template.composeTemplate({
                                        'messageId': row.messageId,
                                        'messageTitle': row.messageTitle,
                                        'messageContentText': row.messageContentText,
                                        'senderFirstName': row.fromUser.firstName,
                                        'senderLastName': row.fromUser.lastName,
                                        'creationDate': row.creationDate,
                                        'formatedDate': moment(row.creationDate).format("YYYY/MM/DD HH:mm:ss"),
                                        'contextPath': javatmp.settings.contextPath,
                                        'documentId': row.fromUser.profilePicDocumentId,
                                        'randomHash': row.fromUser.profilePicDocument.randomHash
                                    });
                                    if (moment(oldestDate).isAfter(moment(row.creationDate))) {
                                        console.log("oldest [" + moment(oldestDate).format("YYYY/MM/DD HH:mm:ss") + "] become [" + moment(row.creationDate).format("YYYY/MM/DD HH:mm:ss") + "]");
                                        oldestDate = moment(row.creationDate);
                                    }
                                    $("#infinite-scroll .mCSB_container").append(readyData).fadeIn(1000);
                                    $("#infinite-scroll .mCSB_container").find("time.timeago").timeago();
                                });
                                $("#infinite-scroll").mCustomScrollbar("scrollTo", 1);
                                workingDown = false;
                            }
                        });
                    }
                }

                $(".fakeRecivedNewMsg").on("click", function () {
                    console.log("request to populate your inbox with newst messages");
                    var formArray = [
                        {name: "messageTos", value: javatmp.user.id},
                        {name: "messageTitle", value: "New message @ [" + moment().format("YYYY/MM/DD HH:mm:ss.SSS Z") + "]"},
                        {name: "messageContentText", value: "<p>new message for testing purposes client local time [" + moment().format("YYYY/MM/DD HH:mm:ss.SSS Z") + "]</p>"}
                    ];
                    // add default parameters:
                    $.each(javatmp.settings.defaultPassData, function (index, value) {
                        formArray.push({name: index, value: value});
                    });
                    $.ajax({
                        type: "POST",
                        url: javatmp.settings.contextPath + "/message/CreateMessageController",
                        data: formArray,
                        success: function (data) {
                            toastr.success(data.message, 'SUCCESS', {
                                timeOut: 3000,
                                progressBar: true,
                                rtl: javatmp.settings.isRTL,
                                positionClass: javatmp.settings.isRTL === true ? "toast-top-left" : "toast-top-right"
                            });
                        },
                        error: function (data) {
                            alert("error" + JSON.stringify(data));
                        }
                    });
                });
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