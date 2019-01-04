(function(){
	'use strict';

	angular.module('rgen').controller('themeFooter', [
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
				section  : 'footer',
				suffix   : ''
			}
			
			// Default parameters
			$scope.modType    = 'new';
			$scope.modId      = null;
			$scope.themeData  = {};
			$scope.namePrefix = '';
			$scope.modList    = [
				{ name:'General'      , val:'default_ft_general' },
				{ name:'Contact info' , val:'default_ft_contactinfo' },
				{ name:'Social icons' , val:'default_ft_social' }
			];

			$scope.tpl = {
				default_ft_general     : tpl('theme/footer/general'),
				default_ft_contactinfo : tpl('theme/footer/contactinfo'),
				default_ft_social      : tpl('theme/footer/social')
			}

			// Layout width
			$scope.layout_width = [
				{ label:'Boxed', val:'bx' },
				{ label:'Full width', val:'fw' }
			];

			$scope.themeDefault = function () {
				return {
					default_ft_general: {
						status: true,
						top_width: 'bx',
						bottom_width: 'bx',
						main_wrp: {},
						main_wrp_bgimg: {},

						top_wrp: {},
						top_wrp_bgimg: {},
						top_a: '#58989E',
						top_a_hover: '#404048',

						bottom_wrp: {},
						bottom_wrp_bgimg: {},
						bottom_a: '#58989E',
						bottom_a_hover: '#404048',

						cards: {},
						cp_block: {
							html: {},
							wrp: {},
							container: {}
						}
					},
					default_ft_contactinfo: {
						status: true,

						ph_status: true,
						phone1: '',
						phone2: '',
						phone_icon: {},

						fax_status: true,
						fax1: '',
						fax2: '',
						fax_icon: {},

						mail_status: true,
						mailtext: {},
						maillink: '',
						mail_icon: {},

						block: {},
						text_color: '#404048',
						a: '#58989E',
						a_hover: '#404048',
						icon_blocks: {}
					},
					default_ft_social: {
						status: true,
						icon_blocks: {},
						network: []
					}
				}
			}

			$scope.addSocial = function () {
				$scope.themeData.network.push({ icon: {}, link: '', win: false });
			}
			$scope.removeSocial = function ($index) {
				$scope.themeData.network.splice($index, 1);
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
					case 'default_ft_general':
					$scope.themeData = new $scope.themeDefault()['default_ft_general'];
					break;

					case 'default_ft_contactinfo':
					$scope.themeData = new $scope.themeDefault()['default_ft_contactinfo'];
					break;

					case 'default_ft_social':
					$scope.themeData = new $scope.themeDefault()['default_ft_social'];
					break;

				}
			}

			$scope.fontObj = function (id) {
				switch(id) {
					case 'default_ft_contactinfo':
						return _.object([
							['default_ft_contact_font' , Rest.findFonts($scope.themeData.block)]
						]);
					break;
				}
			}

			$scope.settingsObj = function (id) {
				switch(id) {
					case 'default_ft_general':
						return {
							default_ft_tw : Rest.getVal($scope.themeData, 'top_width', 'bx'),
							default_ft_bw : Rest.getVal($scope.themeData, 'bottom_width', 'bx'),
							default_ft_cards : Rest.getVal($scope.themeData, 'cards', ''),
							default_ft_cphtml : Rest.getVal($scope.themeData, 'cp_block.html', '')
						};
					break;
					case 'default_ft_contactinfo':
						return {
							default_ft_ph : {
								status    : Rest.getVal($scope.themeData, 'ph_status', true),
								ph1       : Rest.getVal($scope.themeData, 'phone1', ''),
								ph2       : Rest.getVal($scope.themeData, 'phone2', ''),
								icon_type : Rest.getVal($scope.themeData, 'phone_icon.type', 'ico'),
								icon      : Rest.getVal($scope.themeData, 'phone_icon.icon', 'fa fa-phone')	
							},

							default_ft_fax : {
								status    : Rest.getVal($scope.themeData, 'fax_status', true),
								fax1      : Rest.getVal($scope.themeData, 'fax1', ''),
								fax2      : Rest.getVal($scope.themeData, 'fax2', ''),
								icon_type : Rest.getVal($scope.themeData, 'fax_icon.type', 'ico'),
								icon      : Rest.getVal($scope.themeData, 'fax_icon.icon', 'fa fa-fax')
							},

							default_ft_mail : {
								status    : Rest.getVal($scope.themeData, 'mail_status', true),
								text      : Rest.getVal($scope.themeData, 'mailtext', ''),
								email     : Rest.getVal($scope.themeData, 'maillink', ''),
								icon_type : Rest.getVal($scope.themeData, 'mail_icon.type', 'ico'),
								icon      : Rest.getVal($scope.themeData, 'mail_icon.icon', 'fa fa-envelope')
							}
						};
					break;
					case 'default_ft_social':
						var social = [];
						_.map($scope.themeData.network, function(s){
							var win = s.win ? s.win : false;
							social.push({ icon:s.icon, link: s.link, win: win });
						});
						return {
							default_ft_social : social,
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