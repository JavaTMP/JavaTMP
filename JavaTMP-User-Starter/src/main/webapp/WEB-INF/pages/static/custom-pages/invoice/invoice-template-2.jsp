<div class="dynamic-ajax-content grid-gutter-padding">
    <h4 class="my-3">Invoice Template 2</h4>
    <hr/>
    <div class="row">
        <div class="col">
            <div class="card invoice-template-2-body-card">
                <div class="card-body">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="media">
                                <img src="assets/img/javatmp-logo.png" alt="company logo" width="90" height="90">
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
                        <div class="col-md-6 text-right">
                            <p class="font-weight-bold mb-1">Invoice #53210008</p>
                            <p class="text-muted">Issue Date: 4 Dec, 2019</p>
                        </div>
                    </div>
                    <hr class="my-3"/>
                    <div class="row">
                        <div class="col-md-6">
                            <p class="font-weight-bold mb-3">Client Information:</p>
                            <p class="mb-1">John Smith, Mrs Emma Smith</p>
                            <p class="mb-1">ABC Inc</p>
                            <p class="mb-1">Berlin, Germany</p>
                            <p class="mb-1">123456</p>
                        </div>

                        <div class="col-md-6 text-right">
                            <p class="font-weight-bold mb-3">Payment Details:</p>
                            <p class="mb-1"><span class="text-muted">VAT: </span> 123654</p>
                            <p class="mb-1"><span class="text-muted">VAT ID: </span> 10253642</p>
                            <p class="mb-1"><span class="text-muted">Payment Type: </span> Root</p>
                            <p class="mb-1"><span class="text-muted">Name: </span> John Smith</p>
                        </div>
                    </div>
                    <div class="row pt-3">
                        <div class="col-md-12">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th class="border-0 text-uppercase small font-weight-bold text-center">ID</th>
                                        <th class="border-0 text-uppercase small font-weight-bold text-left">Item</th>
                                        <th class="border-0 text-uppercase small font-weight-bold text-left">Description</th>
                                        <th class="border-0 text-uppercase small font-weight-bold text-right">Quantity</th>
                                        <th class="border-0 text-uppercase small font-weight-bold text-right">Unit Cost</th>
                                        <th class="border-0 text-uppercase small font-weight-bold text-right">Total</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td class="text-center">1</td>
                                        <td class="text-left">Software</td>
                                        <td class="text-left">LTS Versions</td>
                                        <td class="text-right">15</td>
                                        <td class="text-right">$ 150</td>
                                        <td class="text-right">$ 2,250.00</td>
                                    </tr>
                                    <tr>
                                        <td class="text-center">2</td>
                                        <td class="text-left">Software</td>
                                        <td class="text-left">Support</td>
                                        <td class="text-right">201</td>
                                        <td class="text-right">$ 100.50</td>
                                        <td class="text-right">$ 20,200.5</td>
                                    </tr>
                                    <tr>
                                        <td class="text-center">3</td>
                                        <td class="text-left">Software</td>
                                        <td class="text-left">Sofware Licenses</td>
                                        <td class="text-right">250</td>
                                        <td class="text-right">$ 75</td>
                                        <td class="text-right">$ 18,750</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>

                    <div class="d-flex flex-row-reverse bg-dark text-white">
                        <div class="p-3 text-right border-left">
                            <div class="mb-2">Grand Total</div>
                            <div class="h2 font-weight-light">$234,234</div>
                        </div>
                        <div class="p-3 text-right">
                            <div class="mb-2">Discount</div>
                            <div class="h2 font-weight-light">10%</div>
                        </div>
                        <div class="p-3 text-right">
                            <div class="mb-2">Sub - Total amount</div>
                            <div class="h2 font-weight-light">$32,432</div>
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
            $(javatmp.settings.defaultOutputSelector).find(".invoice-template-2-body-card").addClass("shadow");

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