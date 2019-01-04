(function(){
	'use strict';

	angular.module('rgen').controller('moduleBannergridsCustomize', [
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
				section  : 'bannergrids',
				suffix   : '',
				type     : 'manage'
			}
			
			// Default parameters
			$scope.modType    = 'new';
			$scope.modId      = null;
			$scope.themeData  = {};
			$scope.namePrefix = 'Content blocks';
			$scope.modList    = [];

			$scope.tpl = {
				none    : tpl('modules/bannergrids/none'),
				effect1 : tpl('modules/bannergrids/effect1'),
				effect2 : tpl('modules/bannergrids/effect2'),
				effect3 : tpl('modules/bannergrids/effect3'),
				effect4 : tpl('modules/bannergrids/effect4'),
				effect5 : tpl('modules/bannergrids/effect5'),
				effect6 : tpl('modules/bannergrids/effect6')
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

			// Scale
			$scope.scale_range = [];
			var scalerange = _.range(0.1, 4.1, 0.1);
			_.map(scalerange, function(s){
				$scope.scale_range.push({ val:s.toFixed(1), name: s.toFixed(1) });
			});
			/*$scope.scale_range = [
				{val:0.5, name: 0.5},
				{val:0.6, name: 0.6},
				{val:0.2, name: 0.2},
				{val:0.3, name: 0.3},
				{val:0.4, name: 0.4},
				{val:0.5, name: 0.5},
				{val:0.6, name: 0.6},
				{val:0.7, name: 0.7},
				{val:0.8, name: 0.8},
				{val:0.9, name: 0.9},
				{val:1, name: 1}
			];*/

			/* Default tabs
			------------------------*/
			$scope.manage_tabs = [
				{ label:'Desktop' , val:'d' },
				{ label:'Tablet'  , val:'t' },
				{ label:'Mobile'  , val:'m' }
			];
			$scope.manage_tab = 'd';
			$scope.tabtype = function (type) {
				Loader.on('.rgen-container');
				$scope.manage_tab = type;
				setTimeout(function(){ Loader.off('.rgen-container'); }, 200);
			}
			/*----------------------*/
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
			$scope.themeCommon = function () {
				return {
					status: true,

					main: {},
					main_bg: {},
					mod_wrp: {},
					mod_content: {},
					mod_hd: {},
					mod_sub_hd: {},

					rw: {},
					l_cl: {},
					m_cl: {},
					r_cl: {},

					t_html: {},
					b_html: {},
					l_html: {},
					r_html: {},

					outer_rw: {
						rw: {},
						first_rw: {},
						last_rw: {},
						cl: {},
						first_cl: {},
						last_cl: {}
					},
					
					no_effect: {
						block: {},
						img: {}
					},

					h_effect1: {
						normal:{
							common: new $scope.effect_common()
						},
						hover:{
							common: new $scope.effect_common()
						}
					},

					h_effect2: {
						normal:{
							common: new $scope.effect_common()
						},
						hover:{
							common: new $scope.effect_common()
						}
					},

					h_effect3: {
						normal:{
							common: new $scope.effect_common()
						},
						hover:{
							common: new $scope.effect_common(),
							bdrcolor: "#ffffff"
						}
					},

					h_effect4: {
						normal:{
							common: new $scope.effect_common()
						},
						hover:{
							common: new $scope.effect_common()
						}
					},

					h_effect5: {
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
						normal:{
							common: new $scope.effect_common(),
						},
						hover:{
							common: new $scope.effect_common(),
							bdrcolor: "#ffffff"
						}
					}
				}
			}			

			$scope.themeDefault = function () {
				return {
					status: true,
					effect_block: '1',
					d: new $scope.themeCommon(),
					t: new $scope.themeCommon(),
					m: new $scope.themeCommon()
				}
			}

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

			// Copy settings from large screen
			$scope.copySettings = function (node, type) {
				Loader.on('.rgen-container');
				if (type == 'copy') { 
					$scope.themeData[node] = angular.copy($scope.themeData.d);
				};
				if (type == 'reset') { 
					$scope.themeData[node] = new $scope.themeDefault()[node];
				};
				
				setTimeout(function(){ Loader.off('.rgen-container'); }, 200);
			}

			// Status
			$scope.statusVal = false;
			$scope.checkStatus = function(type){
				$scope.statusVal = $scope.themeData[type].status;
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
					[fontPrefix+'.d.mod_hd'   , Rest.objChk($scope.themeData, 'd.mod_hd') ? Rest.findFonts($scope.themeData.d.mod_hd) : null ],
					[fontPrefix+'.t.mod_hd'   , Rest.objChk($scope.themeData, 't.mod_hd') ? Rest.findFonts($scope.themeData.t.mod_hd) : null ],
					[fontPrefix+'.m.mod_hd'   , Rest.objChk($scope.themeData, 'm.mod_hd') ? Rest.findFonts($scope.themeData.m.mod_hd) : null ],

					[fontPrefix+'.d.t_html'   , Rest.objChk($scope.themeData, 'd.t_html') ? Rest.findFonts($scope.themeData.d.t_html) : null ],
					[fontPrefix+'.t.t_html'   , Rest.objChk($scope.themeData, 't.t_html') ? Rest.findFonts($scope.themeData.t.t_html) : null ],
					[fontPrefix+'.m.t_html'   , Rest.objChk($scope.themeData, 'm.t_html') ? Rest.findFonts($scope.themeData.m.t_html) : null ],

					[fontPrefix+'.d.b_html'   , Rest.objChk($scope.themeData, 'd.b_html') ? Rest.findFonts($scope.themeData.d.b_html) : null ],
					[fontPrefix+'.t.b_html'   , Rest.objChk($scope.themeData, 't.b_html') ? Rest.findFonts($scope.themeData.t.b_html) : null ],
					[fontPrefix+'.m.b_html'   , Rest.objChk($scope.themeData, 'm.b_html') ? Rest.findFonts($scope.themeData.m.b_html) : null ],

					[fontPrefix+'.d.l_html'   , Rest.objChk($scope.themeData, 'd.l_html') ? Rest.findFonts($scope.themeData.d.l_html) : null ],
					[fontPrefix+'.t.l_html'   , Rest.objChk($scope.themeData, 't.l_html') ? Rest.findFonts($scope.themeData.t.l_html) : null ],
					[fontPrefix+'.m.l_html'   , Rest.objChk($scope.themeData, 'm.l_html') ? Rest.findFonts($scope.themeData.m.l_html) : null ],

					[fontPrefix+'.d.r_html'   , Rest.objChk($scope.themeData, 'd.r_html') ? Rest.findFonts($scope.themeData.d.r_html) : null ],
					[fontPrefix+'.t.r_html'   , Rest.objChk($scope.themeData, 't.r_html') ? Rest.findFonts($scope.themeData.t.r_html) : null ],
					[fontPrefix+'.m.r_html'   , Rest.objChk($scope.themeData, 'm.r_html') ? Rest.findFonts($scope.themeData.m.r_html) : null ],


					// Hover effect 1
					[fontPrefix+'.d.h_effect1.title'   , Rest.objChk($scope.themeData, 'd.h_effect1.normal.common.title') ? Rest.findFonts($scope.themeData.d.h_effect1.normal.common.title) : null ],
					[fontPrefix+'.d.h_effect1.description'   , Rest.objChk($scope.themeData, 'd.h_effect1.normal.common.description') ? Rest.findFonts($scope.themeData.d.h_effect1.normal.common.description) : null ],

					// Hover effect 2
					[fontPrefix+'.d.h_effect2.title'   , Rest.objChk($scope.themeData, 'd.h_effect2.normal.common.title') ? Rest.findFonts($scope.themeData.d.h_effect2.normal.common.title) : null ],
					[fontPrefix+'.d.h_effect2.description'   , Rest.objChk($scope.themeData, 'd.h_effect2.normal.common.description') ? Rest.findFonts($scope.themeData.d.h_effect2.normal.common.description) : null ],

					// Hover effect 3
					[fontPrefix+'.d.h_effect3.title'   , Rest.objChk($scope.themeData, 'd.h_effect3.normal.common.title') ? Rest.findFonts($scope.themeData.d.h_effect3.normal.common.title) : null ],
					[fontPrefix+'.d.h_effect3.description'   , Rest.objChk($scope.themeData, 'd.h_effect3.normal.common.description') ? Rest.findFonts($scope.themeData.d.h_effect3.normal.common.description) : null ],

					// Hover effect 4
					[fontPrefix+'.d.h_effect4.title'   , Rest.objChk($scope.themeData, 'd.h_effect4.normal.common.title') ? Rest.findFonts($scope.themeData.d.h_effect4.normal.common.title) : null ],
					[fontPrefix+'.d.h_effect4.description'   , Rest.objChk($scope.themeData, 'd.h_effect4.normal.common.description') ? Rest.findFonts($scope.themeData.d.h_effect4.normal.common.description) : null ],

					// Hover effect 5
					[fontPrefix+'.d.h_effect5.title'   , Rest.objChk($scope.themeData, 'd.h_effect5.normal.common.title') ? Rest.findFonts($scope.themeData.d.h_effect5.normal.common.title) : null ],
					[fontPrefix+'.d.h_effect5.description'   , Rest.objChk($scope.themeData, 'd.h_effect5.normal.common.description') ? Rest.findFonts($scope.themeData.d.h_effect5.normal.common.description) : null ],

					// Hover effect 6
					[fontPrefix+'.d.h_effect6.title'   , Rest.objChk($scope.themeData, 'd.h_effect6.normal.common.title') ? Rest.findFonts($scope.themeData.d.h_effect6.normal.common.title) : null ],
					[fontPrefix+'.d.h_effect6.description'   , Rest.objChk($scope.themeData, 'd.h_effect6.normal.common.description') ? Rest.findFonts($scope.themeData.d.h_effect6.normal.common.description) : null ]
					
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