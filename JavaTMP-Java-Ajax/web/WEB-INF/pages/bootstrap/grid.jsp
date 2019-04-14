<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="dynamic-ajax-content grid-gutter-padding">
    <div class="row">
        <div class="col">
            <div class="card my-3">
                <div class="card-header">
                    Grid options
                    <div class="options float-right">
                        <a class="settings"><i class="fa fa-cog"></i></a>
                        <a href="#" class="collapse"><i class="fa fa-chevron-up"></i></a>
                        <a href="#" class="reload"><i class="fa fa-sync"></i></a>
                        <a href="#" class="fullscreen"><i class=" fa fa-expand"></i></a>
                        <a href="#" class="remove"><i class="fa fa-times"></i></a>
                    </div>
                </div>
                <div class="card-body">
                    <table class="table table-bordered table-striped table-responsive">
                        <thead>
                            <tr>
                                <th></th>
                                <th class="text-center">
                                    Extra small<br>
                                    <small>&lt;576px</small>
                                </th>
                                <th class="text-center">
                                    Small<br>
                                    <small>≥576px</small>
                                </th>
                                <th class="text-center">
                                    Medium<br>
                                    <small>≥768px</small>
                                </th>
                                <th class="text-center">
                                    Large<br>
                                    <small>≥992px</small>
                                </th>
                                <th class="text-center">
                                    Extra large<br>
                                    <small>≥1200px</small>
                                </th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <th class="text-nowrap" scope="row">Max container width</th>
                                <td>None (auto)</td>
                                <td>540px</td>
                                <td>720px</td>
                                <td>960px</td>
                                <td>1140px</td>
                            </tr>
                            <tr>
                                <th class="text-nowrap" scope="row">Class prefix</th>
                                <td><code>.col-</code></td>
                                <td><code>.col-sm-</code></td>
                                <td><code>.col-md-</code></td>
                                <td><code>.col-lg-</code></td>
                                <td><code>.col-xl-</code></td>
                            </tr>
                            <tr>
                                <th class="text-nowrap" scope="row"># of columns</th>
                                <td colspan="5">12</td>
                            </tr>
                            <tr>
                                <th class="text-nowrap" scope="row">Gutter width</th>
                                <td colspan="5">30px (15px on each side of a column)</td>
                            </tr>
                            <tr>
                                <th class="text-nowrap" scope="row">Nestable</th>
                                <td colspan="5">Yes</td>
                            </tr>
                            <tr>
                                <th class="text-nowrap" scope="row">Column ordering</th>
                                <td colspan="5">Yes</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="card my-3">
                <div class="card-header">
                    three equal-width columns on small, medium, large, and extra large devices
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
                        <div class="col-sm">
                            One of three columns
                        </div>
                        <div class="col-sm">
                            One of three columns
                        </div>
                        <div class="col-sm">
                            One of three columns
                        </div>
                    </div>
                </div>
            </div>
            <div class="card my-3">
                <div class="card-header">
                    Auto-layout columns
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
                        <div class="col">
                            1 of 2
                        </div>
                        <div class="col">
                            2 of 2
                        </div>
                    </div>
                    <div class="row">
                        <div class="col">
                            1 of 3
                        </div>
                        <div class="col">
                            2 of 3
                        </div>
                        <div class="col">
                            3 of 3
                        </div>
                    </div>
                    <div class="row">
                        <div class="col">Column</div>
                        <div class="col">Column</div>
                        <div class="w-100"></div>
                        <div class="col">Column</div>
                        <div class="col">Column</div>
                    </div>
                </div>
            </div>
            <div class="card my-3">
                <div class="card-header">
                    Setting one column width
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
                        <div class="col">
                            1 of 3
                        </div>
                        <div class="col-6">
                            2 of 3 (wider)
                        </div>
                        <div class="col">
                            3 of 3
                        </div>
                    </div>
                    <div class="row">
                        <div class="col">
                            1 of 3
                        </div>
                        <div class="col-5">
                            2 of 3 (wider)
                        </div>
                        <div class="col">
                            3 of 3
                        </div>
                    </div>
                </div>
            </div>
            <div class="card my-3">
                <div class="card-header">
                    Variable width content
                    <div class="options float-right">
                        <a class="settings"><i class="fa fa-cog"></i></a>
                        <a href="#" class="collapse"><i class="fa fa-chevron-up"></i></a>
                        <a href="#" class="reload"><i class="fa fa-sync"></i></a>
                        <a href="#" class="fullscreen"><i class=" fa fa-expand"></i></a>
                        <a href="#" class="remove"><i class="fa fa-times"></i></a>
                    </div>
                </div>
                <div class="card-body">
                    <div class="row justify-content-md-center">
                        <div class="col col-lg-2">
                            1 of 3
                        </div>
                        <div class="col-md-auto">
                            Variable width content
                        </div>
                        <div class="col col-lg-2">
                            3 of 3
                        </div>
                    </div>
                    <div class="row">
                        <div class="col">
                            1 of 3
                        </div>
                        <div class="col-md-auto">
                            Variable width content
                        </div>
                        <div class="col col-lg-2">
                            3 of 3
                        </div>
                    </div>
                </div>
            </div>
            <div class="card my-3">
                <div class="card-header">
                    Equal-width multi-row
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
                        <div class="col">col</div>
                        <div class="col">col</div>
                        <div class="w-100"></div>
                        <div class="col">col</div>
                        <div class="col">col</div>
                    </div>
                </div>
            </div>
            <div class="card my-3">
                <div class="card-header">
                    All breakpoints
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
                        <div class="col">col</div>
                        <div class="col">col</div>
                        <div class="col">col</div>
                        <div class="col">col</div>
                    </div>
                    <div class="row">
                        <div class="col-8">col-8</div>
                        <div class="col-4">col-4</div>
                    </div>
                </div>
            </div>
            <div class="card my-3">
                <div class="card-header">
                    Stacked to horizontal
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
                        <div class="col-sm-8">col-sm-8</div>
                        <div class="col-sm-4">col-sm-4</div>
                    </div>
                    <div class="row">
                        <div class="col-sm">col-sm</div>
                        <div class="col-sm">col-sm</div>
                        <div class="col-sm">col-sm</div>
                    </div>
                </div>
            </div>
            <div class="card my-3">
                <div class="card-header">
                    Mix and match
                    <div class="options float-right">
                        <a class="settings"><i class="fa fa-cog"></i></a>
                        <a href="#" class="collapse"><i class="fa fa-chevron-up"></i></a>
                        <a href="#" class="reload"><i class="fa fa-sync"></i></a>
                        <a href="#" class="fullscreen"><i class=" fa fa-expand"></i></a>
                        <a href="#" class="remove"><i class="fa fa-times"></i></a>
                    </div>
                </div>
                <div class="card-body">
                    <!-- Stack the columns on mobile by making one full-width and the other half-width -->
                    <div class="row">
                        <div class="col-12 col-md-8">.col-12 .col-md-8</div>
                        <div class="col-6 col-md-4">.col-6 .col-md-4</div>
                    </div>

                    <!-- Columns start at 50% wide on mobile and bump up to 33.3% wide on desktop -->
                    <div class="row">
                        <div class="col-6 col-md-4">.col-6 .col-md-4</div>
                        <div class="col-6 col-md-4">.col-6 .col-md-4</div>
                        <div class="col-6 col-md-4">.col-6 .col-md-4</div>
                    </div>

                    <!-- Columns are always 50% wide, on mobile and desktop -->
                    <div class="row">
                        <div class="col-6">.col-6</div>
                        <div class="col-6">.col-6</div>
                    </div>
                </div>
            </div>
            <div class="card my-3">
                <div class="card-header">
                    Vertical alignment
                    <div class="options float-right">
                        <a class="settings"><i class="fa fa-cog"></i></a>
                        <a href="#" class="collapse"><i class="fa fa-chevron-up"></i></a>
                        <a href="#" class="reload"><i class="fa fa-sync"></i></a>
                        <a href="#" class="fullscreen"><i class=" fa fa-expand"></i></a>
                        <a href="#" class="remove"><i class="fa fa-times"></i></a>
                    </div>
                </div>
                <div class="card-body">
                    <div class="row align-items-start">
                        <div class="col">
                            One of three columns
                        </div>
                        <div class="col">
                            One of three columns
                        </div>
                        <div class="col">
                            One of three columns
                        </div>
                    </div>
                    <div class="row align-items-center">
                        <div class="col">
                            One of three columns
                        </div>
                        <div class="col">
                            One of three columns
                        </div>
                        <div class="col">
                            One of three columns
                        </div>
                    </div>
                    <div class="row align-items-end">
                        <div class="col">
                            One of three columns
                        </div>
                        <div class="col">
                            One of three columns
                        </div>
                        <div class="col">
                            One of three columns
                        </div>
                    </div>
                    <div class="row">
                        <div class="col align-self-start">
                            One of three columns
                        </div>
                        <div class="col align-self-center">
                            One of three columns
                        </div>
                        <div class="col align-self-end">
                            One of three columns
                        </div>
                    </div>
                </div>
            </div>
            <div class="card my-3">
                <div class="card-header">
                    Horizontal alignment
                    <div class="options float-right">
                        <a class="settings"><i class="fa fa-cog"></i></a>
                        <a href="#" class="collapse"><i class="fa fa-chevron-up"></i></a>
                        <a href="#" class="reload"><i class="fa fa-sync"></i></a>
                        <a href="#" class="fullscreen"><i class=" fa fa-expand"></i></a>
                        <a href="#" class="remove"><i class="fa fa-times"></i></a>
                    </div>
                </div>
                <div class="card-body">
                    <div class="row justify-content-start">
                        <div class="col-4">
                            One of two columns
                        </div>
                        <div class="col-4">
                            One of two columns
                        </div>
                    </div>
                    <div class="row justify-content-center">
                        <div class="col-4">
                            One of two columns
                        </div>
                        <div class="col-4">
                            One of two columns
                        </div>
                    </div>
                    <div class="row justify-content-end">
                        <div class="col-4">
                            One of two columns
                        </div>
                        <div class="col-4">
                            One of two columns
                        </div>
                    </div>
                    <div class="row justify-content-around">
                        <div class="col-4">
                            One of two columns
                        </div>
                        <div class="col-4">
                            One of two columns
                        </div>
                    </div>
                    <div class="row justify-content-between">
                        <div class="col-4">
                            One of two columns
                        </div>
                        <div class="col-4">
                            One of two columns
                        </div>
                    </div>
                </div>
            </div>
            <div class="card my-3">
                <div class="card-header">
                    Column wrapping
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
                        <div class="col-9">.col-9</div>
                        <div class="col-4">.col-4<br>Since 9 + 4 = 13 &gt; 12, this 4-column-wide div gets wrapped onto a new line as one contiguous unit.</div>
                        <div class="col-6">.col-6<br>Subsequent columns continue along the new line.</div>
                    </div>
                </div>
            </div>
            <div class="card my-3">
                <div class="card-header">
                    Offsetting columns
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
                        <div class="col-md-4">.col-md-4</div>
                        <div class="col-md-4 offset-md-4">.col-md-4 .offset-md-4</div>
                    </div>
                    <div class="row">
                        <div class="col-md-3 offset-md-3">.col-md-3 .offset-md-3</div>
                        <div class="col-md-3 offset-md-3">.col-md-3 .offset-md-3</div>
                    </div>
                    <div class="row">
                        <div class="col-md-6 offset-md-3">.col-md-6 .offset-md-3</div>
                    </div>
                </div>
            </div>
            <div class="card my-3">
                <div class="card-header">
                    Nesting
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
                        <div class="col-sm-9">
                            Level 1: .col-sm-9
                            <div class="row">
                                <div class="col-8 col-sm-6">
                                    Level 2: .col-8 .col-sm-6
                                </div>
                                <div class="col-4 col-sm-6">
                                    Level 2: .col-4 .col-sm-6
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <style type="text/css">
        .dynamic-ajax-content > .row > .col > .card > .card-body .row {
            border: 1px solid rgba(86,61,124, 0.3);
            min-height: 10rem;
            padding: 1rem;
        }
        .dynamic-ajax-content > .row > .col > .card > .card-body [class^=col] {
            padding-top: .75rem;
            padding-bottom: .75rem;
            background-color: rgba(86,61,124,.15);
            border: 1px solid rgba(86,61,124,.2);
        }
        @media (min-width: 768px) {
            .table-responsive {
                display: inline-table;
            }
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