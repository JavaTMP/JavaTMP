<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="dynamic-ajax-content">
    <div class="page-header">
        <h1>Dynamic Malihu Custom Scrollbar Plugin</h1>
    </div>
    <div class="row">
        <div class="col">
            <div class="alert alert-info">
                <p>Highly customizable custom scrollbar jQuery plugin, featuring vertical/horizontal scrollbars, scrolling momentum, mouse-wheel, keyboard and touch support.</p>
                <p>
                    <a class="btn btn-info" target="_blank" href="http://manos.malihu.gr/jquery-custom-content-scroller/">Configuration Page</a>
                    <a class="btn btn-info" target="_blank" href="http://manos.malihu.gr/repository/custom-scrollbar/demo/examples/complete_examples.html">Demo Page</a>
                    <a class="btn btn-info" target="_blank" href="https://github.com/malihu/malihu-custom-scrollbar-plugin">github.com Project Link</a>
                </p>
            </div>
            <div class="card">
                <div class="card-header">
                    Scroll to bottom or top to load additional content
                    <div class="options float-right">
                        <a class="settings"><i class="fa fa-cog"></i></a>
                        <a href="#" class="collapse"><i class="fa fa-chevron-up"></i></a>
                        <a href="#" class="reload"><i class="fa fa-sync"></i></a>
                        <a href="#" class="fullscreen"><i class=" fa fa-expand"></i></a>
                        <a href="#" class="remove"><i class="fa fa-times"></i></a>
                    </div>
                </div>
                <div class="card-body">
                    <div id="infinite-scroll" class="content">
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
                        <p>Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
                        <p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.</p>
                        <p>Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt.</p>
                        <p>Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur?</p>
                        <p>Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?</p>
                        <p>At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio.</p>
                        <p>Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus.</p>
                        <p>Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.</p>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
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
        /* theme: "minimal", "minimal-dark" */


    </style>
    <style type="text/css">
        /*
        Embed CSS styling for current page.
        */
        .content {
            overflow: auto;
            position: relative;
            width: 740px;
            border: 1px solid #DDD;
            height: 400px;
        }
    </style>
    <style type="text/css">
        #infinite-scroll .offset{
            display: block;
            width: 100%;
            height: auto;
            color: #ffed0d;
            -webkit-border-radius: 3px;
            -moz-border-radius: 3px;
            border-radius: 3px;
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

            var indicatorTemplate = '<div class="fetch-indicator text-center m-2 p-2"><i class="fa fa-sync fa-spin fa-3x fa-fw text-primary"></i></div>';
            var workingDown = false;
            var workingTop = false;
            $("#infinite-scroll").mCustomScrollbar({
                theme: "javatmp",
                mouseWheel: {
                    preventDefault: true
                },
                callbacks: {
                    onScroll: function () {
                        console.log("top = " + this.mcs.top + " , direction = " + this.mcs.direction);
                    },
                    onTotalScrollBack: function () {
                        if (!workingTop) {
                            workingTop = true;
                            console.log("** onTotalScrollBack **");
                            $("#infinite-scroll").mCustomScrollbar('scrollTo', 'top', {scrollInertia: 20});
                            this.mcs.content.prepend(indicatorTemplate);
                            var that = this;
                            setTimeout(function () {
                                that.mcs.content.find(".fetch-indicator").remove();
                                var c = "<p>Added  content at the beginning</p>";
                                for (var i = 0; i < 3; i++) {
                                    c += c;
                                }
                                that.mcs.content.prepend(c);
                                $(that).mCustomScrollbar("scrollTo", 1);
                                workingTop = false;
                            }, 1000);
                        }
                    },
                    onTotalScroll: function () {
                        if (!workingDown) {
                            console.log("** onTotalScroll **");
                            workingDown = true;
                            this.mcs.content.append(indicatorTemplate);
//                            $("#infinite-scroll").mCustomScrollbar('scrollTo', 'bottom', {scrollInertia: 20});
                            var that = this;
                            setTimeout(function () {
                                that.mcs.content.find(".fetch-indicator").remove();
                                var c = "<p>Added  content at the end</p>";
                                for (var i = 0; i < 3; i++) {
                                    c += c;
                                }
                                that.mcs.content.append(c);
                                workingDown = false;
                            }, 1000);
                        }
                    },
                    onTotalScrollBackOffset: 0,
                    onTotalScrollOffset: 200,
                    alwaysTriggerOffsets: true
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