(function(){
	'use strict';
	angular.module('rgen').controller('moduleMenuModal', [
		'$scope', 
		'$modalInstance', 
		'Rest', 
		'Pop', 
		'Loader',
		'parentitem',
		'menuitem',
		'menuitem_depth',
		'menuFactory',
		'SweetAlert',
		function($scope, $modalInstance, Rest, Pop, Loader, parentitem, menuitem, menuitem_depth, menuFactory, SweetAlert) {

			$scope.depth      = menuitem_depth;
			$scope.menuitem   = menuitem;
			$scope.parentitem = parentitem ? parentitem : null;

			/* Item - common
			------------------------*/
			// Sub menu item types
			if ($scope.parentitem.submenu_type == "fly") {
				$scope.sub_item_type = [
					{ label:'Normal'   , val:'normal' },
					{ label:'Category' , val:'cat' },
					{ label:'Products' , val:'prd' },
					{ label:'Brands'   , val:'brand' }
				];
				$scope.subtype = "fly";
			} else {
				$scope.sub_item_type = [
					{ label:'Normal'      , val:'normal' },
					{ label:'Category'    , val:'cat' },
					{ label:'Products'    , val:'prd' },
					{ label:'Brands'      , val:'brand' },
					{ label:'Image'       , val:'bannerimg' },
					{ label:'Info boxes'  , val:'infobox' },
					{ label:'Custom HTML' , val:'customhtml' }
				];
				$scope.subtype = "mega";
			};

			/* Default tabs
			------------------------*/
			$scope.manage_tabs = [
				{ label:'Item', val:'item' },
				{ label:'Label' , val:'label' },
				{ label:'Icon' , val:'icon' }
			];
			$scope.manage_tab = 'item';
			$scope.tabtype = function (type) {
				Loader.on('.modal-body');
				$scope.manage_tab = type;
				setTimeout(function(){ Loader.off('.modal-body'); }, 200);
			}
			/*----------------------*/
			
			// bottom margin
			$scope.margin_bottom = [
				{ name: '0', val: ' mrb0' },
				{ name: '1', val: ' mrb1' },
				{ name: '2', val: ' mrb2' },
				{ name: '5', val: ' mrb5' },
				{ name: '10', val: ' mrb10' },
				{ name: '15', val: ' mrb15' },
				{ name: '20', val: ' mrb20' },
				{ name: '25', val: ' mrb25' },
				{ name: '30', val: ' mrb30' },
				{ name: '35', val: ' mrb35' },
				{ name: '40', val: ' mrb40' },
				{ name: '45', val: ' mrb45' },
				{ name: '50', val: ' mrb50' },
				{ name: '55', val: ' mrb55' },
				{ name: '60', val: ' mrb60' }
			];
			
			/* Item - Normal
			------------------------*/
			// Link style
			$scope.link_style = [
				{ label:'Normal', val:'normal' },
				{ label:'Title', val:'title' }
			];

			/* Item - Category
			------------------------*/
			// Category styles
			$scope.cat_styles = [];
			var catstylerange = _.range(1, 3);
			_.map(catstylerange, function(s){
				$scope.cat_styles.push({ label:s, val:s });
			});

			// Max size
			$scope.max_limit = [];
			var maxsizerange = _.range(1, 26);
			_.map(maxsizerange, function(s){
				$scope.max_limit.push({ name:s, val:s });
			});


			/* Item - Products
			------------------------*/
			// Product styles
			$scope.prd_styles = [];
			var prdstylerange = _.range(1, 3);
			_.map(prdstylerange, function(s){
				$scope.prd_styles.push({ label:s, val:s });
			});


			/* Item - Brands
			------------------------*/
			// Brand styles
			$scope.brand_styles = [];
			var brandstylerange = _.range(1, 3);
			_.map(brandstylerange, function(s){
				$scope.brand_styles.push({ label:s, val:s });
			});


			/* Item - Banner image
			------------------------*/
			// styles
			$scope.banner_styles = [];
			var bannerstylerange = _.range(1, 5);
			_.map(bannerstylerange, function(s){
				$scope.banner_styles.push({ label:s, val:s });
			});

			/* Item - Info box
			------------------------*/
			// styles
			$scope.infobox_styles = [];
			var infoboxstylerange = _.range(1, 5);
			_.map(infoboxstylerange, function(s){
				$scope.infobox_styles.push({ label:s, val:s });
			});

			// Align
			$scope.alignment = [
				{ label:'Left', val:'left' },
				{ label:'Center', val:'center' }
			];
			
			/* Main menu item
			------------------------*/
			// Style types
			$scope.main_menu_type = [
				{ label:'None', val:'n' },
				{ label:'Fly out', val:'fly' },
				{ label:'Mega menu', val:'mega' }
			];

			// Label type
			$scope.lbl_type = [
				{ label:'Text', val:'txt' },
				{ label:'Image', val:'img' }
			];

			// Menu icons position
			$scope.icon_positions = [
				{ label:'Left', val:'l' },
				{ label:'Top' , val:'t' }
			];

			// Sub menu size
			$scope.sub_size = [];
			var subsizerange = _.range(1, 12);
			_.map(subsizerange, function(s){
				$scope.sub_size.push({ label:s, val:'sub-size'+s });
			});
			$scope.sub_size.push({ label: 'Full width', val:'sub-size-full' });

			// Font size
			$scope.font_size = [];
			var sizerange = _.range(9, 21);
			_.map(sizerange, function(s){
				$scope.font_size.push({ val:s+'px', name: s+'px' });
			});

			$scope.main_menu = new menuFactory.main();

			
			/* Row
			------------------------*/
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

			$scope.row = new menuFactory.row();


			/* Column
			------------------------*/
			// Column size
			$scope.col_size = [];
			var colsizerange = _.range(1, 13);
			_.map(colsizerange, function(s){
				$scope.col_size.push({ label:s, val:'cl'+s });
			});

			$scope.lg_desktop_size = [];
			var lg_desktopsizerange = _.range(1, 13);
			_.map(lg_desktopsizerange, function(s){
				$scope.lg_desktop_size.push({ label:s, val:'cl'+s });
			});

			$scope.desktop_size = [];
			var desktopsizerange = _.range(1, 13);
			_.map(desktopsizerange, function(s){
				$scope.desktop_size.push({ label:s, val:' d-xl'+s });
			});

			$scope.tablet_size = [];
			var tabletsizerange = _.range(1, 13);
			_.map(tabletsizerange, function(s){
				$scope.tablet_size.push({ label:s, val:' t-xl'+s });
			});

			$scope.mob_xl_size = [];
			var mob_xlsizerange = _.range(1, 13);
			_.map(mob_xlsizerange, function(s){
				$scope.mob_xl_size.push({ label:s, val:' m-xl'+s });
			});

			$scope.mob_sm_size = [];
			var mob_smsizerange = _.range(1, 13);
			_.map(mob_smsizerange, function(s){
				$scope.mob_sm_size.push({ label:s, val:' m-sm'+s });
			});

			$scope.mob_xs_size = [];
			var mob_xssizerange = _.range(1, 13);
			_.map(mob_xssizerange, function(s){
				$scope.mob_xs_size.push({ label:s, val:' m-xs'+s });
			});

			$scope.col = new menuFactory.col();


			/* Sub menu item
			------------------------*/
			$scope.sub_menu = new menuFactory.item();
			
			$scope.clone_item_type = $scope.sub_menu.item_type;
			$scope.itemtype = function (item) {
				//$scope.menuitem.items = [];
				switch (item) {
					case "normal":
						$scope.sub_menu.sub_item = new menuFactory.normal_link();
						break;

					case "cat":
						$scope.sub_menu.sub_item = new menuFactory.cat();
						break;

					case "prd":
						$scope.sub_menu.sub_item = new menuFactory.prd();
						break;

					case "brand":
						$scope.sub_menu.sub_item = new menuFactory.brand();
						break;

					case "bannerimg":
						$scope.sub_menu.sub_item = new menuFactory.bannerimg();
						break;

					case "infobox":
						$scope.sub_menu.sub_item = new menuFactory.infobox();
						break;

					case "customhtml":
						$scope.sub_menu.sub_item = new menuFactory.customhtml();
						break;
				}
			}
			
			if ($scope.menuitem.node_type === 'item') {
				var type = $scope.menuitem.item_data.item_type ? $scope.menuitem.item_data.item_type : 'normal';
				$scope.itemtype(type);
			};
			
			// Merging data
			Loader.on('.modal-body');
			/*$scope.main_menu  = _.deepExtend($scope.main_menu, $scope.menuitem.item_data);
			$scope.row        = _.extend($scope.row, $scope.menuitem.item_data);
			$scope.col        = _.extend($scope.col, $scope.menuitem.item_data);*/
			//$scope.sub_menu = _.extend($scope.sub_menu, $scope.menuitem.item_data);
			//$scope.sub_menu   = _.deepExtend($scope.sub_menu, $scope.menuitem.item_data);
			$scope.main_menu  = $.extend(true, $scope.main_menu, $scope.menuitem.item_data);
			$scope.row        = $.extend(true, $scope.row, $scope.menuitem.item_data);
			$scope.col        = $.extend(true, $scope.col, $scope.menuitem.item_data);
			$scope.sub_menu   = $.extend(true, $scope.sub_menu, $scope.menuitem.item_data);
			Loader.off('.modal-body');


			/* On sub menu switch
			------------------------*/
			$scope.cloneMenu = {};
			$scope.submenu_change = function(main_menu, submenu_type){
				if ((_.size($scope.menuitem.items) > 0) && $scope.menuitem.item_data.submenu_type != submenu_type) {
					SweetAlert.swal({
						title              : "Are you sure?",
						text               : "Your existing data will reset if switch sub menu type.",
						type               : "warning",
						showCancelButton   : true,
						confirmButtonColor : "#DD6B55",
						confirmButtonText  : "Yes",
						closeOnConfirm     : false
					},
					function(isConfirm){
						if (isConfirm) {
							$scope.cloneMenu = angular.copy($scope.menuitem);

							$scope.menuitem.items = [];
							Pop.pop_success('Sub menu data has been reset.');
							return $scope.cloneMenu;

						} else {
							$scope.$apply(function() {
								$scope.main_menu.submenu_type = "fly";
							});
						}
					});
				};
			}
			
			$scope.dataApply = function ($scope, $modalInstance, response) {
				$scope.menuitem.item_data = response;
				$modalInstance.close($scope.menuitem);
			}

			$scope.apply = function (response) {

				$scope.menuitem.submenu_type = response.submenu_type;

				if (response.node == 'main') {
					$scope.menuitem.node_title = response.title[rgen_config.config_lng] ? Rest.trimStr(response.title[rgen_config.config_lng], 70) : "Main item";
					$scope.dataApply($scope, $modalInstance, response);
				} else if (response.node == 'item') {
					
					switch(response.item_type) {
						case 'normal':
							$scope.menuitem.node_title = response.sub_item.title[rgen_config.config_lng] ? response.sub_item.title[rgen_config.config_lng] : "Sub item";
							$scope.dataApply($scope, $modalInstance, response);
							break;
						case 'cat':
							if (_.size(response.sub_item.category) != 0) {
								$scope.menuitem.node_title = response.sub_item.category.name ? response.sub_item.category.name : "Category item";
								$scope.dataApply($scope, $modalInstance, response);
							} else {
								Pop.pop_error('Please select category');
							};
							break;
						case 'prd':
							if (_.size(response.sub_item.products) != 0) {
								$scope.menuitem.node_title = "Products";
								$scope.dataApply($scope, $modalInstance, response);
							} else {
								Pop.pop_error('Please select products');
							};
							break;
						case 'brand':
							if (_.size(response.sub_item.brands) != 0) {
								$scope.menuitem.node_title = "Brands";
								$scope.dataApply($scope, $modalInstance, response);
							} else {
								Pop.pop_error('Please select brands');
							};
							break;

						case 'bannerimg':
							$scope.menuitem.node_title = "Banner image";
							$scope.dataApply($scope, $modalInstance, response);
							break;

						case 'infobox':
							$scope.menuitem.node_title = "Info boxes";
							$scope.dataApply($scope, $modalInstance, response);
							break;

						case 'customhtml':
							$scope.menuitem.node_title = "Custom HTML";
							$scope.dataApply($scope, $modalInstance, response);
							break;
					}
				} else if (response.node == 'row') {
					$scope.dataApply($scope, $modalInstance, response);
				} else if (response.node == 'col') {
					response.classGroup = response.lg_desktop+response.desktop+response.tablet+response.mob_xl+response.mob_sm+response.mob_xs;
					$scope.dataApply($scope, $modalInstance, response);
				};

			};
			$scope.cancel = function () {
				$modalInstance.dismiss('cancel');
			};
	}]);
})();