<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<div class="dynamic-ajax-content">
    <div class="page-header">
        <h1>jQuery select2 using Bootstrap theme</h1>
    </div>
    <div class="row">
        <div class="col-lg-12">
            <div class="alert alert-info">
                <p>Select2 is a jQuery based replacement for select boxes. It supports searching, remote data sets, and infinite scrolling of results.</p>
                <p>with A Select2 v4 Theme for Bootstrap 3.</p>
                <p>
                    <a class="btn btn-info" target="_blank" href="https://select2.github.io/">Demo Page</a>
                    <a class="btn btn-info" target="_blank" href="https://github.com/select2/select2">github.com Plugin Page</a>
                </p>
                <p>
                    <a class="btn btn-info" target="_blank" href="https://select2.github.io/select2-bootstrap-theme/">Demo Page</a>
                    <a class="btn btn-info" target="_blank" href="https://github.com/select2/select2-bootstrap-theme">
                        github.com select 2 theme for Bootstrap
                    </a>
                </p>
            </div>
            <div class="card">
                <div class="card-header">
                    Examples
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
                        <div class="col-md-12" role="main">
                            <div class="form-group">
                                <label for="multi-country-select" class="control-label">Select2 multi Countries</label>
                                <select id="multi-country-select" class="form-control" multiple>
                                    <c:choose>
                                        <c:when test="${fn:length(requestScope.countries) > 0}">
                                            <c:forEach items="${requestScope.countries}" var="country">
                                                <option value="${country.countryId}">${country.countryName}</option>
                                            </c:forEach>
                                        </c:when>
                                        <c:otherwise>
                                            <option value="-1">No Record Found</option>
                                        </c:otherwise>
                                    </c:choose>
                                </select>
                            </div>
                            <div class="form-group row">
                                <label for="remoteCountriesSelectId" class="col-sm-2 col-form-label">Remote Countries</label>
                                <div class="col-sm-10">
                                    <select id="remoteCountriesSelectId" class="form-control">
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <style type="text/css">

        .select2-result-repository {
            padding-top: 4px;
            padding-bottom: 3px;
        }
        .select2-result-repository__avatar {
            float: left;
            width: 25px;
            margin-right: 10px;
            line-height: 20px;

        }
        .select2-result-repository__avatar img {
            width: 100%;
            height: auto;
            border-radius: 2px;
            vertical-align: middle;
        }
        .select2-result-repository__title {
            color: black;
            font-weight: bold;
            word-wrap: break-word;
            line-height: 1.1;
            margin-bottom: 4px;
            vertical-align: middle;
            line-height: 20px;
        }
        .select2-results__option--highlighted .select2-result-repository__title {
            color: white;
        }
    </style>
    <script>
        // Set the "bootstrap" theme as the default theme for all Select2
        // widgets.
        //
        // @see https://github.com/select2/select2/issues/2927
        $.fn.select2.defaults.set("theme", "bootstrap");
        $.fn.select2.defaults.set("dir", javatmp.settings.direction);
        var placeholder = "Select a country";

        $("#multi-country-select").select2({
            theme: "bootstrap",
            dir: javatmp.settings.direction,
            allowClear: true,
            placeholder: placeholder,
            containerCssClass: ':all:',
            width: ''
        });

        $("#remoteCountriesSelectId").select2({
            width: '',
            containerCssClass: ':all:',
            ajax: {
                url: javatmp.settings.contextPath + "/country/ListCountryController",
                dataType: 'json',
                delay: 250,
                cache: true,
                data: function (params) {
                    return {
                        countryName: params.term,
                        page: params.page,
                        _ajaxGlobalBlockUI: false
                    };
                },
                processResults: function (data, params) {
                    // parse the results into the format expected by Select2
                    // since we are using custom formatting functions we do not need to
                    // alter the remote JSON data, except to indicate that infinite
                    // scrolling can be used
                    params.page = params.page || 1;

                    // https://stackoverflow.com/questions/14819865/select2-ajax-method-not-selecting
                    var actualResult = [];
                    for (var i = 0; i < data.data.records.length; i++) {
                        actualResult.push({
                            id: data.data.records[i].countryId,
                            text: data.data.records[i].countryName
                        });
                    }
                    return {
                        results: actualResult,
                        pagination: {
                            more: (params.page * data.data.numOfRowsPerPage) < data.data.allCount
                        }
                    };
                }
            },
            escapeMarkup: function (markup) {
                return markup;
            },
            minimumInputLength: 1,
            templateResult: formatCountry,
            templateSelection: formatCountrySelection
        });
        function formatCountry(repo) {
            if (repo.loading)
                return repo.text;
            var imagePath = javatmp.settings.contextPath + "/assets/img/flags/" + repo.id.toLowerCase() + ".png";

            var markup =
                    "<div class='select2-result-repository clearfix'>" +
                    "    <div class='select2-result-repository__avatar'><img src='" + imagePath + "' /></div>" +
                    "    <div class='select2-result-repository__title'>" + repo.text + " (" + repo.id + ")</div>" +
                    "</div>";

            return markup;
        }

        function formatCountrySelection(repo) {
            return repo.text || repo.countryName + " (" + repo.countryId + ")";
        }
    </script>
</div>