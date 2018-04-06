<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="dynamic-ajax-content">
    <div class="page-header">
        <h1>Menu Template Page</h1>
    </div>
    <div class="row">
        <div class="col-sm-3 col-md-3">
            <div id="accordion" role="tablist">
                <div class="card mb-1">
                    <div class="card-header" role="tab" id="headingOne">
                        <a data-toggle="collapse" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                            <span class="fa fa-fw fa-folder"></span>
                            Content
                        </a>
                    </div>
                    <div id="collapseOne" class="collapse show" role="tabpanel" aria-labelledby="headingOne" data-parent="#accordion">
                        <div class="list-group list-group-flush">
                            <a href="javascript:;" class="list-group-item list-group-item-action d-flex align-items-center">
                                <span class="fa fa-fw fa-pencil-alt"></span>
                                Articles
                                <span class="badge badge-info ml-auto">42</span>
                            </a>
                            <a href="javascript:;" class="list-group-item list-group-item-action d-flex align-items-center">
                                <span class="fa fa-fw fa-bolt"></span>
                                News
                            </a>
                            <a href="javascript:;" class="list-group-item list-group-item-action d-flex align-items-center">
                                <span class="fa fa-fw fa-file text-info"></span>
                                Newsletters
                            </a>
                            <a href="javascript:;" class="list-group-item list-group-item-action d-flex align-items-center">
                                <span class="fa fa-fw fa-comment text-success"></span>
                                Comments
                            </a>
                        </div>
                    </div>
                </div>
                <div class="card mb-1">
                    <div class="card-header" role="tab" id="headingTwo">
                        <a class="collapsed" data-toggle="collapse" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                            <span class="fa fa-th"></span>
                            Modules
                        </a>
                    </div>
                    <div id="collapseTwo" class="collapse" role="tabpanel" aria-labelledby="headingTwo" data-parent="#accordion">
                        <div class="list-group list-group-flush">
                            <a href="javascript:;" class="list-group-item list-group-item-action d-flex align-items-center">
                                <span class="fa fa-fw fa-pencil-alt"></span>
                                Orders
                                <span class="badge badge-info ml-auto">42</span>
                            </a>
                            <a href="javascript:;" class="list-group-item list-group-item-action d-flex align-items-center">
                                <span class="fa fa-fw fa-pencil-alt"></span>
                                Invoices
                                <span class="badge badge-info ml-auto">42</span>
                            </a>
                            <a href="javascript:;" class="list-group-item list-group-item-action d-flex align-items-center">
                                <span class="fa fa-fw fa-pencil-alt"></span>
                                Shipments
                                <span class="badge badge-info ml-auto">42</span>
                            </a>
                            <a href="javascript:;" class="list-group-item list-group-item-action d-flex align-items-center">
                                <span class="fa fa-fw fa-pencil-alt"></span>
                                Tax
                                <span class="badge badge-info ml-auto">42</span>
                            </a>
                        </div>
                    </div>
                </div>
                <div class="card mb-1">
                    <div class="card-header" role="tab" id="headingThree">
                        <a class="collapsed" data-toggle="collapse" href="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                            <span class="fa fa-fw fa-user-circle"></span>
                            Account
                        </a>
                    </div>
                    <div id="collapseThree" class="collapse" role="tabpanel" aria-labelledby="headingThree" data-parent="#accordion">
                        <div class="list-group list-group-flush">
                            <a href="javascript:;" class="list-group-item list-group-item-action d-flex align-items-center">
                                <span class="fa fa-fw fa-pencil-alt"></span>
                                Change Password
                            </a>
                            <a href="javascript:;" class="list-group-item list-group-item-action d-flex align-items-center">
                                <span class="fa fa-fw fa-pencil-alt"></span>
                                Notifications
                                <span class="badge badge-warning ml-auto">42</span>
                            </a>
                            <a href="javascript:;" class="list-group-item list-group-item-action d-flex align-items-center">
                                <span class="fa fa-fw fa-pencil-alt"></span>
                                Import/Export
                                <span class="badge badge-info ml-auto">42</span>
                            </a>
                            <a href="javascript:;" class="text-danger list-group-item list-group-item-action d-flex align-items-center">
                                <span class="fa fa-fw fa-exclamation-triangle"></span>
                                Delete Account
                            </a>
                        </div>
                    </div>
                </div>
                <div class="card mb-1">
                    <div class="card-header" role="tab" id="headingFour">
                        <a class="collapsed" data-toggle="collapse" href="#collapseFour"
                           aria-expanded="false" aria-controls="collapseFour">
                            <span class="fa fa-file"></span>
                            Reports
                        </a>
                    </div>
                    <div id="collapseFour" class="collapse" role="tabpanel"
                         aria-labelledby="headingThree" data-parent="#accordion">
                        <div class="list-group list-group-flush">
                            <a href="javascript:;" class="list-group-item list-group-item-action d-flex align-items-center">
                                <span class="fa fa-fw fa-dollar-sign"></span>
                                Sales
                            </a>
                            <a href="javascript:;" class="list-group-item list-group-item-action d-flex align-items-center">
                                <span class="fa fa-fw fa-user"></span>
                                Customers
                            </a>
                            <a href="javascript:;" class="list-group-item list-group-item-action d-flex align-items-center">
                                <span class="fa fa-fw fa-tasks"></span>
                                Products
                            </a>
                            <a href="javascript:;" class="list-group-item list-group-item-action d-flex align-items-center">
                                <span class="fa fa-fw fa-cart-plus"></span>
                                Shopping Cart
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-sm-9 col-md-9">
            <div class="card card-inverse">
                <div class="card-body">
                    <h3 class="card-title">Menu Item Page Title</h3>
                    <p class="card-text">Menu Item Page Content</p>
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
             * When another sidebar menu item pressed and before container replaced with new ajax content.
             * You can cancel, destroy, or remove any thing here before replace main output ajax container.
             * returning false will cancel the new request and do nothing.
             **/
            $(javatmp.settings.defaultOutputSelector).on(javatmp.settings.javaTmpContainerRemoveEventName, function (event) {
                $(javatmp.settings.defaultOutputSelector).off(javatmp.settings.cardFullscreenCompress);
                $(javatmp.settings.defaultOutputSelector).off(javatmp.settings.cardFullscreenExpand);
                return true;
            });
        });
    </script>
</div>