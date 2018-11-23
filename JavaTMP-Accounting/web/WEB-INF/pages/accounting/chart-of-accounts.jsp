<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="dynamic-ajax-content">
    <h5 class="my-3">Blank Card Page Title</h5>
    <hr/>
    <div class="row">
        <div class="col">
            <div class="card">
                <div class="card-header">
                    <nav class="nav d-inline">
                        <a class="d-inline nav-link active" href="#">Active</a>
                        <a class="d-inline nav-link" href="#">Link</a>
                        <a class="d-inline nav-link" href="#">Link</a>
                        <a class="d-inline nav-link disabled" href="#">Disabled</a>
                    </nav>
                    <div class="options float-right">
                        <a href="#" class="collapse"><i class="fa fa-chevron-up"></i></a>
                        <a href="#" class="fullscreen"><i class=" fa fa-expand"></i></a>
                    </div>
                </div>
                <div class="card-body p-0">
                    <table id="chartOfAccountMainTable" class="table table-sm table-condensed table-hover table-bordered">
                        <thead>
                            <tr>
                                <th width="120" class="">Account Code</th>
                                <th width="*">Account Name</th>
                                <th  width="100">Debit</th>
                                <th  width="100">Credit</th>
                                <th  width="100">Balance</th>
                            </tr>
                        </thead>
                        <tbody>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
    <!--
    Reference Your external Stylesheet file here
    if your feature or plugins could not support to run globally.
    <link href="components/" rel="stylesheet">
    -->
    <style type="text/css">
        /*
        Embed CSS styling for current page.
        */
    </style>

    <!--
    Reference Your external Javascript file here
    if your feature or plugins could not support to run globally.
    <script src="components/"></script>
    -->
    <script type="text/javascript">
        // You could write safely Javascript code here too as our template
        // should load mandatory libraries and plugins before.
        // <--- HERE --->
        //

        jQuery(function ($) {
            // any code put here will be run after content attach to ajax output container and before
            // controll return to main javascript file.
            // <--- HERE --->
            //

            $(javatmp.settings.defaultOutputSelector).on(javatmp.settings.javaTmpAjaxContainerReady, function (event) {
                // fire AFTER all transition done and your ajax content is shown to user.

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

                function convertData(childList) {
                    var parent,
                            nodeMap = {};

                    // Pass 1: store all tasks in reference map
                    $.each(childList, function (i, c) {
                        nodeMap[c.accountId] = c;
                    });
                    // Pass 2: adjust fields and fix child structure
                    childList = $.map(childList, function (c) {
                        // Rename 'key' to 'id'
                        c.key = c.accountId;
                        c.title = c.accountName;
                        c.tooltip = c.accountDescription;
//                        c.icon = "far fa-heart";
                        // Check if c is a child node
                        if (c.parentAccountId) {
                            // add c to `children` array of parent node
                            parent = nodeMap[c.parentAccountId];
                            parent.folder = true;
                            parent.expanded = true;
                            if (parent.children) {
                                parent.children.push(c);
                            } else {
                                parent.children = [c];
                            }
                            return null;  // Remove c from childList
                        }
                        return c;  // Keep top-level nodes
                    });

//                    alert(JSON.stringify(childList));
                    return childList;
                }

                $("#chartOfAccountMainTable").fancytree({
                    rtl: javatmp.settings.isRTL,
                    extensions: ["glyph", "table"],
                    checkbox: false,
                    glyph: glyph_opts,
                    autoScroll: true,
                    source: {
                        url: "${pageContext.request.contextPath}/accounting/chartOfAccounts",
                        debugDelay: 500,
                        cache: false
                    },
                    init: function (event, data) {
//                        data.tree.getRootNode().sortChildren(function (a, b) {
//                            var x = a.key,
//                                    y = b.key;
//                            return x === y ? 0 : x > y ? -1 : +1;
//                        }, true);
                    },
                    postProcess: function (event, data) {
                        data.result = convertData(data.response.data);
//                        data.result = {
//                            error: "ERROR #" + orgResponse.faultCode + ": " + orgResponse.faultMsg
//                        };
//                        data.result = [
//                            {
//                                "title": "No Accounts",
//                                "accountCode": "ERROR",
//                                "debit": 0.0,
//                                "credit": 0.0,
//                                "balance": 0.0
//                            },
//                            {
//                                "title": "No Accounts",
//                                "accountCode": "ERROR",
//                                "debit": 0.0,
//                                "credit": 0.0,
//                                "balance": 0.0
//                            }
//
//                        ];
                    },
                    table: {
                        indentation: 20,
                        nodeColumnIdx: 1
                    },
                    activate: function (event, data) {
                    },
                    renderColumns: function (event, data) {
                        var node = data.node;
                        var $tdList = $(node.tr).find(">td");
                        $tdList.eq(0).text(node.data.accountCode);
                        $tdList.eq(2).text(node.data.debit);
                        $tdList.eq(3).text(node.data.credit);
                        $tdList.eq(4).text(node.data.balance);
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

            });

            $(javatmp.settings.defaultOutputSelector).on(javatmp.settings.javaTmpContainerResizeEventName, function (event) {
                // fire when user resize browser window or sidebar hide / show
            });

            $(javatmp.settings.defaultOutputSelector).on(javatmp.settings.cardFullscreenCompress, function (event, card) {
                // when card compress by pressing the top right tool button
            });

            $(javatmp.settings.defaultOutputSelector).on(javatmp.settings.cardFullscreenExpand, function (event, card) {
                // when card Expand by pressing the top right tool button
            });

            /**
             * When another sidebar menu item pressed and before container issues new ajax request.
             * You can cancel, destroy, or remove any thing here before replace main output ajax container.
             * return false or event.preventDefault() will cancel ajax and stay you in the current page and do nothing.
             **/
            $(javatmp.settings.defaultOutputSelector).on(javatmp.settings.javaTmpContainerRemoveEventName, function (event) {
                $(javatmp.settings.defaultOutputSelector).off(javatmp.settings.cardFullscreenCompress);
                $(javatmp.settings.defaultOutputSelector).off(javatmp.settings.cardFullscreenExpand);
                return true;
            });
        });
    </script>
</div>