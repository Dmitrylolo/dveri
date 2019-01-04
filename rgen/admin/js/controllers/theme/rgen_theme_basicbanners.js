(function(){
	'use strict';

	angular.module('rgen').controller('themeBasicbanners', [
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
				group    : 'rgen_theme',
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

			$scope.flyout = function (argument) {
				return {
					wrapper: {},
					link: {}
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

					h_effect1: {
						background: "rgba(0,0,0,0.5)",
						overlay: "rgba(0,0,0,0.5)",
						title: {},
						description: {}
					},

					h_effect2: {
						background: "rgba(0,0,0,0.5)",
						overlay: "rgba(0,0,0,0.5)",
						title: {},
						description: {}
					},

					h_effect3: {
						background: "rgba(0,0,0,0.5)",
						overlay: "rgba(0,0,0,0.5)",
						title: {},
						description: {},
						bdrcolor: "#ffffff"
					},

					h_effect4: {
						background: "rgba(0,0,0,0.5)",
						overlay: "rgba(0,0,0,0.5)",
						title: {},
						description: {}
					},

					h_effect5: {
						background: "rgba(0,0,0,0.5)",
						overlay: "rgba(0,0,0,0.5)",
						title: {},
						description: {},
						bdrcolor: "#ffffff"
					},

					h_effect6: {
						background: "rgba(0,0,0,0.5)",
						overlay: "rgba(0,0,0,0.5)",
						title: {},
						description: {},
						bdrcolor: "#ffffff"
					}

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
				Rest.themeGetkey($scope.db.group, $scope.modId).then(function(response){
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
				return _.object([
					[$scope.modId+'.mod_hd'   , Rest.objChk($scope.themeData, 'mod_hd') ? Rest.findFonts($scope.themeData.mod_hd) : null ],
					[$scope.modId+'.h_effect1_hd'   , Rest.objChk($scope.themeData, 'h_effect1.title') ? Rest.findFonts($scope.themeData.h_effect1.title) : null ],
					[$scope.modId+'.h_effect1_text'   , Rest.objChk($scope.themeData, 'h_effect1.description') ? Rest.findFonts($scope.themeData.h_effect1.description) : null ],

					[$scope.modId+'.h_effect2_hd'   , Rest.objChk($scope.themeData, 'h_effect2.title') ? Rest.findFonts($scope.themeData.h_effect2.title) : null ],
					[$scope.modId+'.h_effect2_text'   , Rest.objChk($scope.themeData, 'h_effect2.description') ? Rest.findFonts($scope.themeData.h_effect2.description) : null ],

					[$scope.modId+'.h_effect3_hd'   , Rest.objChk($scope.themeData, 'h_effect3.title') ? Rest.findFonts($scope.themeData.h_effect3.title) : null ],
					[$scope.modId+'.h_effect3_text'   , Rest.objChk($scope.themeData, 'h_effect3.description') ? Rest.findFonts($scope.themeData.h_effect3.description) : null ],

					[$scope.modId+'.h_effect4_hd'   , Rest.objChk($scope.themeData, 'h_effect4.title') ? Rest.findFonts($scope.themeData.h_effect4.title) : null ],
					[$scope.modId+'.h_effect4_text'   , Rest.objChk($scope.themeData, 'h_effect4.description') ? Rest.findFonts($scope.themeData.h_effect4.description) : null ],

					[$scope.modId+'.h_effect5_hd'   , Rest.objChk($scope.themeData, 'h_effect5.title') ? Rest.findFonts($scope.themeData.h_effect5.title) : null ],
					[$scope.modId+'.h_effect5_text'   , Rest.objChk($scope.themeData, 'h_effect5.description') ? Rest.findFonts($scope.themeData.h_effect5.description) : null ],

					[$scope.modId+'.h_effect6_hd'   , Rest.objChk($scope.themeData, 'h_effect6.title') ? Rest.findFonts($scope.themeData.h_effect6.title) : null ],
					[$scope.modId+'.h_effect6_text'   , Rest.objChk($scope.themeData, 'h_effect6.description') ? Rest.findFonts($scope.themeData.h_effect6.description) : null ]

				]);
			}


			// Save settings
			$scope.save = function(){
				// Fonts
				$scope.fonts = $scope.fontObj($scope.modId) ? $scope.fontObj($scope.modId) : {};

				// Save settings
				Loader.on('.rgen-container');
				// $group, $section, $key, $value
				Rest.themeEditkey($scope.db.group, $scope.db.prefix+$scope.db.section, $scope.modId, $scope.themeData).then(function(){
					
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