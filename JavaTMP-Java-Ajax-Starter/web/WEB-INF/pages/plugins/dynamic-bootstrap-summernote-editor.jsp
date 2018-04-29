<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<div class="dynamic-ajax-content">
    <div class="page-header">
        <h1>Dynamic Bootstrap Summernote Editor</h1>
    </div>
    <div class="row">
        <div class="col-lg-12">
            <div class="alert alert-info">
                <p>Summernote is a JavaScript library that helps you create WYSIWYG editors online.</p>
                <p>
                    <a class="btn btn-info" target="_blank" href="http://summernote.org/"><i class="fa fa-external-link-alt fa-fw"></i>Demo Page</a>
                    <a class="btn btn-info" target="_blank" href="https://github.com/summernote/summernote/"><i class="fa fa-external-link-alt fa-fw"></i>github.com Page</a>
                </p>
            </div>
            <div class="card my-3">
                <div class="card-header d-flex align-items-center justify-content-between py-1 px-3">
                    <ul class="nav">
                        <li class="nav-item">
                            <a id="show-written-content-id" class="nav-link" href="javascript:void(0);"><i class="far fa-eye-slash fa-fw fa-lg"></i>Show written text</a>
                        </li>
                        <li class="nav-item">
                            <a id="Update-Upload-Content-id" class="nav-link" href="javascript:void(0);"><i class="far fa-edit fa-fw fa-lg"></i>Update & Upload Content</a>
                        </li>
                    </ul>
                    <div class="options float-right">
                        <a class="settings"><i class="fa fa-cog"></i></a>
                        <a href="#" class="collapse"><i class="fa fa-chevron-up"></i></a>
                        <a href="#" class="reload"><i class="fa fa-sync"></i></a>
                        <a href="#" class="fullscreen"><i class=" fa fa-expand"></i></a>
                        <a href="#" class="remove"><i class="fa fa-times"></i></a>
                    </div>
                </div>
                <div class="card-body">
                    <form>
                        <div class="form-group">
                            <textarea id="summernote" class="form-control">${fn:escapeXml(requestScope.content.contentText)}</textarea>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <style type="text/css">
        /*
        Embed CSS styling for current page.
        */
    </style>
    <script type="text/javascript">
        jQuery(function ($) {
            // any code put here will be run after content attach to ajax output container and before
            // controll return to main javascript file.
            $('#summernote').summernote({
                height: 350,
                tabsize: 2,
                dialogsInBody: true,
                toolbar: [
                    ['style', ['fontname', 'fontsize', 'color', 'bold', 'italic', 'underline', 'strikethrough', 'superscript', 'subscript', 'clear']],
                    ['Paragraph style', ['style', 'ol', 'ul', 'paragraph', 'height']],
                    ['Insert', ['picture', 'link', 'video', 'table', 'hr']],
                    ['Misc', ['fullscreen', 'codeview', 'undo', 'redo', 'help']],
                    ['mybutton', ['hello']]
                ]
            });

            $("#show-written-content-id").on("click", function (event) {
                event.preventDefault();
                var makrup = $('#summernote').summernote('code');
                var modal = BootstrapModalWrapperFactory.createModal({
                    message: makrup,
                    size: "modal-lg"
                });
                modal.show();
            });
            $("#Update-Upload-Content-id").on("click", function (event) {
                event.preventDefault();
                var makrup = $('#summernote').summernote('code');
                var modal = BootstrapModalWrapperFactory.createModal({
                    message: makrup,
                    size: "modal-lg"
                });
                modal.show();
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
                $('#summernote').summernote("destroy");
                return true;
            });
        });
    </script>
</div>