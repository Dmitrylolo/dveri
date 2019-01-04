(function(){
	'use strict';
	angular.module('rgen').controller('moduleGridmanagerModal', [
		'$scope', 
		'$modalInstance', 
		'Rest', 
		'Pop', 
		'Loader',
		'item',
		'depth',
		'gridmanagerFactory',
		'SweetAlert',
		function($scope, $modalInstance, Rest, Pop, Loader, item, depth, gridmanagerFactory, SweetAlert) {

			$scope.depth = depth;
			$scope.item  = item;
			
			// Default parameters
			$scope.modaldata   = new gridmanagerFactory[$scope.item.node_type];
			$scope.namePrefix  = '';
			$scope.imgPath     = rgen_config.DIR_ADMIN_IMG;
			$scope.helpImg     = function (img) { Pop.help(img); };
			$scope.modaldata   = $.extend(true, $scope.modaldata, $scope.item.item_data);
			$scope.block_title = $scope.item.node_title ? $scope.item.node_title : 'Block';
			
			/* Block
			------------------------*/
			/* ROW MODAL - DATA
			********************************************/
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

			/* COLUMN MODAL - DATA
			********************************************/
			// Margin range
			var marginrange = _.range(1, 101);
			$scope.marginrange = [];
			_.map(marginrange, function(s){
				$scope.marginrange.push({ name:s, val: s });
			});
			
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

			/* BLOCK MODAL - MODULE SPECIFIC DATA
			********************************************/
			$scope.modsettings = function(module){
				switch (module) {
					case "menu":
						// Align
						$scope.alignment = [
							{ label:'Left', val:'left' },
							{ label:'Center', val:'center' },
							{ label:'Right', val:'right' }
						];
						var mod_setting = {
							align: 'left',
							type: 'h'
						}

						// Layout style
						$scope.layout_styles = [
							{ label:'Horizontal', val:'h' },
							{ label:'Vertical', val:'v' }
						];

						$scope.updateSettings(mod_setting);
						break;

					case "basicslideshow":
						var mod_setting = {
							w: 600,
							h: 300,
							sizetype: 'normal',
							beside: false,
							beside_size: 4,
							beside_gt: 'gt10'
						}

						$scope.updateSettings(mod_setting);
						break;

					case "basicbanners":
						// Banner view type
						$scope.banner_viewtype = [
							{ label:'Carousel', val: 'carousel' },
							{ label:'Grids', val: 'grid' }
						];
						// Carousel settings
						var itemrange = _.range(1, 11);
						$scope.item_range = [];
						_.map(itemrange, function(s){
							$scope.item_range.push({ label:s, val: s });
						});

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

						var mod_setting = {
							w: 600,
							h: 300,
							viewtype: 'grid',
							grids: {
								lg_desktop: 'eq4',
								desktop: 	'd-eq4',
								tablet: 	't-eq4',
								mob_xl: 	'mxl-eq2',
								mob_sm: 	'msm-eq2',
								mob_xs: 	'mxs-eq1',
								gutter: 	'gt10',
								margin_b: 	'mb10',
								classGroup:	'eq4 d-eq4 t-eq4 mxl-eq2 msm-eq2 mxs-eq1 gt10 mb10'
							},
							carousel: {
								item_margin: 20,
								item_display: 5,
								display_items: {},
								arrows: true,
								dots: true
							}
						}

						$scope.updateSettings(mod_setting);
						break;

					case "productgroups":
						$scope.group_viewtype = [
							{ label:'Normal', val: 'normal' },
							{ label:'Tab', val: 'tab' }
						];
						var mod_setting = {
							viewtype: 'normal'
						}

						$scope.updateSettings(mod_setting);
						break;

					case "revslider":
						var mod_setting = {
							slider_size: 'normal',
							slider_id: '',
							slider_data: {}
						}
						/* Get all sliders
						------------------------*/
						$scope.sliderList = []
						$scope.sliderData = null;
						$scope.getsliders = function () {
							Loader.on('.modal-body');
							Rest.modGetrevsliders().then(function(response){
								Loader.off('.modal-body');
								if (_.size(response.data) > 0) {
									_.map(response.data, function(s){
										$scope.sliderList.push({ name: s.title, val: s.id });
									});
									$scope.sliderData = response.data;
								};

								$scope.updateSettings(mod_setting);
								//console.log(angular.fromJson(response.data[0].params));
							}, function (error) {
								Pop.pop_error(error);
							});
						}
						$scope.getsliders();

						$scope.sliderSelect = function(id){
							if ($scope.sliderData != null) {
								$scope.modaldata.setting.mod_setting.slider_data = $scope.sliderData[id];
							};
						}
						/*------------------------*/

						$scope.updateSettings(mod_setting);
						break;
				}	
			}
			$scope.updateSettings = function (arr) {
				$scope.modaldata.setting.mod_setting = $.extend(true, arr, $scope.modaldata.setting.mod_setting);
			}


			/* BLOCK MODAL - DATA
			********************************************/
			// Module data
			$scope.mod_db               = [];
			$scope.modlist              = new Rest.modulelist().list;
			$scope.mod_items            = [];
			$scope.mod_selected         = null;
			$scope.selected_modulegroup = '';
			$scope.selected_moduleitem  = '';

			/* View
			------------------------*/
			$scope.block_types = [
				{ label:'Module item', val: 'mod' },
				{ label:'Custom HTML', val: 'html' }
			];
			
			/* Get all module from db
			------------------------*/
			Loader.on('.modal-body');
			Rest.modGetallmodules('rgen_module').then(function(response){
				Loader.off('.modal-body');
				$scope.mod_db = response.data;
				// Load module selection
				if (_.getPath($scope.modaldata, 'setting.block_type') == "mod") {
					if (typeof _.getPath($scope.modaldata, 'setting.mod_data.section') != "undefined" && 
						typeof _.getPath($scope.modaldata, 'setting.mod_data.key') != "undefined"){
						var modgroup = $scope.modaldata.setting.mod_data.section.replace("rgen_", "");
						$scope.selectedMod(modgroup, 'module_group');
						$scope.selectedMod($scope.modaldata.setting.mod_data.key, 'module_item');
					}
				};

			}, function (error) {
				Pop.pop_error(error);
			});

			$scope.previewtype = function (type) {
				var mod = _.filter($scope.modlist, function(val){ return 'rgen_'+val.code == type; });
				return mod[0].name;
			};
			
			$scope.selectedMod = function(key, type) {
				$scope.mod_selected = null;

				if (type == "module_group") {
					$scope.selected_modulegroup = key;
					$scope.mod_items = [];
					if (typeof $scope.mod_db['rgen_'+key] != 'undefined') {
						_.map($scope.mod_db['rgen_'+key], function(s){
							$scope.mod_items.push({ name:s.value.name, val: s.key });
						});
					};

					$scope.modsettings($scope.selected_modulegroup);
				};
				if (type == "module_item") {
					$scope.selected_moduleitem = key;
					if (typeof _.getPath($scope.mod_db, 'rgen_'+$scope.selected_modulegroup+'.'+$scope.selected_moduleitem) != "undefined") {
						$scope.mod_selected = _.getPath($scope.mod_db, 'rgen_'+$scope.selected_modulegroup+'.'+$scope.selected_moduleitem);
					} else {
						$scope.mod_selected = null;
					};
					$scope.modaldata.setting.mod_data = $scope.mod_selected;
				};
			}

			$scope.apply = function (response, type) {
				switch (type) {
					case "col":
						response.classGroup = response.lg_desktop+response.desktop+response.tablet+response.mob_xl+response.mob_sm+response.mob_xs;	
						$scope.item.item_data.column = response;
						$modalInstance.close($scope.item);
						break;

					case "customize":
						$scope.item.item_data.customize = response;
						$modalInstance.close($scope.item);
						break;

					case "row":
						$scope.item.item_data = response;
						$modalInstance.close($scope.item);
						break;

					case "block":

						if (response.setting.block_type == "mod") {
							if ($scope.mod_selected == null) {
								Pop.pop_error("Please select module");
							} else {
								$scope.item.node_title = $scope.mod_selected.value.name;
								$scope.item.item_data = response;
								$modalInstance.close($scope.item);
							};
						} else {
							$scope.item.node_title = "HTML content";
							$scope.item.item_data = response;
							$modalInstance.close($scope.item);
						};
						break;

				}
			};
			$scope.cancel = function () {
				$modalInstance.dismiss('cancel');
			};
	}]);
})();