<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="${labels["global.language"]}" dir="${labels["global.direction"]}">
    <head>
        <title>JavaTMP - Java Bootstrap Admin and Dashboard Template</title>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link href="${pageContext.request.contextPath}/assets/dist/css/javatmp-plugins-all.min.css" rel="stylesheet" type="text/css"/>
        <link href='${pageContext.request.contextPath}/assets/dist/css/javatmp-plugins-print-all.min.css' rel='stylesheet' media='print' />

        <c:if test="${labels['global.direction'] == 'ltr'}">
            <link id="themeStyleSheet" href="${pageContext.request.contextPath}/assets/dist/css/javatmp-${sessionScope.user.theme}.min.css" rel="stylesheet" type="text/css"/>
        </c:if>
        <c:if test="${labels['global.direction'] == 'rtl'}">
            <link id="themeStyleSheet" href="${pageContext.request.contextPath}/assets/dist/css/javatmp-${sessionScope.user.theme}-rtl.min.css" rel="stylesheet" type="text/css"/>
        </c:if>
    </head>
    <body class="sidebar-active">
        <div id="oneTimeOverlay" style="position: fixed;width: 100%;height: 100%;top: 0px;left: 0;right: 0;bottom: 0;background-color: rgba(255,255,255,1);z-index: 1000000;cursor: wait;">Loading ...</div>
        <nav class="main-javatmp-navbar navbar fixed-top my-0 py-0">
            <a class="navbar-brand mr-auto py-0 d-none d-md-inline" href="${pageContext.request.contextPath}/">
                <span class="d-xl-none d-lg-none d-sm-inline">${labels['global.system.name.short']}</span>
                <span class="d-none d-lg-inline">${labels['global.system.name.long']}</span>
            </a>
            <ul class="main-navbar-menu nav ml-auto">
                <li class="nav-item py-0 dropdown d-none d-sm-inline">
                    <a class="nav-link dropdown-toggle faa-parent animated-hover" data-toggle="dropdown" href="">
                        <i class="fa fa-globe fa-lg faa-spin"></i>
                        <span class="d-none d-lg-inline">${labels['global.navbar.lang.current']}</span>
                    </a>
                    <ul class="dropdown-menu">
                        <li class="${sessionScope.user.lang == 'en' ? 'disabled' : ''}">
                            <a class="dropdown-item ${sessionScope.user.lang == 'en' ? 'disabled' : ''}" href="${pageContext.request.contextPath}/updateLanguage?lang=en">
                                <div>
                                    <img src="${pageContext.request.contextPath}/assets/img/flags/us.png" class="" alt="">
                                    ${labels['global.navbar.lang.en']}
                                </div>
                            </a>
                        </li>
                        <li class="${sessionScope.user.lang == 'ar' ? 'disabled' : ''}">
                            <a class="dropdown-item ${sessionScope.user.lang == 'ar' ? 'disabled' : ''}" href="${pageContext.request.contextPath}/updateLanguage?lang=ar">
                                <div>
                                    <img src="${pageContext.request.contextPath}/assets/img/flags/sa.png" class="" alt="">
                                    ${labels['global.navbar.lang.ar']}
                                </div>
                            </a>
                        </li>
                    </ul>
                </li>
                <li class="nav-item py-0 dropdown mega-on-sm">
                    <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-envelope fa-lg faa-shake animated"></i>
                        <span class="badge badge-danger d-none d-md-inline">99+</span>
                    </a>
                    <div class="dropdown-menu dropdown-menu-extender">
                        <div class="dropdown-menu-header clearfix">
                            <i class="fa fa-lg fa-fw fa-envelope"></i>5 Messages
                            <a actionType="ajax-model"
                               href="${pageContext.request.contextPath}/pages/custom-pages/inbox/ajax/ajax-compose-message"
                               class="float-right small">
                                Create New Message
                            </a>
                        </div>
                        <div class="dropdown-menu-content scroll-content">
                            <div class="list-group list-group-flush">
                                <a actionType="ajax-model"
                                   href="${pageContext.request.contextPath}/pages/custom-pages/inbox/ajax/ajax-view-message"
                                   class="list-group-item list-group-item-action">
                                    <div>
                                        <strong>John Smith</strong>
                                        <span class="float-right text-muted">
                                            <em>Yesterday</em>
                                        </span>
                                    </div>
                                    <div>Lorem ipsum dolor sit amet adipis dolor sit elit ipsum dolor sit elit ...</div>
                                </a>
                                <a actionType="ajax-model"
                                   href="${pageContext.request.contextPath}/pages/custom-pages/inbox/ajax/ajax-view-message"
                                   class="list-group-item list-group-item-action">
                                    <div>
                                        <strong>John Smith</strong>
                                        <span class="float-right text-muted">
                                            <em>Yesterday</em>
                                        </span>
                                    </div>
                                    <div>Lorem ipsum dolor sit amet adipis dolor sit elit ipsum dolor sit elit ...</div>
                                </a>
                                <a actionType="ajax-model"
                                   href="${pageContext.request.contextPath}/pages/custom-pages/inbox/ajax/ajax-view-message"
                                   class="list-group-item list-group-item-action">
                                    <div>
                                        <strong>John Smith</strong>
                                        <span class="float-right text-muted">
                                            <em>Yesterday</em>
                                        </span>
                                    </div>
                                    <div>Lorem ipsum dolor sit amet adipis dolor sit elit ipsum dolor sit elit ...</div>
                                </a>
                                <a actionType="ajax-model"
                                   href="${pageContext.request.contextPath}/pages/custom-pages/inbox/ajax/ajax-view-message"
                                   class="list-group-item list-group-item-action">
                                    <div>
                                        <strong>John Smith</strong>
                                        <span class="float-right text-muted">
                                            <em>Yesterday</em>
                                        </span>
                                    </div>
                                    <div>Lorem ipsum dolor sit amet adipis dolor sit elit ipsum dolor sit elit ...</div>
                                </a>
                                <a actionType="ajax-model"
                                   href="${pageContext.request.contextPath}/pages/custom-pages/inbox/ajax/ajax-view-message"
                                   class="list-group-item list-group-item-action">
                                    <div>
                                        <strong>John Smith</strong>
                                        <span class="float-right text-muted">
                                            <em>Yesterday</em>
                                        </span>
                                    </div>
                                    <div>Lorem ipsum dolor sit amet adipis dolor sit elit ipsum dolor sit elit ...</div>
                                </a>
                            </div>
                        </div>
                        <div class="dropdown-menu-footer">
                            <a actionType="ajax-model"
                               href="${pageContext.request.contextPath}/pages/custom-pages/inbox/ajax/ajax-inbox-messages"
                               class="" href="#" alt="Read All Messages">
                                <strong>Read All Messages</strong>
                            </a>
                        </div>
                    </div>
                </li>
                <li class="nav-item py-0 dropdown mega-on-sm">
                    <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-lg fa-bars faa-float animated"></i>
                        <span class="badge badge-danger d-none d-md-inline">99+</span>
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
                <li class="nav-item py-0 dropdown mega-on-sm">
                    <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-lg fa-bell faa-ring animated"></i>
                        <span class="badge badge-danger d-none d-md-inline">99+</span>
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
                            <a class="dropdown-item" href="#"><i class="fa fa-lg fa-fw fa-user"></i>User Profile</a>
                        </li>
                        <li>
                            <a class="dropdown-item" href="#"><i class="fa fa-lg fa-fw fa-tasks"></i>User Tasks</a>
                        </li>
                        <li>
                            <a class="dropdown-item" href="#"><i class="far fa-lg fa-fw fa-calendar-alt"></i>User Calendar</a>
                        </li>
                        <li>
                            <a class="dropdown-item" href="#"><i class="fa fa-lg fa-fw fa-inbox"></i>User Inbox</a>
                        </li>
                        <li>
                            <a class="dropdown-item" href="#"><i class="fa fa-lg fa-fw fa-cog"></i>Settings</a>
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
                                    title="${labels['global.sidebar.home']}">
                                <i class="fa fa-home fa-fw"></i>
                            </button>
                            <button class="btn btn-primary"
                                    actionType="action-ref-href"
                                    action-ref-by-href="${pageContext.request.contextPath}/pages/home"
                                    data-toggle="tooltip" data-placement="auto"
                                    title="${labels['global.sidebar.home']}">
                                <i class="fa fa-home fa-fw"></i>
                            </button>
                            <button class="btn btn-primary"
                                    actionType="action-ref-href"
                                    action-ref-by-href="${pageContext.request.contextPath}/pages/home"
                                    data-toggle="tooltip" data-placement="auto"
                                    title="${labels['global.sidebar.home']}">
                                <i class="fa fa-home fa-fw"></i>
                            </button>
                            <button class="btn btn-primary"
                                    actionType="action-ref-href"
                                    action-ref-by-href="${pageContext.request.contextPath}/pages/home"
                                    data-toggle="tooltip" data-placement="auto"
                                    title="${labels['global.sidebar.home']}">
                                <i class="fa fa-home fa-fw"></i>
                            </button>
                            <button class="btn btn-primary"
                                    actionType="action-ref-href"
                                    action-ref-by-href="${pageContext.request.contextPath}/pages/home"
                                    data-toggle="tooltip" data-placement="auto"
                                    title="${labels['global.sidebar.home']}">
                                <i class="fa fa-home fa-fw"></i>
                            </button>
                            <button class="btn btn-primary"
                                    actionType="action-ref-href"
                                    action-ref-by-href="${pageContext.request.contextPath}/pages/home"
                                    data-toggle="tooltip" data-placement="auto"
                                    title="${labels['global.sidebar.home']}">
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
                                    ${labels['global.sidebar.home']}
                                </a>
                            </li>
                            <li>
                                <a class="has-arrow" href="#">
                                    <i class="far fa-lg fa-fw fa-object-group"></i>
                                    ${labels['global.sidebar.themes']}
                                </a>
                                <ul>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/pages/themes/bootswatch">
                                            <i class="far fa-lg fa-fw fa-object-group"></i>
                                            ${labels['global.sidebar.themes.bootswatch']}
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
                                        <a href="${pageContext.request.contextPath}/pages/bootstrap/info-components">
                                            <i class="far fa-lg fa-fw fa-heart"></i>
                                            Info Theme Color Components
                                        </a>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/pages/bootstrap/components">
                                            <i class="far fa-lg fa-fw fa-heart"></i>
                                            Bootstrap Components
                                        </a>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/pages/bootstrap/grid">
                                            <i class="far fa-lg fa-fw fa-heart"></i>
                                            Bootstrap Grid
                                        </a>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/pages/bootstrap/media-object">
                                            <i class="far fa-lg fa-fw fa-heart"></i>
                                            Media object
                                        </a>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/pages/bootstrap/content">
                                            <i class="far fa-lg fa-fw fa-heart"></i>
                                            Bootstrap Content
                                        </a>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/pages/bootstrap/buttons">
                                            <i class="far fa-lg fa-fw fa-heart"></i>
                                            Bootstrap Buttons
                                        </a>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/pages/bootstrap/button-group">
                                            <i class="far fa-lg fa-fw fa-heart"></i>
                                            Bootstrap Button group
                                        </a>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/pages/bootstrap/card">
                                            <i class="far fa-lg fa-fw fa-heart"></i>
                                            Bootstrap Card
                                        </a>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/pages/bootstrap/carousel">
                                            <i class="far fa-lg fa-fw fa-heart"></i>
                                            Bootstrap Carousel
                                        </a>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/pages/bootstrap/dropdown">
                                            <i class="far fa-lg fa-fw fa-heart"></i>
                                            Bootstrap Dropdown
                                        </a>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/pages/bootstrap/forms">
                                            <i class="far fa-lg fa-fw fa-heart"></i>
                                            Bootstrap Forms
                                        </a>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/pages/bootstrap/input-group">
                                            <i class="far fa-lg fa-fw fa-heart"></i>
                                            Bootstrap Input Group
                                        </a>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/pages/bootstrap/list-group">
                                            <i class="far fa-lg fa-fw fa-heart"></i>
                                            Bootstrap List Group
                                        </a>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/pages/bootstrap/modal">
                                            <i class="far fa-lg fa-fw fa-heart"></i>
                                            Bootstrap Modal
                                        </a>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/pages/bootstrap/navs">
                                            <i class="far fa-lg fa-fw fa-heart"></i>
                                            Bootstrap Navs
                                        </a>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/pages/bootstrap/navbar">
                                            <i class="far fa-lg fa-fw fa-heart"></i>
                                            Bootstrap Navbar
                                        </a>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/pages/bootstrap/scrollspy">
                                            <i class="far fa-lg fa-fw fa-heart"></i>
                                            Bootstrap Scrollspy
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
                                            <i class="far fa-lg fa-fw fa-lightbulb"></i>
                                            Color Combinations
                                        </a>
                                        <ul aria-expanded="true">
                                            <li>
                                                <a href="${pageContext.request.contextPath}/pages/custom-components/color/color-palette-combinations">
                                                    <i class="far fa-lg fa-fw fa-lightbulb"></i>
                                                    Color Palette Combinations
                                                </a>
                                            </li>
                                            <li>
                                                <a href="${pageContext.request.contextPath}/pages/custom-components/color/8-color-combinations">
                                                    <i class="far fa-lg fa-fw fa-lightbulb"></i>
                                                    8 colors combinations
                                                </a>
                                            </li>
                                            <li>
                                                <a href="${pageContext.request.contextPath}/pages/custom-components/color/100-color-combinations">
                                                    <i class="far fa-lg fa-fw fa-lightbulb"></i>
                                                    100 colors combinations
                                                </a>
                                            </li>
                                        </ul>
                                    </li>
                                    <li>
                                        <a href="#" class="has-arrow">
                                            <i class="fa fa-lg fa-fw fa-camera"></i>
                                            Icons
                                        </a>
                                        <ul aria-expanded="true">
                                            <li>
                                                <a href="${pageContext.request.contextPath}/pages/custom-components/icon/font_awesome_icons">
                                                    <i class="fa fa-lg fa-fw fa-camera"></i>
                                                    Font Awesome Icons
                                                </a>
                                            </li>
                                            <li>
                                                <a href="${pageContext.request.contextPath}/pages/custom-components/icon/font_awesome_animation_icon">
                                                    <i class="fa fa-lg fa-fw fa-camera"></i>
                                                    Font Awesome Animation Icons Set
                                                </a>
                                            </li>
                                        </ul>
                                    </li>
                                    <li>
                                        <a class="has-arrow" href="#">
                                            <i class="far fa-lg fa-fw fa-lightbulb"></i>
                                            Menu
                                        </a>
                                        <ul aria-expanded="true">
                                            <li>
                                                <a href="${pageContext.request.contextPath}/pages/custom-components/menu/horizontal-mega-menu">
                                                    <i class="far fa-lg fa-fw fa-lightbulb"></i>
                                                    Yamm Horizontal Mega Menu
                                                </a>
                                            </li>
                                            <li>
                                                <a href="${pageContext.request.contextPath}/pages/custom-components/menu/bootstrap-dropdown-hover">
                                                    <i class="far fa-lg fa-fw fa-lightbulb"></i>
                                                    Bootstrap Dropdown Hover
                                                </a>
                                            </li>
                                            <li>
                                                <a href="${pageContext.request.contextPath}/pages/custom-components/menu/bootstrap-multilevel-dropdown-hover">
                                                    <i class="far fa-lg fa-fw fa-lightbulb"></i>
                                                    Bootstrap Multilevel Dropdown Hover
                                                </a>
                                            </li>
                                            <li>
                                                <a href="${pageContext.request.contextPath}/pages/custom-components/menu/scrollable-bootstrap-dropdown">
                                                    <i class="far fa-lg fa-fw fa-lightbulb"></i>
                                                    Scrollable Bootstrap Dropdown
                                                </a>
                                            </li>
                                        </ul>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/pages/custom-components/dashboard-stats">
                                            <i class="far fa-lg fa-fw fa-lightbulb"></i>
                                            Dashboard Stats
                                        </a>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/pages/custom-components/bootstrap-steps">
                                            <i class="far fa-lg fa-fw fa-lightbulb"></i>
                                            Bootstrap Steps
                                        </a>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/pages/custom-components/sortable-cards">
                                            <i class="far fa-lg fa-fw fa-lightbulb"></i>
                                            Sortable Cards
                                        </a>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/pages/custom-components/dynamic-cards-content">
                                            <i class="far fa-lg fa-fw fa-lightbulb"></i>
                                            Dynamic Cards Content
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
                                            <i class="far fa-lg fa-fw fa-gem"></i>
                                            Tree
                                        </a>
                                        <ul aria-expanded="true">
                                            <li>
                                                <a class="has-arrow" href="#">
                                                    <i class="far fa-lg fa-fw fa-gem"></i>Fancytree
                                                </a>
                                                <ul aria-expanded="true">
                                                    <li>
                                                        <a href="${pageContext.request.contextPath}/pages/plugins/tree/fancytree/plain_fancytree">
                                                            <i class="far fa-lg fa-fw fa-gem"></i>
                                                            Plain Fancytree
                                                        </a>
                                                    </li>
                                                    <li>
                                                        <a href="${pageContext.request.contextPath}/pages/plugins/tree/fancytree/table_fancytree">
                                                            <i class="far fa-lg fa-fw fa-gem"></i>
                                                            Table Fancytree
                                                        </a>
                                                    </li>
                                                    <li>
                                                        <a href="${pageContext.request.contextPath}/pages/plugins/tree/fancytree/chart-of-accounts">
                                                            <i class="far fa-lg fa-fw fa-gem"></i>
                                                            Chart Of Accounts
                                                        </a>
                                                    </li>
                                                    <li>
                                                        <a href="${pageContext.request.contextPath}/pages/plugins/tree/fancytree/checkboxes_fancytree">
                                                            <i class="far fa-lg fa-fw fa-gem"></i>
                                                            Checkboxes fancytree
                                                        </a>
                                                    </li>
                                                    <li>
                                                        <a href="${pageContext.request.contextPath}/pages/plugins/tree/fancytree/radio_buttons_fancytree">
                                                            <i class="far fa-lg fa-fw fa-gem"></i>
                                                            Radio Buttons fancytree
                                                        </a>
                                                    </li>
                                                    <li>
                                                        <a href="${pageContext.request.contextPath}/pages/plugins/tree/fancytree/contextMenu_fancytree">
                                                            <i class="far fa-lg fa-fw fa-gem"></i>
                                                            ContextMenu fancytree
                                                        </a>
                                                    </li>
                                                    <li>
                                                        <a href="${pageContext.request.contextPath}/pages/plugins/tree/fancytree/drag-and-drop-fancytree">
                                                            <i class="far fa-lg fa-fw fa-gem"></i>
                                                            Drag-and-Drop Fancytree
                                                        </a>
                                                    </li>
                                                    <li>
                                                        <a href="${pageContext.request.contextPath}/pages/plugins/tree/fancytree/filter-ext-fancytree">
                                                            <i class="far fa-lg fa-fw fa-gem"></i>
                                                            Filter Ext Fancytree
                                                        </a>
                                                    </li>
                                                </ul>
                                            </li>
                                        </ul>
                                    </li>
                                    <li>
                                        <a class="has-arrow" href="#">
                                            <i class="far fa-lg fa-fw fa-bell"></i>
                                            Alerts & Notifications
                                        </a>
                                        <ul aria-expanded="true">
                                            <li>
                                                <a href="${pageContext.request.contextPath}/pages/plugins/alert-notification/jQuery-toastr-notification">
                                                    <i class="far fa-lg fa-fw fa-bell"></i>
                                                    jQuery Toastr Notifications
                                                </a>
                                            </li>
                                            <li>
                                                <a href="${pageContext.request.contextPath}/pages/plugins/alert-notification/block-ui-plugin">
                                                    <i class="far fa-lg fa-fw fa-bell"></i>
                                                    Block UI Plugin
                                                </a>
                                            </li>
                                            <li>
                                                <a href="${pageContext.request.contextPath}/pages/plugins/alert-notification/dynamic-bootstrap-alerts">
                                                    <i class="far fa-lg fa-fw fa-bell"></i>
                                                    Dynamic Bootstrap Alerts
                                                </a>
                                            </li>
                                            <li>
                                                <a href="${pageContext.request.contextPath}/pages/plugins/alert-notification/idle-timer">
                                                    <i class="far fa-lg fa-fw fa-bell"></i>
                                                    Idle Timer Plugin
                                                </a>
                                            </li>
                                        </ul>
                                    </li>
                                    <li>
                                        <a class="has-arrow" href="#">
                                            <i class="far fa-lg fa-fw fa-gem"></i>
                                            Calendar
                                        </a>
                                        <ul aria-expanded="true">
                                            <li>
                                                <a href="${pageContext.request.contextPath}/pages/plugins/calendar/jQuery-fullcalendar">
                                                    <i class="far fa-lg fa-fw fa-gem"></i>
                                                    jQuery FullCalendar
                                                </a>
                                            </li>
                                            <li>
                                                <a href="${pageContext.request.contextPath}/pages/plugins/calendar/jQuery-fullcalendar-event-popup">
                                                    <i class="far fa-lg fa-fw fa-gem"></i>
                                                    jQuery FullCalendar 1
                                                </a>
                                            </li>
                                            <li>
                                                <a href="${pageContext.request.contextPath}/pages/plugins/calendar/jQuery-fullcalendar-constraint">
                                                    <i class="far fa-lg fa-fw fa-gem"></i>
                                                    jQuery FullCalendar Constraint
                                                </a>
                                            </li>
                                            <li>
                                                <a href="${pageContext.request.contextPath}/pages/plugins/calendar/jQuery-fullcalendar-year">
                                                    <i class="far fa-lg fa-fw fa-gem"></i>
                                                    jQuery FullCalendar Year
                                                </a>
                                            </li>
                                            <li>
                                                <a href="${pageContext.request.contextPath}/pages/plugins/calendar/jQuery-fullcalendar-diary-system">
                                                    <i class="far fa-lg fa-fw fa-gem"></i>
                                                    Web Diary System
                                                </a>
                                            </li>
                                        </ul>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/pages/plugins/bootstrap-date-range-picker">
                                            <i class="far fa-lg fa-fw fa-gem"></i>
                                            Bootstrap Date Range Picker
                                        </a>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/pages/plugins/bootstrap-colorselector">
                                            <i class="far fa-lg fa-fw fa-gem"></i>
                                            Bootstrap Color Selector
                                        </a>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/pages/plugins/jQuery-select2-bootstrap">
                                            <i class="far fa-lg fa-fw fa-gem"></i>
                                            jQuery Bootstrap Select2 complete demo
                                        </a>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/pages/plugins/bootstrap-maxlength">
                                            <i class="far fa-lg fa-fw fa-gem"></i>
                                            Bootstrap Maxlength
                                        </a>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/pages/plugins/form-textarea-autosize">
                                            <i class="far fa-lg fa-fw fa-gem"></i>
                                            Form Textarea Autosize
                                        </a>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/pages/plugins/jQuery-contextMenu">
                                            <i class="far fa-lg fa-fw fa-gem"></i>
                                            Bootstrap Context Menu
                                        </a>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/pages/plugins/bootstrap-summernote-editor">
                                            <i class="far fa-lg fa-fw fa-gem"></i>
                                            Bootstrap Summernote Editor
                                        </a>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/pages/plugins/ion-rangeSlider">
                                            <i class="far fa-lg fa-fw fa-gem"></i>
                                            Ion Range Slider
                                        </a>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/pages/plugins/bootstrap-slider">
                                            <i class="far fa-lg fa-fw fa-gem"></i>
                                            bootstrap-slider Plugin
                                        </a>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/pages/plugins/cropper-image-cropping">
                                            <i class="far fa-lg fa-fw fa-gem"></i>
                                            Cropper - Image Cropping Plugin for jQuery
                                        </a>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/pages/plugins/jQuery-ScrollUp">
                                            <i class="far fa-lg fa-fw fa-gem"></i>
                                            jQuery ScrollUp Plugin
                                        </a>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/pages/plugins/jquery.counterup">
                                            <i class="far fa-lg fa-fw fa-gem"></i>
                                            jQuery CounterUp Plugin
                                        </a>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/pages/plugins/bootstrap-dual-select">
                                            <i class="far fa-lg fa-fw fa-gem"></i>
                                            Bootstrap Dual Select
                                        </a>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/pages/plugins/jQuery-timeago">
                                            <i class="far fa-lg fa-fw fa-gem"></i>
                                            jQuery timeago plugin
                                        </a>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/pages/plugins/malihu-custom-scrollbar-plugin">
                                            <i class="far fa-lg fa-fw fa-gem"></i>
                                            Malihu Custom Scrollbar Plugin
                                        </a>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/pages/plugins/bootstrap-modal-wrapper">
                                            <i class="far fa-lg fa-fw fa-gem"></i>
                                            Bootstrap Modal Wrapper Plugin
                                        </a>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/pages/plugins/bootstrap-contextMenu">
                                            <i class="far fa-lg fa-fw fa-gem"></i>
                                            Bootstrap ContextMenu Plugin
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
                                        <a href="${pageContext.request.contextPath}/pages/form/basic-form-validation">
                                            <i class="far fa-lg fa-fw fa-edit"></i>
                                            Basic HTML5 Form Validation
                                        </a>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/pages/form/jQuery-form-validation">
                                            <i class="far fa-lg fa-fw fa-edit"></i>
                                            jQuery Form Validation
                                        </a>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/pages/form/form-input-mask">
                                            <i class="far fa-lg fa-fw fa-edit"></i>
                                            Form Input Mask
                                        </a>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/pages/form/jQuery-form-plugin">
                                            <i class="far fa-lg fa-fw fa-edit"></i>
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
                                            <i class="far fa-lg fa-fw fa-clone"></i>
                                            Native Bootstrap Tab
                                        </a>
                                        <ul aria-expanded="true">
                                            <li>
                                                <a href="${pageContext.request.contextPath}/pages/wizard/native-bootstrap-tab/default-bootstrap-pill-wizard">
                                                    <i class="far fa-lg fa-fw fa-clone"></i>
                                                    Default Bootstrap Pill Wizard
                                                </a>
                                            </li>
                                            <li>
                                                <a href="${pageContext.request.contextPath}/pages/wizard/native-bootstrap-tab/disabled-bootstrap-pill-wizard">
                                                    <i class="far fa-lg fa-fw fa-clone"></i>
                                                    Disabled Bootstrap Pill Wizard
                                                </a>
                                            </li>
                                            <li>
                                                <a href="${pageContext.request.contextPath}/pages/wizard/native-bootstrap-tab/modal-bootstrap-pill-wizard">
                                                    <i class="far fa-lg fa-fw fa-clone"></i>
                                                    Modal Bootstrap Pill Wizard
                                                </a>
                                            </li>
                                            <li>
                                                <a href="${pageContext.request.contextPath}/pages/wizard/native-bootstrap-tab/vertical-modal-bootstrap-pill-wizard">
                                                    <i class="far fa-lg fa-fw fa-clone"></i>
                                                    Vertical Modal Bootstrap Pill Wizard
                                                </a>
                                            </li>
                                            <li>
                                                <a href="${pageContext.request.contextPath}/pages/wizard/native-bootstrap-tab/ajax-bootstrap-pill-wizard">
                                                    <i class="far fa-lg fa-fw fa-clone"></i>
                                                    Ajax Modal Bootstrap Pill Wizard
                                                </a>
                                            </li>
                                            <li>
                                                <a href="${pageContext.request.contextPath}/pages/wizard/native-bootstrap-tab/vertical-validation-bootstrap-pill-wizard">
                                                    <i class="far fa-lg fa-fw fa-clone"></i>
                                                    Vertical Validation Bootstrap Pill Wizard
                                                </a>
                                            </li>
                                            <li>
                                                <a href="${pageContext.request.contextPath}/pages/wizard/native-bootstrap-tab/horizontal-validation-bootstrap-pill-wizard">
                                                    <i class="far fa-lg fa-fw fa-clone"></i>
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
                                        <a href="${pageContext.request.contextPath}/pages/table/bootstrap-table">
                                            <i class="far fa-lg fa-fw fa-list-alt"></i>
                                            Bootstrap Table
                                        </a>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/pages/table/scrollable-fixed-bootstrap-table">
                                            <i class="far fa-lg fa-fw fa-list-alt"></i>
                                            Scrollable Fixed Bootstrap Table
                                        </a>
                                    </li>
                                    <li>
                                        <a class="has-arrow" href="#">
                                            <i class="far fa-lg fa-fw fa-list-alt"></i>
                                            DataTables Plugin

                                        </a>
                                        <ul aria-expanded="true">
                                            <li>
                                                <a href="${pageContext.request.contextPath}/pages/table/datatable/defalut-datatables-bootstrap-4">
                                                    <i class="far fa-lg fa-fw fa-list-alt"></i>
                                                    Defalut Datatables Bootstrap 4 theme
                                                </a>
                                            </li>
                                            <li>
                                                <a href="${pageContext.request.contextPath}/pages/table/datatable/responsive-datatables-bootstrap-4">
                                                    <i class="far fa-lg fa-fw fa-list-alt"></i>
                                                    Responsive Datatables Bootstrap 4 theme
                                                </a>
                                            </li>
                                            <li>
                                                <a href="${pageContext.request.contextPath}/pages/table/datatable/fixedHeader-datatables-bootstrap-4">
                                                    <i class="far fa-lg fa-fw fa-list-alt"></i>
                                                    FixedHeader Datatables Bootstrap 4 theme
                                                </a>
                                            </li>
                                            <li>
                                                <a href="${pageContext.request.contextPath}/pages/table/datatable/scrollable-datatables">
                                                    <i class="far fa-lg fa-fw fa-list-alt"></i>
                                                    Scrollable DataTable
                                                </a>
                                            </li>
                                            <li>
                                                <a href="${pageContext.request.contextPath}/pages/table/datatable/selectable-datatables-bootstrap-4">
                                                    <i class="far fa-lg fa-fw fa-list-alt"></i>
                                                    Selectable DataTable
                                                </a>
                                            </li>
                                            <li>
                                                <a href="${pageContext.request.contextPath}/pages/table/datatable/checkbox-selection-datatables-bootstrap-4">
                                                    <i class="far fa-lg fa-fw fa-list-alt"></i>
                                                    Checkbox selection
                                                </a>
                                            </li>
                                            <li>
                                                <a href="${pageContext.request.contextPath}/pages/table/datatable/row-selection-using-checkboxes">
                                                    <i class="far fa-lg fa-fw fa-list-alt"></i>
                                                    Row selection using checkboxes
                                                </a>
                                            </li>
                                            <li>
                                                <a href="${pageContext.request.contextPath}/pages/table/datatable/individual-column-searching">
                                                    <i class="far fa-lg fa-fw fa-list-alt"></i>
                                                    individual-column-searching
                                                </a>
                                            </li>
                                            <li>
                                                <a href="${pageContext.request.contextPath}/pages/table/datatable/datatables-footer-summary">
                                                    <i class="far fa-lg fa-fw fa-list-alt"></i>
                                                    Datatables with Footer Summary
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
                                        <a href="${pageContext.request.contextPath}/pages/chart/echarts">
                                            <i class="far fa-lg fa-fw fa-chart-bar"></i>
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
                                                <a href="${pageContext.request.contextPath}/pages/gallery/carousel/bootstrap-carousel">
                                                    <i class="far fa-lg fa-fw fa-image"></i>
                                                    Bootstrap Carousel
                                                </a>
                                            </li>
                                            <li>
                                                <a href="${pageContext.request.contextPath}/pages/gallery/carousel/carousel-product-slider">
                                                    <i class="far fa-lg fa-fw fa-image"></i>
                                                    Carousel Product Slider
                                                </a>
                                            </li>
                                            <li>
                                                <a href="${pageContext.request.contextPath}/pages/gallery/carousel/up-tabbed-slider-carousel">
                                                    <i class="far fa-lg fa-fw fa-image"></i>
                                                    Up Tabbed Slider Carousel
                                                </a>
                                            </li>
                                            <li>
                                                <a href="${pageContext.request.contextPath}/pages/gallery/carousel/slick-carousel">
                                                    <i class="far fa-lg fa-fw fa-image"></i>
                                                    Slick Carousel
                                                </a>
                                            </li>
                                        </ul>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/pages/gallery/file-controller-serve">
                                            <i class="far fa-lg fa-fw fa-image"></i>
                                            Simple Servlet for Files
                                        </a>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/pages/gallery/file-uploader-servlet">
                                            <i class="far fa-lg fa-fw fa-image"></i>
                                            File Uploader Servlet
                                        </a>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/pages/gallery/simple-thumbnail-gallery">
                                            <i class="far fa-lg fa-fw fa-image"></i>
                                            Simple Thumbnail Gallery
                                        </a>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/pages/gallery/view-image-using-bs-model">
                                            <i class="far fa-lg fa-fw fa-image"></i>
                                            View Image Using Bootstrap Model
                                        </a>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/pages/gallery/view-image-using-pager-bs-model">
                                            <i class="far fa-lg fa-fw fa-image"></i>
                                            View Image Using Pager Bootstrap Model
                                        </a>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/pages/gallery/view-image-using-pagination-bs-model">
                                            <i class="far fa-lg fa-fw fa-image"></i>
                                            View Image Using Pagination Bootstrap Model
                                        </a>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/pages/gallery/action-thumbnail-gallery">
                                            <i class="far fa-lg fa-fw fa-image"></i>
                                            Action Thumbnail Gallery
                                        </a>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/pages/gallery/tool-thumbnail-gallery">
                                            <i class="far fa-lg fa-fw fa-image"></i>
                                            Tool Thumbnail Gallery
                                        </a>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/pages/gallery/portfolio-gallery-with-filtering-category">
                                            <i class="far fa-lg fa-fw fa-image"></i>
                                            Portfolio Gallery with filtering category
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
                                            <i class="far fa-lg fa-fw fa-file-alt"></i>
                                            Empty Pages
                                        </a>
                                        <ul>
                                            <li>
                                                <a href="${pageContext.request.contextPath}/pages/custom-pages/empty-pages/blank-page">
                                                    <i class="far fa-lg fa-fw fa-file-alt"></i>
                                                    Blank Page
                                                </a>
                                            </li>
                                            <li>
                                                <a href="${pageContext.request.contextPath}/pages/custom-pages/empty-pages/empty-page">
                                                    <i class="far fa-lg fa-fw fa-file-alt"></i>
                                                    Empty Page with nothing
                                                </a>
                                            </li>
                                            <li>
                                                <a href="${pageContext.request.contextPath}/pages/custom-pages/empty-pages/card-page">
                                                    <i class="far fa-lg fa-fw fa-file-alt"></i>
                                                    Card Page
                                                </a>
                                            </li>
                                            <li>
                                                <a href="${pageContext.request.contextPath}/pages/custom-pages/empty-pages/event-page">
                                                    <i class="far fa-lg fa-fw fa-file-alt"></i>
                                                    Page with standard event handling
                                                </a>
                                            </li>
                                        </ul>
                                    </li>
                                    <li>
                                        <a class="has-arrow" href="#">
                                            <i class="far fa-lg fa-fw fa-file-alt"></i>
                                            Inbox
                                        </a>
                                        <ul aria-expanded="true">

                                            <li>
                                                <a href="${pageContext.request.contextPath}/pages/custom-pages/inbox/inbox-messages">
                                                    <i class="far fa-lg fa-fw fa-file-alt"></i>
                                                    Inbox Messages
                                                </a>
                                            </li>
                                            <li>
                                                <a action-name="compose-page" href="${pageContext.request.contextPath}/pages/custom-pages/inbox/compose-message">
                                                    <i class="far fa-lg fa-fw fa-file-alt"></i>
                                                    Compose Message
                                                </a>
                                            </li>
                                            <li>
                                                <a action-name="view-message" href="${pageContext.request.contextPath}/pages/custom-pages/inbox/view-message">
                                                    <i class="far fa-lg fa-fw fa-file-alt"></i>
                                                    View Message
                                                </a>
                                            </li>
                                        </ul>
                                    </li>
                                    <li>
                                        <a class="has-arrow" href="#">
                                            <i class="far fa-lg fa-fw fa-file-alt"></i>
                                            Login Pages
                                        </a>
                                        <ul>
                                            <li>
                                                <a target="_blank"  href="${pageContext.request.contextPath}/pages/custom-pages/login-pages/default-login-page">
                                                    <i class="far fa-lg fa-fw fa-file-alt"></i>
                                                    Default Login Page
                                                </a>
                                            </li>
                                        </ul>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/pages/custom-pages/todo-list">
                                            <i class="far fa-lg fa-fw fa-file-alt"></i>
                                            ToDo App
                                        </a>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/pages/custom-pages/menu-template">
                                            <i class="far fa-lg fa-fw fa-file-alt"></i>
                                            Menu Template Page
                                        </a>
                                    </li>
                                    <li>
                                        <a target="_blank" href="${pageContext.request.contextPath}/pages/custom-pages/404-page">
                                            <i class="far fa-lg fa-fw fa-file-alt"></i>
                                            404 Page
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
                    defaultUrl: '${pageContext.request.contextPath}/pages/home',
                    floatDefault: "${labels['global.floatDefault']}",
                    floatReverse: "${labels['global.floatReverse']}",
                    direction: "${labels['global.direction']}",
                    isRTL: ${labels['global.direction'] == 'ltr' ? 'false' : 'true'},
                    contextPath: '${pageContext.request.contextPath}'
                });
            });
        </script>
        <script type="text/javascript">
            jQuery(function ($) {
                $.ajaxSetup({
                    statusCode: {
                        401: function (jqXHR, textStatus, errorThrown) {
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
                                title: jqXHR.status + " : " + jqXHR.statusText,
                                closable: false,
                                closeByBackdrop: false,
                                buttons: [
                                    {
                                        label: "Return",
                                        cssClass: "btn btn-secondary",
                                        action: function (modalWrapper, button, buttonData, originalEvent) {
                                            modalWrapper.hide();
                                        }
                                    },
                                    {
                                        label: "Redirect",
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
                        }
                    }
                });
            });
        </script>
        <script type="text/javascript">
            jQuery(function ($) {
                if (javatmp.settings.isRTL === true) {
                    $("body").on('shown.bs.dropdown', '.main-body-content-container .dropdown, .main-body-content-container .btn-group, .main-body-content-container .input-group-prepend, .main-body-content-container .input-group-append', function () {
                        console.log("firing recalculate popper sub len [" + $(this).parents(".dropdown-submenu").lenght + "]");
                        if ($(this).parents(".navbar").length !== 0 || (!!$(this).parents(".dropdown-submenu").lenght && $(this).parents(".dropdown-submenu").lenght !== 0)) {
                            console.log("Cancel and return navbar len [" + $(this).parents(".navbar").length + "] .dropdown-submenu len [" + $(this).parents(".dropdown-submenu").lenght + "]");
                            return;
                        }

                        var dropDown = $(this).children(".dropdown-menu");
                        setTimeout(function () {
                            var previous =
                                    dropDown.css("-webkit-transform") ||
                                    dropDown.css("-moz-transform") ||
                                    dropDown.css("-ms-transform") ||
                                    dropDown.css("-o-transform") ||
                                    dropDown.css("transform") ||
                                    "Either no transform set, or browser doesn't do getComputedStyle";
                            var values = previous.split("(")[1];
                            values = values.split(")")[0];
                            values = values.split(", ");
                            var x = 0;
                            var y = parseInt(values[5]);
                            var z = 0;
                            dropDown.css({transform: "translate3d(" + x + "px," + y + "px," + z + "px)", left: "auto", right: "auto"});
                        }, 0);
                    });
                }
            });
        </script>
        <script type="text/javascript">
            jQuery(function ($) {
                $("#oneTimeOverlay").remove();
            });
        </script>
    </body>
</html>