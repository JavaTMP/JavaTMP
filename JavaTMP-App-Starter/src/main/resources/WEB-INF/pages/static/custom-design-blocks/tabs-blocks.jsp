<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="dynamic-ajax-content">
    <h4 class="m-3">Tabs Blocks</h4>
    <hr class="mx-3"/>
    <div class="row">
        <div class="col-lg-12">
            <section class="pt-5 pb-5" style="min-height: 70vh;">
                <div class="container-fluid">
                    <div class="row justify-content-between">
                        <div class="col col-md-12 pr-md-5 pl-md-5">
                            <div class="bd-example bd-example-tabs">
                                <ul class="nav nav-pills  flex-column justify-content-center flex-sm-row mb-3" id="pills-tab" role="tablist">
                                    <li class="  border border-light bg-light rounded text-sm-center nav-item mr-md-1">
                                        <a class="nav-link pt-md-3 pb-md-3 pr-md-5 pl-md-5 active show" id="pills-home-tab" data-toggle="pill" href="#pills-home" role="tab" aria-controls="pills-home" aria-selected="true">
                                            <i class="fa fa-laptop fa-lg " aria-hidden="true"></i> Home</a>
                                    </li>
                                    <li class="  border border-light bg-light rounded text-sm-center mr-md-1 nav-item ">
                                        <a class="nav-link pt-md-3 pb-md-3 pr-md-5 pl-md-5" id="pills-profile-tab" data-toggle="pill" href="#pills-profile" role="tab" aria-controls="pills-profile" aria-selected="false">
                                            <i class="far fa-gem fa-lg mr-2" aria-hidden="true"></i> Profile</a>
                                    </li>
                                    <li class="  border border-light bg-light rounded text-sm-center  nav-item mr-md-1">
                                        <a class="nav-link pt-md-3 pb-md-3 pr-md-5 pl-md-5" id="pills-contact-tab" data-toggle="pill" href="#pills-contact" role="tab" aria-controls="pills-contact" aria-selected="false">
                                            <i class="fa fa-comments fa-lg " aria-hidden="true"></i> Contact</a>
                                    </li>
                                    <li class="  border border-light bg-light rounded text-sm-center mr-md-1 nav-item">
                                        <a class="nav-link pt-md-3 pb-md-3 pr-md-5 pl-md-5" id="pills-info-tab" data-toggle="pill" href="#pills-info" role="tab" aria-controls="pills-info" aria-selected="false">
                                            <i class="fa fa-code fa-lg " aria-hidden="true"></i> Info</a>
                                    </li>
                                </ul>
                                <div class="tab-content pt-5 pb-5" id="pills-tabContent">
                                    <div class="tab-pane fade active show" id="pills-home" role="tabpanel" aria-labelledby="pills-home-tab">
                                        <div class="container-fluid">
                                            <div class="row align-items-center justify-content-between">
                                                <div class="col-12 col-md-5  text-left">
                                                    <h2>Tab 1 Lorem ipsum efficitur </h2>
                                                    <p class=" mt-4">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis pharetra varius quam sit amet vulputate. Quisque mauris augue, molestie tincidunt condimentum vitae, gravida a libero. Aenean sit amet felis dolor, in sagittis nisi.
                                                    </p>
                                                    <blockquote class="card  text-left  py-3 px-4 mb-3 mt-4  ">
                                                        <div class="row align-items-center justify-content-between">
                                                            <div class="col-3  p-md-1 text-center rounded">
                                                                <img src="http://via.placeholder.com/80/5fa9f8/efefef" class="img-fluid py-0 rounded" alt="features">
                                                                <footer class="blockquote-footer small p-1"><span class="small">John Doe <cite class="font-weight-bold">COMPANY NAME</cite></span></footer>
                                                            </div>
                                                            <div class="col-9">
                                                                <p class=" m-0 text-muted small">
                                                                    Quisque mauris augue, molestie tincidunt condimentum vitae, gravida a libero. Aenean sit amet felis dolor, in sagittis nisi. Etiam sed iaculis libero, at euismod massain venenatis ligula. </p>
                                                                <i class="fa fa-quote-right fa-2x text-muted pull-right mt-3" aria-hidden="true"></i>
                                                            </div>
                                                        </div>
                                                    </blockquote>
                                                    <a href="javascript:;" class="btn btn-primary  btn-rounded shadow py-3 px-5 mt-md-3 mt-2">See all features</a>
                                                </div>
                                                <div class="col-12 col-md-5 mb-4 ml-md-auto">
                                                    <img alt="image" class="img-fluid img-center mr-auto ml-auto d-none d-md-block" src="http://via.placeholder.com/600/5fa9f8/efefef">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="tab-pane fade" id="pills-profile" role="tabpanel" aria-labelledby="pills-profile-tab">
                                        <div class="container-fluid">
                                            <div class="row align-items-center justify-content-between">
                                                <div class="col-12 col-md-5  text-left">
                                                    <h2>Tab 2 Lorem ipsum efficitur</h2>
                                                    <p class=" mt-4">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis pharetra varius quam sit amet vulputate. Quisque mauris augue, molestie tincidunt condimentum vitae, gravida a libero. Aenean sit amet felis dolor, in sagittis nisi.
                                                    </p>
                                                    <blockquote class="card  text-left  py-3 px-4 mb-3 mt-4  ">
                                                        <div class="row align-items-center justify-content-between">
                                                            <div class="col-3  p-md-1 text-center rounded">
                                                                <img src="http://via.placeholder.com/80/5fa9f8/efefef" class="img-fluid py-0 rounded" alt="features">
                                                                <footer class="blockquote-footer small p-1"><span class="small">John Doe <cite class="font-weight-bold">COMPANY NAME</cite></span></footer>
                                                            </div>
                                                            <div class="col-9">
                                                                <p class=" m-0 text-muted small">
                                                                    Quisque mauris augue, molestie tincidunt condimentum vitae, gravida a libero. Aenean sit amet felis dolor, in sagittis nisi.
                                                                </p>
                                                                <i class="fa fa-quote-right fa-2x text-muted pull-right mt-3" aria-hidden="true"></i>
                                                            </div>
                                                        </div>
                                                    </blockquote>
                                                    <a href="javascript:;" class="btn btn-primary  btn-rounded shadow py-3 px-5 mt-md-3 mt-2">See all features</a>
                                                </div>
                                                <div class="col-12 col-md-5 mb-4 ml-md-auto">
                                                    <img alt="image" class="img-fluid img-center mr-auto ml-auto d-none d-md-block" src="http://via.placeholder.com/600/5fa9f8/efefef">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="tab-pane fade" id="pills-contact" role="tabpanel" aria-labelledby="pills-contact-tab">
                                        <div class="container-fluid">
                                            <div class="row align-items-center justify-content-between">
                                                <div class="col-12 col-md-5  text-left">
                                                    <h2>Tab 3 Lorem ipsum sed erat</h2>
                                                    <p class=" mt-4">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis pharetra varius quam sit amet vulputate. Quisque mauris augue, molestie tincidunt condimentum vitae, gravida a libero. Aenean sit amet felis dolor, in sagittis nisi.
                                                    </p>
                                                    <blockquote class="card  text-left  py-3 px-4 mb-3 mt-4  ">
                                                        <div class="row align-items-center justify-content-between">
                                                            <div class="col-3  p-md-1 text-center rounded">
                                                                <img src="http://via.placeholder.com/80/5fa9f8/efefef" class="img-fluid py-0 rounded" alt="features">
                                                                <footer class="blockquote-footer small p-1"><span class="small">John Doe <cite class="font-weight-bold">COMPANY NAME</cite></span></footer>
                                                            </div>
                                                            <div class="col-9">
                                                                <p class=" m-0 text-muted small">
                                                                    Quisque mauris augue, molestie tincidunt condimentum vitae, gravida a libero. Aenean sit amet felis dolor, in sagittis nisi. Etiam sed iaculis libero, at euismod massain venenatis ligula.
                                                                </p>
                                                                <i class="fa fa-quote-right fa-2x text-muted pull-right mt-3" aria-hidden="true"></i>
                                                            </div>
                                                        </div>
                                                    </blockquote>
                                                    <a href="javascript:;" class="btn btn-primary  btn-rounded shadow py-3 px-5 mt-md-3 mt-2">See all features</a>
                                                </div>
                                                <div class="col-12 col-md-5 mb-4 ml-md-auto">
                                                    <img alt="image" class="img-fluid img-center mr-auto ml-auto d-none d-md-block" src="http://via.placeholder.com/600/5fa9f8/efefef">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="tab-pane fade" id="pills-info" role="tabpanel" aria-labelledby="pills-info-tab">
                                        <div class="container-fluid">
                                            <div class="row align-items-center justify-content-between">
                                                <div class="col-12 col-md-5  text-left">
                                                    <h2>Tab 4 Lorem ipsum efficitur </h2>
                                                    <p class=" mt-4">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis pharetra varius quam sit amet vulputate. Quisque mauris augue, molestie tincidunt condimentum vitae, gravida a libero. Aenean sit amet felis dolor, in sagittis nisi.
                                                    </p>
                                                    <blockquote class="card  text-left  py-3 px-4 mb-3 mt-4  ">
                                                        <div class="row align-items-center justify-content-between">
                                                            <div class="col-3  p-md-1 text-center rounded">
                                                                <img src="http://via.placeholder.com/80/5fa9f8/efefef" class="img-fluid py-0 rounded" alt="features">
                                                                <footer class="blockquote-footer small p-1"><span class="small">John Doe <cite class="font-weight-bold">COMPANY NAME</cite></span></footer>
                                                            </div>
                                                            <div class="col-9 position-relative">
                                                                <p class=" m-0 text-muted small">
                                                                    Aenean sit amet felis dolor, in sagittis nisi. Etiam sed iaculis libero, at euismod massain venenatis ligula.
                                                                </p>
                                                                <i class="fa fa-quote-right fa-2x text-muted pull-right mt-3" aria-hidden="true"></i>
                                                            </div>
                                                        </div>
                                                    </blockquote>
                                                    <a href="javascript:;" class="btn btn-primary  btn-rounded shadow py-3 px-5 mt-md-3 mt-2">See all features</a>
                                                </div>
                                                <div class="col-12 col-md-5 mb-4 ml-md-auto">
                                                    <img alt="image" class="img-fluid img-center mr-auto ml-auto d-none d-md-block" src="http://via.placeholder.com/600/5fa9f8/efefef">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <hr/>
            <section class="pt-0 pb-0 bg-light">
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col col-md-8 text-center">
                            <h2>HERE'S WHAT YOU GET</h2>
                            <p class="text-h3 lead mb-5">Vivamus sagittis lacus vel augue laoreet rutrum faucibus dolor auctor. Vivamus sagittis lacus vel augue laoreet rutrum faucibus dolor auctor. </p>
                        </div>
                        <div class="col-12">
                            <ul class="nav nav-pills  flex-column justify-content-center flex-sm-row mb-0" id="pills-tab1" role="tablist">
                                <li class="  border border-light bg-light rounded text-sm-center nav-item mr-md-1">
                                    <a class="nav-link pt-md-3 pb-md-3 pr-md-5 pl-md-5 shadow-sm active show" id="pills-home-tab1" data-toggle="pill" href="#pills-home1" role="tab" aria-controls="pills-home" aria-selected="true">
                                        <i class="fa fa-laptop fa-lg mr-2 " aria-hidden="true"></i>Responsive layouts</a>
                                </li>
                                <li class="  border border-light bg-light rounded text-sm-center mr-md-1 nav-item ">
                                    <a class="nav-link pt-md-3 pb-md-3 pr-md-5 pl-md-5 shadow-sm" id="pills-profile-tab1" data-toggle="pill" href="#pills-profile1" role="tab" aria-controls="pills-profile" aria-selected="false">
                                        <i class="far fa-gem fa-lg mr-2" aria-hidden="true"></i>Modern design</a>
                                </li>
                                <li class="  border border-light bg-light rounded text-sm-center  nav-item mr-md-1">
                                    <a class="nav-link pt-md-3 pb-md-3 pr-md-5 pl-md-5 shadow-sm" id="pills-contact-tab1" data-toggle="pill" href="#pills-contact1" role="tab" aria-controls="pills-contact" aria-selected="false">
                                        <i class="fa fa-bold fa-lg mr-2" aria-hidden="true"></i>Bootstrap 4</a>
                                </li>
                                <li class="  border border-light bg-light rounded text-sm-center mr-md-1 nav-item">
                                    <a class="nav-link pt-md-3 pb-md-3 pr-md-5 pl-md-5 shadow-sm" id="pills-info-tab1" data-toggle="pill" href="#pills-info1" role="tab" aria-controls="pills-info" aria-selected="false">
                                        <i class="fab fa-html5 fa-lg mr-2 " aria-hidden="true"></i>Clean HTML5 code</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="container-fluid">
                    <div class="row justify-content-between">
                        <div class="col col-md-12 pr-md-5 pl-md-5">
                            <div class="bd-example bd-example-tabs">
                                <div class="tab-content pt-5 pb-5" id="pills-tabContent1">
                                    <div class="tab-pane fade active show" id="pills-home1" role="tabpanel" aria-labelledby="pills-home-tab">
                                        <div class="container-fluid">
                                            <div class="row align-items-center justify-content-between">
                                                <div class="col-12 col-md-5  text-left">
                                                    <h2>Responsive layouts</h2>
                                                    <p class=" mt-4">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis pharetra varius quam sit amet vulputate. Quisque mauris augue, molestie tincidunt condimentum vitae, gravida a libero. Aenean sit amet felis dolor, in sagittis nisi.
                                                    </p>
                                                    <blockquote class="card  text-left  py-3 px-4 mb-3 mt-4  ">
                                                        <div class="row align-items-center justify-content-between">
                                                            <div class="col-3  p-md-1 text-center rounded">
                                                                <img src="http://via.placeholder.com/80/5fa9f8/efefef" class="img-fluid py-0 rounded"
                                                                     alt="features">
                                                                <footer class="blockquote-footer small p-1"><span class="small">John Doe <cite class="font-weight-bold">COMPANY NAME</cite></span></footer>
                                                            </div>
                                                            <div class="col-9">
                                                                <p class=" m-0 text-muted small">
                                                                    Quisque mauris augue, molestie tincidunt condimentum vitae, gravida a libero. Aenean sit amet felis dolor, in sagittis nisi. Etiam sed iaculis libero, at euismod massain venenatis ligula. </p>
                                                                <i class="fa fa-quote-right fa-2x text-muted pull-right mt-3" aria-hidden="true"></i>
                                                            </div>
                                                        </div>
                                                    </blockquote>
                                                    <a href="javascript:;" class="btn btn-primary  btn-rounded shadow py-3 px-5 mt-md-3 mt-2">See all features</a>
                                                </div>
                                                <div class="col-12 col-md-5 mb-4 ml-md-auto">
                                                    <img alt="image" class="img-fluid img-center mr-auto ml-auto d-none d-md-block" src="http://via.placeholder.com/600/5fa9f8/efefef">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="tab-pane fade" id="pills-profile1" role="tabpanel" aria-labelledby="pills-profile-tab">
                                        <div class="container-fluid">
                                            <div class="row align-items-center justify-content-between">
                                                <div class="col-12 col-md-5  text-left">
                                                    <h2>Slick and modern design</h2>
                                                    <p class=" mt-4">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis pharetra varius quam sit amet vulputate. Quisque mauris augue, molestie tincidunt condimentum vitae, gravida a libero. Aenean sit amet felis dolor, in sagittis nisi.
                                                    </p>
                                                    <blockquote class="card  text-left  py-3 px-4 mb-3 mt-4  ">
                                                        <div class="row align-items-center justify-content-between">
                                                            <div class="col-3  p-md-1 text-center rounded">
                                                                <img src="http://via.placeholder.com/80/5fa9f8/efefef" class="img-fluid py-0 rounded"
                                                                     alt="features">
                                                                <footer class="blockquote-footer small p-1"><span class="small">John Doe <cite class="font-weight-bold">COMPANY NAME</cite></span></footer>
                                                            </div>
                                                            <div class="col-9">
                                                                <p class=" m-0 text-muted small">
                                                                    Quisque mauris augue, molestie tincidunt condimentum vitae, gravida a libero. Aenean sit amet felis dolor, in sagittis nisi.
                                                                </p>
                                                                <i class="fa fa-quote-right fa-2x text-muted pull-right mt-3" aria-hidden="true"></i>
                                                            </div>
                                                        </div>
                                                    </blockquote>
                                                    <a href="javascript:;" class="btn btn-primary  btn-rounded shadow py-3 px-5 mt-md-3 mt-2">See all features</a>
                                                </div>
                                                <div class="col-12 col-md-5 mb-4 ml-md-auto">
                                                    <img alt="image" class="img-fluid img-center mr-auto ml-auto d-none d-md-block" src="http://via.placeholder.com/600/5fa9f8/efefef">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="tab-pane fade" id="pills-contact1" role="tabpanel" aria-labelledby="pills-contact-tab">
                                        <div class="container-fluid">
                                            <div class="row align-items-center justify-content-between">
                                                <div class="col-12 col-md-5  text-left">
                                                    <h2>All Bootstrap 4 features</h2>
                                                    <p class=" mt-4">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis pharetra varius quam sit amet vulputate. Quisque mauris augue, molestie tincidunt condimentum vitae, gravida a libero. Aenean sit amet felis dolor, in sagittis nisi.
                                                    </p>
                                                    <blockquote class="card  text-left  py-3 px-4 mb-3 mt-4  ">
                                                        <div class="row align-items-center justify-content-between">
                                                            <div class="col-3  p-md-1 text-center rounded">
                                                                <img src="http://via.placeholder.com/80/5fa9f8/efefef" class="img-fluid py-0 rounded"
                                                                     alt="features">
                                                                <footer class="blockquote-footer small p-1"><span class="small">John Doe <cite class="font-weight-bold">COMPANY NAME</cite></span></footer>
                                                            </div>
                                                            <div class="col-9">
                                                                <p class=" m-0 text-muted small">
                                                                    Quisque mauris augue, molestie tincidunt condimentum vitae, gravida a libero. Aenean sit amet felis dolor, in sagittis nisi. Etiam sed iaculis libero, at euismod massain venenatis ligula.
                                                                </p>
                                                                <i class="fa fa-quote-right fa-2x text-muted pull-right mt-3" aria-hidden="true"></i>
                                                            </div>
                                                        </div>
                                                    </blockquote>
                                                    <a href="javascript:;" class="btn btn-primary  btn-rounded shadow py-3 px-5 mt-md-3 mt-2">See all features</a>
                                                </div>
                                                <div class="col-12 col-md-5 mb-4 ml-md-auto">
                                                    <img alt="image" class="img-fluid img-center mr-auto ml-auto d-none d-md-block" src="http://via.placeholder.com/600/5fa9f8/efefef">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="tab-pane fade" id="pills-info1" role="tabpanel" aria-labelledby="pills-info-tab">
                                        <div class="container-fluid">
                                            <div class="row align-items-center justify-content-between">
                                                <div class="col-12 col-md-5  text-left">
                                                    <h2>Clean and valid HTML5 code</h2>
                                                    <p class=" mt-4">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis pharetra varius quam sit amet vulputate. Quisque mauris augue, molestie tincidunt condimentum vitae, gravida a libero. Aenean sit amet felis dolor, in sagittis nisi.
                                                    </p>
                                                    <blockquote class="card  text-left  py-3 px-4 mb-3 mt-4  ">
                                                        <div class="row align-items-center justify-content-between">
                                                            <div class="col-3  p-md-1 text-center rounded">
                                                                <img src="http://via.placeholder.com/80/5fa9f8/efefef" class="img-fluid py-0 rounded"
                                                                     alt="features">
                                                                <footer class="blockquote-footer small p-1"><span class="small">John Doe <cite class="font-weight-bold">COMPANY NAME</cite></span></footer>
                                                            </div>
                                                            <div class="col-9 position-relative">
                                                                <p class=" m-0 text-muted small">
                                                                    Aenean sit amet felis dolor, in sagittis nisi. Etiam sed iaculis libero, at euismod massain venenatis ligula.
                                                                </p>
                                                                <i class="fa fa-quote-right fa-2x text-muted pull-right mt-3" aria-hidden="true"></i>
                                                            </div>
                                                        </div>
                                                    </blockquote>
                                                    <a href="javascript:;" class="btn btn-primary  btn-rounded shadow py-3 px-5 mt-md-3 mt-2">See all features</a>
                                                </div>
                                                <div class="col-12 col-md-5 mb-4 ml-md-auto">
                                                    <img alt="image" class="img-fluid img-center mr-auto ml-auto d-none d-md-block" src="http://via.placeholder.com/600/5fa9f8/efefef">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <hr/>
            <section class="pt-5">
                <div class="container">
                    <div class="row d-flex justify-content-center p-5">
                        <div class="col-md-12">
                            <div class=" ">
                                <ul class="nav nav-pills nav-pills-primary justify-content-center mb-5" role="tablist">
                                    <li class="nav-item mr-md-4">
                                        <a class="nav-link nav-icon rounded p-3 shadow-sm active show" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">
                                            <i class=" far fa-gem fa-lg  mr-2"></i>
                                            Feature 1 tab
                                        </a>
                                    </li>
                                    <li class="nav-item mr-md-4">
                                        <a class="nav-link nav-icon rounded p-3 shadow-sm" id="profile-tab" data-toggle="tab" href="#profile" role="tab" aria-controls="profile" aria-selected="false">
                                            <i class="fab fa-html5 fa-lg mr-2"></i>
                                            Feature 2 tab </a>
                                    </li>
                                    <li class="nav-item mr-md-4">
                                        <a class="nav-link nav-icon p-3 shadow-sm" id="contact-tab" data-toggle="tab" href="#contact" role="tab" aria-controls="contact" aria-selected="false">
                                            <i class="fa fa-suitcase fa-lg mr-2"></i>
                                            Feature 3 tab</a>
                                    </li>
                                </ul>
                                <div class="tab-content    " id="myTabContent">
                                    <div class="tab-pane fade active show" id="home" role="tabpanel" aria-labelledby="home-tab">
                                        <div class="row row-grid">
                                            <div class="col-6  my-1">
                                                <img src="http://via.placeholder.com/600/5fa9f8/efefef" alt="" class="img-fluid rounded img-rised">
                                            </div>
                                            <div class="col-6 my-1">
                                                <img src="http://via.placeholder.com/600/5fa9f8/efefef" alt="" class="img-fluid rounded img-rised">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">
                                        <div class="row row-grid">
                                            <div class="col-6  my-1">
                                                <img src="http://via.placeholder.com/600/5fa9f8/efefef" alt="" class="img-fluid rounded img-rised">
                                            </div>
                                            <div class="col-6 my-1">
                                                <img src="http://via.placeholder.com/600/5fa9f8/efefef" alt="" class="img-fluid rounded img-rised">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="tab-pane fade" id="contact" role="tabpanel" aria-labelledby="contact-tab">
                                        <div class="row row-grid">
                                            <div class="col-6  my-1">
                                                <img src="http://via.placeholder.com/600/5fa9f8/efefef" alt="" class="img-fluid rounded img-rised">
                                            </div>
                                            <div class="col-6 my-1">
                                                <img src="http://via.placeholder.com/600/5fa9f8/efefef" alt="" class="img-fluid rounded img-rised">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <hr/>
            <section class="pt-5 pb-5">
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-12 col-md-8 text-center">
                            <h2 class="mb-5">Frequently asked questions (FAQ)</h2>
                            <div class="accordion" id="accordionExample">
                                <div class="card shadow-sm">
                                    <div class="card-header" id="headingOne">
                                        <h5 class="mb-0">
                                            <button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapseOne" aria-expanded="false" aria-controls="collapseOne">
                                                Collapsible Group Item #1
                                            </button>
                                        </h5>
                                    </div>
                                    <div id="collapseOne" class="collapse" aria-labelledby="headingOne" data-parent="#accordionExample">
                                        <div class="card-body">
                                            Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird
                                            on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer
                                            farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
                                        </div>
                                    </div>
                                </div>
                                <div class="card shadow-sm">
                                    <div class="card-header" id="headingTwo">
                                        <h5 class="mb-0">
                                            <button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                                                Collapsible Group Item #2
                                            </button>
                                        </h5>
                                    </div>
                                    <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionExample">
                                        <div class="card-body">
                                            Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird
                                            on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer
                                            farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
                                        </div>
                                    </div>
                                </div>
                                <div class="card shadow-sm">
                                    <div class="card-header" id="headingThree">
                                        <h5 class="mb-0">
                                            <button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                                                Collapsible Group Item #3
                                            </button>
                                        </h5>
                                    </div>
                                    <div id="collapseThree" class="collapse" aria-labelledby="headingThree" data-parent="#accordionExample">
                                        <div class="card-body">
                                            Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird
                                            on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer
                                            farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <hr/>
        </div>
    </div>
    <!--
    Reference Your external Stylesheet file here
    if your feature or plugins could not support to run globally.
    <link href="components/" rel="stylesheet">
    -->
    <style type="text/css">
        /*
        Embed CSS styling for current page.
        */
    </style>

    <!--
    Reference Your external Javascript file here
    if your feature or plugins could not support to run globally.
    <script src="components/"></script>
    -->
    <script type="text/javascript">
        // You could write safely Javascript code here too as our template
        // should load mandatory libraries and plugins before.
        // <--- HERE --->
        //
        jQuery(function ($) {
            // any code put here will be run after content attach to ajax output container and before
            // controll return to main javascript file.
            // <--- HERE --->
            //
            $(javatmp.settings.defaultOutputSelector).on(javatmp.settings.javaTmpAjaxContainerReady, function (event) {
                // fire AFTER all transition done and your ajax content is shown to user.

                $(javatmp.settings.defaultOutputSelector).on(javatmp.settings.javaTmpContainerResizeEventName, function (event) {
                    // fire when user resize browser window or sidebar hide / show
                });

                /**
                 * When another sidebar menu item pressed and before container issues new ajax request.
                 * You can cancel, destroy, or remove any thing here before replace main output ajax container.
                 * return false or event.preventDefault() will cancel ajax and stay you in the current page and do nothing.
                 **/
                $(javatmp.settings.defaultOutputSelector).on(javatmp.settings.javaTmpContainerRemoveEventName, function (event) {
                    var newLink = $(event._newTarget);
                    return true;
                });
            });
        });
    </script>
</div>