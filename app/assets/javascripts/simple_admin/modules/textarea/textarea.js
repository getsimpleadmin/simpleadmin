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
		root.textarea = factory(root);
	}
})(this, function (root) {
	'use strict';
	var instance = {
		nodeSelector: '.textarea',
		classes: {error: 'form__field--error'}
	};
	instance.onChange = function() {
		if ($(this).hasClass(instance.classes.error)) {
			$(this).removeClass(instance.classes.error);
		}
	};
	instance.init = function() {
		$(instance.nodeSelector).on('keyup', instance.onChange);
	};

	return instance;
});

$(document).ready(function() {
	textarea.init();
});
