<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="dynamic-ajax-content grid-gutter-padding">
    <h2 class="text-primary text-truncate my-3">Two Columns Blank Page Title</h2>
    <div class="row d-flex justify-content-center">
        <div class="col-lg-10">
            <div class="row">
                <div class="col-sm-4 col-md bg-primary text-light p-5">Sidebar Column</div>
                <div class="col-sm-8 bg-secondary text-light p-5">Main Content Column</div>
            </div>
        </div>
    </div>
    <hr/>
    <h2 class="text-primary text-truncate pt-1 my-3">Fixed and Fluid Bootstrap 4</h2>
    <div class="form-row">
        <div class="col-md-4 col-12 col-fixed-md-20">
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
            <h2>Main Title Or Header Information</h2>
            <p>This column is fluid width.</p>
            <div class="form-row">
                <div class="col-lg-4 col-12">
                    <div class="card card-body">
                        <h2 class="text-center">
                            <span class="badge badge-danger">Snippets</span></h2>
                        <h1 class="text-center">311</h1>
                    </div>
                </div>
                <div class="col-lg-4 col-12">
                    <div class="card card-body">
                        <h2 class="text-center">
                            <span class="badge badge-danger">Downloads</span>
                        </h2>
                        <h1 class="text-center">982</h1>
                    </div>
                </div>
                <div class="col-lg-4 col-12">
                    <div class="card card-body">
                        <h2 class="text-center">
                            <span class="badge badge-danger">Sales</span>
                        </h2>
                        <h1 class="text-center">112</h1>
                    </div>
                </div>
            </div>
            <!--/row-->
        </div>
    </div>
    <hr/>
    <h2 class="text-primary text-truncate pt-1 my-3">Fixed columns Size</h2>
    <div class="row demo-col-fixed  d-flex justify-content-center">
        <div class="my-3 col-fixed-sm col-sm col-fixed-md col-md col-fixed-lg col-lg col-fixed-xl col-xl">
            <div class="card card-body border border-primary"></div>
        </div>
        <div class="my-3 col-fixed-sm col-sm col-fixed-md col-md col-fixed-lg col-lg col-fixed-xl col-xl">
            <div class="card card-body border border-primary"></div>
        </div>
        <div class="my-3 col-fixed-sm col-sm col-fixed-md col-md col-fixed-lg col-lg col-fixed-xl col-xl">
            <div class="card card-body border border-primary"></div>
        </div>
        <div class="my-3 col-fixed-sm col-sm col-fixed-md col-md col-fixed-lg col-lg col-fixed-xl col-xl">
            <div class="card card-body border border-primary"></div>
        </div>
    </div>
    <style type="text/css">
        .demo-col-fixed div {
            height: 250px;
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