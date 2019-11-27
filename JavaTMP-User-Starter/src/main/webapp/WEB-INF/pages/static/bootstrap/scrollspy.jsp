<div class="dynamic-ajax-content grid-gutter-padding">
    <div class="row">
        <div class="col">
            <div class="card my-3">
                <div class="card-header">
                    Bootstrap Scrollspy
                    <div class="options float-right">
                        <a class="settings"><i class="fa fa-cog"></i></a>
                        <a href="#" class="collapse"><i class="fa fa-chevron-up"></i></a>
                        <a href="#" class="reload"><i class="fa fa-sync"></i></a>
                        <a href="#" class="fullscreen"><i class=" fa fa-expand"></i></a>
                        <a href="#" class="remove"><i class="fa fa-times"></i></a>
                    </div>
                </div>
                <div class="card-body">
                    <h4 class="card-title text-primary">Example in navbar</h4>
                    <nav id="navbar-example2" class="navbar navbar-light bg-light">
                        <a class="navbar-brand" href="#">Navbar</a>
                        <ul class="nav nav-pills">
                            <li class="nav-item">
                                <a class="nav-link" href="#fat">@fat</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#mdo">@mdo</a>
                            </li>
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">Dropdown</a>
                                <div class="dropdown-menu">
                                    <a class="dropdown-item" href="#one">one</a>
                                    <a class="dropdown-item" href="#two">two</a>
                                    <div role="separator" class="dropdown-divider"></div>
                                    <a class="dropdown-item" href="#three">three</a>
                                </div>
                            </li>
                        </ul>
                    </nav>
                    <div data-spy="scroll" id="navbarExampleSpy" data-target="#navbar-example2" data-offset="0" class="scrollspy-example">
                        <h4 id="fat">@fat</h4>
                        <p>Ad leggings keytar, brunch id art party dolor labore. Pitchfork yr enim lo-fi before they sold out qui. Tumblr farm-to-table bicycle rights whatever. Anim keffiyeh carles cardigan. Velit seitan mcsweeney's photo booth 3 wolf moon irure. Cosby sweater lomo jean shorts, williamsburg hoodie minim qui you probably haven't heard of them et cardigan trust fund culpa biodiesel wes anderson aesthetic. Nihil tattooed accusamus, cred irony biodiesel keffiyeh artisan ullamco consequat.</p>
                        <h4 id="mdo">@mdo</h4>
                        <p>Veniam marfa mustache skateboard, adipisicing fugiat velit pitchfork beard. Freegan beard aliqua cupidatat mcsweeney's vero. Cupidatat four loko nisi, ea helvetica nulla carles. Tattooed cosby sweater food truck, mcsweeney's quis non freegan vinyl. Lo-fi wes anderson +1 sartorial. Carles non aesthetic exercitation quis gentrify. Brooklyn adipisicing craft beer vice keytar deserunt.</p>
                        <h4 id="one">one</h4>
                        <p>Occaecat commodo aliqua delectus. Fap craft beer deserunt skateboard ea. Lomo bicycle rights adipisicing banh mi, velit ea sunt next level locavore single-origin coffee in magna veniam. High life id vinyl, echo park consequat quis aliquip banh mi pitchfork. Vero VHS est adipisicing. Consectetur nisi DIY minim messenger bag. Cred ex in, sustainable delectus consectetur fanny pack iphone.</p>
                        <h4 id="two">two</h4>
                        <p>In incididunt echo park, officia deserunt mcsweeney's proident master cleanse thundercats sapiente veniam. Excepteur VHS elit, proident shoreditch +1 biodiesel laborum craft beer. Single-origin coffee wayfarers irure four loko, cupidatat terry richardson master cleanse. Assumenda you probably haven't heard of them art party fanny pack, tattooed nulla cardigan tempor ad. Proident wolf nesciunt sartorial keffiyeh eu banh mi sustainable. Elit wolf voluptate, lo-fi ea portland before they sold out four loko. Locavore enim nostrud mlkshk brooklyn nesciunt.</p>
                        <h4 id="three">three</h4>
                        <p>Ad leggings keytar, brunch id art party dolor labore. Pitchfork yr enim lo-fi before they sold out qui. Tumblr farm-to-table bicycle rights whatever. Anim keffiyeh carles cardigan. Velit seitan mcsweeney's photo booth 3 wolf moon irure. Cosby sweater lomo jean shorts, williamsburg hoodie minim qui you probably haven't heard of them et cardigan trust fund culpa biodiesel wes anderson aesthetic. Nihil tattooed accusamus, cred irony biodiesel keffiyeh artisan ullamco consequat.</p>
                        <p>Keytar twee blog, culpa messenger bag marfa whatever delectus food truck. Sapiente synth id assumenda. Locavore sed helvetica cliche irony, thundercats you probably haven't heard of them consequat hoodie gluten-free lo-fi fap aliquip. Labore elit placeat before they sold out, terry richardson proident brunch nesciunt quis cosby sweater pariatur keffiyeh ut helvetica artisan. Cardigan craft beer seitan readymade velit. VHS chambray laboris tempor veniam. Anim mollit minim commodo ullamco thundercats.
                        </p>
                    </div>
                    <hr/>
                    <h4 class="card-title text-primary">Example with nested nav</h4>
                    <div class="row">
                        <div class="col-4">
                            <nav id="navbar-example3" class="navbar navbar-light bg-light flex-column">
                                <a class="navbar-brand" href="#">Navbar</a>
                                <nav class="nav nav-pills flex-column">
                                    <a class="nav-link" href="#item-1">Item 1</a>
                                    <nav class="nav nav-pills flex-column">
                                        <a class="nav-link ml-3 my-1" href="#item-1-1">Item 1-1</a>
                                        <a class="nav-link ml-3 my-1" href="#item-1-2">Item 1-2</a>
                                    </nav>
                                    <a class="nav-link" href="#item-2">Item 2</a>
                                    <a class="nav-link" href="#item-3">Item 3</a>
                                    <nav class="nav nav-pills flex-column">
                                        <a class="nav-link ml-3 my-1" href="#item-3-1">Item 3-1</a>
                                        <a class="nav-link ml-3 my-1" href="#item-3-2">Item 3-2</a>
                                    </nav>
                                </nav>
                            </nav>
                        </div>
                        <div class="col-8">
                            <div data-spy="scroll" id="navbarExample3" data-target="#navbar-example3" data-offset="0" class="scrollspy-example-2">
                                <h4 id="item-1">Item 1</h4>
                                <p>Ex consequat commodo adipisicing exercitation aute excepteur occaecat ullamco duis aliqua id magna ullamco eu. Do aute ipsum ipsum ullamco cillum consectetur ut et aute consectetur labore. Fugiat laborum incididunt tempor eu consequat enim dolore proident. Qui laborum do non excepteur nulla magna eiusmod consectetur in. Aliqua et aliqua officia quis et incididunt voluptate non anim reprehenderit adipisicing dolore ut consequat deserunt mollit dolore. Aliquip nulla enim veniam non fugiat id cupidatat nulla elit cupidatat commodo velit ut eiusmod cupidatat elit dolore.</p>
                                <h5 id="item-1-1">Item 1-1</h5>
                                <p>Amet tempor mollit aliquip pariatur excepteur commodo do ea cillum commodo Lorem et occaecat elit qui et. Aliquip labore ex ex esse voluptate occaecat Lorem ullamco deserunt. Aliqua cillum excepteur irure consequat id quis ea. Sit proident ullamco aute magna pariatur nostrud labore. Reprehenderit aliqua commodo eiusmod aliquip est do duis amet proident magna consectetur consequat eu commodo fugiat non quis. Enim aliquip exercitation ullamco adipisicing voluptate excepteur minim exercitation minim minim commodo adipisicing exercitation officia nisi adipisicing. Anim id duis qui consequat labore adipisicing sint dolor elit cillum anim et fugiat.</p>
                                <h5 id="item-1-2">Item 2-2</h5>
                                <p>Cillum nisi deserunt magna eiusmod qui eiusmod velit voluptate pariatur laborum sunt enim. Irure laboris mollit consequat incididunt sint et culpa culpa incididunt adipisicing magna magna occaecat. Nulla ipsum cillum eiusmod sint elit excepteur ea labore enim consectetur in labore anim. Proident ullamco ipsum esse elit ut Lorem eiusmod dolor et eiusmod. Anim occaecat nulla in non consequat eiusmod velit incididunt.</p>
                                <h4 id="item-2">Item 2</h4>
                                <p>Quis magna Lorem anim amet ipsum do mollit sit cillum voluptate ex nulla tempor. Laborum consequat non elit enim exercitation cillum aliqua consequat id aliqua. Esse ex consectetur mollit voluptate est in duis laboris ad sit ipsum anim Lorem. Incididunt veniam velit elit elit veniam Lorem aliqua quis ullamco deserunt sit enim elit aliqua esse irure. Laborum nisi sit est tempor laborum mollit labore officia laborum excepteur commodo non commodo dolor excepteur commodo. Ipsum fugiat ex est consectetur ipsum commodo tempor sunt in proident.</p>
                                <h4 id="item-3">Item 3</h4>
                                <p>Quis anim sit do amet fugiat dolor velit sit ea ea do reprehenderit culpa duis. Nostrud aliqua ipsum fugiat minim proident occaecat excepteur aliquip culpa aute tempor reprehenderit. Deserunt tempor mollit elit ex pariatur dolore velit fugiat mollit culpa irure ullamco est ex ullamco excepteur.</p>
                                <h5 id="item-3-1">Item 3-1</h5>
                                <p>Deserunt quis elit Lorem eiusmod amet enim enim amet minim Lorem proident nostrud. Ea id dolore anim exercitation aute fugiat labore voluptate cillum do laboris labore. Ex velit exercitation nisi enim labore reprehenderit labore nostrud ut ut. Esse officia sunt duis aliquip ullamco tempor eiusmod deserunt irure nostrud irure. Ullamco proident veniam laboris ea consectetur magna sunt ex exercitation aliquip minim enim culpa occaecat exercitation. Est tempor excepteur aliquip laborum consequat do deserunt laborum esse eiusmod irure proident ipsum esse qui.</p>
                                <h5 id="item-3-2">Item 3-2</h5>
                                <p>Labore sit culpa commodo elit adipisicing sit aliquip elit proident voluptate minim mollit nostrud aute reprehenderit do. Mollit excepteur eu Lorem ipsum anim commodo sint labore Lorem in exercitation velit incididunt. Occaecat consectetur nisi in occaecat proident minim enim sunt reprehenderit exercitation cupidatat et do officia. Aliquip consequat ad labore labore mollit ut amet. Sit pariatur tempor proident in veniam culpa aliqua excepteur elit magna fugiat eiusmod amet officia.</p>
                            </div>
                        </div>
                    </div>
                    <hr/>
                    <h4 class="card-title text-primary">Example with list-group</h4>
                    <div class="row">
                        <div class="col-4">
                            <div id="list-example" class="list-group">
                                <a class="list-group-item list-group-item-action" href="#list-item-1">Item 1</a>
                                <a class="list-group-item list-group-item-action" href="#list-item-2">Item2</a>
                                <a class="list-group-item list-group-item-action" href="#list-item-3">Item 3</a>
                                <a class="list-group-item list-group-item-action" href="#list-item-4">Item 4</a>
                            </div>
                        </div>
                        <div class="col-8">
                            <div data-spy="scroll" id="listGroupSpyDemo" data-target="#list-example" data-offset="0" class="scrollspy-example">
                                <h4 id="list-item-1">Item 1</h4>
                                <p>Ex consequat commodo adipisicing exercitation aute excepteur occaecat ullamco duis aliqua id magna ullamco eu. Do aute ipsum ipsum ullamco cillum consectetur ut et aute consectetur labore. Fugiat laborum incididunt tempor eu consequat enim dolore proident. Qui laborum do non excepteur nulla magna eiusmod consectetur in. Aliqua et aliqua officia quis et incididunt voluptate non anim reprehenderit adipisicing dolore ut consequat deserunt mollit dolore. Aliquip nulla enim veniam non fugiat id cupidatat nulla elit cupidatat commodo velit ut eiusmod cupidatat elit dolore.</p>
                                <h4 id="list-item-2">Item 2</h4>
                                <p>Quis magna Lorem anim amet ipsum do mollit sit cillum voluptate ex nulla tempor. Laborum consequat non elit enim exercitation cillum aliqua consequat id aliqua. Esse ex consectetur mollit voluptate est in duis laboris ad sit ipsum anim Lorem. Incididunt veniam velit elit elit veniam Lorem aliqua quis ullamco deserunt sit enim elit aliqua esse irure. Laborum nisi sit est tempor laborum mollit labore officia laborum excepteur commodo non commodo dolor excepteur commodo. Ipsum fugiat ex est consectetur ipsum commodo tempor sunt in proident.</p>
                                <h4 id="list-item-3">Item 3</h4>
                                <p>Quis anim sit do amet fugiat dolor velit sit ea ea do reprehenderit culpa duis. Nostrud aliqua ipsum fugiat minim proident occaecat excepteur aliquip culpa aute tempor reprehenderit. Deserunt tempor mollit elit ex pariatur dolore velit fugiat mollit culpa irure ullamco est ex ullamco excepteur.</p>
                                <h4 id="list-item-4">Item 4</h4>
                                <p>Quis anim sit do amet fugiat dolor velit sit ea ea do reprehenderit culpa duis. Nostrud aliqua ipsum fugiat minim proident occaecat excepteur aliquip culpa aute tempor reprehenderit. Deserunt tempor mollit elit ex pariatur dolore velit fugiat mollit culpa irure ullamco est ex ullamco excepteur.</p>
                            </div>
                        </div>
                    </div>
                    <hr/>
                    <h4 class="card-title text-primary">Pill Example</h4>
                    <div class="row">
                        <div class="col-sm-3" id="spy">
                            <ul class="nav nav-pills flex-column">
                                <li class="nav-item"><a class="nav-link" href="#scroll1">First Section</a></li>
                                <li class="nav-item"><a class="nav-link" href="#scroll2">Second Section</a></li>
                                <li class="nav-item"><a class="nav-link" href="#scroll3">Third Section</a></li>
                                <li class="nav-item"><a class="nav-link" href="#scroll4">Fourth Section</a></li>
                            </ul>
                        </div>
                        <div class="col-sm-9 scrollspy-example" data-spy="scroll" id="spyPillExample" data-target="#spy">
                            <div id="scroll1">
                                <h2>First Section</h2>
                                <p>
                                    During Compile time, the compiler converts the source code into Microsoft Intermediate Language (MSIL). Microsoft Intermediate Language (MSIL) are CPU-Independent set of instructions that can be effectively converted to the native code. Now with the help of JIT compiler, IL code can be executed on any computer architecture supported by the JIT compiler.
                                </p>
                            </div>
                            <div id="scroll2">
                                <h2>Second Section</h2>
                                <p>
                                    During Compile time, the compiler converts the source code into Microsoft Intermediate Language (MSIL). Microsoft Intermediate Language (MSIL) are CPU-Independent set of instructions that can be effectively converted to the native code. Now with the help of JIT compiler, IL code can be executed on any computer architecture supported by the JIT compiler.
                                </p>
                            </div>
                            <div id="scroll3">
                                <h2>Third Section</h2>
                                <p>
                                    During Compile time, the compiler converts the source code into Microsoft Intermediate Language (MSIL). Microsoft Intermediate Language (MSIL) are CPU-Independent set of instructions that can be effectively converted to the native code. Now with the help of JIT compiler, IL code can be executed on any computer architecture supported by the JIT compiler.
                                </p>
                            </div>
                            <div id="scroll4">
                                <h2>Fourth Section</h2>
                                <p>
                                    During Compile time, the compiler converts the source code into Microsoft Intermediate Language (MSIL). Microsoft Intermediate Language (MSIL) are CPU-Independent set of instructions that can be effectively converted to the native code. Now with the help of JIT compiler, IL code can be executed on any computer architecture supported by the JIT compiler.
                                </p>
                                <p>
                                    During Compile time, the compiler converts the source code into Microsoft Intermediate Language (MSIL). Microsoft Intermediate Language (MSIL) are CPU-Independent set of instructions that can be effectively converted to the native code. Now with the help of JIT compiler, IL code can be executed on any computer architecture supported by the JIT compiler.
                                </p>
                                <p>
                                    During Compile time, the compiler converts the source code into Microsoft Intermediate Language (MSIL). Microsoft Intermediate Language (MSIL) are CPU-Independent set of instructions that can be effectively converted to the native code. Now with the help of JIT compiler, IL code can be executed on any computer architecture supported by the JIT compiler.
                                </p>
                                <p>
                                    During Compile time, the compiler converts the source code into Microsoft Intermediate Language (MSIL). Microsoft Intermediate Language (MSIL) are CPU-Independent set of instructions that can be effectively converted to the native code. Now with the help of JIT compiler, IL code can be executed on any computer architecture supported by the JIT compiler.
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <style type="text/css">
        .scrollspy-example {
            position: relative;
            height: 200px;
            margin-top: .5rem;
            overflow: auto;
        }
        .scrollspy-example-2 {
            position: relative;
            height: 350px;
            overflow: auto;
        }
    </style>
    <script type="text/javascript">
        jQuery(function ($) {
            $(javatmp.settings.defaultOutputSelector).on(javatmp.settings.javaTmpAjaxContainerReady, function (event) {
                $('#navbarExampleSpy').scrollspy({target: '#navbar-example2'});
                $('#navbarExample3').scrollspy({target: '#navbar-example3'});
                $('#listGroupSpyDemo').scrollspy({target: '#list-example'});
                $('#spyPillExample').scrollspy({target: '#spy'});

                $('[data-spy="scroll"]').on('activate.bs.scrollspy', function () {
                });
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