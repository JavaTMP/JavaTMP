<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<div class="dynamic-ajax-content px-1">
    <div class="user-list-btn-toolbar my-3" role="toolbar" aria-label="Toolbar with button groups">
        <button type="button" class="btn btn-primary"
                action-name="Add-New-User-Action"
                actionType="action-ref-href"
                action-ref-by-href="${pageContext.request.contextPath}/pages/user/addNewUser">
            <i class="fa fa-fw fa-user"></i>
            ${labels['page.btn.addNewUserPage']}
        </button>
        <button action-name="Add-New-User-Popup-Action" id="UserList-AddNewUserPopupId" type="button" class="btn btn-primary">
            <i class="fa fa-external-link-alt fa-fw"></i>
            ${labels['page.btn.addNewUserPopup']}
        </button>
        <button
            id="UserList-AddNewUserByWizardPopupId"
            action-name="Add-New-User-By-Wizard-Popup-Action"
            type="button"
            class="btn btn-primary">
            Add User By Wizard Popup
        </button>
        <button action-name="Update-Complete-User-Action" id="UserList-UpdateSelectedUserId" type="button" class="btn btn-primary">
            <i class="fa fa-user-edit fa-fw"></i>
            ${labels['page.btn.updateCompleteUser']}
        </button>
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
    <table cellspacing="0" class="table-bordered-primary table table-condensed table-bordered table-hover display nowrap" id="UsersListTableId" style="width:100%">
    </table>
    <div id="contextMenu" class="dropdown-menu" role="menu" style="display:none;position: fixed;" >
        <a tabindex="-1" class="dropdown-item" href="javascript:;" actionType="action-ref" action-ref-by-name="Add-New-User-Action">
            <i class="fa fa-fw fa-user text-primary"></i>
            ${labels['domain.user.CreateNewUser']}
        </a>
        <a tabindex="-1" class="dropdown-item" href="javascript:;" actionType="action-ref" action-ref-by-name="Add-New-User-Popup-Action">
            <i class="fa fa-external-link-alt fa-fw text-primary"></i>
            ${labels['page.btn.addNewUserPopup']}
        </a>
        <a tabindex="-1" class="dropdown-item" href="javascript:;" actionType="action-ref" action-ref-by-name="Update-Complete-User-Action">
            <i class="fa fa-user-edit fa-fw text-primary"></i>
            ${labels['page.btn.updateCompleteUser']}
        </a>
        <a tabindex="-1" class="dropdown-item" href="javascript:;" actionType="action-ref" action-ref-by-name="Activate-User-Action">
            <i class="fa fa-user-check fa-fw text-success"></i>
            ${labels['page.btn.activateUser']}
        </a>
        <a tabindex="-1" class="dropdown-item" href="javascript:;" actionType="action-ref" action-ref-by-name="Deactivate-User-Action">
            <i class="fa fa-user-slash fa-fw text-warning"></i>
            ${labels['page.btn.deactivateUser']}
        </a>
        <div class="dropdown-divider"></div>
        <a tabindex="-1" class="dropdown-item" href="javascript:;" actionType="action-ref" action-ref-by-name="Delete-User-Action">
            <i class="fa fa-user-times fa-fw text-danger"></i>
            ${labels['page.btn.deleteUser']}
        </a>
    </div>
    <style type="text/css">
        table.dataTable tbody tr {
            cursor: pointer;
        }
    </style>
    <script type="text/javascript">
        jQuery(function ($) {
            // any code put here will be run after content attach to ajax output container and before
            // controll return to main javascript file.

            // build lookup map for countries:
            var addNewUserPopupButton = $("#UserList-AddNewUserPopupId");
            var addNewUserByWizardPopupButton = $("#UserList-AddNewUserByWizardPopupId");
            var updateUserButton = $("#UserList-UpdateSelectedUserId");
            var deleteUserButton = $("#UserList-DeleteSelectedUserId");
            var activateUserButton = $("#UserList-ActivateSelectedUserId");
            var deActivateUserButton = $("#UserList-DeactivateSelectedUserId");
            var userTableElement = $('#UsersListTableId');
//            updateUserButton.addClass("disabled");
            function disabled() {
                updateUserButton.prop("disabled", true);
                deleteUserButton.prop("disabled", true);
                activateUserButton.prop("disabled", true);
                deActivateUserButton.prop("disabled", true);
            }
            function enabled(record) {
                updateUserButton.prop("disabled", false);
                deleteUserButton.prop("disabled", false);
                if (record.status !== 1) {
                    activateUserButton.prop("disabled", false);
                }
                if (record.status !== 0) {
                    deActivateUserButton.prop("disabled", false);
                }
            }

            var table = javatmp.plugins.DataTableAjaxWrapper(userTableElement, {
//                responsive: true,
                "ajax": {
                    "url": javatmp.settings.contextPath + "/user/ListUsersController"
                },
                "drawCallback": function (settings) {
                    disabled();
                },
                initComplete: function (settings, json) {
                    var colHeader = this.api().columns(0).header();
                    console.log(colHeader);
                    var headerTag = $(colHeader).parents("thead");
                    $(headerTag).addClass("thead-primary");
                    console.log(headerTag);
                },
                columns: [
                    {title: '${labels['domain.user.id']}', data: 'id', name: "id"},
                    {title: '${labels['domain.user.userName']}', data: 'userName', name: "userName"},
                    {title: '${labels['domain.user.firstName']}', data: 'firstName', name: "firstName"},
                    {title: '${labels['domain.user.lastName']}', data: 'lastName', name: "lastName"},
                    {title: '${labels['domain.user.birthDate']}', data: 'birthDate', "type": "date", name: "birthDate", className: ""},
                    {title: '${labels['domain.user.email']}', data: 'email', name: "email"},
                    {title: '${labels['domain.user.status']}', data: 'status', name: "status"},
                    {title: '${labels['domain.user.country']}', data: 'countryId', name: "countryId"},
                    {title: '${labels['domain.user.lang']}', data: 'lang', name: "lang"},
                    {title: '${labels['domain.user.theme']}', data: 'theme', name: "theme"},
                    {title: '${labels['domain.user.timezone']}', data: 'timezone', name: "timezone"},
                    {title: '${labels['domain.user.creationDate']}', data: 'creationDate', "type": "date", name: "creationDate"}
                ]
            });

            window.javatmp.plugins.contextMenuWrapper($('tbody', userTableElement), 'tr', $("#contextMenu"));

            table.on('select', function (e, dt, type, indexes) {
                var rowsData = table.rows(indexes).data().toArray();
                var rowData = rowsData[0];
                enabled(rowData);
            }).on('deselect', function (e, dt, type, indexes) {
                var rowsData = table.rows(indexes).data().toArray();
                var rowData = rowsData[0];
                disabled();
            });
            addNewUserPopupButton.on("click", function (event) {
                BootstrapModalWrapperFactory.createAjaxModal({
                    message: '<div class="text-center"><i class="fa fa-sync fa-spin fa-3x fa-fw text-primary"></i></div>',
                    title: "${labels['global.loadingText']}",
                    updateSizeAfterDataFetchTo: "modal-lg", // default is  or null for standard or "modal-sm"
                    size: "modal-lg",
                    localData: {
                        callback: actionCallback
                    },
                    ajax: {
                        url: javatmp.settings.contextPath + "/pages/user/addNewUserPopup",
                        data: {}
                    },
                    ajaxContainerReadyEventName: javatmp.settings.javaTmpAjaxContainerReady
                });
            });
            addNewUserByWizardPopupButton.on("click", function (event) {
                BootstrapModalWrapperFactory.createAjaxModal({
                    message: '<div class="text-center"><i class="fa fa-sync fa-spin fa-3x fa-fw text-primary"></i></div>',
                    title: "${labels['global.loadingText']}",
                    updateSizeAfterDataFetchTo: "modal-lg", // default is  or null for standard or "modal-sm"
                    size: "modal-lg",
                    localData: {
                        callback: actionCallback
                    },
                    ajax: {
                        url: javatmp.settings.contextPath + "/pages/user/addUserByWizardPopup",
                        data: {}
                    },
                    ajaxContainerReadyEventName: javatmp.settings.javaTmpAjaxContainerReady
                });
            });
            updateUserButton.on("click", function (event) {
                //                var selectedCount = table.rows({selected: true}).count();
                var selectedData = table.rows({selected: true}).data();
                if (selectedData.length > 0) {
                    var selectedRecord = selectedData[0];
                    BootstrapModalWrapperFactory.createAjaxModal({
                        message: '<div class="text-center"><i class="fa fa-sync fa-spin fa-3x fa-fw text-primary"></i></div>',
                        updateSizeAfterDataFetchTo: "modal-lg", // default is  or null for standard or "modal-sm"
                        size: "modal-lg",
                        localData: {
                            callback: actionCallback
                        },
                        ajax: {
                            url: javatmp.settings.contextPath + "/user/GetUpdateUserPopupController",
                            data: {
                                id: selectedRecord.id
                            }
                        },
                        ajaxContainerReadyEventName: javatmp.settings.javaTmpAjaxContainerReady
                    });
                } else {
                    BootstrapModalWrapperFactory.showMessage("Kindly Select a record from the table");
                }

            });
            deleteUserButton.on("click", function (event) {
                var selectedData = table.rows({selected: true}).data();
                if (selectedData.length > 0) {
                    var selectedRecord = selectedData[0];
                    window.javatmp.plugins.confirmAjaxAction(
                            javatmp.settings.labels["dialog.delete.title"],
                            javatmp.settings.labels["dialog.delete.message"],
                            javatmp.settings.labels["page.btn.deleteUser"],
                            javatmp.settings.labels["global.cancel"],
                            javatmp.settings.contextPath + "/user/DeleteUserController",
                            selectedRecord,
                            function (data) {
                                table.columns.adjust().draw();
                            }
                    );
                } else {
                    BootstrapModalWrapperFactory.showMessage("Kindly Select a record from the table");
                }
            });
            activateUserButton.on("click", function (event) {
                var selectedData = table.rows({selected: true}).data();
                if (selectedData.length > 0) {
                    var selectedRecord = selectedData[0];
                    window.javatmp.plugins.confirmAjaxAction(
                            javatmp.settings.labels["dialog.activate.title"],
                            javatmp.settings.labels["dialog.activate.message"],
                            javatmp.settings.labels["page.btn.activateUser"],
                            javatmp.settings.labels["global.cancel"],
                            javatmp.settings.contextPath + "/user/ActivateUserController",
                            selectedRecord,
                            function (data) {
                                table.columns.adjust().draw();
                            }
                    );
                } else {
                    BootstrapModalWrapperFactory.showMessage("Kindly Select a record from the table");
                }

            });
            deActivateUserButton.on("click", function (event) {
                var selectedData = table.rows({selected: true}).data();
                if (selectedData.length > 0) {
                    var selectedRecord = selectedData[0];
                    window.javatmp.plugins.confirmAjaxAction(
                            javatmp.settings.labels["dialog.inActivate.title"],
                            javatmp.settings.labels["dialog.inActivate.message"],
                            javatmp.settings.labels["page.btn.deactivateUser"],
                            javatmp.settings.labels["global.cancel"],
                            javatmp.settings.contextPath + "/user/DeactivateUserController",
                            selectedRecord,
                            function (data) {
                                table.columns.adjust().draw();
                            }
                    );
                } else {
                    BootstrapModalWrapperFactory.showMessage("Kindly Select a record from the table");
                }

            });

            var actionCallback = function (callbackData) {
                if (callbackData.cancel === true) {
                } else {
                    table.columns.adjust().draw();
                }
            };
            $(javatmp.settings.defaultOutputSelector).on(javatmp.settings.javaTmpAjaxContainerReady, function (event) {
                // fire AFTER all transition done and your ajax content is shown to user.
            });
            $(javatmp.settings.defaultOutputSelector).on(javatmp.settings.javaTmpContainerResizeEventName, function (event) {
                // fire when user resize browser window or sidebar hide / show
                table.columns.adjust().draw();
            });
            $(javatmp.settings.defaultOutputSelector).on(javatmp.settings.cardFullscreenCompress, function (event, card) {
                // when card compress by pressing the top right tool button
                table.columns.adjust().draw();
            });
            $(javatmp.settings.defaultOutputSelector).on(javatmp.settings.cardFullscreenExpand, function (event, card) {
                // when card Expand by pressing the top right tool button
                table.columns.adjust().draw();
            });
            /**
             * When another sidebar menu item pressed and before container replaced with new ajax content.
             * You can cancel, destroy, or remove any thing here before replace main output ajax container.
             * returning false will cancel the new request and do nothing.
             **/
            $(javatmp.settings.defaultOutputSelector).on(javatmp.settings.javaTmpContainerRemoveEventName, function (event) {
                $(javatmp.settings.defaultOutputSelector).off(javatmp.settings.cardFullscreenCompress);
                $(javatmp.settings.defaultOutputSelector).off(javatmp.settings.cardFullscreenExpand);
                // it is important to destroy table before leaving current ajax page
                // so the fixedHeader will not be kept on site pages.
                table.clear();
                table.destroy(true);
                return true;
            });
        }
        );
    </script>
</div>