<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="dynamic-ajax-content">
    <h4 class="my-3">Two Columns Blank Page Title</h4>
    <hr/>
    <div class="row d-flex justify-content-center">
        <div class="col-lg-10">
            <div class="row">
                <div class="col-sm-4 col-md bg-primary text-light p-5">Sidebar Column</div>
                <div class="col-sm-8 bg-secondary text-light p-5">Main Content Column</div>
            </div>
        </div>
    </div>
    <hr/>
    <h2 class="text-primary text-truncate pt-1">Fixed and Fluid Bootstrap 4</h2>
    <div class="row flex-nowrap">
        <div class="col-md-4 col-12 fixed-column">
            <div class="card card-body p-2">
                <h4>Fixed Sidebar</h4>
                <ul class="nav nav-pills flex-column">
                    <li class="nav-item">
                        <a class="nav-link active" href="#">Active</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Link</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Link</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Link</a>
                    </li>
                </ul>
                <h4>Fixed Sidebar</h4>
                <ul class="nav flex-column">
                    <li class="nav-item">
                        <a class="nav-link" href="#">Link</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Link</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Link</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Link</a>
                    </li>
                </ul>
            </div>
        </div>
        <div class="col-md col-12">
            <h2>Main (fluid width...)</h2>
            <p>This column is fluid width.</p>

            <div class="row">
                <div class="col-lg-3 col-md-6 col-12">
                    <div class="card card-body">
                        <h2 class="text-center">
                            <span class="badge badge-danger">Snippets</span></h2>
                        <h1 class="text-center">311</h1>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 col-12">
                    <div class="card card-body">
                        <h2 class="text-center">
                            <span class="badge badge-danger">Downloads</span>
                        </h2>
                        <h1 class="text-center">982</h1>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 col-12">
                    <div class="card card-body">
                        <h2 class="text-center">
                            <span class="badge badge-danger">Sales</span>
                        </h2>
                        <h1 class="text-center">112</h1>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 col-12">
                    <div class="card card-body">
                        <h2 class="text-center">
                            <span class="badge badge-danger">Questions</span>
                        </h2>
                        <h1 class="text-center">209</h1>
                    </div>
                </div>
            </div>
            <!--/row-->
        </div>
    </div>
    <style type="text/css">
        /*
        Embed CSS styling for current page.
        */
        @media (min-width: 576px) {
            .fixed-column {
                flex: 0 0 230px;
            }
        }
    </style>
    <script type="text/javascript">
        jQuery(function ($) {
            $(javatmp.settings.defaultOutputSelector).on(javatmp.settings.javaTmpAjaxContainerReady, function (event) {

            });
            $(javatmp.settings.defaultOutputSelector).on(javatmp.settings.javaTmpContainerResizeEventName, function (event) {

            });
            $(javatmp.settings.defaultOutputSelector).on(javatmp.settings.javaTmpContainerRemoveEventName, function (event) {

            });
        });
    </script>
</div>