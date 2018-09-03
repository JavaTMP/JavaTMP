/*!
 * JavaTMP Init JS File.
 */
(function ($) {

    window.javatmp = {};

    window.javatmp.defaults = {
        // Http method to use when calling any ajax requests passing to jquery $.ajax
        httpMethod: "GET",

        // Datatype of ajax content passing to jquery $.ajax
        dataType: "html",

        // update browser hash with ajax url parts or not.
        // sometime you want to forbbid URL bookmarking or sharing so set it to false.
        updateURLHash: true,

        // extra parameters to send with the ajax requests or for managing template.
        // useful to notify your remote server.
        // Setting _ajaxGlobalBlockUI parameter to true will use BlockUI plugin
        // and block browser page and indicate to user
        // Setting _ajaxGlobalBlockUI parameter to false will NOT use BlockUI plugin
        // and The ajax request will silent and the user can operate in the site.
        // Setting _handleAjaxErrorGlobally to false will not handle any error globally and it is responsibilites to handle it.
        defaultPassData: {_ajax: "ajax", _ajaxGlobalBlockUI: true, _handleAjaxErrorGlobally: true},

        // Main Output selector for ajax request content.
        // it should be one and only one.
        defaultOutputSelector: '.main-body-content-container',

        // Whenever the browser resize on all devices
        // or user press collapse button to hide or show the sidebar on large screen only.
        // The template fire this event on defaultOutputSelector element above.
        javaTmpContainerResizeEventName: "javatmp-container-resize",

        // whenever the sidebar metismenu link click,
        // the template fire this event on defaultOutputSelector
        // and waiting until event's handler code finish and if the return value
        // from event's handler code is false or event.preventDefault() was called
        // will cancel current ajax request and keep you in the current page.
        // You can run any destruction code in this event's handler function.
        javaTmpContainerRemoveEventName: "javatmp-container-remove",

        // Whenever card's copress fullscreen button press the event fire
        // on defaultOutputSelector selector
        // with card object as parameter to handler fuction.
        cardFullscreenCompress: "card.fullscreen.compress",

        // Whenever card's expand fullscreen button press the event fire
        // on defaultOutputSelector selector
        // with card object as parameter to handler fuction.
        cardFullscreenExpand: "card.fullscreen.expand",

        // After the ajax request finished and content fetched and updated the page
        // the tempalte fire this event on defaultOutputSelector.
        // it is considered the safest way to run your initialiation code regarding new content.
        javaTmpAjaxContainerReady: "javatmp-ajax-container-ready",

        // Default url string to start the template from.
        // after template load it search for this string in href attribute
        // in sidebar's metismenu to fire a click on.
        defaultUrl: 'pages/home.html',

        // default float or direction used
        floatDefault: "left",

        // reverse float or direction used.
        floatReverse: 'right',

        // direction of the document:
        direction: "ltr",

        // attribute for some of plugins that support RTL through initialization parameter.
        isRTL: false,

        // additional string work as a URL contextPath of your web application
        contextPath: ""
    };

    window.javatmp.settings = {};

    window.javatmp.init = function (options) {
        // initialize application settings from default and options paramters:
        window.javatmp.settings = $.extend(true, {}, window.javatmp.defaults, options);
    };
}(jQuery));

