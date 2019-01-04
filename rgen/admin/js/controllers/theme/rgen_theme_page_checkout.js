(function(){
	'use strict';

	angular.module('rgen').controller('themePageCheckout', [
		'$scope', 
		'Rest', 
		'Pop', 
		'Loader',
		'SweetAlert',
		function($scope, Rest, Pop, Loader, SweetAlert){

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
			$scope.modList    = [
				{ name:'Checkout page' , val:'checkout' }
			];

			$scope.themeDefault = function () {
				return {
					checkout: {
						status: true,
						panel: {
							panel_wrp: {},
							title_block: {},
							title: {},
							body_wrp: {},
							body: {}
						},
						forms: {
							block: {},
							title: {},
							label: {},
							form_control: {},
							button_bar: {}
						},
						table_style: {
							table: {
								border: {},
								background: ''
							},
							th: {
								block: {},
								first: {},
								last: {}
							},
							td: {
								block: {},
								first: {},
								last: {}	
							}
						},
						default_btn: {}
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
					case 'checkout':
					$scope.themeData = new $scope.themeDefault()['checkout'];
					break;
				}
			}

			$scope.fontObj = function (id) {
				switch(id) {
					case 'checkout':
						return _.object([
							['checkout_panel_title' , Rest.objChk($scope.themeData, 'panel.title') ? Rest.findFonts($scope.themeData.panel.title) : null ],
							['checkout_form_title' , Rest.objChk($scope.themeData, 'forms.title') ? Rest.findFonts($scope.themeData.forms.title) : null ],
							['checkout_form_label' , Rest.objChk($scope.themeData, 'forms.label') ? Rest.findFonts($scope.themeData.forms.label) : null ],
							['checkout_form_ctrl' , Rest.objChk($scope.themeData, 'forms.form_control') ? Rest.findFonts($scope.themeData.forms.form_control) : null ],
							['checkout_table_th' , Rest.objChk($scope.themeData, 'table_style.th.block') ? Rest.findFonts($scope.themeData.table_style.th.block) : null ],
							['checkout_table_td' , Rest.objChk($scope.themeData, 'table_style.td.block') ? Rest.findFonts($scope.themeData.table_style.td.block) : null ],
							['checkout_default_btn' , Rest.objChk($scope.themeData, 'default_btn') ? Rest.findFonts($scope.themeData.default_btn) : null ]
						]);
					break;
				}
			}

			$scope.save = function(){
				// Fonts
				$scope.fonts = $scope.fontObj($scope.modId) ? $scope.fontObj($scope.modId) : {};

				// Settings
				//$scope.settings = $scope.settingsObj($scope.modId) ? $scope.settingsObj($scope.modId) : {};
				
				// Save data
				Loader.on('.rgen-container');
				// $group, $section, $key, $value
				Rest.themeEditkey($scope.db.group, $scope.db.prefix+$scope.db.section, $scope.modId, $scope.themeData).then(function(){
					
					/*if (_.size($scope.settings) > 0) {
						Rest.settingsSave($scope.db.settings, $scope.db.prefix+$scope.db.section, $scope.settings);
					}*/

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