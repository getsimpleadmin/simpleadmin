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
		root.form = factory(root);
	}
})(this, function (root) {
	'use strict';
	var instance = {
		nodeSelector: '.form',
		classes: {error: 'form__field--error'}
	};

	instance.onSubmit = function(e) {
		e.preventDefault();
		$(this).find('input, textarea').each(function(index, item) {
			var isRequired = $(this).attr('required');
			if (isRequired && !$(this).val()) {
				$(this).addClass(instance.classes.error);
			}
		});
	};
	instance.init = function() {
		$(instance.nodeSelector).on('submit', instance.onSubmit);
	};

	return instance;
});

$(document).ready(function() {
	form.init();
});
