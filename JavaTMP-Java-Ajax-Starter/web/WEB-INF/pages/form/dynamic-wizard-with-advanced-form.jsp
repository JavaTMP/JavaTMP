<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="dynamic-ajax-content">
    <form id="dynamic-advanced-form-plugins-id" enctype="multipart/form-data" autocomplete="off" class="form" action="${pageContext.request.contextPath}/user/CreateUserController" method="post" novalidate="novalidate">
        <div class="row dynamic-form-wizard">
            <div class="col-lg-3">
                <div class="nav flex-column nav-pills" id="v-pills-tab" role="tablist" aria-orientation="vertical">
                    <a class="disabled nav-item nav-link" id="step1-" data-toggle="pill" href="#v-pills-home" role="tab" aria-controls="v-pills-home" aria-selected="true">1. Personal Informaiton</a>
                    <a class="disabled nav-item nav-link" id="step2-" data-toggle="pill" href="#v-pills-profile" role="tab" aria-controls="v-pills-profile" aria-selected="false">2. Address Information</a>
                    <a class="disabled nav-item nav-link" id="step3-" data-toggle="pill" href="#v-pills-messages" role="tab" aria-controls="v-pills-messages" aria-selected="false">3. Profile Informaiton</a>
                    <a class="disabled nav-item nav-link" id="step4-" data-toggle="pill" href="#v-pills-settings" role="tab" aria-controls="v-pills-settings" aria-selected="false">4. Send And Create New User</a>
                </div>
            </div>
            <div class="col-lg-9">

                <div class="tab-content" id="v-pills-tabContent">
                    <div class="tab-pane fade" id="v-pills-home" role="tabpanel" aria-labelledby="step1-">
                        <div class="form-group form-row">
                            <label for="fname" class="col-form-label col-md-2">
                                Full Name
                            </label>
                            <div class="col-md-10">
                                <input class="form-control" type="text" placeholder="Full Name" name="fullName">
                            </div>
                        </div>
                        <div class="form-group form-row">
                            <label for="lname" class="col-form-label col-md-2">
                                Email
                            </label>
                            <div class="col-md-10">
                                <input class="form-control" type="text" placeholder="Email" name="email">
                            </div>
                        </div>
                        <div class="form-group form-row">
                            <label for="lname" class="col-form-label col-md-2">
                                Birth Of Date
                            </label>
                            <div class="col-md-10">
                                <input class="form-control" type="text" name="birthOfDate">
                            </div>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="v-pills-profile" role="tabpanel" aria-labelledby="step2-">
                        <div class="form-group form-row">
                            <label for="lname" class="col-form-label col-md-2">
                                Country
                            </label>
                            <div class="col-md-10">
                                <select name="countryId" class="form-control">
                                    <option value="">Choose ...</option>
                                    <option value="AF">Afghanistan</option>
                                    <option value="AL">Albania</option>
                                    <option value="DZ">Algeria</option>
                                    <option value="AS">American Samoa</option>
                                    <option value="AD">Andorra</option>
                                    <option value="AO">Angola</option>
                                    <option value="AI">Anguilla</option>
                                    <option value="AR">Argentina</option>
                                    <option value="AM">Armenia</option>
                                    <option value="AW">Aruba</option>
                                    <option value="AU">Australia</option>
                                    <option value="AT">Austria</option>
                                    <option value="AZ">Azerbaijan</option>
                                    <option value="BS">Bahamas</option>
                                    <option value="BH">Bahrain</option>
                                    <option value="BD">Bangladesh</option>
                                    <option value="BB">Barbados</option>
                                    <option value="BY">Belarus</option>
                                    <option value="BE">Belgium</option>
                                    <option value="BZ">Belize</option>
                                    <option value="BJ">Benin</option>
                                    <option value="BM">Bermuda</option>
                                    <option value="BT">Bhutan</option>
                                    <option value="BO">Bolivia</option>
                                    <option value="BA">Bosnia and Herzegowina</option>
                                    <option value="BW">Botswana</option>
                                    <option value="BV">Bouvet Island</option>
                                    <option value="BR">Brazil</option>
                                    <option value="IO">British Indian Ocean Territory</option>
                                    <option value="BN">Brunei Darussalam</option>
                                    <option value="BG">Bulgaria</option>
                                    <option value="BF">Burkina Faso</option>
                                    <option value="BI">Burundi</option>
                                    <option value="KH">Cambodia</option>
                                    <option value="CM">Cameroon</option>
                                    <option value="CA">Canada</option>
                                    <option value="CV">Cape Verde</option>
                                    <option value="KY">Cayman Islands</option>
                                    <option value="CF">Central African Republic</option>
                                    <option value="TD">Chad</option>
                                    <option value="CL">Chile</option>
                                    <option value="CN">China</option>
                                    <option value="CX">Christmas Island</option>
                                    <option value="CC">Cocos (Keeling) Islands</option>
                                    <option value="CO">Colombia</option>
                                    <option value="KM">Comoros</option>
                                    <option value="CG">Congo</option>
                                    <option value="CD">Congo, the Democratic Republic of the</option>
                                    <option value="CK">Cook Islands</option>
                                    <option value="CR">Costa Rica</option>
                                    <option value="CI">Cote d'Ivoire</option>
                                    <option value="HR">Croatia (Hrvatska)</option>
                                    <option value="CU">Cuba</option>
                                    <option value="CY">Cyprus</option>
                                    <option value="CZ">Czech Republic</option>
                                    <option value="DK">Denmark</option>
                                    <option value="DJ">Djibouti</option>
                                    <option value="DM">Dominica</option>
                                    <option value="DO">Dominican Republic</option>
                                    <option value="EC">Ecuador</option>
                                    <option value="EG">Egypt</option>
                                    <option value="SV">El Salvador</option>
                                    <option value="GQ">Equatorial Guinea</option>
                                    <option value="ER">Eritrea</option>
                                    <option value="EE">Estonia</option>
                                    <option value="ET">Ethiopia</option>
                                    <option value="FK">Falkland Islands (Malvinas)</option>
                                    <option value="FO">Faroe Islands</option>
                                    <option value="FJ">Fiji</option>
                                    <option value="FI">Finland</option>
                                    <option value="FR">France</option>
                                    <option value="GF">French Guiana</option>
                                    <option value="PF">French Polynesia</option>
                                    <option value="TF">French Southern Territories</option>
                                    <option value="GA">Gabon</option>
                                    <option value="GM">Gambia</option>
                                    <option value="GE">Georgia</option>
                                    <option value="DE">Germany</option>
                                    <option value="GH">Ghana</option>
                                    <option value="GI">Gibraltar</option>
                                    <option value="GR">Greece</option>
                                    <option value="GL">Greenland</option>
                                    <option value="GD">Grenada</option>
                                    <option value="GP">Guadeloupe</option>
                                    <option value="GU">Guam</option>
                                    <option value="GT">Guatemala</option>
                                    <option value="GN">Guinea</option>
                                    <option value="GW">Guinea-Bissau</option>
                                    <option value="GY">Guyana</option>
                                    <option value="HT">Haiti</option>
                                    <option value="HM">Heard and Mc Donald Islands</option>
                                    <option value="VA">Holy See (Vatican City State)</option>
                                    <option value="HN">Honduras</option>
                                    <option value="HK">Hong Kong</option>
                                    <option value="HU">Hungary</option>
                                    <option value="IS">Iceland</option>
                                    <option value="IN">India</option>
                                    <option value="ID">Indonesia</option>
                                    <option value="IR">Iran (Islamic Republic of)</option>
                                    <option value="IQ">Iraq</option>
                                    <option value="IE">Ireland</option>
                                    <option value="IL">Israel</option>
                                    <option value="IT">Italy</option>
                                    <option value="JM">Jamaica</option>
                                    <option value="JP">Japan</option>
                                    <option value="JO">Jordan</option>
                                    <option value="KZ">Kazakhstan</option>
                                    <option value="KE">Kenya</option>
                                    <option value="KI">Kiribati</option>
                                    <option value="KP">Korea, Democratic People's Republic of</option>
                                    <option value="KR">Korea, Republic of</option>
                                    <option value="KW">Kuwait</option>
                                    <option value="KG">Kyrgyzstan</option>
                                    <option value="LA">Lao People's Democratic Republic</option>
                                    <option value="LV">Latvia</option>
                                    <option value="LB">Lebanon</option>
                                    <option value="LS">Lesotho</option>
                                    <option value="LR">Liberia</option>
                                    <option value="LY">Libyan Arab Jamahiriya</option>
                                    <option value="LI">Liechtenstein</option>
                                    <option value="LT">Lithuania</option>
                                    <option value="LU">Luxembourg</option>
                                    <option value="MO">Macau</option>
                                    <option value="MK">Macedonia, The Former Yugoslav Republic of</option>
                                    <option value="MG">Madagascar</option>
                                    <option value="MW">Malawi</option>
                                    <option value="MY">Malaysia</option>
                                    <option value="MV">Maldives</option>
                                    <option value="ML">Mali</option>
                                    <option value="MT">Malta</option>
                                    <option value="MH">Marshall Islands</option>
                                    <option value="MQ">Martinique</option>
                                    <option value="MR">Mauritania</option>
                                    <option value="MU">Mauritius</option>
                                    <option value="YT">Mayotte</option>
                                    <option value="MX">Mexico</option>
                                    <option value="FM">Micronesia, Federated States of</option>
                                    <option value="MD">Moldova, Republic of</option>
                                    <option value="MC">Monaco</option>
                                    <option value="MN">Mongolia</option>
                                    <option value="MS">Montserrat</option>
                                    <option value="MA">Morocco</option>
                                    <option value="MZ">Mozambique</option>
                                    <option value="MM">Myanmar</option>
                                    <option value="NA">Namibia</option>
                                    <option value="NR">Nauru</option>
                                    <option value="NP">Nepal</option>
                                    <option value="NL">Netherlands</option>
                                    <option value="AN">Netherlands Antilles</option>
                                    <option value="NC">New Caledonia</option>
                                    <option value="NZ">New Zealand</option>
                                    <option value="NI">Nicaragua</option>
                                    <option value="NE">Niger</option>
                                    <option value="NG">Nigeria</option>
                                    <option value="NU">Niue</option>
                                    <option value="NF">Norfolk Island</option>
                                    <option value="MP">Northern Mariana Islands</option>
                                    <option value="NO">Norway</option>
                                    <option value="OM">Oman</option>
                                    <option value="PK">Pakistan</option>
                                    <option value="PW">Palau</option>
                                    <option value="PA">Panama</option>
                                    <option value="PG">Papua New Guinea</option>
                                    <option value="PY">Paraguay</option>
                                    <option value="PE">Peru</option>
                                    <option value="PH">Philippines</option>
                                    <option value="PN">Pitcairn</option>
                                    <option value="PL">Poland</option>
                                    <option value="PT">Portugal</option>
                                    <option value="PR">Puerto Rico</option>
                                    <option value="QA">Qatar</option>
                                    <option value="RE">Reunion</option>
                                    <option value="RO">Romania</option>
                                    <option value="RU">Russian Federation</option>
                                    <option value="RW">Rwanda</option>
                                    <option value="KN">Saint Kitts and Nevis</option>
                                    <option value="LC">Saint LUCIA</option>
                                    <option value="VC">Saint Vincent and the Grenadines</option>
                                    <option value="WS">Samoa</option>
                                    <option value="SM">San Marino</option>
                                    <option value="ST">Sao Tome and Principe</option>
                                    <option value="SA">Saudi Arabia</option>
                                    <option value="SN">Senegal</option>
                                    <option value="SC">Seychelles</option>
                                    <option value="SL">Sierra Leone</option>
                                    <option value="SG">Singapore</option>
                                    <option value="SK">Slovakia (Slovak Republic)</option>
                                    <option value="SI">Slovenia</option>
                                    <option value="SB">Solomon Islands</option>
                                    <option value="SO">Somalia</option>
                                    <option value="ZA">South Africa</option>
                                    <option value="GS">South Georgia and the South Sandwich Islands</option>
                                    <option value="ES">Spain</option>
                                    <option value="LK">Sri Lanka</option>
                                    <option value="SH">St. Helena</option>
                                    <option value="PM">St. Pierre and Miquelon</option>
                                    <option value="SD">Sudan</option>
                                    <option value="SR">Suriname</option>
                                    <option value="SJ">Svalbard and Jan Mayen Islands</option>
                                    <option value="SZ">Swaziland</option>
                                    <option value="SE">Sweden</option>
                                    <option value="CH">Switzerland</option>
                                    <option value="SY">Syrian Arab Republic</option>
                                    <option value="TW">Taiwan, Province of China</option>
                                    <option value="TJ">Tajikistan</option>
                                    <option value="TZ">Tanzania, United Republic of</option>
                                    <option value="TH">Thailand</option>
                                    <option value="TG">Togo</option>
                                    <option value="TK">Tokelau</option>
                                    <option value="TO">Tonga</option>
                                    <option value="TT">Trinidad and Tobago</option>
                                    <option value="TN">Tunisia</option>
                                    <option value="TR">Turkey</option>
                                    <option value="TM">Turkmenistan</option>
                                    <option value="TC">Turks and Caicos Islands</option>
                                    <option value="TV">Tuvalu</option>
                                    <option value="UG">Uganda</option>
                                    <option value="UA">Ukraine</option>
                                    <option value="AE">United Arab Emirates</option>
                                    <option value="GB">United Kingdom</option>
                                    <option value="US">United States</option>
                                    <option value="UM">United States Minor Outlying Islands</option>
                                    <option value="UY">Uruguay</option>
                                    <option value="UZ">Uzbekistan</option>
                                    <option value="VU">Vanuatu</option>
                                    <option value="VE">Venezuela</option>
                                    <option value="VN">Viet Nam</option>
                                    <option value="VG">Virgin Islands (British)</option>
                                    <option value="VI">Virgin Islands (U.S.)</option>
                                    <option value="WF">Wallis and Futuna Islands</option>
                                    <option value="EH">Western Sahara</option>
                                    <option value="YE">Yemen</option>
                                    <option value="ZM">Zambia</option>
                                    <option value="ZW">Zimbabwe</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group form-row">
                            <label for="username" class="col-form-label col-md-2">
                                Address
                            </label>
                            <div class="col-md-10">
                                <textarea rows="5" class="form-control" placeholder="" name="address"></textarea>
                            </div>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="v-pills-messages" role="tabpanel" aria-labelledby="step3-">
                        <div class="form-row">
                            <div class="col-md-6">
                                <div class="form-group form-row">
                                    <label for="password" class="col-form-label col-md-4">
                                        Username
                                    </label>
                                    <div class="col-md-8">
                                        <input class="form-control" type="text" autocomplete="off" placeholder="Username" name="userName">
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group form-row">
                                    <label for="repeatPassword" class="col-form-label col-md-4">
                                        Profile Picture
                                    </label>
                                    <div class="col-md-8">
                                        <div class="custom-file">
                                            <input name="profilePicture" type="file" class="custom-file-input" id="validatedCustomFile">
                                            <label class="custom-file-label" for="validatedCustomFile">Choose ...</label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="col-md-6">
                                <div class="form-group form-row">
                                    <label class="control-label col-md-4">Password</label>
                                    <div class="col-md-8">
                                        <input class="form-control" type="password" autocomplete="off" id="password"
                                               placeholder="Password" name="password"/>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group form-row">
                                    <label class="control-label col-md-4">Re-type Your Password</label>
                                    <div class="col-md-8">
                                        <input class="form-control" type="password" autocomplete="off" placeholder="Re-type Your Password"
                                               name="rpassword"/>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group form-row">
                            <div class="custom-control custom-checkbox">
                                <input name="tnc" type="checkbox" class="custom-control-input" id="customCheck1">
                                <label class="custom-control-label" for="customCheck1">
                                    I agree to the
                                    <a href="javascript:;">Terms of Service </a> &amp;
                                    <a href="javascript:;">Privacy Policy </a>
                                </label>
                            </div>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="v-pills-settings" role="tabpanel" aria-labelledby="step4-">
                        <div class="alert alert-success text-center">
                            <span>Thank you, All information have been filled correctly, You can Submit the form Remotely now</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
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
//        console.log("currentParentModal.options.id");
//        var currentParentModal = BootstrapModalWrapperFactory.globalModals[BootstrapModalWrapperFactory.globalModals.length - 1];
//        console.log(currentParentModal.options.id);
        jQuery(function ($) {
            // here we can reference the container bootstrap modal by its id
            // passed as parameter to request by name "ajaxModalId"
            // or for demo purposese ONLY we can get a reference top modal
            // in current open managed instances in BootstrapModalWrapperFactory
            var validator = null;
            var currentParentModal = BootstrapModalWrapperFactory.globalModals[BootstrapModalWrapperFactory.globalModals.length - 1];
//            console.log(currentParentModal.options.id);
            $("#" + currentParentModal.options.id).on(javatmp.settings.javaTmpAjaxContainerReady, function (event, modal) {
                // fire AFTER all transition done and your ajax content is shown to user.

                modal.originalModal.removeAttr("tabindex");
                modal.updateTitle("Dynamic Wizard With Advanced Form");
                modal.updateClosable(true);
                modal.updateSize("modal-lg");

                var form = $("#dynamic-advanced-form-plugins-id");
                var wizardDiv = modal.originalModal.find(".dynamic-form-wizard");

                // activiate first tab
                var firstTab = $(".nav .nav-link:first", wizardDiv);
                var targetPanelId = $(firstTab).attr("href");
                $(firstTab).removeClass("disabled");
                $(targetPanelId).addClass("active show");
                console.log("id of target = " + $(targetPanelId).attr("id"));
                $(firstTab).tab('show');

                var closeButton = modal.addButton({
                    label: "Close",
                    cssClass: "btn btn-danger mr-auto",
                    action: function (modalWrapper, button, buttonData, originalEvent) {
                        return modalWrapper.hide();
                    }
                });
                var previousButton = modal.addButton({
                    label: "Previous",
                    cssClass: "btn btn-primary",
                    action: function (modalWrapper, button, buttonData, originalEvent) {
                        var currentActiveElement = $(".nav .nav-link.active.show", wizardDiv);
                        var previousElement = $(currentActiveElement).prev();
                        console.log("prev-button current[" + $(currentActiveElement).attr("id") + "], next [" + $(previousElement).attr("id") + "]");
                        if ($(previousElement).length > 0) {
                            $(previousElement).tab('show');
                        }
                    }
                });
                var nextButton = modal.addButton({
                    label: "Next",
                    cssClass: "btn btn-primary",
                    action: function (modalWrapper, button, buttonData, originalEvent) {
                        var currentActiveElement = $(".nav .nav-link.active.show", wizardDiv);
                        var nextActiveElement = $(currentActiveElement).next();
                        console.log("next-button current[" + $(currentActiveElement).attr("id") + "], next [" + $(nextActiveElement).attr("id") + "]");
                        if (!form.valid()) {
                            return false;
                        }
                        if ($(nextActiveElement).length > 0) {
                            $(nextActiveElement).removeClass("disabled");
                            $(nextActiveElement).tab('show');
                        }
                    }
                });
                var sendButton = modal.addButton({
                    label: "Send",
                    cssClass: "btn btn-success",
                    action: function (modalWrapper, button, buttonData, originalEvent) {
                        form.trigger("submit");
                    }
                });

                $(sendButton).hide();

                modal.originalModal.find(".modal-footer").addClass("justify-content-start");

                $('[data-toggle="pill"]').on('show.bs.tab', function (e) {
                    console.log("show.bs.tab = " + $(e.target).attr("id")); // newly activated tab
                    console.log("show.bs.tab = " + $(e.relatedTarget).attr("id")); // previous active tab
//                    e.preventDefault();
                });
                $('[data-toggle="pill"]').on('shown.bs.tab', function (e) {
                    console.log("shown.bs.tab = " + $(e.target).attr("id")); // newly activated tab
                    console.log("shown.bs.tab = " + $(e.relatedTarget).attr("id")); // previous active tab
                    var currentShownElement = $(e.target);
                    if ($(currentShownElement).prev().length > 0) {
                        $(previousButton).prop("disabled", false);
                        $(previousButton).removeClass("disabled");
                    } else {
                        $(previousButton).prop("disabled", true);
                        $(previousButton).addClass("disabled");
                    }
                    if ($(currentShownElement).next().length > 0) {
                        $(nextButton).prop("disabled", false);
                        $(nextButton).removeClass("disabled");
                        $(sendButton).prop("disabled", true);
                        $(sendButton).addClass("disabled");
                        $(nextButton).show(200);
                        $(sendButton).hide(200);
                    } else {
                        $(nextButton).prop("disabled", true);
                        $(nextButton).addClass("disabled");
                        $(sendButton).prop("disabled", false);
                        $(sendButton).removeClass("disabled");
                        $(nextButton).hide(200);
                        $(sendButton).show(200);
                    }
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
                    if (!form.valid()) {
                        return false;
                    }
                });

                form.ajaxForm({
                    clearForm: true, // clear all form fields after successful submit
                    resetForm: true, // reset the form after successful submit
                    beforeSerialize: function ($form, options) {
                        $("#summernote").summernote('triggerEvent', 'change');
                        if (!$form.valid()) {
                            return false;
                        }
                    },
                    beforeSubmit: function (formData, jqForm, options) {

                    },
                    success: function (response, statusText, xhr, $form) {
                        form.find("textarea[name='address']").summernote('code', '');
                        form.resetForm();
                        form.find(".form-group.has-success").removeClass(".has-success");
                    }
                });

                validator = form.validate($.extend(true, {}, javatmp.settings.jqueryValidationDefaultOptions, {
//                    ignore: ":hidden",
                    ignore: ":hidden:not(.forceValidate), [contenteditable='true']:not([name])",
                    rules: {
                        fullName: {
                            required: true},
                        email: {
                            required: true,
                            email: true,
                            minlength: 5,
                            maxlength: 50
                        },
                        birthOfDate: {
                            required: true,
                            validDate: true,
                            dateBeforeNow: true
                        },
                        countryId: {
                            required: true
                        },
                        address: {
                            required: true,
                            maxlength: 400
                        },
                        userName: {
                            required: true
                        },
                        password: {
                            required: true,
                            minlength: 6,
                            maxlength: 20
                        },
                        rpassword: {
                            required: true,
                            equalTo: "#password"
                        },
                        profilePicture: {
                            required: true
                        },
                        tnc: {
                            required: true
                        },
                        note: {
                            required: true,
                            summernoteRequired: true
                        }
                    },
                    messages: {
                        fullName: {
                            required: "Kindly provide us with your full name"
                        },
                        email: {
                            required: "Kindly provide your email address",
                            email: "Kindly provide a valid email address"
                        },
                        birthOfDate: {
                            required: "Kindly provide your Birth Of Date",
                            validDate: "Kindly Provide a valid date value in format DD/MM/YYYY",
                            dateBeforeNow: "Kindly Provide a date in the past before today at least"
                        },
                        countryId: {
                            required: "Kindly select your nationality"
                        },
                        address: {
                            required: "Kindly provide your address"
                        },
                        note: {
                            summernoteRequired: "Kindly Provide a note"
                        }
                    }
                }));

                form.find("input[name='birthOfDate']").inputmask({
                    alias: "date",
                    placeholder: "dd/mm/yyyy",
                    inputFormat: "dd/mm/yyyy",
                    displayFormat: true,
                    hourFormat: "24",
                    clearMaskOnLostFocus: false
                });
                form.find("input[name='birthOfDate']").daterangepicker({
                    "opens": javatmp.settings.floatReverse,
                    //                    startDate: false,
                    singleDatePicker: true,
                    showDropdowns: true,
                    timePicker: false,
                    timePickerIncrement: 1,
                    timePicker24Hour: true,
                    autoApply: true,
                    autoUpdateInput: false,
                    minDate: '01/01/1900',
                    maxDate: '31/12/2099',
                    //                    maxDate: '',
                    //                    minDate: moment(),
                    locale: {
                        "direction": javatmp.settings.direction,
                        format: 'DD/MM/YYYY'
                    }
                }, function (start, end, label) {
                    var formatedDateSelected = moment(start).format("DD/MM/YYYY");
                    form.find("input[name='birthOfDate']").val(formatedDateSelected);
                });
                var modalZIndex = modal.originalModal.css('zIndex');
                modalZIndex = modalZIndex + 1;

                form.find("textarea[name='address']").summernote({height: 250});

                $.fn.select2.defaults.set("theme", "bootstrap");
                $.fn.select2.defaults.set("dir", javatmp.settings.direction);

                var dynamicCountryDropdownClass = "selectCountryAdvWizard";

                form.find("select[name='countryId']").select2({
                    theme: "bootstrap",
                    dir: javatmp.settings.direction,
                    allowClear: true,
                    placeholder: "Select a country",
                    containerCssClass: ':all:',
                    width: '',
                    dropdownCssClass: dynamicCountryDropdownClass,
                    templateSelection: formatCountrySelection,
                    templateResult: formatCountry,
                    escapeMarkup: function (markup) {
                        return markup;
                    }
                }).on("select2:select select2:unselect select2:close", function () {
                    (this).focus();
                }).on("select2:open", function () {
                    // select2 postpone dropdown creation in ajax mode until first result come so,
                    // we should add z-index after select2 dropdown creation.
                    var modalZIndex = modal.originalModal.css('zIndex');
                    modalZIndex = modalZIndex + 1;
                    $("." + dynamicCountryDropdownClass, ".select2-container--bootstrap").css('z-index', modalZIndex);
                });

                $(".daterangepicker").css('z-index', modalZIndex);


                function formatCountry(repo) {
                    if (repo.loading)
                        return repo.text;
                    var imagePath = javatmp.settings.contextPath + "/assets/img/flags/" + repo.id.toLowerCase() + ".png";

                    var template =
                            '    <div class="media d-flex align-items-center">' +
                            '        <img class="mr-1" src="{{imagePath}}" alt="{{countryText}}"/>' +
                            '        <div class="media-body">' +
                            '            <strong>{{countryText}} ({{countryId}})</strong>' +
                            '        </div>' +
                            '    </div>';

                    var readyData = template.composeTemplate({
                        'imagePath': imagePath,
                        'countryText': repo.text,
                        'countryId': repo.id
                    });

                    return readyData;
                }
                function formatCountrySelection(repo) {
                    if (!repo.id) {
                        return repo.text;
                    }

                    var imagePath = javatmp.settings.contextPath + "/assets/img/flags/" + repo.id.toLowerCase() + ".png";

                    var template =
                            '    <div class="media d-flex align-items-center">' +
                            '        <img class="mr-1" src="{{imagePath}}" alt="{{countryText}}"/>' +
                            '        <div class="media-body">' +
                            '            <span>{{countryText}} ({{countryId}})</span>' +
                            '        </div>' +
                            '    </div>';

                    var readyData = template.composeTemplate({
                        'imagePath': imagePath,
                        'countryText': repo.text,
                        'countryId': repo.id
                    });

                    return readyData;
                }


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