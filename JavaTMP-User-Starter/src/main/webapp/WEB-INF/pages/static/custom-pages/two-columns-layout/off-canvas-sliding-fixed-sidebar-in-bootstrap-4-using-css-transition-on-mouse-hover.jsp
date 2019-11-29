<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
    <head>
        <title>Basic Bootstrap Admin Dashboard Template</title>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <style type="text/css">
            body {
                padding-top: 56px;
            }
            .sidebar {
                z-index: 2;
                position: fixed;
                width: 300px;
                top: 56px;
                bottom: 0px;
                overflow-y: scroll;
                transition: all 0.4s;
            }
            .main-content {
                z-index: 1;
                margin-left: 0px;
                transition: all 0.4s;
            }
            .sidebar {
                margin-left: -300px;
            }
            .sidebar.active {
                margin-left: 0;
            }
            /* make sidebar shown off-canvas on mobile and small devices by default */
            .sidebar.active + .main-content {
                margin-left: 0px;
            }
            @media (min-width: 576px) {
                /* Shift main-content on larger devices  */
                .sidebar.active + .main-content {
                    margin-left: 300px;
                }
            }
            /* Hide body scroll bar when sidebar active on small and mobile devices */
            @media (max-width: 576px) {
                body.sidebar-active {
                    overflow-y: hidden;
                    -ms-overflow-style: none;
                }
            }
        </style>
    </head>
    <body>
        <nav class="navbar fixed-top navbar-expand-sm navbar-dark bg-primary">
            <a class="navbar-brand" href="#">JavaTMP</a>
            <button class="navbar-toggler" type="button" aria-controls="navbarText" aria-expanded="false" aria-label="Collapse sidebar">
                <span class="navbar-toggler-icon"></span>
            </button>
        </nav>
        <div class="container-fluid">
            <div class="row">
                <div class="col p-0">
                    <div class="sidebar bg-dark text-white p-3">
                        <p>Lorem ipsum dolor sit amet, ei dignissim urbanitas mea. Usu ei summo sensibus iudicabit. Sed ei dolorem luptatum, hinc autem cu vim, putent labitur eum in. Soleat luptatum postulant mea te, eu ius vitae nostrud oportere, no sed laudem nonumes. Nam ei probo disputationi, singulis posidonium constituam no ius. In eam virtute scribentur, sea exerci pertinacia ex.</p>
                        <p>Lorem ipsum dolor sit amet, ei dignissim urbanitas mea. Usu ei summo sensibus iudicabit. Sed ei dolorem luptatum, hinc autem cu vim, putent labitur eum in. Soleat luptatum postulant mea te, eu ius vitae nostrud oportere, no sed laudem nonumes. Nam ei probo disputationi, singulis posidonium constituam no ius. In eam virtute scribentur, sea exerci pertinacia ex.</p>
                        <p>Lorem ipsum dolor sit amet, ei dignissim urbanitas mea. Usu ei summo sensibus iudicabit. Sed ei dolorem luptatum, hinc autem cu vim, putent labitur eum in. Soleat luptatum postulant mea te, eu ius vitae nostrud oportere, no sed laudem nonumes. Nam ei probo disputationi, singulis posidonium constituam no ius. In eam virtute scribentur, sea exerci pertinacia ex.</p>
                        <p>Lorem ipsum dolor sit amet, ei dignissim urbanitas mea. Usu ei summo sensibus iudicabit. Sed ei dolorem luptatum, hinc autem cu vim, putent labitur eum in. Soleat luptatum postulant mea te, eu ius vitae nostrud oportere, no sed laudem nonumes. Nam ei probo disputationi, singulis posidonium constituam no ius. In eam virtute scribentur, sea exerci pertinacia ex.</p>
                        <p>Lorem ipsum dolor sit amet, ei dignissim urbanitas mea. Usu ei summo sensibus iudicabit. Sed ei dolorem luptatum, hinc autem cu vim, putent labitur eum in. Soleat luptatum postulant mea te, eu ius vitae nostrud oportere, no sed laudem nonumes. Nam ei probo disputationi, singulis posidonium constituam no ius. In eam virtute scribentur, sea exerci pertinacia ex.</p>
                        <p>Lorem ipsum dolor sit amet, ei dignissim urbanitas mea. Usu ei summo sensibus iudicabit. Sed ei dolorem luptatum, hinc autem cu vim, putent labitur eum in. Soleat luptatum postulant mea te, eu ius vitae nostrud oportere, no sed laudem nonumes. Nam ei probo disputationi, singulis posidonium constituam no ius. In eam virtute scribentur, sea exerci pertinacia ex.</p>
                    </div>
                    <div class="main-content p-3">
                        <div class="row">
                            <div class="col">
                                <p>Lorem ipsum dolor sit amet, ei dignissim urbanitas mea. Usu ei summo sensibus iudicabit. Sed ei dolorem luptatum, hinc autem cu vim, putent labitur eum in. Soleat luptatum postulant mea te, eu ius vitae nostrud oportere, no sed laudem nonumes. Nam ei probo disputationi, singulis posidonium constituam no ius. In eam virtute scribentur, sea exerci pertinacia ex.</p>
                                <p>Lorem ipsum dolor sit amet, ei dignissim urbanitas mea. Usu ei summo sensibus iudicabit. Sed ei dolorem luptatum, hinc autem cu vim, putent labitur eum in. Soleat luptatum postulant mea te, eu ius vitae nostrud oportere, no sed laudem nonumes. Nam ei probo disputationi, singulis posidonium constituam no ius. In eam virtute scribentur, sea exerci pertinacia ex.</p>
                                <p>Lorem ipsum dolor sit amet, ei dignissim urbanitas mea. Usu ei summo sensibus iudicabit. Sed ei dolorem luptatum, hinc autem cu vim, putent labitur eum in. Soleat luptatum postulant mea te, eu ius vitae nostrud oportere, no sed laudem nonumes. Nam ei probo disputationi, singulis posidonium constituam no ius. In eam virtute scribentur, sea exerci pertinacia ex.</p>
                                <p>Lorem ipsum dolor sit amet, ei dignissim urbanitas mea. Usu ei summo sensibus iudicabit. Sed ei dolorem luptatum, hinc autem cu vim, putent labitur eum in. Soleat luptatum postulant mea te, eu ius vitae nostrud oportere, no sed laudem nonumes. Nam ei probo disputationi, singulis posidonium constituam no ius. In eam virtute scribentur, sea exerci pertinacia ex.</p>
                                <p>Lorem ipsum dolor sit amet, ei dignissim urbanitas mea. Usu ei summo sensibus iudicabit. Sed ei dolorem luptatum, hinc autem cu vim, putent labitur eum in. Soleat luptatum postulant mea te, eu ius vitae nostrud oportere, no sed laudem nonumes. Nam ei probo disputationi, singulis posidonium constituam no ius. In eam virtute scribentur, sea exerci pertinacia ex.</p>
                                <p>Lorem ipsum dolor sit amet, ei dignissim urbanitas mea. Usu ei summo sensibus iudicabit. Sed ei dolorem luptatum, hinc autem cu vim, putent labitur eum in. Soleat luptatum postulant mea te, eu ius vitae nostrud oportere, no sed laudem nonumes. Nam ei probo disputationi, singulis posidonium constituam no ius. In eam virtute scribentur, sea exerci pertinacia ex.</p>
                                <p>Lorem ipsum dolor sit amet, ei dignissim urbanitas mea. Usu ei summo sensibus iudicabit. Sed ei dolorem luptatum, hinc autem cu vim, putent labitur eum in. Soleat luptatum postulant mea te, eu ius vitae nostrud oportere, no sed laudem nonumes. Nam ei probo disputationi, singulis posidonium constituam no ius. In eam virtute scribentur, sea exerci pertinacia ex.</p>
                                <p>Lorem ipsum dolor sit amet, ei dignissim urbanitas mea. Usu ei summo sensibus iudicabit. Sed ei dolorem luptatum, hinc autem cu vim, putent labitur eum in. Soleat luptatum postulant mea te, eu ius vitae nostrud oportere, no sed laudem nonumes. Nam ei probo disputationi, singulis posidonium constituam no ius. In eam virtute scribentur, sea exerci pertinacia ex.</p>
                                <p>Lorem ipsum dolor sit amet, ei dignissim urbanitas mea. Usu ei summo sensibus iudicabit. Sed ei dolorem luptatum, hinc autem cu vim, putent labitur eum in. Soleat luptatum postulant mea te, eu ius vitae nostrud oportere, no sed laudem nonumes. Nam ei probo disputationi, singulis posidonium constituam no ius. In eam virtute scribentur, sea exerci pertinacia ex.</p>
                                <p>Lorem ipsum dolor sit amet, ei dignissim urbanitas mea. Usu ei summo sensibus iudicabit. Sed ei dolorem luptatum, hinc autem cu vim, putent labitur eum in. Soleat luptatum postulant mea te, eu ius vitae nostrud oportere, no sed laudem nonumes. Nam ei probo disputationi, singulis posidonium constituam no ius. In eam virtute scribentur, sea exerci pertinacia ex.</p>
                                <p>Lorem ipsum dolor sit amet, ei dignissim urbanitas mea. Usu ei summo sensibus iudicabit. Sed ei dolorem luptatum, hinc autem cu vim, putent labitur eum in. Soleat luptatum postulant mea te, eu ius vitae nostrud oportere, no sed laudem nonumes. Nam ei probo disputationi, singulis posidonium constituam no ius. In eam virtute scribentur, sea exerci pertinacia ex.</p>
                                <p>Lorem ipsum dolor sit amet, ei dignissim urbanitas mea. Usu ei summo sensibus iudicabit. Sed ei dolorem luptatum, hinc autem cu vim, putent labitur eum in. Soleat luptatum postulant mea te, eu ius vitae nostrud oportere, no sed laudem nonumes. Nam ei probo disputationi, singulis posidonium constituam no ius. In eam virtute scribentur, sea exerci pertinacia ex.</p>
                                <p>Lorem ipsum dolor sit amet, ei dignissim urbanitas mea. Usu ei summo sensibus iudicabit. Sed ei dolorem luptatum, hinc autem cu vim, putent labitur eum in. Soleat luptatum postulant mea te, eu ius vitae nostrud oportere, no sed laudem nonumes. Nam ei probo disputationi, singulis posidonium constituam no ius. In eam virtute scribentur, sea exerci pertinacia ex.</p>
                                <p>Lorem ipsum dolor sit amet, ei dignissim urbanitas mea. Usu ei summo sensibus iudicabit. Sed ei dolorem luptatum, hinc autem cu vim, putent labitur eum in. Soleat luptatum postulant mea te, eu ius vitae nostrud oportere, no sed laudem nonumes. Nam ei probo disputationi, singulis posidonium constituam no ius. In eam virtute scribentur, sea exerci pertinacia ex.</p>
                                <p>Lorem ipsum dolor sit amet, ei dignissim urbanitas mea. Usu ei summo sensibus iudicabit. Sed ei dolorem luptatum, hinc autem cu vim, putent labitur eum in. Soleat luptatum postulant mea te, eu ius vitae nostrud oportere, no sed laudem nonumes. Nam ei probo disputationi, singulis posidonium constituam no ius. In eam virtute scribentur, sea exerci pertinacia ex.</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- jQuery first, then Popper.js, then Bootstrap JS -->
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script type="text/javascript">
            jQuery(function ($) {

                var menuTimeout = null;
                var handlingMouseMove = function (e) {
                    if (e.pageX < 20 || $('.sidebar').is(':hover')) {
                        // Show the menu if mouse is within 20 pixels from the left or we are hovering over it
                        clearTimeout(menuTimeout);
                        menuTimeout = null;
                        $('.sidebar').addClass("active");
                        $("body").addClass("sidebar-active");
                    } else if (menuTimeout === null) {
                        menuTimeout = setTimeout(function () {
                            $('.sidebar').removeClass("active");
                            $("body").removeClass("sidebar-active");
                        }, 200);
                    }
                };
                $(window).on('resize', function () {
                    width = (window.innerWidth > 0) ? window.innerWidth : this.screen.width;
                    if ((width < 576)) {
                        // default on <= navbar-expand-sm devices.
                        $(window).off('mousemove', handlingMouseMove);
                    } else {
                        // default on > navbar-expand-sm devices.
                        $(window).on('mousemove', handlingMouseMove);
                    }
                }).resize();

                $(".navbar-toggler").on("click", function () {
                    // we manually collapse sidebar:
                    if ($('.sidebar').hasClass("active")) {
                        $('.sidebar').removeClass("active");
                        $("body").removeClass("sidebar-active");
                    } else {
                        $('.sidebar').addClass("active");
                        $("body").addClass("sidebar-active");
                    }
                });
            });
        </script>
    </body>
</html>