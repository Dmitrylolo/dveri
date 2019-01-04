(function(){
	"use strict";
	
	angular.module('rgenDirectives').directive('rgenScrollitems',['$modal', function($modal) {
		return {
			restrict: 'E',
			require: '?ngModel',
			replace: true,
			//templateUrl: '../rgen/admin/template/directive/rgen_border.tpl',
			templateUrl: function(el,attrs){
				return (angular.isDefined(attrs.type)) ? 
				tpl('rgen_scrollitems_alone', 'dir'):
				tpl('rgen_scrollitems', 'dir');
			},
			scope: {
				ngModel: '=',
				label: '@',
				lhelp: '@',
				fhelp: '@',
				buttonlabel: '@',
				type: '@'
			},
			link: function(scope, element, attrs, ctrl) {
				ctrl.$render = function() {
					scope.ngModel = ctrl.$viewValue;
				};
				scope.open = function(newscope) {
					var modalInstance = $modal.open({
						templateUrl: tpl('rgen_scrollitems_modal', 'dir'),
						controller: "rgenScrollitemsModal",
						size: 'lg',
						resolve: {
							ngModel: function () {
								return scope.ngModel;
							}
						}
					});
					modalInstance.result.then(function (response) {
						ctrl.$setViewValue(response);
						scope.ngModel = response;
					}, function(err){
						console.log(err);
					});
				}
			}, 
			controller: function($scope, $modal){}
		};
	}]);

	angular.module('rgenDirectives').controller('rgenScrollitemsModal', [
		'$scope', 
		'$modalInstance', 
		'Rest', 
		'Pop',
		'ngModel', 
		function($scope, $modalInstance, Rest, Pop, ngModel){

		// Default image data
		$scope.modaldata = {
			'w200' : 1,
			'w300' : 2,
			'w400' : 2,
			'w500' : 3,
			'w600' : 3,
			'w700' : 3,
			'w800' : 4,
			'w900' : 4,
			'w1000' : 5,
			'w1100' : 5
		}

		// Column size
		$scope.size_range = [];
		var rangeval = _.range(1, 13);
		_.map(rangeval, function(s){
			$scope.size_range.push({ label:s, val:s });
		});

		$scope.modaldata = $.extend(true,$scope.modaldata, ngModel);
		//console.log($scope.modaldata);
		
		$scope.apply = function () {
			$modalInstance.close($scope.modaldata);
		};
		$scope.cancel = function () {
			$modalInstance.dismiss('cancel');
		};
	}])
	
})();

