<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="dynamic-ajax-content grid-gutter-padding">
    <div class="row">
        <div class="col">
            <div class="card my-3 bg-light shadow">
                <div class="card-header">
                    ${labels['sidebar.menuItem.users.searchForUser']}
                    <div class="options float-right">
                        <a href="#" class="collapse"><i class="fa fa-chevron-up"></i></a>
                        <a href="#" class="fullscreen"><i class=" fa fa-expand"></i></a>
                    </div>
                </div>
                <div class="card-body">
                    <div class="row">
                        <div class="col-lg-12">
                            <form autocomplete="off" id="SearchParametersFormId" class="form"
                                  action="${pageContext.request.contextPath}/user/ListUsersController" method="post" novalidate="novalidate">
                                <div class="form-row">
                                    <div class="col-sm-12">
                                        <div class="form-group form-row">
                                            <label class="control-label col-sm-1 col-form-label">${labels['domain.user']}</label>
                                            <div class="col-sm-10">
                                                <div class="form-inline">
                                                    <div class="input-group">
                                                        <input type="text" class="form-control fixed-sm-6 mr-1" name="id" placeholder="${labels['domain.user.id']}" value="">
                                                        <input type="text" class="form-control fixed-sm-12 mr-1" name="userName" placeholder="${labels['domain.user.userName']}" value="">
                                                        <div class="input-group-append">
                                                            <button class="btn btn-primary mr-1" type="submit">${labels['page.btn.search']}</button>
                                                            <button id="usersSearchLookupButton" class="btn btn-primary" type="button">${labels['page.btn.lookup']}</button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12">
                            <form enctype="multipart/form-data" autocomplete="off" id="SearchForUserProfileFormId" class="form"
                                  action="${pageContext.request.contextPath}/user/UpdateCompleteUserController" method="post" novalidate="novalidate">
                                <div class="form-row">
                                    <div class="col-lg-12">
                                        <div class="form-row">
                                            <div class="col-sm-2">
                                                <div class="form-group">
                                                    <label class="control-label">${labels['domain.user.status']}</label>
                                                    <select name="status" class="custom-select" data-rule-required="true">
                                                        <option value="1">Activated</option>
                                                        <option value="0">Deactivated</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-lg-2">
                                                <div class="form-group">
                                                    <label class="control-label">${labels['domain.user.firstName']}</label>
                                                    <input class="form-control" type="text" placeholder="${labels['domain.user.firstName']}"
                                                           name="firstName" value="" data-rule-required="true">
                                                </div>
                                            </div>
                                            <div class="col-lg-2">
                                                <div class="form-group">
                                                    <label class="control-label">${labels['domain.user.lastName']}</label>
                                                    <input class="form-control" type="text" placeholder="${labels['domain.user.lastName']}"
                                                           name="lastName" value="" data-rule-required="true">
                                                </div>
                                            </div>
                                            <div class="col-lg-3">
                                                <div class="form-group">
                                                    <label class="control-label">${labels['domain.user.birthDate']}</label>
                                                    <input dir="ltr" class="form-control"  type="text" name="birthDate" value=""
                                                           data-rule-required="true"
                                                           data-rule-validDate="true"
                                                           data-rule-dateBeforeNow="true">
                                                </div>
                                            </div>
                                            <div class="col-lg-3">
                                                <div class="form-group">
                                                    <label class="control-label">${labels['domain.user.email']}</label>
                                                    <input class="form-control" type="text" placeholder="${labels['domain.user.email']}" name="email" value=""
                                                           data-rule-required="true"
                                                           data-rule-email="true"
                                                           data-rule-minlength="5"
                                                           data-rule-maxlength="50">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-row">
                                            <div class="col-lg-3">
                                                <div class="form-group">
                                                    <label class="control-label">${labels['domain.user.country']}</label>
                                                    <select name="countryId" class="form-control" data-rule-required="true">
                                                        <c:choose>
                                                            <c:when test="${fn:length(requestScope.countries) > 0}">
                                                                <option value="">${labels['page.text.kindlySelect']}</option>
                                                                <c:forEach items="${requestScope.countries}" var="country">
                                                                    <option value="${country.countrytranslationPK.countryId}">${country.countryName}</option>
                                                                </c:forEach>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <option value="">${labels['page.text.noRecordFound']}</option>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-lg-3">
                                                <div class="form-group">
                                                    <label class="control-label">${labels['domain.user.lang']}</label>
                                                    <select name="lang" class="form-control" data-rule-required="true">
                                                        <c:choose>
                                                            <c:when test="${fn:length(requestScope.languages) > 0}">
                                                                <option value="">${labels['page.text.kindlySelect']}</option>
                                                                <c:forEach items="${requestScope.languages}" var="language">
                                                                    <option value="${language.languagetranslationPK.languageId}">${language.languageName}</option>
                                                                </c:forEach>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <option value="">${labels['page.text.noRecordFound']}</option>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-lg-3">
                                                <div class="form-group">
                                                    <label class="control-label">${labels['domain.user.theme']}</label>
                                                    <select name="theme" class="form-control" data-rule-required="true">
                                                        <c:choose>
                                                            <c:when test="${fn:length(requestScope.themes) > 0}">
                                                                <option value="">${labels['page.text.kindlySelect']}</option>
                                                                <c:forEach items="${requestScope.themes}" var="theme">
                                                                    <option value="${theme.themetranslationPK.themeId}">${theme.themeName}</option>
                                                                </c:forEach>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <option value="">${labels['page.text.noRecordFound']}</option>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-lg-3">
                                                <div class="form-group">
                                                    <label class="control-label">${labels['domain.user.timezone']}</label>
                                                    <select name="timezone" class="form-control" data-rule-required="true">
                                                        <c:choose>
                                                            <c:when test="${fn:length(requestScope.timezones) > 0}">
                                                                <option value="">${labels['page.text.kindlySelect']}</option>
                                                                <c:forEach items="${requestScope.timezones}" var="timezone">
                                                                    <option value="${timezone.timezonetranslationPK.timezoneId}">${timezone.timezoneNameDescription}</option>
                                                                </c:forEach>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <option value="-1">${labels['page.text.noRecordFound']}</option>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-row">
                                            <div class="col-lg-3">
                                                <div class="form-group">
                                                    <label class="control-label">${labels['domain.user.userName']}</label>
                                                    <input class="form-control" type="text" autocomplete="off" placeholder="${labels['domain.user.userName']}"
                                                           name="userName" value=""
                                                           data-rule-required="true"
                                                           data-rule-minlength="6"
                                                           data-rule-maxlength="20">
                                                </div>
                                            </div>
                                            <div class="col-lg-3">
                                                <div class="form-group">
                                                    <label class="control-label">${labels['domain.user.currentPassword']}</label>
                                                    <input class="form-control" type="password" autocomplete="off"
                                                           placeholder="${labels['domain.user.currentPassword']}" name="oldPassword"
                                                           data-rule-required="true">
                                                </div>
                                            </div>
                                            <div class="col-lg-3">
                                                <div class="form-group">
                                                    <label class="control-label">${labels['domain.user.newPassword']}</label>
                                                    <input class="form-control" type="password" autocomplete="off"
                                                           placeholder="${labels['domain.user.newPassword']}" name="password"
                                                           data-rule-required="true">
                                                </div>
                                            </div>
                                            <div class="col-lg-3">
                                                <div class="form-group">
                                                    <label class="control-label">${labels['domain.user.reTypeNewPassword']}</label>
                                                    <input class="form-control" type="password" autocomplete="off" placeholder="${labels['domain.user.reTypeNewPassword']}"
                                                           name="rpassword"
                                                           data-rule-required="true"
                                                           data-rule-equalto="form input[name='password']">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-row">
                                            <div class="col-lg-12">
                                                <div class="form-group">
                                                    <label for="exampleFormControlFile1">${labels['domain.user.Document']}</label>
                                                    <div class="custom-file">
                                                        <input name="profilePicture" type="file" class="custom-file-input"
                                                               id="validatedCustomFile" data-rule-required="false">
                                                        <label class="custom-file-label" for="validatedCustomFile">${labels['domain.user.Document']}</label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-lg-6 text-center">
                                                <div style="width: 200px; height: 200px;display: inline-block;position: relative">
                                                    <div id="profilePicturePreviewContainerId" style="width: 200px; height: 200px;">
                                                        <img id="profilePicturePreview" src="${pageContext.request.contextPath}/assets/img/default-profile-pic.png" alt="Your Profile Image Preview" />
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-lg-6 text-center">
                                                <img id="profilePictureResizePreview" style="width: 200px; height: 200px;" src="${pageContext.request.contextPath}/assets/img/default-profile-pic.png" alt="Your Profile Image Preview" />
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
                                            <label class="control-label">${labels['domain.user.address']}</label>
                                            <textarea rows="7" class="form-control forceValidate" placeholder="" name="address"
                                                      data-rule-summernoteRequired="true"
                                                      data-rule-maxlength="400"></textarea>
                                        </div>
                                        <div class="form-group">
                                            <input id="UserList-UpdateSelectedUserId" type="submit" class="btn btn-primary" value="${labels['page.btn.updateCompleteUser']}"/>
                                            <button action-name="Delete-User-Action" id="UserList-DeleteSelectedUserId" type="button" class="btn btn-primary">
                                                <i class="fa fa-user-times fa-fw text-danger"></i>
                                                ${labels['page.btn.deleteUser']}
                                            </button>
                                            <button action-name="Activate-User-Action" id="UserList-ActivateSelectedUserId" type="button" class="btn btn-primary">
                                                <i class="fa fa-user-check fa-fw text-success"></i>
                                                ${labels['page.btn.activateUser']}
                                            </button>
                                            <button action-name="Deactivate-User-Action" id="UserList-DeactivateSelectedUserId" type="button" class="btn btn-primary">
                                                <i class="fa fa-user-slash fa-fw text-warning"></i>
                                                ${labels['page.btn.deactivateUser']}
                                            </button>
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
        .fixed-sm-6 {
            width: 6rem!important;
            flex: 0 0 6rem!important;
        }
        .fixed-sm-12 {
            width: 12rem!important;
            flex: 0 0 12rem!important;
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
        jQuery(function ($) {
            // any code put here will be run after content attach to ajax output container and before
            // controll return to main javascript file.
            // <--- HERE --->
            //

            var currentUser = {};
            var searchForm = $("#SearchParametersFormId");
            var searchFormValidator = null;
            var form = $('#SearchForUserProfileFormId');
            var validator = null;

            var updateUserButton = $("#UserList-UpdateSelectedUserId");
            var deleteUserButton = $("#UserList-DeleteSelectedUserId");
            var activateUserButton = $("#UserList-ActivateSelectedUserId");
            var deActivateUserButton = $("#UserList-DeactivateSelectedUserId");

            function disabled() {
                updateUserButton.prop("disabled", true);
                deleteUserButton.prop("disabled", true);
                activateUserButton.prop("disabled", true);
                deActivateUserButton.prop("disabled", true);
            }
            function enabled() {
                updateUserButton.prop("disabled", false);
                deleteUserButton.prop("disabled", false);
                activateUserButton.prop("disabled", false);
                deActivateUserButton.prop("disabled", false);
            }
            disabled();

            searchForm.on("submit", function (event) {
                event.preventDefault();

                if (!$(this).valid()) {
                    return false;
                }

                var httpType = $(this).attr("method");
                var post_url = $(this).attr("action"); //get form action url
                var form_data = $(this).serializeArray();
                var searchObject = {};
                // {"columns":[{"name":"id","search":{"value":"1"}}],"start":0,"length":1}
                searchObject["start"] = 0;
                searchObject["length"] = 1;
                searchObject["columns"] = [];
                for (var i = 0; i < form_data.length; i++) {
                    var item = form_data[i];
                    if (item.value !== "") {
                        var columnName = item.name;
                        var columnValue = item.value;
                        console.log("name [" + columnName + "], value [" + columnValue + "]");
                        searchObject["columns"].push({"name": columnName, "search": {"value": columnValue}});
                    }
                }

                console.log("final object : " + JSON.stringify(searchObject));
//                return false;
                $.ajax({
                    type: httpType,
                    url: post_url,
                    data: JSON.stringify(searchObject),
                    dataType: "json",
                    contentType: "application/json; charset=UTF-8",
                    success: function (response, textStatus, jqXHR) {
                        // now we populate $form by response.data json object:
                        if (response.recordsTotal > 0) {
                            var rowObject = response.data[0];
                            currentUser = rowObject;
                            window.javatmp.plugins.populateForm(form, rowObject);
                            form.find("textarea[name='address']").summernote('code', rowObject.address);
                            // first destory or remote bugy plugins on edge that fire the show of calendar dropdown
                            // when value change;
                            form.find("input[name='birthDate']").data('daterangepicker').remove();
                            form.find("input[name='birthDate']").val(moment(rowObject.birthDate, javatmp.settings.networkDateFormat).locale('en').format(javatmp.settings.dateFormat));
                            var birthDateDatePicker = javatmp.plugins.daterangepickerWrapperForDate(form.find("input[name='birthDate']"));
                            var image = form.find("img[id='profilePicturePreview']");
                            var resizeImage = form.find("img[id='profilePictureResizePreview']");
                            var avatarImageSrc = javatmp.settings.contextPath + "/assets/img/default-profile-pic.png";
                            if (rowObject.profilePicDocumentId) {
                                avatarImageSrc = javatmp.settings.contextPath
                                        + "/ViewUploadedFileController?documentId=" + rowObject.profilePicDocumentId
                                        + "&randomHash=" + rowObject.profilePicDocument.randomHash
                                        + "&viewType=inline";
                            }
                            image.attr('src', avatarImageSrc);
                            resizeImage.attr('src', avatarImageSrc);
                            enabled();
                        } else {
                            BootstrapModalWrapperFactory.createModal({
                                title: "Warning",
                                message: "No Records Found"
                            }).show();
                        }
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        var resultText = jqXHR.responseText;
                        var errorMsg = resultText;
                        var obj = JSON.parse(resultText);
                        errorMsg = obj.message;
                        BootstrapModalWrapperFactory.createModal({
                            title: jqXHR.statusText + " : " + jqXHR.status,
                            message: errorMsg
                        }).show();
                    }
                });
            });

            searchFormValidator = searchForm.validate();

            var usersSearchLookupButton = $("#usersSearchLookupButton");

            usersSearchLookupButton.on("click", function () {
                var passData = {};
                BootstrapModalWrapperFactory.createAjaxModal({
                    message: '<div class="text-center"><i class="fa fa-sync fa-spin fa-3x fa-fw text-primary"></i></div>',
                    size: "modal-lg",
                    localData: {
                        callback: function (callbackData) {
                            if ((callbackData.cancel !== true)) {
                                searchForm.find("input[name='id']").val(callbackData.userSelected.id);
                                searchForm.find("input[name='userName']").val(callbackData.userSelected.userName);
                                searchForm.trigger("submit");
                            }
                        }
                    },
                    ajax: {
                        url: javatmp.settings.contextPath + "/pages/user/usersLookupPopup",
                        data: {}
                    },
                    ajaxContainerReadyEventName: javatmp.settings.javaTmpAjaxContainerReady
                });
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
                    for (var i = 0; i < formData.length; i++) {
                        formData.push({"name": "id", "value": currentUser.id});
                        if (formData[i].name === "birthDate") {
                            var value = formData[i].value;
                            var newDate = moment(value, javatmp.settings.dateFormat).locale('en').format(javatmp.settings.networkDateFormat);
                            formData[i].value = newDate;
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
            // initialize jQuery Validation plugin using global data.
            validator = form.validate();
            var birthDateInputMask = javatmp.plugins.inputmaskWrapperForDate(form.find("input[name='birthDate']"));
            var birthDateDatePicker = javatmp.plugins.daterangepickerWrapperForDate(form.find("input[name='birthDate']"));
            var addressEditor = javatmp.plugins.summernoteWrapper(form.find("textarea[name='address']"));
            var langSelect = javatmp.plugins.select2Wrapper(form.find("select[name='lang']"));
            var timezoneSelect = javatmp.plugins.select2Wrapper(form.find("select[name='timezone']"));
            var themeSelect = javatmp.plugins.select2WrapperForTheme(form.find("select[name='theme']"));
            var countryIdSelect = javatmp.plugins.select2WrapperForCountry(form.find("select[name='countryId']"));
            var profilePicScrollbars = javatmp.plugins.mCustomScrollbarForProfilePicture(form.find("#profilePicturePreviewContainerId"));

            form.find("input[name='profilePicture'][type=file]").on("change", function () {
                if (this.files && this.files[0]) {
                    var reader = new FileReader();
                    reader.onload = function (e) {
                        var image = form.find("img[id='profilePicturePreview']");
                        var resizeImage = form.find("img[id='profilePictureResizePreview']");

                        image.one("load", function () {
                            //                            var currentImageHeight = this.height;
                            //                            if (currentImageHeight > 250) {
                            //                                $("#profilePicturePreviewContainerId").height(250);
                            //                            } else {
                            //                                $("#profilePicturePreviewContainerId").height(currentImageHeight);
                            //                            }
                            form.find("#profilePicturePreviewContainerId").mCustomScrollbar("update");
                        });
                        image.attr('src', e.target.result);
                        resizeImage.attr('src', e.target.result);
                    };
                    reader.readAsDataURL(this.files[0]);
                }
            });

            deleteUserButton.on("click", function (event) {
                if (currentUser && (currentUser.id !== 0)) {
                    window.javatmp.plugins.confirmAjaxAction(
                            javatmp.settings.labels["dialog.delete.title"],
                            javatmp.settings.labels["dialog.delete.message"],
                            javatmp.settings.labels["page.btn.deleteUser"],
                            javatmp.settings.labels["global.cancel"],
                            javatmp.settings.contextPath + "/user/DeleteUserController",
                            currentUser,
                            function (data) {
                                searchForm.triggerHandler("submit");
                            }
                    );
                } else {
                    BootstrapModalWrapperFactory.showMessage("Kindly Select a record from the table");
                }
            });
            activateUserButton.on("click", function (event) {
                if (currentUser && (currentUser.id !== 0)) {
                    window.javatmp.plugins.confirmAjaxAction(
                            javatmp.settings.labels["dialog.activate.title"],
                            javatmp.settings.labels["dialog.activate.message"],
                            javatmp.settings.labels["page.btn.activateUser"],
                            javatmp.settings.labels["global.cancel"],
                            javatmp.settings.contextPath + "/user/ActivateUserController",
                            currentUser,
                            function (data) {
                                searchForm.triggerHandler("submit");
                            }
                    );
                } else {
                    BootstrapModalWrapperFactory.showMessage("Kindly Select a record from the table");
                }
            });
            deActivateUserButton.on("click", function (event) {
                if (currentUser && (currentUser.id !== 0)) {
                    window.javatmp.plugins.confirmAjaxAction(
                            javatmp.settings.labels["dialog.inActivate.title"],
                            javatmp.settings.labels["dialog.inActivate.message"],
                            javatmp.settings.labels["page.btn.deactivateUser"],
                            javatmp.settings.labels["global.cancel"],
                            javatmp.settings.contextPath + "/user/DeactivateUserController",
                            currentUser,
                            function (data) {
                                searchForm.triggerHandler("submit");
                            }
                    );
                } else {
                    BootstrapModalWrapperFactory.showMessage("Kindly Select a record from the table");
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