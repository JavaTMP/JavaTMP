<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="dynamic-ajax-content grid-gutter-padding">
    <div class="row">
        <div class="col">
            <div class="card mt-3">
                <div class="card-header">
                    Create Invoice Form
                    <div class="options float-right">
                        <a href="#" class="settings"><i class="fa fa-cog"></i></a>
                        <a href="#" class="collapse"><i class="fa fa-chevron-up"></i></a>
                        <a href="#" class="reload"><i class="fa fa-sync"></i></a>
                        <a href="#" class="fullscreen"><i class=" fa fa-expand"></i></a>
                        <a href="#" class="remove"><i class="fa fa-times"></i></a>
                    </div>
                </div>
                <div class="card-body">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="table-responsive">
                                <table class="table table-bordered table-hover custom-invoice-table" id="tab_logic">
                                    <thead>
                                        <tr>
                                            <th style="width: 3rem;" class="text-center">#</th>
                                            <th class="text-center">Product</th>
                                            <th style="width: 8rem;" class="text-center">Qty</th>
                                            <th style="width: 8rem;" class="text-center">Unit Price</th>
                                            <th style="width: 8rem;" class="text-center">Total</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr id='addr0'>
                                            <td style="width: 3rem;">1</td>
                                            <td><input type="text" name='product[]'  placeholder='Enter Product Name' class="form-control"/></td>
                                            <td style="width: 8rem;"><input type="number" name='qty[]' placeholder='0' class="form-control qty" step="0" min="0"/></td>
                                            <td style="width: 8rem;"><input type="number" name='price[]' placeholder='0.00' class="form-control price" step="0.00" min="0"/></td>
                                            <td style="width: 8rem;"><input type="number" name='total[]' placeholder='0.00' class="form-control total" readonly/></td>
                                        </tr>
                                        <tr id='addr1'></tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <button id="add_row" class="btn btn-primary float-left">Add Row</button>
                            <button id='delete_row' class="float-right btn btn-secondary">Delete Row</button>
                        </div>
                    </div>
                    <div class="row mt-3 justify-content-end">
                        <div class="col-md-4">
                            <table class="table table-bordered table-hover custom-invoice-table" id="tab_logic_total">
                                <tbody>
                                    <tr>
                                        <td class="text-center">Sub Total</td>
                                        <td class="text-center"><input type="number" name='sub_total' placeholder='0.00' class="form-control" id="sub_total" readonly/></td>
                                    </tr>
                                    <tr>
                                        <td class="text-center">Tax</td>
                                        <td class="text-center">
                                            <div class="input-group mb-2 mb-sm-0">
                                                <input type="number" class="form-control" id="tax" placeholder="0">
                                                <div class="input-group-append">
                                                    <span class="input-group-text" id="basic-addon2">%</span>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="text-center">Tax Amount</td>
                                        <td class="text-center"><input type="number" name='tax_amount' id="tax_amount" placeholder='0.00' class="form-control" readonly/></td>
                                    </tr>
                                    <tr>
                                        <td class="text-center">Grand Total</td>
                                        <td class="text-center"><input type="number" name='total_amount' id="total_amount" placeholder='0.00' class="form-control" readonly/></td>
                                    </tr>
                                </tbody>
                            </table>
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
        .custom-invoice-table tbody td {
            padding: 0;
        }
        .custom-invoice-table tbody td:first-child {
            text-align: center;
            vertical-align: middle;
        }
        .custom-invoice-table > tbody > tr > td > input {
            border-radius: 0;
        }
        .custom-invoice-table > tbody > tr > td > .input-group > .form-control {
            border-radius: 0;
        }
        .custom-invoice-table > tbody > tr > td > .input-group > .input-group-append > .input-group-text {
            border-radius: 0;
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

        function calc()
        {
            $('#tab_logic tbody tr').each(function (i, element) {
                var html = $(this).html();
                if (html != '')
                {
                    var qty = $(this).find('.qty').val();
                    var price = $(this).find('.price').val();
                    $(this).find('.total').val(qty * price);

                    calc_total();
                }
            });
        }

        function calc_total()
        {
            total = 0;
            $('.total').each(function () {
                total += parseInt($(this).val());
            });
            $('#sub_total').val(total.toFixed(2));
            tax_sum = total / 100 * $('#tax').val();
            $('#tax_amount').val(tax_sum.toFixed(2));
            $('#total_amount').val((tax_sum + total).toFixed(2));
        }

        var i = 1;
        $("#add_row").click(function () {
            b = i - 1;
            $('#addr' + i).html($('#addr' + b).html()).find('td:first-child').html(i + 1);
            $('#tab_logic').append('<tr id="addr' + (i + 1) + '"></tr>');
            i++;
        });

        $("#delete_row").click(function () {
            if (i > 1) {
                $("#addr" + (i - 1)).html('');
                i--;
            }
            calc();
        });

        $('#tab_logic tbody').on('keyup change', function () {
            calc();
        });

        $('#tax').on('keyup change', function () {
            calc_total();
        });

        jQuery(function ($) {
            // any code put here will be run after content attach to ajax output container and before
            // controll return to main javascript file.
            // <--- HERE --->
            //

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