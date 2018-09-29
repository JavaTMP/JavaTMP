<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="dynamic-ajax-content">
    <div class="row">
        <div class="col-lg-12">
            <div class="alert alert-info my-3">
                <p>jQuery contextMenu plugin & polyfill.</p>
                <br/>
                <p>
                    <a class="btn btn-info" target="_blank" href="http://swisnl.github.io/jQuery-contextMenu/demo.html"><i class="fa fa-external-link-alt fa-fw"></i>Demo Page</a>
                    <a class="btn btn-info" target="_blank" href="https://github.com/swisnl/jQuery-contextMenu"><i class="fa fa-external-link-alt fa-fw"></i>github.com Page</a>
                </p>
            </div>
            <div class="card my-3">
                <div class="card-header">
                    jQuery contextMenu plugin
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
                        <div class="col-lg-12">
                            <button class="context-menu-one btn btn-primary">right click me</button>
                            <h4>Context Menu on DOM Element</h4>
                            <ul id="the-node">
                                <li><span class="context-menu-one">right click me 1</span></li>
                                <li><span class="context-menu-one">right click me 2</span></li>
                                <li>right click me 3</li>
                                <li>right click me 4</li>
                            </ul>
                            <h4>Left-Click Trigger</h4>
                            <button class="left-context-menu-one btn btn-primary">Left click me</button>
                            <h4>Submenus</h4>
                            <button class="left-context-submenus-one btn btn-primary">Right click me</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <style type="text/css">

    </style>
    <script type="text/javascript">
        jQuery(function ($) {
            // any code put here will be run after content attach to ajax output container and before
            // controll return to main javascript file.
            $.contextMenu({
                rtl: javatmp.settings.isRTL,
                position: function (opt, x, y) {
                    if (javatmp.settings.isRTL === true) {
                        var menuWidth = $(opt.$menu).outerWidth();
                        opt.$menu.css({top: y, left: x - menuWidth});
                    } else {
                        opt.$menu.css({top: y, left: x});
                    }
                },
                selector: '.context-menu-one',
                callback: function (key, options) {
                    var m = "clicked: " + key;
                    window.console && console.log(m) || alert(m);
                },
                items: {
                    "edit": {name: "Edit", icon: "edit"},
                    "cut": {name: "Cut", icon: "cut"},
                    copy: {name: "Copy", icon: "copy"},
                    "paste": {name: "Paste", icon: "paste"},
                    "delete": {name: "Delete", icon: "delete"},
                    "sep1": "---------",
                    "quit": {name: "Quit", "icon": "quit"}
                }
            });
            $.contextMenu({
                rtl: javatmp.settings.isRTL,
                position: function (opt, x, y) {
                    if (javatmp.settings.isRTL === true) {
                        var menuWidth = $(opt.$menu).outerWidth();
                        opt.$menu.css({top: y, left: x - menuWidth});
                    } else {
                        opt.$menu.css({top: y, left: x});
                    }
                },
                selector: '.left-context-menu-one',
                trigger: 'left',
                callback: function (key, options) {
                    var m = "clicked: " + key;
                    window.console && console.log(m) || alert(m);
                },
                items: {
                    "edit": {name: "Edit", icon: "edit"},
                    "cut": {name: "Cut", icon: "cut"},
                    "copy": {name: "Copy", icon: "copy"},
                    "paste": {name: "Paste", icon: "paste"},
                    "delete": {name: "Delete", icon: "delete"},
                    "sep1": "---------",
                    "icon": "quit"
                }
            });
            $.contextMenu({
                rtl: javatmp.settings.isRTL,
                position: function (opt, x, y) {
                    if (javatmp.settings.isRTL === true) {
                        var menuWidth = $(opt.$menu).outerWidth();
                        opt.$menu.css({top: y, left: x - menuWidth});
                    } else {
                        opt.$menu.css({top: y, left: x});
                    }
                },
                selector: '.left-context-submenus-one',
                callback: function (key, options) {
                    var m = "clicked: " + key;
                    window.console && console.log(m) || alert(m);
                },
                items: {
                    "edit": {"name": "Edit", "icon": "edit"},
                    "cut": {"name": "Cut", "icon": "cut"},
                    "sep1": "---------",
                    "quit": {"name": "Quit", "icon": "quit"},
                    "sep2": "---------",
                    "fold1": {
                        "name": "Sub group",
                        "items": {
                            "fold1-key1": {"name": "Foo bar"},
                            "fold2": {
                                "name": "Sub group 2",
                                "items": {
                                    "fold2-key1": {"name": "alpha"},
                                    "fold2-key2": {"name": "bravo"},
                                    "fold2-key3": {"name": "charlie"}
                                }
                            },
                            "fold1-key3": {"name": "delta"}
                        }
                    },
                    "fold1a": {
                        "name": "Other group",
                        "items": {
                            "fold1a-key1": {"name": "echo"},
                            "fold1a-key2": {"name": "foxtrot"},
                            "fold1a-key3": {"name": "golf"}
                        }
                    }
                }
            });

            // fire AFTER all transition done and your ajax content is shown to user.
            $(javatmp.settings.defaultOutputSelector).on(javatmp.settings.javaTmpAjaxContainerReady, function (event) {

            });
            // fire when user resize browser window or sidebar hide / show
            $(javatmp.settings.defaultOutputSelector).on(javatmp.settings.javaTmpContainerResizeEventName, function (event) {

            });
            $(javatmp.settings.defaultOutputSelector).on(javatmp.settings.cardFullscreenCompress, function (event, card) {
                // when card compress by pressing the top right tool button

            });
            $(javatmp.settings.defaultOutputSelector).on(javatmp.settings.cardFullscreenExpand, function (event, card) {
                // when card Expand by pressing the top right tool button
            });
            // before container replaced with new ajax content.
            $(javatmp.settings.defaultOutputSelector).on(javatmp.settings.javaTmpContainerRemoveEventName, function (event) {
                $(javatmp.settings.defaultOutputSelector).off(javatmp.settings.cardFullscreenCompress);
                $(javatmp.settings.defaultOutputSelector).off(javatmp.settings.cardFullscreenExpand);
                return true;
            });
        });
    </script>
</div>