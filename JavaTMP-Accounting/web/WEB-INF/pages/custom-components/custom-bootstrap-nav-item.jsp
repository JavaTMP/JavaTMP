<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="dynamic-ajax-content">
    <div class="page-header">
        <h1>Custom Bootstrap Nav Item</h1>
    </div>
    <div class="row">
        <div class="col-lg-12">
            <div class="card my-3">
                <div class="card-header">
                    Example
                    <div class="options float-right">
                        <a class="settings"><i class="fa fa-cog"></i></a>
                        <a href="javascript:;" class="collapse"><i class="fa fa-chevron-up"></i></a>
                        <a href="javascript:;" class="reload"><i class="fa fa-sync"></i></a>
                        <a href="javascript:;" class="fullscreen"><i class=" fa fa-expand"></i></a>
                        <a href="javascript:;" class="remove"><i class="fa fa-times"></i></a>
                    </div>
                </div>
                <div class="card-body">
                    <div class="row">
                        <div class="col-lg-12">
                            <ul class="nav nav-wizard">
                                <li class="nav-item">
                                    <a class="nav-link done" href="javascript:;">First<span class="badge badge-light">4</span></a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link active" href="javascript:;">Home</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="javascript:;">Profile</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="javascript:;">Messages</a>
                                </li>
                            </ul>
                            <br/>
                            <ul class="nav nav-wizard nav-pills nav-justified">
                                <li class="nav-item">
                                    <a class="nav-link" href="#Centeredhome-pills" data-toggle="tab" aria-expanded="true">Home</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="#Centeredprofile-pills" data-toggle="tab" aria-expanded="false">Profile</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="#Centeredmessages-pills" data-toggle="tab" aria-expanded="false">Messages</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="#Centeredsettings-pills" data-toggle="tab">Settings</a>
                                </li>
                            </ul>
                            <br/>
                            <ul class="nav nav-pills nav-wizard">
                                <li class="done nav-item">
                                    <a class="nav-link" href="#home-pills" data-toggle="tab" aria-expanded="false">Home</a>
                                </li>
                                <li class="done nav-item">
                                    <a class="nav-link" href="#profile-pills" data-toggle="tab" aria-expanded="false">Profile</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="#messages-pills" data-toggle="tab" aria-expanded="false">Messages</a>
                                </li>
                                <li class="active nav-item">
                                    <a class="nav-link" href="#settings-pills" data-toggle="tab" aria-expanded="true">Settings</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <style type="text/css">

    </style>
    <!--<script src="components/"></script>-->
    <script type="text/javascript">
        jQuery(document).ready(function () {
            (function ($) {

            }(jQuery));
        });
    </script>
</div>