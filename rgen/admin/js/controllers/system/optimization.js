(function(){
	'use strict';

	angular.module('rgen').controller('systemOptimization', [
		'$scope', 
		'Rest', 
		'Pop', 
		'Loader',
		function($scope, Rest, Pop, Loader){
			$scope.permission = rgen_config.permission;
			if (!$scope.permission) {
				Loader.on('.rgen-container', '#ffffff', '16px', 'You do not have permission to access this screen.');	
			};

			/* Default config data
			------------------------*/
			// System data settings
			$scope.db = {
				prefix   : 'rgen_',
				group    : 'rgen_system',
				settings : 'rgen_settings',
				modgroup : false,
				section  : 'optimization',
				suffix   : ''
			}
			
			// Default parameters
			$scope.modType    = 'new';
			$scope.modId      = null;
			$scope.systemData = {};
			$scope.namePrefix = '';

			$scope.sysDefault = function () {
				return {
					system_optimization: {
						cssminify: false,
						jsminify: false,

						// All module list
						menu: false,
						basicslideshow: false,
						basicbanners: false,
						bannergrids: false,
						imagegallery: false,
						productgroups: false,
						customhtml: false,
						contentblocks: false,
						revslider: false,
						gridmanager: false,
						stickyhtml: false,
						catshowcase: false,
						deals: false
					}
				}
			}

			$scope.modlist = [
				{ name: 'Mega menu'           , code: 'menu' },
				{ name: 'Basic slideshow'     , code: 'basicslideshow' },
				{ name: 'Basic banners'       , code: 'basicbanners' },
				{ name: 'Banner grids'        , code: 'bannergrids' },
				{ name: 'Image gallery'       , code: 'imagegallery' },
				{ name: 'Product groups'      , code: 'productgroups' },
				{ name: 'Custom HTML'         , code: 'customhtml' },
				{ name: 'Content blocks'      , code: 'contentblocks' },
				{ name: 'Revo slider'         , code: 'revslider' },
				{ name: 'Grid manager'        , code: 'gridmanager' },
				{ name: 'Sticky HTML'         , code: 'stickyhtml' },
				{ name: 'Category showcase'   , code: 'catshowcase' },
				{ name: 'Deals / Product showcase' , code: 'deals' }
			];

			$scope.yn = [
				{ label:'Yes', val: 'y' },
				{ label:'No', val: 'n' }
			];

			$scope.getkey = function (id) {
				$scope.modId = null;
				$scope.modId = id;
				$scope.systemData = new $scope.sysDefault();
				
				// Marge data from response
				Loader.on('.rgen-container');
				Rest.settingsGetkey($scope.db.settings, $scope.modId).then(function(response){
					
					$scope.systemData.system_optimization = $.extend(true, $scope.systemData.system_optimization, response.data);
					
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
			$scope.getkey('system_optimization');

			$scope.clear = function(type, key){
				Loader.on('.rgen-container');
				Rest.clear(type, key).then(function(response){
					console.log(response);
					setTimeout(function(){
						//Pop.pop_success('');
						Loader.off('.rgen-container');	
					}, 200);
				}, function (error){
					Pop.pop_error(error);
				});
			}

			$scope.save = function(){
				console.log($scope.systemData);
				// Save data
				Loader.on('.rgen-container');
				
				// $group, $section, $key, $value
				Rest.settingsSave($scope.db.settings, $scope.db.prefix+$scope.db.section, $scope.systemData).then(function(){
					Pop.pop_success(rgen_config.text_success);
					Loader.off('.rgen-container');
				}, function (error){
					Loader.off('.rgen-container');
					Pop.pop_error(error);
				});
			}


	}]);

})();