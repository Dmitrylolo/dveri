(function(){
	"use strict";
	
	angular.module('rgenDirectives').directive('rgenReset', ['Pop', function(Pop) {
		return {
			restrict: 'E',
			require: '?ngModel',
			replace: true,
			templateUrl: tpl('rgen_reset', 'dir'),
			scope: {
				ngModel: '=',
				config: '=',
				resetfn: '&',
				label: '@',
				frmsize: '@'
			},
			link: function(scope) {
				scope.setval = function (val) { scope.ngModel = val; }
			},
			controller: function($scope){
				$scope.statusConfig = typeof $scope.config != 'undefined' ? $scope.config : 1;
				$scope.lbl          = typeof $scope.label != 'undefined' ? $scope.label : "Status and Reset";
				$scope.frmsizeCls   = typeof $scope.frmsize != 'undefined' ? $scope.frmsize : "form-medium";
				
				
			}
		};
	}]);

	
})();

