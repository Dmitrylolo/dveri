(function(){
	'use strict';

	angular.module('rgen').controller('themeOtherPages', [
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
				section  : 'page',
				suffix   : ''
			}
			
			// Default parameters
			$scope.modType    = 'new';
			$scope.modId      = null;
			$scope.themeData  = {};
			$scope.namePrefix = '';
			$scope.imgPath    = rgen_config.DIR_ADMIN_IMG;
			$scope.modList    = [
				{ name:'Contact us'   , val:'contactus' },
				{ name:'Brand A to Z' , val:'brands' },
				{ name:'Site map'     , val:'sitemap' },
				{ name:'Log in'       , val:'login' }
			];

			$scope.tpl = {
				contactus : tpl('theme/page_other/contactus'),
				brands    : tpl('theme/page_other/brands'),
				sitemap   : tpl('theme/page_other/sitemap'),
				login     : tpl('theme/page_other/login')
			}

			// Breadcrumb home link
			$scope.breadcrumb_home = [
				{ label:'Icon', val:'ico' },
				{ label:'Link', val:'lnk' }
			];

			$scope.box_config1 = { fonts: 0, padding:0, margin: 0, shadow: 0 }

			$scope.themeDefault = function () {
				return {
					contactus: {
						status: true,
						info_block: {},
						info_hd: {},
						info_sub_hd: {},
						img_block: {}
					},
					brands: {
						status: true,
						index: {
							block: {},
							hd: {},
							atoz: {}
						},
						list: {
							block: {},
							hd: {},
							body: {},
							item: {},
							a: '#ed5f79',
							a_hover: '#434444'
						}
					},
					sitemap: {
						status: true,
						main: {},
						left: {},
						right: {},
						main_links: {},
						sub_links: {},
						a: '#ed5f79',
						a_hover: '#434444'
					},
					login: {
						status: true,
						new_cust: {
							block: {},
							hd: {},
							btn: {}
						},
						old_cust: {
							block: {},
							hd: {},
							label: {},
							fields: {},
							btn: {}
						}
					}
				}
			}
			
			/*$scope.item_type_tab = 'normal';
			$scope.itemtype = function (type) {
				$scope.item_type_tab = type;
			}*/

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
					
					case 'contactus':
					$scope.themeData = new $scope.themeDefault()['contactus'];
					break;

					case 'brands':
					$scope.themeData = new $scope.themeDefault()['brands'];	
					break;

					case 'sitemap':
					$scope.themeData = new $scope.themeDefault()['sitemap'];	
					break;

					case 'login':
					$scope.themeData = new $scope.themeDefault()['login'];	
					break;
					
				}
			}

			$scope.fontObj = function (id) {
				switch(id) {
					case 'contactus':
						return _.object([
							['contactus_info_hd'     , Rest.objChk($scope.themeData, 'info_hd') ? Rest.findFonts($scope.themeData.info_hd) : null ],
							['contactus_info_sub_hd' , Rest.objChk($scope.themeData, 'info_sub_hd') ? Rest.findFonts($scope.themeData.info_sub_hd) : null ]
						]);
					break;
					
					case 'brands':
						return _.object([
							['brands_index_hd' , Rest.objChk($scope.themeData, 'index.hd') ? Rest.findFonts($scope.themeData.index.hd) : null ],
							['brands_atoz'    , Rest.objChk($scope.themeData, 'index.atoz') ? Rest.findFonts($scope.themeData.index.atoz) : null ],
							['brands_list_hd'    , Rest.objChk($scope.themeData, 'list.hd') ? Rest.findFonts($scope.themeData.list.hd) : null ]
						]);
					break;

					case 'sitemap':
						return _.object([
							['sitemap_main_links' , Rest.objChk($scope.themeData, 'main_links') ? Rest.findFonts($scope.themeData.main_links) : null ]
						]);
					break;

					case 'login':
						return _.object([
							['login_new_hd' , Rest.objChk($scope.themeData, 'new_cust.hd') ? Rest.findFonts($scope.themeData.new_cust.hd) : null ],
							['login_new_btn' , Rest.objChk($scope.themeData, 'new_cust.btn') ? Rest.findFonts($scope.themeData.new_cust.btn) : null ],
							['login_old_hd' , Rest.objChk($scope.themeData, 'old_cust.hd') ? Rest.findFonts($scope.themeData.old_cust.hd) : null ],
							['login_old_field' , Rest.objChk($scope.themeData, 'old_cust.fields') ? Rest.findFonts($scope.themeData.old_cust.fields) : null ],
							['login_old_btn' , Rest.objChk($scope.themeData, 'old_cust.btn') ? Rest.findFonts($scope.themeData.old_cust.btn) : null ]
						]);
					break;
				
				}
			}

			$scope.settingsObj = function (id) {
				switch(id) {
					case 'global':
						return {
							scroll_top_icon: typeof $scope.themeData.scrolltop.icon.icon != "undefined" ? $scope.themeData.scrolltop.icon.icon : 'fa fa-chevron-up'
						};
					break;
					case 'pg_heading':
						return {
							breadcrumb_home: typeof $scope.themeData.breadcrumb.home != "undefined" ? $scope.themeData.breadcrumb.home : 'lnk'
						};
					break;
				}
			}
			
			$scope.save = function(){
				// Fonts
				$scope.fonts = $scope.fontObj($scope.modId) ? $scope.fontObj($scope.modId) : {};
				
				// Settings
				$scope.settings = $scope.settingsObj($scope.modId) ? $scope.settingsObj($scope.modId) : {};
				
				// Save settings
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


	}]);

})();