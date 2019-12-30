<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="dynamic-ajax-content grid-gutter-padding">
    <div class="row">
        <div class="col">
            <div class="card my-3">
                <div class="card-header">
                    Bootstrap Pill Wizard
                    <div class="options float-right">
                        <a href="#" class="settings"><i class="fa fa-cog"></i></a>
                        <a href="#" class="collapse"><i class="fa fa-chevron-up"></i></a>
                        <a href="#" class="reload"><i class="fa fa-sync"></i></a>
                        <a href="#" class="fullscreen"><i class=" fa fa-expand"></i></a>
                        <a href="#" class="remove"><i class="fa fa-times"></i></a>
                    </div>
                </div>
                <div class="card-body">
                    <div class="row bootstrap-pill-wizard">
                        <div class="col-3">
                            <div class="nav flex-column nav-pills" id="v-pills-tab" role="tablist" aria-orientation="vertical">
                                <a class="nav-item nav-link active show" id="step1-" data-toggle="pill" href="#v-pills-home" role="tab" aria-controls="v-pills-home" aria-selected="true">Step 1</a>
                                <a class="nav-item nav-link" id="step2-" data-toggle="pill" href="#v-pills-profile" role="tab" aria-controls="v-pills-profile" aria-selected="false">Step 2</a>
                                <a class="nav-item nav-link" id="step3-" data-toggle="pill" href="#v-pills-messages" role="tab" aria-controls="v-pills-messages" aria-selected="false">Step 3</a>
                                <a class="nav-item nav-link" id="step4-" data-toggle="pill" href="#v-pills-settings" role="tab" aria-controls="v-pills-settings" aria-selected="false">Step 4</a>
                            </div>
                        </div>
                        <div class="col-9">
                            <div class="tab-content" id="v-pills-tabContent">
                                <div class="tab-pane fade active show" id="v-pills-home" role="tabpanel" aria-labelledby="step1-">
                                    <p>Cillum ad ut irure tempor velit nostrud occaecat ullamco aliqua anim Lorem sint. Veniam sint duis incididunt do esse magna mollit excepteur laborum qui. Id id reprehenderit sit est eu aliqua occaecat quis et velit excepteur laborum mollit dolore eiusmod. Ipsum dolor in occaecat commodo et voluptate minim reprehenderit mollit pariatur. Deserunt non laborum enim et cillum eu deserunt excepteur ea incididunt minim occaecat.</p>
                                </div>
                                <div class="tab-pane fade" id="v-pills-profile" role="tabpanel" aria-labelledby="step2-">
                                    <p>Culpa dolor voluptate do laboris laboris irure reprehenderit id incididunt duis pariatur mollit aute magna pariatur consectetur. Eu veniam duis non ut dolor deserunt commodo et minim in quis laboris ipsum velit id veniam. Quis ut consectetur adipisicing officia excepteur non sit. Ut et elit aliquip labore Lorem enim eu. Ullamco mollit occaecat dolore ipsum id officia mollit qui esse anim eiusmod do sint minim consectetur qui.</p>
                                </div>
                                <div class="tab-pane fade" id="v-pills-messages" role="tabpanel" aria-labelledby="step3-">
                                    <p>Fugiat id quis dolor culpa eiusmod anim velit excepteur proident dolor aute qui magna. Ad proident laboris ullamco esse anim Lorem Lorem veniam quis Lorem irure occaecat velit nostrud magna nulla. Velit et et proident Lorem do ea tempor officia dolor. Reprehenderit Lorem aliquip labore est magna commodo est ea veniam consectetur.</p>
                                </div>
                                <div class="tab-pane fade" id="v-pills-settings" role="tabpanel" aria-labelledby="step4-">
                                    <p>Eu dolore ea ullamco dolore Lorem id cupidatat excepteur reprehenderit consectetur elit id dolor proident in cupidatat officia. Voluptate excepteur commodo labore nisi cillum duis aliqua do. Aliqua amet qui mollit consectetur nulla mollit velit aliqua veniam nisi id do Lorem deserunt amet. Culpa ullamco sit adipisicing labore officia magna elit nisi in aute tempor commodo eiusmod.</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-12 justify-content-end d-flex">
                            <button type="button" class="mr-1 btn btn-primary previous-button">Previous</button>
                            <button type="button" class="btn btn-primary next-button">Next</button>
                        </div>
                    </div>
                    <div class="mt-3 row bootstrap-pill-wizard">
                        <div class="col-12">
                            <div class="nav nav-pills nav-justified" id="v-pills-tab1" role="tablist" aria-orientation="vertical">
                                <a class="nav-item nav-link active show" id="step1-1" data-toggle="pill" href="#v-pills-home1" role="tab" aria-controls="v-pills-home" aria-selected="true">Step 1</a>
                                <a class="nav-item nav-link" id="step2-1" data-toggle="pill" href="#v-pills-profile1" role="tab" aria-controls="v-pills-profile" aria-selected="false">Step 2</a>
                                <a class="nav-item nav-link" id="step3-1" data-toggle="pill" href="#v-pills-messages1" role="tab" aria-controls="v-pills-messages" aria-selected="false">Step 3</a>
                                <a class="nav-item nav-link" id="step4-1" data-toggle="pill" href="#v-pills-settings1" role="tab" aria-controls="v-pills-settings" aria-selected="false">Step 4</a>
                            </div>
                        </div>
                        <div class="col-12">
                            <div class="tab-content" id="v-pills-tabContent1">
                                <div class="tab-pane fade active show" id="v-pills-home1" role="tabpanel" aria-labelledby="step1-">
                                    <p>Cillum ad ut irure tempor velit nostrud occaecat ullamco aliqua anim Lorem sint. Veniam sint duis incididunt do esse magna mollit excepteur laborum qui. Id id reprehenderit sit est eu aliqua occaecat quis et velit excepteur laborum mollit dolore eiusmod. Ipsum dolor in occaecat commodo et voluptate minim reprehenderit mollit pariatur. Deserunt non laborum enim et cillum eu deserunt excepteur ea incididunt minim occaecat.</p>
                                </div>
                                <div class="tab-pane fade" id="v-pills-profile1" role="tabpanel" aria-labelledby="step2-">
                                    <p>Culpa dolor voluptate do laboris laboris irure reprehenderit id incididunt duis pariatur mollit aute magna pariatur consectetur. Eu veniam duis non ut dolor deserunt commodo et minim in quis laboris ipsum velit id veniam. Quis ut consectetur adipisicing officia excepteur non sit. Ut et elit aliquip labore Lorem enim eu. Ullamco mollit occaecat dolore ipsum id officia mollit qui esse anim eiusmod do sint minim consectetur qui.</p>
                                </div>
                                <div class="tab-pane fade" id="v-pills-messages1" role="tabpanel" aria-labelledby="step3-">
                                    <p>Fugiat id quis dolor culpa eiusmod anim velit excepteur proident dolor aute qui magna. Ad proident laboris ullamco esse anim Lorem Lorem veniam quis Lorem irure occaecat velit nostrud magna nulla. Velit et et proident Lorem do ea tempor officia dolor. Reprehenderit Lorem aliquip labore est magna commodo est ea veniam consectetur.</p>
                                </div>
                                <div class="tab-pane fade" id="v-pills-settings1" role="tabpanel" aria-labelledby="step4-">
                                    <p>Eu dolore ea ullamco dolore Lorem id cupidatat excepteur reprehenderit consectetur elit id dolor proident in cupidatat officia. Voluptate excepteur commodo labore nisi cillum duis aliqua do. Aliqua amet qui mollit consectetur nulla mollit velit aliqua veniam nisi id do Lorem deserunt amet. Culpa ullamco sit adipisicing labore officia magna elit nisi in aute tempor commodo eiusmod.</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-12 justify-content-end d-flex">
                            <button type="button" class="mr-1 btn btn-primary previous-button">Previous</button>
                            <button type="button" class="btn btn-primary next-button">Next</button>
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

            $(javatmp.settings.defaultOutputSelector).on(javatmp.settings.javaTmpAjaxContainerReady, function (event) {

                $(".previous-button").on("click", function () {
                    var wizardElement = $(this).parents(".bootstrap-pill-wizard").first();
                    var currentActiveElement = $(".nav .nav-link.active", wizardElement);
                    var previousElement = $(currentActiveElement).prev();
                    console.log("prev-button current[" + $(currentActiveElement).attr("id") + "], next [" + $(previousElement).attr("id") + "]");
                    if ($(previousElement).length > 0) {
                        $(previousElement).tab('show');
                    } else {
                        $(".nav .nav-link:last", wizardElement).tab('show');
                    }
                });
                $(".next-button").on("click", function () {
                    var wizardElement = $(this).parents(".bootstrap-pill-wizard").first();
                    var currentActiveElement = $(".nav .nav-link.active", wizardElement);
                    var nextActiveElement = $(currentActiveElement).next();
                    console.log("next-button current[" + $(currentActiveElement).attr("id") + "], next [" + $(nextActiveElement).attr("id") + "]");
                    if ($(nextActiveElement).length > 0) {
                        $(nextActiveElement).removeClass("disabled");
                        $(nextActiveElement).tab('show');
                    } else {
                        $(".nav .nav-link:first", wizardElement).tab('show');
                    }
                });
                $('[data-toggle="pill"]').on('show.bs.tab', function (e) {
                    console.log("show.bs.tab.target = " + $(e.target).attr("id")); // newly activated tab
                    console.log("show.bs.tab.relatedTarget = " + $(e.relatedTarget).attr("id")); // previous active tab
//                    e.preventDefault();
                });
                $('[data-toggle="pill"]').on('shown.bs.tab', function (e) {
                    var wizardElement = $(this).parents(".bootstrap-pill-wizard").first();
                    console.log("shown.bs.tab.target = " + $(e.target).attr("id")); // newly activated tab
                    console.log("shown.bs.tab.relatedTarget = " + $(e.relatedTarget).attr("id")); // previous active tab
                });
                $('[data-toggle="pill"]').on('hidden.bs.tab', function (e) {
                    console.log("hidden.bs.tab.target = " + $(e.target).attr("id")); // newly activated tab
                    console.log("hidden.bs.tab.relatedTarget = " + $(e.relatedTarget).attr("id")); // previous active tab
//                    e.preventDefault();
                });
                $('[data-toggle="pill"]').on('hide.bs.tab', function (e) {
                    console.log("hide.bs.tab.target = " + $(e.target).attr("id")); // newly activated tab
                    console.log("hide.bs.tab.relatedTarget = " + $(e.relatedTarget).attr("id")); // previous active tab
//                    e.preventDefault();
//                    return false;
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