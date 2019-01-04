(function(){
	'use strict';

	angular.module('rgen').controller('themeHeaderGeneral', [
		'$scope', 
		'Rest', 
		'Pop', 
		'Loader',
		'SweetAlert',
		function($scope, Rest, Pop, Loader, SweetAlert){

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
			$scope.modList    = [
				{ name:'General'   , val:'topbar_common' },
				{ name:'Top bar 1' , val:'topbar1_general' },
				{ name:'Top bar 2' , val:'topbar2_general' }
			];

			$scope.tpl = {
				topbar_common  : tpl('theme/header/topbar_common'),
				topbar1_general  : tpl('theme/header/topbar1_general'),
				topbar2_general  : tpl('theme/header/topbar2_general')
			}

			// Topbar styles
			$scope.topbar_styles = [
				{ label:'1', val: 1 },
				{ label:'2', val: 2 }
			];

			// Yes / No
			$scope.yn = [
				{ label:'Yes', val: 'y' },
				{ label:'No', val: 'n' }
			];

			// Left / center
			$scope.positions = [
				{ label:'Left', val: 'l' },
				{ label:'Center', val: 'c' }
			];

			// Layout width
			$scope.topbar_width = [
				{ label:'Boxed', val:'bx' },
				{ label:'Full width', val:'fw' }
			];


			$scope.themeDefault = function () {
				return {
					topbar_common: {
						style: 1,
						layout: "bx",
						autosearch: false
					},
					topbar1_general: {
						status: true,
						
						logo: {
							in_menu: 'y',
							w: 190,
							position: 'l'
						},

						cart_link: true,
						checkout_link: true,
						wishlist: true,
						myaccount: {
							status: true,
							icon: { icon: 'fa fa-user' }
						},
						cart: {
							status: true,
							icon: { icon: 'glyphicon glyphicon-shopping-cart' }
						},
						search: true,
						currency: true,
						language: true,

						customlinks: true,
						customlink_data: [
							{ 
								text: {},
								link: '' 
							},
						]
					},
					topbar2_general: {
						status: true,
						
						logo: {
							in_menu: 'y',
							w: 190,
							position: 'l'
						},

						cart_link: true,
						checkout_link: true,
						wishlist: true,
						myaccount: {
							status: true,
							icon: { icon: 'fa fa-user' }
						},
						cart: {
							status: true,
							icon: { icon: 'glyphicon glyphicon-shopping-cart' }
						},
						search: true,
						currency: true,
						language: true,

						customlinks: true,
						customlink_data: [
							{ 
								text: {},
								link: '' 
							},
						]
					}
				}
			}
			
			// Custom links
			$scope.addCustomlink = function (key) {
				if (_.size($scope.themeData.customlink_data) <= 8) {
					$scope.themeData.customlink_data.push({ text: {}, link: '' });
				} else {
					Pop.pop_error('Maximum limit reached.');
				};
			}
			$scope.removeCustomlink = function ($index) {
				$scope.themeData.customlink_data.splice($index, 1);
			}
			$scope.customlinks_status = function(){
				$scope.themeData.customlinks;
			}

			$scope.getkey = function (id) {
				$scope.modId = null;
				$scope.modId = id;
				$scope.themeData = new $scope.themeDefault()[id];
				
				// Marge data from response
				Loader.on('.rgen-container');
				Rest.themeGetkey($scope.db.group, $scope.modId).then(function(response){
					$scope.themeData = $.extend(true, $scope.themeData, response.data);
					
					setTimeout(function(){
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

			// Reseting data
			$scope.reset     = function (id) { Pop.reset($scope, id); }
			$scope.resetData = function (id) {
				switch(id) {
					
					case 'topbar1_general':
					$scope.themeData = new $scope.themeDefault()['topbar1_general'];
					break;

					case 'topbar2_general':
					$scope.themeData = new $scope.themeDefault()['topbar2_general'];
					break;
				}
			}

			$scope.settingsObj = function (id) {
				switch(id) {
					case 'topbar_common':
						return {
							style: Rest.getVal($scope.themeData, 'style', 1),
							layout: Rest.getVal($scope.themeData, 'layout', 'bx'),
							autosearch: Rest.getVal($scope.themeData, 'autosearch', false)
						};
					break;
					case 'topbar1_general':
						return {
							topbar1_general: {

								logo_in_menu    : Rest.getVal($scope.themeData, 'logo.in_menu', 'y'),
								logo_w          : Rest.getVal($scope.themeData, 'logo.w', 190),
								logo_position   : Rest.getVal($scope.themeData, 'logo.position', 'l'),
								
								cart_link       : Rest.getVal($scope.themeData, 'cart_link', true),
								checkout_link   : Rest.getVal($scope.themeData, 'checkout_link', true),
								wishlist        : Rest.getVal($scope.themeData, 'wishlist', true),
								myaccount       : Rest.getVal($scope.themeData, 'myaccount.status', true),
								myaccount_icon  : Rest.getVal($scope.themeData, 'myaccount.icon.icon', 'fa fa-user'),
								cart            : Rest.getVal($scope.themeData, 'cart.status', true),
								cart_icon       : Rest.getVal($scope.themeData, 'cart.icon.icon', 'glyphicon glyphicon-shopping-cart'),
								search          : Rest.getVal($scope.themeData, 'search', true),
								currency        : Rest.getVal($scope.themeData, 'currency', true),
								language        : Rest.getVal($scope.themeData, 'language', true),
								customlinks     : Rest.getVal($scope.themeData, 'customlinks', true),
								customlink_data : Rest.getVal($scope.themeData, 'customlink_data', '')	
							}
						};
					break;
					case 'topbar2_general':
						return {
							topbar2_general: {

								logo_in_menu    : Rest.getVal($scope.themeData, 'logo.in_menu', 'y'),
								logo_w          : Rest.getVal($scope.themeData, 'logo.w', 190),
								logo_position   : Rest.getVal($scope.themeData, 'logo.position', 'l'),
								
								cart_link       : Rest.getVal($scope.themeData, 'cart_link', true),
								checkout_link   : Rest.getVal($scope.themeData, 'checkout_link', true),
								wishlist        : Rest.getVal($scope.themeData, 'wishlist', true),
								myaccount       : Rest.getVal($scope.themeData, 'myaccount.status', true),
								myaccount_icon  : Rest.getVal($scope.themeData, 'myaccount.icon.icon', 'fa fa-user'),
								cart            : Rest.getVal($scope.themeData, 'cart.status', true),
								cart_icon       : Rest.getVal($scope.themeData, 'cart.icon.icon', 'glyphicon glyphicon-shopping-cart'),
								search          : Rest.getVal($scope.themeData, 'search', true),
								currency        : Rest.getVal($scope.themeData, 'currency', true),
								language        : Rest.getVal($scope.themeData, 'language', true),
								customlinks     : Rest.getVal($scope.themeData, 'customlinks', true),
								customlink_data : Rest.getVal($scope.themeData, 'customlink_data', '')	
							}
						};
					break;
					
				}
			}
			
			$scope.save = function(){
				
				// Settings
				$scope.settings = $scope.settingsObj($scope.modId) ? $scope.settingsObj($scope.modId) : {};
				
				// Save settings
				Loader.on('.rgen-container');
				// $group, $section, $key, $value
				Rest.themeEditkey($scope.db.group, $scope.db.prefix+$scope.db.section, $scope.modId, $scope.themeData).then(function(){

					if (_.size($scope.settings) > 0) {
						Rest.settingsSave($scope.db.settings, $scope.db.prefix+$scope.db.section, $scope.settings);
					}
					
					// Save fonts
					Rest.themeSavefonts($scope.db.group, 'fonts', $scope.fonts).then(function(){
						Pop.pop_success(rgen_config.text_success);
						Loader.off('.rgen-container');
					}, function (error){
						Loader.off('.rgen-container');
						Pop.pop_error(error);
					});

				}, function (error){
					Loader.off('.rgen-container');
					Pop.pop_error(error);
				});
			}


	}]);

})();