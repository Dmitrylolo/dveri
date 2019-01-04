(function(){
	'use strict';

	angular.module('rgen').controller('moduleContentblocksCustomize', [
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
				section  : 'contentblocks',
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
				block1      : tpl('modules/contentblocks/theme_block1'),
				block2      : tpl('modules/contentblocks/theme_block2'),
				block3      : tpl('modules/contentblocks/theme_block3'),
				block4      : tpl('modules/contentblocks/theme_block4'),
				smallblock1 : tpl('modules/contentblocks/theme_smallblock1'),
				smallblock2 : tpl('modules/contentblocks/theme_smallblock2')
			}

			$scope.contentblock_styles = [
				{ name:'Block 1' , val: '1' },
				{ name:'Block 2' , val: '2' },
				{ name:'Block 3' , val: '3' },
				{ name:'Block 4' , val: '4' },
				{ name:'Small block 1' , val: '_small1' },
				{ name:'Small block 2' , val: '_small2' }
			];

			/* Default tabs
			------------------------*/
			$scope.manage_tabs = [
				{ label:'Desktop'  , val:'d' },
				{ label:'Tablet' , val:'t' },
				{ label:'Mobile'  , val:'m' }
			];
			$scope.manage_tab = 'd';
			$scope.tabtype = function (type) {
				Loader.on('.rgen-container');
				$scope.manage_tab = type;
				setTimeout(function(){ Loader.off('.rgen-container'); }, 200);
			}
			/*----------------------*/
			$scope.ctnBlock = function () {
				return {
					main: {
						normal: {},
						hover: {}
					},
					inner_wrp: {
						normal: {},
						hover: {}
					},
					figure: {
						normal: {},
						hover: {}
					},
					text_wrp: {
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
					content_rw: {
						rw: {},
						cl: {},
						first_cl: {},
						last_cl: {}
					},

					ctn_block1: {
						setting: new $scope.ctnBlock()
					},
					ctn_block2: {
						setting: new $scope.ctnBlock()
					},
					ctn_block3: {
						setting: new $scope.ctnBlock(),
						name_line: {
							normal: {},
							hover: {}
						}
					},
					ctn_block4: {
						setting: new $scope.ctnBlock()
					},
					ctn_block_small1: {
						setting: new $scope.ctnBlock()	
					},
					ctn_block_small2: {
						setting: new $scope.ctnBlock()	
					}
				}
				
			}			

			$scope.themeDefault = function () {
				return {
					status: true,
					dots: {
						wrp: {},
						normal: {},
						active: {}
					},
					arrows: {
						wrp: {},
						arrow_line: {},
						arrow: {}
					},
					ctn_block: '1',
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

					[fontPrefix+'.d.mod_sub_hd'   , Rest.objChk($scope.themeData, 'd.mod_sub_hd') ? Rest.findFonts($scope.themeData.d.mod_sub_hd) : null ],
					[fontPrefix+'.t.mod_sub_hd'   , Rest.objChk($scope.themeData, 't.mod_sub_hd') ? Rest.findFonts($scope.themeData.t.mod_sub_hd) : null ],
					[fontPrefix+'.m.mod_sub_hd'   , Rest.objChk($scope.themeData, 'm.mod_sub_hd') ? Rest.findFonts($scope.themeData.m.mod_sub_hd) : null ],

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


					// Content block 1
					[fontPrefix+'.d.ctn_block1.text'   , Rest.objChk($scope.themeData, 'd.ctn_block1.setting.text.normal') ? Rest.findFonts($scope.themeData.d.ctn_block1.setting.text.normal) : null ],
					[fontPrefix+'.d.ctn_block1.name'   , Rest.objChk($scope.themeData, 'd.ctn_block1.setting.name.normal') ? Rest.findFonts($scope.themeData.d.ctn_block1.setting.name.normal) : null ],
					[fontPrefix+'.d.ctn_block1.btn'   , Rest.objChk($scope.themeData, 'd.ctn_block1.setting.btn') ? Rest.findFonts($scope.themeData.d.ctn_block1.setting.btn) : null ],
					[fontPrefix+'.d.ctn_block1.link'   , Rest.objChk($scope.themeData, 'd.ctn_block1.setting.link') ? Rest.findFonts($scope.themeData.d.ctn_block1.setting.link) : null ],
					
					// Content block 2
					[fontPrefix+'.d.ctn_block2.text'   , Rest.objChk($scope.themeData, 'd.ctn_block2.setting.text.normal') ? Rest.findFonts($scope.themeData.d.ctn_block2.setting.text.normal) : null ],
					[fontPrefix+'.d.ctn_block2.name'   , Rest.objChk($scope.themeData, 'd.ctn_block2.setting.name.normal') ? Rest.findFonts($scope.themeData.d.ctn_block2.setting.name.normal) : null ],
					[fontPrefix+'.d.ctn_block2.btn'   , Rest.objChk($scope.themeData, 'd.ctn_block2.setting.btn') ? Rest.findFonts($scope.themeData.d.ctn_block2.setting.btn) : null ],
					[fontPrefix+'.d.ctn_block2.link'   , Rest.objChk($scope.themeData, 'd.ctn_block2.setting.link') ? Rest.findFonts($scope.themeData.d.ctn_block2.setting.link) : null ],
					
					// Content block 3
					[fontPrefix+'.d.ctn_block3.text'   , Rest.objChk($scope.themeData, 'd.ctn_block3.setting.text.normal') ? Rest.findFonts($scope.themeData.d.ctn_block3.setting.text.normal) : null ],
					[fontPrefix+'.d.ctn_block3.name'   , Rest.objChk($scope.themeData, 'd.ctn_block3.setting.name.normal') ? Rest.findFonts($scope.themeData.d.ctn_block3.setting.name.normal) : null ],
					[fontPrefix+'.d.ctn_block3.btn'   , Rest.objChk($scope.themeData, 'd.ctn_block3.setting.btn') ? Rest.findFonts($scope.themeData.d.ctn_block3.setting.btn) : null ],
					[fontPrefix+'.d.ctn_block3.link'   , Rest.objChk($scope.themeData, 'd.ctn_block3.setting.link') ? Rest.findFonts($scope.themeData.d.ctn_block3.setting.link) : null ],
					
					// Content block 4
					[fontPrefix+'.d.ctn_block4.text'   , Rest.objChk($scope.themeData, 'd.ctn_block4.setting.text.normal') ? Rest.findFonts($scope.themeData.d.ctn_block4.setting.text.normal) : null ],
					[fontPrefix+'.d.ctn_block4.name'   , Rest.objChk($scope.themeData, 'd.ctn_block4.setting.name.normal') ? Rest.findFonts($scope.themeData.d.ctn_block4.setting.name.normal) : null ],
					[fontPrefix+'.d.ctn_block4.btn'   , Rest.objChk($scope.themeData, 'd.ctn_block4.setting.btn') ? Rest.findFonts($scope.themeData.d.ctn_block4.setting.btn) : null ],
					[fontPrefix+'.d.ctn_block4.link'   , Rest.objChk($scope.themeData, 'd.ctn_block4.setting.link') ? Rest.findFonts($scope.themeData.d.ctn_block4.setting.link) : null ],
					
					// Small Content block 1
					[fontPrefix+'.d.ctn_block_small1.text'   , Rest.objChk($scope.themeData, 'd.ctn_block_small1.setting.text.normal') ? Rest.findFonts($scope.themeData.d.ctn_block_small1.setting.text.normal) : null ],
					[fontPrefix+'.d.ctn_block_small1.name'   , Rest.objChk($scope.themeData, 'd.ctn_block_small1.setting.name.normal') ? Rest.findFonts($scope.themeData.d.ctn_block_small1.setting.name.normal) : null ],
					[fontPrefix+'.d.ctn_block_small1.btn'   , Rest.objChk($scope.themeData, 'd.ctn_block_small1.setting.btn') ? Rest.findFonts($scope.themeData.d.ctn_block_small1.setting.btn) : null ],
					[fontPrefix+'.d.ctn_block_small1.link'   , Rest.objChk($scope.themeData, 'd.ctn_block_small1.setting.link') ? Rest.findFonts($scope.themeData.d.ctn_block_small1.setting.link) : null ],
					
					// Small Content block 2
					[fontPrefix+'.d.ctn_block_small2.text'   , Rest.objChk($scope.themeData, 'd.ctn_block_small2.setting.text.normal') ? Rest.findFonts($scope.themeData.d.ctn_block_small2.setting.text.normal) : null ],
					[fontPrefix+'.d.ctn_block_small2.name'   , Rest.objChk($scope.themeData, 'd.ctn_block_small2.setting.name.normal') ? Rest.findFonts($scope.themeData.d.ctn_block_small2.setting.name.normal) : null ],
					[fontPrefix+'.d.ctn_block_small2.btn'   , Rest.objChk($scope.themeData, 'd.ctn_block_small2.setting.btn') ? Rest.findFonts($scope.themeData.d.ctn_block_small2.setting.btn) : null ],
					[fontPrefix+'.d.ctn_block_small2.link'   , Rest.objChk($scope.themeData, 'd.ctn_block_small2.setting.link') ? Rest.findFonts($scope.themeData.d.ctn_block_small2.setting.link) : null ],
					
					
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