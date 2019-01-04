(function(){
	"use strict";
	
	angular.module('rgenDirectives').directive('rgenSmallprdbox2',['$modal','Pop', function($modal, Pop) {
		return {
			restrict: 'E',
			require: '?ngModel',
			replace: true,
			//templateUrl: '../rgen/admin/template/directive/rgen_margin.tpl',
			templateUrl: function(el,attrs){
				return (angular.isDefined(attrs.type)) ? 
				tpl('rgen_smallprdbox2_alone', 'dir'):
				tpl('rgen_smallprdbox2', 'dir');
			},
			scope: {
				ngModel: '=',
				label: '@',
				lhelp: '@',
				fhelp: '@',
				buttonlabel: '@',
				type: '@',
				config: '=',
				helpimg: '='
			},
			link: function(scope, element, attrs, ctrl) {
				ctrl.$render = function() {
					scope.ngModel = ctrl.$viewValue;
				};
				
				scope.open = function(newscope) {
					var modalInstance = $modal.open({
						templateUrl: tpl('rgen_smallprdbox2_modal', 'dir'),
						controller: "rgenSmallPrdbox2Modal",
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

				scope.helpImg = function (img) { Pop.help(img); };
			}, 
			controller: function($scope, $modal){}
		};
	}]);

	angular.module('rgenDirectives').controller('rgenSmallPrdbox2Modal', [
		'$scope', 
		'$modalInstance', 
		'Rest', 
		'Pop',
		'ngModel', 
		'config',
		function($scope, $modalInstance, Rest, Pop, ngModel, config){

		$scope.modaldata = {
			status:	true,
			type: 'grid',
			prd: {
				block: {
					normal: {},
					hover: {}
				},
				image: {},
				prdname: {},
				prdname_hover: '',
				price_block: {},
				price_spl: '',
				price_new: '',
				price_old: '',
				btn: {}
			},
			css_data: {
				block_normal: '',
				block_hover: '',
				image: '',
				prdname: '',
				prdname_hover: '',
				price_block: '',
				price_spl: '',
				price_new: '',
				price_old: '',
				btn_normal: '',
				btn_hover: ''
			}
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

		$scope.modaldata = $.extend(true, $scope.modaldata, ngModel);
		
		$scope.apply = function () {
			
			var prd = $scope.modaldata.prd;

			$scope.modaldata.css_data.block_normal  = Rest.chk(prd.block.normal.css) ? prd.block.normal.css : '';
			$scope.modaldata.css_data.block_hover   = Rest.chk(prd.block.hover.css) ? prd.block.hover.css : '';
			
			$scope.modaldata.css_data.image         = Rest.chk(prd.image.css) ? prd.image.css : '';
			
			$scope.modaldata.css_data.prdname       = Rest.chk(prd.prdname.css) ? prd.prdname.css : '';
			$scope.modaldata.css_data.prdname_hover = Rest.chk(prd.prdname_hover) ? 'color: '+prd.prdname_hover+'; ' : '';
			
			$scope.modaldata.css_data.price_block   = Rest.chk(prd.price_block.css) ? prd.price_block.css : '';
			$scope.modaldata.css_data.price_spl     = Rest.chk(prd.price_spl) ? 'color: '+prd.price_spl+'; ' : '';
			$scope.modaldata.css_data.price_new     = Rest.chk(prd.price_new) ? 'color: '+prd.price_new+'; ' : '';
			$scope.modaldata.css_data.price_old     = Rest.chk(prd.price_old) ? 'color: '+prd.price_old+'; ' : '';
			
			$scope.modaldata.css_data.btn_normal    = Rest.chk(prd.btn.css_normal) ? prd.btn.css_normal : '';
			$scope.modaldata.css_data.btn_hover     = Rest.chk(prd.btn.css_hover) ? prd.btn.css_hover : '';
			
			$modalInstance.close($scope.modaldata);
		};
		$scope.cancel = function () {
			$modalInstance.dismiss('cancel');
		};
	}])
	
})();

