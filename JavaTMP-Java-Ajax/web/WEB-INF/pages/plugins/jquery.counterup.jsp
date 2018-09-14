<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="dynamic-ajax-content">
    <div class="page-header">
        <h1>jQuery CounterUp Plugin</h1>
    </div>
    <div class="row">
        <div class="col-lg-12">
            <div class="alert alert-info">
                <p>jquery.counterup is a lightweight jQuery plugin that counts up to a targeted number when the number becomes visible.</p>
                <p>
                    <a class="btn btn-info" target="_blank" href="http://ciromattia.github.io/jquery.counterup/demo/index.html">Demo Page</a>
                    <a class="btn btn-info" target="_blank" href="https://github.com/ciromattia/jquery.counterup">github.com Project Link</a>
                </p>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-lg-4 text-center text-center">
            <span class="counter">52,147</span>
        </div>
        <div class="col-lg-4 text-center">
            <span class="counter">1.9583</span>
        </div>
        <div class="col-lg-4 text-center">
            <span class="counter">12345</span>
        </div>
    </div>
    <div class="row">
        <div class="col-lg-4 text-center">
            <span class="counter" data-counterup-time="1000" data-counterup-delay="25">52,147</span>
        </div>
        <div class="col-lg-4 text-center">
            <span class="counter" data-counterup-time="1500" data-counterup-offset="75">1.9583</span>
        </div>
        <div class="col-lg-4 text-center">
            <span class="counter" data-counterup-time="2000" data-counterup-beginAt="3000">12345</span>
        </div>
    </div>
    <div class="row">
        <div class="col-lg-4 text-center">
            <span><span>$</span><span class="counter">43,753</span></span>
        </div>
        <div class="col-lg-4 text-center">
            <span class="counter">1,734,195.10</span>
        </div>
        <div class="col-lg-4 text-center">
            <span class="counter">849203</span>
        </div>
    </div>
    <div class="row">
        <div class="col-lg-4 text-center">
            <span class="counter">0.8412</span>
        </div>
        <div class="col-lg-4 text-center">
            <span class="counter">958393.10</span>
        </div>
        <div class="col-lg-4 text-center">
            <span class="counter">5,123,348</span>
        </div>
    </div>
    <div class="row">
        <div class="col-lg-4 text-center">
            <span class="counter">52,147</span>
        </div>
        <div class="col-lg-4 text-center">
            <span class="counter">1.9583</span>
        </div>
        <div class="col-lg-4 text-center">
            <span class="counter">12345</span>
        </div>
    </div>
    <div class="row">
        <div class="col-lg-4 text-center">
            <span>
                <span>$</span>
                <span class="counter">43,753</span></span>
        </div>
        <div class="col-lg-4 text-center">
            <span class="counter">1,734,195.10</span>
        </div>
        <div class="col-lg-4 text-center">
            <span class="counter">849203</span>
        </div>
    </div>
    <div class="row">
        <div class="col-lg-4 text-center">
            <span class="counter">0.8412</span>
        </div>
        <div class="col-lg-4 text-center">
            <span class="counter">958393.10</span>
        </div>
        <div class="col-lg-4 text-center">
            <span class="counter">5,123,348</span>
        </div>
    </div>
    <style type="text/css">
        .dynamic-ajax-content .col-lg-4.text-center {
            font-size: 33px;
            color: #555;
            margin-bottom: 250px;
            font-weight: 400;
            text-align: center;
        }
    </style>
    <script type="text/javascript">
        jQuery(function ($) {
            $('.counter').counterUp({
                delay: 100,
                time: 1000
            });
            $(javatmp.settings.defaultOutputSelector).on(javatmp.settings.javaTmpAjaxContainerReady, function (event) {

            });

            $(javatmp.settings.defaultOutputSelector).on(javatmp.settings.javaTmpContainerResizeEventName, function (event) {
            });
            // before container replaced with new ajax content.
            $(javatmp.settings.defaultOutputSelector).on(javatmp.settings.javaTmpContainerRemoveEventName, function (event) {
            });
        });
    </script>
</div>