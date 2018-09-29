<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="dynamic-ajax-content">
    <h4 class="my-3">Dynamic Wizard with Advanced Form Plugins</h4>
    <hr/>
    <div class="row">
        <div class="col-lg-12">
            <div class="alert alert-info">
                <p>A combination of form plugins to create advanced form consisting of jQuery Form Plugin, jQuery Validation Plugin, jQuery summernote Plugin, Form Inputmask Plugin, and jQuery Select2 Plugin.</p>
            </div>
            <div class="card my-3">
                <div class="card-header">
                    Create New User using Wizard
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
                        <div class="col-lg-12">
                            <a
                                actionType="ajax-model"
                                href="${pageContext.request.contextPath}/pages/form/dynamic-wizard-with-advanced-form"
                                href="javascript:;"
                                role="button"
                                class="btn btn-primary btn-lg">
                                Press To Launch Wizard
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--<link href="components/" rel="stylesheet">-->
    <style type="text/css">

    </style>
    <script type="text/javascript">
        jQuery(function ($) {

        });
    </script>
</div>