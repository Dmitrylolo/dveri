(function(){
	'use strict';

	angular.module('rgen').controller('themeCommoncomponents', [
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
				section  : 'commoncomponents',
				suffix   : ''
			}
			
			// Default parameters
			$scope.modType    = 'new';
			$scope.modId      = null;
			$scope.themeData  = {};
			$scope.namePrefix = '';
			$scope.imgPath    = rgen_config.DIR_ADMIN_IMG;
			$scope.modList    = [
				{ name:'Global'            , val:'global' },
				{ name:'Page heading'      , val:'pg_heading' },
				{ name:'Headings'          , val:'headings' },
				{ name:'Buttons'           , val:'buttons' },
				{ name:'Product filters'   , val:'prd_filters' },
				{ name:'Table style'       , val:'table_style' },
				{ name:'Forms'             , val:'forms' },
				{ name:'Pop up'            , val:'popup' },
				{ name:'Panel (Accordion)' , val:'panel' }

			];

			$scope.tpl = {
				global      : tpl('theme/commoncomponents/global'),
				table_style : tpl('theme/commoncomponents/table_style'),
				pg_heading  : tpl('theme/commoncomponents/pg_heading'),
				headings    : tpl('theme/commoncomponents/headings'),
				buttons     : tpl('theme/commoncomponents/buttons'),
				prd_filters : tpl('theme/commoncomponents/prd_filters'),
				forms       : tpl('theme/commoncomponents/forms'),
				popup       : tpl('theme/commoncomponents/popup'),
				panel       : tpl('theme/commoncomponents/panel')
			}

			// Breadcrumb home link
			$scope.breadcrumb_home = [
				{ label:'Icon', val:'ico' },
				{ label:'Link', val:'lnk' }
			];

			// Page header style
			$scope.pghd_styles = [
				{ label:'1', val:1 },
				{ label:'2', val:2 }
			];

			// Page header position
			$scope.pghd_positions = [
				{ label:'Inside container', val:'in' },
				{ label:'Outside container', val:'out' }
			];

			$scope.box_config1 = { fonts: 0, padding:0, margin: 0, shadow: 0 }

			$scope.themeDefault = function () {
				return {
					global: {
						status: true,
						links: {
							normal: '',
							hover: ''
						},
						border_color: '',
						scrolltop: {
							background: '',
							icon: {},
							border: {}
						},
						pagination: {
							wrapper: {},
							block: {},
							active: {},
							normal: {}
						},
						arrow_wrp: {},
						arrow_line: '',
						arrows: {},

						hr: {
							block: {},
							bg: {}
						},

						dots: {
							dot_line: '#434444',
							dot_normal: { 
								background: '#ffffff', 
								w:25, h:25, 
								border:{ size_all: 5, radius_all: 20, color: '#434444' } 
							},
							dot_active: {
								background: '#6ddee2', 
								border: { size_all: 5, radius_all: 20, color: '#ffffff' },
								shadow: { 
									ver_l: 1,
									blur: 5,
									color: 'rgba(0, 0, 0, 0.3)'
								}
							}
						}
						
					},
					pg_heading: {
						status: true,
						style: 1,
						position: 'in',
						block: {},
						block_img: {},
						h1_block: {},
						h1_text: {},
						breadcrumb: {
							home: 'lnk',
							block: {},
							link_normal: '#58989E',
							link_hover: '#404048',
							sep: '#666666'
						}
					},
					headings: {
						status: true,
						module_hd: {},
						column_module_hd: {},
						footer_hd: {},
						other_hd: {
							fonts: {},
							h1: {},
							h2: {},
							h3: {},
							h4: {},
							h5: {},
							h6: {}
						},
					},
					buttons: {
						status: true,
						default_btn: {},
						primary_btn: {},
						small_btn: {},
						mini_btn: {},
						xs_btn: {}
					},
					prd_filters: {
						status: true,
						block: {},
						compare: {},
						filter_lbl: '',
						filter_ctrl: {},

						display_btn: {},
						display_btn_active: {},
						display: '',
						display_active: ''
					},
					table_style: {
						status: true,
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
					forms: {
						status: true,
						block: {},
						title: {},
						label: {},
						form_control: {},
						button_bar: {}
					},
					popup: {
						status: true,
						modal: {},
						modal_header: {},
						modal_header_fonts: {},
						modal_close: '',
						modal_body: {}
					},
					panel: {
						status: true,
						panel_wrp: {},
						title_block: {},
						title: {},
						body_wrp: {},
						body: {}
					}
				}
			}
			
			/*$scope.item_type_tab = 'normal';
			$scope.itemtype = function (type) {
				$scope.item_type_tab = type;
			}*/

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
					
					case 'global':
					$scope.themeData = new $scope.themeDefault()['global'];
					break;

					case 'pg_heading':
					$scope.themeData = new $scope.themeDefault()['pg_heading'];	
					break;
					
					case 'headings':
					$scope.themeData = new $scope.themeDefault()['headings'];	
					break;
					
					case 'buttons':
					$scope.themeData = new $scope.themeDefault()['buttons'];	
					break;

					case 'prd_filters':
					$scope.themeData = new $scope.themeDefault()['prd_filters'];	
					break;

					case 'table_style':
					$scope.themeData = new $scope.themeDefault()['table_style'];	
					break;

					case 'forms':
					$scope.themeData = new $scope.themeDefault()['forms'];	
					break;

					case 'popup':
					$scope.themeData = new $scope.themeDefault()['popup'];	
					break;

					case 'panel':
					$scope.themeData = new $scope.themeDefault()['panel'];	
					break;
				}
			}

			$scope.fontObj = function (id) {
				switch(id) {
					case 'pg_heading':
						return _.object([
							['pg_heading_h1' , Rest.objChk($scope.themeData, 'h1_block') ? Rest.findFonts($scope.themeData.h1_block) : null ],
							['breadcrumb'    , Rest.objChk($scope.themeData, 'breadcrumb.block') ? Rest.findFonts($scope.themeData.breadcrumb.block) : null ]
						]);
					break;
					
					case 'headings':
						return _.object([
							['module_hd'        , Rest.objChk($scope.themeData, 'module_hd') ? Rest.findFonts($scope.themeData.module_hd) : null ],
							['column_module_hd' , Rest.objChk($scope.themeData, 'column_module_hd') ? Rest.findFonts($scope.themeData.column_module_hd) : null ],
							['footer_hd' 		, Rest.objChk($scope.themeData, 'footer_hd') ? Rest.findFonts($scope.themeData.footer_hd) : null ],
							['other_hd'         , Rest.objChk($scope.themeData, 'other_hd') ? Rest.findFonts($scope.themeData.other_hd) : null ]
							
						]);
					break;

					case 'buttons':
						return _.object([
							['default_btn' , Rest.objChk($scope.themeData, 'default_btn') ? Rest.findFonts($scope.themeData.default_btn) : null ],
							['primary_btn' , Rest.objChk($scope.themeData, 'primary_btn') ? Rest.findFonts($scope.themeData.primary_btn) : null ],
							['small_btn'   , Rest.objChk($scope.themeData, 'small_btn') ? Rest.findFonts($scope.themeData.small_btn) : null ],
							['mini_btn'    , Rest.objChk($scope.themeData, 'mini_btn') ? Rest.findFonts($scope.themeData.mini_btn) : null ],
							['xs_btn'      , Rest.objChk($scope.themeData, 'xs_btn') ? Rest.findFonts($scope.themeData.xs_btn) : null ]
						]);
					break;

					case 'table_style':
						return _.object([
							['table_th' , Rest.objChk($scope.themeData, 'th.block') ? Rest.findFonts($scope.themeData.th.block) : null ],
							['table_td' , Rest.objChk($scope.themeData, 'td.block') ? Rest.findFonts($scope.themeData.td.block) : null ]
						]);
					break;

					case 'forms':
						return _.object([
							['form_title' , Rest.objChk($scope.themeData, 'title') ? Rest.findFonts($scope.themeData.title) : null ],
							['form_label' , Rest.objChk($scope.themeData, 'label') ? Rest.findFonts($scope.themeData.label) : null ],
							['form_ctrl' , Rest.objChk($scope.themeData, 'form_control') ? Rest.findFonts($scope.themeData.form_control) : null ]
						]);
					break;

					case 'popup':
						return _.object([
							['popup_header_fonts' , Rest.objChk($scope.themeData, 'modal_header_fonts') ? Rest.findFonts($scope.themeData.modal_header_fonts) : null ],
							['popup_body' , Rest.objChk($scope.themeData, 'modal_body') ? Rest.findFonts($scope.themeData.modal_body) : null ]
						]);
					break;

					case 'panel':
						return _.object([
							['panel_title' , Rest.objChk($scope.themeData, 'title') ? Rest.findFonts($scope.themeData.title) : null ]
						]);
					break;
				
				}
			}

			$scope.settingsObj = function (id) {
				switch(id) {
					case 'global':
						return {
							scroll_top_icon: Rest.getVal($scope.themeData, 'scrolltop.icon.icon', 'fa fa-chevron-up')
							//typeof $scope.themeData.scrolltop.icon.icon != "undefined" ? $scope.themeData.scrolltop.icon.icon : 'fa fa-chevron-up'
						};
					break;
					case 'pg_heading':
						return {
							page_hd_style: Rest.getVal($scope.themeData, 'style', 1),
							page_hd_pos: Rest.getVal($scope.themeData, 'position', 'in'),
							breadcrumb_home: Rest.getVal($scope.themeData, 'breadcrumb.home', 'lnk')
							//typeof $scope.themeData.breadcrumb.home != "undefined" ? $scope.themeData.breadcrumb.home : 'lnk'
						};
					break;
				}
			}
			
			$scope.save = function(){
				// Fonts
				$scope.fonts = $scope.fontObj($scope.modId) ? $scope.fontObj($scope.modId) : {};
				
				// Settings
				$scope.settings = $scope.settingsObj($scope.modId) ? $scope.settingsObj($scope.modId) : {};
				
				// Save settings
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