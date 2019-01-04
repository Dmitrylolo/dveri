(function(){
	"use strict";
	
	angular.module('rgenDirectives').directive('rgenBox',['$modal', function($modal) {
		return {
			restrict: 'E',
			require: '?ngModel',
			replace: true,
			//templateUrl: '../rgen/admin/template/directive/rgen_margin.tpl',
			templateUrl: function(el,attrs){
				return (angular.isDefined(attrs.type)) ? 
				tpl('rgen_box_alone', 'dir'):
				tpl('rgen_box', 'dir');
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
						templateUrl: tpl('rgen_box_modal', 'dir'),
						controller: "rgenBoxModal",
						size: 'lg',
						backdrop: 'static',
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

	angular.module('rgenDirectives').controller('rgenBoxModal', [
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
			background: '',
			color: '',
			f_size: '13px',
			text_align: 'left',
			border: {},
			padding: {},
			margin: {},
			shadow: {},
			w: '',
			h: '',
			css: ''
		}
		$scope.config = {
			fonts: 1,
			bg: 1,
			color: 0,
			f_size: 0,
			align: 0,
			border: 1,
			padding: 1,
			margin: 1,
			shadow: 1,
			w: 0, 
			h: 0
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
			
			$scope.modaldata.css = '';
			if ($scope.config.bg) {
				$scope.modaldata.css += $scope.modaldata.background != '' ? 'background-color: '+$scope.modaldata.background+'; ' : '';
			};
			if ($scope.config.fonts && $scope.modaldata.fonts.status) {
				$scope.modaldata.css += $scope.modaldata.fonts.css;
			};
			if ($scope.config.color) {
				$scope.modaldata.css += $scope.modaldata.color != '' ? 'color: '+$scope.modaldata.color+'; ' : '';
			};
			if ($scope.config.f_size) {
				$scope.modaldata.css += $scope.modaldata.f_size != '' ? 'font-size: '+$scope.modaldata.f_size+'; ' : '';
			};
			if ($scope.config.align) {
				$scope.modaldata.css += $scope.modaldata.text_align != '' ? 'text-align: '+$scope.modaldata.text_align+'; ' : '';
			};
			if ($scope.config.border && $scope.modaldata.border.status) {
				$scope.modaldata.css += $scope.modaldata.border.css;
			};
			if ($scope.config.padding && $scope.modaldata.padding.status) {
				$scope.modaldata.css += $scope.modaldata.padding.css;
			};
			if ($scope.config.margin && $scope.modaldata.margin.status) {
				$scope.modaldata.css += $scope.modaldata.margin.css;
			};
			if ($scope.config.shadow && $scope.modaldata.shadow.status) {
				$scope.modaldata.css += $scope.modaldata.shadow.css;
			};
			if ($scope.config.w && $scope.modaldata.w != '') {
				$scope.modaldata.css += 'width:'+$scope.modaldata.w+'px;';
			};
			if ($scope.config.h && $scope.modaldata.h != '') {
				$scope.modaldata.css += 'height:'+$scope.modaldata.h+'px;';
			};

			$modalInstance.close($scope.modaldata);
		};
		$scope.cancel = function () {
			$modalInstance.dismiss('cancel');
		};
	}])
	
})();

