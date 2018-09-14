<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="dynamic-ajax-content pt-3">
    <div class="d-flex flex-row flex-wrap flex-sm-wrap flex-md-wrap flex-lg-nowrap flex-xl-nowrap justify-content-center align-content-center">
        <button type="button" class="px-2 javatmp-btn btn btn-success m-2"
                actionType="action-ref-href" action-ref-by-href="${pageContext.request.contextPath}/pages/themes/bootswatch" >
            <i class="fas fa-coffee"></i>
            Switching Themes
        </button>
        <button type="button" class="px-2 javatmp-btn btn btn-success m-2"
                actionType="action-ref" action-ref-by-name="login-page" >
            <i class="fas fa-coffee"></i>
            Login Page
        </button>
        <button type="button" class="px-2 logout-home-btn-id javatmp-btn btn btn-success m-2"
                actionType="action-ref-href" action-ref-by-href="${pageContext.request.contextPath}/logout" >
            <i class="fas fa-coffee"></i>
            Logout Page
        </button>
        <button type="button" class="px-2 javatmp-btn btn btn-success m-2"
                actionType="action-ref-href" action-ref-by-href="${pageContext.request.contextPath}/pages/custom-components/dynamic-cards-content" >
            <i class="fas fa-coffee"></i>
            Dynamic Card Contents
        </button>
        <button type="button" class="px-2 javatmp-btn btn btn-success m-2"
                actionType="action-ref-href" action-ref-by-href="${pageContext.request.contextPath}/pages/plugins/tree/fancytree/plain_fancytree" >
            <i class="fas fa-coffee"></i>
            Files Tree List
        </button>
        <button type="button" class="px-2 javatmp-btn btn btn-success m-2"
                actionType="action-ref-href" action-ref-by-href="${pageContext.request.contextPath}/pages/plugins/tree/fancytree/table_fancytree" >
            <i class="fas fa-coffee"></i>
            Files Table Tree List
        </button>
    </div>
    <div class="d-flex flex-row flex-wrap flex-sm-wrap flex-md-wrap flex-lg-nowrap flex-xl-nowrap justify-content-center align-content-center">
        <button type="button" class="javatmp-btn btn btn-success btn-block m-2"
                actionType="action-ref-href" action-ref-by-href="${pageContext.request.contextPath}/pages/plugins/tree/fancytree/chart-of-accounts" >
            <i class="fas fa-coffee"></i>
            Chart of accounts
        </button>
        <button type="button" class="javatmp-btn btn btn-success btn-block m-2"
                actionType="action-ref-href" action-ref-by-href="${pageContext.request.contextPath}/pages/plugins/calendar/jQuery-fullcalendar-diary-system" >
            <i class="fas fa-coffee"></i>
            Diary Web Calendar
        </button>
        <button type="button" class="javatmp-btn btn btn-success btn-block m-2"
                actionType="action-ref-href" action-ref-by-href="${pageContext.request.contextPath}/DynamicSelect2PageController" >
            <i class="fas fa-coffee"></i>
            Dynamic Select2 Plugin
        </button>
        <button type="button" class="javatmp-btn btn btn-success btn-block m-2"
                actionType="action-ref-href" action-ref-by-href="${pageContext.request.contextPath}/cms/ContentPageController" >
            <i class="fas fa-coffee"></i>
            Dynamic Summernote Plugin
        </button>
        <button type="button" class="javatmp-btn btn btn-success btn-block m-2"
                actionType="action-ref-href" action-ref-by-href="${pageContext.request.contextPath}/pages/gallery/file-controller-serve" >
            <i class="fas fa-coffee"></i>
            Dynamic Fetch Images
        </button>
        <button type="button" class="javatmp-btn btn btn-success btn-block m-2"
                actionType="action-ref-href" action-ref-by-href="${pageContext.request.contextPath}/pages/gallery/edit-image-locally" >
            <i class="fas fa-coffee"></i>
            Edit & Crop Image
        </button>
    </div>
    <div class="d-flex flex-row flex-wrap flex-sm-wrap flex-md-wrap flex-lg-nowrap flex-xl-nowrap justify-content-center align-content-center">
        <button type="button" class="javatmp-btn btn btn-success btn-block m-2"
                actionType="action-ref-href" action-ref-by-href="${pageContext.request.contextPath}/pages/plugins/dynamic-malihu-custom-scrollbar-plugin" >
            <i class="fas fa-coffee"></i>
            Dynamic malihu scroll bar
        </button>
        <button type="button" class="javatmp-btn btn btn-success btn-block m-2"
                actionType="action-ref-href" action-ref-by-href="${pageContext.request.contextPath}/pages/form/advance-form-plugins" >
            <i class="fas fa-coffee"></i>
            Advanced Form Plugin
        </button>
        <button type="button" class="javatmp-btn btn btn-success btn-block m-2"
                actionType="action-ref-href" action-ref-by-href="${pageContext.request.contextPath}/pages/form/dynamic-wizard-with-advanced-form-page" >
            <i class="fas fa-coffee"></i>
            Dynamic wizard
        </button>
        <button type="button" class="javatmp-btn btn btn-success btn-block m-2"
                actionType="action-ref-href" action-ref-by-href="${pageContext.request.contextPath}/pages/table/datatable/dynamic-datatables" >
            <i class="fas fa-coffee"></i>
            Dynamic Datatables content
        </button>
        <button type="button" class="javatmp-btn btn btn-success btn-block m-2"
                actionType="action-ref-href" action-ref-by-href="${pageContext.request.contextPath}/pages/table/datatable/dynamic-individual-column-searching-datatables" >
            <i class="fas fa-coffee"></i>
            Individual column search Datatables
        </button>
        <button type="button" class="javatmp-btn btn btn-success btn-block m-2"
                actionType="action-ref-href" action-ref-by-href="${pageContext.request.contextPath}/pages/chart/dynamic-echarts" >
            <i class="fas fa-coffee"></i>
            Dynamic Charts
        </button>
    </div>
    <div class="d-flex flex-row flex-wrap flex-sm-wrap flex-md-wrap flex-lg-nowrap flex-xl-nowrap justify-content-center align-content-center">
        <button type="button" class="javatmp-btn btn btn-success btn-block m-2"
                actionType="ajax-model"
                href="${pageContext.request.contextPath}/pages/custom-pages/inbox/ajax/ajax-compose-message" >
            <i class="fas fa-coffee"></i>
            Send New messages
        </button>
        <button type="button" class="javatmp-btn btn btn-success btn-block m-2"
                actionType="action-ref-href" action-ref-by-href="${pageContext.request.contextPath}/pages/gallery/file-uploader-manager" >
            <i class="fas fa-coffee"></i>
            File Manager
        </button>
        <button type="button" class="javatmp-btn btn btn-success btn-block m-2"
                actionType="action-ref" action-ref-by-name="404-error-page" >
            <i class="fas fa-coffee"></i>
            404 Page
        </button>
        <button type="button" class="javatmp-btn btn btn-success btn-block m-2"
                actionType="action-ref-href" action-ref-by-href="${pageContext.request.contextPath}/pages/custom-pages/dashboard/users-dashboard-1">
            <i class="fas fa-coffee"></i>
            Users Dashboard
        </button>
        <button type="button" class="javatmp-btn btn btn-success btn-block m-2"
                actionType="action-ref-href" action-ref-by-href="${pageContext.request.contextPath}/pages/table/dynamic-sortable-table">
            <i class="fas fa-coffee"></i>
            Row Sortable Table
        </button>
        <button type="button" class="javatmp-btn btn btn-success btn-block m-2"
                actionType="action-ref-href" action-ref-by-href="${pageContext.request.contextPath}/pages/plugins/cropper-image-cropping">
            <i class="fas fa-coffee"></i>
            Image Cropping Plugin
        </button>
    </div>
    <style type="text/css">
        .javatmp-btn {
            height: 6.5rem;
            white-space: normal;
            width: 11rem;
        }
        .javatmp-btn:hover {
            cursor: pointer;
        }
        .javatmp-btn > i {
            display: block;
            font-size: 1.25rem;
        }
    </style>
    <script type="text/javascript">
        jQuery(function ($) {
            // any code put here will be run after content attach to ajax output container and before
            // controll return to main javascript file.


            $(javatmp.settings.defaultOutputSelector).on(javatmp.settings.javaTmpAjaxContainerReady, function (event) {
                // fire AFTER all transition done and your ajax content is shown to user.
                $(".logout-home-btn-id").on("click", function () {
                    window.location.replace($(this).attr("action-ref-by-href"));
                });
            });

            $(javatmp.settings.defaultOutputSelector).on(javatmp.settings.javaTmpContainerResizeEventName, function (event) {
                // fire when user resize browser window or sidebar hide / show
            });

            /**
             * When another sidebar menu item pressed and before container replaced with new ajax content.
             * You can cancel, destroy, or remove any thing here before replace main output ajax container.
             * returning false will cancel the new request and do nothing.
             **/
            $(javatmp.settings.defaultOutputSelector).on(javatmp.settings.javaTmpContainerRemoveEventName, function (event) {
                return true;
            });
        });
    </script>
</div>