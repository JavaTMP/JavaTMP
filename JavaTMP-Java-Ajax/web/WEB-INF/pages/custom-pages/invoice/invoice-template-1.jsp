<div class="dynamic-ajax-content">
    <h4 class="my-3">Invoice Template 1</h4>
    <hr/>
    <div class="row">
        <div class="col">
            <div class="card invoice-template-1-body-card">
                <div class="card-body">
                    <div class="row">
                        <div class="col-md-6 col-sm-12 text-center text-md-left">
                            <div class="media">
                                <img src="${pageContext.request.contextPath}/assets/img/javatmp-logo.png" alt="company logo" width="90" height="90">
                                <div class="media-body">
                                    <ul class="ml-2 px-0 list-unstyled">
                                        <li class="">JavaTMP For Software Solutions</li>
                                        <li>Dubai Internet City,</li>
                                        <li>Dubai,</li>
                                        <li>UAE</li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6 col-sm-12 text-center text-md-right">
                            <h2>INVOICE</h2>
                            <p class="pb-3"># INV-001001</p>
                        </div>
                    </div>
                    <div id="invoice-customer-details" class="row pt-2">
                        <div class="col-sm-12 text-center text-md-left">
                            <p class="text-muted">Bill To</p>
                        </div>
                        <div class="col-md-6 col-sm-12 text-center text-md-left">
                            <ul class="px-0 list-unstyled">
                                <li class="">Mr. Your Name</li>
                                <li>Address Line,</li>
                                <li>City Name,</li>
                                <li>Country</li>
                            </ul>
                        </div>
                        <div class="col-md-6 col-sm-12 text-center text-md-right">
                            <ul class="px-0 list-unstyled">
                                <li class=""><span class="text-muted">Invoice Date:&nbsp;</span>30/11/2018</li>
                                <li><span class="text-muted">Terms:&nbsp;</span>Due on Receipt</li>
                                <li><span class="text-muted">Due Date:&nbsp;</span>31/12/2018</li>
                                <li><span class="text-muted">Balance Due:&nbsp;</span>415.35</li>
                            </ul>
                        </div>
                    </div>
                    <div id="invoice-items-details" class="pt-2">
                        <div class="row">
                            <div class="table-responsive col-sm-12">
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th>#</th>
                                            <th>Item &amp; Description</th>
                                            <th class="text-right">Quantity</th>
                                            <th class="text-right">Unit Price</th>
                                            <th class="text-right">Total</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <th scope="row">1</th>
                                            <td>JavaTMP Static Template 1</td>
                                            <td class="text-right">2</td>
                                            <td class="text-right">20.00</td>
                                            <td class="text-right">40.00</td>
                                        </tr>
                                        <tr>
                                            <th scope="row">2</th>
                                            <td>Customizing Static Template 1</td>
                                            <td class="text-right">5</td>
                                            <td class="text-right">13.00</td>
                                            <td class="text-right">65.00</td>
                                        </tr>
                                        <tr>
                                            <th scope="row">3</th>
                                            <td>Professional Icons And Images</td>
                                            <td class="text-right">25</td>
                                            <td class="text-right">10.00</td>
                                            <td class="text-right">250.00</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div class="row justify-content-end">
                            <div class="col-md-5 col-sm-12">
                                <p class="lead">Total due</p>
                                <div class="table-responsive">
                                    <table class="table">
                                        <tbody>
                                            <tr>
                                                <td>Sub Total</td>
                                                <td class="text-right">355</td>
                                            </tr>
                                            <tr>
                                                <td>TAX (17%)</td>
                                                <td class="text-right">60.35</td>
                                            </tr>
                                            <tr>
                                                <td class="text-bold-800">Total</td>
                                                <td class="text-bold-800 text-right">415.35</td>
                                            </tr>
                                            <tr class="bg-grey bg-lighten-4">
                                                <td class="text-bold-800">Balance Due</td>
                                                <td class="text-bold-800 text-right">415.35</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div id="invoice-footer">
                        <div class="row">
                            <div class="col-md-12 col-sm-12">
                                <h6><strong>Terms &amp; Condition</strong></h6>
                                <p>All prices and costs are supposted to be in USA Dollars only. Kinldy refer to our offical website for more information about Terms &amp; Condition.</p>
                            </div>
                        </div>
                    </div>
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
            $(javatmp.settings.defaultOutputSelector).addClass("bg-light");
            $(javatmp.settings.defaultOutputSelector).find(".invoice-template-1-body-card").addClass("shadow");

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