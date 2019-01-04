(function(){
	'use strict';

	angular.module('rgen').controller('themeOcmodCatAccount', [
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
				section  : 'ocmodule',
				suffix   : ''
			}
			
			// Default parameters
			$scope.modType    = 'new';
			$scope.modId      = null;
			$scope.themeData  = {};
			$scope.namePrefix = '';
			$scope.imgPath    = rgen_config.DIR_ADMIN_IMG;
			$scope.modList    = [
				{ name:'Category and My account' , val:'ocmod_cataccount' }
			];

			$scope.themeDefault = function () {
				return {
					ocmod_cataccount: {
						status: true,
						hd: {},
						list_wrp: {},
						list_item: {},
						sublink_wrp: {},
						sublink_item: '',
						sublink_item_hover: '',
						sublink_bullet: ''
					}
				}
			}

			/*Rest.modGetsection('slideshow', 'oc_mods').then(function(response){
				console.log(response);
			}, function (error){
				Pop.pop_error(error);
			});*/

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
					case 'ocmod_cataccount':
					$scope.themeData = new $scope.themeDefault()['ocmod_cataccount'];
					break;
				}
			}

			$scope.fontObj = function (id) {
				switch(id) {
					case 'ocmod_cataccount':
						return _.object([
							['ocmd_cataccount_hd'   , Rest.objChk($scope.themeData, 'hd') ? Rest.findFonts($scope.themeData.hd) : null ],
							['ocmd_cataccount_item' , Rest.objChk($scope.themeData, 'list_item') ? Rest.findFonts($scope.themeData.list_item) : null ]
						]);
					break;
				}
			}

			
			$scope.save = function(){
				// Fonts
				$scope.fonts = $scope.fontObj($scope.modId) ? $scope.fontObj($scope.modId) : {};

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