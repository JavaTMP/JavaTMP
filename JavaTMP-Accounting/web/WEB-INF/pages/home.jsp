<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="dynamic-ajax-content">
    <div class="row justify-content-center mt-5">
        <div class=" col-6 col-sm-6 col-md-4 col-lg-2 col-xl-2 text-center px-2">
            <button type="button" class="javatmp-btn btn btn-primary btn-block my-2"
                    actionType="action-ref-href" action-ref-by-href="${pageContext.request.contextPath}/pages/accounting/chart-of-accounts" >
                <i class="fa fa-sitemap"></i>
                Chart Of Accounts
            </button>
        </div>
        <div class="col-6 col-sm-6 col-md-4 col-lg-2 col-xl-2 text-center px-2">
            <button type="button" class="javatmp-btn btn btn-primary btn-block my-2"
                    actionType="action-ref-href" action-ref-by-href="${pageContext.request.contextPath}/pages/accounting/general-ledger" >
                <i class="fa fa-book"></i>
                General Ledger
            </button>
        </div>
        <div class="col-6 col-sm-6 col-md-4 col-lg-2 col-xl-2 text-center px-2">
            <button type="button" class="javatmp-btn btn btn-primary btn-block my-2"
                    actionType="action-ref-href" action-ref-by-href="${pageContext.request.contextPath}/pages/accounting/transaction" >
                <i class="far fa-edit"></i>
                Create Transaction
            </button>
        </div>
    </div>
    <div class="row justify-content-center">
        <div class="col-6 col-sm-6 col-md-4 col-lg-2 col-xl-2 text-center px-2">
            <button type="button" class="javatmp-btn btn btn-primary btn-block my-2"
                    actionType="action-ref-href" action-ref-by-href="${pageContext.request.contextPath}/pages/reports/profit-loss-income" >
                <i class="far fa-chart-bar"></i>
                Trail Balance
            </button>
        </div>
        <div class="col-6 col-sm-6 col-md-4 col-lg-2 col-xl-2 text-center px-2">
            <button type="button" class="javatmp-btn btn btn-primary btn-block my-2"
                    actionType="action-ref-href" action-ref-by-href="${pageContext.request.contextPath}/pages/reports/trial-balance" >
                <i class="far fa-chart-bar"></i>
                Income Statement
            </button>
        </div>
        <div class="col-6 col-sm-6 col-md-4 col-lg-2 col-xl-2 text-center px-2">
            <button type="button" class="javatmp-btn btn btn-primary btn-block my-2"
                    actionType="action-ref-href" action-ref-by-href="${pageContext.request.contextPath}/pages/system/user-profile" >
                <i class="far fa-user"></i>
                User Profile
            </button>
        </div>
        <div class="col-6 col-sm-6 col-md-4 col-lg-2 col-xl-2 text-center px-2">
            <button type="button" class="javatmp-btn btn btn-primary btn-block my-2"
                    actionType="action-ref-href" action-ref-by-href="${pageContext.request.contextPath}/pages/system/activities-notifications" >
                <i class="fa fa-cog"></i>
                Activities And Notifications
            </button>
        </div>
    </div>

    <style type="text/css">
        .javatmp-btn {
            height: 100px;
            white-space: normal;
            max-width: 215px;
            margin: auto;
        }
        .javatmp-btn:hover {
            cursor: pointer;
        }
        .javatmp-btn > i {
            display: block;
        }
    </style>
    <script type="text/javascript">
        jQuery(function ($) {
            // any code put here will be run after content attach to ajax output container and before
            // controll return to main javascript file.


            $(javatmp.settings.defaultOutputSelector).on(javatmp.settings.javaTmpAjaxContainerReady, function (event) {
                // fire AFTER all transition done and your ajax content is shown to user.
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