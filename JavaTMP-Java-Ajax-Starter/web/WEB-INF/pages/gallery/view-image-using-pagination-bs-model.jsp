<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="dynamic-ajax-content">
    <div class="page-header">
        <h1>View Image Using Pagination Bootstrap Model</h1>
    </div>
    <div class="row">
        <div class="col-lg-12">
            <div class="card my-3">
                <div class="card-header">
                    Example
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
                        <div class="col-lg-3 col-md-4 col-xs-6 gallery-item">
                            <a href="#galleryImg1" class="link-gallery" data-toggle="modal" data-target="#modalGallery" title="An old greenhouse">
                                <img class="img-thumbnail img-fluid img-gallery" src="assets/img/gallery/1.jpg" alt="An old greenhouse">
                            </a>
                        </div>
                        <div class="col-lg-3 col-md-4 col-xs-6 gallery-item">
                            <a href="#galleryImg1" class="link-gallery" data-toggle="modal" data-target="#modalGallery" title="Purple wildflowers">
                                <img class="img-thumbnail img-fluid img-gallery" src="assets/img/gallery/2.jpg" alt="Purple wildflowers">
                            </a>
                        </div>
                        <div class="col-lg-3 col-md-4 col-xs-6 gallery-item">
                            <a href="#galleryImg1" class="link-gallery" data-toggle="modal" data-target="#modalGallery" title="A birdfeeder">
                                <img class="img-thumbnail img-fluid img-gallery" src="assets/img/gallery/3.jpg" alt="A birdfeeder">
                            </a>
                        </div>
                        <div class="col-lg-3 col-md-4 col-xs-6 gallery-item">
                            <a href="#galleryImg1" class="link-gallery" data-toggle="modal" data-target="#modalGallery" title="The garden shop">
                                <img class="img-thumbnail img-fluid img-gallery" src="assets/img/gallery/4.jpg" alt="The garden shop">
                            </a>
                        </div>
                        <div class="col-lg-3 col-md-4 col-xs-6 gallery-item">
                            <a href="#galleryImg1" class="link-gallery" data-toggle="modal" data-target="#modalGallery" title="Spring daffodils">
                                <img class="img-thumbnail img-fluid img-gallery" src="assets/img/gallery/5.jpg" alt="Spring daffodils">
                            </a>
                        </div>
                        <div class="col-lg-3 col-md-4 col-xs-6 gallery-item">
                            <a href="#galleryImg1" class="link-gallery" data-toggle="modal" data-target="#modalGallery" title="Iris along the path">
                                <img class="img-thumbnail img-fluid img-gallery" src="assets/img/gallery/6.jpg" alt="Iris along the path">
                            </a>
                        </div>
                        <div class="col-lg-3 col-md-4 col-xs-6 gallery-item">
                            <a href="#galleryImg1" class="link-gallery" data-toggle="modal" data-target="#modalGallery" title="Butterfly">
                                <img class="img-thumbnail img-fluid img-gallery" src="assets/img/gallery/7.jpg" alt="Butterfly">
                            </a>
                        </div>
                        <div class="col-lg-3 col-md-4 col-xs-6 gallery-item">
                            <a href="#galleryImg1" class="link-gallery" data-toggle="modal" data-target="#modalGallery" title="The garden blueprint">
                                <img class="img-thumbnail img-fluid img-gallery" src="assets/img/gallery/8.jpg" alt="The garden blueprint">
                            </a>
                        </div>
                        <div class="col-lg-3 col-md-4 col-xs-6 gallery-item">
                            <a href="#galleryImg1" class="link-gallery" data-toggle="modal" data-target="#modalGallery" title="The patio">
                                <img class="img-thumbnail img-fluid img-gallery" src="assets/img/gallery/9.jpg" alt="The patio">
                            </a>
                        </div>
                        <div class="col-lg-3 col-md-4 col-xs-6 gallery-item">
                            <a href="#galleryImg1" class="link-gallery" data-toggle="modal" data-target="#modalGallery" title="Crocus close-up">
                                <img class="img-thumbnail img-fluid img-gallery" src="assets/img/gallery/10.jpg" alt="Crocus close-up">
                            </a>
                        </div>
                        <div class="col-lg-3 col-md-4 col-xs-6 gallery-item">
                            <a href="#galleryImg1" class="link-gallery" data-toggle="modal" data-target="#modalGallery" title="Bumble bee collecting nectar">
                                <img class="img-thumbnail img-fluid img-gallery" src="assets/img/gallery/11.jpg" alt="Bumble bee collecting nectar">
                            </a>
                        </div>
                        <div class="col-lg-3 col-md-4 col-xs-6 gallery-item">
                            <a href="#galleryImg1" class="link-gallery" data-toggle="modal" data-target="#modalGallery" title="Winding garden path">
                                <img class="img-thumbnail img-fluid img-gallery" src="assets/img/gallery/12.jpg" alt="Winding garden path">
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="modalGallery" tabindex="-1" role="dialog" aria-labelledby="modalGalleryLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title" id="modalGalleryLabel">Gallery</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                </div> <!-- /.modal-header -->

                <div class="modal-body text-center p-1">
                    <div id="carouselGallery" class="carousel slide" data-ride="carousel" data-interval="false">
                        <div class="carousel-inner">
                        </div> <!-- /.carousel-inner -->
                    </div> <!-- /.carousel -->
                </div> <!-- /.modal-body -->
                <div class="modal-footer d-flex justify-content-center">
                    <ul class="pagination flex-wrap">
                    </ul>
                </div> <!-- /.modal-footer -->
            </div> <!-- /.modal-content -->
        </div> <!-- /.modal-dialog -->
    </div> <!-- /.modal -->
    <!--<link href="components/" rel="stylesheet">-->
    <style type="text/css">
        .gallery{
            margin-top: 100px;
        }
        .gallery-item{
            margin-bottom: 30px;
        }
        .modal-footer{
            text-align: center;
        }
        .pagination{
            margin: 0;
        }
    </style>
    <!--<script src="components/"></script>-->
    <script type="text/javascript">
        jQuery(document).ready(function () {
            (function ($) {
                $('.link-gallery').click(function () {
                    var galleryId = $(this).attr('data-target');
                    var currentLinkIndex = $(this).index('a[data-target="' + galleryId + '"]');

                    createGallery(galleryId, currentLinkIndex);
                    createPagination(galleryId, currentLinkIndex);

                    $(galleryId).on('hidden.bs.modal', function () {
                        destroyGallry(galleryId);
                        destroyPagination(galleryId);
                    });

                    $(galleryId + ' .carousel').on('slid.bs.carousel', function () {
                        var currentSlide = $(galleryId + ' .carousel .carousel-item.active');
                        var currentSlideIndex = currentSlide.index(galleryId + ' .carousel .carousel-item');

                        setTitle(galleryId, currentSlideIndex);
                        setPagination(++currentSlideIndex, true);
                    })
                });

                function createGallery(galleryId, currentSlideIndex) {
                    var galleryBox = $(galleryId + ' .carousel-inner');

                    $('a[data-target="' + galleryId + '"]').each(function () {
                        var img = $(this).html();
                        var galleryItem = $('<div class="carousel-item">' + img + '</div>');

                        galleryItem.appendTo(galleryBox);
                    });

                    galleryBox.children('.carousel-item').eq(currentSlideIndex).addClass('active');
                    setTitle(galleryId, currentSlideIndex);
                }

                function destroyGallry(galleryId) {
                    $(galleryId + ' .carousel-inner').html("");
                }
                function createPagination(galleryId, currentSlideIndex) {
                    var pagination = $(galleryId + ' .pagination');
                    var carouselId = $(galleryId).find('.carousel').attr('id');
                    var prevLink = $('<li class="page-item"><a class="page-link" href="#' + carouselId + '" data-slide="prev">«</a></li>');
                    var nextLink = $('<li class="page-item"><a class="page-link" href="#' + carouselId + '" data-slide="next">»</a></li>');

                    prevLink.appendTo(pagination);
                    nextLink.appendTo(pagination);

                    $('a[data-target="' + galleryId + '"]').each(function () {
                        var linkIndex = $(this).index('a[data-target="' + galleryId + '"]');
                        var paginationLink = $('<li class="page-item"><a class="page-link" href="#" data-target="#carouselGallery" data-slide-to="' + linkIndex + '">' + (linkIndex + 1) + '</a></li>');

                        paginationLink.insertBefore('.pagination li:last-child');
                    });
                    setPagination(++currentSlideIndex);
                }

                function setPagination(currentSlideIndex, reset = false) {
                    if (reset) {
                        $('.pagination li').removeClass('active');
                    }

                    $('.pagination li').eq(currentSlideIndex).addClass('active');
                }

                function destroyPagination(galleryId) {
                    $(galleryId + ' .pagination').html("");
                }

                function setTitle(galleryId, currentSlideIndex) {
                    var imgAlt = $(galleryId + ' .carousel-item').eq(currentSlideIndex).find('img').attr('alt');

                    $('.modal-title').text(imgAlt);
                }
            }(jQuery));
        });
    </script>
</div>