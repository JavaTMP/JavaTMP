<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="dynamic-ajax-content">
    <div class="page-header">
        <h1>Bootstrap Modal</h1>
    </div>
    <div class="row">
        <div class="col">
            <div class="card my-3">
                <div class="card-header">

                    <div class="options float-right">
                        <a class="settings"><i class="fa fa-cog"></i></a>
                        <a href="#" class="collapse"><i class="fa fa-chevron-up"></i></a>
                        <a href="#" class="reload"><i class="fa fa-sync"></i></a>
                        <a href="#" class="fullscreen"><i class=" fa fa-expand"></i></a>
                        <a href="#" class="remove"><i class="fa fa-times"></i></a>
                    </div>
                </div>
                <div class="card-body">
                    <h4 class="card-title text-primary">Basic Hardcoded examples</h4>
                    <!-- Button trigger modal -->
                    <button type="button" class="btn btn-primary mr-1" data-toggle="modal" data-target="#exampleModal">
                        Basic example
                    </button>
                    <!-- Modal -->
                    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    ...
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                    <button type="button" class="btn btn-primary">Save changes</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Button trigger modal -->
                    <button type="button" class="btn btn-primary mr-1" data-toggle="modal" data-target="#exampleModalLong">
                        Scrolling long content
                    </button>
                    <!-- Modal -->
                    <div class="modal fade" id="exampleModalLong" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLongTitle">Modal title</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    <p>
                                        Lorem ipsum dolor sit amet, ei dignissim urbanitas mea. Usu ei summo sensibus iudicabit. Sed ei dolorem luptatum, hinc autem cu vim, putent labitur eum in. Soleat luptatum postulant mea te, eu ius vitae nostrud oportere, no sed laudem nonumes. Nam ei probo disputationi, singulis posidonium constituam no ius. In eam virtute scribentur, sea exerci pertinacia ex.
                                    </p>
                                    <p>
                                        Lorem ipsum dolor sit amet, ei dignissim urbanitas mea. Usu ei summo sensibus iudicabit. Sed ei dolorem luptatum, hinc autem cu vim, putent labitur eum in. Soleat luptatum postulant mea te, eu ius vitae nostrud oportere, no sed laudem nonumes. Nam ei probo disputationi, singulis posidonium constituam no ius. In eam virtute scribentur, sea exerci pertinacia ex.
                                    </p>
                                    <p>
                                        Lorem ipsum dolor sit amet, ei dignissim urbanitas mea. Usu ei summo sensibus iudicabit. Sed ei dolorem luptatum, hinc autem cu vim, putent labitur eum in. Soleat luptatum postulant mea te, eu ius vitae nostrud oportere, no sed laudem nonumes. Nam ei probo disputationi, singulis posidonium constituam no ius. In eam virtute scribentur, sea exerci pertinacia ex.
                                    </p>
                                    <p>
                                        Lorem ipsum dolor sit amet, ei dignissim urbanitas mea. Usu ei summo sensibus iudicabit. Sed ei dolorem luptatum, hinc autem cu vim, putent labitur eum in. Soleat luptatum postulant mea te, eu ius vitae nostrud oportere, no sed laudem nonumes. Nam ei probo disputationi, singulis posidonium constituam no ius. In eam virtute scribentur, sea exerci pertinacia ex.
                                    </p>
                                    <p>
                                        Lorem ipsum dolor sit amet, ei dignissim urbanitas mea. Usu ei summo sensibus iudicabit. Sed ei dolorem luptatum, hinc autem cu vim, putent labitur eum in. Soleat luptatum postulant mea te, eu ius vitae nostrud oportere, no sed laudem nonumes. Nam ei probo disputationi, singulis posidonium constituam no ius. In eam virtute scribentur, sea exerci pertinacia ex.
                                    </p>
                                    <p>
                                        Lorem ipsum dolor sit amet, ei dignissim urbanitas mea. Usu ei summo sensibus iudicabit. Sed ei dolorem luptatum, hinc autem cu vim, putent labitur eum in. Soleat luptatum postulant mea te, eu ius vitae nostrud oportere, no sed laudem nonumes. Nam ei probo disputationi, singulis posidonium constituam no ius. In eam virtute scribentur, sea exerci pertinacia ex.
                                    </p>
                                    <p>
                                        Lorem ipsum dolor sit amet, ei dignissim urbanitas mea. Usu ei summo sensibus iudicabit. Sed ei dolorem luptatum, hinc autem cu vim, putent labitur eum in. Soleat luptatum postulant mea te, eu ius vitae nostrud oportere, no sed laudem nonumes. Nam ei probo disputationi, singulis posidonium constituam no ius. In eam virtute scribentur, sea exerci pertinacia ex.
                                    </p>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                    <button type="button" class="btn btn-primary">Save changes</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#Tooltipspopovers">
                        Tooltips and popovers
                    </button>
                    <!-- Modal -->
                    <div class="modal fade" id="Tooltipspopovers" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    <h5>Popover in a modal</h5>
                                    <p>This <a href="#" role="button" class="btn btn-secondary popover-test" title="Popover title" data-content="Popover body content is set in this attribute.">button</a> triggers a popover on click.</p>
                                    <hr>
                                    <h5>Tooltips in a modal</h5>
                                    <p><a href="#" class="tooltip-test" title="Tooltip">This link</a> and <a href="#" class="tooltip-test" title="Tooltip">that link</a> have tooltips on hover.</p>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                    <button type="button" class="btn btn-primary">Save changes</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <style type="text/css">

    </style>
    <script type="text/javascript">
        jQuery(function ($) {
            $(javatmp.settings.defaultOutputSelector).on(javatmp.settings.javaTmpAjaxContainerReady, function (event) {


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