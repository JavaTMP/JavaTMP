<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="${labels["global.language"]}" dir="${labels["global.direction"]}">
    <head>
        <title>${labels["global.page.title"]}</title>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link href="${pageContext.request.contextPath}/assets/dist/css/javatmp-plugins-all.min.css" rel="stylesheet" type="text/css"/>
        <link href='${pageContext.request.contextPath}/assets/dist/css/javatmp-plugins-print-all.min.css' rel='stylesheet' media='print' />

        <%-- Include directional support --%>
        <c:if test="${labels['global.direction'] == 'ltr'}">
            <link id="themeStyleSheet" href="${pageContext.request.contextPath}/assets/dist/css/javatmp-${sessionScope.user.theme}.min.css" rel="stylesheet" type="text/css"/>
        </c:if>
        <c:if test="${labels['global.direction'] == 'rtl'}">
            <link id="themeStyleSheet" href="${pageContext.request.contextPath}/assets/dist/css/javatmp-${sessionScope.user.theme}-rtl.min.css" rel="stylesheet" type="text/css"/>
        </c:if>

        <%--
        Include language support font in our case we named the file with lang ending.
        You can use if/else or switch to specifiy a file
        --%>
        <link href="${pageContext.request.contextPath}/assets/dist/css/font-family-${labels['global.language']}.min.css" rel="stylesheet" type="text/css"/>
    </head>
    <body class="sidebar-active">
        <div id="oneTimeOverlay" style="position: fixed;width: 100%;height: 100%;top: 0px;left: 0;right: 0;bottom: 0;background-color: rgba(255,255,255,1);z-index: 1000000;cursor: wait;">${labels['global.loadingText']}</div>
        <nav class="main-javatmp-navbar navbar fixed-top my-0 py-0">
            <a class="text-center navbar-brand mr-auto d-none d-md-flex align-items-stretch" href="${pageContext.request.contextPath}/">
                <span class="d-xl-none d-lg-none d-sm-inline">${labels['global.system.name.short']}</span>
                <span class="d-none d-lg-inline">${labels['global.system.name.long']}</span>
            </a>
            <ul class="main-navbar-menu nav ml-auto align-self-stretch flex-nowrap">
                <li class="nav-item dropdown mega-on-sm d-flex align-items-stretch" id="myMessagesDropdownId">
                    <a class="nav-link dropdown-toggle d-flex align-items-center" data-toggle="dropdown" href="#">
                        <i class="far fa-envelope fa-lg faa-shake animated mr-1"></i>
                        <span class="badge badge-pill badge-light d-none d-md-inline">99+</span>
                    </a>
                    <div class="dropdown-menu dropdown-menu-extender shadow-lg">
                        <div class="dropdown-menu-header clearfix">
                            <i class="fa fa-lg fa-fw fa-envelope"></i>5 Messages
                            <a actionType="ajax-model"
                               href="${pageContext.request.contextPath}/pages/message/ComposeMessage"
                               data-actionable-options='{"size":"modal-lg", "title": "Loading Compose Message .."}'
                               class="float-right small">
                                Create New Message
                            </a>
                        </div>
                        <div class="list-group-flush list-group dropdown-menu-content dynamic-messages-scroll-content">
                        </div>
                        <div class="dropdown-menu-footer">
                            <a
                                actionType="action-ref-href"
                                action-ref-by-href="${pageContext.request.contextPath}/pages/message/ListMessages"
                                class="" href="#" alt="Read All Messages">
                                <strong>Read All Messages</strong>
                            </a>
                        </div>
                    </div>
                </li>
                <li class="nav-item dropdown">
                    <a class="line-height-1 d-flex align-items-center h-100 text-left nav-link dropdown-toggle" data-toggle="dropdown" href="#">
                        <c:choose>
                            <c:when test="${not empty sessionScope.user.profilePicDocument.documentId and not empty sessionScope.user.profilePicDocument.randomHash}">
                                <img class="personalProfilePhoto logo-image rounded-circle mr-1" src="${pageContext.request.contextPath}/ViewUploadedFileController?documentId=${sessionScope.user.profilePicDocument.documentId}&amp;randomHash=${sessionScope.user.profilePicDocument.randomHash}&amp;viewType=inline" alt=""/>
                            </c:when>
                            <c:otherwise>
                                <img class="personalProfilePhoto logo-image rounded-circle mr-1" src="${pageContext.request.contextPath}/assets/img/default-profile-pic.png" alt=""/>
                            </c:otherwise>
                        </c:choose>
                        <span class="d-none d-md-inline">
                            <small class="d-flex">${labels['navbar.user.welcome']}</small>
                            ${sessionScope.user.firstName}&nbsp;${sessionScope.user.lastName}
                        </span>
                    </a>
                    <ul class="dropdown-menu dropdown-menu-right">
                        <li>
                            <a class="dropdown-item"
                               actionType="action-ref-href"
                               href="#"
                               action-ref-by-href="${pageContext.request.contextPath}/user/CurrentUserProfileController">
                                <i class="fa fa-lg fa-fw fa-user"></i>
                                ${labels['navbar.user.settings']}
                            </a>
                        </li>
                        <li class="dropdown-divider"></li>
                        <li>
                            <a class="dropdown-item" href="${pageContext.request.contextPath}/logout">
                                <i class="fa fa-lg fa-fw fa-sign-out-alt"></i>
                                ${labels['navbar.user.logout']}
                            </a>
                        </li>
                    </ul>
                </li>
            </ul>
            <button class="navbar-toggler sidebar-toggler-button my-1 ml-1 align-self-center" type="button">
                <span class="navbar-toggler-icon"></span>
            </button>
        </nav>
        <div class="container-fluid">
            <div class="row">
                <div class="col-12 m-0 p-0">
                    <div class="sidebar scroll-content shadow">
                        <div class="sidebar-shortcut-button text-center m-1">
                            <button class="btn btn-primary logout-home-btn-id"
                                    actionType="action-ref-href"
                                    action-ref-by-href="${pageContext.request.contextPath}/logout"
                                    data-toggle="tooltip" data-placement="auto"
                                    title="${labels['navbar.user.logout']}">
                                <i class="fas fa-sign-out-alt"></i>
                            </button>
                            <button class="btn btn-primary"
                                    actionType="action-ref-href"
                                    action-ref-by-href="${pageContext.request.contextPath}/user/GetListUsersPage"
                                    data-toggle="tooltip" data-placement="auto"
                                    title="${labels['sidebar.menuItem.users.usersList']}">
                                <i class="fas fa-users fa-fw"></i>
                            </button>
                            <button class="btn btn-primary"
                                    actionType="action-ref-href"
                                    action-ref-by-href="${pageContext.request.contextPath}/user/CreateUserController"
                                    data-toggle="tooltip" data-placement="auto"
                                    title="${labels['sidebar.menuItem.users.addNewUser']}">
                                <i class="fas fa-user-plus"></i>
                            </button>
                            <button class="btn btn-primary"
                                    actionType="action-ref-href"
                                    action-ref-by-href="${pageContext.request.contextPath}/user/CurrentUserProfileController"
                                    data-toggle="tooltip" data-placement="auto"
                                    title="${labels['sidebar.menuItem.system.UserProfileSettings']}">
                                <i class="far fa-user-circle"></i>
                            </button>
                            <button class="btn btn-primary"
                                    actionType="action-ref-href"
                                    action-ref-by-href="${pageContext.request.contextPath}/pages/home/home"
                                    data-toggle="tooltip" data-placement="auto"
                                    title="${labels['sidebar.menuItem.home']}">
                                <i class="fa fa-home fa-fw"></i>
                            </button>
                        </div>
                        <div class="sidebar-menu-filter-form mx-2 my-1">
                            <form autocomplete="off" class="search-menu-form">
                                <div class="has-form-control-clear">
                                    <input id="filter-menu-id" type="text" class="form-control" placeholder="${labels['sidebar.search.placeholder']}" autocomplete="off"/>
                                    <span class="form-control-clear fa fa-times d-none"></span>
                                </div>
                            </form>
                        </div>
                        <ul class="main-sidebar-menu metismenu">
                            <li>
                                <a href="${pageContext.request.contextPath}/pages/home/home">
                                    <i class="fa fa-lg fa-fw fa-home"></i>
                                    ${labels['sidebar.menuItem.home']}
                                </a>
                            </li>
                            <li>
                                <a class="has-arrow" href="#">
                                    <i class="fa fa-lg fa-fw fa-users"></i>
                                    ${labels['sidebar.menuItem.users']}
                                </a>
                                <ul>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/user/GetListUsersPage">
                                            ${labels['sidebar.menuItem.users.usersList']}
                                        </a>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/user/GetListUsersWithSearchBlockPage">
                                            ${labels['sidebar.menuItem.users.usersListWithSearchBlock']}
                                        </a>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/user/GetListUsersWithDetailsPage">
                                            ${labels['sidebar.menuItem.users.usersListWithDetails']}
                                        </a>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/user/CreateUserController">
                                            ${labels['sidebar.menuItem.users.addNewUser']}
                                        </a>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/user/SearchForUserProfileController">
                                            ${labels['sidebar.menuItem.users.searchForUser']}
                                        </a>
                                    </li>
                                </ul>
                            </li>
                            <li>
                                <a class="has-arrow" href="#">
                                    <i class="fa fa-lg fa-fw fa-cogs"></i>
                                    Document Management
                                </a>
                                <ul>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/dms/FileBrowser">
                                            File Browser
                                        </a>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/pages/dms/FileTableBrowser">
                                            File Table Browser
                                        </a>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/pages/dms/FolderBrowser">
                                            Folder Browser
                                        </a>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/pages/dms/FileStaticResource">
                                            File Static Resource
                                        </a>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/pages/dms/FileManager">
                                            File Manager
                                        </a>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/pages/dms/EditImage">
                                            Edit Image
                                        </a>
                                    </li>
                                </ul>
                            </li>
                            <li>
                                <a class="has-arrow" href="#">
                                    <i class="fa fa-lg fa-fw fa-cogs"></i>
                                    Event Management
                                </a>
                                <ul>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/pages/event/event-calendar">
                                            Event Calendar
                                        </a>
                                    </li>
                                </ul>
                            </li>
                            <li>
                                <a class="has-arrow" href="#">
                                    <i class="fa fa-lg fa-fw fa-cogs"></i>
                                    Message Management
                                </a>
                                <ul>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/pages/message/MessagesManager">
                                            Messages Manager
                                        </a>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/pages/message/ListMessages">
                                            List User Messages
                                        </a>
                                    </li>
                                </ul>
                            </li>
                            <li>
                                <a class="has-arrow" href="#">
                                    <i class="fa fa-lg fa-fw fa-cogs"></i>
                                    Content Management
                                </a>
                                <ul>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/pages/content/ViewContent">
                                            View Content
                                        </a>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/pages/content/ListContent">
                                            List Content
                                        </a>
                                    </li>
                                </ul>
                            </li>
                            <li>
                                <a class="has-arrow" href="#">
                                    <i class="fa fa-lg fa-fw fa-cogs"></i>
                                    ${labels['sidebar.menuItem.system']}
                                </a>
                                <ul>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/user/CurrentUserProfileController">
                                            ${labels['sidebar.menuItem.system.UserProfileSettings']}
                                        </a>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/pages/system/Handlebars.js">
                                            Handlebars.js
                                        </a>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/pages/system/editProfileImage">
                                            Edit Profile Image
                                        </a>
                                    </li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                    <div class="main-content">
                        <div class="main-breadcrumb-bar d-flex flex-row shadow">
                            <ol class="breadcrumb"></ol>
                            <div class="breadcrumb-submenu d-flex align-items-center pr-1 justify-content-end">
                                <a class="min-tools-button mr-1 font-size-15">
                                    <i class="fa fa-sync-alt faa-spin animated-hover line-height-base"></i>
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
        <div id="global-label-items-block" class="d-none">
            <c:forEach items="${labels.keySet()}" var="entry"><i k="${entry}">${labels[entry]}</i></c:forEach>
            </div>
            <script src="${pageContext.request.contextPath}/assets/dist/js/javatmp-plugins-all.min.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/assets/dist/js/javatmp-plugins-all-locale-${sessionScope.user.lang}.min.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/assets/dist/js/javatmp.min.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/assets/app/js/javatmp.plugins.js?v=47" type="text/javascript"></script>
        <script type="text/javascript">
            jQuery(function ($) {
                var defaults = {
                    defaultPassData: {_ajax: "ajax", _ajaxGlobalBlockUI: true, _handleAjaxErrorGlobally: true},
                    defaultUrl: '${pageContext.request.contextPath}/pages/home/home',
                    floatDefault: "${labels['global.floatDefault']}",
                    floatReverse: "${labels['global.floatReverse']}",
                    direction: "${labels['global.direction']}",
                    isRTL: ${labels['global.direction'] == 'ltr' ? 'false' : 'true'},
                    contextPath: '${pageContext.request.contextPath}',
                    networkDateFormat: "YYYY-MM-DDTHH:mm:ss.SSSZ",
                    dateFormat: "DD/MM/YYYY",
                    dateTimeFormat: "DD/MM/YYYY HH:mm",
                    dateTimeSecondFormat: "DD/MM/YYYY HH:mm:ss",
                    labels: {}
                };

                $("#global-label-items-block > i[k]").each(function (index, element) {
                    var key = $(element).attr("k");
                    var value = $(element).html();
                    defaults.labels[key] = value;
                });

                index.init(defaults);

                javatmp.plugins.init({
                    locale: "${sessionScope.user.lang}",
                    direction: javatmp.settings.direction,
                    isRTL: javatmp.settings.isRTL,
                    defaultSelectPlaceholder: javatmp.settings.labels['page.text.kindlySelect'],
                    dateFormat: javatmp.settings.dateFormat,
                    dateTimeFormat: javatmp.settings.dateTimeFormat
                });

                javatmp.user = {};
                javatmp.user.id = "${sessionScope.user.id}";
                javatmp.user.lang = "${sessionScope.user.lang}";

                javatmp.settings.handle401Error = function (jqXHR, textStatus, errorThrown) {
                    var modalMessage = null;
                    var redirectURL = null;
                    try {
                        var ResponseMessage = JSON.parse(jqXHR.responseText);
                        modalMessage = ResponseMessage.message;
                        redirectURL = ResponseMessage.redirectURL;
                    } catch (ex) {
                        modalMessage = jqXHR.responseText;
                        redirectURL = javatmp.settings.contextPath + "/";
                    }

                    var modalWrapper = BootstrapModalWrapperFactory.createModal({
                        message: modalMessage,
                        title: jqXHR.statusText + " : " + jqXHR.status,
                        closable: false,
                        closeByBackdrop: false,
                        buttons: [
                            {
                                label: "${labels['global.return']}",
                                cssClass: "btn btn-secondary",
                                action: function (modalWrapper, button, buttonData, originalEvent) {
                                    modalWrapper.hide();
                                }
                            },
                            {
                                label: "${labels['globa.redirectToLoginPage']}",
                                cssClass: "btn btn-danger",
                                action: function (modalWrapper, button, buttonData, originalEvent) {
                                    modalWrapper.hide();
                                    setTimeout(function () {
                                        window.location.replace(redirectURL);
                                    }, 200);
                                }
                            }
                        ]
                    });
                    modalWrapper.show();
                };
            });
        </script>
        <script type="text/javascript">
            jQuery(function ($) {
                $.ajaxSetup({
                    error: function (xhr, ajaxOptions, thrownError) {
                        if (this.url.indexOf("_handleAjaxErrorGlobally=false") === -1) {
                            var msg = 'Error on calling request.';
                            toastr.error(msg, xhr.statusText + " : " + xhr.status, {
                                timeOut: 4000,
                                progressBar: true,
                                rtl: javatmp.settings.isRTL,
                                positionClass: javatmp.settings.isRTL === true ? "toast-top-left" : "toast-top-right"
                            });
                        }
                    },
                    statusCode: {
                        401: function (jqXHR, textStatus, errorThrown) {
                            if (this.url.indexOf("_handleAjaxErrorGlobally=false") === -1) {
                                javatmp.settings.handle401Error(jqXHR, textStatus, errorThrown);
                            }
                        }
                    }
                });
            });
        </script>
        <script type="text/javascript">
            jQuery(function ($) {
                // register logout handler:
                $(".logout-home-btn-id").on("click", function () {
                    window.location.replace($(this).attr("action-ref-by-href"));
                });
            });
        </script>
        <script type="text/javascript">

            // Bug in ie11:
            Number.MAX_SAFE_INTEGER = Number.MAX_SAFE_INTEGER || 9007199254740991;
            Number.MIN_SAFE_INTEGER = Number.MIN_SAFE_INTEGER || -9007199254740991;

            jQuery(function ($) {
                //Compose template string
                String.prototype.composeTemplate = (function () {
                    var re = /\{{(.+?)\}}/g;
                    return function (o) {
                        return this.replace(re, function (_, k) {
                            return typeof o[k] !== 'undefined' ? o[k] : '';
                        });
                    };
                }());
                var template =
                        '<a class="p-2 list-group-item list-group-item-action" actionType="ajax-model" href="{{contextPath}}/message/ViewMessageController?messageId={{messageId}}" ' +
                        'data-actionable-options=\'{"size":"modal-lg", "title": "Loading Compose Message .."}\'>' +
                        '    <div class="media">' +
                        '        <img class="col-fixed-3 mr-1" src="{{contextPath}}/ViewUploadedFileController?documentId={{documentId}}&amp;randomHash={{randomHash}}&amp;viewType=inline" alt="Generic placeholder image"/>' +
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

                var indicatorTemplate = '<div class="fetch-indicator text-center m-2 p-2"><i class="fa fa-sync fa-spin fa-3x fa-fw text-primary"></i></div>';
                var workingDown = false;
                var workingTop = false;
                var startFrom = 0;
                var fetchOnce = false;
                var recordPerPage = 20;
                var oldestCount = Number.MAX_SAFE_INTEGER;
                var allCount = Number.MAX_SAFE_INTEGER;
                var currentFetchedCount = 0;
                var toUserId = javatmp.user.id;
                var oldestDate;
                var newestDate;
                var myMessagesDropdown = $('#myMessagesDropdownId');
                var myMessagesScrollable = $(".dynamic-messages-scroll-content", myMessagesDropdown);

                var onTotalScrollBack = function () {
                    console.log(newestDate);
                    if (!workingTop) {
                        workingTop = true;
                        myMessagesScrollable.mCustomScrollbar('scrollTo', 'top', {scrollInertia: 20});
                        $(".mCSB_container", myMessagesScrollable).prepend(indicatorTemplate);
                        var passData = {
                            _ajaxGlobalBlockUI: false, start: 0,
                            length: recordPerPage, order: [
                                {"column": 0, "dir": "desc"}
                            ],
                            columns: [{
                                    "data": "creationDate", "name": "creationDate",
                                    search: {
                                        "value": moment(newestDate).locale('en').format("YYYY-MM-DDTHH:mm:ss.SSSZ"),
                                        "operatorType": "newerThan"
                                    }
                                },
                                {
                                    "data": "toUserId", "name": "toUserId",
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
                                $(".mCSB_container", myMessagesScrollable).find(".fetch-indicator").remove();
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
                                    $(readyData).hide().prependTo($(".mCSB_container", myMessagesScrollable)).fadeIn(500);
                                    $(".mCSB_container", myMessagesScrollable).find("time.timeago").timeago();
                                });
                                myMessagesScrollable.mCustomScrollbar("scrollTo", 1);
                                workingTop = false;
                            }
                        });
                    }
                };
                var onTotalScroll = function (setNewestDate) {
                    if (!workingDown) {
                        console.log("** onTotalScroll currentFetch [" + currentFetchedCount + "], allCount [" + oldestCount + "]");
                        if (oldestCount > 0) {
                            workingDown = true;
                            $(".mCSB_container", myMessagesScrollable).append(indicatorTemplate);
                            oldestDate = oldestDate || moment();
                            var passData = {
                                _ajaxGlobalBlockUI: false,
                                start: 0,
                                length: recordPerPage,
                                order: [
                                    {"column": 0, "dir": "desc"}
                                ],
                                columns: [{
                                        "data": "creationDate", "name": "creationDate",
                                        search: {
                                            "value": moment(oldestDate).locale('en').format("YYYY-MM-DDTHH:mm:ss.SSSZ"),
                                            "operatorType": "olderThan"
                                        }
                                    },
                                    {
                                        "data": "toUserId", "name": "toUserId",
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
                                    $(".mCSB_container", myMessagesScrollable).find(".fetch-indicator").remove();
                                    var data = response.data.data;
                                    oldestCount = response.data.recordsTotal;
                                    $.each(data, function (index, row) {
                                        if (index === 0 && setNewestDate) {
                                            // the newest record will become newestdate
                                            // instead of setting current datetime as initial newest
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

                                        $(".mCSB_container", myMessagesScrollable).append(readyData);
                                        $(".mCSB_container", myMessagesScrollable).find("time.timeago").timeago();
                                    });
                                    workingDown = false;
                                }
                            });
                        }
                    }
                };
                myMessagesScrollable.mCustomScrollbar({
                    theme: "javatmp",
                    alwaysShowScrollbar: 2, scrollButtons: {
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
                        onTotalScrollBack: onTotalScrollBack,
                        onTotalScroll: onTotalScroll,
                        onTotalScrollBackOffset: 0,
                        onTotalScrollOffset: 200,
                        alwaysTriggerOffsets: true
                    }
                });

                myMessagesDropdown.on('show.bs.dropdown', function () {
                });

                myMessagesDropdown.on('shown.bs.dropdown', function () {
                    console.log("calling shown.bs.dropdown");
                    if (!fetchOnce) {
                        onTotalScroll(true);
                        fetchOnce = true;
                    } else {
                        console.log("already fetch initial data we try to update");
                        onTotalScrollBack();
                    }
                });

                myMessagesDropdown.on('hide.bs.dropdown', function () {
                });

                myMessagesDropdown.on('hidden.bs.dropdown', function () {
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
                $("#oneTimeOverlay").remove();
            });
        </script>
    </body>
</html>
