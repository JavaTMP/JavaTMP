<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="dynamic-ajax-content">
    <div class="row">
        <div class="col-lg-3 col-md-6">
            <div class="card my-3">
                <div class="card-header">
                    Registered Users
                </div>
                <div class="card-body p-1">
                    <div class="row d-flex align-items-center">
                        <div class="col-6 text-center">
                            <span class="d-block display-4 counter">26</span>
                        </div>
                        <div class="col-6 text-left">
                            <div id="userStatusPieChart" style="width: 100%;min-height: 100px"></div>
                        </div>
                    </div>
                </div>
                <div class="card-footer">
                    <a href="#" actionType="action-ref-href" action-ref-by-href="${pageContext.request.contextPath}/user/GetListUsersPage">
                        View Details
                        <span class="float-right">
                            <i class="fa fa-arrow-circle-right"></i>
                        </span>
                    </a>
                </div>
                </a>
            </div>
        </div>

    </div>
    <div class="row">
        <div class="col-6 col-sm-6 col-md-4 col-lg-2 col-xl-2 text-center px-2">
            <button type="button" class="javatmp-btn btn btn-primary btn-block my-2"
                    actionType="action-ref-href" action-ref-by-href="${pageContext.request.contextPath}/user/GetListUsersPage" >
                <i class="fas fa-user"></i>
                User List
            </button>
        </div>
        <div class="col-6 col-sm-6 col-md-4 col-lg-2 col-xl-2 text-center px-2">
            <button type="button" class="javatmp-btn btn btn-primary btn-block my-2"
                    actionType="action-ref-href" action-ref-by-href="${pageContext.request.contextPath}/user/CreateUserController">
                <i class="fas fa-user"></i>
                Add New User
            </button>
        </div>
        <div class="col-6 col-sm-6 col-md-4 col-lg-2 col-xl-2 text-center px-2">
            <button type="button" class="javatmp-btn btn btn-primary btn-block my-2"
                    actionType="action-ref-href" action-ref-by-href="${pageContext.request.contextPath}/pages/user/current-user-profile" >
                <i class="fas fa-user"></i>
                Current User Profile
            </button>
        </div>
        <div class="col-6 col-sm-6 col-md-4 col-lg-2 col-xl-2 text-center px-2">
            <button type="button" class="logout-home-btn-id javatmp-btn btn btn-primary btn-block my-2"
                    actionType="action-ref-href" action-ref-by-href="${pageContext.request.contextPath}/logout" >
                <i class="fas fa-sign-out-alt"></i>
                Logout
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

            $('.counter').counterUp({
                delay: 10,
                time: 1000
            });

            var userStatusPieChart = echarts.init(document.getElementById('userStatusPieChart'));

            var option = {
                tooltip: {
                    trigger: 'item',
                    formatter: "{a} <br/>{b}: {c} ({d}%)",
                    textStyle: {
                        fontFamily: "Open Sans",
                        align: javatmp.settings.floatDefault
                    }
                },
                hover: true,
                color: ['#28a745', '#ffc107'],
                series: [
                    {
                        clockwise: !javatmp.settings.isRTL,
                        name: 'Registered User Statuses',
                        type: 'pie',
                        radius: '85%',
                        avoidLabelOverlap: false,
                        hoverOffset: 4,
                        label: {
                            normal: {
                                show: false,
                                position: 'center'
                            },
                            textStyle: {
                                fontFamily: "Open Sans",
                                align: javatmp.settings.floatDefault
                            }
                        },
                        data: [
                            {value: 18, name: 'Active'},
                            {value: 32, name: 'Deactive'}
                        ]
                    }
                ]
            };

            userStatusPieChart.setOption(option);

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