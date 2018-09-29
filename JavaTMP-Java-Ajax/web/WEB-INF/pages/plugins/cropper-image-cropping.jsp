<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="dynamic-ajax-content">
    <div class="row">
        <div class="col-lg-12">
            <div class="alert alert-info my-3">
                <p>A jQuery plugin wrapper for JavaScript Cropper.js image cropper</p>
                <p>
                    <a class="btn btn-info" target="_blank" href="https://fengyuanchen.github.io/jquery-cropper/">
                        <i class="fa fa-external-link-alt fa-fw"></i>Demo Page
                    </a>
                    <a class="btn btn-info" target="_blank" href="https://github.com/fengyuanchen/cropperjs">
                        <i class="fa fa-external-link-alt fa-fw"></i>Cropperjs github.com Page
                    </a>
                    <a class="btn btn-info" target="_blank" href="https://github.com/fengyuanchen/jquery-cropper">
                        <i class="fa fa-external-link-alt fa-fw"></i>jquery-cropper github.com Page
                    </a>
                </p>
            </div>
            <div class="card my-3">
                <div class="card-header">
                    jQuery Cropper
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
                            <!-- <h3>Demo:</h3> -->
                            <div class="img-container">
                                <img id="image" src="${pageContext.request.contextPath}/assets/img/gallery/large-image.jpg" alt="Picture"
                                     class="img-responsive" />
                            </div>
                        </div>
                        <div class="col-md-3">
                            <!-- <h3>Preview:</h3> -->
                            <div class="docs-preview clearfix">
                                <div class="img-preview preview-lg"></div>
                                <div class="img-preview preview-md"></div>
                                <div class="img-preview preview-sm"></div>
                                <div class="img-preview preview-xs"></div>
                            </div>

                            <!-- <h3>Data:</h3> -->
                            <div class="docs-data">
                                <div class="input-group input-group-sm">
                                    <span class="input-group-prepend">
                                        <label class="input-group-text" for="dataX">X</label>
                                    </span>
                                    <input type="text" class="form-control" id="dataX" placeholder="x">
                                    <span class="input-group-append">
                                        <span class="input-group-text">px</span>
                                    </span>
                                </div>
                                <div class="input-group input-group-sm">
                                    <span class="input-group-prepend">
                                        <label class="input-group-text" for="dataY">Y</label>
                                    </span>
                                    <input type="text" class="form-control" id="dataY" placeholder="y">
                                    <span class="input-group-append">
                                        <span class="input-group-text">px</span>
                                    </span>
                                </div>
                                <div class="input-group input-group-sm">
                                    <span class="input-group-prepend">
                                        <label class="input-group-text" for="dataWidth">Width</label>
                                    </span>
                                    <input type="text" class="form-control" id="dataWidth" placeholder="width">
                                    <span class="input-group-append">
                                        <span class="input-group-text">px</span>
                                    </span>
                                </div>
                                <div class="input-group input-group-sm">
                                    <span class="input-group-prepend">
                                        <label class="input-group-text" for="dataHeight">Height</label>
                                    </span>
                                    <input type="text" class="form-control" id="dataHeight" placeholder="height">
                                    <span class="input-group-append">
                                        <span class="input-group-text">px</span>
                                    </span>
                                </div>
                                <div class="input-group input-group-sm">
                                    <span class="input-group-prepend">
                                        <label class="input-group-text" for="dataRotate">Rotate</label>
                                    </span>
                                    <input type="text" class="form-control" id="dataRotate" placeholder="rotate">
                                    <span class="input-group-append">
                                        <span class="input-group-text">deg</span>
                                    </span>
                                </div>
                                <div class="input-group input-group-sm">
                                    <span class="input-group-prepend">
                                        <label class="input-group-text" for="dataScaleX">ScaleX</label>
                                    </span>
                                    <input type="text" class="form-control" id="dataScaleX" placeholder="scaleX">
                                </div>
                                <div class="input-group input-group-sm">
                                    <span class="input-group-prepend">
                                        <label class="input-group-text" for="dataScaleY">ScaleY</label>
                                    </span>
                                    <input type="text" class="form-control" id="dataScaleY" placeholder="scaleY">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-9 docs-buttons">
                            <!-- <h3>Toolbar:</h3> -->
                            <div class="btn-group">
                                <button type="button" class="btn btn-primary" data-method="setDragMode" data-option="move" title="Move">
                                    <span class="docs-tooltip" data-toggle="tooltip" data-animation="false" title="$().cropper(&quot;setDragMode&quot;, &quot;move&quot;)">
                                        <span class="fa fa-arrows-alt"></span>
                                    </span>
                                </button>
                                <button type="button" class="btn btn-primary" data-method="setDragMode" data-option="crop" title="Crop">
                                    <span class="docs-tooltip" data-toggle="tooltip" data-animation="false" title="$().cropper(&quot;setDragMode&quot;, &quot;crop&quot;)">
                                        <span class="fa fa-crop"></span>
                                    </span>
                                </button>
                            </div>

                            <div class="btn-group">
                                <button type="button" class="btn btn-primary" data-method="zoom" data-option="0.1" title="Zoom In">
                                    <span class="docs-tooltip" data-toggle="tooltip" data-animation="false" title="$().cropper(&quot;zoom&quot;, 0.1)">
                                        <span class="fa fa-search-plus"></span>
                                    </span>
                                </button>
                                <button type="button" class="btn btn-primary" data-method="zoom" data-option="-0.1" title="Zoom Out">
                                    <span class="docs-tooltip" data-toggle="tooltip" data-animation="false" title="$().cropper(&quot;zoom&quot;, -0.1)">
                                        <span class="fa fa-search-minus"></span>
                                    </span>
                                </button>
                            </div>

                            <div class="btn-group">
                                <button type="button" class="btn btn-primary" data-method="move" data-option="-10" data-second-option="0" title="Move Left">
                                    <span class="docs-tooltip" data-toggle="tooltip" data-animation="false" title="$().cropper(&quot;move&quot;, -10, 0)">
                                        <span class="fa fa-arrow-left"></span>
                                    </span>
                                </button>
                                <button type="button" class="btn btn-primary" data-method="move" data-option="10" data-second-option="0" title="Move Right">
                                    <span class="docs-tooltip" data-toggle="tooltip" data-animation="false" title="$().cropper(&quot;move&quot;, 10, 0)">
                                        <span class="fa fa-arrow-right"></span>
                                    </span>
                                </button>
                                <button type="button" class="btn btn-primary" data-method="move" data-option="0" data-second-option="-10" title="Move Up">
                                    <span class="docs-tooltip" data-toggle="tooltip" data-animation="false" title="$().cropper(&quot;move&quot;, 0, -10)">
                                        <span class="fa fa-arrow-up"></span>
                                    </span>
                                </button>
                                <button type="button" class="btn btn-primary" data-method="move" data-option="0" data-second-option="10" title="Move Down">
                                    <span class="docs-tooltip" data-toggle="tooltip" data-animation="false" title="$().cropper(&quot;move&quot;, 0, 10)">
                                        <span class="fa fa-arrow-down"></span>
                                    </span>
                                </button>
                            </div>

                            <div class="btn-group">
                                <button type="button" class="btn btn-primary" data-method="rotate" data-option="-45" title="Rotate Left">
                                    <span class="docs-tooltip" data-toggle="tooltip" data-animation="false" title="$().cropper(&quot;rotate&quot;, -45)">
                                        <span class="fa fa-undo"></span>
                                    </span>
                                </button>
                                <button type="button" class="btn btn-primary" data-method="rotate" data-option="45" title="Rotate Right">
                                    <span class="docs-tooltip" data-toggle="tooltip" data-animation="false" title="$().cropper(&quot;rotate&quot;, 45)">
                                        <span class="fa fa-redo"></span>
                                    </span>
                                </button>
                            </div>

                            <div class="btn-group">
                                <button type="button" class="btn btn-primary" data-method="scaleX" data-option="-1" title="Flip Horizontal">
                                    <span class="docs-tooltip" data-toggle="tooltip" data-animation="false" title="$().cropper(&quot;scaleX&quot;, -1)">
                                        <span class="fa fa-arrows-alt-h"></span>
                                    </span>
                                </button>
                                <button type="button" class="btn btn-primary" data-method="scaleY" data-option="-1" title="Flip Vertical">
                                    <span class="docs-tooltip" data-toggle="tooltip" data-animation="false" title="$().cropper(&quot;scaleY&quot;, -1)">
                                        <span class="fa fa-arrows-alt-v"></span>
                                    </span>
                                </button>
                            </div>

                            <div class="btn-group">
                                <button type="button" class="btn btn-primary" data-method="crop" title="Crop">
                                    <span class="docs-tooltip" data-toggle="tooltip" data-animation="false" title="$().cropper(&quot;crop&quot;)">
                                        <span class="fa fa-check"></span>
                                    </span>
                                </button>
                                <button type="button" class="btn btn-primary" data-method="clear" title="Clear">
                                    <span class="docs-tooltip" data-toggle="tooltip" data-animation="false" title="$().cropper(&quot;clear&quot;)">
                                        <span class="fa fa-times"></span>
                                    </span>
                                </button>
                            </div>

                            <div class="btn-group">
                                <button type="button" class="btn btn-primary" data-method="disable" title="Disable">
                                    <span class="docs-tooltip" data-toggle="tooltip" data-animation="false" title="$().cropper(&quot;disable&quot;)">
                                        <span class="fa fa-lock"></span>
                                    </span>
                                </button>
                                <button type="button" class="btn btn-primary" data-method="enable" title="Enable">
                                    <span class="docs-tooltip" data-toggle="tooltip" data-animation="false" title="$().cropper(&quot;enable&quot;)">
                                        <span class="fa fa-unlock"></span>
                                    </span>
                                </button>
                            </div>

                            <div class="btn-group">
                                <button type="button" class="btn btn-primary" data-method="reset" title="Reset">
                                    <span class="docs-tooltip" data-toggle="tooltip" data-animation="false" title="$().cropper(&quot;reset&quot;)">
                                        <span class="fas fa-sync"></span>
                                    </span>
                                </button>
                                <label class="btn btn-primary btn-upload" for="inputImage" title="Upload image file">
                                    <input type="file" class="sr-only" id="inputImage" name="file" accept=".jpg,.jpeg,.png,.gif,.bmp,.tiff">
                                    <span class="docs-tooltip" data-toggle="tooltip" data-animation="false" title="Import image with Blob URLs">
                                        <span class="fa fa-upload"></span>
                                    </span>
                                </label>
                                <button type="button" class="btn btn-primary" data-method="destroy" title="Destroy">
                                    <span class="docs-tooltip" data-toggle="tooltip" data-animation="false" title="$().cropper(&quot;destroy&quot;)">
                                        <span class="fa fa-power-off"></span>
                                    </span>
                                </button>
                            </div>

                            <div class="btn-group btn-group-crop">
                                <button type="button" class="btn btn-success" data-method="getCroppedCanvas" data-option="{ &quot;maxWidth&quot;: 4096, &quot;maxHeight&quot;: 4096 }">
                                    <span class="docs-tooltip" data-toggle="tooltip" data-animation="false" title="$().cropper(&quot;getCroppedCanvas&quot;, { maxWidth: 4096, maxHeight: 4096 })">
                                        Get Cropped Canvas
                                    </span>
                                </button>
                                <button type="button" class="btn btn-success" data-method="getCroppedCanvas" data-option="{ &quot;width&quot;: 160, &quot;height&quot;: 90 }">
                                    <span class="docs-tooltip" data-toggle="tooltip" data-animation="false" title="$().cropper(&quot;getCroppedCanvas&quot;, { width: 160, height: 90 })">
                                        160&times;90
                                    </span>
                                </button>
                                <button type="button" class="btn btn-success" data-method="getCroppedCanvas" data-option="{ &quot;width&quot;: 320, &quot;height&quot;: 180 }">
                                    <span class="docs-tooltip" data-toggle="tooltip" data-animation="false" title="$().cropper(&quot;getCroppedCanvas&quot;, { width: 320, height: 180 })">
                                        320&times;180
                                    </span>
                                </button>
                            </div>

                            <!-- Show the cropped image in modal -->
                            <div class="modal fade docs-cropped" id="getCroppedCanvasModal" aria-hidden="true" aria-labelledby="getCroppedCanvasTitle" role="dialog" tabindex="-1">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="getCroppedCanvasTitle">Cropped</h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <div class="modal-body"></div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                            <a class="btn btn-primary" id="download" href="javascript:void(0);" download="cropped.jpg">Download</a>
                                        </div>
                                    </div>
                                </div>
                            </div><!-- /.modal -->

                            <button type="button" class="btn btn-secondary" data-method="getData" data-option data-target="#putData">
                                <span class="docs-tooltip" data-toggle="tooltip" data-animation="false" title="$().cropper(&quot;getData&quot;)">
                                    Get Data
                                </span>
                            </button>
                            <button type="button" class="btn btn-secondary" data-method="setData" data-target="#putData">
                                <span class="docs-tooltip" data-toggle="tooltip" data-animation="false" title="$().cropper(&quot;setData&quot;, data)">
                                    Set Data
                                </span>
                            </button>
                            <button type="button" class="btn btn-secondary" data-method="getContainerData" data-option data-target="#putData">
                                <span class="docs-tooltip" data-toggle="tooltip" data-animation="false" title="$().cropper(&quot;getContainerData&quot;)">
                                    Get Container Data
                                </span>
                            </button>
                            <button type="button" class="btn btn-secondary" data-method="getImageData" data-option data-target="#putData">
                                <span class="docs-tooltip" data-toggle="tooltip" data-animation="false" title="$().cropper(&quot;getImageData&quot;)">
                                    Get Image Data
                                </span>
                            </button>
                            <button type="button" class="btn btn-secondary" data-method="getCanvasData" data-option data-target="#putData">
                                <span class="docs-tooltip" data-toggle="tooltip" data-animation="false" title="$().cropper(&quot;getCanvasData&quot;)">
                                    Get Canvas Data
                                </span>
                            </button>
                            <button type="button" class="btn btn-secondary" data-method="setCanvasData" data-target="#putData">
                                <span class="docs-tooltip" data-toggle="tooltip" data-animation="false" title="$().cropper(&quot;setCanvasData&quot;, data)">
                                    Set Canvas Data
                                </span>
                            </button>
                            <button type="button" class="btn btn-secondary" data-method="getCropBoxData" data-option data-target="#putData">
                                <span class="docs-tooltip" data-toggle="tooltip" data-animation="false" title="$().cropper(&quot;getCropBoxData&quot;)">
                                    Get Crop Box Data
                                </span>
                            </button>
                            <button type="button" class="btn btn-secondary" data-method="setCropBoxData" data-target="#putData">
                                <span class="docs-tooltip" data-toggle="tooltip" data-animation="false" title="$().cropper(&quot;setCropBoxData&quot;, data)">
                                    Set Crop Box Data
                                </span>
                            </button>
                            <button type="button" class="btn btn-secondary" data-method="moveTo" data-option="0">
                                <span class="docs-tooltip" data-toggle="tooltip" data-animation="false" title="cropper.moveTo(0)">
                                    Move to [0,0]
                                </span>
                            </button>
                            <button type="button" class="btn btn-secondary" data-method="zoomTo" data-option="1">
                                <span class="docs-tooltip" data-toggle="tooltip" data-animation="false" title="cropper.zoomTo(1)">
                                    Zoom to 100%
                                </span>
                            </button>
                            <button type="button" class="btn btn-secondary" data-method="rotateTo" data-option="180">
                                <span class="docs-tooltip" data-toggle="tooltip" data-animation="false" title="cropper.rotateTo(180)">
                                    Rotate 180°
                                </span>
                            </button>
                            <button type="button" class="btn btn-secondary" data-method="scale" data-option="-2" data-second-option="-1">
                                <span class="docs-tooltip" data-toggle="tooltip" title="cropper.scale(-2, -1)">
                                    Scale (-2, -1)
                                </span>
                            </button>
                            <textarea type="text" class="form-control" id="putData" rows="1" placeholder="Get data to here or set data with this value"></textarea>
                        </div><!-- /.docs-buttons -->

                        <div class="col-md-3 docs-toggles">
                            <!-- <h3>Toggles:</h3> -->
                            <div class="btn-group d-flex flex-nowrap" data-toggle="buttons">
                                <label class="btn btn-primary active">
                                    <input type="radio" class="sr-only" id="aspectRatio0" name="aspectRatio" value="1.7777777777777777">
                                    <span class="docs-tooltip" data-toggle="tooltip" data-animation="false" title="aspectRatio: 16 / 9">
                                        16:9
                                    </span>
                                </label>
                                <label class="btn btn-primary">
                                    <input type="radio" class="sr-only" id="aspectRatio1" name="aspectRatio" value="1.3333333333333333">
                                    <span class="docs-tooltip" data-toggle="tooltip" data-animation="false" title="aspectRatio: 4 / 3">
                                        4:3
                                    </span>
                                </label>
                                <label class="btn btn-primary">
                                    <input type="radio" class="sr-only" id="aspectRatio2" name="aspectRatio" value="1">
                                    <span class="docs-tooltip" data-toggle="tooltip" data-animation="false" title="aspectRatio: 1 / 1">
                                        1:1
                                    </span>
                                </label>
                                <label class="btn btn-primary">
                                    <input type="radio" class="sr-only" id="aspectRatio3" name="aspectRatio" value="0.6666666666666666">
                                    <span class="docs-tooltip" data-toggle="tooltip" data-animation="false" title="aspectRatio: 2 / 3">
                                        2:3
                                    </span>
                                </label>
                                <label class="btn btn-primary">
                                    <input type="radio" class="sr-only" id="aspectRatio4" name="aspectRatio" value="NaN">
                                    <span class="docs-tooltip" data-toggle="tooltip" data-animation="false" title="aspectRatio: NaN">
                                        Free
                                    </span>
                                </label>
                            </div>

                            <div class="btn-group d-flex flex-nowrap" data-toggle="buttons">
                                <label class="btn btn-primary active">
                                    <input type="radio" class="sr-only" id="viewMode0" name="viewMode" value="0" checked>
                                    <span class="docs-tooltip" data-toggle="tooltip" data-animation="false" title="View Mode 0">
                                        VM0
                                    </span>
                                </label>
                                <label class="btn btn-primary">
                                    <input type="radio" class="sr-only" id="viewMode1" name="viewMode" value="1">
                                    <span class="docs-tooltip" data-toggle="tooltip" data-animation="false" title="View Mode 1">
                                        VM1
                                    </span>
                                </label>
                                <label class="btn btn-primary">
                                    <input type="radio" class="sr-only" id="viewMode2" name="viewMode" value="2">
                                    <span class="docs-tooltip" data-toggle="tooltip" data-animation="false" title="View Mode 2">
                                        VM2
                                    </span>
                                </label>
                                <label class="btn btn-primary">
                                    <input type="radio" class="sr-only" id="viewMode3" name="viewMode" value="3">
                                    <span class="docs-tooltip" data-toggle="tooltip" data-animation="false" title="View Mode 3">
                                        VM3
                                    </span>
                                </label>
                            </div>

                            <div class="dropdown dropup docs-options">
                                <button type="button" class="btn btn-primary btn-block dropdown-toggle" id="toggleOptions" data-toggle="dropdown" aria-expanded="true">
                                    Toggle Options
                                    <span class="caret"></span>
                                </button>
                                <ul class="dropdown-menu" aria-labelledby="toggleOptions" role="menu">
                                    <li class="dropdown-item">
                                        <div class="form-check">
                                            <input class="form-check-input" id="responsive" type="checkbox" name="responsive" checked>
                                            <label class="form-check-label" for="responsive">responsive</label>
                                        </div>
                                    </li>
                                    <li class="dropdown-item">
                                        <div class="form-check">
                                            <input class="form-check-input" id="restore" type="checkbox" name="restore" checked>
                                            <label class="form-check-label" for="restore">restore</label>
                                        </div>
                                    </li>
                                    <li class="dropdown-item">
                                        <div class="form-check">
                                            <input class="form-check-input" id="checkCrossOrigin" type="checkbox" name="checkCrossOrigin" checked>
                                            <label class="form-check-label" for="checkCrossOrigin">checkCrossOrigin</label>
                                        </div>
                                    </li>
                                    <li class="dropdown-item">
                                        <div class="form-check">
                                            <input class="form-check-input" id="checkOrientation" type="checkbox" name="checkOrientation" checked>
                                            <label class="form-check-label" for="checkOrientation">checkOrientation</label>
                                        </div>
                                    </li>
                                    <li class="dropdown-item">
                                        <div class="form-check">
                                            <input class="form-check-input" id="modal" type="checkbox" name="modal" checked>
                                            <label class="form-check-label" for="modal">modal</label>
                                        </div>
                                    </li>
                                    <li class="dropdown-item">
                                        <div class="form-check">
                                            <input class="form-check-input" id="guides" type="checkbox" name="guides" checked>
                                            <label class="form-check-label" for="guides">guides</label>
                                        </div>
                                    </li>
                                    <li class="dropdown-item">
                                        <div class="form-check">
                                            <input class="form-check-input" id="center" type="checkbox" name="center" checked>
                                            <label class="form-check-label" for="center">center</label>
                                        </div>
                                    </li>
                                    <li class="dropdown-item">
                                        <div class="form-check">
                                            <input class="form-check-input" id="highlight" type="checkbox" name="highlight" checked>
                                            <label class="form-check-label" for="highlight">highlight</label>
                                        </div>
                                    </li>
                                    <li class="dropdown-item">
                                        <div class="form-check">
                                            <input class="form-check-input" id="background" type="checkbox" name="background" checked>
                                            <label class="form-check-label" for="background">background</label>
                                        </div>
                                    </li>
                                    <li class="dropdown-item">
                                        <div class="form-check">
                                            <input class="form-check-input" id="autoCrop" type="checkbox" name="autoCrop" checked>
                                            <label class="form-check-label" for="autoCrop">autoCrop</label>
                                        </div>
                                    </li>
                                    <li class="dropdown-item">
                                        <div class="form-check">
                                            <input class="form-check-input" id="movable" type="checkbox" name="movable" checked>
                                            <label class="form-check-label" for="movable">movable</label>
                                        </div>
                                    </li>
                                    <li class="dropdown-item">
                                        <div class="form-check">
                                            <input class="form-check-input" id="rotatable" type="checkbox" name="rotatable" checked>
                                            <label class="form-check-label" for="rotatable">rotatable</label>
                                        </div>
                                    </li>
                                    <li class="dropdown-item">
                                        <div class="form-check">
                                            <input class="form-check-input" id="scalable" type="checkbox" name="scalable" checked>
                                            <label class="form-check-label" for="scalable">scalable</label>
                                        </div>
                                    </li>
                                    <li class="dropdown-item">
                                        <div class="form-check">
                                            <input class="form-check-input" id="zoomable" type="checkbox" name="zoomable" checked>
                                            <label class="form-check-label" for="zoomable">zoomable</label>
                                        </div>
                                    </li>
                                    <li class="dropdown-item">
                                        <div class="form-check">
                                            <input class="form-check-input" id="zoomOnTouch" type="checkbox" name="zoomOnTouch" checked>
                                            <label class="form-check-label" for="zoomOnTouch">zoomOnTouch</label>
                                        </div>
                                    </li>
                                    <li class="dropdown-item">
                                        <div class="form-check">
                                            <input class="form-check-input" id="zoomOnWheel" type="checkbox" name="zoomOnWheel" checked>
                                            <label class="form-check-label" for="zoomOnWheel">zoomOnWheel</label>
                                        </div>
                                    </li>
                                    <li class="dropdown-item">
                                        <div class="form-check">
                                            <input class="form-check-input" id="cropBoxMovable" type="checkbox" name="cropBoxMovable" checked>
                                            <label class="form-check-label" for="cropBoxMovable">cropBoxMovable</label>
                                        </div>
                                    </li>
                                    <li class="dropdown-item">
                                        <div class="form-check">
                                            <input class="form-check-input" id="cropBoxResizable" type="checkbox" name="cropBoxResizable" checked>
                                            <label class="form-check-label" for="cropBoxResizable">cropBoxResizable</label>
                                        </div>
                                    </li>
                                    <li class="dropdown-item">
                                        <div class="form-check">
                                            <input class="form-check-input" id="toggleDragModeOnDblclick" type="checkbox" name="toggleDragModeOnDblclick" checked>
                                            <label class="form-check-label" for="toggleDragModeOnDblclick">toggleDragModeOnDblclick</label>
                                        </div>
                                    </li>
                                </ul>
                            </div><!-- /.dropdown -->

                            <a class="btn btn-success btn-block" data-toggle="tooltip" data-animation="false" href="https://fengyuanchen.github.io/cropperjs" title="JavaScript image cropper">Cropper.js</a>

                        </div><!-- /.docs-toggles -->
                    </div>
                </div>
            </div>
        </div>
    </div>
    <style type="text/css">
        .btn {
            padding-left: .75rem;
            padding-right: .75rem;
        }

        label.btn {
            margin-bottom: 0;
        }

        .d-flex > .btn {
            flex: 1;
        }

        .img-container,
        .img-preview {
            background-color: #f7f7f7;
            text-align: center;
            width: 100%;
        }

        .img-container {
            margin-bottom: 1rem;
            max-height: 497px;
            min-height: 200px;
        }

        @media (min-width: 768px) {
            .img-container {
                min-height: 497px;
            }
        }

        .img-container > img {
            max-width: 100%;
        }

        .docs-preview {
            margin-right: -1rem;
        }

        .img-preview {
            float: left;
            margin-bottom: .5rem;
            margin-right: .5rem;
            overflow: hidden;
        }

        .img-preview > img {
            max-width: 100%;
        }

        .preview-lg {
            height: 9rem;
            width: 16rem;
        }

        .preview-md {
            height: 4.5rem;
            width: 8rem;
        }

        .preview-sm {
            height: 2.25rem;
            width: 4rem;
        }

        .preview-xs {
            height: 1.125rem;
            margin-right: 0;
            width: 2rem;
        }

        .docs-data > .input-group {
            margin-bottom: .5rem;
        }

        .docs-data .input-group-prepend .input-group-text {
            min-width: 4rem;
        }

        .docs-data .input-group-append .input-group-text {
            min-width: 3rem;
        }

        .docs-buttons > .btn,
        .docs-buttons > .btn-group,
        .docs-buttons > .form-control {
            margin-bottom: .5rem;
            margin-right: .25rem;
        }

        .docs-toggles > .btn,
        .docs-toggles > .btn-group,
        .docs-toggles > .dropdown {
            margin-bottom: .5rem;
        }

        .docs-tooltip {
            display: block;
            margin: -.5rem -.75rem;
            padding: .5rem .75rem;
        }

        .docs-tooltip > .icon {
            margin: 0 -.25rem;
            vertical-align: top;
        }

        .tooltip-inner {
            white-space: normal;
        }

        .btn-upload .tooltip-inner,
        .btn-toggle .tooltip-inner {
            white-space: nowrap;
        }

        .btn-toggle {
            padding: .5rem;
        }

        .btn-toggle > .docs-tooltip {
            margin: -.5rem;
            padding: .5rem;
        }

        @media (max-width: 400px) {
            .btn-group-crop {
                margin-right: -1rem!important;
            }

            .btn-group-crop > .btn {
                padding-left: .5rem;
                padding-right: .5rem;
            }

            .btn-group-crop .docs-tooltip {
                margin-left: -.5rem;
                margin-right: -.5rem;
                padding-left: .5rem;
                padding-right: .5rem;
            }
        }

        .docs-options .dropdown-menu {
            width: 100%;
        }

        .docs-options .dropdown-menu > li {
            font-size: .875rem;
            padding: .125rem 1rem;
        }

        .docs-options .dropdown-menu .form-check-label {
            display: block;
        }

        .docs-cropped .modal-body {
            text-align: center;
        }

        .docs-cropped .modal-body > img,
        .docs-cropped .modal-body > canvas {
            max-width: 100%;
        }

    </style>
    <script type="text/javascript">
        jQuery(function ($) {
            // any code put here will be run after content attach to ajax output container and before
            // controll return to main javascript file.
            'use strict';

            $(javatmp.settings.defaultOutputSelector).on('click', '.dropdown-menu', function (e) {
                e.stopPropagation();
            });

            var console = window.console || {log: function () {}};
            var URL = window.URL || window.webkitURL;
            var $image = $('#image');
            var $download = $('#download');
            var $dataX = $('#dataX');
            var $dataY = $('#dataY');
            var $dataHeight = $('#dataHeight');
            var $dataWidth = $('#dataWidth');
            var $dataRotate = $('#dataRotate');
            var $dataScaleX = $('#dataScaleX');
            var $dataScaleY = $('#dataScaleY');
            var options = {
                aspectRatio: 16 / 9,
                preview: '.img-preview',
                crop: function (e) {
                    $dataX.val(Math.round(e.detail.x));
                    $dataY.val(Math.round(e.detail.y));
                    $dataHeight.val(Math.round(e.detail.height));
                    $dataWidth.val(Math.round(e.detail.width));
                    $dataRotate.val(e.detail.rotate);
                    $dataScaleX.val(e.detail.scaleX);
                    $dataScaleY.val(e.detail.scaleY);
                }
            };
            var originalImageURL = $image.attr('src');
            var uploadedImageName = 'cropped.jpg';
            var uploadedImageType = 'image/jpeg';
            var uploadedImageURL;


            // Tooltip
            $(javatmp.settings.defaultOutputSelector).find('[data-toggle="tooltip"]').tooltip();


            // Cropper
            $image.on({
                ready: function (e) {
                    console.log(e.type);
                },
                cropstart: function (e) {
                    console.log(e.type, e.detail.action);
                },
                cropmove: function (e) {
                    console.log(e.type, e.detail.action);
                },
                cropend: function (e) {
                    console.log(e.type, e.detail.action);
                },
                crop: function (e) {
                    console.log(e.type);
                },
                zoom: function (e) {
                    console.log(e.type, e.detail.ratio);
                }
            }).cropper(options);


            // Buttons
            if (!$.isFunction(document.createElement('canvas').getContext)) {
                $(javatmp.settings.defaultOutputSelector).find('button[data-method="getCroppedCanvas"]').prop('disabled', true);
            }

            if (typeof document.createElement('cropper').style.transition === 'undefined') {
                $(javatmp.settings.defaultOutputSelector).find('button[data-method="rotate"]').prop('disabled', true);
                $(javatmp.settings.defaultOutputSelector).find('button[data-method="scale"]').prop('disabled', true);
            }


            // Download
            if (typeof $download[0].download === 'undefined') {
                $download.addClass('disabled');
            }


            // Options
            $(javatmp.settings.defaultOutputSelector).find('.docs-toggles').on('change', 'input', function () {
                var $this = $(this);
                var name = $this.attr('name');
                var type = $this.prop('type');
                var cropBoxData;
                var canvasData;

                if (!$image.data('cropper')) {
                    return;
                }

                if (type === 'checkbox') {
                    options[name] = $this.prop('checked');
                    cropBoxData = $image.cropper('getCropBoxData');
                    canvasData = $image.cropper('getCanvasData');

                    options.ready = function () {
                        $image.cropper('setCropBoxData', cropBoxData);
                        $image.cropper('setCanvasData', canvasData);
                    };
                } else if (type === 'radio') {
                    options[name] = $this.val();
                }

                $image.cropper('destroy').cropper(options);
            });


            // Methods
            $(javatmp.settings.defaultOutputSelector).find('.docs-buttons').on('click', '[data-method]', function () {
                var $this = $(this);
                var data = $this.data();
                var cropper = $image.data('cropper');
                var cropped;
                var $target;
                var result;

                if ($this.prop('disabled') || $this.hasClass('disabled')) {
                    return;
                }

                if (cropper && data.method) {
                    data = $.extend({}, data); // Clone a new one

                    if (typeof data.target !== 'undefined') {
                        $target = $(data.target);

                        if (typeof data.option === 'undefined') {
                            try {
                                data.option = JSON.parse($target.val());
                            } catch (e) {
                                console.log(e.message);
                            }
                        }
                    }

                    cropped = cropper.cropped;

                    switch (data.method) {
                        case 'rotate':
                            if (cropped && options.viewMode > 0) {
                                $image.cropper('clear');
                            }

                            break;

                        case 'getCroppedCanvas':
                            if (uploadedImageType === 'image/jpeg') {
                                if (!data.option) {
                                    data.option = {};
                                }

                                data.option.fillColor = '#fff';
                            }

                            break;
                    }

                    result = $image.cropper(data.method, data.option, data.secondOption);

                    switch (data.method) {
                        case 'rotate':
                            if (cropped && options.viewMode > 0) {
                                $image.cropper('crop');
                            }

                            break;

                        case 'scaleX':
                        case 'scaleY':
                            $(this).data('option', -data.option);
                            break;

                        case 'getCroppedCanvas':
                            if (result) {
                                // Bootstrap's Modal
                                $('#getCroppedCanvasModal').modal().find('.modal-body').html(result);

                                if (!$download.hasClass('disabled')) {
                                    download.download = uploadedImageName;
                                    $download.attr('href', result.toDataURL(uploadedImageType));
                                }
                            }

                            break;

                        case 'destroy':
                            if (uploadedImageURL) {
                                URL.revokeObjectURL(uploadedImageURL);
                                uploadedImageURL = '';
                                $image.attr('src', originalImageURL);
                            }

                            break;
                    }

                    if ($.isPlainObject(result) && $target) {
                        try {
                            $target.val(JSON.stringify(result));
                        } catch (e) {
                            console.log(e.message);
                        }
                    }

                }
            });


            // Keyboard
            $(javatmp.settings.defaultOutputSelector).on('keydown', function (e) {

                if (!$image.data('cropper') || this.scrollTop > 300) {
                    return;
                }

                switch (e.which) {
                    case 37:
                        e.preventDefault();
                        $image.cropper('move', -1, 0);
                        break;

                    case 38:
                        e.preventDefault();
                        $image.cropper('move', 0, -1);
                        break;

                    case 39:
                        e.preventDefault();
                        $image.cropper('move', 1, 0);
                        break;

                    case 40:
                        e.preventDefault();
                        $image.cropper('move', 0, 1);
                        break;
                }

            });


            // Import image
            var $inputImage = $('#inputImage');

            if (URL) {
                $inputImage.change(function () {
                    var files = this.files;
                    var file;

                    if (!$image.data('cropper')) {
                        return;
                    }

                    if (files && files.length) {
                        file = files[0];

                        if (/^image\/\w+$/.test(file.type)) {
                            uploadedImageName = file.name;
                            uploadedImageType = file.type;

                            if (uploadedImageURL) {
                                URL.revokeObjectURL(uploadedImageURL);
                            }

                            uploadedImageURL = URL.createObjectURL(file);
                            $image.cropper('destroy').attr('src', uploadedImageURL).cropper(options);
                            $inputImage.val('');
                        } else {
                            window.alert('Please choose an image file.');
                        }
                    }
                });
            } else {
                $inputImage.prop('disabled', true).parent().addClass('disabled');
            }


            // Methods
            $(javatmp.settings.defaultOutputSelector).find('.docs-buttons').on('click', '[data-method]', function () {
                var $this = $(this);
                var data = $this.data();
                var $target;
                var result;

                if ($this.prop('disabled') || $this.hasClass('disabled')) {
                    return;
                }

                if ($image.data('cropper') && data.method) {
                    data = $.extend({}, data); // Clone a new one

                    if (typeof data.target !== 'undefined') {
                        $target = $(data.target);

                        if (typeof data.option === 'undefined') {
                            try {
                                data.option = JSON.parse($target.val());
                            } catch (e) {
                                console.log(e.message);
                            }
                        }
                    }

                    switch (data.method) {
                        case 'rotate':
                            $image.cropper('clear');
                            break;

                        case 'getCroppedCanvas':
                            if (uploadedImageType === 'image/jpeg') {
                                if (!data.option) {
                                    data.option = {};
                                }

                                data.option.fillColor = '#fff';
                            }

                            break;
                    }

                    result = $image.cropper(data.method, data.option, data.secondOption);

                    switch (data.method) {
                        case 'rotate':
                            $image.cropper('crop');
                            break;

                        case 'scaleX':
                        case 'scaleY':
                            $(this).data('option', -data.option);
                            break;

                        case 'getCroppedCanvas':
                            if (result) {
                                // Bootstrap's Modal
                                $('#getCroppedCanvasModal').modal().find('.modal-body').html(result);

                                if (!$download.hasClass('disabled')) {
                                    $download.attr('href', result.toDataURL(uploadedImageType));
                                }
                            }

                            break;

                        case 'destroy':
                            if (uploadedImageURL) {
                                URL.revokeObjectURL(uploadedImageURL);
                                uploadedImageURL = '';
                                $image.attr('src', originalImageURL);
                            }

                            break;
                    }

                    if ($.isPlainObject(result) && $target) {
                        try {
                            $target.val(JSON.stringify(result));
                        } catch (e) {
                            console.log(e.message);
                        }
                    }

                }
            });

            // Keyboard
            $(javatmp.settings.defaultOutputSelector).on('keydown', function (e) {

                if (!$image.data('cropper') || this.scrollTop > 300) {
                    return;
                }

                switch (e.which) {
                    case 37:
                        e.preventDefault();
                        $image.cropper('move', -1, 0);
                        break;

                    case 38:
                        e.preventDefault();
                        $image.cropper('move', 0, -1);
                        break;

                    case 39:
                        e.preventDefault();
                        $image.cropper('move', 1, 0);
                        break;

                    case 40:
                        e.preventDefault();
                        $image.cropper('move', 0, 1);
                        break;
                }

            });


            // Import image
            var $inputImage = $('#inputImage');

            if (URL) {
                $inputImage.change(function () {
                    var files = this.files;
                    var file;

                    if (!$image.data('cropper')) {
                        return;
                    }

                    if (files && files.length) {
                        file = files[0];

                        if (/^image\/\w+$/.test(file.type)) {
                            uploadedImageType = file.type;

                            if (uploadedImageURL) {
                                URL.revokeObjectURL(uploadedImageURL);
                            }

                            uploadedImageURL = URL.createObjectURL(file);
                            $image.cropper('destroy').attr('src', uploadedImageURL).cropper(options);
                            $inputImage.val('');
                        } else {
                            window.alert('Please choose an image file.');
                        }
                    }
                });
            } else {
                $inputImage.prop('disabled', true).parent().addClass('disabled');
            }

            $(javatmp.settings.defaultOutputSelector).on(javatmp.settings.javaTmpAjaxContainerReady, function (event) {
                // fire AFTER all transition done and your ajax content is shown to user.
            });

            $(javatmp.settings.defaultOutputSelector).on(javatmp.settings.javaTmpContainerResizeEventName, function (event) {
                // fire when user resize browser window or sidebar hide / show
                $image.cropper("resize");
            });
            $(javatmp.settings.defaultOutputSelector).on(javatmp.settings.cardFullscreenCompress, function (event, card) {
                // when card compress by pressing the top right tool button
                $image.cropper("resize");
            });
            $(javatmp.settings.defaultOutputSelector).on(javatmp.settings.cardFullscreenExpand, function (event, card) {
                // when card Expand by pressing the top right tool button
                $image.cropper("resize");
            });

            /**
             * When another sidebar menu item pressed and before container replaced with new ajax content.
             * You can cancel, destroy, or remove any thing here before replace main output ajax container.
             * returning false will cancel the new request and do nothing.
             **/
            $(javatmp.settings.defaultOutputSelector).on(javatmp.settings.javaTmpContainerRemoveEventName, function (event) {
                $(javatmp.settings.defaultOutputSelector).off(javatmp.settings.cardFullscreenCompress);
                $(javatmp.settings.defaultOutputSelector).off(javatmp.settings.cardFullscreenExpand);
                // destroy cropper attached plugin to image
                $inputImage.off();
                $(javatmp.settings.defaultOutputSelector).off('keydown');
                $(javatmp.settings.defaultOutputSelector).find('.docs-buttons').off('click', '[data-method]');
                $(javatmp.settings.defaultOutputSelector).find('.docs-toggles').off('change', 'input');
                $image.off();
                $image.cropper("destroy");
                $(javatmp.settings.defaultOutputSelector).find('[data-toggle="tooltip"]').tooltip('dispose');
                $(javatmp.settings.defaultOutputSelector).off('click', '.dropdown-menu');
                return true;
            });
        });
    </script>
</div>