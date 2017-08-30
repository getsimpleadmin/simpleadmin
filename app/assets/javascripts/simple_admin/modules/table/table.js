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
		root._table = factory(root);
	}
})(this, function (root) {
	'use strict';
	var instance = {
		nodeSelector: '.table'
	};
	instance.init = function() {
		$(instance.nodeSelector).tablesorter({cssHeader: '', cssAsc: 'table__cell--asc', cssDesc: 'table__cell--desc'});
	};
	return instance;
});

$(document).ready(function() {
	_table.init();
});
