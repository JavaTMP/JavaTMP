<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="dynamic-ajax-content grid-gutter-padding">
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
                    Checkboxes Fancytree
                    <div class="options float-right">
                        <a class="settings"><i class="fa fa-cog"></i></a>
                        <a href="#" class="collapse"><i class="fa fa-chevron-up"></i></a>
                        <a href="#" class="reload"><i class="fa fa-sync"></i></a>
                        <a href="#" class="fullscreen"><i class=" fa fa-expand"></i></a>
                        <a href="#" class="remove"><i class="fa fa-times"></i></a>
                    </div>
                </div>
                <div class="card-body p-0">
                    <div id="Checkboxes_Fancytree_id"></div>
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
                            {title: "Sub-item 4.3 (hideCheckbox)", checkbox: false},
                            {title: "Sub-item 4.4 (unselectable)", unselectable: true}
                        ]
                    },
                    {title: "Lazy folder", folder: true, lazy: true}
                ];
                // Initialize Fancytree

                $("#Checkboxes_Fancytree_id").fancytree({
                    rtl: javatmp.settings.isRTL,
                    checkbox: true,
                    selectMode: 3,
                    extensions: ["glyph"],
                    glyph: glyph_opts,
                    source: SOURCE,
                    lazyLoad: function (event, ctx) {
                        ctx.result = {url: "${pageContext.request.contextPath}/assets/data/fancytreeCheckboxes.json", debugDelay: 500};
                    },
                    loadChildren: function (event, ctx) {
//                        ctx.node.fixSelection3AfterClick();
                    },
                    select: function (event, data) {
//                        // Get a list of all selected nodes, and convert to a key array:
//                        var selKeys = $.map(data.tree.getSelectedNodes(), function (node) {
//                            return node.key;
//                        });
//                        $("#echoSelection3").text(selKeys.join(", "));
//
//                        // Get a list of all selected TOP nodes
//                        var selRootNodes = data.tree.getSelectedNodes(true);
//                        // ... and convert to a key array:
//                        var selRootKeys = $.map(selRootNodes, function (node) {
//                            return node.key;
//                        });
//                        $("#echoSelectionRootKeys3").text(selRootKeys.join(", "));
//                        $("#echoSelectionRoots3").text(selRootNodes.join(", "));
                    },
                    dblclick: function (event, data) {
                        data.node.toggleSelected();
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