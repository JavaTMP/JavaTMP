<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="dynamic-ajax-content">
    <div class="row">
        <div class="col">
            <div class="card my-3">
                <div class="card-header">
                    User Profile Settings
                    <div class="options float-right">
                        <a href="#" class="collapse"><i class="fa fa-chevron-up"></i></a>
                        <a href="#" class="fullscreen"><i class=" fa fa-expand"></i></a>
                    </div>
                </div>
                <div class="card-body">
                    <div class="row">
                        <div class="col-lg-12">
                            <form enctype="multipart/form-data" autocomplete="off" id="UpdateCurrentUserFormId" class="form"
                                  action="${pageContext.request.contextPath}/user/UpdateCompleteUserController" method="post" novalidate="novalidate">
                                <div class="form-row">
                                    <div class="col-sm-3">
                                        <div class="form-group form-row">
                                            <label class="control-label col-sm-3 col-form-label">User Id</label>
                                            <div class="col-sm-9">
                                                <input readonly="readonly" class="form-control-plaintext" type="text" name="id" value="${requestScope.user.id}">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-9">
                                        <div class="form-group form-row">
                                            <label class="control-label col-sm-3 col-form-label">User Status</label>
                                            <div class="col-sm-9">
                                                <select name="status" class="custom-select">
                                                    <option ${requestScope.user.status == 1 ? 'selected="selected"' : ''} value="1">Activated</option>
                                                    <option ${requestScope.user.status == 0 ? 'selected="selected"' : ''} value="0">Deactivated</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="col-lg-12">
                                        <div class="form-row">
                                            <div class="col-lg-3">
                                                <div class="form-group">
                                                    <label class="control-label">First Name</label>
                                                    <input class="form-control" type="text" placeholder="Full Name" name="firstName" value="${requestScope.user.firstName}">
                                                </div>
                                            </div>
                                            <div class="col-lg-3">
                                                <div class="form-group">
                                                    <label class="control-label">Last Name</label>
                                                    <input class="form-control" type="text" placeholder="Full Name" name="lastName" value="${requestScope.user.lastName}">
                                                </div>
                                            </div>
                                            <div class="col-lg-3">
                                                <div class="form-group">
                                                    <label class="control-label">Your date of birth</label>
                                                    <input dir="ltr" class="form-control"  type="text" name="birthOfDateStr" value="<fmt:formatDate pattern='dd/MM/yyyy' timeZone="${sessionScope.user.timezone}" value='${requestScope.user.birthDate}'/>">
                                                </div>
                                            </div>
                                            <div class="col-lg-3">
                                                <div class="form-group">
                                                    <label class="control-label">Email</label>
                                                    <input class="form-control" type="text" placeholder="Email" name="email" value="${requestScope.user.email}">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-row">
                                            <div class="col-lg-3">
                                                <div class="form-group">
                                                    <label class="control-label">Country</label>
                                                    <select name="countryId" class="form-control">
                                                        <c:choose>
                                                            <c:when test="${fn:length(requestScope.countries) > 0}">
                                                                <option value="">Choose ...</option>
                                                                <c:forEach items="${requestScope.countries}" var="country">
                                                                    <option ${requestScope.user.countryId == country.countryId ? 'selected="selected"' : ''} value="${country.countryId}">${country.countryName}</option>
                                                                </c:forEach>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <option value="">No Record Found</option>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-lg-3">
                                                <div class="form-group">
                                                    <label class="control-label">Interface Language</label>
                                                    <select name="lang" class="form-control">
                                                        <c:choose>
                                                            <c:when test="${fn:length(requestScope.languages) > 0}">
                                                                <option value="">Choose ...</option>
                                                                <c:forEach items="${requestScope.languages}" var="language">
                                                                    <option ${requestScope.user.lang == language.languageId ? 'selected="selected"' : ''} value="${language.languageId}">${language.languageName}</option>
                                                                </c:forEach>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <option value="">No Record Found</option>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-lg-3">
                                                <div class="form-group">
                                                    <label class="control-label">Interface Theme</label>
                                                    <select name="theme" class="form-control">
                                                        <c:choose>
                                                            <c:when test="${fn:length(requestScope.themes) > 0}">
                                                                <option value="">Choose ...</option>
                                                                <c:forEach items="${requestScope.themes}" var="theme">
                                                                    <option ${requestScope.user.theme == theme.themeId ? 'selected="selected"' : ''} value="${theme.themeId}">${theme.themeName}</option>
                                                                </c:forEach>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <option value="">No Record Found</option>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-lg-3">
                                                <div class="form-group">
                                                    <label class="control-label">Timezone</label>
                                                    <select name="timezone" class="form-control">
                                                        <option value="">Choose ...</option>
                                                        <c:choose>
                                                            <c:when test="${fn:length(requestScope.timezones) > 0}">
                                                                <option value="">Choose ...</option>
                                                                <c:forEach items="${requestScope.timezones}" var="timezone">
                                                                    <option ${requestScope.user.timezone == timezone.timezoneId ? 'selected="selected"' : ''}  value="${timezone.timezoneId}">${timezone.timezoneName}</option>
                                                                </c:forEach>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <option value="-1">No Record Found</option>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-row">
                                            <div class="col-lg-3">
                                                <div class="form-group">
                                                    <label class="control-label">Username</label>
                                                    <input class="form-control" type="text" autocomplete="off" placeholder="Username"
                                                           name="userName" value="${requestScope.user.userName}">
                                                </div>
                                            </div>
                                            <div class="col-lg-3">
                                                <div class="form-group">
                                                    <label class="control-label">Old Password</label>
                                                    <input class="form-control" type="password" autocomplete="off" id="oldPassword"
                                                           placeholder="Old Password" name="oldPassword">
                                                </div>
                                            </div>
                                            <div class="col-lg-3">
                                                <div class="form-group">
                                                    <label class="control-label">New Password</label>
                                                    <input class="form-control" type="password" autocomplete="off" id="password"
                                                           placeholder="New Password" name="password">
                                                </div>
                                            </div>
                                            <div class="col-lg-3">
                                                <div class="form-group">
                                                    <label class="control-label">Re-type Your New Password</label>
                                                    <input class="form-control" type="password" autocomplete="off" placeholder="Re-type Your New Password"
                                                           name="rpassword">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-row">
                                            <div class="col-lg-12">
                                                <div class="form-group">
                                                    <label for="exampleFormControlFile1">Add Profile Picture</label>
                                                    <div class="custom-file">
                                                        <input name="profilePicture" type="file" class="custom-file-input" id="validatedCustomFile">
                                                        <label class="custom-file-label" for="validatedCustomFile">Choose Profile Picture file...</label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-lg-3 text-center">
                                                <div style="width: 200px; height: 200px;display: inline-block;position: relative">
                                                    <div id="profilePicturePreviewContainerId" style="width: 200px; height: 200px;">
                                                        <img id="profilePicturePreview" src="${pageContext.request.contextPath}/ViewUploadedFileController?documentId=${requestScope.user.profilePicDocument.documentId}&amp;randomHash=${requestScope.user.profilePicDocument.randomHash}&amp;viewType=inline" alt="Your Profile Image Preview" />
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-lg-3 text-center">
                                                <img id="profilePictureResizePreview" style="width: 200px; height: 200px;" src="${pageContext.request.contextPath}/ViewUploadedFileController?documentId=${requestScope.user.profilePicDocument.documentId}&amp;randomHash=${requestScope.user.profilePicDocument.randomHash}&amp;viewType=inline" alt="Your Profile Image Preview" />
                                            </div>
                                            <div class="col-lg-3 text-center">
                                                <img id="profilePictureAvatarPreview" style="width: 40px; height: 40px;" src="${pageContext.request.contextPath}/ViewUploadedFileController?documentId=${requestScope.user.profilePicDocument.documentId}&amp;randomHash=${requestScope.user.profilePicDocument.randomHash}&amp;viewType=inline" alt="Your Profile Image Preview" />
                                            </div>
                                            <div class="col-lg-3 text-center">
                                                <img class="rounded-circle" id="profilePictureAvatarRoundedPreview" style="width: 40px; height: 40px;" src="${pageContext.request.contextPath}/ViewUploadedFileController?documentId=${requestScope.user.profilePicDocument.documentId}&amp;randomHash=${requestScope.user.profilePicDocument.randomHash}&amp;viewType=inline" alt="Your Profile Image Preview" />
                                            </div>
                                        </div>
                                        <div class="form-row">
                                            <div class="col-lg-12">
                                                <div class="form-group text-center">
                                                    <input name="profilePictureStr" type="text" readonly="" hidden="" value=""/>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label">address</label>
                                            <textarea rows="5" class="form-control forceValidate" placeholder="" name="address">${requestScope.user.address}</textarea>
                                        </div>
                                        <div class="form-group">
                                            <input type="submit" class="btn btn-primary" value="Update Your Profile"/>
                                        </div>
                                    </div>
                                </div>
                            </form>
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
            var form = $('#UpdateCurrentUserFormId');
            var validator = null;

            form.ajaxForm({
                clearForm: true, // clear all form fields after successful submit
//                resetForm: true, // reset the form after successful submit
                beforeSerialize: function ($form, options) {
                    $("#summernote").summernote('triggerEvent', 'change');
                    if (!$form.valid()) {
                        return false;
                    }
                },
                beforeSubmit: function (formData, jqForm, options) {
                    for (var i = 0; i < formData.length; i++) {
                        if (formData[i].name === "birthOfDateStr") {
                            var value = formData[i].value;
                            var newDate = moment(value, "DD/MM/YYYY").format("YYYY-MM-DDTHH:mm:ss.SSSZ");
                            formData.push({"name": "birthDate", "value": newDate});
                            break;
                        }
                    }

                },
                success: function (response, statusText, xhr, $form) {
                    BootstrapModalWrapperFactory.createModal({
                        title: "Response",
                        message: response.message
                    }).show();
                },
                error: function (xhr, status, error, $form) {
                    var resultText = xhr.responseText;
                    var errorMsg = resultText;
                    var obj = JSON.parse(resultText);
                    errorMsg = obj.message;
                    BootstrapModalWrapperFactory.createModal({
                        title: xhr.statusText + " : " + xhr.status,
                        message: errorMsg
                    }).show();
                }
            });
            // pre-submit callback
            validator = form.validate($.extend(true, {}, javatmp.settings.jqueryValidationDefaultOptions, {
                ignore1: ":hidden:not(.forceValidate)",
                ignore: ":hidden:not(.forceValidate), [contenteditable='true']:not([name])",
                rules: {
                    firstName: {
                        required: true
                    },
                    lastName: {
                        required: true
                    },
                    email: {
                        required: true,
                        email: true,
                        minlength: 5,
                        maxlength: 50
                    },
                    birthOfDateStr: {
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
                    oldPassword: {
                        required: true,
                        minlength: 5,
                        maxlength: 20
                    },
                    password: {
                        required: true,
                        minlength: 5,
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
                    },
                    lang: {
                        required: true
                    },
                    timezone: {
                        required: true
                    },
                    theme: {
                        required: true
                    },
                    status: {
                        required: true
                    }
                },
                messages: {
                    firstName: {
                        required: "Kindly provide us with your first name"
                    },
                    lastName: {
                        required: "Kindly provide us with your last name"
                    },
                    email: {
                        required: "Kindly provide your email address",
                        email: "Kindly provide a valid email address"
                    },
                    birthOfDateStr: {
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
//            form.find("input[name='birthOfDateStr']").css({
//                "text-align": javatmp.settings.floatDefault
//            });
            form.find("input[name='birthOfDateStr']").inputmask({
                alias: "datetime",
                placeholder: "dd/mm/yyyy",
                inputFormat: "dd/mm/yyyy",
                displayFormat: true,
                hourFormat: "24",
                clearMaskOnLostFocus: false
            });
            form.find("input[name='birthOfDateStr']").daterangepicker({
                "opens": javatmp.settings.floatReverse,
                startDate: moment().format("DD/MM/YYYY"),
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
                form.find("input[name='birthOfDateStr']").val(formatedDateSelected).trigger("change");
            });
            form.find("textarea[name='address']").summernote({
                direction: javatmp.settings.direction,
                lang: javatmp.user.lang === "ar" ? "ar-AR" : javatmp.user.lang,
                height: 100,
                dialogsInBody: true
            });
            $.fn.select2.defaults.set("theme", "bootstrap");
            $.fn.select2.defaults.set("dir", javatmp.settings.direction);

            form.find("select[name='lang']").select2({
                allowClear: true,
                placeholder: "Select a language",
                containerCssClass: ':all:',
                width: '',
                dropdownCssClass: "select2-lang-dropdown"
            });
            form.find("select[name='theme']").select2({
                allowClear: true,
                placeholder: "Select a theme",
                containerCssClass: ':all:',
                width: '',
                escapeMarkup: function (markup) {
                    return markup;
                },
                templateSelection: formatThemeSelection,
                templateResult: formatThemeResult,
                dropdownCssClass: "select2-theme-dropdown"
            });
            form.find("select[name='timezone']").select2({
                allowClear: true,
                placeholder: "Select a timezone",
                containerCssClass: ':all:',
                width: '',
                dropdownCssClass: "select2-timezone-dropdown"
            });
            form.find("select[name='countryId']").select2({
                theme: "bootstrap",
                dir: javatmp.settings.direction,
                allowClear: true,
                placeholder: "Select a country",
                containerCssClass: ':all:',
                width: '',
                templateSelection: formatCountrySelection,
                templateResult: formatCountry,
                escapeMarkup: function (markup) {
                    return markup;
                },
                dropdownCssClass: "select2-countryId-dropdown"
            }).on("select2:select", function () {
                (this).focus();
            });
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
            function formatThemeSelection(repo) {
                if (!repo.id) {
                    return repo.text;
                }

                var imagePath = javatmp.settings.contextPath + "/assets/img/themes/" + repo.text + ".png";
                var template =
                        '    <div class="media d-flex align-items-center">' +
                        '        <img style="height: 25px;" class="mr-1" src="{{imagePath}}" alt="{{themeName}}"/>' +
                        '        <div class="media-body">' +
                        '            <span>{{themeName}}</span>' +
                        '        </div>' +
                        '    </div>';
                var readyData = template.composeTemplate({
                    'imagePath': imagePath,
                    'themeName': repo.text
                });
                return readyData;
            }
            function formatThemeResult(repo) {
                if (!repo.id) {
                    return repo.text;
                }

                var imagePath = javatmp.settings.contextPath + "/assets/img/themes/" + repo.text + ".png";
                var template =
                        '    <div class="media d-flex align-items-center">' +
                        '        <img style="height: 75px;" class="mr-1" src="{{imagePath}}" alt="{{themeName}}"/>' +
                        '        <div class="media-body">' +
                        '            <span>{{themeName}}</span>' +
                        '        </div>' +
                        '    </div>';
                var readyData = template.composeTemplate({
                    'imagePath': imagePath,
                    'themeName': repo.text
                });
                return readyData;
            }
            $("#profilePicturePreviewContainerId").mCustomScrollbar({
                axis: "yx",
                theme: "javatmp",
                scrollInertia: 0,
                advanced: {
                    updateOnContentResize: true,
                    autoExpandHorizontalScroll: true,
                    updateOnImageLoad: true
                },
                mouseWheel: {
                    preventDefault: true,
                    scrollAmount: 85
                }
            });
            form.find("input[name='profilePicture'][type=file]").on("change", function () {
                if (this.files && this.files[0]) {
                    var reader = new FileReader();
                    reader.onload = function (e) {
                        var image = form.find("img[id='profilePicturePreview']");
                        var resizeImage = form.find("img[id='profilePictureResizePreview']");
                        var avatarImage = form.find("img[id='profilePictureAvatarPreview']");
                        var avatarRoundedImage = form.find("img[id='profilePictureAvatarRoundedPreview']");
                        image.one("load", function () {
//                            var currentImageHeight = this.height;
//                            if (currentImageHeight > 250) {
//                                $("#profilePicturePreviewContainerId").height(250);
//                            } else {
//                                $("#profilePicturePreviewContainerId").height(currentImageHeight);
//                            }
//                            $("#profilePicturePreviewContainerId").mCustomScrollbar("update");
                        });
                        image.attr('src', e.target.result);
                        resizeImage.attr('src', e.target.result);
                        avatarImage.attr('src', e.target.result);
                        avatarRoundedImage.attr('src', e.target.result);
                    };
                    reader.readAsDataURL(this.files[0]);
                }
            });


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