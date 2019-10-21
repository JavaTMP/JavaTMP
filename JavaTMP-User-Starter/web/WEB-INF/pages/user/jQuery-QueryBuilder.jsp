<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<div class="dynamic-ajax-content grid-gutter-padding">
    <h4 class="my-3">jQuery QueryBuilder</h4>
    <hr/>
    <div class="row">
        <div class="col">
            <div class="card">
                <div class="card-body">
                    <div id="builder1"></div>
                    <button class="btn btn-primary" id="btn-get">Get Rules</button>
                    <button class="btn btn-secondary" id="btn-reset">Reset</button>
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

                var defaultIcons = {
                    add_group: 'fas fa-plus-square',
                    add_rule: 'fas fa-plus-circle',
                    remove_group: 'fas fa-minus-square',
                    remove_rule: 'fas fa-minus-circle',
                    error: 'fas fa-exclamation-triangle'
                };


                $('#builder1').queryBuilder({
                    icons: defaultIcons,
                    select_placeholder: javatmp.settings.defaultSelectPlaceholder,
                    filters: [{
                            id: 'id',
                            label: '${labels['domain.user.id']}',
                            type: 'integer',
                            input: 'number'
                        },
                        {
                            id: 'userName',
                            label: '${labels['domain.user.userName']}',
                            type: 'string',
                            input: 'text'
                        },
                        {
                            id: 'firstName',
                            label: '${labels['domain.user.firstName']}',
                            type: 'string',
                            input: 'text'
                        },
                        {
                            id: 'lastName',
                            label: '${labels['domain.user.lastName']}',
                            type: 'string',
                            input: 'text'
                        },
                        {
                            id: 'birthDate',
                            label: '${labels['domain.user.birthDate']}',
                            type: 'date',
                            input: 'text'
                        },
                        {
                            id: 'age',
                            label: '${labels['domain.user.age']}',
                            type: 'integer',
                            input: 'number'
                        },
                        {
                            id: 'email',
                            label: '${labels['domain.user.email']}',
                            type: 'string',
                            input: 'text'
                        },
                        {
                            id: 'status',
                            label: '${labels['domain.user.status']}',
                            type: 'integer',
                            input: 'select',
                            multiple: false,
                            values: [
                                {"": javatmp.settings.defaultSelectPlaceholder},
                                {1: 'Active'},
                                {0: 'Inactive'}
                            ],
                            operators: ['equal', 'not_equal']
                        },
                        {
                            id: 'country',
                            label: '${labels['domain.user.country']}',
                            type: 'integer',
                            input: 'text'
                        },
                        {
                            id: 'lang',
                            label: '${labels['domain.user.lang']}',
                            type: 'integer',
                            input: 'text'
                        },
                        {
                            id: 'theme',
                            label: '${labels['domain.user.theme']}',
                            type: 'integer',
                            input: 'text'
                        },
                        {
                            id: 'timezone',
                            label: '${labels['domain.user.timezone']}',
                            type: 'string',
                            input: 'text'
                        },
                        {
                            id: 'creationDate',
                            label: '${labels['domain.user.creationDate']}',
                            type: 'datetime',
                            input: 'text'
                        }]
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

                //When rules changed :
                $('#builder1').on('getRules.queryBuilder.filter', function (e) {
                    //$log.info(e.value);
                });

            });
        });
    </script>
</div>