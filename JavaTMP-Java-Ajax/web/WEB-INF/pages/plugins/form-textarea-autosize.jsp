<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="dynamic-ajax-content grid-gutter-padding">
    <div class="row">
        <div class="col-lg-12">
            <div class="alert alert-info my-3">
                <p>Autosize is a small, stand-alone script to automatically adjust textarea height to fit text.</p>
                <br/>
                <p>
                    <a class="btn btn-info" target="_blank" href="http://www.jacklmoore.com/autosize/"><i class="fa fa-external-link-alt fa-fw"></i>Demo Page</a>
                    <a class="btn btn-info" target="_blank" href="https://github.com/jackmoore/autosize"><i class="fa fa-external-link-alt fa-fw"></i>github.com Page</a>
                </p>
            </div>
            <div class="card my-3">
                <div class="card-header">
                    Form Textarea Autosize
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
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label>max-height 300px</label>
                                <textarea class="form-control" style="min-width: 100%;max-height: 300px">The coconut palm (also, cocoanut), Cocos nucifera, is a member of the family Arecaceae (palm family). It is the only accepted species in the genus Cocos.[2] The term coconut can refer to the entire coconut palm, the seed, or the fruit, which, botanically, is a drupe, not a nut. The spelling cocoanut is an archaic form of the word.[3] The term is derived from 16th-century Portuguese and Spanish coco, meaning "head" or "skull",[4] from the three small holes on the coconut shell that resemble human facial features.</textarea>
                                <p class="help-block">after 300 px the vertical scroll bar shown</p>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label>no max-height</label>
                                <textarea class="form-control" style="min-width: 100%">The coconut palm (also, cocoanut), Cocos nucifera, is a member of the family Arecaceae (palm family). It is the only accepted species in the genus Cocos.[2] The term coconut can refer to the entire coconut palm, the seed, or the fruit, which, botanically, is a drupe, not a nut. The spelling cocoanut is an archaic form of the word.[3] The term is derived from 16th-century Portuguese and Spanish coco, meaning "head" or "skull",[4] from the three small holes on the coconut shell that resemble human facial features.</textarea>
                                <p class="help-block">No limit for textarea size</p>
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
        jQuery(document).ready(function () {
            (function ($) {
                autosize($('.dynamic-ajax-content textarea'));
            }(jQuery));
        });
    </script>
</div>