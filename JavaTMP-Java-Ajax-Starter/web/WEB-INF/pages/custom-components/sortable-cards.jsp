<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="dynamic-ajax-content">
    <div class="page-header">
        <h1>Sortable Cards</h1>
    </div>
    <div class="row">
        <div class="col-lg-12">
            <div class="card my-3" style="">
                <div class="card-header">
                    Sortable Cards using JqueryUI sortable Plugin
                    <div class="options float-right">
                        <a class="settings"><i class="fa fa-cog"></i></a>
                        <a href="#" class="collapse"><i class="fa fa-chevron-up"></i></a>
                        <a href="#" class="reload"><i class="fa fa-sync"></i></a>
                        <a href="#" class="fullscreen"><i class=" fa fa-expand"></i></a>
                        <a href="#" class="remove"><i class="fa fa-times"></i></a>
                    </div>
                </div>
                <div class="card-body">
                    <div class="row">
                        <div class="col-lg-4 card-container-col">
                            <div class="card my-3">
                                <div class="card-header">
                                    Card
                                    <div class="options float-right">
                                        <a class="settings"><i class="fa fa-cog"></i></a>
                                        <a href="#" class="collapse"><i class="fa fa-chevron-up"></i></a>
                                        <a href="#" class="reload"><i class="fa fa-sync"></i></a>
                                        <a href="#" class="fullscreen"><i class=" fa fa-expand"></i></a>
                                        <a href="#" class="remove"><i class="fa fa-times"></i></a>
                                    </div>
                                </div>
                                <div class="card-body">
                                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum tincidunt est vitae ultrices accumsan. Aliquam ornare lacus adipiscing, posuere lectus et, fringilla augue.</p>
                                </div>
                            </div>
                            <div class="card my-3">
                                <div class="card-header">
                                    Card
                                    <div class="options float-right">
                                        <a class="settings"><i class="fa fa-cog"></i></a>
                                        <a href="#" class="collapse"><i class="fa fa-chevron-up"></i></a>
                                        <a href="#" class="reload"><i class="fa fa-sync"></i></a>
                                        <a href="#" class="fullscreen"><i class=" fa fa-expand"></i></a>
                                        <a href="#" class="remove"><i class="fa fa-times"></i></a>
                                    </div>
                                </div>
                                <div class="card-body">
                                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum tincidunt est vitae ultrices accumsan. Aliquam ornare lacus adipiscing, posuere lectus et, fringilla augue.</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 card-container-col">
                            <div class="card my-3">
                                <div class="card-header">
                                    Card
                                    <div class="options float-right">
                                        <a class="settings"><i class="fa fa-cog"></i></a>
                                        <a href="#" class="collapse"><i class="fa fa-chevron-up"></i></a>
                                        <a href="#" class="reload"><i class="fa fa-sync"></i></a>
                                        <a href="#" class="fullscreen"><i class=" fa fa-expand"></i></a>
                                        <a href="#" class="remove"><i class="fa fa-times"></i></a>
                                    </div>
                                </div>
                                <div class="card-body">
                                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum tincidunt est vitae ultrices accumsan. Aliquam ornare lacus adipiscing, posuere lectus et, fringilla augue.</p>
                                </div>
                            </div>
                            <div class="card my-3">
                                <div class="card-header">
                                    Card
                                    <div class="options float-right">
                                        <a class="settings"><i class="fa fa-cog"></i></a>
                                        <a href="#" class="collapse"><i class="fa fa-chevron-up"></i></a>
                                        <a href="#" class="reload"><i class="fa fa-sync"></i></a>
                                        <a href="#" class="fullscreen"><i class=" fa fa-expand"></i></a>
                                        <a href="#" class="remove"><i class="fa fa-times"></i></a>
                                    </div>
                                </div>
                                <div class="card-body">
                                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum tincidunt est vitae ultrices accumsan. Aliquam ornare lacus adipiscing, posuere lectus et, fringilla augue.</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 card-container-col">
                            <div class="card my-3">
                                <div class="card-header">
                                    Card
                                    <div class="options float-right">
                                        <a class="settings"><i class="fa fa-cog"></i></a>
                                        <a href="#" class="collapse"><i class="fa fa-chevron-up"></i></a>
                                        <a href="#" class="reload"><i class="fa fa-sync"></i></a>
                                        <a href="#" class="fullscreen"><i class=" fa fa-expand"></i></a>
                                        <a href="#" class="remove"><i class="fa fa-times"></i></a>
                                    </div>
                                </div>
                                <div class="card-body">
                                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum tincidunt est vitae ultrices accumsan. Aliquam ornare lacus adipiscing, posuere lectus et, fringilla augue.</p>
                                </div>
                            </div>
                            <div class="card my-3">
                                <div class="card-header">
                                    Card
                                    <div class="options float-right">
                                        <a class="settings"><i class="fa fa-cog"></i></a>
                                        <a href="#" class="collapse"><i class="fa fa-chevron-up"></i></a>
                                        <a href="#" class="reload"><i class="fa fa-sync"></i></a>
                                        <a href="#" class="fullscreen"><i class=" fa fa-expand"></i></a>
                                        <a href="#" class="remove"><i class="fa fa-times"></i></a>
                                    </div>
                                </div>
                                <div class="card-body">
                                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum tincidunt est vitae ultrices accumsan. Aliquam ornare lacus adipiscing, posuere lectus et, fringilla augue.</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <style type="text/css">
        .card-container-col {
            min-height: 50px;
        }
    </style>
    <script type="text/javascript">
        jQuery(function ($) {
            // any code put here will be run after content attach to ajax output container and before
            // controll return to main javascript file.


            $(javatmp.settings.defaultOutputSelector).on(javatmp.settings.javaTmpAjaxContainerReady, function (event) {
                // fire AFTER all transition done and your ajax content is shown to user.
                $(".card-container-col").sortable({
                    connectWith: ".card-container-col",
                    items: '> .card',
                    handle: ".card-header",
                    cancel: ".options",
                    placeholder: "card-placeholder my-3",
                    opacity: 0.9,
                    revert: true,
                    forceHelperSize: true,
                    forcePlaceholderSize: true,
                    tolerance: 'pointer',
                    start: function (e, ui) {
                        ui.placeholder.width(ui.item.width());
                        ui.placeholder.height(ui.item.height());
                        ui.placeholder.addClass(ui.item.attr("class"));
                    },
                    stop: function (e, ui) {
                        $(ui.item).attr("style", "");
                    }
                });
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
             * When another sidebar menu item pressed and before container replaced with new ajax content.
             * You can cancel, destroy, or remove any thing here before replace main output ajax container.
             * returning false will cancel the new request and do nothing.
             **/
            $(javatmp.settings.defaultOutputSelector).on(javatmp.settings.javaTmpContainerRemoveEventName, function (event) {
                $(javatmp.settings.defaultOutputSelector).off(javatmp.settings.cardFullscreenCompress);
                $(javatmp.settings.defaultOutputSelector).off(javatmp.settings.cardFullscreenExpand);

                $(".card-container-col").sortable("destroy");

                return true;
            });
        });
    </script>
</div>