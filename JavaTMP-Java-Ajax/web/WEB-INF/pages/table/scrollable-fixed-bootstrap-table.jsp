<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="dynamic-ajax-content">
    <div class="row">
        <div class="col">
            <div class="card my-3">
                <div class="card-header">
                    Scrollable Fixed Bootstrap Table
                    <div class="options float-right">
                        <a class="settings"><i class="fa fa-cog"></i></a>
                        <a href="#" class="collapse"><i class="fa fa-chevron-up"></i></a>
                        <a href="#" class="reload"><i class="fa fa-sync"></i></a>
                        <a href="#" class="fullscreen"><i class=" fa fa-expand"></i></a>
                        <a href="#" class="remove"><i class="fa fa-times"></i></a>
                    </div>
                </div>
                <div class="card-body">
                    <table id="demo-scroll-table" class="table table-fixed table-bordered">
                        <thead>
                            <tr>
                                <th class="col-3">First Name</th>
                                <th class="col-3">Last Name</th>
                                <th class="col-6">E-mail</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td class="col-3">John</td>
                                <td class="col-3">Doe</td>
                                <td class="col-6">johndoe@email.com</td>
                            </tr>

                            <tr>
                                <td class="col-3">John</td>
                                <td class="col-3">Doe</td>
                                <td class="col-6">johndoe@email.com</td>
                            </tr>
                            <tr>
                                <td class="col-3">John</td>
                                <td class="col-3">Doe</td>
                                <td class="col-6">johndoe@email.com</td>
                            </tr>
                            <tr>
                                <td class="col-3">John</td>
                                <td class="col-3">Doe</td>
                                <td class="col-6">johndoe@email.com</td>
                            </tr>
                            <tr>
                                <td class="col-3">John</td>
                                <td class="col-3">Doe</td>
                                <td class="col-6">johndoe@email.com</td>
                            </tr>
                            <tr>
                                <td class="col-3">John</td>
                                <td class="col-3">Doe</td>
                                <td class="col-6">johndoe@email.com</td>
                            </tr>
                            <tr>
                                <td class="col-3">John</td>
                                <td class="col-3">Doe</td>
                                <td class="col-6">johndoe@email.com</td>
                            </tr>
                            <tr>
                                <td class="col-3">John</td>
                                <td class="col-3">Doe</td>
                                <td class="col-6">johndoe@email.com</td>
                            </tr>
                            <tr>
                                <td class="col-3">John</td>
                                <td class="col-3">Doe</td>
                                <td class="col-6">johndoe@email.com</td>
                            </tr>
                            <tr>
                                <td class="col-3">John</td>
                                <td class="col-3">Doe</td>
                                <td class="col-6">johndoe@email.com</td>
                            </tr>
                            <tr>
                                <td class="col-3">John</td>
                                <td class="col-3">Doe</td>
                                <td class="col-6">johndoe@email.com</td>
                            </tr>
                            <tr>
                                <td class="col-3">John</td>
                                <td class="col-3">Doe</td>
                                <td class="col-6">johndoe@email.com</td>
                            </tr>
                            <tr>
                                <td class="col-3">John</td>
                                <td class="col-3">Doe</td>
                                <td class="col-6">johndoe@email.com</td>
                            </tr>
                            <tr>
                                <td class="col-3">John</td>
                                <td class="col-3">Doe</td>
                                <td class="col-6">johndoe@email.com</td>
                            </tr>
                            <tr>
                                <td class="col-3">John</td>
                                <td class="col-3">Doe</td>
                                <td class="col-6">johndoe@email.com</td>
                            </tr>
                            <tr>
                                <td class="col-3">John</td>
                                <td class="col-3">Doe</td>
                                <td class="col-6">johndoe@email.com</td>
                            </tr>
                            <tr>
                                <td class="col-3">John</td>
                                <td class="col-3">Doe</td>
                                <td class="col-6">johndoe@email.com</td>
                            </tr>
                            <tr>
                                <td class="col-3">John</td>
                                <td class="col-3">Doe</td>
                                <td class="col-6">johndoe@email.com</td>
                            </tr>
                            <tr>
                                <td class="col-3">John</td>
                                <td class="col-3">Doe</td>
                                <td class="col-6">johndoe@email.com</td>
                            </tr>
                            <tr>
                                <td class="col-3">John</td>
                                <td class="col-3">Doe</td>
                                <td class="col-6">johndoe@email.com</td>
                            </tr>
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

        .table-fixed {
            width: 100%;
        }
        .table-fixed tbody {
            height: 200px;
            overflow-y: auto;
            width: 100%;
        }
        .table-fixed thead, .table-fixed tbody, .table-fixed tr, .table-fixed td, .table-fixed th {
            display: block;
        }
        .table-fixed tbody td {
            float: left;
        }
        .table-fixed thead tr th {
            float: left;
        }

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

        function getScrollBarWidth() {
            // https://stackoverflow.com/questions/986937/how-can-i-get-the-browsers-scrollbar-sizes
            var inner = document.createElement('p');
            inner.style.width = "100%";
            inner.style.height = "200px";

            var outer = document.createElement('div');
            outer.style.position = "absolute";
            outer.style.top = "0px";
            outer.style.left = "0px";
            outer.style.visibility = "hidden";
            outer.style.width = "200px";
            outer.style.height = "150px";
            outer.style.overflow = "hidden";
            outer.appendChild(inner);

            document.body.appendChild(outer);
            var w1 = inner.offsetWidth;
            outer.style.overflow = 'scroll';
            var w2 = inner.offsetWidth;
            if (w1 === w2)
                w2 = outer.clientWidth;

            document.body.removeChild(outer);

            return (w1 - w2);
        }
        ;

        jQuery(function ($) {
            // any code put here will be run after content attach to ajax output container and before
            // controll return to main javascript file.
            // <--- HERE --->
            //
            if (javatmp.settings.isRTL === true) {
                $("#demo-scroll-table > thead ").css({"margin-left": getScrollBarWidth});
            } else {
                $("#demo-scroll-table > thead ").css({"margin-right": getScrollBarWidth});
            }
//            alert(getScrollBarWidth());

            $(javatmp.settings.defaultOutputSelector).on(javatmp.settings.javaTmpAjaxContainerReady, function (event) {
                // fire AFTER all transition done and your ajax content is shown to user.
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