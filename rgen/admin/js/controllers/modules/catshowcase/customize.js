(function(){
	'use strict';

	angular.module('rgen').controller('moduleCatshowcaseCustomize', [
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
				section  : 'catshowcase',
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
				box1 : tpl('modules/catshowcase/box1'),
				box2 : tpl('modules/catshowcase/box2'),
				box3 : tpl('modules/catshowcase/box3'),
				box4 : tpl('modules/catshowcase/box4')
			}

			$scope.ct_boxes = [
				{ name:'Block 1' , val: '1' },
				{ name:'Block 2' , val: '2' },
				{ name:'Block 3' , val: '3' },
				{ name:'Block 4' , val: '4' }
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

			$scope.ctBlock = function () {
				return {
					main: {
						normal: {},
						hover: {}
					},
					main_ct: {
						normal: {},
						hover: {}
					},
					img: {
						normal: {},
						hover: {}
					},
					img_overlay: {},
					info: {
						normal: {},
						hover: {}
					},
					name: {
						normal: {},
						hover: {}
					},
					text: {
						normal: {},
						hover: {}
					},
					sub_ct: {},
					sub_ct_items: {},
					btn_wrp: {
						normal: {},
						hover: {}
					},
					btn: {},
					link: {}
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

					ct_box1: {
						common: new $scope.effect_common()
					},
					ct_box2: {
						common: new $scope.effect_common()
					},
					ct_box4: {
						common: new $scope.effect_common()
					},
					ct_box3: {
						info: {},
						name: {},
						text: {},
						sub_ct: {},
						sub_ct_items: {},
						btn_wrp: {},
						btn: {},
						link: {}
					}
				}
			}			

			$scope.themeDefault = function () {
				return {
					status: true,
					block: '1',
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
					[fontPrefix+'.d.t_html'   , Rest.objChk($scope.themeData, 'd.t_html') ? Rest.findFonts($scope.themeData.d.t_html) : null ],
					[fontPrefix+'.d.b_html'   , Rest.objChk($scope.themeData, 'd.b_html') ? Rest.findFonts($scope.themeData.d.b_html) : null ],
					[fontPrefix+'.d.l_html'   , Rest.objChk($scope.themeData, 'd.l_html') ? Rest.findFonts($scope.themeData.d.l_html) : null ],
					[fontPrefix+'.d.r_html'   , Rest.objChk($scope.themeData, 'd.r_html') ? Rest.findFonts($scope.themeData.d.r_html) : null ],
					
					// Box 1
					[fontPrefix+'.d.ct_box1.title'        , Rest.objChk($scope.themeData, 'd.ct_box1.common.name.normal') ? Rest.findFonts($scope.themeData.d.ct_box1.common.name.normal) : null ],
					[fontPrefix+'.d.ct_box1.text'         , Rest.objChk($scope.themeData, 'd.ct_box1.common.text.normal') ? Rest.findFonts($scope.themeData.d.ct_box1.common.text.normal) : null ],
					[fontPrefix+'.d.ct_box1.sub_ct_items' , Rest.objChk($scope.themeData, 'd.ct_box1.common.sub_ct_items.normal') ? Rest.findFonts($scope.themeData.d.ct_box1.common.sub_ct_items.normal) : null ],
					[fontPrefix+'.d.ct_box1.btn'          , Rest.objChk($scope.themeData, 'd.ct_box1.common.btn') ? Rest.findFonts($scope.themeData.d.ct_box1.common.btn) : null ],
					[fontPrefix+'.d.ct_box1.link'         , Rest.objChk($scope.themeData, 'd.ct_box1.common.link') ? Rest.findFonts($scope.themeData.d.ct_box1.common.link) : null ],

					// Box 2
					[fontPrefix+'.d.ct_box2.title'        , Rest.objChk($scope.themeData, 'd.ct_box2.common.name.normal') ? Rest.findFonts($scope.themeData.d.ct_box2.common.name.normal) : null ],
					[fontPrefix+'.d.ct_box2.text'         , Rest.objChk($scope.themeData, 'd.ct_box2.common.text.normal') ? Rest.findFonts($scope.themeData.d.ct_box2.common.text.normal) : null ],
					[fontPrefix+'.d.ct_box2.sub_ct_items' , Rest.objChk($scope.themeData, 'd.ct_box2.common.sub_ct_items.normal') ? Rest.findFonts($scope.themeData.d.ct_box2.common.sub_ct_items.normal) : null ],
					[fontPrefix+'.d.ct_box2.btn'          , Rest.objChk($scope.themeData, 'd.ct_box2.common.btn') ? Rest.findFonts($scope.themeData.d.ct_box2.common.btn) : null ],
					[fontPrefix+'.d.ct_box2.link'         , Rest.objChk($scope.themeData, 'd.ct_box2.common.link') ? Rest.findFonts($scope.themeData.d.ct_box2.common.link) : null ],

					// Box 3
					[fontPrefix+'.d.ct_box3.title'        , Rest.objChk($scope.themeData, 'd.ct_box3.name') ? Rest.findFonts($scope.themeData.d.ct_box3.name) : null ],
					[fontPrefix+'.d.ct_box3.text'         , Rest.objChk($scope.themeData, 'd.ct_box3.text') ? Rest.findFonts($scope.themeData.d.ct_box3.text) : null ],
					[fontPrefix+'.d.ct_box3.sub_ct_items' , Rest.objChk($scope.themeData, 'd.ct_box3.sub_ct_items') ? Rest.findFonts($scope.themeData.d.ct_box3.sub_ct_items) : null ],
					[fontPrefix+'.d.ct_box3.btn'          , Rest.objChk($scope.themeData, 'd.ct_box3.btn') ? Rest.findFonts($scope.themeData.d.ct_box3.btn) : null ],
					[fontPrefix+'.d.ct_box3.link'         , Rest.objChk($scope.themeData, 'd.ct_box3.link') ? Rest.findFonts($scope.themeData.d.ct_box3.link) : null ],

					// Box 4
					[fontPrefix+'.d.ct_box4.title'        , Rest.objChk($scope.themeData, 'd.ct_box4.common.name.normal') ? Rest.findFonts($scope.themeData.d.ct_box4.common.name.normal) : null ],
					[fontPrefix+'.d.ct_box4.text'         , Rest.objChk($scope.themeData, 'd.ct_box4.common.text.normal') ? Rest.findFonts($scope.themeData.d.ct_box4.common.text.normal) : null ],
					[fontPrefix+'.d.ct_box4.sub_ct_items' , Rest.objChk($scope.themeData, 'd.ct_box4.common.sub_ct_items.normal') ? Rest.findFonts($scope.themeData.d.ct_box4.common.sub_ct_items.normal) : null ],
					[fontPrefix+'.d.ct_box4.btn'          , Rest.objChk($scope.themeData, 'd.ct_box4.common.btn') ? Rest.findFonts($scope.themeData.d.ct_box4.common.btn) : null ],
					[fontPrefix+'.d.ct_box4.link'         , Rest.objChk($scope.themeData, 'd.ct_box4.common.link') ? Rest.findFonts($scope.themeData.d.ct_box4.common.link) : null ],
					
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