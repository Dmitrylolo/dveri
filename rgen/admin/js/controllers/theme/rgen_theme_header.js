(function(){
	'use strict';
	angular.module('rgen').controller('themeHeader', [
		'$scope', 
		'$state',
		function($scope, $state){
			//$scope.goToState = function(name){ $state.go(name) };
			if ($state.current.name == 'header') {
				$state.go('header.general');
			};
		}]);

	angular.module('rgen').controller('themeHeaderData', [
		'$scope', 
		'Rest', 
		'Pop', 
		'Loader',
		'$state',
		'$compile',
		function($scope, Rest, Pop, Loader, $state, $compile){

			$scope.activeTab = $state.current.name;

			/* Default config data
			------------------------*/
			// Theme data settings
			$scope.db = {
				prefix   : 'rgen_',
				group    : 'rgen_theme',
				settings : 'rgen_settings',
				modgroup : false,
				section  : 'topbar',
				suffix   : ''
			}
			
			// Default parameters
			$scope.modType    = 'new';
			$scope.modId      = null;
			$scope.themeData  = {};
			$scope.namePrefix = '';
			$scope.imgPath    = rgen_config.DIR_ADMIN_IMG;
			
			if ($state.current.name == 'header.home') {
				$scope.modList    = [
					{ name:'Top header 1' , val:'topbar1' },
					{ name:'Top header 2' , val:'topbar2' }
				];	
			} else {
				$scope.modList    = [
					{ name:'Top header 1' , val:'topbar1_inner' },
					{ name:'Top header 2' , val:'topbar2_inner' }
				];
			};
			

			$scope.tpl = {
				topbar1: tpl('theme/header/topbar1'),
				topbar2: tpl('theme/header/topbar2'),
				topbar3: tpl('theme/header/topbar3'),
				minicart: tpl('theme/header/minicart'),
				searchbox: tpl('theme/header/searchbox')
			}

			
			$scope.yn = [
				{ label:'Yes', val:'y' },
				{ label:'No', val:'n' }
			];

			$scope.miniCart = function () {
				return {
					block: {},
					block_h: {},
					icon: {},
					popup_block: {},
					popup_block_text: '',
					popup_links: {
						normal: '',
						hover: ''
					},
					popup_remove_color: '',
					popup_border_color: '',
					popup_total_block: {},
					popup_total_text: '',
					popup_total_cartbtn: {},
					popup_total_checkoutbtn: {},
					popup_total_cartbtn_icon: true,
					popup_total_checkoutbtn_icon: true
				}
			}
			$scope.searchBox = function () {
				return {
					block: {},
					block_h: {},
					input: {},
					button: {},
					icon: {},
					autosearch: {
						wrp: {},
						prd: {},
						links: '',
						links_h: '',
						spl_price: '',
						spl_price_h: '',
						normal_price: '',
						normal_price_h: '',
						old_price: '',
						old_price_h: ''
					}
				}
			}
			$scope.breadcrumb = function () {
				return {
					block_wrp: {},
					block: {},
					link_normal: '#ffffff',
					link_hover: '#6ddee2',
					sep: 'rgba(255,255,255,0.5)'
				}
			}

			// Topbar defaults
			$scope.topbarDefault = function () {
				return {
					topbar1: {
						status: true,
						topbar_inner_status: 'y',
						header: {
							block: {},
							innerblock: {},
							image: {},
							innerimage: {}
						},
						logo: {},
						toplink: {
							block: {},
							link_normal: {},
							link_hover: {}
						},
						tdd: {
							dd: {},
							dd_sub: {},
							dd_item_normal: {},
							dd_item_hover: {}
						},
						mob: {
							header: {},
							logo: {},
							cart_block: {},
							search_block: {}
						},
						cart: new $scope.miniCart(),
						search: new $scope.searchBox(),
						breadcrumb: new $scope.breadcrumb()
					},
					topbar2: {
						status: true,
						topbar_inner_status: 'y',
						header: {
							block: {},
							innerblock: {},
							image: {},
							innerimage: {},
							uppertop: {},
							bottomtop: {}
						},
						logo: {},
						toplink: {
							block: {},
							link_normal: {},
							link_hover: {}
						},
						tdd: {
							dd: {},
							dd_sub: {},
							dd_item_normal: {},
							dd_item_hover: {}
						},
						mob: {
							header: {},
							logo: {}
						},
						cart: new $scope.miniCart(),
						search: new $scope.searchBox(),
						breadcrumb: new $scope.breadcrumb()
					}
				}
			}

			// Topbar defaults
			$scope.themeDefault = function () {
				return {
					topbar1: new $scope.topbarDefault()['topbar1'],
					topbar2: new $scope.topbarDefault()['topbar2'],
					topbar1_inner: new $scope.topbarDefault()['topbar1'],
					topbar2_inner: new $scope.topbarDefault()['topbar2']
				}
			}

			$scope.getkey = function (id) {
				$scope.modId = null;
				$scope.modId = id;
				$scope.themeData = new $scope.themeDefault()[id];
				
				// Marge data from response
				Loader.on('.rgen-container');
				Rest.themeGetkey($scope.db.group, $scope.modId).then(function(response){
					$scope.themeData = $.extend(true, $scope.themeData, response.data);
					//console.log($scope.themeData);
					setTimeout(function(){
						$scope.topbar_inner_status($scope.themeData.topbar_inner_status);
						$scope.$apply(function() {
							Loader.off('.rgen-container');	
						});
					}, 200);
				}, function (error){
					Pop.pop_error(error);
				});
				//=========================
			}
			$scope.getkey($scope.modList[0].val);

			$scope.fontObj = function (id) {
				switch(id) {
					case 'topbar1':
						return _.object([
							['topbar1_cart_cartbtn'     , Rest.findFonts($scope.themeData.cart.popup_total_cartbtn)],
							['topbar1_cart_checkoutbtn' , Rest.findFonts($scope.themeData.cart.popup_total_checkoutbtn)],
							['topbar1_search_input'     , Rest.findFonts($scope.themeData.search.input)]
						]);
					break;

					case 'topbar2':
						return _.object([
							['topbar2_cart_cartbtn'     , Rest.findFonts($scope.themeData.cart.popup_total_cartbtn)],
							['topbar2_cart_checkoutbtn' , Rest.findFonts($scope.themeData.cart.popup_total_checkoutbtn)],
							['topbar2_search_input'     , Rest.findFonts($scope.themeData.search.input)]
						]);
					break;
				}
			}

			$scope.settingsObj = function (id) {
				switch(id) {
					case 'topbar1':
						return {
							topbar_popup_cart_btn_icon: Rest.getVal($scope.themeData, 'cart.popup_total_cartbtn_icon', true),
		    				topbar_popup_checkout_btn_icon: Rest.getVal($scope.themeData, 'cart.popup_total_checkoutbtn_icon', true)
						};
					break;
					case 'topbar2':
						return {
							topbar_popup_cart_btn_icon: Rest.getVal($scope.themeData, 'cart.popup_total_cartbtn_icon', true),
		    				topbar_popup_checkout_btn_icon: Rest.getVal($scope.themeData, 'cart.popup_total_checkoutbtn_icon', true)
						};
					break;
				}
			}

			$scope.topbar_inner_status = function(status, copy){
				if (typeof(copy)==='undefined') copy = 'n';
				if (status == 'y') {
					Loader.on('.rgen-container');
					var newId = $scope.modId.split('_');
					Rest.themeGetkey($scope.db.group, newId[0]).then(function(response){
						$scope.themeData = $.extend(true, $scope.themeData, response.data);
						copy == 'y' ? $scope.themeData.topbar_inner_status = 'n':null;
						setTimeout(function(){
							$scope.$apply(function() {
								Loader.off('.rgen-container');	
							});
						}, 200);
					}, function (error){
						Pop.pop_error(error);
					});
				} else {
					Loader.on('.rgen-container');
					$scope.themeData = new $scope.themeDefault()[$scope.modId];
					$scope.themeData.topbar_inner_status = 'n';
					Rest.themeGetkey($scope.db.group, $scope.modId).then(function(response){
						$scope.themeData = $.extend(true, $scope.themeData, response.data);
						$scope.themeData.topbar_inner_status = 'n';
						setTimeout(function(){
							$scope.$apply(function() {
								Loader.off('.rgen-container');	
							});
						}, 200);
					}, function (error){
						Pop.pop_error(error);
					});
				}

			}

			$scope.save = function(){
				// Fonts
				$scope.fonts = $scope.fontObj($scope.modId) ? $scope.fontObj($scope.modId) : {};
				
				// Settings
				$scope.settings = $scope.settingsObj($scope.modId) ? $scope.settingsObj($scope.modId) : {};
				
				// Save data
				Loader.on('.rgen-container');
				// $group, $section, $key, $value
				Rest.themeEditkey($scope.db.group, $scope.db.prefix+$scope.db.section, $scope.modId, $scope.themeData).then(function(){
					
					if (_.size($scope.settings) > 0) {
						Rest.settingsSave($scope.db.settings, $scope.db.prefix+$scope.db.section, $scope.settings);
					}

					if (_.size($scope.fonts) > 0) {
						// Save fonts
						Rest.themeSavefonts($scope.db.group, 'fonts', $scope.fonts).then(function(){
							Pop.pop_success(rgen_config.text_success);
							Loader.off('.rgen-container');
						}, function (error){
							Loader.off('.rgen-container');
							Pop.pop_error(error);
						});
					} else {
						Pop.pop_success(rgen_config.text_success);
						Loader.off('.rgen-container');
					};

				}, function (error){
					Loader.off('.rgen-container');
					Pop.pop_error(error);
				});
			}

			// Reseting data
			$scope.reset     = function (id) { Pop.reset($scope, id); }
			$scope.resetData = function (id) {
				switch(id) {
					
					case 'topbar1':
					$scope.themeData = new $scope.themeDefault()['topbar1'];
					break;

					case 'topbar2':
					$scope.themeData = new $scope.themeDefault()['topbar2'];	
					break;

					case 'topbar1_inner':
					$scope.themeData = new $scope.themeDefault()['topbar1_inner'];	
					break;

					case 'topbar2_inner':
					$scope.themeData = new $scope.themeDefault()['topbar2_inner'];	
					break;

					case 'topbar_general':
					$scope.topbar_general = new $scope.generalDefault();
					setTimeout(function () { $scope.topbar_preview($scope.topbar_general.style); }, 200);
					break;
				}
			}

		}]);
})();