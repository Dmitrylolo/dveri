(function(){
	"use strict";
	
	angular.module('rgenDirectives').directive('rgenSelect', ['Pop', function(Pop) {
		return {
			restrict: 'E',
			require: '?ngModel',
			replace: true,
			//templateUrl: '../rgen/admin/template/directive/rgen_select.tpl',
			templateUrl: function(el,attrs){
				return (angular.isDefined(attrs.type)) ? 
				tpl('rgen_select_alone', 'dir'):
				tpl('rgen_select', 'dir');
			},
			scope: {
				ngModel: '=',
				fn: '=',
				selectdata: '=',
				classname: '@',
				label: '@',
				lhelp: '@',
				fhelp: '@',
				size: '@',
				helpimg: '=',
				customfn: '&'
			},
			link: function(scope, element, attrs, ctrl) {
				scope.helpImg = function (img) { Pop.help(img); };
			},
			controller: function($scope){
				
			}
		};
	}]);

	
})();

