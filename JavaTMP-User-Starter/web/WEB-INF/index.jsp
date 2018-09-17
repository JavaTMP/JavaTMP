<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="${labels["global.language"]}" dir="${labels["global.direction"]}">
    <head>
        <title>${labels["global.page.title"]}</title>
        <!-- Required meta tags -->
        <meta charset="utf-8">
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
                <li class="nav-item dropdown">
                    <a class="line-height-1 d-flex align-items-center h-100 text-left nav-link dropdown-toggle" data-toggle="dropdown" href="#">
                        <c:choose>
                            <c:when test="${not empty sessionScope.user.profilePicDocument.documentId and not empty sessionScope.user.profilePicDocument.randomHash}">
                                <img class="logo-image rounded-circle mr-1" src="${pageContext.request.contextPath}/ViewUploadedFileController?documentId=${sessionScope.user.profilePicDocument.documentId}&amp;randomHash=${sessionScope.user.profilePicDocument.randomHash}&amp;viewType=inline" alt=""/>
                            </c:when>
                            <c:otherwise>
                                <img class="logo-image rounded-circle mr-1" src="${pageContext.request.contextPath}/assets/img/default-profile-pic.png" alt=""/>
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
                                    title="Exit and Sign out">
                                <i class="fas fa-sign-out-alt"></i>
                            </button>
                            <button class="btn btn-primary"
                                    actionType="action-ref-href"
                                    action-ref-by-href="${pageContext.request.contextPath}/user/GetListUsersPage"
                                    data-toggle="tooltip" data-placement="auto"
                                    title="Users List">
                                <i class="fas fa-users fa-fw"></i>
                            </button>
                            <button class="btn btn-primary"
                                    actionType="action-ref-href"
                                    action-ref-by-href="${pageContext.request.contextPath}/user/CreateUserController"
                                    data-toggle="tooltip" data-placement="auto"
                                    title="Add New User">
                                <i class="fas fa-user-plus"></i>
                            </button>
                            <button class="btn btn-primary"
                                    actionType="action-ref-href"
                                    action-ref-by-href="${pageContext.request.contextPath}/user/CurrentUserProfileController"
                                    data-toggle="tooltip" data-placement="auto"
                                    title="Current User Profile">
                                <i class="far fa-user-circle"></i>
                            </button>
                            <button class="btn btn-primary"
                                    actionType="action-ref-href"
                                    action-ref-by-href="${pageContext.request.contextPath}/pages/home"
                                    data-toggle="tooltip" data-placement="auto"
                                    title="${labels['sidebar.menu_item.home']}">
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
                        <ul class="metismenu">
                            <li>
                                <a href="${pageContext.request.contextPath}/pages/home">
                                    <i class="fa fa-lg fa-fw fa-home"></i>
                                    ${labels['sidebar.menu_item.home']}
                                </a>
                            </li>
                            <li>
                                <a class="has-arrow" href="#">
                                    <i class="fa fa-lg fa-fw fa-users"></i>
                                    ${labels['sidebar.menu_item.users']}
                                </a>
                                <ul>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/user/GetListUsersPage">
                                            Users List
                                        </a>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/user/GetListUsersWithDetailsPage">
                                            Users List With Details
                                        </a>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/user/CreateUserController">
                                            Add New User
                                        </a>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/user/SearchForUserProfileController">
                                            Search For User
                                        </a>
                                    </li>
                                </ul>
                            </li>
                            <li>
                                <a class="has-arrow" href="#">
                                    <i class="fa fa-lg fa-fw fa-cogs"></i>
                                    ${labels['sidebar.menu_item.system']}
                                </a>
                                <ul>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/user/CurrentUserProfileController">
                                            User Profile Settings
                                        </a>
                                    </li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                    <div class="main-content">
                        <div class="main-breadcrumb-bar d-flex flex-row shadow">
                            <ol class="breadcrumb"></ol>
                            <div class="breadcrumb-submenu">
                                <a class="float-right min-tools-button">
                                    <i class="fa fa-sync-alt  faa-spin animated-hover"></i>
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