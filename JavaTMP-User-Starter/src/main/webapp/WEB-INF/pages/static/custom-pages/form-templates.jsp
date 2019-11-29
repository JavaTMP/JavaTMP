<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="dynamic-ajax-content grid-gutter-padding">
    <h4 class="my-3">Collection of form templates</h4>
    <hr/>
    <div class="row">
        <div class="col-lg-12">
            <ul class="nav nav-fill">
                <a class="nav-item" href="#formLogin">Login</a>
                <a class="nav-item" href="#formRegister">Sign-up</a>
                <a class="nav-item" href="#formChangePassword">Password</a>
                <a class="nav-item" href="#formResetPassword">Reset</a>
                <a class="nav-item" href="#formPayment">Payment</a>
                <a class="nav-item" href="#formUserEdit">User</a>
                <a class="nav-item" href="#formContact">Contact</a>
                <a class="nav-item" href="#formComplex">Complex</a>
            </ul>
            <hr class="mb-5">
            <div class="row">
                <div class="col-md-6 offset-md-3">
                    <span class="anchor" id="formLogin"></span>
                    <!-- form card login with validation feedback -->
                    <div class="card card-outline-secondary">
                        <div class="card-header">
                            <h3 class="mb-0">Login</h3>
                        </div>
                        <div class="card-body">
                            <form class="form" role="form" autocomplete="off" id="loginForm" novalidate="" method="POST">
                                <div class="form-group">
                                    <label for="uname1">Username</label>
                                    <input type="text" class="form-control" name="uname1" id="uname1" required="">
                                    <div class="invalid-feedback">Please enter your username or email</div>
                                </div>
                                <div class="form-group">
                                    <label>Password</label>
                                    <input type="password" class="form-control" id="pwd1" required="" autocomplete="new-password">
                                    <div class="invalid-feedback">Please enter a password</div>
                                </div>
                                <div class="form-check small">
                                    <label class="form-check-label">
                                        <input type="checkbox" class="form-check-input"> <span>Remember me on this computer</span>
                                    </label>
                                </div>
                                <button type="submit" class="btn btn-success btn-lg float-right" id="btnLogin">Login</button>
                            </form>
                        </div>
                        <!--/card-body-->
                    </div>
                    <!-- /form card login -->

                </div>
                <div class="col-md-6 offset-md-3">
                    <span class="anchor" id="formRegister"></span>
                    <hr class="mb-5">

                    <!-- form card register -->
                    <div class="card card-outline-secondary">
                        <div class="card-header">
                            <h3 class="mb-0">Sign Up</h3>
                        </div>
                        <div class="card-body">
                            <form class="form" role="form" autocomplete="off">
                                <div class="form-group">
                                    <label for="inputName">Name</label>
                                    <input type="text" class="form-control" id="inputName" placeholder="Full name">
                                </div>
                                <div class="form-group">
                                    <label for="inputEmail3">Email</label>
                                    <input type="email" class="form-control" id="inputEmail3" placeholder="Email" required="">
                                </div>
                                <div class="form-group">
                                    <label for="inputPassword3">Password</label>
                                    <input type="password" class="form-control" id="inputPassword3" placeholder="Password" required="">
                                </div>
                                <div class="form-group">
                                    <label for="inputVerify3">Verify</label>
                                    <input type="password" class="form-control" id="inputVerify3" placeholder="Password (again)" required="">
                                </div>
                                <div class="form-group">
                                    <button type="submit" class="btn btn-success btn-lg float-right">Register</button>
                                </div>
                            </form>
                        </div>
                    </div>
                    <!-- /form card register -->

                </div>
                <div class="col-md-6 offset-md-3">
                    <span class="anchor" id="formChangePassword"></span>
                    <hr class="mb-5">

                    <!-- form card change password -->
                    <div class="card card-outline-secondary">
                        <div class="card-header">
                            <h3 class="mb-0">Change Password</h3>
                        </div>
                        <div class="card-body">
                            <form class="form" role="form" autocomplete="off">
                                <div class="form-group">
                                    <label for="inputPasswordOld">Current Password</label>
                                    <input type="password" class="form-control" id="inputPasswordOld" required="">
                                </div>
                                <div class="form-group">
                                    <label for="inputPasswordNew">New Password</label>
                                    <input type="password" class="form-control" id="inputPasswordNew" required="">
                                    <span class="form-text small text-muted">
                                        The password must be 8-20 characters, and must <em>not</em> contain spaces.
                                    </span>
                                </div>
                                <div class="form-group">
                                    <label for="inputPasswordNewVerify">Verify</label>
                                    <input type="password" class="form-control" id="inputPasswordNewVerify" required="">
                                    <span class="form-text small text-muted">
                                        To confirm, type the new password again.
                                    </span>
                                </div>
                                <div class="form-group">
                                    <button type="submit" class="btn btn-success btn-lg float-right">Save</button>
                                </div>
                            </form>
                        </div>
                    </div>
                    <!-- /form card change password -->

                </div>
                <div class="col-md-6 offset-md-3">
                    <span class="anchor" id="formResetPassword"></span>
                    <hr class="mb-5">

                    <!-- form card reset password -->
                    <div class="card card-outline-secondary">
                        <div class="card-header">
                            <h3 class="mb-0">Password Reset</h3>
                        </div>
                        <div class="card-body">
                            <form class="form" role="form" autocomplete="off">
                                <div class="form-group">
                                    <label for="inputResetPasswordEmail">Email</label>
                                    <input type="email" class="form-control" id="inputResetPasswordEmail" required="">
                                    <span id="helpResetPasswordEmail" class="form-text small text-muted">
                                        Password reset instructions will be sent to this email address.
                                    </span>
                                </div>
                                <div class="form-group">
                                    <button type="submit" class="btn btn-success btn-lg float-right">Reset</button>
                                </div>
                            </form>
                        </div>
                    </div>
                    <!-- /form card reset password -->

                </div>
                <div class="col-md-6 offset-md-3">
                    <span class="anchor" id="formPayment"></span>
                    <hr class="my-5">

                    <!-- form card cc payment -->
                    <div class="card card-outline-secondary">
                        <div class="card-body">
                            <h3 class="text-center">Credit Card Payment</h3>
                            <hr>
                            <div class="alert alert-info p-2 pb-3">
                                <a class="close font-weight-normal initialism" data-dismiss="alert" href="#"><samp>&times;</samp></a>
                                CVC code is required.
                            </div>
                            <form class="form" role="form" autocomplete="off">
                                <div class="form-group">
                                    <label for="cc_name">Card Holder's Name</label>
                                    <input type="text" class="form-control" id="cc_name" pattern="\w+ \w+.*" title="First and last name" required="required">
                                </div>
                                <div class="form-group">
                                    <label>Card Number</label>
                                    <input type="text" class="form-control" autocomplete="off" maxlength="20" pattern="\d{16}" title="Credit card number" required="">
                                </div>
                                <div class="form-group row">
                                    <label class="col-md-12">Card Exp. Date</label>
                                    <div class="col-md-4">
                                        <select class="form-control" name="cc_exp_mo" size="0">
                                            <option value="01">01</option>
                                            <option value="02">02</option>
                                            <option value="03">03</option>
                                            <option value="04">04</option>
                                            <option value="05">05</option>
                                            <option value="06">06</option>
                                            <option value="07">07</option>
                                            <option value="08">08</option>
                                            <option value="09">09</option>
                                            <option value="10">10</option>
                                            <option value="11">11</option>
                                            <option value="12">12</option>
                                        </select>
                                    </div>
                                    <div class="col-md-4">
                                        <select class="form-control" name="cc_exp_yr" size="0">
                                            <option>2018</option>
                                            <option>2019</option>
                                            <option>2020</option>
                                            <option>2021</option>
                                            <option>2022</option>
                                        </select>
                                    </div>
                                    <div class="col-md-4">
                                        <input type="text" class="form-control" autocomplete="off" maxlength="3" pattern="\d{3}" title="Three digits at back of your card" required="" placeholder="CVC">
                                    </div>
                                </div>
                                <div class="row">
                                    <label class="col-md-12">Amount</label>
                                </div>
                                <div class="form-inline">
                                    <div class="input-group">
                                        <div class="input-group-prepend"><span class="input-group-text">$</span></div>
                                        <input type="text" class="form-control text-right" id="exampleInputAmount" placeholder="39">
                                        <div class="input-group-append"><span class="input-group-text">.00</span></div>
                                    </div>
                                </div>
                                <hr>
                                <div class="form-group row">
                                    <div class="col-md-6">
                                        <button type="reset" class="btn btn-default btn-lg btn-block">Cancel</button>
                                    </div>
                                    <div class="col-md-6">
                                        <button type="submit" class="btn btn-success btn-lg btn-block">Submit</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                    <!-- /form card cc payment -->

                </div>
                <!--/col-->
                <div class="col-md-8 offset-md-2">
                    <span class="anchor" id="formUserEdit"></span>
                    <hr class="my-5">

                    <!-- form user info -->
                    <div class="card card-outline-secondary">
                        <div class="card-header">
                            <h3 class="mb-0">User Information</h3>
                        </div>
                        <div class="card-body">
                            <form class="form" role="form" autocomplete="off">
                                <div class="form-group row">
                                    <label class="col-lg-3 col-form-label form-control-label">First name</label>
                                    <div class="col-lg-9">
                                        <input class="form-control" type="text" value="Jane">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-lg-3 col-form-label form-control-label">Last name</label>
                                    <div class="col-lg-9">
                                        <input class="form-control" type="text" value="Bishop">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-lg-3 col-form-label form-control-label">Email</label>
                                    <div class="col-lg-9">
                                        <input class="form-control" type="email" value="email@gmail.com">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-lg-3 col-form-label form-control-label">Company</label>
                                    <div class="col-lg-9">
                                        <input class="form-control" type="text" value="">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-lg-3 col-form-label form-control-label">Website</label>
                                    <div class="col-lg-9">
                                        <input class="form-control" type="url" value="">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-lg-3 col-form-label form-control-label">Time Zone</label>
                                    <div class="col-lg-9">
                                        <select id="user_time_zone" class="form-control" size="0">
                                            <option value="Hawaii">(GMT-10:00) Hawaii</option>
                                            <option value="Alaska">(GMT-09:00) Alaska</option>
                                            <option value="Pacific Time (US &amp; Canada)">(GMT-08:00) Pacific Time (US &amp; Canada)</option>
                                            <option value="Arizona">(GMT-07:00) Arizona</option>
                                            <option value="Mountain Time (US &amp; Canada)">(GMT-07:00) Mountain Time (US &amp; Canada)</option>
                                            <option value="Central Time (US &amp; Canada)" selected="selected">(GMT-06:00) Central Time (US &amp; Canada)</option>
                                            <option value="Eastern Time (US &amp; Canada)">(GMT-05:00) Eastern Time (US &amp; Canada)</option>
                                            <option value="Indiana (East)">(GMT-05:00) Indiana (East)</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-lg-3 col-form-label form-control-label">Username</label>
                                    <div class="col-lg-9">
                                        <input class="form-control" type="text" value="janeuser">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-lg-3 col-form-label form-control-label">Password</label>
                                    <div class="col-lg-9">
                                        <input class="form-control" type="password" value="11111122333">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-lg-3 col-form-label form-control-label">Confirm</label>
                                    <div class="col-lg-9">
                                        <input class="form-control" type="password" value="11111122333">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-lg-3 col-form-label form-control-label"></label>
                                    <div class="col-lg-9">
                                        <input type="reset" class="btn btn-secondary" value="Cancel">
                                        <input type="button" class="btn btn-primary" value="Save Changes">
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                    <!-- /form user info -->

                </div>
                <!--/col-->
                <div class="col-md-6 offset-md-3">
                    <span class="anchor" id="formContact"></span>
                    <hr class="my-5">

                    <!-- form user info -->
                    <div class="card card-outline-secondary">
                        <div class="card-header">
                            <h3 class="mb-0">Contact</h3>
                        </div>
                        <div class="card-body">
                            <form class="form" role="form" autocomplete="off">
                                <fieldset>
                                    <label for="name2" class="mb-0">Name</label>
                                    <div class="row mb-1">
                                        <div class="col-lg-12">
                                            <input type="text" name="name2" id="name2" class="form-control" required="">
                                        </div>
                                    </div>
                                    <label for="email2" class="mb-0">Email</label>
                                    <div class="row mb-1">
                                        <div class="col-lg-12">
                                            <input type="text" name="email2" id="email2" class="form-control" required="">
                                        </div>
                                    </div>
                                    <label for="message2" class="mb-0">Message</label>
                                    <div class="row mb-1">
                                        <div class="col-lg-12">
                                            <textarea rows="6" name="message2" id="message2" class="form-control" required=""></textarea>
                                        </div>
                                    </div>
                                    <button type="submit" class="btn btn-secondary btn-lg float-right">Send Message</button>
                                </fieldset>
                            </form>
                        </div>
                    </div>
                    <!-- /form user info -->

                </div>
                <!--/col-->

                <div class="col-md-10 offset-md-1">
                    <span class="anchor" id="formComplex"></span>
                    <hr class="my-5">
                    <h3>Complex Form Example </h3>

                    <!-- form complex example -->
                    <div class="form-row mt-4">
                        <div class="col-sm-5 pb-3">
                            <label for="exampleAccount">Account #</label>
                            <input type="text" class="form-control" id="exampleAccount" placeholder="XXXXXXXXXXXXXXXX">
                        </div>
                        <div class="col-sm-3 pb-3">
                            <label for="exampleCtrl">Control #</label>
                            <input type="text" class="form-control" id="exampleCtrl" placeholder="0000">
                        </div>
                        <div class="col-sm-4 pb-3">
                            <label for="exampleAmount">Amount</label>
                            <div class="input-group">
                                <div class="input-group-prepend"><span class="input-group-text">$</span></div>
                                <input type="text" class="form-control" id="exampleAmount" placeholder="Amount">
                            </div>
                        </div>
                        <div class="col-sm-6 pb-3">
                            <label for="exampleFirst">First Name</label>
                            <input type="text" class="form-control" id="exampleFirst">
                        </div>
                        <div class="col-sm-6 pb-3">
                            <label for="exampleLast">Last Name</label>
                            <input type="text" class="form-control" id="exampleLast">
                        </div>
                        <div class="col-sm-6 pb-3">
                            <label for="exampleCity">City</label>
                            <input type="text" class="form-control" id="exampleCity">
                        </div>
                        <div class="col-sm-3 pb-3">
                            <label for="exampleSt">State</label>
                            <select class="form-control" id="exampleSt">
                                <option>Pick a state</option>
                            </select>
                        </div>
                        <div class="col-sm-3 pb-3">
                            <label for="exampleZip">Postal Code</label>
                            <input type="text" class="form-control" id="exampleZip">
                        </div>
                        <div class="col-md-6 pb-3">
                            <label for="exampleAccount">Color</label>
                            <div class="form-group small">
                                <div class="form-check form-check-inline">
                                    <label class="form-check-label">
                                        <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio1" value="option1"> Blue
                                    </label>
                                </div>
                                <div class="form-check form-check-inline">
                                    <label class="form-check-label">
                                        <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio2" value="option2"> Red
                                    </label>
                                </div>
                                <div class="form-check form-check-inline disabled">
                                    <label class="form-check-label">
                                        <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio3" value="option3" disabled=""> Green
                                    </label>
                                </div>
                                <div class="form-check form-check-inline">
                                    <label class="form-check-label">
                                        <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio2" value="option4"> Yellow
                                    </label>
                                </div>
                                <div class="form-check form-check-inline">
                                    <label class="form-check-label">
                                        <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio2" value="option5"> Black
                                    </label>
                                </div>
                                <div class="form-check form-check-inline">
                                    <label class="form-check-label">
                                        <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio2" value="option6"> Orange
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6 pb-3">
                            <label for="exampleMessage">Message</label>
                            <textarea class="form-control" id="exampleMessage"></textarea>
                            <small class="text-info">
                                Add the packaging note here.
                            </small>
                        </div>
                        <div class="col-12">
                            <div class="form-row">
                                <label class="col-md col-form-label"  for="name">Generated Id</label>
                                <input type="text" class="form-control col-md-4" name="gid" id="gid" />
                                <label class="col-md col-form-label"  for="name">Date Assigned</label>
                                <input type="text" class="form-control col-md-4" name="da" id="da" />
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

            $(javatmp.settings.defaultOutputSelector).on(javatmp.settings.javaTmpAjaxContainerReady, function (event) {
                // fire AFTER all transition done and your ajax content is shown to user.
            });

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
        });
    </script>
</div>