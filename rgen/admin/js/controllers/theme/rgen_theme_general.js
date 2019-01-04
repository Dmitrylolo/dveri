(function(){
	'use strict';

	angular.module('rgen').controller('themeGeneral', [
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
				section  : 'general',
				suffix   : ''
			}
			
			// Default parameters
			$scope.modType    = 'new';
			$scope.modId      = null;
			$scope.themeData  = {};
			$scope.namePrefix = '';
			$scope.modList    = [
				{ name:'Theme layout settings' , val:'layout_settings' },
				{ name:'Body'                  , val:'main_body' },
				{ name:'Page container'        , val:'page_container' },
				{ name:'Content area'          , val:'contentarea' }
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
					theme_general: {
						status: true,
						layout_settings: {
							responsive_status: true,
							wide_status: true,
							layout_width: "bx"
						},
						body: {
							block: {},
							image: {}
						},
						page_container: {
							block: {},
							image: {},
							margin_t: '0',
							margin_b: '0'
						},
						contentarea: {
							block: {},
							image: {}
						},
						contentbox: {
							block: {},
							image: {}
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
			$scope.getkey('theme_general');

			// Reseting data
			$scope.reset     = function (id) { Pop.reset($scope, id); }
			$scope.resetData = function (id) {
				switch(id) {
					case 'theme_general':
					$scope.themeData = new $scope.themeDefault()['theme_general'];
					break;
				}
			}

			$scope.fontObj = function (id) {
				switch(id) {
					case 'theme_general':
						return _.object([
							['body' , Rest.findFonts($scope.themeData.body.block)]
						]);
					break;
				}
			}
			
			$scope.save = function(){
				// Fonts
				$scope.fonts = $scope.fontObj($scope.modId) ? $scope.fontObj($scope.modId) : {};

				// Settings
				$scope.settings = {
					responsive_status : $scope.themeData.layout_settings.responsive_status,
					wide_status       : $scope.themeData.layout_settings.wide_status,
					layout_width      : $scope.themeData.layout_settings.layout_width
				};
				
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