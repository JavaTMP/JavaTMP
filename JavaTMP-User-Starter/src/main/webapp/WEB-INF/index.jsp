<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.javatmp.util.Constants" %>
<!doctype html>
<html lang="${labels["global.language"]}" dir="${labels["global.direction"]}" class="javatmp-default-admin-layout">
    <head>
        <title>${labels["global.page.title"]}</title>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link href="${pageContext.request.contextPath}/assets/dist/css/javatmp-plugins-all.min.css" rel="stylesheet" type="text/css"/>
        <link href='${pageContext.request.contextPath}/assets/dist/css/javatmp-plugins-print-all.min.css' rel='stylesheet' media='print' />

        <!-- Include directional support -->
        <c:if test="${labels['global.direction'] == 'ltr'}">
            <link id="themeStyleSheet" href="${pageContext.request.contextPath}/assets/dist/css/javatmp-${sessionScope.user.theme}.min.css" rel="stylesheet" type="text/css"/>
        </c:if>
        <c:if test="${labels['global.direction'] == 'rtl'}">
            <link id="themeStyleSheet" href="${pageContext.request.contextPath}/assets/dist/css/javatmp-${sessionScope.user.theme}-rtl.min.css" rel="stylesheet" type="text/css"/>
        </c:if>

        <!--
        Include language support font in our case we named the file with lang ending.
        You can use if/else or switch to specifiy a file
        -->
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
                <li class="nav-item dropdown mega-on-sm d-flex align-items-stretch">
                    <a class="nav-link dropdown-toggle d-flex align-items-center" data-toggle="dropdown" href="#">
                        <i class="fa fa-lg fa-bars faa-float animated mr-1"></i>
                        <span class="badge badge-pill badge-light d-none d-md-inline">99+</span>
                    </a>
                    <div class="dropdown-menu dropdown-menu-extender">
                        <div class="dropdown-menu-header">
                            <i class="fa fa-lg fa-tasks"></i>
                            6 Tasks
                            <span class="float-right">
                                <i class="fa fa-fw fa-lg fa-cog"></i>
                            </span>
                        </div>
                        <div class="dropdown-menu-content scroll-content">
                            <div class="list-group list-group-flush">
                                <a class="list-group-item list-group-item-action" href="#">
                                    <p>
                                        <strong>Task 1</strong>
                                        <span class="float-right text-muted">40% Complete</span>
                                    </p>
                                    <div class="progress progress-striped">
                                        <div class="progress-bar bg-success" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: 40%">
                                            <span class="sr-only">40% Complete (success)</span>
                                        </div>
                                    </div>
                                </a>
                                <a class="list-group-item list-group-item-action" href="#">
                                    <p>
                                        <strong>Task 2</strong>
                                        <span class="float-right text-muted">20% Complete</span>
                                    </p>
                                    <div class="progress progress-striped">
                                        <div class="progress-bar bg-info" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100" style="width: 20%">
                                            <span class="sr-only">20% Complete</span>
                                        </div>
                                    </div>
                                </a>
                                <a class="list-group-item list-group-item-action" href="#">
                                    <p>
                                        <strong>Task 3</strong>
                                        <span class="float-right text-muted">40% Complete</span>
                                    </p>
                                    <div class="progress progress-striped">
                                        <div class="progress-bar bg-success" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: 40%">
                                            <span class="sr-only">40% Complete (success)</span>
                                        </div>
                                    </div>
                                </a>
                                <a class="list-group-item list-group-item-action" href="#">
                                    <div>
                                        <p>
                                            <strong>Task 4</strong>
                                            <span class="float-right text-muted">20% Complete</span>
                                        </p>
                                        <div class="progress progress-striped">
                                            <div class="progress-bar bg-info" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100" style="width: 20%">
                                                <span class="sr-only">20% Complete</span>
                                            </div>
                                        </div>
                                    </div>
                                </a>
                                <a class="list-group-item list-group-item-action" href="#">
                                    <div>
                                        <p>
                                            <strong>Task 5</strong>
                                            <span class="float-right text-muted">60% Complete</span>
                                        </p>
                                        <div class="progress progress-striped">
                                            <div class="progress-bar bg-warning" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 60%">
                                                <span class="sr-only">60% Complete (warning)</span>
                                            </div>
                                        </div>
                                    </div>
                                </a>
                                <a class="list-group-item list-group-item-action" href="#">
                                    <p>
                                        <strong>Task 6</strong>
                                        <span class="float-right text-muted">10% Complete</span>
                                    </p>
                                    <div class="progress progress-striped">
                                        <div class="progress-bar bg-danger" role="progressbar"
                                             aria-valuenow="80" aria-valuemin="0" aria-valuemax="100" style="width: 10%">
                                            <span class="sr-only">10% Complete (danger)</span>
                                        </div>
                                    </div>
                                </a>
                                <a class="list-group-item list-group-item-action" href="#">
                                    <p>
                                        <strong>Task 7</strong>
                                        <span class="float-right text-muted">90% Complete</span>
                                    </p>
                                    <div class="progress progress-striped">
                                        <div class="progress-bar bg-success" role="progressbar"
                                             aria-valuenow="90" aria-valuemin="0" aria-valuemax="100" style="width: 90%">
                                            <span class="sr-only">90% Complete (danger)</span>
                                        </div>
                                    </div>
                                </a>
                            </div>
                        </div>
                        <div class="dropdown-menu-footer">
                            <a class="" href="#" alt="Read All Messages">
                                <strong>See All Tasks</strong>
                            </a>
                        </div>
                    </div>
                </li>
                <li class="nav-item dropdown mega-on-sm d-flex align-items-stretch">
                    <a class="nav-link d-flex align-items-center dropdown-toggle " data-toggle="dropdown" href="#">
                        <i class="far fa-bell fa-lg faa-ring animated mr-1"></i>
                        <span class="badge badge-pill badge-light d-none d-md-inline">99+</span>
                    </a>
                    <ul class="dropdown-menu dropdown-menu-extender">
                        <li>
                            <a class="dropdown-item clearfix" href="#">
                                <!--<span class="float-left">-->
                                <i class="fa fa-fw fa-lg fa-comment"></i>New Comment
                                <!--</span>-->
                                <span class="float-right small">
                                    6 minutes ago
                                </span>
                            </a>
                        </li>
                        <li class="dropdown-divider"></li>
                        <li>
                            <a class="dropdown-item clearfix" href="#">
                                <span class="float-left">
                                    <i class="fab fa-fw fa-lg fa-twitter"></i>3 New Followers
                                </span>
                                <span class="float-right small">
                                    6 minutes ago
                                </span>
                            </a>
                        </li>
                        <li class="dropdown-divider"></li>
                        <li>
                            <a class="dropdown-item clearfix" href="#">
                                <span class="float-left">
                                    <i class="fa fa-fw fa-lg fa-envelope"></i>Message Sent
                                </span>
                                <span class="float-right small">
                                    6 minutes ago
                                </span>
                            </a>
                        </li>
                        <li class="dropdown-divider"></li>
                        <li>
                            <a class="dropdown-item clearfix" href="#">
                                <span class="float-left">
                                    <i class="fa fa-fw fa-lg fa-tasks"></i>New Task
                                </span>
                                <span class="float-right small">
                                    6 minutes ago
                                </span>
                            </a>
                        </li>
                        <li class="dropdown-divider"></li>
                        <li>
                            <a class="dropdown-item text-center" href="#">
                                <strong>See All Alerts</strong>
                            </a>
                        </li>
                    </ul>
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
                                    <li>
                                        <a href="${pageContext.request.contextPath}/user/GetAdvancedListUsersSearchPage">
                                            Advanced Users Search
                                        </a>
                                    </li>
                                </ul>
                            </li>
                            <li>
                                <a class="has-arrow" href="#">
                                    <i class="far fa-lg fa-fw fa-folder"></i>
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
                                    <i class="far fa-lg fa-fw fa-calendar-alt"></i>
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
                                    <i class="far fa-lg fa-fw fa-envelope"></i>
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
                                    <i class="far fa-lg fa-fw fa-file-alt"></i>
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
                                    <i class="far fa-lg fa-fw fa-lightbulb"></i>
                                    Accounting Management
                                </a>
                                <ul>
                                    <li>
                                        <a class="has-arrow" href="#">
                                            Accounts
                                        </a>
                                        <ul>
                                            <li>
                                                <a href="${pageContext.request.contextPath}/accounting/chartOfAccounts">
                                                    Chart Of Accounts
                                                </a>
                                            </li>
                                            <li>
                                                <a href="${pageContext.request.contextPath}/accounting/AccountLedger">
                                                    Account Ledger
                                                </a>
                                            </li>
                                            <li>
                                                <a href="${pageContext.request.contextPath}/accounting/GeneralLedger">
                                                    General Ledger
                                                </a>
                                            </li>
                                        </ul>
                                    </li>
                                    <li>
                                        <a class="has-arrow" href="#">
                                            Transactions
                                        </a>
                                        <ul>
                                            <li>
                                                <a href="${pageContext.request.contextPath}/accounting/CreateTransaction">
                                                    Create Transaction
                                                </a>
                                            </li>
                                            <li>
                                                <a href="${pageContext.request.contextPath}/accounting/listTransactions">
                                                    List Transactions
                                                </a>
                                            </li>
                                            <li>
                                                <a href="${pageContext.request.contextPath}/pages/accounting/general-ledger-entries">
                                                    Transaction Entries
                                                </a>
                                            </li>
                                        </ul>
                                    </li>
                                    <li>
                                        <a class="has-arrow" href="#">
                                            Reports
                                        </a>
                                        <ul>
                                            <li>
                                                <a href="${pageContext.request.contextPath}/accounting/ViewTrialBalance">
                                                    Trail Balance
                                                </a>
                                            </li>
                                            <li>
                                                <a href="${pageContext.request.contextPath}/accounting/ViewBalanceSheet">
                                                    Balance Sheet
                                                </a>
                                            </li>
                                            <li>
                                                <a href="${pageContext.request.contextPath}/accounting/ViewProfitLossIncome">
                                                    Income Statement
                                                </a>
                                            </li>
                                        </ul>
                                    </li>
                                </ul>
                            </li>
                            <li>
                                <a class="has-arrow" href="#">
                                    <i class="fas fa-lg fa-fw fa-wrench"></i>
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
                            <li>
                                <a class="has-arrow" href="#">
                                    <i class="far fa-lg fa-fw fa-object-group"></i>
                                    Static Demo Pages
                                </a>
                                <ul>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/pages/static/home">
                                            <i class="fa fa-lg fa-fw fa-home"></i>
                                            Home
                                        </a>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/pages/static/layout-options">
                                            <i class="fa-lg fa-fw fas fa-sliders-h"></i>
                                            Layout Options
                                        </a>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/pages/static/components-index">
                                            <i class="fa-lg fa-fw fas fa-key"></i>
                                            Components Index
                                        </a>
                                    </li>
                                    <li>
                                        <a class="has-arrow" href="#">
                                            <i class="far fa-lg fa-fw fa-object-group"></i>
                                            Themes
                                        </a>
                                        <ul>
                                            <li>
                                                <a href="${pageContext.request.contextPath}/pages/static/themes/buildin">
                                                    JavaTMP Build-in Themes
                                                </a>
                                            </li>
                                            <li>
                                                <a href="${pageContext.request.contextPath}/pages/static/themes/bootswatch">
                                                    Bootswatch Free Themes
                                                </a>
                                            </li>
                                            <li>
                                                <a href="${pageContext.request.contextPath}/pages/static/themes/devexpress-bs4-themes">
                                                    DevExpress Themes for Bootstrap 4
                                                </a>
                                            </li>
                                        </ul>
                                    </li>
                                    <li>
                                        <a class="has-arrow" href="#">
                                            <i class="far fa-lg fa-fw fa-heart"></i>
                                            Bootstrap
                                        </a>
                                        <ul>
                                            <li>
                                                <a href="${pageContext.request.contextPath}/pages/static/bootstrap/helpers-utilities">
                                                    Helper & Utility Classes
                                                </a>
                                            </li>
                                            <li>
                                                <a href="${pageContext.request.contextPath}/pages/static/bootstrap/info-components">
                                                    Info Theme Color Components
                                                </a>
                                            </li>
                                            <li>
                                                <a href="${pageContext.request.contextPath}/pages/static/bootstrap/components">
                                                    Bootstrap Components
                                                </a>
                                            </li>
                                            <li>
                                                <a href="${pageContext.request.contextPath}/pages/static/bootstrap/grid">
                                                    Bootstrap Grid
                                                </a>
                                            </li>
                                            <li>
                                                <a href="${pageContext.request.contextPath}/pages/static/bootstrap/media-object">
                                                    Media object
                                                </a>
                                            </li>
                                            <li>
                                                <a href="${pageContext.request.contextPath}/pages/static/bootstrap/content">
                                                    Bootstrap Content
                                                </a>
                                            </li>
                                            <li>
                                                <a href="${pageContext.request.contextPath}/pages/static/bootstrap/buttons">
                                                    Bootstrap Buttons
                                                </a>
                                            </li>
                                            <li>
                                                <a href="${pageContext.request.contextPath}/pages/static/bootstrap/button-group">
                                                    Bootstrap Button group
                                                </a>
                                            </li>
                                            <li>
                                                <a href="${pageContext.request.contextPath}/pages/static/bootstrap/card">
                                                    Bootstrap Card
                                                </a>
                                            </li>
                                            <li>
                                                <a href="${pageContext.request.contextPath}/pages/static/bootstrap/carousel">
                                                    Bootstrap Carousel
                                                </a>
                                            </li>
                                            <li>
                                                <a href="${pageContext.request.contextPath}/pages/static/bootstrap/dropdown">
                                                    Bootstrap Dropdown
                                                </a>
                                            </li>
                                            <li>
                                                <a href="${pageContext.request.contextPath}/pages/static/bootstrap/forms">
                                                    Bootstrap Forms
                                                </a>
                                            </li>
                                            <li>
                                                <a href="${pageContext.request.contextPath}/pages/static/bootstrap/input-group">
                                                    Bootstrap Input Group
                                                </a>
                                            </li>
                                            <li>
                                                <a href="${pageContext.request.contextPath}/pages/static/bootstrap/list-group">
                                                    Bootstrap List Group
                                                </a>
                                            </li>
                                            <li>
                                                <a href="${pageContext.request.contextPath}/pages/static/bootstrap/modal">
                                                    Bootstrap Modal
                                                </a>
                                            </li>
                                            <li>
                                                <a href="${pageContext.request.contextPath}/pages/static/bootstrap/navs">
                                                    Bootstrap Navs
                                                </a>
                                            </li>
                                            <li>
                                                <a href="${pageContext.request.contextPath}/pages/static/bootstrap/navbar">
                                                    Bootstrap Navbar
                                                </a>
                                            </li>
                                            <li>
                                                <a href="${pageContext.request.contextPath}/pages/static/bootstrap/scrollspy">
                                                    Bootstrap Scrollspy
                                                </a>
                                            </li>
                                            <li>
                                                <a href="${pageContext.request.contextPath}/pages/static/bootstrap/spinners">
                                                    Bootstrap Spinners
                                                </a>
                                            </li>
                                            <li>
                                                <a href="${pageContext.request.contextPath}/pages/static/bootstrap/toasts">
                                                    Bootstrap Toasts
                                                </a>
                                            </li>
                                        </ul>
                                    </li>
                                    <li>
                                        <a href="#" class="has-arrow">
                                            <i class="far fa-lg fa-fw fa-user-circle"></i>
                                            Icons
                                        </a>
                                        <ul aria-expanded="true">
                                            <li>
                                                <a href="${pageContext.request.contextPath}/pages/static/icon/font_awesome_icons">
                                                    Font Awesome Icons
                                                </a>
                                            </li>
                                            <li>
                                                <a href="${pageContext.request.contextPath}/pages/static/icon/font_awesome_animation_icon">
                                                    Font Awesome Animation
                                                </a>
                                            </li>
                                            <li>
                                                <a href="${pageContext.request.contextPath}/pages/static/icon/material-icons">
                                                    Material Design icons by Google
                                                </a>
                                            </li>
                                        </ul>
                                    </li>
                                    <li>
                                        <a class="has-arrow" href="#">
                                            <i class="far fa-lg fa-fw fa-lightbulb"></i>
                                            Custom Components
                                        </a>
                                        <ul aria-expanded="true">
                                            <li>
                                                <a class="has-arrow" href="#">
                                                    Color Combinations
                                                </a>
                                                <ul aria-expanded="true">
                                                    <li>
                                                        <a href="${pageContext.request.contextPath}/pages/static/custom-components/color/color-palette-combinations">
                                                            Color Palette Combinations
                                                        </a>
                                                    </li>
                                                    <li>
                                                        <a href="${pageContext.request.contextPath}/pages/static/custom-components/color/8-color-combinations">
                                                            8 colors combinations
                                                        </a>
                                                    </li>
                                                    <li>
                                                        <a href="${pageContext.request.contextPath}/pages/static/custom-components/color/100-color-combinations">
                                                            100 colors combinations
                                                        </a>
                                                    </li>
                                                </ul>
                                            </li>
                                            <li>
                                                <a class="has-arrow" href="#">
                                                    Menu
                                                </a>
                                                <ul aria-expanded="true">
                                                    <li>
                                                        <a href="${pageContext.request.contextPath}/pages/static/custom-components/menu/custom-bootstrap-dropdown-button">
                                                            Custom Bootstrap Dropdown Button
                                                        </a>
                                                    </li>
                                                    <li>
                                                        <a href="${pageContext.request.contextPath}/pages/static/custom-components/menu/horizontal-mega-menu">
                                                            Yamm Horizontal Mega Menu
                                                        </a>
                                                    </li>
                                                    <li>
                                                        <a href="${pageContext.request.contextPath}/pages/static/custom-components/menu/bootstrap-dropdown-hover">
                                                            Bootstrap Dropdown Hover
                                                        </a>
                                                    </li>
                                                    <li>
                                                        <a href="${pageContext.request.contextPath}/pages/static/custom-components/menu/bootstrap-multilevel-dropdown-hover">
                                                            Bootstrap Multilevel Dropdown Hover
                                                        </a>
                                                    </li>
                                                    <li>
                                                        <a href="${pageContext.request.contextPath}/pages/static/custom-components/menu/scrollable-bootstrap-dropdown">
                                                            Scrollable Bootstrap Dropdown
                                                        </a>
                                                    </li>
                                                </ul>
                                            </li>
                                            <li>
                                                <a href="${pageContext.request.contextPath}/pages/static/custom-components/dashboard-stats">
                                                    Dashboard Stats
                                                </a>
                                            </li>
                                            <li>
                                                <a href="${pageContext.request.contextPath}/pages/static/custom-components/dashboard-chart-stats">
                                                    Dashboard Chart Stats
                                                </a>
                                            </li>
                                            <li>
                                                <a href="${pageContext.request.contextPath}/pages/static/custom-components/bootstrap-steps">
                                                    Bootstrap Steps
                                                </a>
                                            </li>
                                            <li>
                                                <a href="${pageContext.request.contextPath}/pages/static/custom-components/sortable-cards">
                                                    Sortable Cards
                                                </a>
                                            </li>
                                            <li>
                                                <a href="${pageContext.request.contextPath}/pages/static/custom-components/extended-color-button">
                                                    Extended Color Button
                                                </a>
                                            </li>
                                            <li>
                                                <a href="${pageContext.request.contextPath}/pages/static/custom-components/extended-color-outline-button">
                                                    Extended Color Outline Button
                                                </a>
                                            </li>
                                        </ul>
                                    </li>
                                    <li>
                                        <a class="has-arrow" href="#">
                                            <i class="far fa-lg fa-fw fa-gem"></i>
                                            Plugins
                                        </a>
                                        <ul aria-expanded="true">
                                            <li>
                                                <a class="has-arrow" href="#">
                                                    Tree
                                                </a>
                                                <ul aria-expanded="true">
                                                    <li>
                                                        <a class="has-arrow" href="#">
                                                            Fancytree
                                                        </a>
                                                        <ul aria-expanded="true">
                                                            <li>
                                                                <a href="${pageContext.request.contextPath}/pages/static/plugins/tree/fancytree/plain_fancytree">
                                                                    Plain Fancytree
                                                                </a>
                                                            </li>
                                                            <li>
                                                                <a href="${pageContext.request.contextPath}/pages/static/plugins/tree/fancytree/table_fancytree">
                                                                    Table Fancytree
                                                                </a>
                                                            </li>
                                                            <li>
                                                                <a href="${pageContext.request.contextPath}/pages/static/plugins/tree/fancytree/checkboxes_fancytree">
                                                                    Checkboxes fancytree
                                                                </a>
                                                            </li>
                                                            <li>
                                                                <a href="${pageContext.request.contextPath}/pages/static/plugins/tree/fancytree/radio_buttons_fancytree">
                                                                    Radio Buttons fancytree
                                                                </a>
                                                            </li>
                                                            <li>
                                                                <a href="${pageContext.request.contextPath}/pages/static/plugins/tree/fancytree/contextMenu_fancytree">
                                                                    ContextMenu fancytree
                                                                </a>
                                                            </li>
                                                            <li>
                                                                <a href="${pageContext.request.contextPath}/pages/static/plugins/tree/fancytree/drag-and-drop-fancytree">
                                                                    Drag-and-Drop Fancytree
                                                                </a>
                                                            </li>
                                                            <li>
                                                                <a href="${pageContext.request.contextPath}/pages/static/plugins/tree/fancytree/filter-ext-fancytree">
                                                                    Filter Ext Fancytree
                                                                </a>
                                                            </li>
                                                        </ul>
                                                    </li>
                                                </ul>
                                            </li>
                                            <li>
                                                <a class="has-arrow" href="#">
                                                    Alerts & Notifications
                                                </a>
                                                <ul aria-expanded="true">
                                                    <li>
                                                        <a href="${pageContext.request.contextPath}/pages/static/plugins/alert-notification/jQuery-toastr-notification">
                                                            jQuery Toastr Notifications
                                                        </a>
                                                    </li>
                                                    <li>
                                                        <a href="${pageContext.request.contextPath}/pages/static/plugins/alert-notification/block-ui-plugin">
                                                            Block UI Plugin
                                                        </a>
                                                    </li>
                                                    <li>
                                                        <a href="${pageContext.request.contextPath}/pages/static/plugins/alert-notification/dynamic-bootstrap-alerts">
                                                            Dynamic Bootstrap Alerts
                                                        </a>
                                                    </li>
                                                    <li>
                                                        <a href="${pageContext.request.contextPath}/pages/static/plugins/alert-notification/idle-timer">
                                                            Idle Timer Plugin
                                                        </a>
                                                    </li>
                                                </ul>
                                            </li>
                                            <li>
                                                <a class="has-arrow" href="#">
                                                    Calendar
                                                </a>
                                                <ul aria-expanded="true">
                                                    <li>
                                                        <a href="${pageContext.request.contextPath}/pages/static/plugins/calendar/jQuery-fullcalendar">
                                                            jQuery FullCalendar
                                                        </a>
                                                    </li>
                                                    <li>
                                                        <a href="${pageContext.request.contextPath}/pages/static/plugins/calendar/jQuery-fullcalendar-event-popup">
                                                            jQuery FullCalendar 1
                                                        </a>
                                                    </li>
                                                    <li>
                                                        <a href="${pageContext.request.contextPath}/pages/static/plugins/calendar/jQuery-fullcalendar-constraint">
                                                            jQuery FullCalendar Constraint
                                                        </a>
                                                    </li>
                                                    <li>
                                                        <a href="${pageContext.request.contextPath}/pages/static/plugins/calendar/jQuery-fullcalendar-year">
                                                            jQuery FullCalendar Year
                                                        </a>
                                                    </li>
                                                </ul>
                                            </li>
                                            <li>
                                                <a href="${pageContext.request.contextPath}/pages/static/plugins/bootstrap-date-range-picker">
                                                    Bootstrap Date Range Picker
                                                </a>
                                            </li>
                                            <li>
                                                <a href="${pageContext.request.contextPath}/pages/static/plugins/bootstrap-colorselector">
                                                    Bootstrap Color Selector
                                                </a>
                                            </li>
                                            <li>
                                                <a href="${pageContext.request.contextPath}/pages/static/plugins/jQuery-select2-bootstrap">
                                                    jQuery Bootstrap Select2 complete demo
                                                </a>
                                            </li>
                                            <li>
                                                <a href="${pageContext.request.contextPath}/pages/static/plugins/bootstrap-maxlength">
                                                    Bootstrap Maxlength
                                                </a>
                                            </li>
                                            <li>
                                                <a href="${pageContext.request.contextPath}/pages/static/plugins/form-textarea-autosize">
                                                    Form Textarea Autosize
                                                </a>
                                            </li>
                                            <li>
                                                <a href="${pageContext.request.contextPath}/pages/static/plugins/bootstrap-summernote-editor">
                                                    Bootstrap Summernote Editor
                                                </a>
                                            </li>
                                            <li>
                                                <a href="${pageContext.request.contextPath}/pages/static/plugins/ion-rangeSlider">
                                                    Ion Range Slider
                                                </a>
                                            </li>
                                            <li>
                                                <a href="${pageContext.request.contextPath}/pages/static/plugins/bootstrap-slider">
                                                    bootstrap-slider Plugin
                                                </a>
                                            </li>
                                            <li>
                                                <a href="${pageContext.request.contextPath}/pages/static/plugins/cropper-image-cropping">
                                                    Cropper - Image Cropping Plugin for jQuery
                                                </a>
                                            </li>
                                            <li>
                                                <a href="${pageContext.request.contextPath}/pages/static/plugins/jQuery-ScrollUp">
                                                    jQuery ScrollUp Plugin
                                                </a>
                                            </li>
                                            <li>
                                                <a href="${pageContext.request.contextPath}/pages/static/plugins/jquery.counterup">
                                                    jQuery CounterUp Plugin
                                                </a>
                                            </li>
                                            <li>
                                                <a href="${pageContext.request.contextPath}/pages/static/plugins/bootstrap-dual-select">
                                                    Bootstrap Dual Select
                                                </a>
                                            </li>
                                            <li>
                                                <a href="${pageContext.request.contextPath}/pages/static/plugins/jQuery-timeago">
                                                    jQuery timeago plugin
                                                </a>
                                            </li>
                                            <li>
                                                <a href="${pageContext.request.contextPath}/pages/static/plugins/malihu-custom-scrollbar-plugin">
                                                    Malihu Custom Scrollbar Plugin
                                                </a>
                                            </li>
                                            <li>
                                                <a href="${pageContext.request.contextPath}/pages/static/plugins/bootstrap-modal-wrapper">
                                                    Bootstrap Modal Wrapper Plugin
                                                </a>
                                            </li>
                                            <li>
                                                <a href="${pageContext.request.contextPath}/pages/static/plugins/bootstrap-contextMenu">
                                                    Bootstrap ContextMenu Plugin
                                                </a>
                                            </li>
                                            <li>
                                                <a href="${pageContext.request.contextPath}/pages/static/plugins/moment.js">
                                                    Moment.js Date/Time Plugin
                                                </a>
                                            </li>
                                            <li>
                                                <a href="${pageContext.request.contextPath}/pages/static/plugins/Handlebars.js">
                                                    Handlebars.js template plugin
                                                </a>
                                            </li>
                                            <li>
                                                <a href="${pageContext.request.contextPath}/pages/static/plugins/metisMenu">
                                                    Metis Menu plugin
                                                </a>
                                            </li>
                                            <li>
                                                <a href="${pageContext.request.contextPath}/pages/static/plugins/jquery.easing">
                                                    jQuery Easing plugin
                                                </a>
                                            </li>
                                            <li>
                                                <a href="${pageContext.request.contextPath}/pages/static/plugins/animate-on-scroll">
                                                    AOS - Animate On Scroll
                                                </a>
                                            </li>
                                            <li>
                                                <a href="${pageContext.request.contextPath}/pages/static/plugins/animate.css">
                                                    Animate.css
                                                </a>
                                            </li>
                                            <li>
                                                <a href="${pageContext.request.contextPath}/pages/static/plugins/twbs-pagination">
                                                    jQuery Bootstrap Pagination
                                                </a>
                                            </li>
                                            <li>
                                                <a href="${pageContext.request.contextPath}/pages/static/plugins/simple-input-spinner">
                                                    Simple Input Spinner
                                                </a>
                                            </li>
                                            <li>
                                                <a href="${pageContext.request.contextPath}/pages/static/plugins/bootstrap-input-spinner">
                                                    Bootstrap Input Spinner Plugin
                                                </a>
                                            </li>
                                            <li>
                                                <a href="${pageContext.request.contextPath}/pages/static/plugins/jQuery-QueryBuilder">
                                                    jQuery QueryBuilder
                                                </a>
                                            </li>
                                        </ul>
                                    </li>
                                    <li>
                                        <a class="has-arrow" href="#">
                                            <i class="far fa-lg fa-fw fa-edit"></i>
                                            Forms
                                        </a>
                                        <ul aria-expanded="true">
                                            <li>
                                                <a href="${pageContext.request.contextPath}/pages/static/form/basic-form-validation">
                                                    Basic HTML5 Form Validation
                                                </a>
                                            </li>
                                            <li>
                                                <a href="${pageContext.request.contextPath}/pages/static/form/jQuery-form-validation">
                                                    jQuery Form Validation
                                                </a>
                                            </li>
                                            <li>
                                                <a href="${pageContext.request.contextPath}/pages/static/form/form-input-mask">
                                                    Form Input Mask
                                                </a>
                                            </li>
                                            <li>
                                                <a href="${pageContext.request.contextPath}/pages/static/form/jQuery-form-plugin">
                                                    jQuery Form Plugin
                                                </a>
                                            </li>
                                        </ul>
                                    </li>
                                    <li>
                                        <a class="has-arrow" href="#">
                                            <i class="far fa-lg fa-fw fa-clone"></i>
                                            Wizards
                                        </a>
                                        <ul aria-expanded="true">
                                            <li>
                                                <a class="has-arrow" href="#">
                                                    Native Bootstrap Tab
                                                </a>
                                                <ul aria-expanded="true">
                                                    <li>
                                                        <a href="${pageContext.request.contextPath}/pages/static/wizard/native-bootstrap-tab/default-bootstrap-pill-wizard">
                                                            Default Bootstrap Pill Wizard
                                                        </a>
                                                    </li>
                                                    <li>
                                                        <a href="${pageContext.request.contextPath}/pages/static/wizard/native-bootstrap-tab/disabled-bootstrap-pill-wizard">
                                                            Disabled Bootstrap Pill Wizard
                                                        </a>
                                                    </li>
                                                    <li>
                                                        <a href="${pageContext.request.contextPath}/pages/static/wizard/native-bootstrap-tab/modal-bootstrap-pill-wizard">
                                                            Modal Bootstrap Pill Wizard
                                                        </a>
                                                    </li>
                                                    <li>
                                                        <a href="${pageContext.request.contextPath}/pages/static/wizard/native-bootstrap-tab/vertical-modal-bootstrap-pill-wizard">
                                                            Vertical Modal Bootstrap Pill Wizard
                                                        </a>
                                                    </li>
                                                    <li>
                                                        <a href="${pageContext.request.contextPath}/pages/static/wizard/native-bootstrap-tab/ajax-bootstrap-pill-wizard">
                                                            Ajax Modal Bootstrap Pill Wizard
                                                        </a>
                                                    </li>
                                                    <li>
                                                        <a href="${pageContext.request.contextPath}/pages/static/wizard/native-bootstrap-tab/vertical-validation-bootstrap-pill-wizard">
                                                            Vertical Validation Bootstrap Pill Wizard
                                                        </a>
                                                    </li>
                                                    <li>
                                                        <a href="${pageContext.request.contextPath}/pages/static/wizard/native-bootstrap-tab/horizontal-validation-bootstrap-pill-wizard">
                                                            Horizontal Validation Bootstrap Pill Wizard
                                                        </a>
                                                    </li>
                                                </ul>
                                            </li>
                                        </ul>
                                    </li>
                                    <li>
                                        <a class="has-arrow" href="#">
                                            <i class="far fa-lg fa-fw fa-list-alt"></i>
                                            Tables
                                        </a>
                                        <ul>
                                            <li>
                                                <a href="${pageContext.request.contextPath}/pages/static/table/bootstrap-table">
                                                    Bootstrap Table
                                                </a>
                                            </li>
                                            <li>
                                                <a href="${pageContext.request.contextPath}/pages/static/table/scrollable-fixed-bootstrap-table">
                                                    Scrollable Fixed Bootstrap Table
                                                </a>
                                            </li>
                                            <li>
                                                <a href="${pageContext.request.contextPath}/pages/static/table/dynamic-sortable-table">
                                                    Dynamic Sortable Table
                                                </a>
                                            </li>
                                            <li>
                                                <a class="has-arrow" href="#">
                                                    DataTables Plugin

                                                </a>
                                                <ul aria-expanded="true">
                                                    <li>
                                                        <a href="${pageContext.request.contextPath}/pages/static/table/datatable/defalut-datatables-bootstrap-4">
                                                            Defalut Datatables Bootstrap 4 theme
                                                        </a>
                                                    </li>
                                                    <li>
                                                        <a href="${pageContext.request.contextPath}/pages/static/table/datatable/defalut-datatables-fixedcolumn-with-key-navigation">
                                                            Datatables Bootstrap Fixed Column with key navigation
                                                        </a>
                                                    </li>
                                                    <li>
                                                        <a href="${pageContext.request.contextPath}/pages/static/table/datatable/defalut-datatables-row-grouping">
                                                            Datatables Bootstrap Row Grouping
                                                        </a>
                                                    </li>
                                                    <li>
                                                        <a href="${pageContext.request.contextPath}/pages/static/table/datatable/responsive-datatables-bootstrap-4">
                                                            Responsive Datatables Bootstrap 4 theme
                                                        </a>
                                                    </li>
                                                    <li>
                                                        <a href="${pageContext.request.contextPath}/pages/static/table/datatable/fixedHeader-datatables-bootstrap-4">
                                                            FixedHeader Datatables Bootstrap 4 theme
                                                        </a>
                                                    </li>
                                                    <li>
                                                        <a href="${pageContext.request.contextPath}/pages/static/table/datatable/scrollable-datatables">
                                                            Scrollable DataTable
                                                        </a>
                                                    </li>
                                                    <li>
                                                        <a href="${pageContext.request.contextPath}/pages/static/table/datatable/selectable-datatables-bootstrap-4">
                                                            Selectable DataTable
                                                        </a>
                                                    </li>
                                                    <li>
                                                        <a href="${pageContext.request.contextPath}/pages/static/table/datatable/checkbox-selection-datatables-bootstrap-4">
                                                            Checkbox selection
                                                        </a>
                                                    </li>
                                                    <li>
                                                        <a href="${pageContext.request.contextPath}/pages/static/table/datatable/row-selection-using-checkboxes">
                                                            Row selection using checkboxes
                                                        </a>
                                                    </li>
                                                    <li>
                                                        <a href="${pageContext.request.contextPath}/pages/static/table/datatable/individual-column-searching">
                                                            Dropdown column searching
                                                        </a>
                                                    </li>
                                                    <li>
                                                        <a href="${pageContext.request.contextPath}/pages/static/table/datatable/textfield-column-searching">
                                                            Textfield column searching
                                                        </a>
                                                    </li>
                                                    <li>
                                                        <a href="${pageContext.request.contextPath}/pages/static/table/datatable/datatables-footer-summary">
                                                            Datatables with Footer Summary
                                                        </a>
                                                    </li>
                                                    <li>
                                                        <a href="${pageContext.request.contextPath}/pages/static/table/datatable/datatables-cell-edit">
                                                            Datatables Cell Edit
                                                        </a>
                                                    </li>
                                                    <li>
                                                        <a href="${pageContext.request.contextPath}/pages/static/table/datatable/dynamic-datatables-creation">
                                                            Datatables Dynamic Creation
                                                        </a>
                                                    </li>
                                                </ul>
                                            </li>
                                        </ul>
                                    </li>
                                    <li>
                                        <a class="has-arrow" href="#">
                                            <i class="far fa-lg fa-fw fa-chart-bar"></i>
                                            Charts
                                        </a>
                                        <ul aria-expanded="true">
                                            <li>
                                                <a href="${pageContext.request.contextPath}/pages/static/chart/echarts">
                                                    ECharts
                                                </a>
                                            </li>
                                        </ul>
                                    </li>
                                    <li>
                                        <a class="has-arrow" href="#">
                                            <i class="far fa-lg fa-fw fa-image"></i>
                                            Gallery
                                        </a>
                                        <ul aria-expanded="true">
                                            <li>
                                                <a class="has-arrow" href="#">
                                                    <i class="far fa-lg fa-fw fa-image"></i>
                                                    Carousel
                                                </a>
                                                <ul aria-expanded="true">
                                                    <li>
                                                        <a href="${pageContext.request.contextPath}/pages/static/gallery/carousel/bootstrap-carousel">
                                                            Bootstrap Carousel
                                                        </a>
                                                    </li>
                                                    <li>
                                                        <a href="${pageContext.request.contextPath}/pages/static/gallery/carousel/carousel-product-slider">
                                                            Carousel Product Slider
                                                        </a>
                                                    </li>
                                                    <li>
                                                        <a href="${pageContext.request.contextPath}/pages/static/gallery/carousel/up-tabbed-slider-carousel">
                                                            Up Tabbed Slider Carousel
                                                        </a>
                                                    </li>
                                                    <li>
                                                        <a href="${pageContext.request.contextPath}/pages/static/gallery/carousel/slick-carousel">
                                                            Slick Carousel
                                                        </a>
                                                    </li>
                                                </ul>
                                            </li>
                                            <li>
                                                <a href="${pageContext.request.contextPath}/pages/static/gallery/simple-thumbnail-gallery">
                                                    Simple Thumbnail Gallery
                                                </a>
                                            </li>
                                            <li>
                                                <a href="${pageContext.request.contextPath}/pages/static/gallery/view-image-using-bs-model">
                                                    View Image Using Bootstrap Model
                                                </a>
                                            </li>
                                            <li>
                                                <a href="${pageContext.request.contextPath}/pages/static/gallery/view-image-using-pager-bs-model">
                                                    View Image Using Pager Bootstrap Model
                                                </a>
                                            </li>
                                            <li>
                                                <a href="${pageContext.request.contextPath}/pages/static/gallery/view-image-using-pagination-bs-model">
                                                    View Image Using Pagination Bootstrap Model
                                                </a>
                                            </li>
                                            <li>
                                                <a href="${pageContext.request.contextPath}/pages/static/gallery/action-thumbnail-gallery">
                                                    Action Thumbnail Gallery
                                                </a>
                                            </li>
                                            <li>
                                                <a href="${pageContext.request.contextPath}/pages/static/gallery/tool-thumbnail-gallery">
                                                    Tool Thumbnail Gallery
                                                </a>
                                            </li>
                                            <li>
                                                <a href="${pageContext.request.contextPath}/pages/static/gallery/portfolio-gallery-with-filtering-category">
                                                    Portfolio Gallery with filtering category
                                                </a>
                                            </li>
                                        </ul>
                                    </li>
                                    <li>
                                        <a class="has-arrow" href="#">
                                            <i class="fas fa-lg fa-fw fa-building"></i>
                                            Design Blocks
                                        </a>
                                        <ul>
                                            <li>
                                                <a href="${pageContext.request.contextPath}/pages/static/custom-design-blocks/text-feature-blocks">
                                                    Text Blocks
                                                </a>
                                            </li>
                                            <li>
                                                <a href="${pageContext.request.contextPath}/pages/static/custom-design-blocks/image-text-feature-blocks">
                                                    Image Blocks
                                                </a>
                                            </li>
                                            <li>
                                                <a href="${pageContext.request.contextPath}/pages/static/custom-design-blocks/header-blocks">
                                                    Header Blocks
                                                </a>
                                            </li>
                                            <li>
                                                <a href="${pageContext.request.contextPath}/pages/static/custom-design-blocks/header-image-blocks">
                                                    Header Image Blocks
                                                </a>
                                            </li>
                                            <li>
                                                <a href="${pageContext.request.contextPath}/pages/static/custom-design-blocks/item-listing-blocks">
                                                    Items Listing Blocks
                                                </a>
                                            </li>
                                            <li>
                                                <a href="${pageContext.request.contextPath}/pages/static/custom-design-blocks/call-to-action-blocks">
                                                    Call To Action Blocks
                                                </a>
                                            </li>
                                            <li>
                                                <a href="${pageContext.request.contextPath}/pages/static/custom-design-blocks/testimonials-blocks">
                                                    Testimonials Blocks
                                                </a>
                                            </li>
                                            <li>
                                                <a href="${pageContext.request.contextPath}/pages/static/custom-design-blocks/people-blocks">
                                                    People Blocks
                                                </a>
                                            </li>
                                            <li>
                                                <a href="${pageContext.request.contextPath}/pages/static/custom-design-blocks/prices-blocks">
                                                    Prices Blocks
                                                </a>
                                            </li>
                                            <li>
                                                <a href="${pageContext.request.contextPath}/pages/static/custom-design-blocks/tabs-blocks">
                                                    Tabs Blocks
                                                </a>
                                            </li>
                                            <li>
                                                <a href="${pageContext.request.contextPath}/pages/static/custom-design-blocks/video-blocks">
                                                    Video Blocks
                                                </a>
                                            </li>
                                            <li>
                                                <a href="${pageContext.request.contextPath}/pages/static/custom-design-blocks/contact-us-blocks">
                                                    Contact Us Blocks
                                                </a>
                                            </li>
                                            <li>
                                                <a href="${pageContext.request.contextPath}/pages/static/custom-design-blocks/footer-blocks">
                                                    Footer Blocks
                                                </a>
                                            </li>
                                        </ul>
                                    </li>
                                    <li>
                                        <a class="has-arrow" href="#">
                                            <i class="far fa-lg fa-fw fa-file-alt"></i>
                                            Custom Pages
                                        </a>
                                        <ul>
                                            <li>
                                                <a class="has-arrow" href="#">
                                                    Empty Pages
                                                </a>
                                                <ul>
                                                    <li>
                                                        <a href="${pageContext.request.contextPath}/pages/static/custom-pages/empty-pages/empty-page">
                                                            Empty Page with nothing
                                                        </a>
                                                    </li>
                                                    <li>
                                                        <a href="${pageContext.request.contextPath}/pages/static/custom-pages/empty-pages/blank-page">
                                                            Blank Page with title
                                                        </a>
                                                    </li>
                                                    <li>
                                                        <a href="${pageContext.request.contextPath}/pages/static/custom-pages/empty-pages/two-cols-blank-page">
                                                            Two Columns Blank Page
                                                        </a>
                                                    </li>
                                                    <li>
                                                        <a href="${pageContext.request.contextPath}/pages/static/custom-pages/empty-pages/card-page">
                                                            Card Page
                                                        </a>
                                                    </li>
                                                    <li>
                                                        <a href="${pageContext.request.contextPath}/pages/static/custom-pages/empty-pages/event-page">
                                                            Page with standard event handling
                                                        </a>
                                                    </li>
                                                </ul>
                                            </li>
                                            <li>
                                                <a class="has-arrow" href="#">
                                                    Dashboard Pages
                                                </a>
                                                <ul aria-expanded="true">
                                                    <li>
                                                        <a href="${pageContext.request.contextPath}/pages/static/custom-pages/dashboard/users-dashboard-1">
                                                            Users Dashboard 1
                                                        </a>
                                                    </li>
                                                </ul>
                                            </li>
                                            <li>
                                                <a class="has-arrow" href="#">
                                                    Inbox
                                                </a>
                                                <ul aria-expanded="true">

                                                    <li>
                                                        <a href="${pageContext.request.contextPath}/pages/static/custom-pages/inbox/inbox-messages">
                                                            Inbox Messages
                                                        </a>
                                                    </li>
                                                    <li>
                                                        <a action-name="compose-page" href="${pageContext.request.contextPath}/pages/static/custom-pages/inbox/compose-message">
                                                            Compose Message
                                                        </a>
                                                    </li>
                                                    <li>
                                                        <a action-name="view-message" href="${pageContext.request.contextPath}/pages/static/custom-pages/inbox/view-message">
                                                            View Message
                                                        </a>
                                                    </li>
                                                </ul>
                                            </li>
                                            <li>
                                                <a class="has-arrow" href="#">
                                                    Landing Pages
                                                </a>
                                                <ul>
                                                    <li>
                                                        <a target="_blank"  href="${pageContext.request.contextPath}/pages/static/custom-pages/landing-pages/landing-empty-starter">
                                                            Landing Empty Starter
                                                        </a>
                                                    </li>
                                                    <li>
                                                        <a target="_blank"  href="${pageContext.request.contextPath}/pages/static/custom-pages/landing-pages/landing-empty-starter-ar">
                                                            Landing Empty RTL Starter
                                                        </a>
                                                    </li>
                                                    <li>
                                                        <a target="_blank"  href="${pageContext.request.contextPath}/pages/static/custom-pages/landing-pages/landing-sections-starter">
                                                            Landing Sections Starter
                                                        </a>
                                                    </li>
                                                    <li>
                                                        <a target="_blank"  href="${pageContext.request.contextPath}/pages/static/custom-pages/landing-pages/landing-content-starter">
                                                            Landing Content Starter
                                                        </a>
                                                    </li>
                                                </ul>
                                            </li>
                                            <li>
                                                <a class="has-arrow" href="#">
                                                    Login Pages
                                                </a>
                                                <ul>
                                                    <li>
                                                        <a action-name="login-page" target="_blank"  href="${pageContext.request.contextPath}/pages/static/custom-pages/login-pages/default-login-page">
                                                            Default Login Page
                                                        </a>
                                                    </li>
                                                </ul>
                                            </li>
                                            <li>
                                                <a class="has-arrow" href="#">
                                                    Two Columns Layout
                                                </a>
                                                <ul>
                                                    <li>
                                                        <a target="_blank"  href="${pageContext.request.contextPath}/pages/static/custom-pages/two-columns-layout/implementing-two-columns-fixed-fluid-layout-in-bootstrap-4">
                                                            Implementing Two Columns Fixed Fluid Layout
                                                        </a>
                                                    </li>
                                                    <li>
                                                        <a target="_blank"  href="${pageContext.request.contextPath}/pages/static/custom-pages/two-columns-layout/collapsible-fixed-sidebar-in-bootstrap-4-using-navbar-toggler-button">
                                                            Collapsible Fixed Sidebar Using Navbar Toggler Button
                                                        </a>
                                                    </li>
                                                    <li>
                                                        <a target="_blank"  href="${pageContext.request.contextPath}/pages/static/custom-pages/two-columns-layout/off-canvas-sliding-fixed-sidebar-in-bootstrap-4-using-css-transition">
                                                            Off Canvas Sliding Fixed Sidebar Using CSS Transition
                                                        </a>
                                                    </li>
                                                    <li>
                                                        <a target="_blank"  href="${pageContext.request.contextPath}/pages/static/custom-pages/two-columns-layout/off-canvas-sliding-fixed-sidebar-in-bootstrap-4-using-css-transition-on-mouse-hover">
                                                            Off Canvas Sliding Fixed Sidebar Using CSS Transition On Mouse Hover
                                                        </a>
                                                    </li>
                                                    <li>
                                                        <a target="_blank"  href="${pageContext.request.contextPath}/pages/static/custom-pages/two-columns-layout/on-canvas-sliding-hidden-fixed-sidebar-in-bootstrap-4-on-mouse-hover">
                                                            On-canvas Sliding Hidden Fixed Sidebar In On Mouse Hover
                                                        </a>
                                                    </li>
                                                </ul>
                                            </li>
                                            <li>
                                                <a class="has-arrow" href="#">
                                                    Invoices Templates
                                                </a>
                                                <ul>
                                                    <li>
                                                        <a href="${pageContext.request.contextPath}/pages/static/custom-pages/invoice/create-invoice-form">
                                                            Create Invoice Form
                                                        </a>
                                                    </li>
                                                    <li>
                                                        <a href="${pageContext.request.contextPath}/pages/static/custom-pages/invoice/invoice-template-1">
                                                            Invoice Template 1
                                                        </a>
                                                    </li>
                                                    <li>
                                                        <a href="${pageContext.request.contextPath}/pages/static/custom-pages/invoice/invoice-template-2">
                                                            Invoice Template 2
                                                        </a>
                                                    </li>
                                                </ul>
                                            </li>
                                            <li>
                                                <a href="${pageContext.request.contextPath}/pages/static/custom-pages/todo-list">
                                                    ToDo App
                                                </a>
                                            </li>
                                            <li>
                                                <a href="${pageContext.request.contextPath}/pages/static/custom-pages/menu-template">
                                                    Menu Template Page
                                                </a>
                                            </li>
                                            <li>
                                                <a target="_blank" href="${pageContext.request.contextPath}/pages/static/custom-pages/404-page">
                                                    404 Page
                                                </a>
                                            </li>
                                            <li>
                                                <a href="${pageContext.request.contextPath}/pages/static/custom-pages/form-templates">
                                                    Form templates
                                                </a>
                                            </li>
                                        </ul>
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
                <a href="http://www.javatmp.com" target="_blank"><span>&copy; 2019 javatmp.com</span></a>
            </div>
        </div>
        <div id="global-label-items-block" class="d-none">
            <c:forEach items="${labels.keySet()}" var="entry">
                <i k="${entry}">${labels[entry]}</i>
            </c:forEach>
        </div>
        <script src="${pageContext.request.contextPath}/assets/dist/js/javatmp-plugins-all.min.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/assets/dist/js/javatmp-plugins-all-locale-${sessionScope.user.lang}.min.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/assets/dist/js/javatmp.min.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/assets/app/js/javatmp.plugins.wrapper.js?v=53" type="text/javascript"></script>
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
                    labels: {},
                    locale: "${sessionScope.user.lang}",
                    defaultSelectPlaceholder: "Kindly Select",
                    defaultAjaxErrorMessage: "Error During Communicating with the remote server",
                    defaultAjaxErrorTitle: "Ajax Error",
                    javaTmpContainerRemoveEventName: "javatmp-container-remove",
                    javaTmpAjaxContainerReady: "javatmp-ajax-container-ready",
                    httpMethod: "GET",
                    dataType: "html",
                    defaultLoadingText: "Loading ..."
                };

                $("#global-label-items-block > i[k]").each(function (index, element) {
                    var key = $(element).attr("k");
                    var value = $(element).html();
                    defaults.labels[key] = value;
                });
                defaults.defaultSelectPlaceholder = defaults.labels['page.text.kindlySelect'];
                defaults.defaultAjaxErrorMessage = defaults.labels["dialog.error.message"];
                defaults.defaultAjaxErrorTitle = defaults.labels["dialog.error.title"];
                defaults.defaultLoadingText = defaults.labels["global.loadingText"];
                index.init(defaults);

                javatmp.plugins.init(defaults);

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
                                action: function (button, buttonData, originalEvent) {
                                    this.hide();
                                }
                            },
                            {
                                label: "${labels['globa.redirectToLoginPage']}",
                                cssClass: "btn btn-danger",
                                action: function (button, buttonData, originalEvent) {
                                    this.hide();
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
