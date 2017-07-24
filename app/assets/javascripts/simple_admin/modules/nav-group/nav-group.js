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
		root.navGroup = factory(root);
	}
})(this, function (root) {
	'use strict';
	var instance = {
		nodeSelector: '.nav-group',
		nodeTitleSelector: '.nav-group__title',
		active: 'nav-group__open'
	};

	instance.selectActive = function(e) {
		var node = $(e.target).parents(instance.nodeSelector);
		var alreadyActive = node.hasClass(instance.active);
		instance.removeActive(function() {
			if (!alreadyActive) {
				node.addClass(instance.active);
				$(node).height(instance.getChildrenHeight(node));
			}
		});
	};

	instance.removeActive = function(cb) {
		$(instance.nodeSelector).each(function() {
			$(this).height(instance.getChildrenHeight(this, true));
			$(this).removeClass(instance.active);
		});
		if (cb) {
			cb();
		}
	};

	instance.getChildrenHeight = function(node, onlyFirst) {
		var height = 0;
		var selector = onlyFirst ? $(node).children().first() : $(node).children();
		selector.each(function() {
			height += $(this).outerHeight();
		});
		return height;
	};

	instance.initHeights = function() {
		$(instance.nodeSelector).each(function() {
			var titleHeight = instance.getChildrenHeight($(this), true);
			$(this).height(titleHeight);
		});
	};

	instance.init = function() {
		instance.initHeights();
		$(instance.nodeTitleSelector).on('click', instance.selectActive);
	};

	return instance;
});

$(document).ready(function() {
	navGroup.init();
});
