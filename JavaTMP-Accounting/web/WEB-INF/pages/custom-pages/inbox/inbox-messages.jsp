<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="dynamic-ajax-content">
    <div class="page-header">
        <h1>Inbox</h1>
    </div>
    <div class="row">
        <div class="col-lg-12">
            <div class="card">
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
                    <div class="row">
                        <div class="col-lg-3">
                            <form role="form">
                                <div class="form-group">
                                    <button type="button" actionType="action-ref" action-ref-by-name="compose-page" class="btn btn-danger btn-block actionable">Compose</button>
                                </div>
                            </form>
                            <div class="list-group zero-margin">
                                <a href="javascript:;" class="list-group-item list-group-item-action active">Inbox
                                    <span class="badge badge-primary float-right">1098</span>
                                </a>
                                <a href="javascript:;" class="list-group-item list-group-item-action">Favourite
                                    <span class="badge badge-primary float-right">57</span>
                                </a>
                                <a href="javascript:;" class="list-group-item list-group-item-action">Sent Mail
                                    <span class="badge badge-primary float-right">329</span>
                                </a>
                                <a href="javascript:;" class="list-group-item list-group-item-action">Draft
                                    <span class="badge badge-primary float-right">17</span>
                                </a>
                                <a href="javascript:;" class="list-group-item list-group-item-action">Spam
                                    <span class="badge badge-primary float-right">16</span>
                                </a>
                                <a href="javascript:;" class="list-group-item list-group-item-action">Deleted
                                    <span class="badge badge-primary float-right">521</span>
                                </a>
                            </div>
                        </div>
                        <div class="col-lg-9">

                            <table class="table table-striped inbox-table table-hover border">
                                <thead>
                                    <tr>
                                        <th colspan="3">
                                            <label class="custom-control custom-checkbox">
                                                <input type="checkbox" class="custom-control-input">
                                                <span class="custom-control-indicator"></span>
                                            </label>
                                            <div class="btn-group input-actions">
                                                <a class="btn btn-sm btn-success dropdown-toggle" href="javascript:;" data-toggle="dropdown" aria-expanded="false">
                                                    Actions
                                                </a>
                                                <ul class="dropdown-menu">
                                                    <li>
                                                        <a class="dropdown-item" href="javascript:;">
                                                            <i class="fa fa-fw fa-pencil-alt"></i>Mark as Read</a>
                                                    </li>
                                                    <li>
                                                        <a class="dropdown-item" href="javascript:;">
                                                            <i class="fa fa-fw fa-ban"></i>Move</a>
                                                    </li>
                                                    <li class="divider"> </li>
                                                    <li>
                                                        <a class="dropdown-item" href="javascript:;">
                                                            <i class="fa fa-fw fa-trash"></i>Delete</a>
                                                    </li>
                                                </ul>
                                            </div>
                                        </th>
                                        <th colspan="3">
                                            <div class="float-right">
                                                <span class="pagination-info"> 1 - 5 of 1098 </span>
                                                <button class="btn btn-sm btn-primary cl-white">
                                                    <i class="fa fa-angle-left fa-fw  cl-white"></i>
                                                </button>
                                                <button class="btn btn-sm btn-primary">
                                                    <i class="fa fa-angle-right fa-fw cl-white"></i>
                                                </button>
                                            </div>
                                        </th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>
                                            <label class="custom-control custom-checkbox">
                                                <input type="checkbox" class="custom-control-input">
                                                <span class="custom-control-indicator"></span>
                                            </label>
                                        </td>
                                        <td>
                                            <i class="fa fa-star"></i>
                                        </td>
                                        <td class="">
                                            <a actionType="action-ref" action-ref-by-name="view-message" alt="" href="">
                                                Customer Support
                                            </a>
                                        </td>
                                        <td>Lorem ipsum dolor sit amet, consectetuer adipiscing elit</td>
                                        <td>
                                            <i class="fa fa-paperclip"></i>
                                        </td>
                                        <td class="view-message text-right"> 16:30 PM </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <label class="custom-control custom-checkbox">
                                                <input type="checkbox" class="custom-control-input">
                                                <span class="custom-control-indicator"></span>
                                            </label>
                                        </td>
                                        <td>
                                            <i class="fa fa-star"></i>
                                        </td>
                                        <td class="">
                                            <a actionType="action-ref" action-ref-by-name="view-message" alt="" href="">
                                                Customer Support
                                            </a>
                                        </td>
                                        <td>Lorem ipsum dolor sit amet, consectetuer adipiscing elit</td>
                                        <td>
                                            <i class="fa fa-paperclip"></i>
                                        </td>
                                        <td class="view-message text-right"> 16:30 PM </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <label class="custom-control custom-checkbox">
                                                <input type="checkbox" class="custom-control-input">
                                                <span class="custom-control-indicator"></span>
                                            </label>
                                        </td>
                                        <td>
                                            <i class="fa fa-star"></i>
                                        </td>
                                        <td class="">
                                            <a actionType="action-ref" action-ref-by-name="view-message" alt="" href="">
                                                Customer Support
                                            </a>
                                        </td>
                                        <td>Lorem ipsum dolor sit amet, consectetuer adipiscing elit</td>
                                        <td>
                                            <i class="fa fa-paperclip"></i>
                                        </td>
                                        <td class="view-message text-right"> 16:30 PM </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <label class="custom-control custom-checkbox">
                                                <input type="checkbox" class="custom-control-input">
                                                <span class="custom-control-indicator"></span>
                                            </label>
                                        </td>
                                        <td>
                                            <i class="fa fa-star"></i>
                                        </td>
                                        <td class="">
                                            <a actionType="action-ref" action-ref-by-name="view-message" alt="" href="">
                                                Customer Support
                                            </a>
                                        </td>
                                        <td>Lorem ipsum dolor sit amet, consectetuer adipiscing elit</td>
                                        <td>
                                            <i class="fa fa-paperclip"></i>
                                        </td>
                                        <td class="view-message text-right"> 16:30 PM </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <label class="custom-control custom-checkbox">
                                                <input type="checkbox" class="custom-control-input">
                                                <span class="custom-control-indicator"></span>
                                            </label>
                                        </td>
                                        <td>
                                            <i class="fa fa-star"></i>
                                        </td>
                                        <td class="">
                                            <a actionType="action-ref" action-ref-by-name="view-message" alt="" href="">
                                                Customer Support
                                            </a>
                                        </td>
                                        <td>Lorem ipsum dolor sit amet, consectetuer adipiscing elit</td>
                                        <td>
                                            <i class="fa fa-paperclip"></i>
                                        </td>
                                        <td class="view-message text-right"> 16:30 PM </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <style type="text/css">
        .inbox-table tr {
            cursor: pointer;
        }
    </style>
    <!--<script src="components/"></script>-->
    <script type="text/javascript">
        jQuery(document).ready(function () {
            (function ($) {

            }(jQuery));
        });
    </script>
</div>