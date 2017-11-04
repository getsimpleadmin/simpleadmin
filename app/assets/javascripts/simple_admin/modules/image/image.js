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
		root.imageField = factory(root);
	}
})(this, function (root) {
	'use strict';
	var instance = {
		nodeSelector: '.image',
		classes: {label: 'image__label', selected: 'image__selected'}

	};

	instance.setImage = function() {
		var input = this;
		var labelNode = $(input).parents('.'+instance.classes.label);
		if (input.files && input.files[0]) {
			var reader = new FileReader();

			reader.onload = function (e) {
				labelNode.css({'background-image': 'url("'+e.target.result+'")'});
				labelNode.addClass(instance.classes.selected);
			}

			reader.readAsDataURL(input.files[0]);
		} else {
			labelNode.attr('style', '');
			labelNode.removeClass(instance.classes.selected);
		}
	};

	instance.init = function() {
		$(instance.nodeSelector).on('change', instance.setImage);
	};

	return instance;
});

$(document).ready(function() {
	imageField.init();
});
