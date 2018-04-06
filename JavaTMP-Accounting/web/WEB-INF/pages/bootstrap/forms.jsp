<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="dynamic-ajax-content">
    <div class="page-header">
        <h1>Bootstrap Forms</h1>
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
                    <h4 class="card-title text-primary">Simple Form Styling</h4>
                    <form>
                        <div class="form-group">
                            <label for="exampleInputEmail1">Email address</label>
                            <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                            <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                        </div>
                        <div class="form-group">
                            <label for="exampleInputPassword1">Password</label>
                            <input type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
                        </div>
                        <div class="form-check">
                            <label class="form-check-label">
                                <input type="checkbox" class="form-check-input">
                                Check me out
                            </label>
                        </div>
                        <button type="submit" class="btn btn-primary">Submit</button>
                    </form>
                    <h4 class="card-title text-primary">Form controls</h4>
                    <form>
                        <div class="form-group">
                            <label for="exampleFormControlInput1">Email address</label>
                            <input type="email" class="form-control" id="exampleFormControlInput1" placeholder="name@example.com">
                        </div>
                        <div class="form-group">
                            <label for="exampleFormControlSelect1">Example select</label>
                            <select class="form-control" id="exampleFormControlSelect1">
                                <option>1</option>
                                <option>2</option>
                                <option>3</option>
                                <option>4</option>
                                <option>5</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="exampleFormControlSelect2">Example multiple select</label>
                            <select multiple class="form-control" id="exampleFormControlSelect2">
                                <option>1</option>
                                <option>2</option>
                                <option>3</option>
                                <option>4</option>
                                <option>5</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="exampleFormControlTextarea1">Example textarea</label>
                            <textarea class="form-control" id="exampleFormControlTextarea1" rows="3"></textarea>
                        </div>
                    </form>
                    <h4 class="card-title text-primary">For file inputs, swap the <code class="highlighter-rouge">.form-control</code> for <code class="highlighter-rouge">.form-control-file</code></h4>
                    <form>
                        <div class="form-group">
                            <label for="exampleFormControlFile1">Example file input</label>
                            <input type="file" class="form-control-file" id="exampleFormControlFile1">
                        </div>
                    </form>
                    <h4 class="card-title text-primary">Sizing</h4>
                    <form>
                        <div class="form-group">
                            <input class="form-control form-control-lg" type="text" placeholder=".form-control-lg">
                        </div>
                        <div class="form-group">
                            <input class="form-control" type="text" placeholder="Default input">
                        </div>
                        <div class="form-group">
                            <input class="form-control form-control-sm" type="text" placeholder=".form-control-sm">
                        </div>
                        <div class="form-group">
                            <select class="form-control form-control-lg">
                                <option>Large select</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <select class="form-control">
                                <option>Default select</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <select class="form-control form-control-sm">
                                <option>Small select</option>
                            </select>
                        </div>
                    </form>
                    <h4 class="card-title text-primary">Readonly</h4>
                    <form>
                        <div class="form-group row">
                            <label for="readOnlyEmail" class="col-sm-2 col-form-label">Email</label>
                            <div class="col-sm-10">
                                <input type="text" readonly class="form-control" id="readOnlyEmail" value="email@example.com">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="staticEmail" class="col-sm-2 col-form-label">Email</label>
                            <div class="col-sm-10">
                                <input type="text" readonly class="form-control-plaintext" id="staticEmail" value="email@example.com">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="inputPassword" class="col-sm-2 col-form-label">Password</label>
                            <div class="col-sm-10">
                                <input type="password" class="form-control" id="inputPassword" placeholder="Password">
                            </div>
                        </div>
                    </form>
                    <h4 class="card-title text-primary">Inline form</h4>
                    <form class="form-inline">
                        <div class="form-group">
                            <label for="staticEmail2" class="sr-only">Email</label>
                            <input type="text" readonly class="form-control-plaintext" id="staticEmail2" value="email@example.com">
                        </div>
                        <div class="form-group mx-sm-3">
                            <label for="inputPassword2" class="sr-only">Password</label>
                            <input type="password" class="form-control" id="inputPassword2" placeholder="Password">
                        </div>
                        <button type="submit" class="btn btn-primary">Confirm identity</button>
                    </form>
                    <h4 class="card-title text-primary">Checkboxes and radios</h4>
                    <form>
                        <div class="form-check">
                            <label class="form-check-label">
                                <input class="form-check-input" type="checkbox" value="">
                                Option one is this and that&mdash;be sure to include why it's great
                            </label>
                        </div>
                        <div class="form-check disabled">
                            <label class="form-check-label">
                                <input class="form-check-input" type="checkbox" value="" disabled>
                                Option two is disabled
                            </label>
                        </div>
                        <div class="form-check">
                            <label class="form-check-label">
                                <input class="form-check-input" type="radio" name="exampleRadios" id="exampleRadios1" value="option1" checked>
                                Option one is this and that&mdash;be sure to include why it's great
                            </label>
                        </div>
                        <div class="form-check">
                            <label class="form-check-label">
                                <input class="form-check-input" type="radio" name="exampleRadios" id="exampleRadios2" value="option2">
                                Option two can be something else and selecting it will deselect option one
                            </label>
                        </div>
                        <div class="form-check disabled">
                            <label class="form-check-label">
                                <input class="form-check-input" type="radio" name="exampleRadios" id="exampleRadios3" value="option3" disabled>
                                Option three is disabled
                            </label>
                        </div>
                        <div class="form-check form-check-inline">
                            <label class="form-check-label">
                                <input class="form-check-input" type="checkbox" id="inlineCheckbox1" value="option1"> 1
                            </label>
                        </div>
                        <div class="form-check form-check-inline">
                            <label class="form-check-label">
                                <input class="form-check-input" type="checkbox" id="inlineCheckbox2" value="option2"> 2
                            </label>
                        </div>
                        <div class="form-check form-check-inline disabled">
                            <label class="form-check-label">
                                <input class="form-check-input" type="checkbox" id="inlineCheckbox3" value="option3" disabled> 3
                            </label>
                        </div>
                        <div class="form-check form-check-inline">
                            <label class="form-check-label">
                                <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio1" value="option1"> 1
                            </label>
                        </div>
                        <div class="form-check form-check-inline">
                            <label class="form-check-label">
                                <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio2" value="option2"> 2
                            </label>
                        </div>
                        <div class="form-check form-check-inline disabled">
                            <label class="form-check-label">
                                <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio3" value="option3" disabled> 3
                            </label>
                        </div>
                        <div class="form-check">
                            <label class="form-check-label">
                                <input class="form-check-input position-static" type="checkbox" id="blankCheckbox" value="option1" aria-label="...">
                            </label>
                        </div>
                        <div class="form-check">
                            <label class="form-check-label">
                                <input class="form-check-input position-static" type="radio" name="blankRadio" id="blankRadio1" value="option1" aria-label="...">
                            </label>
                        </div>
                    </form>
                    <h4 class="card-title text-primary">Form grid</h4>
                    <form>
                        <div class="row">
                            <div class="col">
                                <input type="text" class="form-control" placeholder="First name">
                            </div>
                            <div class="col">
                                <input type="text" class="form-control" placeholder="Last name">
                            </div>
                        </div>
                    </form>
                    <h4 class="card-title text-primary">Form row</h4>
                    <form>
                        <div class="form-row">
                            <div class="col">
                                <input type="text" class="form-control" placeholder="First name">
                            </div>
                            <div class="col">
                                <input type="text" class="form-control" placeholder="Last name">
                            </div>
                        </div>
                    </form>
                    <h4 class="card-title text-primary">complex layouts</h4>
                    <form>
                        <div class="form-row">
                            <div class="form-group col-md-6">
                                <label for="inputEmail4">Email</label>
                                <input type="email" class="form-control" id="inputEmail4" placeholder="Email">
                            </div>
                            <div class="form-group col-md-6">
                                <label for="inputPassword4">Password</label>
                                <input type="password" class="form-control" id="inputPassword4" placeholder="Password">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputAddress">Address</label>
                            <input type="text" class="form-control" id="inputAddress" placeholder="1234 Main St">
                        </div>
                        <div class="form-group">
                            <label for="inputAddress2">Address 2</label>
                            <input type="text" class="form-control" id="inputAddress2" placeholder="Apartment, studio, or floor">
                        </div>
                        <div class="form-row">
                            <div class="form-group col-md-6">
                                <label for="inputCity">City</label>
                                <input type="text" class="form-control" id="inputCity">
                            </div>
                            <div class="form-group col-md-4">
                                <label for="inputState">State</label>
                                <select id="inputState" class="form-control">
                                    <option selected>Choose...</option>
                                    <option>...</option>
                                </select>
                            </div>
                            <div class="form-group col-md-2">
                                <label for="inputZip">Zip</label>
                                <input type="text" class="form-control" id="inputZip">
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="form-check">
                                <label class="form-check-label">
                                    <input class="form-check-input" type="checkbox"> Check me out
                                </label>
                            </div>
                        </div>
                        <button type="submit" class="btn btn-primary">Sign in</button>
                    </form>
                    <h4 class="card-title text-primary">Horizontal form</h4>
                    <form>
                        <div class="form-group row">
                            <label for="inputEmail3" class="col-sm-2 col-form-label">Email</label>
                            <div class="col-sm-10">
                                <input type="email" class="form-control" id="inputEmail3" placeholder="Email">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="inputPassword3" class="col-sm-2 col-form-label">Password</label>
                            <div class="col-sm-10">
                                <input type="password" class="form-control" id="inputPassword3" placeholder="Password">
                            </div>
                        </div>
                        <fieldset class="form-group">
                            <div class="row">
                                <legend class="col-form-legend col-sm-2">Radios</legend>
                                <div class="col-sm-10">
                                    <div class="form-check">
                                        <label class="form-check-label">
                                            <input class="form-check-input" type="radio" name="gridRadios" id="gridRadios1" value="option1" checked>
                                            Option one is this and that&mdash;be sure to include why it's great
                                        </label>
                                    </div>
                                    <div class="form-check">
                                        <label class="form-check-label">
                                            <input class="form-check-input" type="radio" name="gridRadios" id="gridRadios2" value="option2">
                                            Option two can be something else and selecting it will deselect option one
                                        </label>
                                    </div>
                                    <div class="form-check disabled">
                                        <label class="form-check-label">
                                            <input class="form-check-input" type="radio" name="gridRadios" id="gridRadios3" value="option3" disabled>
                                            Option three is disabled
                                        </label>
                                    </div>
                                </div>
                            </div>
                        </fieldset>
                        <div class="form-group row">
                            <div class="col-sm-2">Checkbox</div>
                            <div class="col-sm-10">
                                <div class="form-check">
                                    <label class="form-check-label">
                                        <input class="form-check-input" type="checkbox"> Check me out
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="form-group row">
                            <div class="col-sm-10">
                                <button type="submit" class="btn btn-primary">Sign in</button>
                            </div>
                        </div>
                    </form>
                    <h4 class="card-title text-primary">Horizontal form label sizing</h4>
                    <form>
                        <div class="form-group row">
                            <label for="colFormLabelSm" class="col-sm-2 col-form-label col-form-label-sm">Email</label>
                            <div class="col-sm-10">
                                <input type="email" class="form-control form-control-sm" id="colFormLabelSm" placeholder="col-form-label-sm">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="colFormLabel" class="col-sm-2 col-form-label">Email</label>
                            <div class="col-sm-10">
                                <input type="email" class="form-control" id="colFormLabel" placeholder="col-form-label">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="colFormLabelLg" class="col-sm-2 col-form-label col-form-label-lg">Email</label>
                            <div class="col-sm-10">
                                <input type="email" class="form-control form-control-lg" id="colFormLabelLg" placeholder="col-form-label-lg">
                            </div>
                        </div>
                    </form>
                    <h4 class="card-title text-primary">Help text</h4>
                    <form>
                        <div class="form-group">
                            <label for="inputPassword5">Password</label>
                            <input type="password" id="inputPassword5" class="form-control" aria-describedby="passwordHelpBlock">
                            <small id="passwordHelpBlock" class="form-text text-muted">
                                Your password must be 8-20 characters long, contain letters and numbers, and must not contain spaces, special characters, or emoji.
                            </small>
                        </div>
                    </form>
                    <form class="form-inline">
                        <div class="form-group">
                            <label for="inputPassword6">Password</label>
                            <input type="password" id="inputPassword6" class="form-control mx-sm-3" aria-describedby="passwordHelpInline">
                            <small id="passwordHelpInline" class="text-muted">
                                Must be 8-20 characters long.
                            </small>
                        </div>
                    </form>
                    <h4 class="card-title text-primary">Disabled forms</h4>
                    <form>
                        <fieldset disabled>
                            <div class="form-group">
                                <label for="disabledTextInput">Disabled input</label>
                                <input type="text" id="disabledTextInput" class="form-control" placeholder="Disabled input">
                            </div>
                            <div class="form-group">
                                <label for="disabledSelect">Disabled select menu</label>
                                <select id="disabledSelect" class="form-control">
                                    <option>Disabled select</option>
                                </select>
                            </div>
                            <div class="form-check">
                                <label class="form-check-label">
                                    <input class="form-check-input" type="checkbox"> Can't check this
                                </label>
                            </div>
                            <button type="submit" class="btn btn-primary">Submit</button>
                        </fieldset>
                    </form>
                    <h4 class="card-title text-primary">Validation</h4>
                    <form class="container" id="needs-validation" novalidate>
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label for="validationCustom01">First name</label>
                                <input type="text" class="form-control" id="validationCustom01" placeholder="First name" value="Mark" required>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label for="validationCustom02">Last name</label>
                                <input type="text" class="form-control" id="validationCustom02" placeholder="Last name" value="Otto" required>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label for="validationCustom03">City</label>
                                <input type="text" class="form-control" id="validationCustom03" placeholder="City" required>
                                <div class="invalid-feedback">
                                    Please provide a valid city.
                                </div>
                            </div>
                            <div class="col-md-3 mb-3">
                                <label for="validationCustom04">State</label>
                                <input type="text" class="form-control" id="validationCustom04" placeholder="State" required>
                                <div class="invalid-feedback">
                                    Please provide a valid state.
                                </div>
                            </div>
                            <div class="col-md-3 mb-3">
                                <label for="validationCustom05">Zip</label>
                                <input type="text" class="form-control" id="validationCustom05" placeholder="Zip" required>
                                <div class="invalid-feedback">
                                    Please provide a valid zip.
                                </div>
                            </div>
                        </div>
                        <button class="btn btn-primary" type="submit">Submit form</button>
                    </form>
                    <h4 class="card-title text-primary">Browser defaults</h4>
                    <form>
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label for="validationDefault01">First name</label>
                                <input type="text" class="form-control" id="validationDefault01" placeholder="First name" value="Mark" required>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label for="validationDefault02">Last name</label>
                                <input type="text" class="form-control" id="validationDefault02" placeholder="Last name" value="Otto" required>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label for="validationDefault03">City</label>
                                <input type="text" class="form-control" id="validationDefault03" placeholder="City" required>
                                <div class="invalid-feedback">
                                    Please provide a valid city.
                                </div>
                            </div>
                            <div class="col-md-3 mb-3">
                                <label for="validationDefault04">State</label>
                                <input type="text" class="form-control" id="validationDefault04" placeholder="State" required>
                                <div class="invalid-feedback">
                                    Please provide a valid state.
                                </div>
                            </div>
                            <div class="col-md-3 mb-3">
                                <label for="validationDefault05">Zip</label>
                                <input type="text" class="form-control" id="validationDefault05" placeholder="Zip" required>
                                <div class="invalid-feedback">
                                    Please provide a valid zip.
                                </div>
                            </div>
                        </div>

                        <button class="btn btn-primary" type="submit">Submit form</button>
                    </form>
                    <h4 class="card-title text-primary">Validation stats</h4>
                    <form>
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label for="validationServer01">First name</label>
                                <input type="text" class="form-control is-valid" id="validationServer01" placeholder="First name" value="Mark" required>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label for="validationServer02">Last name</label>
                                <input type="text" class="form-control is-valid" id="validationServer02" placeholder="Last name" value="Otto" required>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label for="validationServer03">City</label>
                                <input type="text" class="form-control is-invalid" id="validationServer03" placeholder="City" required>
                                <div class="invalid-feedback">
                                    Please provide a valid city.
                                </div>
                            </div>
                            <div class="col-md-3 mb-3">
                                <label for="validationServer04">State</label>
                                <input type="text" class="form-control is-invalid" id="validationServer04" placeholder="State" required>
                                <div class="invalid-feedback">
                                    Please provide a valid state.
                                </div>
                            </div>
                            <div class="col-md-3 mb-3">
                                <label for="validationServer05">Zip</label>
                                <input type="text" class="form-control is-invalid" id="validationServer05" placeholder="Zip" required>
                                <div class="invalid-feedback">
                                    Please provide a valid zip.
                                </div>
                            </div>
                        </div>
                        <button class="btn btn-prima-ry" type="submit">Submit form</button>
                    </form>
                    <h4 class="card-title text-primary">custom form controls validation</h4>
                    <form class="was-validated">
                        <div class="custom-control custom-checkbox mb-3">
                            <input type="checkbox" class="custom-control-input" id="customControlValidation1" required>
                            <label class="custom-control-label" for="customControlValidation1">Check this custom checkbox</label>
                            <div class="invalid-feedback">Example invalid feedback text</div>
                        </div>

                        <div class="custom-control custom-radio">
                            <input type="radio" class="custom-control-input" id="customControlValidation2" name="radio-stacked" required>
                            <label class="custom-control-label" for="customControlValidation2">Toggle this custom radio</label>
                        </div>
                        <div class="custom-control custom-radio mb-3">
                            <input type="radio" class="custom-control-input" id="customControlValidation3" name="radio-stacked" required>
                            <label class="custom-control-label" for="customControlValidation3">Or toggle this other custom radio</label>
                            <div class="invalid-feedback">More example invalid feedback text</div>
                        </div>

                        <div class="form-group">
                            <select class="custom-select" required>
                                <option value="">Open this select menu</option>
                                <option value="1">One</option>
                                <option value="2">Two</option>
                                <option value="3">Three</option>
                            </select>
                            <div class="invalid-feedback">Example invalid custom select feedback</div>
                        </div>

                        <div class="custom-file">
                            <input type="file" class="custom-file-input" id="validatedCustomFile" required>
                            <label class="custom-file-label" for="validatedCustomFile">Choose file...</label>
                            <div class="invalid-feedback">Example invalid custom file feedback</div>
                        </div>
                    </form>
                    <h4 class="card-title text-primary">Checkboxes</h4>
                    <div class="custom-control custom-checkbox">
                        <input type="checkbox" class="custom-control-input" id="customCheck1">
                        <label class="custom-control-label" for="customCheck1">Check this custom checkbox</label>
                    </div>
                    <h4 class="card-title text-primary">Radios</h4>
                    <div class="custom-control custom-radio">
                        <input type="radio" id="customRadio1" name="customRadio" class="custom-control-input">
                        <label class="custom-control-label" for="customRadio1">Toggle this custom radio</label>
                    </div>
                    <div class="custom-control custom-radio">
                        <input type="radio" id="customRadio2" name="customRadio" class="custom-control-input">
                        <label class="custom-control-label" for="customRadio2">Or toggle this other custom radio</label>
                    </div>
                    <h4 class="card-title text-primary">Inline</h4>
                    <div class="custom-control custom-radio custom-control-inline">
                        <input type="radio" id="customRadioInline1" name="customRadioInline1" class="custom-control-input">
                        <label class="custom-control-label" for="customRadioInline1">Toggle this custom radio</label>
                    </div>
                    <div class="custom-control custom-radio custom-control-inline">
                        <input type="radio" id="customRadioInline2" name="customRadioInline1" class="custom-control-input">
                        <label class="custom-control-label" for="customRadioInline2">Or toggle this other custom radio</label>
                    </div>
                    <h4 class="card-title text-primary">Disabled</h4>
                    <div class="custom-control custom-checkbox">
                        <input type="checkbox" class="custom-control-input" id="customCheckDisabled" disabled>
                        <label class="custom-control-label" for="customCheckDisabled">Check this custom checkbox</label>
                    </div>

                    <div class="custom-control custom-radio">
                        <input type="radio" id="radio3" name="radioDisabled" id="customRadioDisabled" class="custom-control-input" disabled>
                        <label class="custom-control-label" for="customRadioDisabled">Toggle this custom radio</label>
                    </div>
                    <h4 class="card-title text-primary">Select menu</h4>
                    <select class="custom-select mb-3">
                        <option selected>Open this select menu</option>
                        <option value="1">One</option>
                        <option value="2">Two</option>
                        <option value="3">Three</option>
                    </select>
                    <select class="custom-select custom-select-lg mb-3">
                        <option selected>Open this select menu</option>
                        <option value="1">One</option>
                        <option value="2">Two</option>
                        <option value="3">Three</option>
                    </select>
                    <select class="custom-select custom-select-sm mb-3">
                        <option selected>Open this select menu</option>
                        <option value="1">One</option>
                        <option value="2">Two</option>
                        <option value="3">Three</option>
                    </select>
                    <select class="custom-select mb-3" multiple>
                        <option selected>Open this select menu</option>
                        <option value="1">One</option>
                        <option value="2">Two</option>
                        <option value="3">Three</option>
                    </select>
                    <select class="custom-select mb-3" size="3">
                        <option selected>Open this select menu</option>
                        <option value="1">One</option>
                        <option value="2">Two</option>
                        <option value="3">Three</option>
                    </select>
                    <h4 class="card-title text-primary">File browser</h4>
                    <div class="custom-file">
                        <input type="file" class="custom-file-input" id="customFile">
                        <label class="custom-file-label" for="customFile">Choose file</label>
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
                var form = document.getElementById('needs-validation');
                $("#needs-validation").on('submit', function (event) {
                    if (form.checkValidity() === false) {
                        event.preventDefault();
                        event.stopPropagation();
                    }
                    form.classList.add('was-validated');
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