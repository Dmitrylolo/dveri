(function(){
	'use strict';
	angular.module('rgen').controller('moduleProductgroupsModal', [
		'$scope', 
		'$modalInstance', 
		'Rest', 
		'Pop', 
		'Loader',
		'item',
		'depth',
		'productgroupsFactory',
		'SweetAlert',
		function($scope, $modalInstance, Rest, Pop, Loader, item, depth, productgroupsFactory, SweetAlert) {

			$scope.depth = depth;
			$scope.item  = item;
			

			// Default parameters
			$scope.modaldata  = new productgroupsFactory[$scope.item.node_type];
			$scope.namePrefix = '';
			$scope.imgPath    = rgen_config.DIR_ADMIN_IMG;
			$scope.helpImg    = function (img) { Pop.help(img); };
			$scope.modaldata  = $.extend(true, $scope.modaldata, $scope.item.item_data);
			
			
			/* Default tabs
			------------------------*/
			$scope.tpl = {
				special  : tpl('modules/productgroups/group_special'),
				latest   : tpl('modules/productgroups/group_latest'),
				best     : tpl('modules/productgroups/group_best'),
				category : tpl('modules/productgroups/group_category'),
				brand    : tpl('modules/productgroups/group_brand'),
				custom   : tpl('modules/productgroups/group_custom')
			}
			$scope.manage_tabs = [
				{ label:'Special'     , val:'special' },
				{ label:'Latest'      , val:'latest' },
				{ label:'Best seller' , val:'best' },
				{ label:'Category'    , val:'category' },
				{ label:'Brand'       , val:'brand' },
				{ label:'Custom'      , val:'custom' }
			];
			$scope.manage_tab = $scope.item.node_type ? $scope.item.node_type : 'special';
			$scope.prev_tab = $scope.item.node_type ? $scope.item.node_type : 'special';
			$scope.tabtype = function (type) {
				if ($scope.prev_tab != type) {
					Loader.on('.modal-body');
					if (_.size($scope.item.item_data) > 0) {
						SweetAlert.swal({
							title              : "Are you sure?",
							text               : "Your previous data will reset if change group.",
							type               : "warning",
							showCancelButton   : true,
							confirmButtonColor : "#DD6B55",
							confirmButtonText  : "Yes",
							closeOnConfirm     : true
						},
						function(isConfirm){
							if (isConfirm) {
								$scope.modaldata      = new productgroupsFactory[type];
								$scope.item.item_data = $scope.modaldata;
								$scope.prev_tab       = $scope.manage_tab;
								//Pop.pop_success('Data has been reset.');
								Loader.off('.modal-body');
							}else{
								$scope.modaldata  = $scope.item.item_data;
								$scope.manage_tab = $scope.item.item_data.node_type;
								$scope.prev_tab   = $scope.manage_tab;
								Loader.off('.modal-body');
							}
						});
					}else{
						$scope.modaldata = new productgroupsFactory[type];
						$scope.prev_tab   = $scope.manage_tab;
						Loader.off('.modal-body');
					};
				};
			}
			//$scope.tabtype($scope.manage_tab);
			/*----------------------*/

			// Product style
			$scope.prdblock_styles = [
				{ name:'Block 1'       , val:'prd1' },
				{ name:'Block 2'       , val:'prd2' },
				{ name:'Block 3'       , val:'prd3' },
				{ name:'Block 4'       , val:'prd4' },
				{ name:'Small block 1' , val:'smallprd1' },
				{ name:'Small block 2' , val:'smallprd2' }
			];

			// Product view
			$scope.prdblock_view = [
				{ name:'Carousel' , val: 'carousel' },
				{ name:'Grids'    , val: 'grid' }
			];

			// Limit
			var limitrange = _.range(1, 31);
			$scope.limit_range = [];
			_.map(limitrange, function(s){
				$scope.limit_range.push({ name:s, val: s });
			});

			// Carousel settings
			var itemrange = _.range(1, 11);
			$scope.item_range = [];
			_.map(itemrange, function(s){
				$scope.item_range.push({ label:s, val: s });
			});

			// Item margin
			$scope.item_margin = [
				{ label:'0', val: 0 },
				{ label:'1', val: 1 },
				{ label:'2', val: 2 },
				{ label:'5', val: 5 },
				{ label:'10', val: 10 },
				{ label:'15', val: 15 },
				{ label:'20', val: 20 },
				{ label:'30', val: 30 },
				{ label:'40', val: 40 },
				{ label:'50', val: 50 },
				{ label:'60', val: 60 },
				{ label:'70', val: 70 }
			];

			/*$scope.selectfn = function () {
				setTimeout(function(){
					console.log($scope.modaldata.prd_view);
				}, 50);
			}*/

			$scope.apply = function (response, type, modaltype) {
				if (modaltype == 'content') {
					$scope.item.item_data.content = response.content;
					$scope.item.item_data.node_type = type;
					$scope.item.node_type = type;
				};
				if (modaltype == 'setting') {
					$scope.item.item_data.setting = response.setting;
					$scope.item.item_data.node_type = type;
					$scope.item.node_type = type;
				};
				$modalInstance.close($scope.item);
			};
			$scope.cancel = function () {
				$modalInstance.dismiss('cancel');
			};
	}]);
})();