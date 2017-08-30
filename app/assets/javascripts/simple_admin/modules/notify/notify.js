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
        root.notify = factory(root);
    }
})(this, function (root) {
    'use strict';
    var instance = {
        nodeSelector: '.notify',
        close: '.notify__close',
        aside: '.aside'
    };

    instance.handleClick = function() {
        var notify = $(this).closest(instance.nodeSelector);
        notify.animate({marginTop: -notify.height(), duration: 300});
        $(instance.aside).animate({top: 0, duration: 300}, function() {notify.remove()});
    };

    instance.init = function() {
        $(instance.close).click(instance.handleClick);
    };

    return instance;
});

$(document).ready(function() {
    notify.init();
});
