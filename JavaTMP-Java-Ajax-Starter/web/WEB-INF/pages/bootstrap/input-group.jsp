<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="dynamic-ajax-content">
    <div class="page-header">
        <h1>Bootstrap Input Group</h1>
    </div>
    <div class="row">
        <div class="col">
            <div class="card my-3">
                <div class="card-header">

                    <div class="options float-right">
                        <a class="settings"><i class="fa fa-cog"></i></a>
                        <a href="#" class="collapse"><i class="fa fa-chevron-up"></i></a>
                        <a href="#" class="reload"><i class="fa fa-sync"></i></a>
                        <a href="#" class="fullscreen"><i class=" fa fa-expand"></i></a>
                        <a href="#" class="remove"><i class="fa fa-times"></i></a>
                    </div>
                </div>
                <div class="card-body">
                    <h4 class="card-title text-primary">Basic example</h4>
                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text" id="basic-addon1">@</span>
                        </div>
                        <input type="text" class="form-control" placeholder="Username" aria-label="Username" aria-describedby="basic-addon1">
                    </div>
                    <div class="input-group mb-3">
                        <input type="text" class="form-control" placeholder="Recipient's username" aria-label="Recipient's username" aria-describedby="basic-addon2">
                        <div class="input-group-append">
                            <span class="input-group-text" id="basic-addon2">@example.com</span>
                        </div>
                    </div>
                    <label for="basic-url">Your vanity URL</label>
                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text" id="basic-addon3">https://example.com/users/</span>
                        </div>
                        <input type="text" class="form-control" id="basic-url" aria-describedby="basic-addon3">
                    </div>

                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text">$</span>
                        </div>
                        <input type="text" class="form-control" aria-label="Amount (to the nearest dollar)">
                        <div class="input-group-append">
                            <span class="input-group-text">.00</span>
                        </div>
                    </div>
                    <h4 class="card-title text-primary">Sizing</h4>
                    <div class="input-group input-group-sm mb-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text" id="inputGroup-sizing-sm">Small</span>
                        </div>
                        <input type="text" class="form-control" aria-label="Small" aria-describedby="inputGroup-sizing-sm">
                    </div>

                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text" id="inputGroup-sizing-default">Default</span>
                        </div>
                        <input type="text" class="form-control" aria-label="Default" aria-describedby="inputGroup-sizing-default">
                    </div>

                    <div class="input-group input-group-lg">
                        <div class="input-group-prepend">
                            <span class="input-group-text" id="inputGroup-sizing-lg">Large</span>
                        </div>
                        <input type="text" class="form-control" aria-label="Large" aria-describedby="inputGroup-sizing-sm">
                    </div>
                    <h4 class="card-title text-primary">Checkboxes and radio addons</h4>
                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <div class="input-group-text">
                                <input type="checkbox" aria-label="Checkbox for following text input">
                            </div>
                        </div>
                        <input type="text" class="form-control" aria-label="Text input with checkbox">
                    </div>
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <div class="input-group-text">
                                <input type="radio" aria-label="Radio button for following text input">
                            </div>
                        </div>
                        <input type="text" class="form-control" aria-label="Text input with radio button">
                    </div>
                    <h4 class="card-title text-primary">Multiple addons</h4>
                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text" id="">First and last name</span>
                        </div>
                        <input type="text" class="form-control">
                        <input type="text" class="form-control">
                    </div>
                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text">$</span>
                            <span class="input-group-text">0.00</span>
                        </div>
                        <input type="text" class="form-control" aria-label="Amount (to the nearest dollar)">
                    </div>

                    <div class="input-group">
                        <input type="text" class="form-control" aria-label="Amount (to the nearest dollar)">
                        <div class="input-group-append">
                            <span class="input-group-text">$</span>
                            <span class="input-group-text">0.00</span>
                        </div>
                    </div>
                    <h4 class="card-title text-primary">Button addons</h4>
                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <button class="btn btn-outline-secondary" type="button">Button</button>
                        </div>
                        <input type="text" class="form-control" placeholder="" aria-label="" aria-describedby="basic-addon1">
                    </div>

                    <div class="input-group mb-3">
                        <input type="text" class="form-control" placeholder="Recipient's username" aria-label="Recipient's username" aria-describedby="basic-addon2">
                        <div class="input-group-append">
                            <button class="btn btn-outline-secondary" type="button">Button</button>
                        </div>
                    </div>

                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <button class="btn btn-outline-secondary" type="button">Button</button>
                            <button class="btn btn-outline-secondary" type="button">Button</button>
                        </div>
                        <input type="text" class="form-control" placeholder="" aria-label="" aria-describedby="basic-addon1">
                    </div>

                    <div class="input-group">
                        <input type="text" class="form-control" placeholder="Recipient's username" aria-label="Recipient's username" aria-describedby="basic-addon2">
                        <div class="input-group-append">
                            <button class="btn btn-outline-secondary" type="button">Button</button>
                            <button class="btn btn-outline-secondary" type="button">Button</button>
                        </div>
                    </div>
                    <h4 class="card-title text-primary">Buttons with dropdowns</h4>
                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <button class="btn btn-outline-secondary dropdown-toggle" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Dropdown</button>
                            <div class="dropdown-menu">
                                <a class="dropdown-item" href="#">Action</a>
                                <a class="dropdown-item" href="#">Another action</a>
                                <a class="dropdown-item" href="#">Something else here</a>
                                <div role="separator" class="dropdown-divider"></div>
                                <a class="dropdown-item" href="#">Separated link</a>
                            </div>
                        </div>
                        <input type="text" class="form-control" aria-label="Text input with dropdown button">
                    </div>
                    <div class="input-group">
                        <input type="text" class="form-control" aria-label="Text input with dropdown button">
                        <div class="input-group-append">
                            <button class="btn btn-outline-secondary dropdown-toggle" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Dropdown</button>
                            <div class="dropdown-menu">
                                <a class="dropdown-item" href="#">Action</a>
                                <a class="dropdown-item" href="#">Another action</a>
                                <a class="dropdown-item" href="#">Something else here</a>
                                <div role="separator" class="dropdown-divider"></div>
                                <a class="dropdown-item" href="#">Separated link</a>
                            </div>
                        </div>
                    </div>
                    <h4 class="card-title text-primary">Segmented buttons</h4>
                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <button type="button" class="btn btn-outline-secondary">Action</button>
                            <button type="button" class="btn btn-outline-secondary dropdown-toggle dropdown-toggle-split" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <span class="sr-only">Toggle Dropdown</span>
                            </button>
                            <div class="dropdown-menu">
                                <a class="dropdown-item" href="#">Action</a>
                                <a class="dropdown-item" href="#">Another action</a>
                                <a class="dropdown-item" href="#">Something else here</a>
                                <div role="separator" class="dropdown-divider"></div>
                                <a class="dropdown-item" href="#">Separated link</a>
                            </div>
                        </div>
                        <input type="text" class="form-control" aria-label="Text input with segmented dropdown button">
                    </div>

                    <div class="input-group">
                        <input type="text" class="form-control" aria-label="Text input with segmented dropdown button">
                        <div class="input-group-append">
                            <button type="button" class="btn btn-outline-secondary">Action</button>
                            <button type="button" class="btn btn-outline-secondary dropdown-toggle dropdown-toggle-split" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <span class="sr-only">Toggle Dropdown</span>
                            </button>
                            <div class="dropdown-menu">
                                <a class="dropdown-item" href="#">Action</a>
                                <a class="dropdown-item" href="#">Another action</a>
                                <a class="dropdown-item" href="#">Something else here</a>
                                <div role="separator" class="dropdown-divider"></div>
                                <a class="dropdown-item" href="#">Separated link</a>
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