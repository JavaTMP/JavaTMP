/*!
 * JavaTMP Utils JS File.
 */
;
(function ($, window, document, undefined) {

    window.javatmp.util = window.javatmp.util || {};

    window.javatmp.util.getFixedOffset = function (listOfFixedElement) {
        var retOffset = 0;
        for (var i = 0; i < listOfFixedElement.length; i++) {
            retOffset = retOffset + $(listOfFixedElement[i]).outerHeight(true);
        }
        return retOffset;

    };

    window.javatmp.util.isWidthSmall = function () {
        var width = (window.innerWidth > 0) ? window.innerWidth : this.screen.width;
        if ((width < 768)) {
            return true;
        } else {
            return false;
        }
    };

    // http://stackoverflow.com/questions/1397329/how-to-remove-the-hash-from-window-location-with-javascript-without-page-refresh/5298684#5298684
    window.javatmp.util.removeHash = function () {
        var scrollV, scrollH, loc = window.location;
        if ("pushState" in history)
            history.replaceState("", document.title, loc.pathname + loc.search);
        else {
            // Prevent scrolling by storing the page's current scroll offset
            scrollV = (document.documentElement && document.documentElement.scrollTop) ||
                    document.body.scrollTop;
            scrollH = (document.documentElement && document.documentElement.scrollLeft) ||
                    document.body.scrollLeft;

            loc.hash = "";

            // Restore the scroll offset, should be flicker free
            document.body.scrollTop = scrollV;
            document.body.scrollLeft = scrollH;
        }
    };

    // http://stackoverflow.com/a/4541963/1461221
    window.javatmp.util.waitForFinalEvent = (function () {
        var timers = {};
        return function (callback, ms, uniqueId) {
            if (!uniqueId) {
                uniqueId = "Don't call this twice without a uniqueId";
            }
            if (timers[uniqueId]) {
                clearTimeout(timers[uniqueId]);
            }
            timers[uniqueId] = setTimeout(callback, ms);
        };
    })();

    // https://stackoverflow.com/a/4351575/1461221
    window.javatmp.util.executeFunctionByName = function (functionName, context /*, args */) {
        var originalFunctionName = functionName;
        var originalContext = context;
        var args = Array.prototype.slice.call(arguments, 2);
        var namespaces = functionName.split(".");
        var func = namespaces.pop();
        for (var i = 0; i < namespaces.length; i++) {
            context = context[namespaces[i]];
        }
        if (typeof context[func] !== 'function') {
            throw "[" + originalFunctionName + "] is not a function of [" + originalContext + "]";
        }
        return context[func].apply(context, args);
    };

    function uuid() {
        var uuid = "", i, random;
        for (i = 0; i < 32; i++) {
            random = Math.random() * 16 | 0;
            if (i === 8 || i === 12 || i === 16 || i === 20) {
                uuid += "-";
            }
            uuid += (i === 12 ? 4 : (i === 16 ? (random & 3 | 8) : random)).toString(16);
        }
        return uuid;
    }

    window.javatmp.util.getUniqueID = function (prefix) {
        return prefix + "-" + Math.floor((Math.random() * 100000000) + 1) + "-" + new Date().getTime() + "-" + uuid();
    };

}(jQuery, window, document));
