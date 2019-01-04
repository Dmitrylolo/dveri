(function(){
	"use strict";
	
	angular.module('rgenDirectives').directive('rgenBorder',['$modal', function($modal) {
		return {
			restrict: 'E',
			require: '?ngModel',
			replace: true,
			//templateUrl: '../rgen/admin/template/directive/rgen_border.tpl',
			templateUrl: function(el,attrs){
				return (angular.isDefined(attrs.type)) ? 
				tpl('rgen_border_alone', 'dir'):
				tpl('rgen_border', 'dir');
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
						templateUrl: tpl('rgen_border_modal', 'dir'),
						controller: "rgenBorderModal",
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

	angular.module('rgenDirectives').controller('rgenBorderModal', [
		'$scope', 
		'$modalInstance', 
		'Rest', 
		'Pop',
		'ngModel', 
		function($scope, $modalInstance, Rest, Pop, ngModel){

		// Default image data
		$scope.modaldata = {
			status     : true,
			size       : 'all',
			size_all   : 0,
			size_t     : 0,
			size_r     : 0,
			size_b     : 0,
			size_l     : 0,
			style      : 'solid',
			radius     : 'all',
			radius_all : 0,
			radius_t   : 0,
			radius_r   : 0,
			radius_b   : 0,
			radius_l   : 0,
			color_type : 'all',
			color      : '#eeeeee',
			color_t    : '#eeeeee',
			color_r    : '#eeeeee',
			color_b    : '#eeeeee',
			color_l    : '#eeeeee',
			css        : ''
		}

		// Size types
		$scope.size_types = [
			{ label:'Common', val:'all' },
			{ label:'Individual', val:'dif' }
		];

		// Color types
		$scope.color_types = [
			{ label:'Common', val:'all' },
			{ label:'Individual', val:'dif' }
		];

		// Style types
		$scope.style_types = [
			{ label:'Solid', val:'solid' },
			{ label:'Double', val:'double' },
			{ label:'Dotted', val:'dotted' },
			{ label:'Dashed', val:'dashed' }
		];

		// Radius types
		$scope.radius_types = [
			{ label:'Common', val:'all' },
			{ label:'Individual', val:'dif' }
		];

		$scope.modaldata = $.extend(true, $scope.modaldata, ngModel);
		//console.log($scope.modaldata);
		
		$scope.apply = function () {
			
			if ($scope.modaldata.size == 'all') {
				var border = 'border: '+$scope.modaldata.size_all+'px; ';
			} else {
				var border = 'border-width: '+$scope.modaldata.size_t+'px '+$scope.modaldata.size_r+'px '+$scope.modaldata.size_b+'px '+$scope.modaldata.size_l+'px;';
			};
			if ($scope.modaldata.radius == 'all') {
				var border_r = 'border-radius: '+$scope.modaldata.radius_all+'px;';
			} else {
				var border_r = 'border-radius: '+$scope.modaldata.radius_t+'px '+$scope.modaldata.radius_r+'px '+$scope.modaldata.radius_b+'px '+$scope.modaldata.radius_l+'px;';
			};

			if ($scope.modaldata.color_type == 'all') {
				var border_color  = 'border-color: '+$scope.modaldata.color+';';
			} else {
				var border_color  = 'border-top-color: '+$scope.modaldata.color_t+';';
					border_color += 'border-right-color: '+$scope.modaldata.color_r+';';
					border_color += 'border-bottom-color: '+$scope.modaldata.color_b+';';
					border_color += 'border-left-color: '+$scope.modaldata.color_l+';';
			};

			var border_style = 'border-style: '+$scope.modaldata.style+';';

			$scope.modaldata.css = border+border_style+border_color+border_r;

			$modalInstance.close($scope.modaldata);
		};
		$scope.cancel = function () {
			$modalInstance.dismiss('cancel');
		};
	}])
	
})();

