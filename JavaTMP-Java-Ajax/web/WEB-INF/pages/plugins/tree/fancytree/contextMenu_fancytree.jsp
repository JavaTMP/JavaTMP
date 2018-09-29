<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="dynamic-ajax-content">
    <div class="row">
        <div class="col-lg-12">
            <div class="alert alert-info my-3">
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
    <script type="text/javascript">
        jQuery(document).ready(function () {
            (function ($) {
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
//                    extensions: ['contextMenu'],
                    glyph: glyph_opts,
                    source: {
                        url: 'assets/data/ajax-tree-local.json'
                    },
                    lazyLoad: function (event, data) {
                        data.result = {url: 'assets/data/fancytreeCheckboxes.json'};
                    },
                    keydown: function (event, data) {
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
                    },
                    init: function (event, data, flag) {
                        $.contextMenu({
                            rtl: javatmp.settings.isRTL,
                            selector: '.fancytree-title',
//                            appendTo: javatmp.settings.defaultOutputSelector,
                            reposition: true,
                            events: {
                                show: function (options) {
                                    var node = $.ui.fancytree.getNode(this);
                                    node.setSelected(true);
                                    node.setActive(true);
                                }
                            },
                            position: function (opt, x, y) {
                                if (javatmp.settings.isRTL === true) {
                                    var menuWidth = $(opt.$menu).outerWidth();
                                    opt.$menu.css({top: y, left: x - menuWidth});
                                } else {
                                    opt.$menu.css({top: y, left: x});
                                }
                            },
                            callback: function (key, options) {
                                var node = $.ui.fancytree.getNode(this);
                                BootstrapModalWrapperFactory.showMessage('Selected action "' + key + '" on node [' + node + "]");
                                return true;
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
                    }
                });

            }(jQuery));
        });
    </script>
</div>