<div class="dynamic-ajax-content grid-gutter-padding">
    <div class="row">
        <div class="col-lg-12">
            <div class="alert alert-info mt-3">
                <p>The jQuery Validation Plugin provides drop-in validation for your existing forms, while making all kinds of customizations to fit your application really easy.</p>
                <br/>
                <p>
                    <a class="btn btn-info" target="_blank" href="https://github.com/jquery-validation/jquery-validation">github.com Plugin Page</a>
                    <a class="btn btn-info" target="_blank" href="https://jqueryvalidation.org/">Plugin Home Page</a>
                </p>
            </div>
            <div class="card my-3">
                <div class="card-header">
                    jQuery Form Validation
                    <div class="options float-right">
                        <a class="settings"><i class="fa fa-cog"></i></a>
                        <a href="#" class="collapse"><i class="fa fa-chevron-up"></i></a>
                        <a href="#" class="reload"><i class="fa fa-sync"></i></a>
                        <a href="#" class="fullscreen"><i class=" fa fa-expand"></i></a>
                        <a href="#" class="remove"><i class="fa fa-times"></i></a>
                    </div>
                </div>
                <div class="card-body">
                    <div class="row">
                        <div class="col-lg-12">
                            <form id="test-form-validation-with-colors-icons">
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Email address</label>
                                    <input type="email" class="form-control required" name="exampleInputEmail1" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                                    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                                </div>
                                <div class="form-group">
                                    <div class="form-check">
                                        <input type="checkbox" name="exampleCheck1" class="required form-check-input" id="exampleCheck1">
                                        <label class="form-check-label" for="exampleCheck1">Check me out</label>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input required" type="checkbox" id="inlineCheckbox1" name="inlineCheckbox[]" value="option1">
                                        <label class="form-check-label" for="inlineCheckbox1">First</label>
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input required" type="checkbox" id="inlineCheckbox2" name="inlineCheckbox[]" value="option2">
                                        <label class="form-check-label" for="inlineCheckbox2">Second</label>
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input required" type="checkbox" id="inlineCheckbox3" name="inlineCheckbox[]" value="option3">
                                        <label class="form-check-label" for="inlineCheckbox3">Third</label>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input required" type="radio" name="inlineRadioOptions" id="inlineRadio1" value="option1">
                                        <label class="form-check-label" for="inlineRadio1">1</label>
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input required" type="radio" name="inlineRadioOptions" id="inlineRadio2" value="option2">
                                        <label class="form-check-label" for="inlineRadio2">2</label>
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input required" type="radio" name="inlineRadioOptions" id="inlineRadio3" value="option3">
                                        <label class="form-check-label" for="inlineRadio3">3</label>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="exampleFormControlSelect1">Example select</label>
                                    <select class="form-control required" name="exampleFormControlSelect1" id="exampleFormControlSelect1">
                                        <option value="">Choose ...</option>
                                        <option>1</option>
                                        <option>2</option>
                                        <option>3</option>
                                        <option>4</option>
                                        <option>5</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label for="exampleFormControlSelect2">Example multiple select</label>
                                    <select multiple class="form-control required" name="exampleFormControlSelect2" id="exampleFormControlSelect2">
                                        <option>1</option>
                                        <option>2</option>
                                        <option>3</option>
                                        <option>4</option>
                                        <option>5</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label for="exampleFormControlTextarea1">Example textarea</label>
                                    <textarea class="form-control required" name="exampleFormControlTextarea1" id="exampleFormControlTextarea1" rows="3"></textarea>
                                </div>
                                <div class="form-group">
                                    <label for="exampleFormControlFile1">Example file input</label>
                                    <input type="file" class="form-control-file required" name="exampleFormControlFile1" id="exampleFormControlFile1">
                                </div>
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
                                <div class="form-group form-row">
                                    <label for="lname" class="col-form-label col-md-2">
                                        Radio Buttons
                                    </label>
                                    <div class="col-md-9">
                                        <div class="form-check">
                                            <input class="form-check-input required" type="radio" name="exampleRadios" id="exampleRadios1" value="option1">
                                            <label class="form-check-label" for="exampleRadios1">
                                                Default radio
                                            </label>
                                        </div>
                                        <div class="form-check">
                                            <input class="form-check-input" type="radio" name="exampleRadios" id="exampleRadios2" value="option2">
                                            <label class="form-check-label" for="exampleRadios2">
                                                Second default radio
                                            </label>
                                        </div>
                                        <div class="form-check">
                                            <input class="form-check-input" type="radio" name="exampleRadios" id="exampleRadios3" value="option3">
                                            <label class="form-check-label" for="exampleRadios3">
                                                Third Default radio
                                            </label>
                                        </div>
                                    </div>
                                </div>
                                <fieldset class="form-group">
                                    <div class="row">
                                        <legend class="col-form-label col-sm-2 pt-0">Radios</legend>
                                        <div class="col-sm-10">
                                            <div class="form-check">
                                                <input class="form-check-input required" type="radio" name="gridRadios11" id="gridRadios1" value="option1">
                                                <label class="form-check-label" for="gridRadios1">
                                                    First radio
                                                </label>
                                            </div>
                                            <div class="form-check">
                                                <input class="form-check-input required" type="radio" name="gridRadios11" id="gridRadios2" value="option2">
                                                <label class="form-check-label" for="gridRadios2">
                                                    Second radio
                                                </label>
                                            </div>
                                            <div class="form-check">
                                                <input class="form-check-input required" type="radio" name="gridRadios11" id="gridRadios3" value="option3">
                                                <label class="form-check-label" for="gridRadios3">
                                                    Third disabled radio
                                                </label>
                                            </div>
                                        </div>
                                    </div>
                                </fieldset>
                                <div class="form-group form-row">
                                    <div class="col-sm-2">
                                        Checkbox
                                    </div>
                                    <div class="col-sm-10">
                                        <div class="form-check">
                                            <input class="form-check-input required" name="gridCheck1" type="checkbox" id="gridCheck1">
                                            <label class="form-check-label" for="gridCheck1">
                                                Example checkbox
                                            </label>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group form-row">
                                    <div class="col-sm-2">
                                        Checkbox
                                    </div>
                                    <div class="col-sm-10">
                                        <div class="form-group">
                                            <div class="form-check form-check-inline">
                                                <input class="form-check-input required" type="checkbox" id="inlineCheckbox11" name="inlineCheckbox1[]" value="option1">
                                                <label class="form-check-label" for="inlineCheckbox11">First</label>
                                            </div>
                                            <div class="form-check form-check-inline">
                                                <input class="form-check-input required" type="checkbox" id="inlineCheckbox21" name="inlineCheckbox1[]" value="option2">
                                                <label class="form-check-label" for="inlineCheckbox21">Second</label>
                                            </div>
                                            <div class="form-check form-check-inline">
                                                <input class="form-check-input required" type="checkbox" id="inlineCheckbox31" name="inlineCheckbox1[]" value="option3">
                                                <label class="form-check-label" for="inlineCheckbox31">Third</label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="custom-control custom-checkbox">
                                        <input type="checkbox" class="custom-control-input required" name="customCheck1" id="customCheck1">
                                        <label class="custom-control-label" for="customCheck1">Check this custom checkbox</label>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="custom-control custom-radio">
                                        <input type="radio" id="customRadio1" name="customRadio" class="custom-control-input required">
                                        <label class="custom-control-label" for="customRadio1">Toggle this custom radio</label>
                                    </div>
                                    <div class="custom-control custom-radio">
                                        <input type="radio" id="customRadio2" name="customRadio" class="custom-control-input required">
                                        <label class="custom-control-label" for="customRadio2">Or toggle this other custom radio</label>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="custom-control custom-radio custom-control-inline">
                                        <input type="radio" id="customRadioInline1" name="customRadioInline1" class="custom-control-input required">
                                        <label class="custom-control-label" for="customRadioInline1">Toggle this custom radio</label>
                                    </div>
                                    <div class="custom-control custom-radio custom-control-inline">
                                        <input type="radio" id="customRadioInline2" name="customRadioInline1" class="custom-control-input required">
                                        <label class="custom-control-label" for="customRadioInline2">Or toggle this other custom radio</label>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <select class="custom-select required" name="customSelectVertical">
                                        <option value="">Choose ...</option>
                                        <option value="1">One</option>
                                        <option value="2">Two</option>
                                        <option value="3">Three</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <select class="custom-select required" multiple="" name="customSelectVerticalMultiple">
                                        <option value="0">Zero</option>
                                        <option value="1">One</option>
                                        <option value="2">Two</option>
                                        <option value="3">Three</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label for="customFile">Example file input</label>
                                    <div class="custom-file">
                                        <input type="file" class="custom-file-input required" name="customFile" id="customFile">
                                        <label class="custom-file-label" for="customFile">Choose file</label>
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="form-group form-group-sm col-sm-6">
                                        <div class="row">
                                            <label for="first_name" class="col-sm-3 col-form-label">First Name</label>
                                            <div class="col-sm-9">
                                                <input type="text" class="form-control required" id="first_name" name="first_name">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group form-group-sm col-sm-6">
                                        <div class="row">
                                            <label for="last_name" class="col-sm-3 col-form-label">Last Name</label>
                                            <div class="col-sm-9">
                                                <input type="text" class="form-control required" id="last_name" name="last_name">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group form-group-sm col-sm-6">
                                        <div class="row">
                                            <label for="Street" class="col-sm-3 col-form-label">Street</label>
                                            <div class="col-sm-9">
                                                <input type="text" class="form-control required" id="Street" name="Street">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group form-group-sm col-sm-6">
                                        <div class="row">
                                            <label for="City" class="col-sm-3 col-form-label">City</label>
                                            <div class="col-sm-9">
                                                <input type="text" class="form-control required" id="City" name="City">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="form-group form-group-sm col-sm-6">
                                        <label for="first_name11" class="col-form-label">First Name</label>
                                        <input type="text" class="form-control required" id="first_name11" name="first_name11">
                                    </div>
                                    <div class="form-group form-group-sm col-sm-6">
                                        <label for="last_name11" class="col-form-label">Last Name</label>
                                        <input type="text" class="form-control required" id="last_name11" name="last_name11">
                                    </div>
                                    <div class="form-group form-group-sm col-sm-6">
                                        <label for="Street11" class="col-form-label">Street</label>
                                        <input type="text" class="form-control required" id="Street11" name="Street11">
                                    </div>
                                    <div class="form-group form-group-sm col-sm-6">
                                        <label for="City11" class="col-form-label">City</label>
                                        <input type="text" class="form-control required" id="City11" name="City11">
                                    </div>
                                </div>
                                <div class="form-actions col-md-offset-2">
                                    <button type="submit" class="btn btn-primary">Submit</button>
                                </div>
                            </form>
                        </div>
                    </div>
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
            var validator = null;

            $(javatmp.settings.defaultOutputSelector).on(javatmp.settings.javaTmpAjaxContainerReady, function (event) {
                // fire AFTER all transition done and your ajax content is shown to user.
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
                            required: true
                        },
                        lname: {
                            minlength: 3,
                            maxlength: 15,
                            required: true
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
             * When another sidebar menu item pressed and before container replaced with new ajax content.
             * You can cancel, destroy, or remove any thing here before replace main output ajax container.
             * returning false will cancel the new request and do nothing.
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
