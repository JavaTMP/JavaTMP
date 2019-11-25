<div class="dynamic-ajax-content grid-gutter-padding">
    <h4 class="my-3">jQuery QueryBuilder</h4>
    <hr/>
    <div class="row">
        <div class="col">
            <div class="alert alert-info">
                <p>jQuery plugin offering an interface to create complex queries</p>
                <p class="text-danger"><b>Right To Left (RTL) is currently not supported</b></p>
                <p>
                    <a class="btn btn-info" target="_blank" href="https://querybuilder.js.org/">Home Page</a>
                    <a class="btn btn-info" target="_blank" href="https://github.com/mistic100/jQuery-QueryBuilder">github.com Project Link</a>
                    <a class="btn btn-info" target="_blank" href="https://querybuilder.js.org/assets/demo-widgets.js">jquery-QueryBuilder plugin integration</a>
                </p>
            </div>
            <div class="card">
                <div class="card-body">
                    <h4>Basic Demo With Default operators for predefine types:</h4>
                    <div dir="ltr" id="builder-basic"></div>
                    <div class="btn-group">
                        <button class="btn btn-warning reset" data-target="basic">Reset</button>
                        <!--<button class="btn btn-success set-json" data-target="basic">Set rules</button>-->
                        <button class="btn btn-primary parse-json" data-target="basic">Get rules</button>
                    </div>
                </div>
            </div>
            <div class="card mt-3">
                <div class="card-body">
                    <h4>Demo with Fields:</h4>
                    <div id="builder1"></div>
                    <button class="btn btn-success" id="btn-set">Set Rules</button>
                    <button class="btn btn-primary" id="btn-get">Get Rules</button>
                    <button class="btn btn-warning" id="btn-reset">Reset</button>
                    </body>
                </div>
            </div>
            <div class="card mt-3">
                <div class="card-body">
                    <h4>Select2 Plugin:</h4>
                    <div id="builder2"></div>
                    <button class="btn btn-success" id="btn-set1">Set Rules</button>
                    <button class="btn btn-primary" id="btn-get1">Get Rules</button>
                    <button class="btn btn-warning" id="btn-reset1">Reset</button>
                    </body>
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

                $(javatmp.settings.defaultOutputSelector).on(javatmp.settings.javaTmpContainerResizeEventName, function (event) {
                    // fire when user resize browser window or sidebar hide / show
                });

                /**
                 * When another sidebar menu item pressed and before container issues new ajax request.
                 * You can cancel, destroy, or remove any thing here before replace main output ajax container.
                 * return false or event.preventDefault() will cancel ajax and stay you in the current page and do nothing.
                 **/
                $(javatmp.settings.defaultOutputSelector).on(javatmp.settings.javaTmpContainerRemoveEventName, function (event) {
                    var newLink = $(event._newTarget);
                    return true;
                });

                // Your custom specific page code here:

                var rules_basic1 = {
                    condition: 'AND',
                    rules: [{
                            id: 'price',
                            operator: 'less',
                            value: 10.25
                        }, {
                            condition: 'OR',
                            rules: [{
                                    id: 'category',
                                    operator: 'equal',
                                    value: 2
                                }, {
                                    id: 'category',
                                    operator: 'equal',
                                    value: 1
                                }]
                        }]
                };

                var defaultIcons = {
                    add_group: 'fas fa-plus-square',
                    add_rule: 'fas fa-plus-circle',
                    remove_group: 'fas fa-minus-square',
                    remove_rule: 'fas fa-minus-circle',
                    error: 'fas fa-exclamation-triangle'
                };
                var defaultType = ["string", "integer", "double", "date", "time", "datetime", "boolean"];

                var filters = [];
                $.each(defaultType, function (index, value) {
                    filters.push({
                        id: value,
                        label: value,
                        type: value
                    });
                });

                $('#builder-basic').queryBuilder({
                    icons: defaultIcons,
                    filters: filters
                });

                $('.reset').on('click', function () {
                    $('#builder-basic').queryBuilder('reset');
                });

                $('.set-json').on('click', function () {
                    $('#builder-basic').queryBuilder('setRules', rules_basic);
                });

                $('.parse-json').on('click', function () {
                    var result = $('#builder-basic').queryBuilder('getRules');

                    if (!$.isEmptyObject(result)) {
                        console.log(JSON.stringify(result, null, 2));
                        alert(JSON.stringify(result, null, 2));
                    }
                });

                var rules_basic = {
                    condition: 'AND',
                    rules: [{
                            id: 'price',
                            operator: 'less',
                            value: 10.25
                        }, {
                            condition: 'OR',
                            rules: [{
                                    id: 'category',
                                    operator: 'equal',
                                    value: 2
                                }, {
                                    id: 'category',
                                    operator: 'equal',
                                    value: 1
                                }]
                        }]
                };

                $('#builder1').queryBuilder({
                    icons: defaultIcons,
                    filters: [{
                            id: 'name',
                            label: 'Name',
                            type: 'string'
                        }, {
                            id: 'category',
                            label: 'Category',
                            type: 'integer',
                            input: 'select',
                            multiple: true,
                            values: {
                                1: 'Books',
                                2: 'Movies',
                                3: 'Music',
                                4: 'Tools',
                                5: 'Goodies',
                                6: 'Clothes'
                            },
                            operators: ['equal', 'not_equal', 'in', 'not_in', 'is_null', 'is_not_null']
                        }, {
                            id: 'in_stock',
                            label: 'In stock',
                            type: 'integer',
                            input: 'radio',
                            values: {
                                1: 'Yes',
                                0: 'No'
                            },
                            operators: ['equal']
                        }, {
                            id: 'price',
                            label: 'Price',
                            type: 'double',
                            validation: {
                                min: 0,
                                step: 0.01
                            }
                        }, {
                            id: 'id',
                            label: 'Identifier',
                            type: 'string',
                            placeholder: '____-____-____',
                            operators: ['equal', 'not_equal'],
                            validation: {
                                format: /^.{4}-.{4}-.{4}$/
                            }
                        }],
                    rules: rules_basic
                });
                /****************************************************************
                 Triggers and Changers QueryBuilder
                 *****************************************************************/

                $('#btn-get').on('click', function () {
                    var result = $('#builder1').queryBuilder('getRules');
                    if (!$.isEmptyObject(result)) {
                        console.log(JSON.stringify(result, null, 2));
                        alert(JSON.stringify(result, null, 2));
                    } else {
                        console.log("invalid object :");
                    }
                    console.log(result);
                });

                $('#btn-reset').on('click', function () {
                    $('#builder1').queryBuilder('reset');
                });

                $('#btn-set').on('click', function () {
                    $('#builder1').queryBuilder('setRules', rules_basic);
//                    var result = $('#builder1').queryBuilder('getRules');
//                    if (!$.isEmptyObject(result)) {
//                        rules_basic = result;
//                    }
                });

                //When rules changed :
                $('#builder1').on('getRules.queryBuilder.filter', function (e) {
                    //$log.info(e.value);
                });

                // define select2 with query builder :
                $.fn.queryBuilder.define('custom-plugin', function (options) {
                    console.log(this.settings);
                    console.log(options);
                    // init selectpicker
                    this.on('afterCreateRuleFilters', function (e, rule) {
                        console.log("afterCreateRuleFilters. e =");
                        console.log(rule.$el);
                    });

                    this.on('afterCreateRuleOperators', function (e, rule) {
                        console.log("afterCreateRuleOperators. e =");
                        console.log(rule.$el);
                    });

                    // update selectpicker on change
                    this.on('afterUpdateRuleFilter', function (e, rule) {
                        console.log("afterUpdateRuleFilter. e =");
                        console.log(rule.$el);
                    });

                    this.on('afterUpdateRuleOperator', function (e, rule) {
                        console.log("afterUpdateRuleOperator. e =");
                        console.log(rule.$el);
                    });

                    this.on('beforeDeleteRule', function (e, rule) {
                        console.log("beforeDeleteRule. e =");
                        console.log(rule.$el);
                    });
                }, {

                });


                $('#builder2').queryBuilder({
                    plugins: ['custom-plugin'],
                    icons: defaultIcons,
                    filters: [{
                            id: 'name',
                            label: 'Name',
                            type: 'string'
                        }, {
                            id: 'category',
                            label: 'Category',
                            type: 'integer',
                            input: 'select',
                            multiple: false,
                            values: {
                                1: 'Books',
                                2: 'Movies',
                                3: 'Music',
                                4: 'Tools',
                                5: 'Goodies',
                                6: 'Clothes'
                            },
                            plugin: 'select2',
                            plugin_config: {
                                "theme": "bootstrap"
                            },
                            operators: ['equal', 'not_equal', 'in', 'not_in', 'is_null', 'is_not_null']
                        }, {
                            id: 'in_stock',
                            label: 'In stock',
                            type: 'integer',
                            input: 'radio',
                            values: {
                                1: 'Yes',
                                0: 'No'
                            },
                            operators: ['equal']
                        }, {
                            id: 'price',
                            label: 'Price',
                            type: 'double',
                            validation: {
                                min: 0,
                                step: 0.01
                            }
                        }, {
                            id: 'id',
                            label: 'Identifier',
                            type: 'string',
                            placeholder: '____-____-____',
                            operators: ['equal', 'not_equal'],
                            validation: {
                                format: /^.{4}-.{4}-.{4}$/
                            }
                        }],
                    rules: rules_basic
                });

                $('#btn-get1').on('click', function () {
                    var result = $('#builder2').queryBuilder('getRules');
                    if (!$.isEmptyObject(result)) {
                        console.log(JSON.stringify(result, null, 2));
                        alert(JSON.stringify(result, null, 2));
                    } else {
                        console.log("invalid object :");
                    }
                    console.log(result);
                });

                $('#btn-reset1').on('click', function () {
                    $('#builder2').queryBuilder('reset');
                });

                $('#btn-set').on('click', function () {
                    $('#builder2').queryBuilder('setRules', rules_basic);
//                    var result = $('#builder1').queryBuilder('getRules');
//                    if (!$.isEmptyObject(result)) {
//                        rules_basic = result;
//                    }
                });

            });
        });
    </script>
</div>