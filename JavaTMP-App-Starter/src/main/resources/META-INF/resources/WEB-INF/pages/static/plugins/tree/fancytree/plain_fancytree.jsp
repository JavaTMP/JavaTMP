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
                    Plain tree
                    <div class="options float-right">
                        <a class="settings"><i class="fa fa-cog"></i></a>
                        <a href="#" class="collapse"><i class="fa fa-chevron-up"></i></a>
                        <a href="#" class="reload"><i class="fa fa-sync"></i></a>
                        <a href="#" class="fullscreen"><i class=" fa fa-expand"></i></a>
                        <a href="#" class="remove"><i class="fa fa-times"></i></a>
                    </div>
                </div>
                <div class="card-body p-0">
                    <div id="tree"></div>
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
                var sourceData = [
                    {
                        "title": "Animalia",
                        "expanded": true,
                        "folder": true,
                        "children": [
                            {
                                "title": "Chordate",
                                "folder": true,
                                "children": [
                                    {
                                        "title": "Mammal",
                                        "folder": true,
                                        "children": [
                                            {
                                                "title": "Primate",
                                                "folder": true,
                                                "children": [
                                                    {
                                                        "title": "Primate",
                                                        "folder": false,
                                                        "children": [
                                                        ]
                                                    },
                                                    {
                                                        "title": "Carnivora",
                                                        "folder": false,
                                                        "children": [
                                                        ]
                                                    }
                                                ]
                                            },
                                            {
                                                "title": "Carnivora",
                                                "folder": true,
                                                "children": [
                                                    {
                                                        "title": "Felidae",
                                                        "folder": false
                                                    }
                                                ]
                                            }
                                        ]
                                    }
                                ]
                            },
                            {
                                "title": "Arthropoda",
                                "expanded": true,
                                "folder": true,
                                "children": [
                                    {
                                        "title": "Insect",
                                        "folder": true,
                                        "children": [
                                            {
                                                "title": "Diptera",
                                                "folder": false
                                            }
                                        ]
                                    }
                                ]
                            }
                        ]
                    }
                ];
                // Initialize Fancytree
                $("#tree").fancytree({
                    rtl: javatmp.settings.isRTL,
                    extensions: ["glyph"],
                    glyph: glyph_opts,
                    source: sourceData,
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