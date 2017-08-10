/* eslint-disable */
(function (root, factory) {
    // AMD
    if (typeof define === 'function' && define.amd) {
        define(function () {
            return factory(root);
        });
    }
    // Node.js or CommonJS
    else if (typeof exports === 'object') {
        module.exports = factory;
    }

    // Browser globals
    else {
        root.aside = factory(root);
    }
})(this, function (root) {
    'use strict';
    var instance = {
        nodeSelector: '.aside',
        wrapper: '.aside__wrapper',
        notifyNode: '.notify'
    };

    var classes = {
        fixed: 'aside__wrapper--fixed'
    }

    instance.handleScroll = function() {
        instance.wrapperHeight = $(instance.wrapper).outerHeight();
        var nodeTop = $(instance.nodeSelector)[0].getBoundingClientRect().top;
        if (nodeTop < 0) {
            $(instance.wrapper).addClass(classes.fixed);
        } else {
            $(instance.wrapper).removeClass(classes.fixed);
        }
    };
    instance.init = function() {
        var pageContentHeight = $(document).height() - ($(instance.notifyNode).height() || 0);
        $(instance.nodeSelector).css({height: pageContentHeight});
        instance.handleScroll();
        window.addEventListener('scroll', instance.handleScroll);
    };

    return instance;
});

$(document).ready(function() {
    aside.init();
});
