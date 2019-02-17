<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="${labels["global.language"]}" dir="${labels["global.direction"]}">
    <head>
        <title>${labels["global.page.title"]}</title>
        <!-- Required meta tags -->
        <meta charset="utf-8">
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

        <!-- Include language support font -->
        <link href="${pageContext.request.contextPath}/assets/dist/css/font-family-${labels['global.language']}.min.css" rel="stylesheet" type="text/css"/>
    </head>
    <body class="sidebar-active">
        <div id="oneTimeOverlay" style="position: fixed;width: 100%;height: 100%;top: 0px;left: 0;right: 0;bottom: 0;background-color: rgba(255,255,255,1);z-index: 1000000;cursor: wait;">Loading ...</div>
        <nav class="main-javatmp-navbar navbar fixed-top my-0 py-0">
            <a class="navbar-brand mr-auto py-0 d-none d-md-inline" href="${pageContext.request.contextPath}/">
                <span class="d-xl-none d-lg-none d-sm-inline">${labels['global.system.name.short']}</span>
                <span class="d-none d-lg-inline">${labels['global.system.name.long']}</span>
            </a>
            <ul class="main-navbar-menu nav ml-auto align-self-stretch flex-nowrap">
                <li class="nav-item dropdown d-none d-sm-flex d-flex align-items-stretch">
                    <a class="nav-link dropdown-toggle faa-parent animated-hover d-flex align-items-center" data-toggle="dropdown" href="">
                        <i class="fa fa-globe fa-lg faa-spin mr-1"></i>
                        <span class="d-none d-lg-inline">${labels['global.navbar.lang.current']}</span>
                    </a>
                    <ul class="dropdown-menu">
                        <li class="${sessionScope.user.lang == 'en' ? 'disabled' : ''}">
                            <a class="updateLanguagelink dropdown-item ${sessionScope.user.lang == 'en' ? 'disabled' : ''}" href="${pageContext.request.contextPath}/updateLanguage?lang=en">
                                <div>
                                    <img src="${pageContext.request.contextPath}/assets/img/flags/us.png" class="" alt="">
                                    ${labels['global.navbar.lang.en']}
                                </div>
                            </a>
                        </li>
                        <li class="${sessionScope.user.lang == 'ar' ? 'disabled' : ''}">
                            <a class="updateLanguagelink dropdown-item ${sessionScope.user.lang == 'ar' ? 'disabled' : ''}" href="${pageContext.request.contextPath}/updateLanguage?lang=ar">
                                <div>
                                    <img src="${pageContext.request.contextPath}/assets/img/flags/sa.png" class="" alt="">
                                    ${labels['global.navbar.lang.ar']}
                                </div>
                            </a>
                        </li>
                    </ul>
                </li>
                <li class="nav-item dropdown mega-on-sm d-flex align-items-stretch" id="myMessagesDropdownId">
                    <a class="nav-link dropdown-toggle d-flex align-items-center" data-toggle="dropdown" href="#">
                        <i class="far fa-envelope fa-lg faa-shake animated mr-1"></i>
                        <span class="badge badge-danger d-none d-md-inline">99+</span>
                    </a>
                    <div class="dropdown-menu dropdown-menu-extender">
                        <div class="dropdown-menu-header clearfix">
                            <i class="fa fa-lg fa-fw fa-envelope"></i>5 Messages
                            <a actionType="ajax-model"
                               href="${pageContext.request.contextPath}/pages/custom-pages/inbox/ajax/ajax-compose-message"
                               data-actionable-options='{"size":"modal-lg", "title": "Loading Compose Message .."}'
                               class="float-right small">
                                Create New Message
                            </a>
                        </div>
                        <div class="list-group-flush list-group dropdown-menu-content dynamic-messages-scroll-content">
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
                <li class="nav-item dropdown mega-on-sm d-flex align-items-stretch">
                    <a class="nav-link dropdown-toggle d-flex align-items-center" data-toggle="dropdown" href="#">
                        <i class="fa fa-lg fa-bars faa-float animated mr-1"></i>
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
                <li class="nav-item dropdown mega-on-sm d-flex align-items-stretch">
                    <a class="nav-link d-flex align-items-center dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="far fa-bell fa-lg faa-ring animated mr-1"></i>
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
                <li class="nav-item dropdown">
                    <a class="line-height-1 d-flex align-items-center h-100 text-left nav-link dropdown-toggle" data-toggle="dropdown" href="#">
                        <img class="logo-image rounded-circle mr-1"
                             src="${pageContext.request.contextPath}/assets/img/avatar/profile_pic_min.png" alt=""/>
                        <span class="d-none d-md-inline">
                            <small class="d-flex">Welcome,</small>
                            ${sessionScope.user.firstName}&nbsp;${sessionScope.user.lastName}
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
            <button class="navbar-toggler sidebar-toggler-button my-1 ml-1 align-self-center" type="button">
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
                        </div>
                        <div class="sidebar-menu-filter-form mx-2 my-1">
                            <form autocomplete="off" class="search-menu-form">
                                <div class="has-form-control-clear">
                                    <input id="filter-menu-id" type="text" class="form-control" placeholder="Search menu ..." autocomplete="off"/>
                                    <span class="form-control-clear fa fa-times d-none"></span>
                                </div>
                            </form>
                        </div>
                        <ul class="main-sidebar-menu metismenu">
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
                                        <a href="${pageContext.request.contextPath}/pages/themes/buildin">
                                            JavaTMP Build-in Themes
                                        </a>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/pages/themes/bootswatch">
                                            ${labels['global.sidebar.themes.bootswatch']}
                                        </a>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/pages/themes/devexpress-bs4-themes">
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
                                        <a href="${pageContext.request.contextPath}/pages/bootstrap/info-components">
                                            Info Theme Color Components
                                        </a>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/pages/bootstrap/components">
                                            Bootstrap Components
                                        </a>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/pages/bootstrap/grid">
                                            Bootstrap Grid
                                        </a>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/pages/bootstrap/media-object">
                                            Media object
                                        </a>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/pages/bootstrap/content">
                                            Bootstrap Content
                                        </a>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/pages/bootstrap/buttons">
                                            Bootstrap Buttons
                                        </a>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/pages/bootstrap/button-group">
                                            Bootstrap Button group
                                        </a>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/pages/bootstrap/card">
                                            Bootstrap Card
                                        </a>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/pages/bootstrap/carousel">
                                            Bootstrap Carousel
                                        </a>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/pages/bootstrap/dropdown">
                                            Bootstrap Dropdown
                                        </a>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/pages/bootstrap/forms">
                                            Bootstrap Forms
                                        </a>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/pages/bootstrap/input-group">
                                            Bootstrap Input Group
                                        </a>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/pages/bootstrap/list-group">
                                            Bootstrap List Group
                                        </a>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/pages/bootstrap/modal">
                                            Bootstrap Modal
                                        </a>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/pages/bootstrap/navs">
                                            Bootstrap Navs
                                        </a>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/pages/bootstrap/navbar">
                                            Bootstrap Navbar
                                        </a>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/pages/bootstrap/scrollspy">
                                            Bootstrap Scrollspy
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
                                        <a href="${pageContext.request.contextPath}/pages/icon/font_awesome_icons">
                                            Font Awesome Icons
                                        </a>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/pages/icon/font_awesome_animation_icon">
                                            Font Awesome Animation
                                        </a>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/pages/icon/material-icons">
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
                                                <a href="${pageContext.request.contextPath}/pages/custom-components/color/color-palette-combinations">
                                                    Color Palette Combinations
                                                </a>
                                            </li>
                                            <li>
                                                <a href="${pageContext.request.contextPath}/pages/custom-components/color/8-color-combinations">
                                                    8 colors combinations
                                                </a>
                                            </li>
                                            <li>
                                                <a href="${pageContext.request.contextPath}/pages/custom-components/color/100-color-combinations">
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
                                                <a href="${pageContext.request.contextPath}/pages/custom-components/menu/custom-bootstrap-dropdown-button">
                                                    Custom Bootstrap Dropdown Button
                                                </a>
                                            </li>
                                            <li>
                                                <a href="${pageContext.request.contextPath}/pages/custom-components/menu/horizontal-mega-menu">
                                                    Yamm Horizontal Mega Menu
                                                </a>
                                            </li>
                                            <li>
                                                <a href="${pageContext.request.contextPath}/pages/custom-components/menu/bootstrap-dropdown-hover">
                                                    Bootstrap Dropdown Hover
                                                </a>
                                            </li>
                                            <li>
                                                <a href="${pageContext.request.contextPath}/pages/custom-components/menu/bootstrap-multilevel-dropdown-hover">
                                                    Bootstrap Multilevel Dropdown Hover
                                                </a>
                                            </li>
                                            <li>
                                                <a href="${pageContext.request.contextPath}/pages/custom-components/menu/scrollable-bootstrap-dropdown">
                                                    Scrollable Bootstrap Dropdown
                                                </a>
                                            </li>
                                        </ul>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/pages/custom-components/layout-options">
                                            Layout Options
                                        </a>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/pages/custom-components/dashboard-stats">
                                            Dashboard Stats
                                        </a>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/pages/custom-components/dashboard-chart-stats">
                                            Dashboard Chart Stats
                                        </a>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/pages/custom-components/bootstrap-steps">
                                            Bootstrap Steps
                                        </a>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/pages/custom-components/sortable-cards">
                                            Sortable Cards
                                        </a>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/pages/custom-components/dynamic-cards-content">
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
                                            Tree
                                        </a>
                                        <ul aria-expanded="true">
                                            <li>
                                                <a class="has-arrow" href="#">
                                                    Fancytree
                                                </a>
                                                <ul aria-expanded="true">
                                                    <li>
                                                        <a href="${pageContext.request.contextPath}/pages/plugins/tree/fancytree/plain_fancytree">
                                                            Plain Fancytree
                                                        </a>
                                                    </li>
                                                    <li>
                                                        <a href="${pageContext.request.contextPath}/pages/plugins/tree/fancytree/table_fancytree">
                                                            Table Fancytree
                                                        </a>
                                                    </li>
                                                    <li>
                                                        <a href="${pageContext.request.contextPath}/pages/plugins/tree/fancytree/chart-of-accounts">
                                                            Chart Of Accounts
                                                        </a>
                                                    </li>
                                                    <li>
                                                        <a href="${pageContext.request.contextPath}/pages/plugins/tree/fancytree/checkboxes_fancytree">
                                                            Checkboxes fancytree
                                                        </a>
                                                    </li>
                                                    <li>
                                                        <a href="${pageContext.request.contextPath}/pages/plugins/tree/fancytree/radio_buttons_fancytree">
                                                            Radio Buttons fancytree
                                                        </a>
                                                    </li>
                                                    <li>
                                                        <a href="${pageContext.request.contextPath}/pages/plugins/tree/fancytree/contextMenu_fancytree">
                                                            ContextMenu fancytree
                                                        </a>
                                                    </li>
                                                    <li>
                                                        <a href="${pageContext.request.contextPath}/pages/plugins/tree/fancytree/drag-and-drop-fancytree">
                                                            Drag-and-Drop Fancytree
                                                        </a>
                                                    </li>
                                                    <li>
                                                        <a href="${pageContext.request.contextPath}/pages/plugins/tree/fancytree/filter-ext-fancytree">
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
                                                <a href="${pageContext.request.contextPath}/pages/plugins/alert-notification/jQuery-toastr-notification">
                                                    jQuery Toastr Notifications
                                                </a>
                                            </li>
                                            <li>
                                                <a href="${pageContext.request.contextPath}/pages/plugins/alert-notification/block-ui-plugin">
                                                    Block UI Plugin
                                                </a>
                                            </li>
                                            <li>
                                                <a href="${pageContext.request.contextPath}/pages/plugins/alert-notification/dynamic-bootstrap-alerts">
                                                    Dynamic Bootstrap Alerts
                                                </a>
                                            </li>
                                            <li>
                                                <a href="${pageContext.request.contextPath}/pages/plugins/alert-notification/idle-timer">
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
                                                <a href="${pageContext.request.contextPath}/pages/plugins/calendar/jQuery-fullcalendar">
                                                    jQuery FullCalendar
                                                </a>
                                            </li>
                                            <li>
                                                <a href="${pageContext.request.contextPath}/pages/plugins/calendar/jQuery-fullcalendar-event-popup">
                                                    jQuery FullCalendar 1
                                                </a>
                                            </li>
                                            <li>
                                                <a href="${pageContext.request.contextPath}/pages/plugins/calendar/jQuery-fullcalendar-constraint">
                                                    jQuery FullCalendar Constraint
                                                </a>
                                            </li>
                                            <li>
                                                <a href="${pageContext.request.contextPath}/pages/plugins/calendar/jQuery-fullcalendar-year">
                                                    jQuery FullCalendar Year
                                                </a>
                                            </li>
                                            <li>
                                                <a href="${pageContext.request.contextPath}/pages/plugins/calendar/jQuery-fullcalendar-diary-system">
                                                    Web Diary System
                                                </a>
                                            </li>
                                        </ul>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/pages/plugins/bootstrap-date-range-picker">
                                            Bootstrap Date Range Picker
                                        </a>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/pages/plugins/bootstrap-colorselector">
                                            Bootstrap Color Selector
                                        </a>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/pages/plugins/jQuery-select2-bootstrap">
                                            jQuery Bootstrap Select2 complete demo
                                        </a>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/DynamicSelect2PageController">
                                            Dynamic jQuery Bootstrap Select2 complete demo
                                        </a>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/pages/plugins/bootstrap-maxlength">
                                            Bootstrap Maxlength
                                        </a>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/pages/plugins/form-textarea-autosize">
                                            Form Textarea Autosize
                                        </a>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/pages/plugins/bootstrap-summernote-editor">
                                            Bootstrap Summernote Editor
                                        </a>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/cms/ContentPageController">
                                            Dynamic Bootstrap Summernote Editor
                                        </a>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/pages/plugins/ion-rangeSlider">
                                            Ion Range Slider
                                        </a>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/pages/plugins/bootstrap-slider">
                                            bootstrap-slider Plugin
                                        </a>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/pages/plugins/cropper-image-cropping">
                                            Cropper - Image Cropping Plugin for jQuery
                                        </a>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/pages/plugins/jQuery-ScrollUp">
                                            jQuery ScrollUp Plugin
                                        </a>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/pages/plugins/jquery.counterup">
                                            jQuery CounterUp Plugin
                                        </a>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/pages/plugins/bootstrap-dual-select">
                                            Bootstrap Dual Select
                                        </a>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/pages/plugins/jQuery-timeago">
                                            jQuery timeago plugin
                                        </a>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/pages/plugins/malihu-custom-scrollbar-plugin">
                                            Malihu Custom Scrollbar Plugin
                                        </a>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/pages/plugins/dynamic-malihu-custom-scrollbar-plugin">
                                            Dynamic Malihu Custom Scrollbar Plugin
                                        </a>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/pages/plugins/dynamic-messages-using-malihu-scrollable">
                                            Dynamic Messages Using Malihu Scrollable
                                        </a>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/pages/plugins/bootstrap-modal-wrapper">
                                            Bootstrap Modal Wrapper Plugin
                                        </a>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/pages/plugins/bootstrap-contextMenu">
                                            Bootstrap ContextMenu Plugin
                                        </a>
                                    </li>
                                    <li>
                                        <a href="pages/plugins/moment.js">
                                            Moment.js Date/Time Plugin
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
                                            Basic HTML5 Form Validation
                                        </a>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/pages/form/jQuery-form-validation">
                                            jQuery Form Validation
                                        </a>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/pages/form/form-input-mask">
                                            Form Input Mask
                                        </a>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/pages/form/jQuery-form-plugin">
                                            jQuery Form Plugin
                                        </a>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/pages/form/advance-form-plugins">
                                            Advanced Form Plugins
                                        </a>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/pages/form/dynamic-wizard-with-advanced-form-page">
                                            Dynamic Wizard with Advanced Form Plugins
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
                                                <a href="${pageContext.request.contextPath}/pages/wizard/native-bootstrap-tab/default-bootstrap-pill-wizard">
                                                    Default Bootstrap Pill Wizard
                                                </a>
                                            </li>
                                            <li>
                                                <a href="${pageContext.request.contextPath}/pages/wizard/native-bootstrap-tab/disabled-bootstrap-pill-wizard">
                                                    Disabled Bootstrap Pill Wizard
                                                </a>
                                            </li>
                                            <li>
                                                <a href="${pageContext.request.contextPath}/pages/wizard/native-bootstrap-tab/modal-bootstrap-pill-wizard">
                                                    Modal Bootstrap Pill Wizard
                                                </a>
                                            </li>
                                            <li>
                                                <a href="${pageContext.request.contextPath}/pages/wizard/native-bootstrap-tab/vertical-modal-bootstrap-pill-wizard">
                                                    Vertical Modal Bootstrap Pill Wizard
                                                </a>
                                            </li>
                                            <li>
                                                <a href="${pageContext.request.contextPath}/pages/wizard/native-bootstrap-tab/ajax-bootstrap-pill-wizard">
                                                    Ajax Modal Bootstrap Pill Wizard
                                                </a>
                                            </li>
                                            <li>
                                                <a href="${pageContext.request.contextPath}/pages/wizard/native-bootstrap-tab/vertical-validation-bootstrap-pill-wizard">
                                                    Vertical Validation Bootstrap Pill Wizard
                                                </a>
                                            </li>
                                            <li>
                                                <a href="${pageContext.request.contextPath}/pages/wizard/native-bootstrap-tab/horizontal-validation-bootstrap-pill-wizard">
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
                                            Bootstrap Table
                                        </a>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/pages/table/scrollable-fixed-bootstrap-table">
                                            Scrollable Fixed Bootstrap Table
                                        </a>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/pages/table/dynamic-sortable-table">
                                            Dynamic Sortable Table
                                        </a>
                                    </li>
                                    <li>
                                        <a class="has-arrow" href="#">
                                            DataTables Plugin

                                        </a>
                                        <ul aria-expanded="true">
                                            <li>
                                                <a href="${pageContext.request.contextPath}/pages/table/datatable/defalut-datatables-bootstrap-4">
                                                    Defalut Datatables Bootstrap 4 theme
                                                </a>
                                            </li>
                                            <li>
                                                <a href="${pageContext.request.contextPath}/pages/table/datatable/defalut-datatables-fixedcolumn-with-key-navigation">
                                                    Datatables Bootstrap Fixed Column with key navigation
                                                </a>
                                            </li>
                                            <li>
                                                <a href="${pageContext.request.contextPath}/pages/table/datatable/defalut-datatables-row-grouping">
                                                    Datatables Bootstrap Row Grouping
                                                </a>
                                            </li>
                                            <li>
                                                <a href="${pageContext.request.contextPath}/pages/table/datatable/responsive-datatables-bootstrap-4">
                                                    Responsive Datatables Bootstrap 4 theme
                                                </a>
                                            </li>
                                            <li>
                                                <a href="${pageContext.request.contextPath}/pages/table/datatable/fixedHeader-datatables-bootstrap-4">
                                                    FixedHeader Datatables Bootstrap 4 theme
                                                </a>
                                            </li>
                                            <li>
                                                <a href="${pageContext.request.contextPath}/pages/table/datatable/scrollable-datatables">
                                                    Scrollable DataTable
                                                </a>
                                            </li>
                                            <li>
                                                <a href="${pageContext.request.contextPath}/pages/table/datatable/selectable-datatables-bootstrap-4">
                                                    Selectable DataTable
                                                </a>
                                            </li>
                                            <li>
                                                <a href="${pageContext.request.contextPath}/pages/table/datatable/checkbox-selection-datatables-bootstrap-4">
                                                    Checkbox selection
                                                </a>
                                            </li>
                                            <li>
                                                <a href="${pageContext.request.contextPath}/pages/table/datatable/row-selection-using-checkboxes">
                                                    Row selection using checkboxes
                                                </a>
                                            </li>
                                            <li>
                                                <a href="${pageContext.request.contextPath}/pages/table/datatable/individual-column-searching">
                                                    individual-column-searching
                                                </a>
                                            </li>
                                            <li>
                                                <a href="${pageContext.request.contextPath}/pages/table/datatable/datatables-footer-summary">
                                                    Datatables with Footer Summary
                                                </a>
                                            </li>
                                            <li>
                                                <a href="${pageContext.request.contextPath}/pages/table/datatable/dynamic-datatables">
                                                    Dynamic Datatables Demo
                                                </a>
                                            </li>
                                            <li>
                                                <a href="${pageContext.request.contextPath}/pages/table/datatable/dynamic-individual-column-searching-datatables">
                                                    Dynamic Individual Column Searching Datatables
                                                </a>
                                            </li>
                                            <li>
                                                <a href="${pageContext.request.contextPath}/pages/table/datatable/dynamic-messages">
                                                    Dynamic Messages
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
                                            ECharts
                                        </a>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/pages/chart/dynamic-echarts">
                                            Dynamic ECharts
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
                                            Carousel
                                        </a>
                                        <ul aria-expanded="true">
                                            <li>
                                                <a href="${pageContext.request.contextPath}/pages/gallery/carousel/bootstrap-carousel">
                                                    Bootstrap Carousel
                                                </a>
                                            </li>
                                            <li>
                                                <a href="${pageContext.request.contextPath}/pages/gallery/carousel/carousel-product-slider">
                                                    Carousel Product Slider
                                                </a>
                                            </li>
                                            <li>
                                                <a href="${pageContext.request.contextPath}/pages/gallery/carousel/up-tabbed-slider-carousel">
                                                    Up Tabbed Slider Carousel
                                                </a>
                                            </li>
                                            <li>
                                                <a href="${pageContext.request.contextPath}/pages/gallery/carousel/slick-carousel">
                                                    Slick Carousel
                                                </a>
                                            </li>
                                        </ul>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/pages/gallery/file-controller-serve">
                                            Simple Servlet for Files
                                        </a>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/pages/gallery/file-uploader-manager">
                                            File Uploader Manager
                                        </a>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/pages/gallery/edit-image-locally">
                                            Edit Image Locally
                                        </a>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/pages/gallery/simple-thumbnail-gallery">
                                            Simple Thumbnail Gallery
                                        </a>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/pages/gallery/view-image-using-bs-model">
                                            View Image Using Bootstrap Model
                                        </a>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/pages/gallery/view-image-using-pager-bs-model">
                                            View Image Using Pager Bootstrap Model
                                        </a>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/pages/gallery/view-image-using-pagination-bs-model">
                                            View Image Using Pagination Bootstrap Model
                                        </a>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/pages/gallery/action-thumbnail-gallery">
                                            Action Thumbnail Gallery
                                        </a>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/pages/gallery/tool-thumbnail-gallery">
                                            Tool Thumbnail Gallery
                                        </a>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/pages/gallery/portfolio-gallery-with-filtering-category">
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
                                            Empty Pages
                                        </a>
                                        <ul>
                                            <li>
                                                <a href="${pageContext.request.contextPath}/pages/custom-pages/empty-pages/empty-page">
                                                    Empty Page with nothing
                                                </a>
                                            </li>
                                            <li>
                                                <a href="${pageContext.request.contextPath}/pages/custom-pages/empty-pages/blank-page">
                                                    Blank Page
                                                </a>
                                            </li>
                                            <li>
                                                <a href="${pageContext.request.contextPath}/pages/custom-pages/empty-pages/two-cols-blank-page">
                                                    Two Columns Blank Page
                                                </a>
                                            </li>
                                            <li>
                                                <a href="${pageContext.request.contextPath}/pages/custom-pages/empty-pages/card-page">
                                                    Card Page
                                                </a>
                                            </li>
                                            <li>
                                                <a href="${pageContext.request.contextPath}/pages/custom-pages/empty-pages/event-page">
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
                                                <a href="${pageContext.request.contextPath}/pages/custom-pages/dashboard/users-dashboard-1">
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
                                                <a href="${pageContext.request.contextPath}/pages/custom-pages/inbox/inbox-messages">
                                                    Inbox Messages
                                                </a>
                                            </li>
                                            <li>
                                                <a action-name="compose-page" href="${pageContext.request.contextPath}/pages/custom-pages/inbox/compose-message">
                                                    Compose Message
                                                </a>
                                            </li>
                                            <li>
                                                <a action-name="view-message" href="${pageContext.request.contextPath}/pages/custom-pages/inbox/view-message">
                                                    View Message
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
                                                <a target="_blank" action-name="login-page"  href="${pageContext.request.contextPath}/login?lang=${labels["global.language"]}">
                                                    Default Login Page
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
                                                <a href="${pageContext.request.contextPath}/pages/custom-pages/invoice/create-invoice-form">
                                                    Create Invoice Form
                                                </a>
                                            </li>
                                            <li>
                                                <a href="${pageContext.request.contextPath}/pages/custom-pages/invoice/invoice-template-1">
                                                    Invoice Template 1
                                                </a>
                                            </li>
                                            <li>
                                                <a href="${pageContext.request.contextPath}/pages/custom-pages/invoice/invoice-template-2">
                                                    Invoice Template 2
                                                </a>
                                            </li>
                                        </ul>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/pages/custom-pages/todo-list">
                                            ToDo App
                                        </a>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/pages/custom-pages/menu-template">
                                            Menu Template Page
                                        </a>
                                    </li>
                                    <li>
                                        <a target="_blank" action-name="404-error-page" href="${pageContext.request.contextPath}/pages/custom-pages/404-page?lang=${labels["global.language"]}">
                                            404 Page
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
        <script src="${pageContext.request.contextPath}/assets/dist/js/javatmp-plugins-all.min.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/assets/dist/js/javatmp-plugins-all-locale-${sessionScope.user.lang}.min.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/assets/dist/js/javatmp.min.js" type="text/javascript"></script>
        <script type="text/javascript">
            jQuery(function ($) {
                var defaults = {
                    defaultPassData: {_ajax: "ajax", _ajaxGlobalBlockUI: true, _handleAjaxErrorGlobally: true},
                    defaultUrl: '${pageContext.request.contextPath}/pages/home',
                    floatDefault: "${labels['global.floatDefault']}",
                    floatReverse: "${labels['global.floatReverse']}",
                    direction: "${labels['global.direction']}",
                    isRTL: ${labels['global.direction'] == 'ltr' ? 'false' : 'true'},
                    contextPath: '${pageContext.request.contextPath}'
                };
                index.init(defaults);

                javatmp.user = {};
                javatmp.user.id = ${sessionScope.user.id};
                javatmp.user.lang = "${sessionScope.user.lang}";
                // force en as a moment locale for now
                moment.locale("en");
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
                javatmp.settings.jqueryValidationDefaultOptions = {
                    rules: {},
                    messages: {},
                    highlight: function (element) {
                        $(element).closest('.form-group').removeClass('has-success').addClass('has-error');
                    },
                    unhighlight: function (element) {
                        $(element).closest('.form-group').removeClass('has-error').addClass('has-success');
                    },
                    errorElement: 'small',
                    errorClass: 'form-text text-danger',
                    errorPlacement: function (error, element) {
                        if (element.length) {
                            var targetParent = $(element).parent();
                            if (targetParent.hasClass("form-check") || targetParent.hasClass("custom-control")) {
                                targetParent = targetParent.parent();
                            }
                            targetParent.append(error);
                        }
                    }
                };
                // register global jquery validator methods:
                jQuery.validator.addMethod("summernoteRequired", function (value, element, params) {
                    if (this.optional(element))
                        return true;
                    if (value !== "" && value !== "<p><br></p>")
                        return true;
                    return false;
                }, 'Kindly Provide a value');
                jQuery.validator.addMethod("validDate", function (value, element) {
                    return this.optional(element) || moment(value, "DD/MM/YYYY", true).isValid();
                }, "Please enter a valid date in the format DD/MM/YYYY");
                jQuery.validator.addMethod("validDateTime", function (value, element) {
                    return this.optional(element) || moment(value, "DD/MM/YYYY HH:mm", true).isValid();
                }, "Please enter a valid date in the format DD/MM/YYYY HH:MI");

                jQuery.validator.addMethod("dateTimeBeforeNow", function (value, element, params) {
                    if (this.optional(element) || $(params).val() === "")
                        return true;
                    if (moment(value, "DD/MM/YYYY HH:mm").isBefore(moment()))
                        return true;
                    return false;
                }, 'Must be less than Now.');

                jQuery.validator.addMethod("dateBeforeNow", function (value, element, params) {
                    if (this.optional(element) || value === "")
                        return true;
                    if (moment(value, "DD/MM/YYYY").isBefore(moment().set({hour: 0, minute: 0, second: 0, millisecond: 0})))
                        return true;
                    return false;
                }, 'Must be less than Now.');

                jQuery.validator.addMethod("dateGreaterThan", function (value, element, params) {
                    if (this.optional(element) || $(params).val() === "")
                        return true;
                    if (moment(value, "DD/MM/YYYY HH:mm").isAfter(moment($(params).val(), "DD/MM/YYYY HH:mm")))
                        return true;
                    return false;
                }, 'Must be greater than other value.');
                jQuery.validator.addMethod("dateLessThan", function (value, element, params) {
                    if (this.optional(element) || $(params).val() === "")
                        return true;
                    if (moment(value, "DD/MM/YYYY HH:mm").isBefore(moment($(params).val(), "DD/MM/YYYY HH:mm")))
                        return true;
                    return false;
                }, 'Must be less than other value.');
                jQuery.validator.addMethod("dateEqualOrGreaterThan", function (value, element, params) {
                    if (this.optional(element) || $(params).val() === "")
                        return true;
                    if (moment(value, "DD/MM/YYYY HH:mm").isSameOrAfter(moment($(params).val(), "DD/MM/YYYY HH:mm")))
                        return true;
                    return false;
                }, 'Must be equal or greater than other value.');
                jQuery.validator.addMethod("dateEqualOrLessThan", function (value, element, params) {
                    if (this.optional(element) || $(params).val() === "")
                        return true;
                    if (moment(value, "DD/MM/YYYY HH:mm").isSameOrBefore(moment($(params).val(), "DD/MM/YYYY HH:mm")))
                        return true;
                    return false;
                }, 'Must be equal or less than other value.');

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
                        '<a class="p-2 list-group-item list-group-item-action" actionType="ajax-model" href="{{contextPath}}/message/ViewMessageController?messageId={{messageId}}">' +
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

                var indicatorTemplate = '<div class="fetch-indicator text-center m-2 p-2"><i class="fa fa-sync fa-spin fa-3x fa-fw text-primary"></i></div>';
                var workingDown = false;
                var workingTop = false;
                var startFrom = 0;
                var fetchOnce = false;
                var recordPerPage = 10;
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
                                    "data": "creationDate",
                                    search: {
                                        "value": moment(newestDate).format("YYYY-MM-DDTHH:mm:ss.SSSZ"),
                                        "operatorType": "newerThan"
                                    }
                                },
                                {
                                    "data": "toUserId",
                                    search: {
                                        "value": toUserId
                                    }
                                }
                            ]
                        };
                        console.log("Try fetching any message newer than [" + moment(newestDate).format("YYYY/MM/DD HH:mm:ss.SSS Z") + "]");
                        $.ajax({
                            "type": "POST",
                            url: javatmp.settings.contextPath + "/user/ListMessagesController",
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
                                        'contextPath': javatmp.settings.contextPath
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
                                    {"column": 0, "dir": "asc"}
                                ],
                                columns: [{
                                        "data": "creationDate",
                                        search: {
                                            "value": moment(oldestDate).format("YYYY-MM-DDTHH:mm:ss.SSSZ"),
                                            "operatorType": "olderThan"
                                        }
                                    },
                                    {
                                        "data": "toUserId",
                                        search: {
                                            "value": toUserId
                                        }
                                    }
                                ]
                            };
                            $.ajax({
                                "type": "POST",
                                url: javatmp.settings.contextPath + "/user/ListMessagesController",
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
                                            'contextPath': javatmp.settings.contextPath
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
        <script type="text/javascript">
            jQuery(function ($) {
                $(".updateLanguagelink").on("click", function (event) {
                    event.preventDefault();
                    var url = $(this).attr("href");
                    $.ajax({
                        cache: false,
                        type: "GET",
                        url: url,
                        beforeSend: function () {
                        },
                        success: function (response, textStatus, jqXHR) {
                            window.location.reload(true);
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                        }
                    });
                });
            });</script>
        <!-- build:remove -->
        <script>             (function (i, s, o, g, r, a, m) {
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