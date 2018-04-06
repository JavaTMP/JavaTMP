<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="dynamic-ajax-content">
    <div class="page-header">
        <h1>Table Fancytree</h1>
    </div>
    <div class="row">
        <div class="col-lg-12">
            <div class="alert alert-info">
                <p>Fancytree is a jQuery tree view / tree grid plugin with support for keyboard, inline editing, filtering, checkboxes, drag'n'drop, and lazy loading</p>
                <p>
                    <a target="_blank" class="btn btn-info" href="http://wwwendt.de/tech/fancytree/demo/">Demo Site</a>
                    <a target="_blank" class="btn btn-info" href="https://github.com/mar10/fancytree">github source code</a>
                </p>
            </div>
            <div class="card my-3">
                <div class="card-header">
                    Table tree
                    <div class="options float-right">
                        <a class="settings"><i class="fa fa-cog"></i></a>
                        <a href="#" class="collapse"><i class="fa fa-chevron-up"></i></a>
                        <a href="#" class="reload"><i class="fa fa-sync"></i></a>
                        <a href="#" class="fullscreen"><i class=" fa fa-expand"></i></a>
                        <a href="#" class="remove"><i class="fa fa-times"></i></a>
                    </div>
                </div>
                <div class="card-body p-0">
                    <table id="treetable" class="table table-sm table-condensed table-hover table-bordered">
                        <thead>
                            <tr>
                                <th width="150" class=""></th>
                                <th width="*">Classification</th>
                                <th  width="100">Folder</th>
                            </tr>
                        </thead>
                        <tbody>
                        </tbody>
                    </table>
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

                $("#treetable").fancytree({
                    extensions: ["glyph", "table"],
                    checkbox: false,
                    glyph: glyph_opts,
                    source: {url: "${pageContext.request.contextPath}/assets/data/fancytreeTaxonomy.json", debugDelay: 500},
                    table: {
                        indentation: 25,
                        nodeColumnIdx: 1
                    },
                    activate: function (event, data) {
                    },
                    lazyLoad: function (event, data) {
                        data.result = {url: "${pageContext.request.contextPath}/assets/data/fancytreeSub.json", debugDelay: 500};
                    },
                    renderColumns: function (event, data) {
                        var node = data.node,
                                $tdList = $(node.tr).find(">td");
                        $tdList.eq(0).text(node.getIndexHier());
                        $tdList.eq(2).text(!!node.folder);
                    }
                });
            }(jQuery));
        });
    </script>
</div>