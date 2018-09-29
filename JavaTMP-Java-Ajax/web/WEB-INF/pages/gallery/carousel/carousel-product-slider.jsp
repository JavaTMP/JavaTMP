<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="dynamic-ajax-content">
    <h4 class="my-3">Carousel Product Slider</h4>
    <hr/>
    <div class="row">
        <div class="col-lg-12">
            <div class="card my-3">
                <div class="card-header">
                    4 Products Per Slide
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
                        <div class="col-12 mb-3">
                            <h4 class="mr-auto float-left">Latest Products:</h4>
                            <div class="ml-auto controls float-right hidden-xs">
                                <a class="left fa fa-chevron-prev btn btn-primary" href="#carousel-example" data-slide="prev"></a>
                                <a class="right fa fa-chevron-next btn btn-primary" href="#carousel-example" data-slide="next"></a>
                            </div>
                        </div>
                    </div>
                    <div id="carousel-example" class="carousel slide hidden-xs" data-ride="carousel">
                        <!-- Wrapper for slides -->
                        <div class="carousel-inner">
                            <div class="carousel-item active">
                                <div class="row">
                                    <div class="col-sm-3">
                                        <div class="card">
                                            <img class="card-img-top" alt="100%x180" src="${pageContext.request.contextPath}/assets/img/400x230.png" data-holder-rendered="true">
                                            <div class="card-body">
                                                <h4 class="card-title">Product 1</h4>
                                                <h6 class="card-subtitle mb-2 text-muted">$149.99</h6>
                                                <div class="card-subtitle mb-2 text-muted">
                                                    <i class="text-primary fa fa-star"></i>
                                                    <i class="text-primary fa fa-star"></i>
                                                    <i class="text-primary fa fa-star"></i>
                                                    <i class="text-primary fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                </div>
                                                <p class="card-text"><small class="text-muted">Some quick example text to build on the card title and make up the bulk of the card's content</small></p>
                                                <a href="#" class="btn btn-primary btn-block">Add to cart</a>
                                                <a href="#" class="btn btn-primary btn-block">More details</a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="card">
                                            <img class="card-img-top" alt="100%x180" src="${pageContext.request.contextPath}/assets/img/400x230.png" data-holder-rendered="true">
                                            <div class="card-body">
                                                <h4 class="card-title">Product 1</h4>
                                                <h6 class="card-subtitle mb-2 text-muted">$149.99</h6>
                                                <div class="card-subtitle mb-2 text-muted">
                                                    <i class="text-primary fa fa-star"></i>
                                                    <i class="text-primary fa fa-star"></i>
                                                    <i class="text-primary fa fa-star"></i>
                                                    <i class="text-primary fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                </div>
                                                <p class="card-text"><small class="text-muted">Some quick example text to build on the card title and make up the bulk of the card's content</small></p>
                                                <a href="#" class="btn btn-primary btn-block">Add to cart</a>
                                                <a href="#" class="btn btn-primary btn-block">More details</a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="card">
                                            <img class="card-img-top" alt="100%x180" src="${pageContext.request.contextPath}/assets/img/400x230.png" data-holder-rendered="true">
                                            <div class="card-body">
                                                <h4 class="card-title">Product 1</h4>
                                                <h6 class="card-subtitle mb-2 text-muted">$149.99</h6>
                                                <div class="card-subtitle mb-2 text-muted">
                                                    <i class="text-primary fa fa-star"></i>
                                                    <i class="text-primary fa fa-star"></i>
                                                    <i class="text-primary fa fa-star"></i>
                                                    <i class="text-primary fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                </div>
                                                <p class="card-text"><small class="text-muted">Some quick example text to build on the card title and make up the bulk of the card's content</small></p>
                                                <a href="#" class="btn btn-primary btn-block">Add to cart</a>
                                                <a href="#" class="btn btn-primary btn-block">More details</a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="card">
                                            <img class="card-img-top" alt="100%x180" src="${pageContext.request.contextPath}/assets/img/400x230.png" data-holder-rendered="true">
                                            <div class="card-body">
                                                <h4 class="card-title">Product 1</h4>
                                                <h6 class="card-subtitle mb-2 text-muted">$149.99</h6>
                                                <div class="card-subtitle mb-2 text-muted">
                                                    <i class="text-primary fa fa-star"></i>
                                                    <i class="text-primary fa fa-star"></i>
                                                    <i class="text-primary fa fa-star"></i>
                                                    <i class="text-primary fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                </div>
                                                <p class="card-text"><small class="text-muted">Some quick example text to build on the card title and make up the bulk of the card's content</small></p>
                                                <a href="#" class="btn btn-primary btn-block">Add to cart</a>
                                                <a href="#" class="btn btn-primary btn-block">More details</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="carousel-item">
                                <div class="row">
                                    <div class="col-sm-3">
                                        <div class="card">
                                            <img class="card-img-top" alt="100%x180" src="${pageContext.request.contextPath}/assets/img/400x230.png" data-holder-rendered="true">
                                            <div class="card-body">
                                                <h4 class="card-title">Product 1</h4>
                                                <h6 class="card-subtitle mb-2 text-muted">$149.99</h6>
                                                <div class="card-subtitle mb-2 text-muted">
                                                    <i class="text-primary fa fa-star"></i>
                                                    <i class="text-primary fa fa-star"></i>
                                                    <i class="text-primary fa fa-star"></i>
                                                    <i class="text-primary fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                </div>
                                                <p class="card-text"><small class="text-muted">Some quick example text to build on the card title and make up the bulk of the card's content</small></p>
                                                <a href="#" class="btn btn-primary btn-block">Add to cart</a>
                                                <a href="#" class="btn btn-primary btn-block">More details</a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="card">
                                            <img class="card-img-top" alt="100%x180" src="${pageContext.request.contextPath}/assets/img/400x230.png" data-holder-rendered="true">
                                            <div class="card-body">
                                                <h4 class="card-title">Product 1</h4>
                                                <h6 class="card-subtitle mb-2 text-muted">$149.99</h6>
                                                <div class="card-subtitle mb-2 text-muted">
                                                    <i class="text-primary fa fa-star"></i>
                                                    <i class="text-primary fa fa-star"></i>
                                                    <i class="text-primary fa fa-star"></i>
                                                    <i class="text-primary fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                </div>
                                                <p class="card-text"><small class="text-muted">Some quick example text to build on the card title and make up the bulk of the card's content</small></p>
                                                <a href="#" class="btn btn-primary btn-block">Add to cart</a>
                                                <a href="#" class="btn btn-primary btn-block">More details</a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="card">
                                            <img class="card-img-top" alt="100%x180" src="${pageContext.request.contextPath}/assets/img/400x230.png" data-holder-rendered="true">
                                            <div class="card-body">
                                                <h4 class="card-title">Product 1</h4>
                                                <h6 class="card-subtitle mb-2 text-muted">$149.99</h6>
                                                <div class="card-subtitle mb-2 text-muted">
                                                    <i class="text-primary fa fa-star"></i>
                                                    <i class="text-primary fa fa-star"></i>
                                                    <i class="text-primary fa fa-star"></i>
                                                    <i class="text-primary fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                </div>
                                                <p class="card-text"><small class="text-muted">Some quick example text to build on the card title and make up the bulk of the card's content</small></p>
                                                <a href="#" class="btn btn-primary btn-block">Add to cart</a>
                                                <a href="#" class="btn btn-primary btn-block">More details</a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="card">
                                            <img class="card-img-top" alt="100%x180" src="${pageContext.request.contextPath}/assets/img/400x230.png" data-holder-rendered="true">
                                            <div class="card-body">
                                                <h4 class="card-title">Product 1</h4>
                                                <h6 class="card-subtitle mb-2 text-muted">$149.99</h6>
                                                <div class="card-subtitle mb-2 text-muted">
                                                    <i class="text-primary fa fa-star"></i>
                                                    <i class="text-primary fa fa-star"></i>
                                                    <i class="text-primary fa fa-star"></i>
                                                    <i class="text-primary fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                </div>
                                                <p class="card-text"><small class="text-muted">Some quick example text to build on the card title and make up the bulk of the card's content</small></p>
                                                <a href="#" class="btn btn-primary btn-block">Add to cart</a>
                                                <a href="#" class="btn btn-primary btn-block">More details</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="card my-3">
                <div class="card-header">
                    3 Products Per Slide
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
                        <div class="col-md-9">
                            <h3>3 Products Per Slide</h3>
                        </div>
                        <div class="col-md-3">
                            <!-- Controls -->
                            <div class="controls float-right hidden-xs">
                                <a class="left fa fa-chevron-prev btn btn-primary" href="#carousel-example-generic"
                                   data-slide="prev"></a>
                                <a class="right fa fa-chevron-next btn btn-primary" href="#carousel-example-generic"
                                   data-slide="next"></a>
                            </div>
                        </div>
                    </div>
                    <div id="carousel-example-generic" class="carousel slide hidden-xs" data-ride="carousel">
                        <!-- Wrapper for slides -->
                        <div class="carousel-inner">
                            <div class="carousel-item active">
                                <div class="row">
                                    <div class="col-sm-4">
                                        <div class="card">
                                            <img class="card-img-top" alt="100%x180" src="${pageContext.request.contextPath}/assets/img/400x230.png" data-holder-rendered="true">
                                            <div class="card-body">
                                                <h4 class="card-title">Product 1</h4>
                                                <h6 class="card-subtitle mb-2 text-muted">$149.99</h6>
                                                <div class="card-subtitle mb-2 text-muted">
                                                    <i class="text-primary fa fa-star"></i>
                                                    <i class="text-primary fa fa-star"></i>
                                                    <i class="text-primary fa fa-star"></i>
                                                    <i class="text-primary fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                </div>
                                                <p class="card-text"><small class="text-muted">Some quick example text to build on the card title and make up the bulk of the card's content</small></p>
                                                <a href="#" class="btn btn-primary btn-block">Add to cart</a>
                                                <a href="#" class="btn btn-primary btn-block">More details</a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-4">
                                        <div class="card">
                                            <img class="card-img-top" alt="100%x180" src="${pageContext.request.contextPath}/assets/img/400x230.png" data-holder-rendered="true">
                                            <div class="card-body">
                                                <h4 class="card-title">Product 1</h4>
                                                <h6 class="card-subtitle mb-2 text-muted">$149.99</h6>
                                                <div class="card-subtitle mb-2 text-muted">
                                                    <i class="text-primary fa fa-star"></i>
                                                    <i class="text-primary fa fa-star"></i>
                                                    <i class="text-primary fa fa-star"></i>
                                                    <i class="text-primary fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                </div>
                                                <p class="card-text"><small class="text-muted">Some quick example text to build on the card title and make up the bulk of the card's content</small></p>
                                                <a href="#" class="btn btn-primary btn-block">Add to cart</a>
                                                <a href="#" class="btn btn-primary btn-block">More details</a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-4">
                                        <div class="card">
                                            <img class="card-img-top" alt="100%x180" src="${pageContext.request.contextPath}/assets/img/400x230.png" data-holder-rendered="true">
                                            <div class="card-body">
                                                <h4 class="card-title">Product 1</h4>
                                                <h6 class="card-subtitle mb-2 text-muted">$149.99</h6>
                                                <div class="card-subtitle mb-2 text-muted">
                                                    <i class="text-primary fa fa-star"></i>
                                                    <i class="text-primary fa fa-star"></i>
                                                    <i class="text-primary fa fa-star"></i>
                                                    <i class="text-primary fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                </div>
                                                <p class="card-text"><small class="text-muted">Some quick example text to build on the card title and make up the bulk of the card's content</small></p>
                                                <a href="#" class="btn btn-primary btn-block">Add to cart</a>
                                                <a href="#" class="btn btn-primary btn-block">More details</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="carousel-item">
                                <div class="row">
                                    <div class="col-sm-4">
                                        <div class="card">
                                            <img class="card-img-top" alt="100%x180" src="${pageContext.request.contextPath}/assets/img/400x230.png" data-holder-rendered="true">
                                            <div class="card-body">
                                                <h4 class="card-title">Product 1</h4>
                                                <h6 class="card-subtitle mb-2 text-muted">$149.99</h6>
                                                <div class="card-subtitle mb-2 text-muted">
                                                    <i class="text-primary fa fa-star"></i>
                                                    <i class="text-primary fa fa-star"></i>
                                                    <i class="text-primary fa fa-star"></i>
                                                    <i class="text-primary fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                </div>
                                                <p class="card-text"><small class="text-muted">Some quick example text to build on the card title and make up the bulk of the card's content</small></p>
                                                <a href="#" class="btn btn-primary btn-block">Add to cart</a>
                                                <a href="#" class="btn btn-primary btn-block">More details</a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-4">
                                        <div class="card">
                                            <img class="card-img-top" alt="100%x180" src="${pageContext.request.contextPath}/assets/img/400x230.png" data-holder-rendered="true">
                                            <div class="card-body">
                                                <h4 class="card-title">Product 1</h4>
                                                <h6 class="card-subtitle mb-2 text-muted">$149.99</h6>
                                                <div class="card-subtitle mb-2 text-muted">
                                                    <i class="text-primary fa fa-star"></i>
                                                    <i class="text-primary fa fa-star"></i>
                                                    <i class="text-primary fa fa-star"></i>
                                                    <i class="text-primary fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                </div>
                                                <p class="card-text"><small class="text-muted">Some quick example text to build on the card title and make up the bulk of the card's content</small></p>
                                                <a href="#" class="btn btn-primary btn-block">Add to cart</a>
                                                <a href="#" class="btn btn-primary btn-block">More details</a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-4">
                                        <div class="card">
                                            <img class="card-img-top" alt="100%x180" src="${pageContext.request.contextPath}/assets/img/400x230.png" data-holder-rendered="true">
                                            <div class="card-body">
                                                <h4 class="card-title">Product 1</h4>
                                                <h6 class="card-subtitle mb-2 text-muted">$149.99</h6>
                                                <div class="card-subtitle mb-2 text-muted">
                                                    <i class="text-primary fa fa-star"></i>
                                                    <i class="text-primary fa fa-star"></i>
                                                    <i class="text-primary fa fa-star"></i>
                                                    <i class="text-primary fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                </div>
                                                <p class="card-text"><small class="text-muted">Some quick example text to build on the card title and make up the bulk of the card's content</small></p>
                                                <a href="#" class="btn btn-primary btn-block">Add to cart</a>
                                                <a href="#" class="btn btn-primary btn-block">More details</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
    <style type="text/css">
    </style>
    <script type="text/javascript">
        jQuery(function ($) {
            // any code put here will be run after content attach to ajax output container and before
            // controll return to main javascript file.
            $('#carousel-example').carousel({
                interval: 2500,
                wrap: true
            });
            $('#carousel-example-generic').carousel({
                interval: 2500,
                wrap: true
            });

            $(javatmp.settings.defaultOutputSelector).on(javatmp.settings.javaTmpAjaxContainerReady, function (event) {
                // fire AFTER all transition done and your ajax content is shown to user.
            });

            $(javatmp.settings.defaultOutputSelector).on(javatmp.settings.javaTmpContainerResizeEventName, function (event) {
                // fire when user resize browser window or sidebar hide / show
            });
            $(javatmp.settings.defaultOutputSelector).on(javatmp.settings.cardFullscreenCompress, function (event, card) {
                // when card compress by pressing the top right tool button
            });
            $(javatmp.settings.defaultOutputSelector).on(javatmp.settings.cardFullscreenExpand, function (event, card) {
                // when card Expand by pressing the top right tool button
            });

            /**
             * When another sidebar menu item pressed and before container replaced with new ajax content.
             * You can cancel, destroy, or remove any thing here before replace main output ajax container.
             * returning false will cancel the new request and do nothing.
             **/
            $(javatmp.settings.defaultOutputSelector).on(javatmp.settings.javaTmpContainerRemoveEventName, function (event) {
                $(javatmp.settings.defaultOutputSelector).off(javatmp.settings.cardFullscreenCompress);
                $(javatmp.settings.defaultOutputSelector).off(javatmp.settings.cardFullscreenExpand);
                return true;
            });
        });
    </script>
</div>