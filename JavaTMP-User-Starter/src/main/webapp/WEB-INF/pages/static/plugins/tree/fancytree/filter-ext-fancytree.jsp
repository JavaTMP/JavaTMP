<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="dynamic-ajax-content grid-gutter-padding">
    <h4 class="my-3">Filter Ext Fancytree</h4>
    <hr/>
    <div class="row">
        <div class="col-lg-12">
            <div class="alert alert-info">
                <p>Fancytree is a jQuery tree view / tree grid plugin with support for keyboard, inline editing, filtering, checkboxes, drag'n'drop, and lazy loading</p>
                <p>
                    <a target="_blank" class="btn btn-info" href="http://wwwendt.de/tech/fancytree/demo/">Demo Site</a>
                    <a target="_blank" class="btn btn-info" href="https://github.com/mar10/fancytree">github source code</a>
                    <a target="_blank" class="btn btn-info" href="https://github.com/mar10/fancytree/wiki/ExtFilter">Ext Filter tutorial</a>
                </p>
            </div>
            <div class="col-lg-12">
                <fieldset>
                    <legend>Options</legend>
                    <label for="regex">
                        <input type="checkbox" id="regex">
                        Regular expression
                    </label>
                    <br>
                    <label for="hideMode">
                        <input type="checkbox" id="hideMode">
                        Hide unmatched nodes
                    </label>
                    <label for="autoExpand">
                        <input type="checkbox" id="autoExpand" checked="checked">
                        Auto expand
                    </label>
                    <label for="branchMode">
                        <input type="checkbox" id="branchMode">
                        Match whole branch
                    </label>
                    <label for="leavesOnly">
                        <input type="checkbox" id="leavesOnly">
                        Match end nodes only
                    </label>
                    <br>
                    <label for="fuzzy">
                        <input type="checkbox" id="fuzzy">
                        Fuzzy
                    </label>
                    <label for="hideExpanders">
                        <input type="checkbox" id="hideExpanders">
                        hideExpanders
                    </label>
                    <label for="highlight">
                        <input type="checkbox" id="highlight" checked="checked">
                        Highlight
                    </label>
                    <label for="nodata">
                        <input type="checkbox" id="nodata" checked="checked">
                        nodata
                    </label>
                    <br>
                    <label for="counter">
                        <input type="checkbox" id="counter" checked="checked">
                        Add counter badges
                    </label>
                    <label for="hideExpandedCounter">
                        <input type="checkbox" id="hideExpandedCounter" checked="checked">
                        hideExpandedCounter
                    </label>
                </fieldset>
            </div>
            <div class="card my-3">
                <div class="card-header p-1">
                    <div class="input-group">
                        <input id="demo-search-tree" type="text" class="form-control" placeholder="Filter & Search tree" aria-label="Recipient's username" aria-describedby="basic-addon2">
                        <div class="input-group-append">
                            <button id="clear-tree-demo" class="btn btn-primary" type="button">Clear</button>
                            <button id="activate-tree-demo" class="btn btn-primary" type="button">Activate</button>
                        </div>
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
                $("#tree").fancytree({
                    rtl: javatmp.settings.isRTL,
                    extensions: ["glyph", "filter"],
                    glyph: glyph_opts,
                    quicksearch: true,
                    source: {
                        url: "assets/data/ajax-tree-local.json"
                    },
                    filter: {
                        autoApply: true, // Re-apply last filter if lazy data is loaded
                        autoExpand: false, // Expand all branches that contain matches while filtered
                        counter: true, // Show a badge with number of matching child nodes near parent icons
                        fuzzy: false, // Match single characters in order, e.g. 'fb' will match 'FooBar'
                        hideExpandedCounter: true, // Hide counter badge if parent is expanded
                        hideExpanders: false, // Hide expanders if all child nodes are hidden by filter
                        highlight: true, // Highlight matches by wrapping inside <mark> tags
                        leavesOnly: false, // Match end nodes only
                        nodata: true, // Display a 'no data' status node if result is empty
                        mode: "dimm"       // Grayout unmatched nodes (pass "hide" to remove unmatched node instead)
                    },
                    activate: function (event, data) {
                    },
                    lazyLoad: function (event, data) {
                        data.result = {url: "assets/data/fancytreeSub.json"};
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

                var tree = $("#tree").fancytree("getTree");

                $("#demo-search-tree").keyup(function (e) {
                    var n,
                            tree = $.ui.fancytree.getTree(),
                            args = "autoApply autoExpand fuzzy hideExpanders highlight leavesOnly nodata".split(" "),
                            opts = {},
                            filterFunc = $("#branchMode").is(":checked") ? tree.filterBranches : tree.filterNodes,
                            match = $(this).val();

                    $.each(args, function (i, o) {
                        opts[o] = $("#" + o).is(":checked");
                    });
                    opts.mode = $("#hideMode").is(":checked") ? "hide" : "dimm";

                    if (e && e.which === $.ui.keyCode.ESCAPE || $.trim(match) === "") {
                        $("#clear-tree-demo").click();
                        return;
                    }
                    if ($("#regex").is(":checked")) {
                        // Pass function to perform match
                        n = filterFunc.call(tree, function (node) {
                            return new RegExp(match, "i").test(node.title);
                        }, opts);
                    } else {
                        // Pass a string to perform case insensitive matching
                        n = filterFunc.call(tree, match, opts);
                    }
                    $("#clear-tree-demo").attr("disabled", false);
//                    $("span#matches").text("(" + n + " matches)");
                }).focus();

                $("#clear-tree-demo").click(function (e) {
                    $("#demo-search-tree").val("");
//                    $("span#matches").text("");
                    tree.clearFilter();
                }).attr("disabled", true);

                $("fieldset input:checkbox").change(function (e) {
                    var id = $(this).attr("id"),
                            flag = $(this).is(":checked");

                    // Some options can only be set with general filter options (not method args):
                    switch (id) {
                        case "counter":
                        case "hideExpandedCounter":
                            tree.options.filter[id] = flag;
                            break;
                    }
                    tree.clearFilter();
                    $("#demo-search-tree").keyup();
                });

                $("#activate-tree-demo").on("click", function () {
                    if (!tree.getActiveNode()) {
                        alert("Please activate a folder.");
                        return;
                    }
                    tree.filterBranches(function (node) {
                        return node.isActive();
                    });
                });

                $("#clear-tree-demo").on("click", function () {
                    $("#demo-search-tree").val("");
                    tree.clearFilter();
                });
            }(jQuery));
        });
    </script>
</div>