<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="dynamic-ajax-content grid-gutter-padding">
    <div class="row">
        <div class="col-lg-12">
            <div class="alert alert-info mt-3">
                <p>Ion.RangeSlider. Is an easy, flexible and responsive range slider with tons of options.</p>
                <br/>
                <p>
                    <a class="btn btn-info" target="_blank" href="http://ionden.com/a/plugins/ion.rangeSlider/en.html"><i class="fa fa-external-link-alt fa-fw"></i>Demo Page</a>
                    <a class="btn btn-info" target="_blank" href="https://github.com/IonDen/ion.rangeSlider"><i class="fa fa-external-link-alt fa-fw"></i>github.com Page</a>
                </p>
            </div>
        </div>
    </div>
    <div class="form-row">
        <div class="col-lg-4">
            <div class="card mb-3">
                <div class="card-header">
                    Ion Range Slider <span class="badge badge-primary">Flat skin</span>
                    <div class="options float-right">
                        <a class="settings"><i class="fa fa-cog"></i></a>
                        <a href="#" class="collapse"><i class="fa fa-chevron-up"></i></a>
                        <a href="#" class="reload"><i class="fa fa-sync"></i></a>
                        <a href="#" class="fullscreen"><i class=" fa fa-expand"></i></a>
                        <a href="#" class="remove"><i class="fa fa-times"></i></a>
                    </div>
                </div>
                <div class="card-body px-5">
                    <div class="row">
                        <div class="col-lg-12">
                            <form role="form" class="ionRangeSlider-flat-skin">
                                <div class="form-group single-ionRangeSlider ionRangeSlider-primary">
                                    <label>Basic With Set min, max and start value Options:</label>
                                    <input type="text" class="form-control demo1" value="" />
                                    <p class="help-block">Start with <small>min, max, from</small>.</p>
                                </div>
                                <div class="form-group single-ionRangeSlider ionRangeSlider-secondary">
                                    <label>Basic With Set min, max and start value and grid Options:</label>
                                    <input type="text" class="form-control demo2" value="" />
                                    <p class="help-block">Start with <small>min, max, from</small>.</p>
                                </div>
                                <div class="form-group single-ionRangeSlider ionRangeSlider-success">
                                    <label>Set min, max, and start values</label>
                                    <input type="text" class="form-control demo3" value="" />
                                    <p class="help-block">Set min value, max value and start point.</p>
                                </div>
                                <div class="form-group ionRangeSlider-danger">
                                    <label>Range with values</label>
                                    <input type="text" class="form-control demo4" value="" />
                                    <p class="help-block">Set type to double and specify range, also showing grid and adding prefix "$".</p>
                                </div>
                                <div class="form-group ionRangeSlider-warning">
                                    <label>Range with negative values</label>
                                    <input type="text" class="form-control demo5" value="" />
                                    <p class="help-block">Set up range with negative values.</p>
                                </div>
                                <div class="form-group  ionRangeSlider-info">
                                    <label>Range using step 100</label>
                                    <input type="text" class="form-control demo6" value="" />
                                    <p class="help-block">Range using step 100.</p>
                                </div>
                                <div class="form-group single-ionRangeSlider ionRangeSlider-light">
                                    <label>Range using strings</label>
                                    <input type="text" class="form-control demo7" value="" />
                                    <p class="help-block">Range using strings.</p>
                                </div>
                                <div class="form-group single-ionRangeSlider  ionRangeSlider-dark">
                                    <label>Range with Formatting Number:</label>
                                    <input type="text" class="form-control demo8" value="" />
                                    <p class="help-block">Prettify visual look of numbers.</p>
                                </div>
                                <div class="form-group single-ionRangeSlider  ionRangeSlider-warning">
                                    <label>You can lock your slider, by using disable option:</label>
                                    <input type="text" class="form-control demo9" value="" />
                                    <p class="help-block">using <code>disable: true</code></p>
                                </div>
                                <div class="form-group single-ionRangeSlider ionRangeSlider-info">
                                    <label>Use your own prettify function to transform numbers whatever you like.</label>
                                    <input type="text" class="form-control demo10" value="" />
                                    <p class="help-block">For example calculating logarithm of a number</p>
                                </div>
                                <div class="form-group ionRangeSlider-success">
                                    <label>Force fractional values.</label>
                                    <input type="text" class="form-control demo11" value="" />
                                    <p class="help-block">For example using fractional step 0.1</p>
                                </div>
                                <div class="form-group ionRangeSlider-danger">
                                    <label>Support bar dragging.</label>
                                    <input type="text" class="form-control demo12" value="" />
                                    <p class="help-block">By using <code>drag_interval: true</code></p>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-4">
            <div class="card mb-3">
                <div class="card-header">
                    Ion Range Slider <span class="badge badge-primary">Big skin</span>
                    <div class="options float-right">
                        <a class="settings"><i class="fa fa-cog"></i></a>
                        <a href="#" class="collapse"><i class="fa fa-chevron-up"></i></a>
                        <a href="#" class="reload"><i class="fa fa-sync"></i></a>
                        <a href="#" class="fullscreen"><i class=" fa fa-expand"></i></a>
                        <a href="#" class="remove"><i class="fa fa-times"></i></a>
                    </div>
                </div>
                <div class="card-body px-5">
                    <div class="row">
                        <div class="col-lg-12">
                            <form role="form" class="ionRangeSlider-big-skin">
                                <div class="form-group single-ionRangeSlider ionRangeSlider-primary">
                                    <label>Basic With Set min, max and start value Options:</label>
                                    <input type="text" class="form-control demo1" value="" />
                                    <p class="help-block">Start with <small>min, max, from</small>.</p>
                                </div>
                                <div class="form-group single-ionRangeSlider ionRangeSlider-secondary">
                                    <label>Basic With Set min, max and start value and grid Options:</label>
                                    <input type="text" class="form-control demo2" value="" />
                                    <p class="help-block">Start with <small>min, max, from</small>.</p>
                                </div>
                                <div class="form-group single-ionRangeSlider ionRangeSlider-success">
                                    <label>Set min, max, and start values</label>
                                    <input type="text" class="form-control demo3" value="" />
                                    <p class="help-block">Set min value, max value and start point.</p>
                                </div>
                                <div class="form-group ionRangeSlider-warning">
                                    <label>Range with values</label>
                                    <input type="text" class="form-control demo4" value="" />
                                    <p class="help-block">Set type to double and specify range, also showing grid and adding prefix "$".</p>
                                </div>
                                <div class="form-group ionRangeSlider-danger">
                                    <label>Range with negative values</label>
                                    <input type="text" class="form-control demo5" value="" />
                                    <p class="help-block">Set up range with negative values.</p>
                                </div>
                                <div class="form-group ionRangeSlider-info">
                                    <label>Range using step 100</label>
                                    <input type="text" class="form-control demo6" value="" />
                                    <p class="help-block">Range using step 100.</p>
                                </div>
                                <div class="form-group single-ionRangeSlider ionRangeSlider-light">
                                    <label>Range using strings</label>
                                    <input type="text" class="form-control demo7" value="" />
                                    <p class="help-block">Range using strings.</p>
                                </div>
                                <div class="form-group single-ionRangeSlider ionRangeSlider-dark">
                                    <label>Range with Formatting Number:</label>
                                    <input type="text" class="form-control demo8" value="" />
                                    <p class="help-block">Prettify visual look of numbers.</p>
                                </div>
                                <div class="form-group single-ionRangeSlider ionRangeSlider-success">
                                    <label>You can lock your slider, by using disable option:</label>
                                    <input type="text" class="form-control demo9" value="" />
                                    <p class="help-block">using <code>disable: true</code></p>
                                </div>
                                <div class="form-group single-ionRangeSlider ionRangeSlider-danger">
                                    <label>Use your own prettify function to transform numbers whatever you like.</label>
                                    <input type="text" class="form-control demo10" value="" />
                                    <p class="help-block">For example calculating logarithm of a number</p>
                                </div>
                                <div class="form-group ionRangeSlider-warning">
                                    <label>Force fractional values.</label>
                                    <input type="text" class="form-control demo11" value="" />
                                    <p class="help-block">For example using fractional step 0.1</p>
                                </div>
                                <div class="form-group ionRangeSlider-danger">
                                    <label>Support bar dragging.</label>
                                    <input type="text" class="form-control demo12" value="" />
                                    <p class="help-block">By using <code>drag_interval: true</code></p>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-4">
            <div class="card mb-3">
                <div class="card-header">
                    Ion Range Slider <span class="badge badge-primary">Modern skin</span>
                    <div class="options float-right">
                        <a class="settings"><i class="fa fa-cog"></i></a>
                        <a href="#" class="collapse"><i class="fa fa-chevron-up"></i></a>
                        <a href="#" class="reload"><i class="fa fa-sync"></i></a>
                        <a href="#" class="fullscreen"><i class=" fa fa-expand"></i></a>
                        <a href="#" class="remove"><i class="fa fa-times"></i></a>
                    </div>
                </div>
                <div class="card-body px-5">
                    <div class="row">
                        <div class="col-lg-12">
                            <form role="form" class="ionRangeSlider-modern-skin">
                                <div class="form-group single-ionRangeSlider ionRangeSlider-primary">
                                    <label>Basic With Set min, max and start value Options:</label>
                                    <input type="text" class="form-control demo1" value="" />
                                    <p class="help-block">Start with <small>min, max, from</small>.</p>
                                </div>
                                <div class="form-group single-ionRangeSlider ionRangeSlider-secondary">
                                    <label>Basic With Set min, max and start value and grid Options:</label>
                                    <input type="text" class="form-control demo2" value="" />
                                    <p class="help-block">Start with <small>min, max, from</small>.</p>
                                </div>
                                <div class="form-group single-ionRangeSlider ionRangeSlider-info">
                                    <label>Set min, max, and start values</label>
                                    <input type="text" class="form-control demo3" value="" />
                                    <p class="help-block">Set min value, max value and start point.</p>
                                </div>
                                <div class="form-group ionRangeSlider-success">
                                    <label>Range with values</label>
                                    <input type="text" class="form-control demo4" value="" />
                                    <p class="help-block">Set type to double and specify range, also showing grid and adding prefix "$".</p>
                                </div>
                                <div class="form-group ionRangeSlider-warning">
                                    <label>Range with negative values</label>
                                    <input type="text" class="form-control demo5" value="" />
                                    <p class="help-block">Set up range with negative values.</p>
                                </div>
                                <div class="form-group ionRangeSlider-danger">
                                    <label>Range using step 100</label>
                                    <input type="text" class="form-control demo6" value="" />
                                    <p class="help-block">Range using step 100.</p>
                                </div>
                                <div class="form-group single-ionRangeSlider ionRangeSlider-light">
                                    <label>Range using strings</label>
                                    <input type="text" class="form-control demo7" value="" />
                                    <p class="help-block">Range using strings.</p>
                                </div>
                                <div class="form-group single-ionRangeSlider ionRangeSlider-dark">
                                    <label>Range with Formatting Number:</label>
                                    <input type="text" class="form-control demo8" value="" />
                                    <p class="help-block">Prettify visual look of numbers.</p>
                                </div>
                                <div class="form-group single-ionRangeSlider ionRangeSlider-success">
                                    <label>You can lock your slider, by using disable option:</label>
                                    <input type="text" class="form-control demo9" value="" />
                                    <p class="help-block">using <code>disable: true</code></p>
                                </div>
                                <div class="form-group single-ionRangeSlider ionRangeSlider-danger">
                                    <label>Use your own prettify function to transform numbers whatever you like.</label>
                                    <input type="text" class="form-control demo10" value="" />
                                    <p class="help-block">For example calculating logarithm of a number</p>
                                </div>
                                <div class="form-group ionRangeSlider-warning">
                                    <label>Force fractional values.</label>
                                    <input type="text" class="form-control demo11" value="" />
                                    <p class="help-block">For example using fractional step 0.1</p>
                                </div>
                                <div class="form-group ionRangeSlider-dark">
                                    <label>Support bar dragging.</label>
                                    <input type="text" class="form-control demo12" value="" />
                                    <p class="help-block">By using <code>drag_interval: true</code></p>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="form-row">
        <div class="col-lg-4">
            <div class="card mb-3">
                <div class="card-header">
                    Ion Range Slider <span class="badge badge-primary">Sharp skin</span>
                    <div class="options float-right">
                        <a class="settings"><i class="fa fa-cog"></i></a>
                        <a href="#" class="collapse"><i class="fa fa-chevron-up"></i></a>
                        <a href="#" class="reload"><i class="fa fa-sync"></i></a>
                        <a href="#" class="fullscreen"><i class=" fa fa-expand"></i></a>
                        <a href="#" class="remove"><i class="fa fa-times"></i></a>
                    </div>
                </div>
                <div class="card-body px-5">
                    <div class="row">
                        <div class="col-lg-12">
                            <form role="form" class="ionRangeSlider-sharp-skin">
                                <div class="form-group single-ionRangeSlider">
                                    <label>Basic With Set min, max and start value Options:</label>
                                    <input type="text" class="form-control demo1" value="" />
                                    <p class="help-block">Start with <small>min, max, from</small>.</p>
                                </div>
                                <div class="form-group single-ionRangeSlider ionRangeSlider-primary">
                                    <label>Basic With Set min, max and start value and grid Options:</label>
                                    <input type="text" class="form-control demo2" value="" />
                                    <p class="help-block">Start with <small>min, max, from</small>.</p>
                                </div>
                                <div class="form-group single-ionRangeSlider ionRangeSlider-secondary">
                                    <label>Set min, max, and start values</label>
                                    <input type="text" class="form-control demo3" value="" />
                                    <p class="help-block">Set min value, max value and start point.</p>
                                </div>
                                <div class="form-group ionRangeSlider-info">
                                    <label>Range with values</label>
                                    <input type="text" class="form-control demo4" value="" />
                                    <p class="help-block">Set type to double and specify range, also showing grid and adding prefix "$".</p>
                                </div>
                                <div class="form-group ionRangeSlider-success">
                                    <label>Range with negative values</label>
                                    <input type="text" class="form-control demo5" value="" />
                                    <p class="help-block">Set up range with negative values.</p>
                                </div>
                                <div class="form-group ionRangeSlider-warning">
                                    <label>Range using step 100</label>
                                    <input type="text" class="form-control demo6" value="" />
                                    <p class="help-block">Range using step 100.</p>
                                </div>
                                <div class="form-group single-ionRangeSlider ionRangeSlider-danger">
                                    <label>Range using strings</label>
                                    <input type="text" class="form-control demo7" value="" />
                                    <p class="help-block">Range using strings.</p>
                                </div>
                                <div class="form-group single-ionRangeSlider ionRangeSlider-light">
                                    <label>Range with Formatting Number:</label>
                                    <input type="text" class="form-control demo8" value="" />
                                    <p class="help-block">Prettify visual look of numbers.</p>
                                </div>
                                <div class="form-group single-ionRangeSlider ionRangeSlider-dark">
                                    <label>You can lock your slider, by using disable option:</label>
                                    <input type="text" class="form-control demo9" value="" />
                                    <p class="help-block">using <code>disable: true</code></p>
                                </div>
                                <div class="form-group single-ionRangeSlider ionRangeSlider-success">
                                    <label>Use your own prettify function to transform numbers whatever you like.</label>
                                    <input type="text" class="form-control demo10" value="" />
                                    <p class="help-block">For example calculating logarithm of a number</p>
                                </div>
                                <div class="form-group ionRangeSlider-danger">
                                    <label>Force fractional values.</label>
                                    <input type="text" class="form-control demo11" value="" />
                                    <p class="help-block">For example using fractional step 0.1</p>
                                </div>
                                <div class="form-group ionRangeSlider-dark">
                                    <label>Support bar dragging.</label>
                                    <input type="text" class="form-control demo12" value="" />
                                    <p class="help-block">By using <code>drag_interval: true</code></p>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-4">
            <div class="card mb-3">
                <div class="card-header">
                    Ion Range Slider <span class="badge badge-primary">Round skin</span>
                    <div class="options float-right">
                        <a class="settings"><i class="fa fa-cog"></i></a>
                        <a href="#" class="collapse"><i class="fa fa-chevron-up"></i></a>
                        <a href="#" class="reload"><i class="fa fa-sync"></i></a>
                        <a href="#" class="fullscreen"><i class=" fa fa-expand"></i></a>
                        <a href="#" class="remove"><i class="fa fa-times"></i></a>
                    </div>
                </div>
                <div class="card-body px-5">
                    <div class="row">
                        <div class="col-lg-12">
                            <form role="form" class="ionRangeSlider-round-skin">
                                <div class="form-group single-ionRangeSlider">
                                    <label>Basic With Set min, max and start value Options:</label>
                                    <input type="text" class="form-control demo1" value="" />
                                    <p class="help-block">Start with <small>min, max, from</small>.</p>
                                </div>
                                <div class="form-group single-ionRangeSlider ionRangeSlider-primary">
                                    <label>Basic With Set min, max and start value and grid Options:</label>
                                    <input type="text" class="form-control demo2" value="" />
                                    <p class="help-block">Start with <small>min, max, from</small>.</p>
                                </div>
                                <div class="form-group single-ionRangeSlider ionRangeSlider-secondary">
                                    <label>Set min, max, and start values</label>
                                    <input type="text" class="form-control demo3" value="" />
                                    <p class="help-block">Set min value, max value and start point.</p>
                                </div>
                                <div class="form-group ionRangeSlider-info">
                                    <label>Range with values</label>
                                    <input type="text" class="form-control demo4" value="" />
                                    <p class="help-block">Set type to double and specify range, also showing grid and adding prefix "$".</p>
                                </div>
                                <div class="form-group ionRangeSlider-success">
                                    <label>Range with negative values</label>
                                    <input type="text" class="form-control demo5" value="" />
                                    <p class="help-block">Set up range with negative values.</p>
                                </div>
                                <div class="form-group ionRangeSlider-warning">
                                    <label>Range using step 100</label>
                                    <input type="text" class="form-control demo6" value="" />
                                    <p class="help-block">Range using step 100.</p>
                                </div>
                                <div class="form-group single-ionRangeSlider ionRangeSlider-danger">
                                    <label>Range using strings</label>
                                    <input type="text" class="form-control demo7" value="" />
                                    <p class="help-block">Range using strings.</p>
                                </div>
                                <div class="form-group single-ionRangeSlider ionRangeSlider-light">
                                    <label>Range with Formatting Number:</label>
                                    <input type="text" class="form-control demo8" value="" />
                                    <p class="help-block">Prettify visual look of numbers.</p>
                                </div>
                                <div class="form-group single-ionRangeSlider ionRangeSlider-dark">
                                    <label>You can lock your slider, by using disable option:</label>
                                    <input type="text" class="form-control demo9" value="" />
                                    <p class="help-block">using <code>disable: true</code></p>
                                </div>
                                <div class="form-group single-ionRangeSlider ionRangeSlider-danger">
                                    <label>Use your own prettify function to transform numbers whatever you like.</label>
                                    <input type="text" class="form-control demo10" value="" />
                                    <p class="help-block">For example calculating logarithm of a number</p>
                                </div>
                                <div class="form-group ionRangeSlider-success">
                                    <label>Force fractional values.</label>
                                    <input type="text" class="form-control demo11" value="" />
                                    <p class="help-block">For example using fractional step 0.1</p>
                                </div>
                                <div class="form-group ionRangeSlider-warning">
                                    <label>Support bar dragging.</label>
                                    <input type="text" class="form-control demo12" value="" />
                                    <p class="help-block">By using <code>drag_interval: true</code></p>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-4">
            <div class="card mb-3">
                <div class="card-header">
                    Ion Range Slider <span class="badge badge-primary">Square skin</span>
                    <div class="options float-right">
                        <a class="settings"><i class="fa fa-cog"></i></a>
                        <a href="#" class="collapse"><i class="fa fa-chevron-up"></i></a>
                        <a href="#" class="reload"><i class="fa fa-sync"></i></a>
                        <a href="#" class="fullscreen"><i class=" fa fa-expand"></i></a>
                        <a href="#" class="remove"><i class="fa fa-times"></i></a>
                    </div>
                </div>
                <div class="card-body px-5">
                    <div class="row">
                        <div class="col-lg-12">
                            <form role="form" class="ionRangeSlider-square-skin">
                                <div class="form-group single-ionRangeSlider">
                                    <label>Basic With Set min, max and start value Options:</label>
                                    <input type="text" class="form-control demo1" value="" />
                                    <p class="help-block">Start with <small>min, max, from</small>.</p>
                                </div>
                                <div class="form-group single-ionRangeSlider ionRangeSlider-primary">
                                    <label>Basic With Set min, max and start value and grid Options:</label>
                                    <input type="text" class="form-control demo2" value="" />
                                    <p class="help-block">Start with <small>min, max, from</small>.</p>
                                </div>
                                <div class="form-group single-ionRangeSlider ionRangeSlider-secondary">
                                    <label>Set min, max, and start values</label>
                                    <input type="text" class="form-control demo3" value="" />
                                    <p class="help-block">Set min value, max value and start point.</p>
                                </div>
                                <div class="form-group ionRangeSlider-info">
                                    <label>Range with values</label>
                                    <input type="text" class="form-control demo4" value="" />
                                    <p class="help-block">Set type to double and specify range, also showing grid and adding prefix "$".</p>
                                </div>
                                <div class="form-group ionRangeSlider-success">
                                    <label>Range with negative values</label>
                                    <input type="text" class="form-control demo5" value="" />
                                    <p class="help-block">Set up range with negative values.</p>
                                </div>
                                <div class="form-group ionRangeSlider-warning">
                                    <label>Range using step 100</label>
                                    <input type="text" class="form-control demo6" value="" />
                                    <p class="help-block">Range using step 100.</p>
                                </div>
                                <div class="form-group single-ionRangeSlider ionRangeSlider-danger">
                                    <label>Range using strings</label>
                                    <input type="text" class="form-control demo7" value="" />
                                    <p class="help-block">Range using strings.</p>
                                </div>
                                <div class="form-group single-ionRangeSlider ionRangeSlider-light">
                                    <label>Range with Formatting Number:</label>
                                    <input type="text" class="form-control demo8" value="" />
                                    <p class="help-block">Prettify visual look of numbers.</p>
                                </div>
                                <div class="form-group single-ionRangeSlider ionRangeSlider-dark">
                                    <label>You can lock your slider, by using disable option:</label>
                                    <input type="text" class="form-control demo9" value="" />
                                    <p class="help-block">using <code>disable: true</code></p>
                                </div>
                                <div class="form-group single-ionRangeSlider ionRangeSlider-success">
                                    <label>Use your own prettify function to transform numbers whatever you like.</label>
                                    <input type="text" class="form-control demo10" value="" />
                                    <p class="help-block">For example calculating logarithm of a number</p>
                                </div>
                                <div class="form-group ionRangeSlider-warning">
                                    <label>Force fractional values.</label>
                                    <input type="text" class="form-control demo11" value="" />
                                    <p class="help-block">For example using fractional step 0.1</p>
                                </div>
                                <div class="form-group ionRangeSlider-danger">
                                    <label>Support bar dragging.</label>
                                    <input type="text" class="form-control demo12" value="" />
                                    <p class="help-block">By using <code>drag_interval: true</code></p>
                                </div>
                            </form>
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
                var flipperRTLFunction = function (min, max, originalPrettify) {
                    return function (num) {
                        var tmp_min = min,
                                tmp_max = max,
                                tmp_num = num;
                        tmp_min = 0;
                        tmp_max = max - min;
                        tmp_num = num - min;
                        tmp_num = tmp_max - tmp_num;
                        console.log("num is = " + num + " , return is = " + (tmp_num + min));
                        return $.isFunction(originalPrettify) ? originalPrettify(tmp_num + min) : tmp_num + min;
                    };
                };

                var my_prettify = function (n) {
                    var num = Math.log2(n);
                    return n + " → " + (+num.toFixed(3));
                };

                var demosGenerator = function (skinType) {
                    var min = 10;
                    var max = 90;
                    var from = 30;
                    from = (javatmp.settings.isRTL === true) ? ((max + min) - from) : from;
                    $("form.ionRangeSlider-" + skinType + "-skin .demo1").ionRangeSlider({
                        skin: skinType,
                        min: min,
                        max: max,
                        from: from,
                        prettify: (javatmp.settings.isRTL === true) ? flipperRTLFunction(min, max) : null,
                        onStart: function (data) {
                            console.log("onStart:");
                            console.log(data);
                        },
                        onChange: function (data) {
                            console.log("onChange:");
                            console.log(data);
                        },
                        onFinish: function (data) {
                            console.log("onFinish:");
                            console.log(data);
                        },
                        onUpdate: function (data) {
                            console.log("onUpdate:");
                            console.log(data);
                        }
                    });
                    $("form.ionRangeSlider-" + skinType + "-skin .demo2").ionRangeSlider({
                        skin: skinType,
                        min: min,
                        max: max,
                        from: from,
                        grid: true,
                        prettify: (javatmp.settings.isRTL === true) ? flipperRTLFunction(min, max) : null,
                        onStart: function (data) {
                            console.log("onStart:");
                            console.log(data);
                        },
                        onChange: function (data) {
                            console.log("onChange:");
                            console.log(data);
                        },
                        onFinish: function (data) {
                            console.log("onFinish:");
                            console.log(data);
                        },
                        onUpdate: function (data) {
                            console.log("onUpdate:");
                            console.log(data);
                        }
                    });
                    min = -100;
                    max = 1000;
                    from = 550;
                    from = (javatmp.settings.isRTL === true) ? ((max + min) - from) : from;
                    $("form.ionRangeSlider-" + skinType + "-skin .demo3").ionRangeSlider({
                        skin: skinType,
                        min: min,
                        max: max,
                        from: from,
                        grid: true,
                        to_min: 110,
                        to_max: 950,
                        from_shadow: true,
                        to_shadow: true,
                        prettify: (javatmp.settings.isRTL === true) ? flipperRTLFunction(min, max) : null,
                        onStart: function (data) {
                            console.log("onStart:");
                            console.log(data);
                        },
                        onChange: function (data) {
                            console.log("onChange:");
                            console.log(data);
                        },
                        onFinish: function (data) {
                            console.log("onFinish:");
                            console.log(data);
                        },
                        onUpdate: function (data) {
                            console.log("onUpdate:");
                            console.log(data);
                        }
                    });
                    min = 0;
                    max = 1000;
                    from = 200;
                    var to = 800;

                    console.log("new from = " + from + " , to = " + to);
                    $("form.ionRangeSlider-" + skinType + "-skin .demo4").ionRangeSlider({
                        skin: skinType,
                        type: "double",
                        grid: true,
                        min: min,
                        max: max,
                        to_min: 100,
                        to_max: 900,
                        from_min: 100,
                        from_max: 900,
                        from: from,
                        to: to,
                        from_shadow: false,
                        to_shadow: true,
                        prefix: "$",
                        prettify: (javatmp.settings.isRTL === true) ? flipperRTLFunction(min, max) : null,
                        onStart: function (data) {
                            console.log("onStart:");
                            console.log(data);
                        },
                        onChange: function (data) {
                            console.log("onChange:");
                            console.log(data);
                        },
                        onFinish: function (data) {
                            console.log("onFinish:");
                            console.log(data);
                        },
                        onUpdate: function (data) {
                            console.log("onUpdate:");
                            console.log(data);
                        }
                    });
                    min = -1000;
                    max = 1000;
                    from = -500;
                    to = 500;
                    $("form.ionRangeSlider-" + skinType + "-skin .demo5").ionRangeSlider({
                        skin: skinType,
                        type: "double",
                        grid: true,
                        min: min,
                        max: max,
                        from: from,
                        from_shadow: true,
                        to_shadow: true,
                        to: to,
                        prettify: (javatmp.settings.isRTL === true) ? flipperRTLFunction(min, max) : null,
                        onStart: function (data) {
                            console.log("onStart:");
                            console.log(data);
                        },
                        onChange: function (data) {
                            console.log("onChange:");
                            console.log(data);
                        },
                        onFinish: function (data) {
                            console.log("onFinish:");
                            console.log(data);
                        },
                        onUpdate: function (data) {
                            console.log("onUpdate:");
                            console.log(data);
                        }
                    });
                    min = -1000;
                    max = 1000;
                    from = -500;
                    to = 500;
                    $("form.ionRangeSlider-" + skinType + "-skin .demo6").ionRangeSlider({
                        skin: skinType,
                        type: "double",
                        grid: true,
                        min: min,
                        max: max,
                        from: from,
                        to: to,
                        from_shadow: true,
                        to_shadow: true,
                        step: 100,
                        prettify: (javatmp.settings.isRTL === true) ? flipperRTLFunction(min, max) : null,
                        onStart: function (data) {
                            console.log("onStart:");
                            console.log(data);
                        },
                        onChange: function (data) {
                            console.log("onChange:");
                            console.log(data);
                        },
                        onFinish: function (data) {
                            console.log("onFinish:");
                            console.log(data);
                        },
                        onUpdate: function (data) {
                            console.log("onUpdate:");
                            console.log(data);
                        }
                    });
                    min = 0;
                    max = 11;
                    from = 3;
                    from = (javatmp.settings.isRTL === true) ? ((max + min) - from) : from;
                    $("form.ionRangeSlider-" + skinType + "-skin .demo7").ionRangeSlider({
                        skin: skinType,
                        grid: true,
                        from: from,
                        from_shadow: true,
                        to_shadow: true,
                        values: [
                            "January", "February", "March",
                            "April", "May", "June",
                            "July", "August", "September",
                            "October", "November", "December"
                        ].reverse(),
                        onStart: function (data) {
                            console.log("onStart:");
                            console.log(data);
                        },
                        onChange: function (data) {
                            console.log("onChange:");
                            console.log(data);
                        },
                        onFinish: function (data) {
                            console.log("onFinish:");
                            console.log(data);
                        },
                        onUpdate: function (data) {
                            console.log("onUpdate:");
                            console.log(data);
                        }
                    });
                    min = 1000;
                    max = 1000000;
                    from = 300000;
                    from = (javatmp.settings.isRTL === true) ? ((max + min) - from) : from;
                    $("form.ionRangeSlider-" + skinType + "-skin .demo8").ionRangeSlider({
                        skin: skinType,
                        grid: true,
                        min: min,
                        max: max,
                        from: from,
                        step: 1000,
                        prettify_enabled: true,
                        from_shadow: true,
                        to_shadow: true,
                        prettify_separator: ",",
                        prettify: (javatmp.settings.isRTL === true) ? flipperRTLFunction(min, max) : null,
                        onStart: function (data) {
                            console.log("onStart:");
                            console.log(data);
                        },
                        onChange: function (data) {
                            console.log("onChange:");
                            console.log(data);
                        },
                        onFinish: function (data) {
                            console.log("onFinish:");
                            console.log(data);
                        },
                        onUpdate: function (data) {
                            console.log("onUpdate:");
                            console.log(data);
                        }
                    });
                    min = 1000;
                    max = 1000000;
                    from = 300000;
                    from = (javatmp.settings.isRTL === true) ? ((max + min) - from) : from;
                    $("form.ionRangeSlider-" + skinType + "-skin .demo9").ionRangeSlider({
                        skin: skinType,
                        grid: true,
                        min: min,
                        max: max,
                        from: from,
                        step: 1000,
                        prettify_enabled: true,
                        from_shadow: true,
                        to_shadow: true,
                        prettify_separator: ",",
                        disable: true,
                        prettify: (javatmp.settings.isRTL === true) ? flipperRTLFunction(min, max) : null,
                        onStart: function (data) {
                            console.log("onStart:");
                            console.log(data);
                        },
                        onChange: function (data) {
                            console.log("onChange:");
                            console.log(data);
                        },
                        onFinish: function (data) {
                            console.log("onFinish:");
                            console.log(data);
                        },
                        onUpdate: function (data) {
                            console.log("onUpdate:");
                            console.log(data);
                        }
                    });

                    min = 1;
                    max = 1000;
                    from = 100;
                    from = (javatmp.settings.isRTL === true) ? ((max + min) - from) : from;

                    $("form.ionRangeSlider-" + skinType + "-skin .demo10").ionRangeSlider({
                        skin: skinType,
                        grid: true,
                        min: min,
                        max: max,
                        from: from,
                        prettify: (javatmp.settings.isRTL === true) ? flipperRTLFunction(min, max, my_prettify) : my_prettify
                    });

                    min = -12.8;
                    max = 12.8;
                    from = -3.2;
                    to = 3.2;
//                    from = (javatmp.settings.isRTL === true) ? ((max + min) - from) : from;

                    $("form.ionRangeSlider-" + skinType + "-skin .demo11").ionRangeSlider({
                        skin: skinType,
                        type: "double",
                        grid: true,
                        min: min,
                        max: max,
                        from: from,
                        to: to,
                        step: 0.1,
                        prettify: (javatmp.settings.isRTL === true) ? flipperRTLFunction(min, max) : null
                    });

                    min = 0;
                    max = 1000;
                    from = 400;
                    to = 600;
//                    from = (javatmp.settings.isRTL === true) ? ((max + min) - from) : from;

                    $("form.ionRangeSlider-" + skinType + "-skin .demo12").ionRangeSlider({
                        skin: skinType,
                        type: "double",
                        min: min,
                        max: max,
                        from: from,
                        to: to,
                        drag_interval: true,
                        min_interval: null,
                        max_interval: null,
                        prettify: (javatmp.settings.isRTL === true) ? flipperRTLFunction(min, max) : null
                    });

                };
                demosGenerator("flat");
                demosGenerator("big");
                demosGenerator("modern");
                demosGenerator("sharp");
                demosGenerator("round");
                demosGenerator("square");


            }(jQuery));
        });
    </script>
</div>