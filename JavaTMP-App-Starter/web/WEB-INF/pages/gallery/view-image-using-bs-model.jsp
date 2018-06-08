<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="dynamic-ajax-content">
    <div class="page-header">
        <h1>View Image Using Bootstrap Model</h1>
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
                        <div class="col-lg-3 col-md-4 col-xs-6">
                            <a href="${pageContext.request.contextPath}/assets/img/gallery/1.jpg" class="thumbnail" title="An old greenhouse">
                                <img class="img-thumbnail img-fluid my-1" src="${pageContext.request.contextPath}/assets/img/gallery/1.jpg" alt="An old greenhouse">
                            </a>
                        </div>
                        <div class="col-lg-3 col-md-4 col-xs-6">
                            <a href="${pageContext.request.contextPath}/assets/img/gallery/2.jpg" class="thumbnail" title="Purple wildflowers">
                                <img class="img-thumbnail img-fluid my-1" src="${pageContext.request.contextPath}/assets/img/gallery/2.jpg" alt="Purple wildflowers">
                            </a>
                        </div>
                        <div class="col-lg-3 col-md-4 col-xs-6">
                            <a href="${pageContext.request.contextPath}/assets/img/gallery/3.jpg" class="thumbnail" title="A birdfeeder">
                                <img class="img-thumbnail img-fluid my-1" src="${pageContext.request.contextPath}/assets/img/gallery/3.jpg" alt="A birdfeeder">
                            </a>
                        </div>
                        <div class="col-lg-3 col-md-4 col-xs-6">
                            <a href="${pageContext.request.contextPath}/assets/img/gallery/4.jpg" class="thumbnail" title="The garden shop">
                                <img class="img-thumbnail img-fluid my-1" src="${pageContext.request.contextPath}/assets/img/gallery/4.jpg" alt="The garden shop">
                            </a>
                        </div>
                        <div class="col-lg-3 col-md-4 col-xs-6">
                            <a href="${pageContext.request.contextPath}/assets/img/gallery/5.jpg" class="thumbnail" title="Spring daffodils">
                                <img class="img-thumbnail img-fluid my-1" src="${pageContext.request.contextPath}/assets/img/gallery/5.jpg" alt="Spring daffodils">
                            </a>
                        </div>
                        <div class="col-lg-3 col-md-4 col-xs-6">
                            <a href="${pageContext.request.contextPath}/assets/img/gallery/6.jpg" class="thumbnail" title="Iris along the path">
                                <img class="img-thumbnail img-fluid my-1" src="${pageContext.request.contextPath}/assets/img/gallery/6.jpg" alt="Iris along the path">
                            </a>
                        </div>
                        <div class="col-lg-3 col-md-4 col-xs-6">
                            <a href="${pageContext.request.contextPath}/assets/img/gallery/7.jpg" class="thumbnail" title="Butterfly">
                                <img class="img-thumbnail img-fluid my-1" src="${pageContext.request.contextPath}/assets/img/gallery/7.jpg" alt="Butterfly">
                            </a>
                        </div>
                        <div class="col-lg-3 col-md-4 col-xs-6">
                            <a href="${pageContext.request.contextPath}/assets/img/gallery/8.jpg" class="thumbnail" title="The garden blueprint">
                                <img class="img-thumbnail img-fluid my-1" src="${pageContext.request.contextPath}/assets/img/gallery/8.jpg" alt="The garden blueprint">
                            </a>
                        </div>
                        <div class="col-lg-3 col-md-4 col-xs-6">
                            <a href="${pageContext.request.contextPath}/assets/img/gallery/9.jpg" class="thumbnail" title="The patio">
                                <img class="img-thumbnail img-fluid my-1" src="${pageContext.request.contextPath}/assets/img/gallery/9.jpg" alt="The patio">
                            </a>
                        </div>
                        <div class="col-lg-3 col-md-4 col-xs-6">
                            <a href="${pageContext.request.contextPath}/assets/img/gallery/10.jpg" class="thumbnail" title="Crocus close-up">
                                <img class="img-thumbnail img-fluid my-1" src="${pageContext.request.contextPath}/assets/img/gallery/10.jpg" alt="Crocus close-up">
                            </a>
                        </div>
                        <div class="col-lg-3 col-md-4 col-xs-6">
                            <a href="${pageContext.request.contextPath}/assets/img/gallery/11.jpg" class="thumbnail" title="Bumble bee collecting nectar">
                                <img class="img-thumbnail img-fluid my-1" src="${pageContext.request.contextPath}/assets/img/gallery/11.jpg" alt="Bumble bee collecting nectar">
                            </a>
                        </div>
                        <div class="col-lg-3 col-md-4 col-xs-6">
                            <a href="${pageContext.request.contextPath}/assets/img/gallery/12.jpg" class="thumbnail" title="Winding garden path">
                                <img class="img-thumbnail img-fluid my-1" src="${pageContext.request.contextPath}/assets/img/gallery/12.jpg" alt="Winding garden path">
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div tabindex="-1" class="modal fade" id="myModal" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <p class="modal-title">Heading</p>
                    <button class="close" type="button" data-dismiss="modal">×</button>
                </div>
                <div class="modal-body">
                    <img id="image-gallery-image" class="img-thumbnail img-fluid" style="margin-left: auto; margin-right: auto;" src=""/>
                </div>
                <div class="modal-footer">
                    <button class="btn btn-primary" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
    <!--<link href="components/" rel="stylesheet">-->
    <style type="text/css">

    </style>
    <!--<script src="components/"></script>-->
    <script type="text/javascript">
        jQuery(document).ready(function () {
            (function ($) {
                $('a.thumbnail').click(function (e) {
                    e.preventDefault();
//                    $('.modal-body').empty();
                    var title = $(this).attr("title");
                    $('.modal-title').html(title);
                    $('#image-gallery-image').attr('src', $(this).attr("href"));
                    $('#myModal').modal({show: true});
                });
            }(jQuery));
        });
    </script>
</div>