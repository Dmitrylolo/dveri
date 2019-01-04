(function(){
	'use strict';

	angular.module('rgen').controller('moduleBasicbannersCustomize', [
		'$scope', 
		'Rest', 
		'Pop', 
		'Loader',
		'Mod',
		function($scope, Rest, Pop, Loader, Mod){

			/* Default config data
			------------------------*/
			// Theme data settings
			$scope.db = {
				prefix   : 'rgen_',
				group    : 'rgen_modtheme',
				modgroup : 'rgen_module',
				section  : 'basicbanners',
				suffix   : '',
				type     : 'manage'
			}
			
			// Default parameters
			$scope.modType    = 'new';
			$scope.modId      = null;
			$scope.themeData  = {};
			$scope.namePrefix = 'Basic banners';
			$scope.modList    = [];

			$scope.tpl = {
				none    : tpl('modules/basicbanners/none'),
				effect1 : tpl('modules/basicbanners/effect1'),
				effect2 : tpl('modules/basicbanners/effect2'),
				effect3 : tpl('modules/basicbanners/effect3'),
				effect4 : tpl('modules/basicbanners/effect4'),
				effect5 : tpl('modules/basicbanners/effect5'),
				effect6 : tpl('modules/basicbanners/effect6')
			}

			$scope.hover_effects = [
				{ name:'None'     , val: 'n' },
				{ name:'Effect 1' , val: '1' },
				{ name:'Effect 2' , val: '2' },
				{ name:'Effect 3' , val: '3' },
				{ name:'Effect 4' , val: '4' },
				{ name:'Effect 5' , val: '5' },
				{ name:'Effect 6' , val: '6' }
			];

			$scope.effect_common = function () {
				return {
					background: "rgba(0,0,0,0.5)",
					overlay: "rgba(0,0,0,0.5)",
					title: {},
					description: {},
					img_opacity: 0.7,
					scale: "1.0"
				}
			}

			$scope.themeDefault = function () {
				return {
					status: true,

					container: {},
					wrapper: {},
					mod_hd: {},
					mod_customhtml: {},
					content_wrp: {},
					items: {},
					effect_block: 'n',

					no_effect: {
						block: {},
						img: {}
					},

					h_effect1: {
						background: "rgba(0,0,0,0.5)",
						overlay: "rgba(0,0,0,0.5)",
						title: {},
						description: {},
						img_opacity: 1,
						normal:{
							common: new $scope.effect_common()
						},
						hover:{
							common: new $scope.effect_common()
						}
					},

					h_effect2: {
						background: "rgba(0,0,0,0.5)",
						overlay: "rgba(0,0,0,0.5)",
						title: {},
						description: {},
						img_opacity: 1,
						normal:{
							common: new $scope.effect_common()
						},
						hover:{
							common: new $scope.effect_common()
						}
					},

					h_effect3: {
						background: "rgba(0,0,0,0.5)",
						overlay: "rgba(0,0,0,0.5)",
						title: {},
						description: {},
						bdrcolor: "#ffffff",
						img_opacity: 1,
						normal:{
							common: new $scope.effect_common()
						},
						hover:{
							common: new $scope.effect_common(),
							bdrcolor: "#ffffff"
						}
					},

					h_effect4: {
						background: "rgba(0,0,0,0.5)",
						overlay: "rgba(0,0,0,0.5)",
						title: {},
						description: {},
						img_opacity: 1,
						normal:{
							common: new $scope.effect_common()
						},
						hover:{
							common: new $scope.effect_common()
						}
					},

					h_effect5: {
						background: "rgba(0,0,0,0.5)",
						overlay: "rgba(0,0,0,0.5)",
						title: {},
						description: {},
						bdrcolor: "#ffffff",
						img_opacity: 1,
						normal:{
							common: new $scope.effect_common(),
							bdrcolor: "#ffffff"
						},
						hover:{
							common: new $scope.effect_common(),
							bdrcolor: "#ffffff"
						}
					},

					h_effect6: {
						background: "rgba(0,0,0,0.5)",
						overlay: "rgba(0,0,0,0.5)",
						title: {},
						description: {},
						bdrcolor: "#ffffff",
						img_opacity: 1,
						normal:{
							common: new $scope.effect_common()
						},
						hover:{
							common: new $scope.effect_common(),
							bdrcolor: "#ffffff"
						}
					}

				}
			}

			// Scale
			$scope.scale_range = [];
			var scalerange = _.range(0.1, 4.1, 0.1);
			_.map(scalerange, function(s){
				$scope.scale_range.push({ val:s.toFixed(1), name: s.toFixed(1) });
			});

			// Opacity
			$scope.opacity_range = [
				{val:0, name: 0},
				{val:0.1, name: 0.1},
				{val:0.2, name: 0.2},
				{val:0.3, name: 0.3},
				{val:0.4, name: 0.4},
				{val:0.5, name: 0.5},
				{val:0.6, name: 0.6},
				{val:0.7, name: 0.7},
				{val:0.8, name: 0.8},
				{val:0.9, name: 0.9},
				{val:1, name: 1}
			];
			/*var opacityrange = _.range(0.0, 0.1, 1);
			_.map(opacityrange, function(s){
				$scope.opacity_range.push({ val:s, name: s });
			});*/

			$scope.item_type_tab = 'normal';
			$scope.itemtype = function (type) {
				$scope.item_type_tab = type;	
			}

			$scope.getkey = function (id) {
				$scope.modId = null;
				$scope.modId = id;
				$scope.themeData = new $scope.themeDefault();
				
				// Marge data from response
				Loader.on('.rgen-container');
				Rest.modthemeGetkey(
					$scope.db.group, 
					$scope.db.prefix+$scope.db.section+'.'+$scope.modId
					).then(function(response){
						$scope.themeData = $.extend(true, $scope.themeData, response.data);
						$scope.importData();
						Loader.off('.rgen-container');
				}, function (error){
					Pop.pop_error(error);
				});
				//=========================
			}

			// Import settings
			$scope.importData = function () {
				// Marge data from old theme
				Loader.on('.rgen-container');
				Rest.themeGetkey('rgen_theme', $scope.modId).then(function(response){
					$scope.themeData = $.extend(true, $scope.themeData, response.data);
					Loader.off('.rgen-container');
				}, function (error){
					Pop.pop_error(error);
				});
				//=========================
			}

			// Reseting data
			$scope.reset     = function (id) { Pop.reset($scope, id); }
			$scope.resetData = function (id) {
				switch(id) {
					case 'fullreset':
					$scope.themeData = new $scope.themeDefault();
					break;
				}
			}
			
			/* Default processes
			------------------------*/
			// Get module list
			
			Loader.on('.rgen-container');
			Rest.modGetsection($scope.db.modgroup, $scope.db.prefix+$scope.db.section).then(function(response){
				_.map(response.data, function(value, key, list){
					$scope.modList.push({ val: key, name: value.name });
				});
				if (_.size($scope.modList) > 0) {
					$scope.module = true;
					$scope.getkey($scope.modList[0].val);
				} else {
					$scope.module = false;
				};
				Loader.off('.rgen-container');
			}, function (error) {
				Pop.pop_error(error);
			});
			


			$scope.fontObj = function () {
				var fontPrefix = $scope.db.prefix+$scope.db.section+'.'+$scope.modId;
				return _.object([
					[fontPrefix+'.mod_hd'   , Rest.objChk($scope.themeData, 'mod_hd') ? Rest.findFonts($scope.themeData.mod_hd) : null ],
					[fontPrefix+'.h_effect1_hd'   , Rest.objChk($scope.themeData, 'h_effect1.title') ? Rest.findFonts($scope.themeData.h_effect1.title) : null ],
					[fontPrefix+'.h_effect1_text'   , Rest.objChk($scope.themeData, 'h_effect1.description') ? Rest.findFonts($scope.themeData.h_effect1.description) : null ],

					[fontPrefix+'.h_effect2_hd'   , Rest.objChk($scope.themeData, 'h_effect2.title') ? Rest.findFonts($scope.themeData.h_effect2.title) : null ],
					[fontPrefix+'.h_effect2_text'   , Rest.objChk($scope.themeData, 'h_effect2.description') ? Rest.findFonts($scope.themeData.h_effect2.description) : null ],

					[fontPrefix+'.h_effect3_hd'   , Rest.objChk($scope.themeData, 'h_effect3.title') ? Rest.findFonts($scope.themeData.h_effect3.title) : null ],
					[fontPrefix+'.h_effect3_text'   , Rest.objChk($scope.themeData, 'h_effect3.description') ? Rest.findFonts($scope.themeData.h_effect3.description) : null ],

					[fontPrefix+'.h_effect4_hd'   , Rest.objChk($scope.themeData, 'h_effect4.title') ? Rest.findFonts($scope.themeData.h_effect4.title) : null ],
					[fontPrefix+'.h_effect4_text'   , Rest.objChk($scope.themeData, 'h_effect4.description') ? Rest.findFonts($scope.themeData.h_effect4.description) : null ],

					[fontPrefix+'.h_effect5_hd'   , Rest.objChk($scope.themeData, 'h_effect5.title') ? Rest.findFonts($scope.themeData.h_effect5.title) : null ],
					[fontPrefix+'.h_effect5_text'   , Rest.objChk($scope.themeData, 'h_effect5.description') ? Rest.findFonts($scope.themeData.h_effect5.description) : null ],

					[fontPrefix+'.h_effect6_hd'   , Rest.objChk($scope.themeData, 'h_effect6.title') ? Rest.findFonts($scope.themeData.h_effect6.title) : null ],
					[fontPrefix+'.h_effect6_text'   , Rest.objChk($scope.themeData, 'h_effect6.description') ? Rest.findFonts($scope.themeData.h_effect6.description) : null ],

					[fontPrefix+'.h_effect1_hd_normal'   , Rest.objChk($scope.themeData, 'h_effect1.normal.common.title') ? Rest.findFonts($scope.themeData.h_effect1.normal.common.title) : null ],
					[fontPrefix+'.h_effect1_text_normal'   , Rest.objChk($scope.themeData, 'h_effect1.normal.common.description') ? Rest.findFonts($scope.themeData.h_effect1.normal.common.description) : null ],

					[fontPrefix+'.h_effect2_hd_normal'   , Rest.objChk($scope.themeData, 'h_effect2.normal.common.title') ? Rest.findFonts($scope.themeData.h_effect2.normal.common.title) : null ],
					[fontPrefix+'.h_effect2_text_normal'   , Rest.objChk($scope.themeData, 'h_effect2.normal.common.description') ? Rest.findFonts($scope.themeData.h_effect2.normal.common.description) : null ],

					[fontPrefix+'.h_effect3_hd_normal'   , Rest.objChk($scope.themeData, 'h_effect3.normal.common.title') ? Rest.findFonts($scope.themeData.h_effect3.normal.common.title) : null ],
					[fontPrefix+'.h_effect3_text_normal'   , Rest.objChk($scope.themeData, 'h_effect3.normal.common.description') ? Rest.findFonts($scope.themeData.h_effect3.normal.common.description) : null ],

					[fontPrefix+'.h_effect4_hd_normal'   , Rest.objChk($scope.themeData, 'h_effect4.normal.common.title') ? Rest.findFonts($scope.themeData.h_effect4.normal.common.title) : null ],
					[fontPrefix+'.h_effect4_text_normal'   , Rest.objChk($scope.themeData, 'h_effect4.normal.common.description') ? Rest.findFonts($scope.themeData.h_effect4.normal.common.description) : null ],

					[fontPrefix+'.h_effect5_hd_normal'   , Rest.objChk($scope.themeData, 'h_effect5.normal.common.title') ? Rest.findFonts($scope.themeData.h_effect5.normal.common.title) : null ],
					[fontPrefix+'.h_effect5_text_normal'   , Rest.objChk($scope.themeData, 'h_effect5.normal.common.description') ? Rest.findFonts($scope.themeData.h_effect5.normal.common.description) : null ],

					[fontPrefix+'.h_effect6_hd_normal'   , Rest.objChk($scope.themeData, 'h_effect6.normal.common.title') ? Rest.findFonts($scope.themeData.h_effect6.normal.common.title) : null ],
					[fontPrefix+'.h_effect6_text_normal'   , Rest.objChk($scope.themeData, 'h_effect6.normal.common.description') ? Rest.findFonts($scope.themeData.h_effect6.normal.common.description) : null ],

				]);
			}


			// Save settings
			$scope.save = function(){
				// Fonts
				$scope.fonts = $scope.fontObj($scope.modId) ? $scope.fontObj($scope.modId) : {};

				// Save settings
				Loader.on('.rgen-container');
				// $group, $section, $key, $value
				Rest.modthemeEditkey(
					$scope.db.group, 
					$scope.db.prefix+$scope.db.section, 
					$scope.db.prefix+$scope.db.section+'.'+$scope.modId,  
					$scope.themeData
					).then(function(){
					
					if (_.size($scope.fonts) > 0) {
						// Save fonts
						Rest.modthemeSavefonts($scope.db.group, 'fonts', $scope.fonts).then(function(){
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