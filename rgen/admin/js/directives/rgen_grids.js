(function(){
	"use strict";
	
	angular.module('rgenDirectives').directive('rgenGrids',['$modal', function($modal) {
		return {
			restrict: 'E',
			require: '?ngModel',
			replace: true,
			//templateUrl: '../rgen/admin/template/directive/rgen_border.tpl',
			templateUrl: function(el,attrs){
				return (angular.isDefined(attrs.type)) ? 
				tpl('rgen_grids_alone', 'dir'):
				tpl('rgen_grids', 'dir');
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
						templateUrl: tpl('rgen_grids_modal', 'dir'),
						controller: "rgenGridsModal",
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

	angular.module('rgenDirectives').controller('rgenGridsModal', [
		'$scope', 
		'$modalInstance', 
		'Rest', 
		'Pop',
		'ngModel', 
		function($scope, $modalInstance, Rest, Pop, ngModel){

		// Default image data
		/*
		cl 				= column class
		eq12 > cl 		= 12 grids
		d-eq12 > cl 	= 12 grids >= 980
		t-eq12 > cl 	= 12 grids >= 768
		mxl-eq12 > cl 	= 12 grids >= 600
		msm-eq12 > cl 	= 12 grids >= 480
		mxs-eq12 > cl 	= 12 grids >= 320 
		*/
		$scope.modaldata = {
			lg_desktop: 'eq4',
			desktop: 	'd-eq4',
			tablet: 	't-eq4',
			mob_xl: 	'mxl-eq2',
			mob_sm: 	'msm-eq2',
			mob_xs: 	'mxs-eq1',
			gutter: 	'gt20',
			margin_b: 	'mb20',
			classGroup:	'eq4 d-eq4 t-eq4 mxl-eq2 msm-eq2 mxs-eq1 gt20 mb20'
		}


		// Column size
		$scope.lg_desktop_size = [];
		var lg_desktoprange = _.range(1, 13);
		_.map(lg_desktoprange, function(s){
			$scope.lg_desktop_size.push({ label:s, val:'eq'+s });
		});

		$scope.desktop_size = [];
		var desktoprange = _.range(1, 13);
		_.map(desktoprange, function(s){
			$scope.desktop_size.push({ label:s, val:'d-eq'+s });
		});

		$scope.tablet_size = [];
		var tabletrange = _.range(1, 13);
		_.map(tabletrange, function(s){
			$scope.tablet_size.push({ label:s, val:'t-eq'+s });
		});

		$scope.mob_xl_size = [];
		var mob_xlrange = _.range(1, 13);
		_.map(mob_xlrange, function(s){
			$scope.mob_xl_size.push({ label:s, val:'mxl-eq'+s });
		});

		$scope.mob_sm_size = [];
		var mob_smrange = _.range(1, 13);
		_.map(mob_smrange, function(s){
			$scope.mob_sm_size.push({ label:s, val:'msm-eq'+s });
		});

		$scope.mob_xs_size = [];
		var mob_xsrange = _.range(1, 13);
		_.map(mob_xsrange, function(s){
			$scope.mob_xs_size.push({ label:s, val:'mxs-eq'+s });
		});

		// Gutter size
		$scope.gutter = [
			{ label:'0', val:'gt0' },
			{ label:'1', val:'gt1' },
			{ label:'2', val:'gt2' },
			{ label:'4', val:'gt4' },
			{ label:'10', val:'gt10' },
			{ label:'16', val:'gt16' },
			{ label:'20', val:'gt20' },
			{ label:'26', val:'gt26' },
			{ label:'30', val:'gt30' },
			{ label:'40', val:'gt40' },
			{ label:'50', val:'gt50' },
			{ label:'60', val:'gt60' }
		];

		// Column bottom margin
		$scope.margin_b = [
			{ label:'0', val:'mb0' },
			{ label:'1', val:'mb1' },
			{ label:'2', val:'mb2' },
			{ label:'4', val:'mb4' },
			{ label:'10', val:'mb10' },
			{ label:'16', val:'mb16' },
			{ label:'20', val:'mb20' },
			{ label:'26', val:'mb26' },
			{ label:'30', val:'mb30' },
			{ label:'40', val:'mb40' },
			{ label:'50', val:'mb50' },
			{ label:'60', val:'mb60' }
		];


		$scope.modaldata = $.extend(true,$scope.modaldata, ngModel);
		//console.log($scope.modaldata);
		
		$scope.apply = function () {

			$scope.modaldata.classGroup  = ' '+$scope.modaldata.lg_desktop;
			$scope.modaldata.classGroup += ' '+$scope.modaldata.desktop;
			$scope.modaldata.classGroup += ' '+$scope.modaldata.tablet;
			$scope.modaldata.classGroup += ' '+$scope.modaldata.mob_xl;
			$scope.modaldata.classGroup += ' '+$scope.modaldata.mob_sm;
			$scope.modaldata.classGroup += ' '+$scope.modaldata.mob_xs;
			$scope.modaldata.classGroup += ' '+$scope.modaldata.gutter;
			$scope.modaldata.classGroup += ' '+$scope.modaldata.margin_b;

			$modalInstance.close($scope.modaldata);
		};
		$scope.cancel = function () {
			$modalInstance.dismiss('cancel');
		};
	}])
	
})();

