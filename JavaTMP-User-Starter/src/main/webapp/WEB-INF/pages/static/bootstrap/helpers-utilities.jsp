<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="dynamic-ajax-content grid-gutter-padding">
    <h4 class="my-3">Bootstrap helper and utilities classes</h4>
    <hr/>
    <div class="row">
        <div class="col">
            <div class="card mb-3">
                <div class="card-header">
                    Borders
                    <div class="options float-right">
                        <a class="settings"><i class="fa fa-cog"></i></a>
                        <a href="#" class="collapse"><i class="fa fa-chevron-up"></i></a>
                        <a href="#" class="reload"><i class="fa fa-sync"></i></a>
                        <a href="#" class="fullscreen"><i class=" fa fa-expand"></i></a>
                        <a href="#" class="remove"><i class="fa fa-times"></i></a>
                    </div>
                </div>
                <div class="card-body helpers-utilities">
                    <h4 class="card-title text-primary">Additive Borders</h4>
                    <span class="border bg-light"></span>
                    <span class="border-top bg-light"></span>
                    <span class="border-right bg-light"></span>
                    <span class="border-bottom bg-light"></span>
                    <span class="border-left bg-light"></span>
                    <hr/>
                    <h4 class="card-title text-primary">Subtractive Borders</h4>
                    <span class="border border-0 bg-light"></span>
                    <span class="border border-top-0 bg-light"></span>
                    <span class="border border-right-0 bg-light"></span>
                    <span class="border border-bottom-0 bg-light"></span>
                    <span class="border border-left-0 bg-light"></span>
                    <hr/>
                    <h4 class="card-title text-primary">Border color</h4>
                    <span class="border border-primary"></span>
                    <span class="border border-secondary"></span>
                    <span class="border border-success"></span>
                    <span class="border border-danger"></span>
                    <span class="border border-warning"></span>
                    <span class="border border-info"></span>
                    <span class="border border-light"></span>
                    <span class="border border-dark"></span>
                    <span class="border border-white"></span>
                    <hr/>
                    <h4 class="card-title text-primary">Border-radius</h4>
                    <div class="bd-example bd-example-images">
                        <svg class="bd-placeholder-img rounded" width="75" height="75" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Example rounded image: 75x75"><title>Example rounded image</title><rect width="100%" height="100%" fill="#868e96"></rect><text x="50%" y="50%" fill="#dee2e6" dy=".3em">75x75</text></svg><svg class="bd-placeholder-img rounded-top" width="75" height="75" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Example top rounded image: 75x75"><title>Example top rounded image</title><rect width="100%" height="100%" fill="#868e96"></rect><text x="50%" y="50%" fill="#dee2e6" dy=".3em">75x75</text></svg><svg class="bd-placeholder-img rounded-right" width="75" height="75" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Example right rounded image: 75x75"><title>Example right rounded image</title><rect width="100%" height="100%" fill="#868e96"></rect><text x="50%" y="50%" fill="#dee2e6" dy=".3em">75x75</text></svg><svg class="bd-placeholder-img rounded-bottom" width="75" height="75" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Example bottom rounded image: 75x75"><title>Example bottom rounded image</title><rect width="100%" height="100%" fill="#868e96"></rect><text x="50%" y="50%" fill="#dee2e6" dy=".3em">75x75</text></svg><svg class="bd-placeholder-img rounded-left" width="75" height="75" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Example left rounded image: 75x75"><title>Example left rounded image</title><rect width="100%" height="100%" fill="#868e96"></rect><text x="50%" y="50%" fill="#dee2e6" dy=".3em">75x75</text></svg><svg class="bd-placeholder-img rounded-circle" width="75" height="75" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Completely round image: 75x75"><title>Completely round image</title><rect width="100%" height="100%" fill="#868e96"></rect><text x="50%" y="50%" fill="#dee2e6" dy=".3em">75x75</text></svg><svg class="bd-placeholder-img rounded-pill" width="150" height="75" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Rounded pill image: 150x75"><title>Rounded pill image</title><rect width="100%" height="100%" fill="#868e96"></rect><text x="50%" y="50%" fill="#dee2e6" dy=".3em">150x75</text></svg><svg class="bd-placeholder-img rounded-0" width="75" height="75" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Example non-rounded image (overrides rounding applied elsewhere): 75x75"><title>Example non-rounded image (overrides rounding applied elsewhere)</title><rect width="100%" height="100%" fill="#868e96"></rect><text x="50%" y="50%" fill="#dee2e6" dy=".3em">75x75</text></svg></div>
                    <hr/>
                    <h4 class="card-title text-primary">Border-radius Sizes</h4>
                    <p>Use <code class="highlighter-rouge">.rounded-lg</code> or <code class="highlighter-rouge">.rounded-sm</code> for larger or smaller border-radius.</p>
                    <div class="bd-example bd-example-images"><svg class="bd-placeholder-img rounded-sm" width="75" height="75" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Example small rounded image: 75x75"><title>Example small rounded image</title><rect width="100%" height="100%" fill="#868e96"></rect><text x="50%" y="50%" fill="#dee2e6" dy=".3em">75x75</text></svg><svg class="bd-placeholder-img rounded-lg" width="75" height="75" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Example large rounded image: 75x75"><title>Example large rounded image</title><rect width="100%" height="100%" fill="#868e96"></rect><text x="50%" y="50%" fill="#dee2e6" dy=".3em">75x75</text></svg></div>
                    <hr/>
                    <h4 class="card-title text-primary">Overflow</h4>
                    <div class="bd-example d-md-flex">
                        <div class="overflow-auto p-3 mb-3 mb-md-0 mr-md-3 bg-light" style="max-width: 260px; max-height: 100px;">
                            This is an example of using <code>.overflow-auto</code> on an element with set width and height dimensions. By design, this content will vertically scroll.
                        </div>
                        <div class="overflow-hidden p-3 bg-light" style="max-width: 260px; max-height: 100px;">
                            This is an example of using <code>.overflow-hidden</code> on an element with set width and height dimensions.
                        </div>
                    </div>
                    <hr/>
                    <h4 class="card-title text-primary">Shadows</h4>
                    <div class="bd-example">
                        <div class="shadow-none p-3 mb-5 bg-light rounded">No shadow</div>
                        <div class="shadow-sm p-3 mb-5 bg-white rounded">Small shadow</div>
                        <div class="shadow p-3 mb-5 bg-white rounded">Regular shadow</div>
                        <div class="shadow-lg p-3 mb-5 bg-white rounded">Larger shadow</div>
                    </div>
                    <hr/>
                    <h4 class="card-title text-primary">Horizontal centering Spacing</h4>
                    <div class="mx-auto bg-secondary" style="width: 200px;">
                        Centered element
                    </div>
                    <hr/>
                    <h4 class="card-title text-primary">Negative margin</h4>
                    <p>In CSS, <code class="highlighter-rouge">margin</code> properties can utilize negative values (<code class="highlighter-rouge">padding</code> cannot). As of 4.2, weâve added negative margin utilities for every non-zero integer size listed above (e.g., <code class="highlighter-rouge">1</code>, <code class="highlighter-rouge">2</code>, <code class="highlighter-rouge">3</code>, <code class="highlighter-rouge">4</code>, <code class="highlighter-rouge">5</code>). These utilities are ideal for customizing grid column gutters across breakpoints.</p>
                    <p>The syntax is nearly the same as the default, positive margin utilities, but with the addition of <code class="highlighter-rouge">n</code> before the requested size. Hereâs an example class thatâs the opposite of <code class="highlighter-rouge">.mt-1</code>:</p>
                    <div class="row mx-md-n5">
                        <div class="col px-md-5"><div class="p-3 border bg-light">Custom column padding</div></div>
                        <div class="col px-md-5"><div class="p-3 border bg-light">Custom column padding</div></div>
                    </div>
                    <hr/>
                    <h4 class="card-title text-primary">Stretched link</h4>
                    <p>Add <code class="highlighter-rouge">.stretched-link</code> to a link to make its <a href="https://developer.mozilla.org/en-US/docs/Web/CSS/Containing_block">containing block</a> clickable via a <code class="highlighter-rouge">::after</code> pseudo element. In most cases, this means that an element with <code class="highlighter-rouge">position: relative;</code> that contains a link with the <code class="highlighter-rouge">.stretched-link</code> class is clickable.</p>
                    <p>Cards have <code class="highlighter-rouge">position: relative</code> by default in Bootstrap, so in this case you can safely add the <code class="highlighter-rouge">.stretched-link</code> class to a link in the card without any other HTML changes.</p>
                    <p>Multiple links and tap targets are not recommended with stretched links. However, some <code class="highlighter-rouge">position</code> and <code class="highlighter-rouge">z-index</code> styles can help should this be required.</p>
                    <div class="bd-example">
                        <div class="card" style="width: 18rem;">
                            <svg class="bd-placeholder-img card-img-top" width="100%" height="180" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Card image cap"><title>Card image cap</title><rect width="100%" height="100%" fill="#868e96"></rect></svg>
                            <div class="card-body">
                                <h5 class="card-title">Card with stretched link</h5>
                                <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                                <a href="#" class="btn btn-primary stretched-link">Go somewhere</a>
                            </div>
                        </div>
                    </div>
                    <p>Media objects do not have <code class="highlighter-rouge">position: relative</code> by default, so we need to add the <code class="highlighter-rouge">.position-relative</code> here to prevent the link from stretching outside the media object.</p>
                    <div class="bd-example">
                        <div class="media position-relative">
                            <svg class="bd-placeholder-img mr-3" width="144" height="144" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Generic placeholder image"><title>Generic placeholder image</title><rect width="100%" height="100%" fill="#868e96"></rect></svg>
                            <div class="media-body">
                                <h5 class="mt-0">Media with stretched link</h5>
                                <p>Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.</p>
                                <a href="#" class="stretched-link">Go somewhere</a>
                            </div>
                        </div>
                    </div>
                    <hr/>
                    <h4 class="card-title text-primary">Font weight and italics</h4>
                    <p class="font-weight-bold">Bold text.</p>
                    <p class="font-weight-bolder">Bolder weight text (relative to the parent element).</p>
                    <p class="font-weight-normal">Normal weight text.</p>
                    <p class="font-weight-light">Light weight text.</p>
                    <p class="font-weight-lighter">Lighter weight text (relative to the parent element).</p>
                    <p class="font-italic">Italic text.</p>
                    <hr/>
                </div>
            </div>
        </div>
    </div>
    <style type="text/css">
        .helpers-utilities span {
            display: inline-block;
            width: 5rem;
            height: 5rem;
            margin: .25rem;
        }
        .helpers-utilities img + img, .helpers-utilities svg + svg {
            margin-left: .5rem;
        }
    </style>
    <script type="text/javascript">
        jQuery(function ($) {
            $(javatmp.settings.defaultOutputSelector).on(javatmp.settings.javaTmpAjaxContainerReady, function (event) {

            });

            $(javatmp.settings.defaultOutputSelector).on(javatmp.settings.javaTmpContainerResizeEventName, function (event) {

            });
            $(javatmp.settings.defaultOutputSelector).on(javatmp.settings.cardFullscreenCompress, function (event, card) {
                // when card compress by pressing the top right tool button

            });
            $(javatmp.settings.defaultOutputSelector).on(javatmp.settings.cardFullscreenExpand, function (event, card) {
                // when card Expand by pressing the top right tool button
            });
            // before container replaced with new ajax content.
            $(javatmp.settings.defaultOutputSelector).on(javatmp.settings.javaTmpContainerRemoveEventName, function (event) {
                $(javatmp.settings.defaultOutputSelector).off(javatmp.settings.cardFullscreenCompress);
                $(javatmp.settings.defaultOutputSelector).off(javatmp.settings.cardFullscreenExpand);
                return true;
            });

        });
    </script>
</div>