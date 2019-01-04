(function(){
	"use strict";
	
	angular.module('rgenDirectives').directive('rgenRadio', ['Pop', function(Pop) {
		return {
			restrict: 'E',
			require: '?ngModel',
			replace: true,
			//templateUrl: '../rgen/admin/template/directive/rgen_radio.tpl',
			templateUrl: function(el,attrs){
				return (angular.isDefined(attrs.type)) ? 
				tpl('rgen_radio_alone', 'dir'):
				tpl('rgen_radio', 'dir');
			},
			scope: {
				ngModel: '=',
				radiodata: '=',
				label: '@',
				lhelp: '@',
				fhelp: '@',
				size: '@',
				helpimg: '=',
				radiofn: '&'
			},
			link: function(scope, element, attrs, ctrl) {
				
				scope.setradio = function (val) {
					ctrl.$setViewValue(val);
					scope.ngModel = val;
					//scope.radiofn();
				}

				scope.newdata = [];
				_.each(scope.radiodata, function(value){
					scope.newdata.push(value);
				});
				scope.newdataModel = { val: scope.ngModel };

				ctrl.$render = function() {
					scope.newdataModel = { val: ctrl.$viewValue };
				};

				scope.helpImg = function (img) { Pop.help(img); };
			}
		};
	}]);

	
})();

