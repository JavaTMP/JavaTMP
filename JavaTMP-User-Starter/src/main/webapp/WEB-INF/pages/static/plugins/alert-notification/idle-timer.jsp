<div class="dynamic-ajax-content grid-gutter-padding">
    <div class="row">
        <div class="col-lg-12">
            <div class="alert alert-info mt-3">
                <p>provides you a way to monitor user activity with a page.</p>
                <p>
                    <a class="btn btn-info" target="_blank" href="http://thorst.github.io/jquery-idletimer/index.html"><i class="fa fa-external-link-alt fa-fw"></i>Demo Page</a>
                    <a class="btn btn-info" target="_blank" href="https://github.com/thorst/jquery-idletimer"><i class="fa fa-external-link-alt fa-fw"></i>github.com Page</a>
                </p>
            </div>
            <div class="card my-3">
                <div class="card-header">
                    Idle Timer Plugin
                    <div class="options float-right">
                        <a class="settings"><i class="fa fa-cog"></i></a>
                        <a href="#" class="collapse"><i class="fa fa-chevron-up"></i></a>
                        <a href="#" class="reload"><i class="fa fa-sync"></i></a>
                        <a href="#" class="fullscreen"><i class=" fa fa-expand"></i></a>
                        <a href="#" class="remove"><i class="fa fa-times"></i></a>
                    </div>
                </div>
                <div class="card-body">
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        jQuery(function ($) {
            $(javatmp.settings.defaultOutputSelector).on(javatmp.settings.javaTmpAjaxContainerReady, function (event) {
                $(window).idleTimer({
                    timeout: 5 * 1000,
                    events: "mousemove keydown wheel DOMMouseScroll mousewheel mousedown touchstart touchmove MSPointerDown MSPointerMove ontouchstart click tap"
                });
                $('.card-body').html($('.card-body').html() + "Init: @ " + new Date() + "");
                $(window).on("idle.idleTimer", function (event, elem, obj) {
                    //If you dont stop propagation it will bubble up to document event handler
                    event.stopPropagation();
                    $(window).block({message: null,
                        overlayCSS: {
                            backgroundColor: '#fff',
                            opacity: 1.0
                        },
                        baseZ: 1999});
                    $('.card-body').html($('.card-body').html() + "<br/>" + "idle.idleTimer : @ " + new Date());
                });
                $(window).on("active.idleTimer", function (event) {
                    //If you dont stop propagation it will bubble up to document event handler
                    event.stopPropagation();
                    $(window).unblock({
                        onUnblock: function (target) {
                            $(target).css('position', '');
                            $(target).css('zoom', '');
                        }
                    });
                    $('.card-body').html($('.card-body').html() + "<br/>" + "active.idleTimer: @ " + new Date());
                });
            });

            $(javatmp.settings.defaultOutputSelector).on(javatmp.settings.javaTmpContainerResizeEventName, function (event) {

            });
            $(javatmp.settings.defaultOutputSelector).on(javatmp.settings.cardFullscreenCompress, function (event, card) {
                // when card compress by pressing the top right tool button

            });
            $(javatmp.settings.defaultOutputSelector).on(javatmp.settings.cardFullscreenExpand, function (event, card) {
                // when card Expand by pressing the top right tool button
            });
            // before container replaced with new ajax content.
            $(javatmp.settings.defaultOutputSelector).on(javatmp.settings.javaTmpContainerRemoveEventName, function (event) {
                $(javatmp.settings.defaultOutputSelector).off(javatmp.settings.cardFullscreenCompress);
                $(javatmp.settings.defaultOutputSelector).off(javatmp.settings.cardFullscreenExpand);

                $(window).off("idle.idleTimer");
                $(window).off("active.idleTimer");
                $(window).idleTimer("destroy");

                return true;
            });
        });
    </script>
</div>