(function(){
	'use strict';

	angular.module('rgen').controller('themeOcmodBanners', [
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
				{ name:'Banners module' , val:'ocmod_banners' }
			];

			// Banners view
			$scope.banner_view = [
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

			$scope.themeDefault = function () {
				return {
					ocmod_banners: {
						status: true,
						contentarea_view: 'grid',
						grids: {},
						carousel: {
							item_margin: 20,
							item_display: 5
						},

						column_view: 'grid',
						column_grids: {},
						column_carousel: {
							item_margin: 20,
							item_display: 5
						}
					}
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
					case 'ocmod_banners':
					$scope.themeData = new $scope.themeDefault()['ocmod_banners'];
					break;
				}
			}

			$scope.settingsObj = function (id) {
				switch(id) {
					case 'ocmod_banners':
						return {
							ocmd_banners: {
								contentarea_view : Rest.getVal($scope.themeData, 'contentarea_view', 'grid'),
								grids            : Rest.getVal($scope.themeData, 'grids.classGroup', 'eq4 d-eq4 t-eq3 mxl-eq2 msm-eq2 mxs-eq1 gt20 mb20'),
								carousel         : Rest.getVal($scope.themeData, 'carousel', new $scope.themeDefault()['carousel']),

								column_view      : Rest.getVal($scope.themeData, 'column_view', 'grid'),
								column_grids     : Rest.getVal($scope.themeData, 'column_grids.classGroup', 'eq4 d-eq4 t-eq3 mxl-eq2 msm-eq2 mxs-eq1 gt20 mb20'),
								column_carousel  : Rest.getVal($scope.themeData, 'column_carousel', new $scope.themeDefault()['column_carousel'])
							}
						};
					break;
				}
			}
			
			$scope.save = function(){
			
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