(function(){
	"use strict";
	
	angular.module('rgenDirectives').directive('rgenPadding',['$modal', function($modal) {
		return {
			restrict: 'E',
			require: '?ngModel',
			replace: true,
			//templateUrl: '../rgen/admin/template/directive/rgen_padding.tpl',
			templateUrl: function(el,attrs){
				return (angular.isDefined(attrs.type)) ? 
				tpl('rgen_padding_alone', 'dir'):
				tpl('rgen_padding', 'dir');
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
						templateUrl: tpl('rgen_padding_modal', 'dir'),
						controller: "rgenPaddingModal",
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

	angular.module('rgenDirectives').controller('rgenPaddingModal', [
		'$scope', 
		'$modalInstance', 
		'Rest', 
		'Pop',
		'ngModel', 
		function($scope, $modalInstance, Rest, Pop, ngModel){

		$scope.modaldata = {
			status:		true,
			type: 		'all',
			pad: 		0,
			pad_type:	'inherit',
			pad_t: 		0,
			pad_t_type:	'inherit',
			pad_r: 		0,
			pad_r_type:	'inherit',
			pad_b: 		0,
			pad_b_type:	'inherit',
			pad_l: 		0,
			pad_l_type:	'inherit',
			css: 		''
		}

		// Margin types
		$scope.padding_types = [
			{ label:'Common', val:'all' },
			{ label:'Individual', val:'dif' }
		];

		$scope.paddingval_types = [
			{ name:'inherit',	val:'inherit' },
			{ name:'integer',	val:'int' }
		];

		$scope.modaldata = $.extend(true,$scope.modaldata, ngModel);
		
		$scope.apply = function () {
			
			if ($scope.modaldata.type == 'all') {
				if ($scope.modaldata.pad_type == 'int') {
					$scope.modaldata.css = 'padding: ' +$scope.modaldata.pad+ 'px;';
				}else{
					$scope.modaldata.css = 'padding: ' +$scope.modaldata.pad_type+ ';';
				};
			}else{
				var t = $scope.modaldata.pad_t_type != 'int' ? 'padding-top: '+$scope.modaldata.pad_t_type+'; ' 		: 'padding-top: '+$scope.modaldata.pad_t+'px; ';
				var r = $scope.modaldata.pad_r_type != 'int' ? 'padding-right: '+$scope.modaldata.pad_r_type+'; ' 	: 'padding-right: '+$scope.modaldata.pad_r+'px; ';
				var b = $scope.modaldata.pad_b_type != 'int' ? 'padding-bottom: '+$scope.modaldata.pad_b_type+'; '	: 'padding-bottom: '+$scope.modaldata.pad_b+'px; ';
				var l = $scope.modaldata.pad_l_type != 'int' ? 'padding-left: '+$scope.modaldata.pad_l_type+'; ' 		: 'padding-left: '+$scope.modaldata.pad_l+'px; ';

				$scope.modaldata.css = t+r+b+l;
			};
			
			$modalInstance.close($scope.modaldata);
		};
		$scope.cancel = function () {
			$modalInstance.dismiss('cancel');
		};
	}])
	
})();

