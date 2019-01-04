(function(){
	"use strict";
	
	angular.module('rgenDirectives').directive('rgenButton',['$modal', function($modal) {
		return {
			restrict: 'E',
			require: '?ngModel',
			replace: true,
			//templateUrl: '../rgen/admin/template/directive/rgen_margin.tpl',
			templateUrl: function(el,attrs){
				return (angular.isDefined(attrs.type)) ? 
				tpl('rgen_button_alone', 'dir'):
				tpl('rgen_button', 'dir');
			},
			scope: {
				ngModel: '=',
				label: '@',
				lhelp: '@',
				fhelp: '@',
				buttonlabel: '@',
				type: '@',
				config: '='
			},
			link: function(scope, element, attrs, ctrl) {
				ctrl.$render = function() {
					scope.ngModel = ctrl.$viewValue;
				};
				scope.open = function(newscope) {
					var modalInstance = $modal.open({
						templateUrl: tpl('rgen_button_modal', 'dir'),
						controller: "rgenButtonModal",
						backdrop: 'static',
						size: 'lg',
						resolve: {
							ngModel: function () {
								return scope.ngModel;
							},
							config: function () {
								return scope.config;
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

	angular.module('rgenDirectives').controller('rgenButtonModal', [
		'$scope', 
		'$modalInstance', 
		'Rest', 
		'Pop',
		'ngModel', 
		'config',
		function($scope, $modalInstance, Rest, Pop, ngModel, config){

		$scope.modaldata = {
			status:	true,
			fonts: {},
			font_color: {
				normal: '',
				hover: ''
			},
			background: {
				normal: '',
				hover: ''
			},
			border: {
				normal: {},
				hover: {}
			},
			padding: {},
			margin: {},
			shadow: {
				normal: {},
				hover: {}
			},
			f_size: '13px',
			text_align: 'left',
			css_normal: '',
			css_hover: ''
		}
		
		$scope.config = { 
			fonts: 1,
			f_size: 0,
			align: 0
		}

		// Align
		$scope.alignment = [
			{ label:'Left', val:'left' },
			{ label:'Center', val:'center' },
			{ label:'Right', val:'right' }
		];

		// Font size
		$scope.font_size = [];
		var sizerange = _.range(9, 101);
		_.map(sizerange, function(s){
			$scope.font_size.push({ val:s+'px', name: s+'px' });
		});

		$scope.config = $.extend(true, $scope.config, config);
		$scope.modaldata = $.extend(true, $scope.modaldata, ngModel);
		
		$scope.apply = function () {
			
			$scope.modaldata.css_normal = '';
			$scope.modaldata.css_hover = '';
			
			if ($scope.modaldata.fonts.status && $scope.config.fonts == 1) {
				$scope.modaldata.css_normal += $scope.modaldata.fonts.css;
			};
			$scope.modaldata.css_normal += $scope.modaldata.font_color.normal != '' ? 'color: '+$scope.modaldata.font_color.normal+'; ' : '';
			$scope.modaldata.css_normal += $scope.modaldata.background.normal != '' ? 'background-color: '+$scope.modaldata.background.normal+'; ' : '';
		
			if ($scope.modaldata.border.normal.status) {
				$scope.modaldata.css_normal += $scope.modaldata.border.normal.css;
			};
			if ($scope.modaldata.padding.status) {
				$scope.modaldata.css_normal += $scope.modaldata.padding.css;
			};
			if ($scope.modaldata.margin.status) {
				$scope.modaldata.css_normal += $scope.modaldata.margin.css;
			};
			if ($scope.modaldata.shadow.normal.status) {
				$scope.modaldata.css_normal += $scope.modaldata.shadow.normal.css;
			};
			if ($scope.modaldata.f_size && $scope.config.f_size == 1) {
				$scope.modaldata.css_normal += $scope.modaldata.f_size != '' ? 'font-size: '+$scope.modaldata.f_size+'; ' : '';
			};
			if ($scope.modaldata.text_align && $scope.config.align == 1) {
				$scope.modaldata.css_normal += $scope.modaldata.text_align != '' ? 'text-align: '+$scope.modaldata.text_align+'; ' : '';
			};

			$scope.modaldata.css_hover += $scope.modaldata.font_color.hover != '' ? 'color: '+$scope.modaldata.font_color.hover+'; ' : '';
			$scope.modaldata.css_hover += $scope.modaldata.background.hover != '' ? 'background-color: '+$scope.modaldata.background.hover+'; ' : '';
			if ($scope.modaldata.border.hover.status) {
				$scope.modaldata.css_hover += $scope.modaldata.border.hover.css;
			};
			if ($scope.modaldata.shadow.hover.status) {
				$scope.modaldata.css_hover += $scope.modaldata.shadow.hover.css;
			};

			$modalInstance.close($scope.modaldata);
		};
		$scope.cancel = function () {
			$modalInstance.dismiss('cancel');
		};
	}])
	
})();

