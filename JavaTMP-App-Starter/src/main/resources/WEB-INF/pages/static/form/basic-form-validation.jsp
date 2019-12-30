<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="dynamic-ajax-content grid-gutter-padding">
    <div class="row">
        <div class="col-lg-12">
            <div class="alert alert-info mt-3">
                <p>Basic HTML5 Form Validation using default behaviour of the browser</p>
            </div>
            <div class="card my-3">
                <div class="card-header">
                    Basic HTML5 Form Validation
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
                            <form action="#" method="post" role="form">
                                <div class="form-group required row">
                                    <label class="col-md-2 col-form-label">Username</label>
                                    <div class="col-md-4">
                                        <input class="form-control" id="id_username" maxlength="30" name="username"
                                               placeholder="Username" required="required" title="" type="text" />
                                    </div>
                                </div>
                                <div class="form-group required row">
                                    <label class="col-md-2 col-form-label">E-mail</label>
                                    <div class="col-md-4">
                                        <input class="form-control" id="id_email" name="email" placeholder="E-mail"
                                               required="required" title="" type="email" /></div>
                                </div>
                                <div class="form-group required row">
                                    <label class="col-md-2 col-form-label">Password</label>
                                    <div class="col-md-4"><input class="form-control" id="id_password1" name="password1" placeholder="Password" required="required" title="" type="password" /></div></div>
                                <div class="form-group required row">
                                    <label class="col-md-2 col-form-label">Password (again)</label><div class="col-md-4"><input class="form-control" id="id_password2" name="password2" placeholder="Password (again)" required="required" title="" type="password" /></div></div>
                                <div class="form-group required row">
                                    <label class="col-md-2 col-form-label">first name</label><div class="col-md-4"><input class="form-control" id="id_first_name" maxlength="30" name="first_name" placeholder="first name" required="required" title="" type="text" /></div></div>
                                <div class="form-group required row">
                                    <label class="col-md-2 col-form-label">last name</label><div class="col-md-4"><input class="form-control" id="id_last_name" maxlength="30" name="last_name" placeholder="last name" required="required" title="" type="text" /></div></div>
                                <div class="form-group required row">
                                    <label class="col-md-2 col-form-label">Terms of Service</label>
                                    <div class="col-md-4">
                                        <div class="form-check">
                                            <label class="form-check-label">
                                                <input class="form-check-input" id="id_tos" name="tos" required="required" type="checkbox" />
                                                I have read and agree to the Terms of Service
                                            </label>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-offset-2 col-sm-10">
                                        <button type="submit" class="btn btn-primary">
                                            <span class="fa fa-star"></span> Sign Me Up!
                                        </button>
                                        <button class="btn" type="reset">
                                            <i class="fa fa-undo"></i>
                                            Reset
                                        </button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--<link href="components/" rel="stylesheet">-->
    <style type="text/css">
        /* http://stackoverflow.com/questions/23141854/adding-asterisk-to-required-fields-in-bootstrap-3 */
        .form-group.required .col-form-label:after {
            content: "*" ;
            color:red;
        }
    </style>
    <!--<script src="components/"></script>-->
    <script type="text/javascript">
        jQuery(document).ready(function () {
            (function ($) {

            }(jQuery));
        });
    </script>
</div>
