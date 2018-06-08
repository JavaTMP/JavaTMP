<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="dynamic-ajax-content">
    <div class="page-header">
        <h1>Block UI Plugin</h1>
    </div>
    <div class="row">
        <div class="col-lg-12">
            <div class="alert alert-info">
                <p>The jQuery BlockUI Plugin lets you simulate synchronous behavior when using AJAX,
                    without locking the browser . When activated, it will prevent user activity with the page
                    (or part of the page) until it is deactivated. BlockUI adds elements to the DOM to give
                    it both the appearance and behavior of blocking user interaction.
                </p>
                <p>
                    <a class="btn btn-info" target="_blank" href="http://malsup.com/jquery/block/">
                        <i class="fa fa-external-link-alt fa-fw"></i>
                        Demo Page
                    </a>
                    <a class="btn btn-info" target="_blank" href="https://github.com/malsup/blockui/">
                        <i class="fa fa-external-link-alt fa-fw"></i>github.com Page
                    </a>
                </p>
            </div>
            <button type="button" id="start-blockui-on-card" class="btn btn-default">Start BlockUI on Card</button>
            <button type="button" id="start-blockui-on-card-body" class="btn btn-primary">Start BlockUI on Card's Body</button>
            <button type="button" id="stop-all-blockui" class="btn btn-success">Stop ALL</button>
        </div>
    </div>
    <div class="row">
        <div class="col-lg-12">
            <div id="panel-with-blockui" class="card my-3">
                <div class="card-header">
                    Test Panel
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
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum tincidunt est vitae ultrices accumsan. Aliquam ornare lacus adipiscing, posuere lectus et, fringilla augue.</p>
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum tincidunt est vitae ultrices accumsan. Aliquam ornare lacus adipiscing, posuere lectus et, fringilla augue.</p>
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        jQuery(document).ready(function () {
            (function ($) {
                $("#start-blockui-on-card").on("click", function (event) {
                    $('#panel-with-blockui > .card-body').block({message: null,
                        overlayCSS: {
                            backgroundColor: '#f8f9fa',
                            opacity: 0.5
                        },
                        ignoreIfBlocked: true
                    });
                });
                $("#start-blockui-on-card-body").on("click", function (event) {
                    $('#panel-with-blockui .card-body').block({
                        message: '<div class="p-3" style="font-size: 2rem;"><i class="fa fa-sync fa-spin fa-fw"></i><span>Loading...</span></div>',
                        css: {border: '0px solid #a00'}
                    });
                });
                $("#stop-all-blockui").on("click", function (event) {
                    $('#panel-with-blockui .card-body').unblock();
                    $('#panel-with-blockui').unblock();
                });
            }(jQuery));
        });
    </script>
</div>