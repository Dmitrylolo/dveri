(function(){
	'use strict';

	angular.module('rgen').controller('themeOcmodBest', [
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
				{ name:'Bestseller module' , val:'ocmod_best' }
			];

			// Product box style
			$scope.prdblock_styles = [
				{ label:'1', val: 1 },
				{ label:'2', val: 2 }
			];

			// Product view
			$scope.prdblock_view = [
				{ label:'Carousel', val: 'carousel' },
				{ label:'Grids', val: 'grid' }
			];
			
			// Carousel settings
			var itemrange = _.range(1, 7);
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
					ocmod_best: {
						status: true,
						prd_view: 'carousel',
						grids: {},
						carousel: {
							item_margin: 20,
							item_display: 5
						},
						prd_style: 1,
						col_prd_style: 1,
						
						prd1_css: {},
						prd2_css: {},

						smallprd1_css: {},
						smallprd2_css: {},

						wrapper: {},
						mod_hd: {},
						prd_wrp: {}
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
					case 'ocmod_best':
					$scope.themeData = new $scope.themeDefault()['ocmod_best'];
					break;
				}
			}

			$scope.fontObj = function (id) {
				switch(id) {
					case 'ocmod_best':
						return _.object([
							['ocmd_best_title'          , Rest.findFonts($scope.themeData.mod_hd)],

							['ocmd_best_p1_name'        , Rest.objChk($scope.themeData, 'prd1_css.prd.info_name') ? Rest.findFonts($scope.themeData.prd1_css.prd.info_name) : null ],
							['ocmd_best_p1_description' , Rest.objChk($scope.themeData, 'prd1_css.prd.info_description') ? Rest.findFonts($scope.themeData.prd1_css.prd.info_description) : null ],
							['ocmd_best_p1_price_spl'   , Rest.objChk($scope.themeData, 'prd1_css.prd.price_spl') ? Rest.findFonts($scope.themeData.prd1_css.prd.price_spl) : null ],
							['ocmd_best_p1_price_new'   , Rest.objChk($scope.themeData, 'prd1_css.prd.price_new') ? Rest.findFonts($scope.themeData.prd1_css.prd.price_new) : null ],
							['ocmd_best_p1_cartbtn'     , Rest.objChk($scope.themeData, 'prd1_css.prd.cart.btn') ? Rest.findFonts($scope.themeData.prd1_css.prd.cart.btn) : null ],

							['ocmd_best_p2_name'        , Rest.objChk($scope.themeData, 'prd2_css.prd.info_name') ? Rest.findFonts($scope.themeData.prd2_css.prd.info_name) : null ],
							['ocmd_best_p2_description' , Rest.objChk($scope.themeData, 'prd2_css.prd.info_description') ? Rest.findFonts($scope.themeData.prd2_css.prd.info_description) : null ],
							['ocmd_best_p2_price_spl'   , Rest.objChk($scope.themeData, 'prd2_css.prd.price_spl') ? Rest.findFonts($scope.themeData.prd2_css.prd.price_spl) : null ],
							['ocmd_best_p2_price_new'   , Rest.objChk($scope.themeData, 'prd2_css.prd.price_new') ? Rest.findFonts($scope.themeData.prd2_css.prd.price_new) : null ],
							['ocmd_best_p2_cartbtn'     , Rest.objChk($scope.themeData, 'prd2_css.prd.cart.btn') ? Rest.findFonts($scope.themeData.prd2_css.prd.cart.btn) : null ],

							['ocmd_best_sp1_name'       , Rest.objChk($scope.themeData, 'smallprd1_css.prd.prdname') ? Rest.findFonts($scope.themeData.smallprd1_css.prd.prdname) : null ],
							['ocmd_best_sp2_name'       , Rest.objChk($scope.themeData, 'smallprd2_css.prd.prdname') ? Rest.findFonts($scope.themeData.smallprd2_css.prd.prdname) : null ]
						]);
					break;
				}
			}

			$scope.settingsObj = function (id) {
				switch(id) {
					case 'ocmod_best':
						return {
							ocmd_best: {
								prd_view      : Rest.getVal($scope.themeData, 'prd_view', 'carousel'),
								prd_style     : Rest.getVal($scope.themeData, 'prd_style', 1),
								col_prd_style : Rest.getVal($scope.themeData, 'col_prd_style', 1),
								grids         : Rest.getVal($scope.themeData, 'grids.classGroup', 'eq4 d-eq4 t-eq3 mxl-eq2 msm-eq2 mxs-eq1 gt20 mb20'),
								carousel      : Rest.getVal($scope.themeData, 'carousel', new $scope.themeDefault()['carousel'])
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