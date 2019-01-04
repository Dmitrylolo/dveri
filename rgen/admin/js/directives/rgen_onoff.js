(function(){
	"use strict";
	
	angular.module('rgenDirectives').directive('rgenOnoff', function() {
		return {
			restrict: 'E',
			require: '?ngModel',
			replace: true,
			//templateUrl: '../rgen/admin/template/directive/rgen_onoff.tpl',
			templateUrl: function(el,attrs){
				return (angular.isDefined(attrs.type)) ? 
				tpl('rgen_onoff_alone', 'dir'):
				tpl('rgen_onoff', 'dir');
			},
			scope: {
				ngModel: '=',
				label: '@',
				lhelp: '@',
				fhelp: '@'
			},
			link: function(scope, element, attrs, ctrl) {
				$(element).find('.rgen-onoff').bootstrapSwitch({
					animate: false,
					onSwitchChange: function(event, state) {
						ctrl.$setViewValue(state);
					}
				});
				ctrl.$render = function() {
					var val = ctrl.$viewValue ? true : false;
					setTimeout(function(){
						$(element).find('.rgen-onoff').bootstrapSwitch('state', val);	
					}, 50);
				};
				
			},
			controller: function($scope){}
		};
	});

	
})();

