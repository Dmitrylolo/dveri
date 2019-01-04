(function(){
	"use strict";
	
	angular.module('rgenDirectives').directive('rgenShadow',['$modal', function($modal) {
		return {
			restrict: 'E',
			require: '?ngModel',
			replace: true,
			//templateUrl: '../rgen/admin/template/directive/rgen_shadow.tpl',
			templateUrl: function(el,attrs){
				return (angular.isDefined(attrs.type)) ? 
				tpl('rgen_shadow_alone', 'dir'):
				tpl('rgen_shadow', 'dir');
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
						templateUrl: tpl('rgen_shadow_modal', 'dir'),
						controller: "rgenShadowModal",
						backdrop: 'static',
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

	angular.module('rgenDirectives').controller('rgenShadowModal', [
		'$scope', 
		'$modalInstance', 
		'Rest', 
		'Pop',
		'ngModel', 
		function($scope, $modalInstance, Rest, Pop, ngModel){

		$scope.modaldata = {
			status:		true,
			inset: 		'n',
			hor_l: 		0,
			ver_l: 		0,
			blur: 		0,
			spread: 	0,
			color: 		'rgba(0,0,0,0.05)',
			css: 		''
		}

		// Size types
		$scope.shadow_types = [
			{ label:'Yes', val:'y' },
			{ label:'No', val:'n' }
		];

		$scope.modaldata = _.extend($scope.modaldata, ngModel);
		
		$scope.apply = function () {
			var inset = $scope.modaldata.inset == 'n' ? '' : 'inset ';
			$scope.modaldata.css = 'box-shadow: '+inset+$scope.modaldata.hor_l+'px '+$scope.modaldata.ver_l+'px '+$scope.modaldata.blur+'px '+$scope.modaldata.spread+'px '+$scope.modaldata.color+';';
			$modalInstance.close($scope.modaldata);
		};
		$scope.cancel = function () {
			$modalInstance.dismiss('cancel');
		};
	}])
	
})();

