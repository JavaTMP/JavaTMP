<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="dynamic-ajax-content">
    <div class="page-header">
        <h1>jQuery Magnific Popup Plugin</h1>
    </div>
    <div class="row">
        <div class="col-lg-12">
            <div class="alert alert-info">
                <p>Light and responsive lightbox script with focus on performance.</p>
                <p>
                    <a target="_blank" class="btn btn-info" href="http://dimsemenov.com/plugins/magnific-popup/">Demo Site</a>
                    <a target="_blank" class="btn btn-info" href="https://github.com/dimsemenov/Magnific-Popup">github source code</a>
                    <a target="_blank" class="btn btn-info" href="https://www.smashingmagazine.com/2013/05/truly-responsive-lightbox/">Extra article</a>
                </p>
            </div>
            <div class="card my-3">
                <div class="card-header">
                    Gallery Example
                    <div class="options float-right">
                        <a class="settings"><i class="fa fa-cog"></i></a>
                        <a href="#" class="collapse"><i class="fa fa-chevron-up"></i></a>
                        <a href="#" class="reload"><i class="fa fa-sync"></i></a>
                        <a href="#" class="fullscreen"><i class=" fa fa-expand"></i></a>
                        <a href="#" class="remove"><i class="fa fa-times"></i></a>
                    </div>
                </div>
                <div class="card-body">
                    <div class="row magnific-popup-parent-container">
                        <div class="col-lg-3 col-md-4">
                            <a href="assets/img/gallery/1.jpg" data-gallery="data-gallery" title="An old greenhouse">
                                <img class="img-thumbnail img-fluid my-1" src="assets/img/gallery/1.jpg" alt="An old greenhouse">
                            </a>
                        </div>
                        <div class="col-lg-3 col-md-4">
                            <a href="assets/img/gallery/2.jpg" data-gallery="data-gallery" title="Purple wildflowers">
                                <img class="img-thumbnail img-fluid my-1" src="assets/img/gallery/2.jpg" alt="Purple wildflowers">
                            </a>
                        </div>
                        <div class="col-lg-3 col-md-4">
                            <a href="assets/img/gallery/3.jpg" data-gallery="data-gallery" title="A birdfeeder">
                                <img class="img-thumbnail img-fluid my-1" src="assets/img/gallery/3.jpg" alt="A birdfeeder">
                            </a>
                        </div>
                        <div class="col-lg-3 col-md-4">
                            <a href="assets/img/gallery/4.jpg" data-gallery="data-gallery" title="The garden shop">
                                <img class="img-thumbnail img-fluid my-1" src="assets/img/gallery/4.jpg" alt="The garden shop">
                            </a>
                        </div>
                        <div class="col-lg-3 col-md-4">
                            <a href="assets/img/gallery/5.jpg" data-gallery="data-gallery" title="Spring daffodils">
                                <img class="img-thumbnail img-fluid my-1" src="assets/img/gallery/5.jpg" alt="Spring daffodils">
                            </a>
                        </div>
                        <div class="col-lg-3 col-md-4">
                            <a href="assets/img/gallery/6.jpg" data-gallery="data-gallery" title="Iris along the path">
                                <img class="img-thumbnail img-fluid my-1" src="assets/img/gallery/6.jpg" alt="Iris along the path">
                            </a>
                        </div>
                        <div class="col-lg-3 col-md-4">
                            <a href="assets/img/gallery/7.jpg" data-gallery="data-gallery" title="Butterfly">
                                <img class="img-thumbnail img-fluid my-1" src="assets/img/gallery/7.jpg" alt="Butterfly">
                            </a>
                        </div>
                        <div class="col-lg-3 col-md-4">
                            <a href="assets/img/gallery/8.jpg" data-gallery="data-gallery" title="The garden blueprint">
                                <img class="img-thumbnail img-fluid my-1" src="assets/img/gallery/8.jpg" alt="The garden blueprint">
                            </a>
                        </div>
                        <div class="col-lg-3 col-md-4">
                            <a href="assets/img/gallery/9.jpg" data-gallery="data-gallery" title="The patio">
                                <img class="img-thumbnail img-fluid my-1" src="assets/img/gallery/9.jpg" alt="The patio">
                            </a>
                        </div>
                        <div class="col-lg-3 col-md-4">
                            <a href="assets/img/gallery/10.jpg" data-gallery="data-gallery" title="Crocus close-up">
                                <img class="img-thumbnail img-fluid my-1" src="assets/img/gallery/10.jpg" alt="Crocus close-up">
                            </a>
                        </div>
                        <div class="col-lg-3 col-md-4">
                            <a href="assets/img/gallery/11.jpg" data-gallery="data-gallery" title="Bumble bee collecting nectar">
                                <img class="img-thumbnail img-fluid my-1" src="assets/img/gallery/11.jpg" alt="Bumble bee collecting nectar">
                            </a>
                        </div>
                        <div class="col-lg-3 col-md-4">
                            <a href="assets/img/gallery/12.jpg" data-gallery="data-gallery" title="Winding garden path">
                                <img class="img-thumbnail img-fluid my-1" src="assets/img/gallery/12.jpg" alt="Winding garden path">
                            </a>
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
                $('.magnific-popup-parent-container').magnificPopup({
                    delegate: 'a', // child items selector, by clicking on it popup will open
                    type: 'image',
                    // other options
                    gallery: {
                        enabled: true
                    }
                });
            }(jQuery));
        });
    </script>
</div>