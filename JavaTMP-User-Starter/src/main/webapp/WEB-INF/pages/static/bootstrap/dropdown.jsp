<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="dynamic-ajax-content grid-gutter-padding">
    <div class="row">
        <div class="col">
            <div class="card my-3">
                <div class="card-header">
                    Bootstrap Dropdowns
                    <div class="options float-right">
                        <a class="settings"><i class="fa fa-cog"></i></a>
                        <a href="#" class="collapse"><i class="fa fa-chevron-up"></i></a>
                        <a href="#" class="reload"><i class="fa fa-sync"></i></a>
                        <a href="#" class="fullscreen"><i class=" fa fa-expand"></i></a>
                        <a href="#" class="remove"><i class="fa fa-times"></i></a>
                    </div>
                </div>
                <div class="card-body">
                    <h4 class="card-title text-primary">Single button dropdowns</h4>
                    <div class="dropdown m-1">
                        <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Dropdown button
                        </button>
                        <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                            <a class="dropdown-item" href="#">Action</a>
                            <a class="dropdown-item" href="#">Another action</a>
                            <a class="dropdown-item" href="#">Something else here</a>
                        </div>
                    </div>
                    <h4 class="card-title text-primary">And with <code>&lt;a&gt;</code> elements:</h4>
                    <div class="dropdown m-1">
                        <a class="btn btn-secondary dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Dropdown link
                        </a>

                        <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
                            <a class="dropdown-item" href="#">Action</a>
                            <a class="dropdown-item" href="#">Another action</a>
                            <a class="dropdown-item" href="#">Something else here</a>
                        </div>
                    </div>
                    <h4 class="card-title text-primary">Using button variants</h4>
                    <div class="btn-group m-1">
                        <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Primary</button>
                        <div class="dropdown-menu">
                            <a class="dropdown-item" href="#">Action</a>
                            <a class="dropdown-item" href="#">Another action</a>
                            <a class="dropdown-item" href="#">Something else here</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="#">Separated link</a>
                        </div>
                    </div><!-- /btn-group -->
                    <div class="btn-group m-1">
                        <button type="button" class="btn btn-secondary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Secondary</button>
                        <div class="dropdown-menu">
                            <a class="dropdown-item" href="#">Action</a>
                            <a class="dropdown-item" href="#">Another action</a>
                            <a class="dropdown-item" href="#">Something else here</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="#">Separated link</a>
                        </div>
                    </div><!-- /btn-group -->
                    <div class="btn-group m-1">
                        <button type="button" class="btn btn-success dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Success</button>
                        <div class="dropdown-menu">
                            <a class="dropdown-item" href="#">Action</a>
                            <a class="dropdown-item" href="#">Another action</a>
                            <a class="dropdown-item" href="#">Something else here</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="#">Separated link</a>
                        </div>
                    </div><!-- /btn-group -->
                    <div class="btn-group m-1">
                        <button type="button" class="btn btn-info dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Info</button>
                        <div class="dropdown-menu">
                            <a class="dropdown-item" href="#">Action</a>
                            <a class="dropdown-item" href="#">Another action</a>
                            <a class="dropdown-item" href="#">Something else here</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="#">Separated link</a>
                        </div>
                    </div><!-- /btn-group -->
                    <div class="btn-group m-1">
                        <button type="button" class="btn btn-warning dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Warning</button>
                        <div class="dropdown-menu">
                            <a class="dropdown-item" href="#">Action</a>
                            <a class="dropdown-item" href="#">Another action</a>
                            <a class="dropdown-item" href="#">Something else here</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="#">Separated link</a>
                        </div>
                    </div><!-- /btn-group -->
                    <div class="btn-group m-1">
                        <button type="button" class="btn btn-danger dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Danger</button>
                        <div class="dropdown-menu">
                            <a class="dropdown-item" href="#">Action</a>
                            <a class="dropdown-item" href="#">Another action</a>
                            <a class="dropdown-item" href="#">Something else here</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="#">Separated link</a>
                        </div>
                    </div><!-- /btn-group -->
                    <h4 class="card-title text-primary">Split button dropdowns</h4>
                    <div class="btn-group m-1">
                        <button type="button" class="btn btn-primary">Primary</button>
                        <button type="button" class="btn btn-primary dropdown-toggle dropdown-toggle-split" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <span class="sr-only">Toggle Dropdown</span>
                        </button>
                        <div class="dropdown-menu">
                            <a class="dropdown-item" href="#">Action</a>
                            <a class="dropdown-item" href="#">Another action</a>
                            <a class="dropdown-item" href="#">Something else here</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="#">Separated link</a>
                        </div>
                    </div><!-- /btn-group -->
                    <div class="btn-group m-1">
                        <button type="button" class="btn btn-secondary">Secondary</button>
                        <button type="button" class="btn btn-secondary dropdown-toggle dropdown-toggle-split" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <span class="sr-only">Toggle Dropdown</span>
                        </button>
                        <div class="dropdown-menu">
                            <a class="dropdown-item" href="#">Action</a>
                            <a class="dropdown-item" href="#">Another action</a>
                            <a class="dropdown-item" href="#">Something else here</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="#">Separated link</a>
                        </div>
                    </div><!-- /btn-group -->
                    <div class="btn-group m-1">
                        <button type="button" class="btn btn-success">Success</button>
                        <button type="button" class="btn btn-success dropdown-toggle dropdown-toggle-split" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <span class="sr-only">Toggle Dropdown</span>
                        </button>
                        <div class="dropdown-menu">
                            <a class="dropdown-item" href="#">Action</a>
                            <a class="dropdown-item" href="#">Another action</a>
                            <a class="dropdown-item" href="#">Something else here</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="#">Separated link</a>
                        </div>
                    </div><!-- /btn-group -->
                    <div class="btn-group m-1">
                        <button type="button" class="btn btn-info">Info</button>
                        <button type="button" class="btn btn-info dropdown-toggle dropdown-toggle-split" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <span class="sr-only">Toggle Dropdown</span>
                        </button>
                        <div class="dropdown-menu">
                            <a class="dropdown-item" href="#">Action</a>
                            <a class="dropdown-item" href="#">Another action</a>
                            <a class="dropdown-item" href="#">Something else here</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="#">Separated link</a>
                        </div>
                    </div><!-- /btn-group -->
                    <div class="btn-group m-1">
                        <button type="button" class="btn btn-warning">Warning</button>
                        <button type="button" class="btn btn-warning dropdown-toggle dropdown-toggle-split" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <span class="sr-only">Toggle Dropdown</span>
                        </button>
                        <div class="dropdown-menu">
                            <a class="dropdown-item" href="#">Action</a>
                            <a class="dropdown-item" href="#">Another action</a>
                            <a class="dropdown-item" href="#">Something else here</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="#">Separated link</a>
                        </div>
                    </div><!-- /btn-group -->
                    <div class="btn-group m-1">
                        <button type="button" class="btn btn-danger">Danger</button>
                        <button type="button" class="btn btn-danger dropdown-toggle dropdown-toggle-split" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <span class="sr-only">Toggle Dropdown</span>
                        </button>
                        <div class="dropdown-menu">
                            <a class="dropdown-item" href="#">Action</a>
                            <a class="dropdown-item" href="#">Another action</a>
                            <a class="dropdown-item" href="#">Something else here</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="#">Separated link</a>
                        </div>
                    </div><!-- /btn-group -->

                    <h4 class="card-title text-primary">Sizing</h4>
                    <div class="btn-toolbar" role="toolbar">
                        <div class="btn-group m-1">
                            <button class="btn btn-primary btn-lg dropdown-toggle" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                Large button
                            </button>
                            <div class="dropdown-menu">
                                <a class="dropdown-item" href="#">Action</a>
                                <a class="dropdown-item" href="#">Another action</a>
                                <a class="dropdown-item" href="#">Something else here</a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="#">Separated link</a>
                            </div>
                        </div><!-- /btn-group -->
                        <div class="btn-group ml-2">
                            <button type="button" class="btn btn-lg btn-primary">Large split button</button>
                            <button type="button" class="btn btn-lg btn-primary dropdown-toggle dropdown-toggle-split" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <span class="sr-only">Toggle Dropdown</span>
                            </button>
                            <div class="dropdown-menu">
                                <a class="dropdown-item" href="#">Action</a>
                                <a class="dropdown-item" href="#">Another action</a>
                                <a class="dropdown-item" href="#">Something else here</a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="#">Separated link</a>
                            </div>
                        </div><!-- /btn-group -->
                    </div><!-- /btn-toolbar -->
                    <div class="btn-toolbar mt-2" role="toolbar">
                        <div class="btn-group m-1">
                            <button class="btn btn-primary btn-sm dropdown-toggle" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                Small button
                            </button>
                            <div class="dropdown-menu">
                                <a class="dropdown-item" href="#">Action</a>
                                <a class="dropdown-item" href="#">Another action</a>
                                <a class="dropdown-item" href="#">Something else here</a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="#">Separated link</a>
                            </div>
                        </div><!-- /btn-group -->
                        <div class="btn-group ml-2">
                            <button type="button" class="btn btn-sm btn-primary">Small split button</button>
                            <button type="button" class="btn btn-sm btn-primary dropdown-toggle dropdown-toggle-split" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <span class="sr-only">Toggle Dropdown</span>
                            </button>
                            <div class="dropdown-menu">
                                <a class="dropdown-item" href="#">Action</a>
                                <a class="dropdown-item" href="#">Another action</a>
                                <a class="dropdown-item" href="#">Something else here</a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="#">Separated link</a>
                            </div>
                        </div><!-- /btn-group -->
                    </div><!-- /btn-toolbar -->
                    <hr/>
                    <h4 class="card-title text-primary">Directions</h4>
                    <h4 class="card-title text-primary">Dropup</h4>
                    <p>Trigger dropdown menus above elements by adding <code class="highlighter-rouge">.dropup</code> to the parent element.</p>
                    <div class="bd-example">
                        <div class="btn-group dropup">
                            <button type="button" class="btn btn-secondary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                Dropup
                            </button>
                            <div class="dropdown-menu" x-placement="top-start">
                                <a class="dropdown-item" href="#">Action</a>
                                <a class="dropdown-item" href="#">Another action</a>
                                <a class="dropdown-item" href="#">Something else here</a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="#">Separated link</a>
                            </div>
                        </div>

                        <div class="btn-group dropup">
                            <button type="button" class="btn btn-secondary">
                                Split dropup
                            </button>
                            <button type="button" class="btn btn-secondary dropdown-toggle dropdown-toggle-split" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <span class="sr-only">Toggle Dropdown</span>
                            </button>
                            <div class="dropdown-menu">
                                <a class="dropdown-item" href="#">Action</a>
                                <a class="dropdown-item" href="#">Another action</a>
                                <a class="dropdown-item" href="#">Something else here</a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="#">Separated link</a>
                            </div>
                        </div>
                    </div>
                    <h4 class="card-title text-primary">Dropright</h4>
                    <p>Trigger dropdown menus at the right of the elements by adding <code class="highlighter-rouge">.dropright</code> to the parent element.</p>
                    <div class="bd-example">
                        <div class="btn-group dropright">
                            <button type="button" class="btn btn-secondary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                Dropright
                            </button>
                            <div class="dropdown-menu">
                                <a class="dropdown-item" href="#">Action</a>
                                <a class="dropdown-item" href="#">Another action</a>
                                <a class="dropdown-item" href="#">Something else here</a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="#">Separated link</a>
                            </div>
                        </div>

                        <div class="btn-group dropright">
                            <button type="button" class="btn btn-secondary">
                                Split dropright
                            </button>
                            <button type="button" class="btn btn-secondary dropdown-toggle dropdown-toggle-split" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <span class="sr-only">Toggle Dropright</span>
                            </button>
                            <div class="dropdown-menu">
                                <a class="dropdown-item" href="#">Action</a>
                                <a class="dropdown-item" href="#">Another action</a>
                                <a class="dropdown-item" href="#">Something else here</a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="#">Separated link</a>
                            </div>
                        </div>
                    </div>
                    <h4 class="card-title text-primary">Dropright</h4>
                    <p>Trigger dropdown menus at the left of the elements by adding <code class="highlighter-rouge">.dropleft</code> to the parent element.</p>
                    <div class="bd-example">
                        <div class="btn-group dropleft">
                            <button type="button" class="btn btn-secondary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                Dropleft
                            </button>
                            <div class="dropdown-menu" x-placement="left-start">
                                <a class="dropdown-item" href="#">Action</a>
                                <a class="dropdown-item" href="#">Another action</a>
                                <a class="dropdown-item" href="#">Something else here</a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="#">Separated link</a>
                            </div>
                        </div>

                        <div class="btn-group">
                            <div class="btn-group dropleft" role="group">
                                <button type="button" class="btn btn-secondary dropdown-toggle dropdown-toggle-split" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <span class="sr-only">Toggle Dropleft</span>
                                </button>
                                <div class="dropdown-menu">
                                    <a class="dropdown-item" href="#">Action</a>
                                    <a class="dropdown-item" href="#">Another action</a>
                                    <a class="dropdown-item" href="#">Something else here</a>
                                    <div class="dropdown-divider"></div>
                                    <a class="dropdown-item" href="#">Separated link</a>
                                </div>
                            </div>
                            <button type="button" class="btn btn-secondary">
                                Split dropleft
                            </button>
                        </div>
                    </div>
                    <hr/>
                    <h4 class="card-title text-primary">Buttons Menu items</h4>
                    <div class="bd-example">
                        <div class="dropdown">
                            <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenu2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                Dropdown
                            </button>
                            <div class="dropdown-menu" aria-labelledby="dropdownMenu2">
                                <button class="dropdown-item" type="button">Action</button>
                                <button class="dropdown-item" type="button">Another action</button>
                                <button class="dropdown-item" type="button">Something else here</button>
                            </div>
                        </div>
                    </div>
                    <p>You can also create non-interactive dropdown items with <code class="highlighter-rouge">.dropdown-item-text</code>. Feel free to style further with custom CSS or text utilities.</p>
                    <div class="bd-example">
                        <div class="dropdown">
                            <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenu2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                Dropdown
                            </button>
                            <div class="dropdown-menu" aria-labelledby="dropdownMenu2">
                                <span class="dropdown-item-text">Dropdown item text</span>
                                <button class="dropdown-item" type="button">Action</button>
                                <button class="dropdown-item" type="button">Another action</button>
                                <button class="dropdown-item" type="button">Something else here</button>
                            </div>
                        </div>
                    </div>
                    <p>Add <code class="highlighter-rouge">.active</code> to items in the dropdown to <strong>style them as active</strong>.</p>
                    <div class="bd-example">
                        <div class="dropdown">
                            <button class="btn btn-secondary dropdown-toggle" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                Dropdown
                            </button>
                            <div class="dropdown-menu" aria-labelledby="dropdownMenu2">
                                <button class="dropdown-item" type="button">Action</button>
                                <button class="dropdown-item active" type="button">Another action</button>
                                <button class="dropdown-item" type="button">Something else here</button>
                            </div>
                        </div>
                    </div>
                    <p>Add <code class="highlighter-rouge">.disabled</code> to items in the dropdown to <strong>style them as disabled</strong>.</p>
                    <div class="bd-example">
                        <div class="dropdown">
                            <button class="btn btn-secondary dropdown-toggle" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                Dropdown
                            </button>
                            <div class="dropdown-menu" aria-labelledby="dropdownMenu2">
                                <button class="dropdown-item" type="button">Action</button>
                                <button class="dropdown-item disabled" type="button">Another action</button>
                                <button class="dropdown-item" type="button">Something else here</button>
                            </div>
                        </div>
                    </div>
                    <hr/>
                    <h4 class="card-title text-primary">Menu alignment</h4>
                    <p>By default, a dropdown menu is automatically positioned 100% from the top and along the left side of its parent. Add <code class="highlighter-rouge">.dropdown-menu-right</code> to a <code class="highlighter-rouge">.dropdown-menu</code> to right align the dropdown menu.</p>
                    <div class="bd-example">
                        <div class="btn-group">
                            <button type="button" class="btn btn-secondary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                Right-aligned menu
                            </button>
                            <div class="dropdown-menu dropdown-menu-right" x-placement="bottom-end">
                                <button class="dropdown-item" type="button">Action</button>
                                <button class="dropdown-item" type="button">Another action</button>
                                <button class="dropdown-item" type="button">Something else here</button>
                            </div>
                        </div>
                    </div>
                    <h4 class="card-title text-primary">Responsive alignment</h4>
                    <p>If you want to use responsive alignment, disable dynamic positioning by adding the <code class="highlighter-rouge">data-display="static"</code> attribute and use the responsive variation classes.</p>
                    <p>To align <strong>right</strong> the dropdown menu with the given breakpoint or larger, add <code class="highlighter-rouge">.dropdown-menu{-sm|-md|-lg|-xl}-right</code>.</p>
                    <div class="bd-example">
                        <div class="btn-group">
                            <button type="button" class="btn btn-secondary dropdown-toggle" data-toggle="dropdown" data-display="static" aria-haspopup="true" aria-expanded="false">
                                Left-aligned but right aligned when large screen
                            </button>
                            <div class="dropdown-menu dropdown-menu-lg-right">
                                <button class="dropdown-item" type="button">Action</button>
                                <button class="dropdown-item" type="button">Another action</button>
                                <button class="dropdown-item" type="button">Something else here</button>
                            </div>
                        </div>
                    </div>
                    <p>To align <strong>left</strong> the dropdown menu with the given breakpoint or larger, add <code class="highlighter-rouge">.dropdown-menu-right</code> and <code class="highlighter-rouge">.dropdown-menu{-sm|-md|-lg|-xl}-left</code>.</p>
                    <div class="bd-example">
                        <div class="btn-group">
                            <button type="button" class="btn btn-secondary dropdown-toggle" data-toggle="dropdown" data-display="static" aria-haspopup="true" aria-expanded="false">
                                Right-aligned but left aligned when large screen
                            </button>
                            <div class="dropdown-menu dropdown-menu-right dropdown-menu-lg-left">
                                <button class="dropdown-item" type="button">Action</button>
                                <button class="dropdown-item" type="button">Another action</button>
                                <button class="dropdown-item" type="button">Something else here</button>
                            </div>
                        </div>
                    </div>
                    <hr/>
                    <h4 class="card-title text-primary">Menu content</h4>
                    <h4 class="card-title text-primary">Headers</h4>
                    <p>Add a header to label sections of actions in any dropdown menu.</p>
                    <div class="bd-example">
                        <div class="dropdown">
                            <button class="btn btn-secondary dropdown-toggle" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                Dropdown
                            </button>
                            <div class="dropdown-menu" aria-labelledby="dropdownMenu2" x-placement="bottom-end">
                                <h5 class="dropdown-header">Dropdown header</h5>
                                <button class="dropdown-item" type="button">Action</button>
                                <button class="dropdown-item" type="button">Another action</button>
                                <button class="dropdown-item" type="button">Something else here</button>
                            </div>
                        </div>
                    </div>
                    <hr/>
                    <h4 class="card-title text-primary">Dividers</h4>
                    <p>Separate groups of related menu items with a divider.</p>
                    <div class="bd-example">
                        <div class="dropdown">
                            <button class="btn btn-secondary dropdown-toggle" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                Dropdown
                            </button>
                            <div class="dropdown-menu" aria-labelledby="dropdownMenu2" x-placement="bottom-end">
                                <h5 class="dropdown-header">Dropdown header</h5>
                                <button class="dropdown-item" type="button">Action</button>
                                <button class="dropdown-item" type="button">Another action</button>
                                <div class="dropdown-divider"></div>
                                <button class="dropdown-item" type="button">Something else here</button>
                            </div>
                        </div>
                    </div>
                    <hr/>
                    <h4 class="card-title text-primary">Text</h4>
                    <p>Place any freeform text within a dropdown menu with text and use spacing utilities. Note that youâll likely need additional sizing styles to constrain the menu width.</p>
                    <div class="bd-example">
                        <div class="dropdown">
                            <button class="btn btn-secondary dropdown-toggle" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                Dropdown
                            </button>
                            <div class="dropdown-menu p-4 text-muted" aria-labelledby="dropdownMenu2">
                                <p>
                                    Some example text that's free-flowing within the dropdown menu.
                                </p>
                                <p class="mb-0">
                                    And this is more example text.
                                </p>
                            </div>
                        </div>
                    </div>
                    <hr/>
                    <h4 class="card-title text-primary">Menu forms</h4>
                    <div class="dropdown m-1">
                        <button class="btn btn-primary dropdown-toggle" type="button" id="dropdownMenu2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Dropdown
                        </button>
                        <div class="dropdown-menu">
                            <form class="px-4 py-3">
                                <div class="form-group">
                                    <label for="exampleDropdownFormEmail1">Email address</label>
                                    <input type="email" class="form-control" id="exampleDropdownFormEmail1" placeholder="email@example.com">
                                </div>
                                <div class="form-group">
                                    <label for="exampleDropdownFormPassword1">Password</label>
                                    <input type="password" class="form-control" id="exampleDropdownFormPassword1" placeholder="Password">
                                </div>
                                <div class="form-check">
                                    <label class="form-check-label">
                                        <input type="checkbox" class="form-check-input">
                                        Remember me
                                    </label>
                                </div>
                                <button type="submit" class="btn btn-primary">Sign in</button>
                            </form>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="#">New around here? Sign up</a>
                            <a class="dropdown-item" href="#">Forgot password?</a>
                        </div>
                    </div>
                    <hr/>
                    <h4 class="card-title text-primary">Dropdown options</h4>
                    <p>Use <code class="highlighter-rouge">data-offset</code> or <code class="highlighter-rouge">data-reference</code> to change the location of the dropdown.</p>
                    <div class="bd-example">
                        <div class="d-flex">
                            <div class="dropdown mr-1">
                                <button type="button" class="btn btn-secondary dropdown-toggle" id="dropdownMenuOffset" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" data-offset="10,20">
                                    Offset
                                </button>
                                <div class="dropdown-menu" aria-labelledby="dropdownMenuOffset">
                                    <a class="dropdown-item" href="#">Action</a>
                                    <a class="dropdown-item" href="#">Another action</a>
                                    <a class="dropdown-item" href="#">Something else here</a>
                                </div>
                            </div>
                            <div class="btn-group">
                                <button type="button" class="btn btn-secondary">Reference</button>
                                <button type="button" class="btn btn-secondary dropdown-toggle dropdown-toggle-split" id="dropdownMenuReference" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" data-reference="parent">
                                    <span class="sr-only">Toggle Dropdown</span>
                                </button>
                                <div class="dropdown-menu" aria-labelledby="dropdownMenuReference" x-placement="bottom-start">
                                    <a class="dropdown-item" href="#">Action</a>
                                    <a class="dropdown-item" href="#">Another action</a>
                                    <a class="dropdown-item" href="#">Something else here</a>
                                    <div class="dropdown-divider"></div>
                                    <a class="dropdown-item" href="#">Separated link</a>
                                </div>
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