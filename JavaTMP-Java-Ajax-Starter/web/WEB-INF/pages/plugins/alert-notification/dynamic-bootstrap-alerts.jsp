<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="dynamic-ajax-content">
    <div class="page-header">
        <h1>Dynamic Bootstrap Alerts</h1>
    </div>

    <div class="row">
        <div class="col-lg-12">
            <div class="alert alert-info">
                <p>Bootstrap alert wrapper factory for creating dynamic alert instances</p>
                <p>
                    <a class="btn btn-info" target="_blank" href="https://github.com/JavaTMP/bootstrap-alert-wrapper"><i class="fa fa-external-link-alt fa-fw"></i>github.com Page</a>
                </p>
            </div>
            <div class="card my-3">
                <div class="card-header">
                    Dynamic Bootstrap Alerts
                    <div class="options float-right">
                        <a class="settings"><i class="fa fa-cog"></i></a>
                        <a href="#" class="collapse"><i class="fa fa-chevron-up"></i></a>
                        <a href="#" class="reload"><i class="fa fa-sync"></i></a>
                        <a href="#" class="fullscreen"><i class=" fa fa-expand"></i></a>
                        <a href="#" class="remove"><i class="fa fa-times"></i></a>
                    </div>
                </div>
                <div class="card-body">
                    <div id="bootstrap_alerts_container"> </div>
                    <form class="form-horizontal">
                        <div class="form-group">
                            <label class="" for="title">Alert Message:</label>
                            <input id="alert_message" type="text" class="form-control" value="Dynamic Alert text ..." placeholder="enter a text ...">
                        </div>
                        <div class="form-group">
                            <label for="title">Alert Type:</label>
                            <select id="alert_type" class="form-control">
                                <option value="success">Success</option>
                                <option value="danger">Danger</option>
                                <option value="warning">Warning</option>
                                <option value="info">Info</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="title">Container:</label>
                            <select id="alert_container" class="form-control">
                                <option value="#bootstrap_alerts_container">#bootstrap_alerts_container</option>
                                <option value=".dynamic-ajax-content">.dynamic-ajax-content</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="title">Placement:</label>
                            <select id="alert_place" class="form-control">
                                <option value="append">Append</option>
                                <option value="prepend">Prepend</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="alert_close_in_seconds">Auto Close In(seconds):</label>
                            <select id="alert_close_in_seconds" class="form-control input-medium">
                                <option value="5">5 seconds</option>
                                <option value="1">1 second</option>
                                <option value="10">10 seconds</option>
                                <option value="0">never close</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="title">Font Awesome Icon:</label>
                            <select id="alert_icon" class="form-control input-medium">
                                <option value="" selected="selected">none</option>
                                <option value="fa-lg fa fa-exclamation-triangle">fa-lg fa fa-exclamation-triangle</option>
                                <option value="fa-lg fa fa-check">fa-lg fa fa-check</option>
                                <option value="fa-lg fa fa-user">fa-lg fa fa-user</option>
                            </select>
                        </div>
                        <div class="form-check">
                            <input checked="" class="form-check-input" id="alert_close" name="" type="checkbox"/>
                            <label class="form-check-label" for="alert_close">Closable ?</label>
                        </div>
                        <div class="form-check">
                            <input checked="" class="form-check-input" id="alert_reset" name="" type="checkbox"/>
                            <label class="form-check-label" for="alert_reset">Close All Previouse Alerts ?</label>
                        </div>
                        <div class="form-check">
                            <input checked="" class="form-check-input" id="alert_focus" name="" type="checkbox"/>
                            <label class="form-check-label" for="alert_focus">Auto Scroll/Focus ?</label>
                        </div>
                        <div class="form-group mt-3">
                            <a href="javascript:;" class="btn btn-primary btn-lg" id="alert_show">Show Alert!</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <style type="text/css">

    </style>
    <script type="text/javascript">
        jQuery(function ($) {
            $(javatmp.settings.defaultOutputSelector).on(javatmp.settings.javaTmpAjaxContainerReady, function (event) {
                $('#alert_show').click(function () {
                    var newAlertId = BootstrapAlertWrapper.createAlert({
                        container: $('#alert_container').val(), // alerts parent container(by default placed after the page breadcrumbs)
                        place: $('#alert_place').val(), // append or prepent in container
                        type: $('#alert_type').val(), // alert's type
                        message: $('#alert_message').val(), // alert's message
                        close: $('#alert_close').is(":checked"), // make alert closable
                        reset: $('#alert_reset').is(":checked"), // close all previouse alerts first
                        focus: $('#alert_focus').is(":checked"), // auto scroll to the alert after shown
                        closeInSeconds: $('#alert_close_in_seconds').val(), // auto close after defined seconds
                        icon: $('#alert_icon').val(), // put icon before the message
                        offset: javatmp.getFixedOffset()
                    });
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
                return true;
            });

        });
    </script>
</div>