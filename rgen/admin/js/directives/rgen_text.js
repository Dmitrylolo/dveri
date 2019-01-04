(function(){
	"use strict";
	
	angular.module('rgenDirectives').directive('rgenText', function() {
		return {
			restrict: 'E',
			require: '?ngModel',
			replace: true,
			templateUrl: tpl('rgen_text', 'dir'),
			scope: {
				ngModel: '=',
				label: '@',
				lhelp: '@',
				fhelp: '@',
				pholder: '@',
				size: '@'
			},
			link: function($scope) {

			},
			controller: function($scope){
				
			}
		};
	});

	
})();

