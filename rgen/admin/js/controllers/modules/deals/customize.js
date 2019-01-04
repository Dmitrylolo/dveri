(function(){
	'use strict';

	angular.module('rgen').controller('moduleDealsCustomize', [
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
				section  : 'deals',
				suffix   : '',
				type     : 'manage'
			}
			
			// Default parameters
			$scope.modType    = 'new';
			$scope.modId      = null;
			$scope.themeData  = {};
			$scope.namePrefix = 'Deals showcase';
			$scope.modList    = [];

			$scope.tpl = {
				box1 : tpl('modules/deals/box1'),
				box2 : tpl('modules/deals/box2'),
				box3 : tpl('modules/deals/box3')
			}

			$scope.ct_boxes = [
				{ name:'Block 1' , val: '1' },
				{ name:'Block 2' , val: '2' },
				{ name:'Block 3' , val: '3' }
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

			$scope.blockCommon = function () {
				return {
					main_wrp: {},
					overlay: 'rgba(0,0,0,0.3)',
					img_wrp: {},
					th_wrp: {},
					th_img: {},
					info_wrp: {},
					name_wrp: {},
					name: {},
					cat_wrp: {},
					cat_links: {},
					price: {
						wrp: {},
						box: {},
						p_new: {},
						p_old: {},
						tag: {},
						review_wrp: {},
						star: '#dfdfdf',
						star_active: '#FFC200'
					},
					countdown:{
						out_wrp: {},
						in_wrp: {},
						box: {},
						count: {},
						label: {}
					},
					description: {},
					btn_wrp: {},
					btn:{},
					links: {
						wrp:{},
						normal: '#58989E',
						hover: '#404048'
					}
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

					box1: {
						common: new $scope.blockCommon()
					},
					box2: {
						common: new $scope.blockCommon()
					},
					box3: {
						common: new $scope.blockCommon()
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
					[fontPrefix+'.d.box1.name'        , Rest.objChk($scope.themeData, 'd.box1.common.name') ? Rest.findFonts($scope.themeData.d.box1.common.name) : null ],
					[fontPrefix+'.d.box1.p_new'       , Rest.objChk($scope.themeData, 'd.box1.common.price.p_new') ? Rest.findFonts($scope.themeData.d.box1.common.price.p_new) : null ],
					[fontPrefix+'.d.box1.countdown'   , Rest.objChk($scope.themeData, 'd.box1.common.countdown.box') ? Rest.findFonts($scope.themeData.d.box1.common.countdown.box) : null ],
					[fontPrefix+'.d.box1.description' , Rest.objChk($scope.themeData, 'd.box1.common.description') ? Rest.findFonts($scope.themeData.d.box1.common.description) : null ],
					[fontPrefix+'.d.box1.btn'         , Rest.objChk($scope.themeData, 'd.box1.common.btn') ? Rest.findFonts($scope.themeData.d.box1.common.btn) : null ],

					// Box 2
					[fontPrefix+'.d.box2.name'        , Rest.objChk($scope.themeData, 'd.box2.common.name') ? Rest.findFonts($scope.themeData.d.box2.common.name) : null ],
					[fontPrefix+'.d.box2.p_new'       , Rest.objChk($scope.themeData, 'd.box2.common.price.p_new') ? Rest.findFonts($scope.themeData.d.box2.common.price.p_new) : null ],
					[fontPrefix+'.d.box2.countdown'   , Rest.objChk($scope.themeData, 'd.box2.common.countdown.box') ? Rest.findFonts($scope.themeData.d.box2.common.countdown.box) : null ],
					[fontPrefix+'.d.box2.description' , Rest.objChk($scope.themeData, 'd.box2.common.description') ? Rest.findFonts($scope.themeData.d.box2.common.description) : null ],
					[fontPrefix+'.d.box2.btn'         , Rest.objChk($scope.themeData, 'd.box2.common.btn') ? Rest.findFonts($scope.themeData.d.box2.common.btn) : null ],

					// Box 3
					[fontPrefix+'.d.box3.name'        , Rest.objChk($scope.themeData, 'd.box3.common.name') ? Rest.findFonts($scope.themeData.d.box3.common.name) : null ],
					[fontPrefix+'.d.box3.p_new'       , Rest.objChk($scope.themeData, 'd.box3.common.price.p_new') ? Rest.findFonts($scope.themeData.d.box3.common.price.p_new) : null ],
					[fontPrefix+'.d.box3.countdown'   , Rest.objChk($scope.themeData, 'd.box3.common.countdown.box') ? Rest.findFonts($scope.themeData.d.box3.common.countdown.box) : null ],
					[fontPrefix+'.d.box3.description' , Rest.objChk($scope.themeData, 'd.box3.common.description') ? Rest.findFonts($scope.themeData.d.box3.common.description) : null ],
					[fontPrefix+'.d.box3.btn'         , Rest.objChk($scope.themeData, 'd.box3.common.btn') ? Rest.findFonts($scope.themeData.d.box3.common.btn) : null ],
					
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