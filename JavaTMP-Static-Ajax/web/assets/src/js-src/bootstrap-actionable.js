(function (root, factory) {
    "use strict";
    // CommonJS module is defined
    if (typeof module !== "undefined" && module.exports) {
        module.exports = factory(require("jquery"), require("bootstrap"), require("bootstrap-modal-wrapper"));
    }
    // AMD module is defined
    else if (typeof define === "function" && define.amd) {
        define("bootstrap-actionable", ["jquery", "bootstrap"], function ($) {
            return factory($);
        });
    } else {
        // planted over the root!
        root.BootstrapActionable = factory(root.jQuery, root.BootstrapModalWrapperFactory);
    }

}(this, function ($, BootstrapModalWrapperFactory) {
    "use strict";

    var defaults = {
        loadingHtml: "Loading ...",
        ajaxHttpMethod: "GET",
        dataType: "HTML",
        ajaxContainerReady: "ajax-container-ready"
    };

    // The actual plugin constructor
    function BootstrapActionable() {
        this.options = $.extend({}, defaults);
        this.init();
        this.registerJQueryPlugin();
    }

    BootstrapActionable.prototype.init = function () {
        // Initialize Actionable plugin by listening on click event for any actionType attribute value
        var $this = this;
        $("body").on("click", '[actionType]', function (event) {
            event.preventDefault();
            var actionType = $(this).attr("actionType") ? $(this).attr("actionType") : "ajax";
            var actionScope = $(this).attr("actionScope") ? $(this).attr("actionScope") : "html";
            if (actionType === "ajax-model") {
                var href = $(this).attr("href") ? $(this).attr("href") : $(this).attr("actionLink");
                BootstrapModalWrapperFactory.createAjaxModal({
                    message: $this.options.loadingHtml,
                    dataType: $this.options.dataType,
                    httpMethod: $this.options.ajaxHttpMethod,
                    ajaxContainerReadyEventName: $this.options.ajaxContainerReady,
                    url: href
                });
            } else if (actionType === "action-ref") {
                var actionRefName = $(this).attr("action-ref-by-name") ? $(this).attr("action-ref-by-name") : "";
                if ($(actionScope + " [action-name='" + actionRefName + "']").length > 0) {
                    var linkTag = $(actionScope + " [action-name='" + actionRefName + "']:first");
                    // check if current link tag has attribute target
                    if (linkTag.attr('target')) {
                        window.open(linkTag.attr("href"), linkTag.attr('target'));
                    } else {
                        $(linkTag).trigger("click");
                    }
                }
            } else if (actionType === "action-ref-href") {
                var actionRefName = $(this).attr("action-ref-by-href") ? $(this).attr("action-ref-by-href") : "";
                if ($(actionScope + " [href='" + actionRefName + "']").length > 0) {
                    var linkTag = $(actionScope + " [href='" + actionRefName + "']:first");
                    // check if current link tag has attribute target
                    if (linkTag.attr('target')) {
                        window.open(linkTag.attr("href"), linkTag.attr('target'));
                    } else {
                        $(linkTag).trigger("click");
                    }
                }
            } else {
                console.log("ERROR: No Action handler attached for actionType=[" + actionType + "]");
            }
        });
    };

    BootstrapActionable.prototype.registerJQueryPlugin = function () {
        $.fn.BootstrapActionable = function (options) {
            function BootstrapActionable(element, defaults) {
                this.options = $.extend(true, {}, {
                    outputElement: element,
                    containerRemoveEventName: "containerRemoveEventName",
                    containerReadyEventName: "containerReadyEventName",
                    ajaxBeforeSend: null,
                    ajaxSuccess: null,
                    ajaxError: null
                }, defaults);
            }

            var populate = function (localOptions) {
                var $this = localOptions.linkElement;
                var event = localOptions.linkEvent;
                event.preventDefault();
                var javaTmpRemoveEvent = $.Event(localOptions.containerRemoveEventName, {_newTarget: $this});
                $(localOptions.outputElement).trigger(javaTmpRemoveEvent).promise().done(function () {
                    if (!javaTmpRemoveEvent.isDefaultPrevented()) {
                        $(localOptions.outputElement).off(localOptions.containerReadyEventName).promise().done(function () {
                            $(localOptions.outputElement).off(localOptions.containerRemoveEventName).promise().done(function () {
                                $(localOptions.outputElement).off(javaTmpRemoveEvent).promise().done(function () {
                                    $.ajax({
                                        type: javatmp.settings.httpMethod,
                                        async: true,
                                        cache: true,
                                        dataType: javatmp.settings.dataType,
                                        url: $this.attr("href"),
                                        data: javatmp.settings.defaultPassData,
                                        beforeSend: function (jqXHR, settings) {
                                            if ($.isFunction(localOptions.ajaxBeforeSend)) {
                                                return localOptions.ajaxBeforeSend.call(localOptions, jqXHR, settings);
                                            }
                                        },
                                        success: function (response, textStatus, jqXHR) {
                                            if ($.isFunction(localOptions.ajaxSuccess)) {
                                                return localOptions.ajaxSuccess.call(localOptions, response, textStatus, jqXHR);
                                            }
                                        },
                                        error: function (jqXHR, textStatus, errorThrown) {
                                            if ($.isFunction(localOptions.ajaxError)) {
                                                return localOptions.ajaxError.call(localOptions, jqXHR, textStatus, errorThrown);
                                            }
                                        }
                                    });
                                });
                            });
                        });
                    }
                });
            };

            BootstrapActionable.prototype.populateByLinkEvent = function (populateOptions) {
                var localOptions = $.extend(true, {}, this.options, populateOptions);
                populate(localOptions);
            };
            //expose methods
            if (typeof options === 'string') {
                var args = Array.prototype.slice.call(arguments, 1);
                if ($.isFunction(this.data('BootstrapActionable')[options])) {
                    return this.data('BootstrapActionable')[options].apply(this.data('BootstrapActionable'), args);
                } else {
                    throw new Error("Function [" + options + "] does not found in plugin BootstrapActionable");
                }
            }
            return this.each(function (index) {
                var element = $(this);

                // Return early if this element already has a plugin instance
                if (element.data('BootstrapActionable'))
                    return element.data('BootstrapActionable');
                // pass options to plugin constructor
                var bootstrapActionableInstance = new BootstrapActionable(element, options);
                // Store plugin object in this element's data
                element.data('BootstrapActionable', bootstrapActionableInstance);
                return bootstrapActionableInstance;
            });
        }
        ;
    };

    return new BootstrapActionable();
}));
