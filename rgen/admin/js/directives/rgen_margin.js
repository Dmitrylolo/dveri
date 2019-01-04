(function(){
	"use strict";
	
	angular.module('rgenDirectives').directive('rgenMargin',['$modal', function($modal) {
		return {
			restrict: 'E',
			require: '?ngModel',
			replace: true,
			//templateUrl: '../rgen/admin/template/directive/rgen_margin.tpl',
			templateUrl: function(el,attrs){
				return (angular.isDefined(attrs.type)) ?
				tpl('rgen_margin_alone', 'dir'):
				tpl('rgen_margin', 'dir');
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
						templateUrl: tpl('rgen_margin_modal', 'dir'),
						controller: "rgenMarginModal",
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

	angular.module('rgenDirectives').controller('rgenMarginModal', [
		'$scope', 
		'$modalInstance', 
		'Rest', 
		'Pop',
		'ngModel', 
		function($scope, $modalInstance, Rest, Pop, ngModel){

		$scope.modaldata = {
			status:		true,
			type: 		'all',
			mrg: 		0,
			mrg_type:	'auto',
			mrg_t: 		0,
			mrg_t_type:	'auto',
			mrg_r: 		0,
			mrg_r_type:	'auto',
			mrg_b: 		0,
			mrg_b_type:	'auto',
			mrg_l: 		0,
			mrg_l_type:	'auto',
			css: 		''
		}

		// Margin types
		$scope.margin_types = [
			{ label:'Common', val:'all' },
			{ label:'Individual', val:'dif' }
		];

		$scope.marginval_types = [
			{ name:'inherit',	val:'inherit' },
			{ name:'auto',		val:'auto' },
			{ name:'integer',	val:'int' }
		];

		$scope.modaldata = _.extend($scope.modaldata, ngModel);
		
		$scope.apply = function () {
			
			if ($scope.modaldata.type == 'all') {
				if ($scope.modaldata.mrg_type == 'int') {
					$scope.modaldata.css = 'margin: ' +$scope.modaldata.mrg+ 'px;';
				}else{
					$scope.modaldata.css = 'margin: ' +$scope.modaldata.mrg_type+ ';';
				};
			}else{
				var t = $scope.modaldata.mrg_t_type != 'int' ? 'margin-top: '+$scope.modaldata.mrg_t_type+'; ' 		: 'margin-top: '+$scope.modaldata.mrg_t+'px; ';
				var r = $scope.modaldata.mrg_r_type != 'int' ? 'margin-right: '+$scope.modaldata.mrg_r_type+'; ' 	: 'margin-right: '+$scope.modaldata.mrg_r+'px; ';
				var b = $scope.modaldata.mrg_b_type != 'int' ? 'margin-bottom: '+$scope.modaldata.mrg_b_type+'; '	: 'margin-bottom: '+$scope.modaldata.mrg_b+'px; ';
				var l = $scope.modaldata.mrg_l_type != 'int' ? 'margin-left: '+$scope.modaldata.mrg_l_type+'; ' 		: 'margin-left: '+$scope.modaldata.mrg_l+'px; ';

				$scope.modaldata.css = t+r+b+l;
			};
			
			$modalInstance.close($scope.modaldata);
		};
		$scope.cancel = function () {
			$modalInstance.dismiss('cancel');
		};
	}])
	
})();

