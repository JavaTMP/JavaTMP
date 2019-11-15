<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="dynamic-ajax-content grid-gutter-padding">
    <h5 class="my-3">Balance Sheet</h5>
    <hr/>
    <div class="row">
        <div class="col">
            <div class="card">
                <div class="card-header">
                    <div class="options float-right">
                        <a href="#" class="collapse"><i class="fa fa-chevron-up"></i></a>
                        <a href="#" class="fullscreen"><i class=" fa fa-expand"></i></a>
                    </div>
                </div>
                <div class="card-body p-0">
                    <table id="chartOfAccountMainTable" class="table table-sm table-condensed table-hover table-bordered mb-0">
                        <thead>
                            <tr>
                                <th width="120" class="">Account Code</th>
                                <th>Account Name</th>
                                <th  width="100">Debit</th>
                                <th  width="100">Credit</th>
                                <th  width="100">Balance</th>
                                <th  width="200">Account Group</th>
                                <th  width="200">Account Type</th>
                                <th class="text-center"  width="50">Id</th>
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

            $(javatmp.settings.defaultOutputSelector).one(javatmp.settings.javaTmpAjaxContainerReady, function (event) {
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
                    console.log(childList);
                    var parent,
                            nodeMap = {};
                    // Pass 1: store all tasks in reference map
                    $.each(childList, function (i, c) {
                        nodeMap[c.id] = c;
                    });
                    console.log(nodeMap);
                    // Pass 2: adjust fields and fix child structure
                    childList = $.map(childList, function (c) {
                        // Rename 'key' to 'id'
                        c.key = c.id;
                        c.title = c.name;
                        c.tooltip = c.description;
                        //                        c.icon = "far fa-heart";
                        // Check if c is a child node
                        if (c.parentAccountId && nodeMap[c.parentAccountId]) {
                            // add c to `children` array of parent node
                            parent = nodeMap[c.parentAccountId];
                            parent.folder = true;
                            parent.expanded = false;
                            if (parent.children) {
                                parent.children.push(c);
                            } else {
                                parent.children = [c];
                            }
                            return null; // Remove c from childList
                        }
                        return c; // Keep top-level nodes
                    });
                    function calcuateSum(node) {
                        if (node.children && node.children.length > 0) {
                            var childNodes = [];
                            for (var i = 0; i < node.children.length; i++) {
                                var childNodeData = calcuateSum(node.children[i]);
                                childNodes.push(childNodeData);
                            }
                            console.log(JSON.stringify(childNodes));
                            for (var i = 0; i < childNodes.length; i++) {
                                var childRow = childNodes[i];
                                node.debit += childRow[0];
                                node.credit += childRow[1];
                                node.balance += childRow[2];
                            }
                            return [node.debit, node.credit, node.balance];
                        } else {
                            console.log("leave node without children node id [" + node.id + "][" + node.title + "]");
                            return [node.debit, node.credit, node.balance];
                        }
                    }

                    function calcuateSumForList(list) {
                        for (var i = 0; i < list.length; i++) {
                            calcuateSum(list[i]);
                        }
                    }
                    calcuateSumForList(childList);
                    //                    alert(JSON.stringify(childList));

                    function orderAccountsList(list) {
                        console.log("length of list [" + list.length + "]");
                        for (var i = 0; i < list.length; i++) {
                            console.log("check account code [" + list[i].accountCode + "] with children lenght [" + list[i].children + "]");
                            if (list[i].children && list[i].children.length > 0) {
                                console.log("check account code [" + list[i].accountCode + "] with children lenght [" + list[i].children.length + "]");
                                orderAccountsList(list[i].children);
                            }
                        }
                        // now we ordered current list based on list[i].accountGroup.type.id and then list[i].accountGroup.id
                        function compare(a, b) {
                            var result;
                            result = a.accountGroup.type.id - b.accountGroup.type.id;
                            if (result === 0) {
                                result = a.accountGroup.id - b.accountGroup.id;
                                if (result === 0) {
                                    result = a.id - b.id;
                                }
                            }
                            return result;
                        }
                        console.log("sort list of [" + list.length + "]");
                        list.sort(compare);

                    }
//                    console.log(JSON.stringify(childList));
                    orderAccountsList(childList);
                    return childList;
                }

                var chartOfAccountTree = $("#chartOfAccountMainTable").fancytree({
                    rtl: javatmp.settings.isRTL,
                    extensions: ["glyph", "table"],
                    checkbox: false,
                    glyph: glyph_opts,
                    autoScroll: true,
                    source: {
                        url: "${pageContext.request.contextPath}/accounting/ViewBalanceSheet",
                        type: "POST",
                        cache: false
                    },
                    init: function (event, data) {
                    },
                    postProcess: function (event, data) {
                        data.result = convertData(data.response.data);
                    },
                    table: {
                        indentation: 35,
                        nodeColumnIdx: 1
                    },
                    activate: function (event, data) {
                    },
                    renderColumns: function (event, data) {
                        var node = data.node;
                        var $tdList = $(node.tr).find(">td");
                        $tdList.eq(0).text(node.data.accountCode);
                        $tdList.eq(2).text(numeral(node.data.debit).format('(0,0.00)'));
                        $tdList.eq(3).text(numeral(node.data.credit).format('(0,0.00)'));
                        $tdList.eq(4).text(numeral(node.data.balance).format('(0,0.00)'));
                        $tdList.eq(5).text(node.data.accountGroup.name);
                        $tdList.eq(6).text(node.data.accountGroup.type.name);
                        $tdList.eq(7).addClass("text-center").text(node.key);
                    },
                    keydown: function (event, data) {
                        if (event.which === 32) {
                            data.node.toggleSelected();
                            return false;
                        }
                        if (javatmp.settings.isRTL === true) {
                            var KC = $.ui.keyCode;
                            var oe = event.originalEvent;                             // Swap LEFT/RIGHT keys
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

            $(javatmp.settings.defaultOutputSelector).on(javatmp.settings.javaTmpContainerResizeEventName, function (event) {                 // fire when user resize browser window or sidebar hide / show
            });

            $(javatmp.settings.defaultOutputSelector).on(javatmp.settings.cardFullscreenCompress, function (event, card) {                 // when card compress by pressing the top right tool button
            });

            $(javatmp.settings.defaultOutputSelector).on(javatmp.settings.cardFullscreenExpand, function (event, card) {                 // when card Expand by pressing the top right tool button
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
        });</script>
</div>