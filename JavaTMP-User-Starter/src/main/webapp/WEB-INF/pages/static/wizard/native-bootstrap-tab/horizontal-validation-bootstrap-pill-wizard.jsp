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
                        <div class="col-12">
                            <div class="nav  nav-pills nav-justified" id="v-pills-tab" role="tablist" aria-orientation="vertical">
                                <a class="disabled nav-item nav-link" id="step1-" data-toggle="pill" href="#v-pills-home" role="tab" aria-controls="v-pills-home" aria-selected="true">Step 1</a>
                                <a class="disabled nav-item nav-link" id="step2-" data-toggle="pill" href="#v-pills-profile" role="tab" aria-controls="v-pills-profile" aria-selected="false">Step 2</a>
                                <a class="disabled nav-item nav-link" id="step3-" data-toggle="pill" href="#v-pills-messages" role="tab" aria-controls="v-pills-messages" aria-selected="false">Step 3</a>
                                <a class="disabled nav-item nav-link" id="step4-" data-toggle="pill" href="#v-pills-settings" role="tab" aria-controls="v-pills-settings" aria-selected="false">Step 4</a>
                            </div>
                        </div>
                        <div class="col-12 mt-1">
                            <form id="test-form-validation-with-colors-icons">
                                <div class="tab-content" id="v-pills-tabContent">
                                    <div class="tab-pane fade" id="v-pills-home" role="tabpanel" aria-labelledby="step1-">
                                        <div class="form-group form-row">
                                            <label for="fname" class="col-form-label col-md-2">
                                                First Name
                                            </label>
                                            <div class="col-md-9">
                                                <input type="text" name="fname" id="fname" class="form-control" placeholder="Enter first name" />
                                            </div>
                                        </div>
                                        <div class="form-group form-row">
                                            <label for="lname" class="col-form-label col-md-2">
                                                Last Name
                                            </label>
                                            <div class="col-md-9">
                                                <input type="text" name="lname" id="lname" class="form-control" placeholder="Enter last name" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="tab-pane fade" id="v-pills-profile" role="tabpanel" aria-labelledby="step2-">
                                        <div class="form-group form-row">
                                            <label for="username" class="col-form-label col-md-2">
                                                Username
                                            </label>
                                            <div class="col-md-6">
                                                <input type="text" name="username" id="username" class="form-control" placeholder="Enter Username" />
                                            </div>
                                        </div>
                                        <div class="form-group form-row">
                                            <label for="email" class="col-form-label col-md-2">
                                                Email
                                            </label>
                                            <div class="col-md-6">
                                                <input type="email" name="email" id="email" class="form-control" placeholder="Enter Email" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="tab-pane fade" id="v-pills-messages" role="tabpanel" aria-labelledby="step3-">
                                        <div class="form-group form-row">
                                            <label for="password" class="col-form-label col-md-2">
                                                New Password
                                            </label>
                                            <div class="col-md-6">
                                                <input type="password" name="password" id="password" class="form-control" placeholder="Enter Password" />
                                            </div>
                                        </div>
                                        <div class="form-group form-row">
                                            <label for="repeatPassword" class="col-form-label col-md-2">
                                                Repeat Password
                                            </label>
                                            <div class="col-md-6">
                                                <input type="password" name="repeatPassword" id="repeatPassword" class="form-control" placeholder="Enter friend last name" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="tab-pane fade" id="v-pills-settings" role="tabpanel" aria-labelledby="step4-">
                                        <p>Eu dolore ea ullamco dolore Lorem id cupidatat excepteur reprehenderit consectetur elit id dolor proident in cupidatat officia. Voluptate excepteur commodo labore nisi cillum duis aliqua do. Aliqua amet qui mollit consectetur nulla mollit velit aliqua veniam nisi id do Lorem deserunt amet. Culpa ullamco sit adipisicing labore officia magna elit nisi in aute tempor commodo eiusmod.</p>
                                    </div>
                                </div>
                            </form>
                        </div>
                        <div class="col-12 justify-content-end d-flex mt-1">
                            <button type="button" class="mr-1 btn btn-primary previous-button disabled" disabled="">Previous</button>
                            <button type="button" class="btn btn-primary next-button disabled" disabled="">Next</button>
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
            var validator = null;
            $(javatmp.settings.defaultOutputSelector).on(javatmp.settings.javaTmpAjaxContainerReady, function (event) {
                // fire AFTER all transition done and your ajax content is shown to user.
                $(".bootstrap-pill-wizard").each(function () {
                    console.log("show first tab");
                    var firstTab = $(".nav .nav-link:first", $(this));
                    var targetPanelId = $(firstTab).attr("href");
                    $(firstTab).removeClass("disabled");
                    $(targetPanelId).addClass("active show");
                    console.log("id of target = " + $(targetPanelId).attr("id"));
                    $(firstTab).tab('show');
                });
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
                    if (!$("#test-form-validation-with-colors-icons").valid()) {
                        return false;
                    }
                    if ($(nextActiveElement).length > 0) {
                        $(nextActiveElement).removeClass("disabled");
                        $(nextActiveElement).tab('show');
                    } else {
                        $(".nav .nav-link:first", wizardElement).tab('show');
                    }
                });
                $('[data-toggle="pill"]').on('show.bs.tab', function (e) {
                    console.log("show.bs.tab = " + $(e.target).attr("id")); // newly activated tab
                    console.log("show.bs.tab = " + $(e.relatedTarget).attr("id")); // previous active tab
//                    e.preventDefault();
                });
                $('[data-toggle="pill"]').on('shown.bs.tab', function (e) {
                    var wizardElement = $(this).parents(".bootstrap-pill-wizard").first();
                    console.log("shown.bs.tab = " + $(e.target).attr("id")); // newly activated tab
                    console.log("shown.bs.tab = " + $(e.relatedTarget).attr("id")); // previous active tab
                    var currentShownElement = $(e.target);
                    if ($(currentShownElement).prev().length > 0) {
                        $(".previous-button", wizardElement).prop("disabled", false);
                        $(".previous-button", wizardElement).removeClass("disabled");
                    } else {
                        $(".previous-button", wizardElement).prop("disabled", true);
                        $(".previous-button", wizardElement).addClass("disabled");
                    }
                    if ($(currentShownElement).next().length > 0) {
                        $(".next-button", wizardElement).prop("disabled", false);
                        $(".next-button", wizardElement).removeClass("disabled");
                    } else {
                        $(".next-button", wizardElement).prop("disabled", true);
                        $(".next-button", wizardElement).addClass("disabled");
                    }
                    //                    e.preventDefault();
                });
                $('[data-toggle="pill"]').on('hidden.bs.tab', function (e) {
                    console.log("hidden.bs.tab = " + $(e.target).attr("id")); // newly activated tab
                    console.log("hidden.bs.tab = " + $(e.relatedTarget).attr("id")); // previous active tab
//                    e.preventDefault();
                });
                $('[data-toggle="pill"]').on('hide.bs.tab', function (e) {
                    var currentTab = $(e.target);
                    var newTab = $(e.relatedTarget);
                    console.log("hide.bs.tab currentTab = " + $(currentTab).attr("id")); // newly activated tab
                    console.log("hide.bs.tab newTab = " + $(newTab).attr("id")); // previous active tab
//                    e.preventDefault();
//                    return false;
                    var newTabIsSmaller = false;
                    $(currentTab).prevAll().each(function (index, element) {
                        if ($(element).attr("id") === $(newTab).attr("id")) {
                            newTabIsSmaller = true;
                        }
                    });
                    console.log("is previous [" + newTabIsSmaller + "]");
                    if (newTabIsSmaller) {
                        return true;
                    }
                    if (!$("#test-form-validation-with-colors-icons").valid()) {
                        return false;
                    }
                });
                $("#test-form-validation-with-colors-icons").on('submit', function (event) {
                    if (!$(this).valid()) {
                        return;
                    }
                });
                validator = $('#test-form-validation-with-colors-icons').validate({
                    rules: {
                        fname: {
                            minlength: 3,
                            maxlength: 15,
                            required: true,
                            lettersonly: true
                        },
                        lname: {
                            minlength: 3,
                            maxlength: 15,
                            required: true,
                            lettersonly: true
                        },
                        exampleInputEmail1: {
                            minlength: 3,
                            maxlength: 25,
                            required: true,
                            email: true
                        },
                        username: {
                            minlength: 3,
                            maxlength: 15,
                            required: true,
                        },
                        email: {
                            minlength: 3,
                            maxlength: 25,
                            required: true,
                            email: true
                        },
                        password: {
                            minlength: 6,
                            maxlength: 15,
                            required: true
                        },
                        repeatPassword: {
                            minlength: 6,
                            maxlength: 15,
                            required: true,
                            equalTo: "#password"
                        }
                    },
                    highlight: function (element) {
                        $(element).closest('.form-group').removeClass('has-success').addClass('has-error');
                    },
                    unhighlight: function (element) {
                        $(element).closest('.form-group').removeClass('has-error').addClass('has-success');
                    },
                    errorElement: 'small',
                    errorClass: 'form-text text-danger',
                    errorPlacement: function (error, element) {
                        if (element.length) {
                            var targetParent = $(element).parent();
                            if (targetParent.hasClass("form-check") || targetParent.hasClass("custom-control")) {
                                targetParent = targetParent.parent();
                            }
                            targetParent.append(error);
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
                validator.destroy();
                return true;
            });
        });
    </script>
</div>