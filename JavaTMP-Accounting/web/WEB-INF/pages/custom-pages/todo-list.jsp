<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="dynamic-ajax-content">
    <div class="page-header">
        <h1>ToDo App</h1>
    </div>
    <div class="row">
        <div class="col-lg-3">
            <div class="card">
                <div class="card-header">
                    Projects
                </div>
                <div class="list-group list-group-flush">
                    <a href="javascript:;" class="list-group-item list-group-item-action d-flex align-items-center">Project 1
                        <span class="badge badge-danger ml-auto">31</span>
                    </a>
                    <a href="javascript:;" class="list-group-item list-group-item-action d-flex align-items-center">Project 2
                        <span class="badge badge-danger ml-auto">23</span>
                    </a>
                    <a href="javascript:;" class="list-group-item list-group-item-action d-flex align-items-center active">Project 3
                        <span class="badge badge-danger ml-auto">55</span>
                    </a>
                    <a href="javascript:;" class="list-group-item list-group-item-action d-flex align-items-center">Project 4
                        <span class="badge badge-danger ml-auto">15</span>
                    </a>
                    <a href="javascript:;" class="list-group-item list-group-item-action d-flex align-items-center">Project 5
                        <span class="badge badge-danger ml-auto">19</span>
                    </a>
                </div>
            </div>
            <div class="card my-3">
                <div class="card-header">
                    Tags
                </div>
                <div class="list-group list-group-flush">
                    <a href="javascript:;" class="list-group-item list-group-item-action d-flex align-items-center">Issue
                        <span class="badge badge-danger ml-auto">31</span>
                    </a>
                    <a href="javascript:;" class="list-group-item list-group-item-action d-flex align-items-center">Pending
                        <span class="badge badge-danger ml-auto">23</span>
                    </a>
                    <a href="javascript:;" class="list-group-item list-group-item-action d-flex align-items-center">Close
                        <span class="badge badge-danger ml-auto">55</span>
                    </a>
                    <a href="javascript:;" class="list-group-item list-group-item-action d-flex align-items-center">Finished
                        <span class="badge badge-danger ml-auto">5</span>
                    </a>
                    <a href="javascript:;" class="list-group-item list-group-item-action d-flex align-items-center">Bugs
                        <span class="badge badge-danger ml-auto">19</span>
                    </a>
                </div>
            </div>
        </div>
        <div class="col-lg-9">
            <div class="card">
                <div class="card-header">
                    Project Tasks
                    <div class="options float-right">
                        <a class="settings"><i class="fa fa-cog"></i></a>
                        <a href="#" class="collapse"><i class="fa fa-chevron-up"></i></a>
                        <a href="#" class="reload"><i class="fa fa-sync"></i></a>
                        <a href="#" class="fullscreen"><i class=" fa fa-expand"></i></a>
                        <a href="#" class="remove"><i class="fa fa-times"></i></a>
                    </div>
                </div>
                <div class="list-group list-group-flush">
                    <a href="#" class="list-group-item list-group-item-action flex-column align-items-start">
                        <div class="d-flex w-100 justify-content-between align-items-center">
                            <h5 class="mb-1">Project Task Heading</h5>
                            <small>3 days ago</small>
                        </div>
                        <p class="mb-1">Donec id elit non mi porta gravida at eget metus. Maecenas sed diam eget risus varius blandit.</p>
                        <div class="small">
                            <i class="fa fa-calendar"></i>
                            21 Sep 2017
                            <i class="fa fa-tags ml-1"></i>
                            <span class="badge badge-warning">Urgent</span>
                            <span class="badge badge-danger">Bug</span>
                        </div>
                    </a>
                    <a href="#" class="list-group-item list-group-item-action flex-column align-items-start">
                        <div class="d-flex w-100 justify-content-between align-items-center">
                            <h5 class="mb-1">Project Task Heading</h5>
                            <small>3 days ago</small>
                        </div>
                        <p class="mb-1">Donec id elit non mi porta gravida at eget metus. Maecenas sed diam eget risus varius blandit.</p>
                        <div class="small">
                            <i class="fa fa-calendar"></i>
                            21 Sep 2017
                            <i class="fa fa-tags ml-1"></i>
                            <span class="badge badge-warning">Urgent</span>
                            <span class="badge badge-danger">Bug</span>
                        </div>
                    </a>
                    <a href="#" class="list-group-item list-group-item-action flex-column align-items-start">
                        <div class="d-flex w-100 justify-content-between align-items-center">
                            <h5 class="mb-1">Project Task Heading</h5>
                            <small>3 days ago</small>
                        </div>
                        <p class="mb-1">Donec id elit non mi porta gravida at eget metus. Maecenas sed diam eget risus varius blandit.</p>
                        <div class="small">
                            <i class="fa fa-calendar"></i>
                            21 Sep 2017
                            <i class="fa fa-tags ml-1"></i>
                            <span class="badge badge-warning">Urgent</span>
                            <span class="badge badge-danger">Bug</span>
                        </div>
                    </a>
                    <a href="#" class="list-group-item list-group-item-action flex-column align-items-start">
                        <div class="d-flex w-100 justify-content-between align-items-center">
                            <h5 class="mb-1">Project Task Heading</h5>
                            <small>3 days ago</small>
                        </div>
                        <p class="mb-1">Donec id elit non mi porta gravida at eget metus. Maecenas sed diam eget risus varius blandit.</p>
                        <div class="small">
                            <i class="fa fa-calendar"></i>
                            21 Sep 2017
                            <i class="fa fa-tags ml-1"></i>
                            <span class="badge badge-warning">Urgent</span>
                            <span class="badge badge-danger">Bug</span>
                        </div>
                    </a>
                    <a href="#" class="list-group-item list-group-item-action flex-column align-items-start">
                        <div class="d-flex w-100 justify-content-between align-items-center">
                            <h5 class="mb-1">Project Task Heading</h5>
                            <small>3 days ago</small>
                        </div>
                        <p class="mb-1">Donec id elit non mi porta gravida at eget metus. Maecenas sed diam eget risus varius blandit.</p>
                        <div class="small">
                            <i class="fa fa-calendar"></i>
                            21 Sep 2017
                            <i class="fa fa-tags ml-1"></i>
                            <span class="badge badge-warning">Urgent</span>
                            <span class="badge badge-danger">Bug</span>
                        </div>
                    </a>
                    <a href="#" class="list-group-item list-group-item-action flex-column align-items-start">
                        <div class="d-flex w-100 justify-content-between align-items-center">
                            <h5 class="mb-1">Project Task Heading</h5>
                            <small>3 days ago</small>
                        </div>
                        <p class="mb-1">Donec id elit non mi porta gravida at eget metus. Maecenas sed diam eget risus varius blandit.</p>
                        <div class="small">
                            <i class="fa fa-calendar"></i>
                            21 Sep 2017
                            <i class="fa fa-tags ml-1"></i>
                            <span class="badge badge-warning">Urgent</span>
                            <span class="badge badge-danger">Bug</span>
                        </div>
                    </a>
                </div>
            </div>
        </div>
    </div>
    <style type="text/css">

    </style>
    <script type="text/javascript">
        jQuery(document).ready(function () {
            (function ($) {

            }(jQuery));
        });
    </script>
</div>