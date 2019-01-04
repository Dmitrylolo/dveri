(function(){
	'use strict';

	angular.module('rgen').controller('moduleRevsliderCustomize', [
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
				section  : 'revslider',
				suffix   : '',
				type     : 'manage'
			}
			
			// Default parameters
			$scope.modType    = 'new';
			$scope.modId      = null;
			$scope.themeData  = {};
			$scope.namePrefix = 'Revo slider';
			$scope.modHd      = 'Revo slider';
			$scope.modList    = [];
			$scope.revomod_url = _.unescape(rgen_config.revo_href);

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
					r_html: {}
				}
				
			}			

			$scope.themeDefault = function () {
				return {
					status: true,
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

					[fontPrefix+'.d.m_html'   , Rest.objChk($scope.themeData, 'd.m_html') ? Rest.findFonts($scope.themeData.d.m_html) : null ],
					[fontPrefix+'.t.m_html'   , Rest.objChk($scope.themeData, 't.m_html') ? Rest.findFonts($scope.themeData.t.m_html) : null ],
					[fontPrefix+'.m.m_html'   , Rest.objChk($scope.themeData, 'm.m_html') ? Rest.findFonts($scope.themeData.m.m_html) : null ],

					[fontPrefix+'.d.r_html'   , Rest.objChk($scope.themeData, 'd.r_html') ? Rest.findFonts($scope.themeData.d.r_html) : null ],
					[fontPrefix+'.t.r_html'   , Rest.objChk($scope.themeData, 't.r_html') ? Rest.findFonts($scope.themeData.t.r_html) : null ],
					[fontPrefix+'.m.r_html'   , Rest.objChk($scope.themeData, 'm.r_html') ? Rest.findFonts($scope.themeData.m.r_html) : null ]
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