<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="dynamic-ajax-content grid-gutter-padding">
    <div class="row">
        <div class="col-lg-12">
            <div class="alert alert-info mt-3">
                <p>Fancytree is a jQuery tree view / tree grid plugin with support for keyboard, inline editing, filtering, checkboxes, drag'n'drop, and lazy loading</p>
                <p>
                    <a target="_blank" class="btn btn-info" href="http://wwwendt.de/tech/fancytree/demo/">Demo Site</a>
                    <a target="_blank" class="btn btn-info" href="https://github.com/mar10/fancytree">github source code</a>
                </p>
            </div>
            <div class="card my-3">
                <div class="card-header">
                    ContextMenu fancytree
                    <div class="options float-right">
                        <a class="settings"><i class="fa fa-cog"></i></a>
                        <a href="#" class="collapse"><i class="fa fa-chevron-up"></i></a>
                        <a href="#" class="reload"><i class="fa fa-sync"></i></a>
                        <a href="#" class="fullscreen"><i class=" fa fa-expand"></i></a>
                        <a href="#" class="remove"><i class="fa fa-times"></i></a>
                    </div>
                </div>
                <div class="card-body p-0">
                    <div id="ContextMenu_Fancytree_id"></div>
                </div>
            </div>
        </div>
    </div>
    <div id="contextMenu" class="dropdown-menu" role="menu" style="display:none;position: fixed;" >
        <a tabindex="-1" class="dropdown-item" href="javascript:;" actionType="action-ref" action-ref-by-name="Add-New-User-Action">
            <i class="fa fa-fw fa-user text-primary"></i>
            Add New User
        </a>
        <a tabindex="-1" class="dropdown-item" href="javascript:;" actionType="action-ref" action-ref-by-name="Add-New-User-Popup-Action">
            <i class="fa fa-external-link-alt fa-fw text-primary"></i>
            Add New User Popup
        </a>
        <a tabindex="-1" class="dropdown-item" href="javascript:;" actionType="action-ref" action-ref-by-name="Update-Complete-User-Action">
            <i class="fa fa-user-edit fa-fw text-primary"></i>
            Update Complete User
        </a>
        <a tabindex="-1" class="dropdown-item" href="javascript:;" actionType="action-ref" action-ref-by-name="Activate-User-Action">
            <i class="fa fa-user-check fa-fw text-success"></i>
            Activate User
        </a>
        <a tabindex="-1" class="dropdown-item" href="javascript:;" actionType="action-ref" action-ref-by-name="Deactivate-User-Action">
            <i class="fa fa-user-slash fa-fw text-warning"></i>
            Deactivate User
        </a>
        <div class="dropdown-divider"></div>
        <a tabindex="-1" class="dropdown-item" href="javascript:;" actionType="action-ref" action-ref-by-name="Delete-User-Action">
            <i class="fa fa-user-times fa-fw text-danger"></i>
            Delete User
        </a>
    </div>
    <script type="text/javascript">
        jQuery(document).ready(function () {
            (function ($) {

                var $contextMenu = $("#contextMenu");
                function getMenuPosition($contextMenu, mouse, direction, scrollDir, isRTL) {
                    var win = $(window)[direction]();
                    var scroll = $(window)[scrollDir]();
                    var menu = $($contextMenu)[direction]();
//                var position = mouse + scroll;
                    var position = mouse + 0;
                    if (direction === "width" && (position - $($contextMenu)[direction]() > 0) && isRTL) {
                        position = position - $($contextMenu)[direction]();
                    } else {
                        // opening menu would pass the side of the page
                        if (mouse + menu > win && menu < mouse)
                            position -= menu;
                    }
                    return position;
                }

                glyph_opts = {
                    preset: "awesome5",
                    map: {
                        doc: "far fa-file-alt",
                        docOpen: "far fa-file",
                        checkbox: "far fa-square",
                        checkboxSelected: "far fa-check-square",
                        checkboxUnknown: "far fa-minus-square",
                        dragHelper: "fa fa-arrows",
                        dropMarker: "fa fa-arrow-right",
                        error: "fa fa-exclamation-triangle",
                        expanderClosed: "fa fa-chevron-right",
                        expanderLazy: "fa fa-chevron-right",
                        expanderOpen: "fa fa-chevron-down",
                        folder: "fa fa-folder",
                        folderOpen: "fa fa-folder-open",
                        loading: "fa fa-sync fa-spin"
                    }
                };
                if (javatmp.settings.isRTL === true) {
                    $.extend(true, glyph_opts, {
                        map: {
                            dropMarker: "fa fa-arrow-left",
                            expanderClosed: "fa fa-chevron-left",
                            expanderLazy: "fa fa-chevron-left"
                        }
                    });
                }
                var SOURCE = [
                    {title: "item1 with key and tooltip", tooltip: "Look, a tool tip!"},
                    {title: "item2: selected on init", selected: true},
                    {title: "Folder", folder: true, key: "id3",
                        children: [
                            {title: "Sub-item 3.1",
                                children: [
                                    {title: "Sub-item 3.1.1", key: "id3.1.1"},
                                    {title: "Sub-item 3.1.2", key: "id3.1.2"}
                                ]
                            },
                            {title: "Sub-item 3.2",
                                children: [
                                    {title: "Sub-item 3.2.1", key: "id3.2.1"},
                                    {title: "Sub-item 3.2.2", key: "id3.2.2"}
                                ]
                            }
                        ]
                    },
                    {title: "Document with some children (expanded on init)", key: "id4", expanded: true,
                        children: [
                            {title: "Sub-item 4.1 (active on init)", active: true,
                                children: [
                                    {title: "Sub-item 4.1.1", key: "id4.1.1"},
                                    {title: "Sub-item 4.1.2", key: "id4.1.2"}
                                ]
                            },
                            {title: "Sub-item 4.2 (selected on init)", selected: true,
                                children: [
                                    {title: "Sub-item 4.2.1", key: "id4.2.1"},
                                    {title: "Sub-item 4.2.2", key: "id4.2.2"}
                                ]
                            },
                            {title: "Sub-item 4.3 (hideCheckbox)", hideCheckbox: true},
                            {title: "Sub-item 4.4 (unselectable)", unselectable: true}
                        ]
                    },
                    {title: "Lazy folder", folder: true, lazy: true}
                ];
                // Initialize Fancytree

                $('#ContextMenu_Fancytree_id').fancytree({
                    rtl: javatmp.settings.isRTL,
                    extensions: ["glyph"],
                    glyph: glyph_opts,
                    source: {
                        url: 'assets/data/ajax-tree-local.json'
                    },
                    lazyLoad: function (event, data) {
                        data.result = {url: 'assets/data/fancytreeCheckboxes.json'};
                    },
                    init: function (event, data, flag) {
                        $('#ContextMenu_Fancytree_id').on('contextmenu', '.fancytree-title', function (e) {
                            if (e.ctrlKey)
                                return;

                            var node = $.ui.fancytree.getNode(this);
                            node.setSelected(true);
                            node.setActive(true);

                            $contextMenu.css({
                                "z-index": 2000,
                                display: "block",
                                left: getMenuPosition($contextMenu, e.clientX, 'width', 'scrollLeft', javatmp.settings.isRTL),
                                right: "auto",
                                top: getMenuPosition($contextMenu, e.clientY, 'height', 'scrollTop', javatmp.settings.isRTL)
                            });
                            return false;
                        });
                        $contextMenu.on("click", "a", function () {
                            $contextMenu.hide();
                        });
                        $('body,html').on("click", function () {
                            $contextMenu.hide();
                        });
                    },
                    keydown: function (event, data) {
                        if (event.which === 32) {
                            data.node.toggleSelected();
                            return false;
                        }
                        if (javatmp.settings.isRTL === true) {
                            var KC = $.ui.keyCode;
                            var oe = event.originalEvent;
                            // Swap LEFT/RIGHT keys
                            switch (event.which) {
                                case KC.LEFT:
                                    oe.keyCode = KC.RIGHT;
                                    oe.which = KC.RIGHT;
                                    break;
                                case KC.RIGHT:
                                    oe.keyCode = KC.LEFT;
                                    oe.which = KC.LEFT;
                                    break;
                            }
                        }
                    }
                });
            }(jQuery));
        });
    </script>
</div>