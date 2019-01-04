(function(){
	"use strict";
	
	angular.module('rgenDirectives').directive('rgenColorpicker', function() {

		return {
			restrict: 'E',
			require: '?ngModel',
			replace: true,
			scope: {
				ngModel: '=',
				label: '@',
				type: '@',
				lhelp: '@',
				fhelp: '@'
			},
			controller: function($scope){},
			//templateUrl: '../rgen/admin/template/directive/rgen_colorpicker.tpl',
			templateUrl: function(el,attrs){
				return (angular.isDefined(attrs.type)) ? 
				tpl('rgen_colorpicker_alone', 'dir'):
				tpl('rgen_colorpicker', 'dir');
			},
			link: function(scope, element, attrs, ctrl) {
				$(element).find('input').spectrum({
					preferredFormat: "rgb",
					allowEmpty: true,
					showAlpha: true,
					showInput: true,
					showButtons: false,
					showPalette: true,
					showSelectionPalette: true,
					clickoutFiresChange: true,
					palette: [ ],
					maxSelectionSize: 50,
					localStorageKey: "spectrum.homepage", // Any Spectrum with the same string will share selection
				});

				ctrl.$render = function() {
					$(element).find('input').spectrum("set", ctrl.$viewValue);
				};
			}
			
			
		};
	});

	
})();

