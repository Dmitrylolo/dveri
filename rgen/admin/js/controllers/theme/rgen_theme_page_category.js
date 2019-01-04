(function(){
	'use strict';

	angular.module('rgen').controller('themePageCategory', [
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
				section  : 'page',
				suffix   : ''
			}
			
			// Default parameters
			$scope.modType    = 'new';
			$scope.modId      = null;
			$scope.themeData  = {};
			$scope.namePrefix = '';
			$scope.imgPath    = rgen_config.DIR_ADMIN_IMG;
			$scope.helpImg    = function (img) { Pop.help(img); };
			$scope.modList    = [
				{ name:'Category page' , val:'category' }
			];

			// Refine search styles
			$scope.refine_styles = [
				{ label:'1', val: 1 },
				{ label:'2', val: 2 }
			];
			$scope.prdblock_styles = [
				{ label:'1', val: 1 },
				{ label:'2', val: 2 }
			];
			$scope.refineview_styles = [
				{ label:'Grids', val: 'grid' },
				{ label:'Carousel', val: 'carousel' }
			];

			$scope.themeDefault = function () {
				return {
					category: {
						status: true,
						cat_info: {
							status: true,
							block: {}
						},
						refine_search: {
							style: 1,
							view: 'grid',
							refine1: {
								block: {},
								title: {},
								catlink_normal:{},
								catlink_hover:{}
							},
							refine2: {
								block: {},
								title: {},
								catlink_normal:{},
								catlink_hover:{}
							}
						},
						prd_grid: {
							prd_style: 1,
							gridview: {},
							listview: {}
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
					case 'category':
					$scope.themeData = new $scope.themeDefault()['category'];
					break;
				}
			}

			$scope.fontObj = function (id) {
				switch(id) {
					case 'category':
						return _.object([
							['refine_search1_title' , Rest.objChk($scope.themeData, 'refine_search.refine1.title') ? Rest.findFonts($scope.themeData.refine_search.refine1.title) : null]
						]);
					break;
				}
			}

			$scope.settingsObj = function (id) {
				switch(id) {
					case 'category':
						return {
							cat_info      : Rest.getVal($scope.themeData, 'cat_info.status', true),
							refine_search : Rest.getVal($scope.themeData, 'refine_search.style', 1),
							refine_view   : Rest.getVal($scope.themeData, 'refine_search.view', 'grid')
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