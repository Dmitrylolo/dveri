(function(){
	'use strict';

	angular.module('rgen').controller('themeOcmenu', [
		'$scope', 
		'Rest', 
		'Pop', 
		'Loader',
		function($scope, Rest, Pop, Loader){

			/* Default config data
			------------------------*/
			// Theme data settings
			$scope.db = {
				prefix   : 'rgen_',
				group    : 'rgen_theme',
				settings : 'rgen_settings',
				modgroup : false,
				section  : 'ocmenu',
				suffix   : ''
			}
			
			// Default parameters
			$scope.modType    = 'new';
			$scope.modId      = null;
			$scope.themeData  = {};
			$scope.namePrefix = '';
			$scope.modList    = [
				{ name:'OC default menu' , val:'ocmenu' }
			];

			// Breadcrumb home link
			$scope.breadcrumb_home = [
				{ label:'Icon', val:'ico' },
				{ label:'Link', val:'lnk' }
			];

			// Layout width
			$scope.layout_width = [
				{ label:'Boxed', val:'bx' },
				{ label:'Full width', val:'fw' }
			];

			$scope.themeDefault = function () {
				return {
					ocmenu: {
						status: true,
						menu_wrp: {},
						container: {},
						mainitem: {},
						subwrp: {},
						subitem: {},

						m_handle: {},
						m_subhandle: {},
						m_nav: {},
						m_subwrp: {},
						m_mainitem: {},
						m_subitem: {},
						m_seeall: {}
						
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
					case 'ocmenu':
					$scope.themeData = new $scope.themeDefault()['ocmenu'];
					break;
				}
			}

			$scope.fontObj = function (id) {
				switch(id) {
					case 'ocmenu':
						return _.object([
							['ocmenu_mainitem' , Rest.objChk($scope.themeData, 'mainitem') ? Rest.findFonts($scope.themeData.mainitem) : null ]
						]);
					break;
				}
			}

			$scope.settingsObj = function (id) {
				switch(id) {
					case 'ocmenu':
						return {
							ocmenu: {
								
							}
						};
					break;
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


	}]);

})();