(function(){
	'use strict';

	angular.module('rgen').controller('themePageProduct', [
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
				{ name:'General'         , val:'prdpg_general' },
				{ name:'Main image'      , val:'prdpg_main_img' },
				{ name:'Tabs'            , val:'prdpg_tabs' },
				{ name:'Product options' , val:'prdpg_options' },
				{ name:'Quantity block'  , val:'prdpg_qty' },
				{ name:'Layout style 1'  , val:'prdpg_ly1' },
				{ name:'Layout style 2'  , val:'prdpg_ly2' },
				{ name:'Layout style 3'  , val:'prdpg_ly3' }
			];

			$scope.tpl = {
				prdpg_general  : tpl('theme/page_product/prdpg_general'),
				prdpg_main_img : tpl('theme/page_product/prdpg_main_img'),
				prdpg_tabs     : tpl('theme/page_product/prdpg_tabs'),
				prdpg_options  : tpl('theme/page_product/prdpg_options'),
				prdpg_qty      : tpl('theme/page_product/prdpg_qty'),
				prdpg_ly1      : tpl('theme/page_product/prdpg_ly1'),
				prdpg_ly2      : tpl('theme/page_product/prdpg_ly2'),
				prdpg_ly3      : tpl('theme/page_product/prdpg_ly3')
			}

			// Product page layout styles
			$scope.prdpg_layout = [
				{ label:'Layout 1', val:1 },
				{ label:'Layout 2', val:2 },
				{ label:'Layout 3', val:3 }
			];

			// Related product styles
			$scope.relprd_style = [
				{ label:'Style 1', val:1 },
				{ label:'Style 2', val:2 },
				{ label:'Style 3', val:3 },
				{ label:'Style 4', val:4 }
			];

			// Column sizes
			$scope.col_sizes = [];
			var sizerange = _.range(4, 9);
			_.map(sizerange, function(s){
				$scope.col_sizes.push({ label: s, val: s });
			});

			// Gutter size
			$scope.gutter = [
				{ label:'0', val:'gt0' },
				{ label:'1', val:'gt1' },
				{ label:'2', val:'gt2' },
				{ label:'4', val:'gt4' },
				{ label:'10', val:'gt10' },
				{ label:'16', val:'gt16' },
				{ label:'20', val:'gt20' },
				{ label:'30', val:'gt30' },
				{ label:'40', val:'gt40' },
				{ label:'50', val:'gt50' },
				{ label:'60', val:'gt60' }
			];

			$scope.themeDefault = function () {
				return {
					prdpg_general :{
						status: true,
						layout_style: 1,
						
						cart_status: true,
						wishlist_status: true,
						compare_status: true,
						rating_status: true,
						price_status: true,
						tax_status: true,
						options_status: true,
						description_status: true,
						specification_status: true,

						social_sharing: '<div class="addthis_toolbox addthis_default_style"><a class="addthis_button_facebook_like" fb:like:layout="button_count"></a> <a class="addthis_button_tweet"></a> <a class="addthis_button_pinterest_pinit"></a> <a class="addthis_counter addthis_pill_style"></a></div><script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-515eeaf54693130e"></script>',


						title: {},
						hr: {},
						hr_img: {},
						item_info: {
							block: {},
							item: {},
							item_lbl: {}
						},
						rating: {
							block:{},
							stars_normal: {},
							stars_active: {},
							a: '',
							a_hover: ''
						},
						tags: {},
						rel_prdstyle: 1,
						structure: {
							wrp: {},
							rw: {},
							l_wrp: {},
							r_wrp: {},
							l_in: {},
							r_in: {}
						},
						pg_heading: {
							block: {},
							block_img: {},
							breadcrumb: {
								block: {},
								link_normal: '#58989E',
								link_hover: '#404048',
								sep: '#666666'
							}
						}
					},
					prdpg_main_img: {
						status: true,

						cloudzoom: true,
						popup: true,

						outer_block: {},
						main_img_wrp: {},
						main_img: {},
						th_wrp: {},
						th_img: {},
						th_active: {},
						th_img_active: '',
						arrow_wrp: {},
						arrow_line: '',
						arrows: {}
					},
					prdpg_tabs: {
						status: true,
						tabs: {
							bar: {},
							item: {},
							item_wrp: {},
							active: {},
							active_wrp: {},
							container: {},
							pane: {}	
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
						review_tab: {
							block:{},
							comment: {
								block:{},
								title: {},
								stars_normal: '',
								stars_active: '',
								comment: {}
							},
							pagination: {
								wrapper: {},
								block: {},
								active: {},
								normal: {}
							},
							frm: {
								block: {},
								hd: {},
								label: '',
								fields: {},
								rating: {},
								rating_lbl: {},
								rating_count: {},
								btn: {}
							}
						}
					},
					prdpg_options: {
						status: true,
						block: {},
						hd: {},
						frm_group: {},
						frm_lbl: {},
						frm_fields: {},
						frm_ctrls: {},
						frm_btn: {}
					},
					prdpg_qty: {
						status: true,
						block: {},
						qty_lbl: {},
						qty_block: {},
						qty_input: {},
						qty_btn: {},
						cart_txt: false,
						cart_icon: {},
						cart_btn: {},
						links: '',
						links_h: ''
					},
					prdpg_ly1: {
						status: true,
						l_size: 6,
						gt: 'gt40',
						price:{
							wrapper: {},
							block: {},
							price_spl: {},
							price_new: {},
							price_old: {},
							price_tax: {},
							reward: {},
							discount: {},
							discount_items: {}
						},
						info_links:{
							block: {},
							links: {}
						}
					},
					prdpg_ly2: {
						status: true,
						l_size: 6,
						gt: 'gt40',
						price:{
							wrapper: {},
							block: {},
							price_spl: {},
							price_new: {},
							price_old: {},
							price_tax: {},
							reward: {},
							discount: {},
							discount_items: {}
						},
						info_links:{
							block: {},
							links: {}
						}
					},
					prdpg_ly3: {
						status: true,
						l_size: 5,
						gt: 'gt30',
						price:{
							wrapper: {},
							block: {},
							price_spl: {},
							price_new: {},
							price_old: {},
							price_tax: {},
						},
						rating: {
							block:{},
							stars_normal: {},
							stars_active: {},
							a: '',
							a_hover: ''
						},
						offer_info: {},
						reward: '',
						discount: ''
					},
					prdpg_ly4: {
						status: true,
						l_size: 8,
						gt: 'gt30',
						price:{
							wrapper: {},
							block: {},
							price_spl: {},
							price_new: {},
							price_old: {},
							price_tax: {},
							reward: '',
							discount: ''
						},
						rating: {
							block:{},
							stars_normal: {},
							stars_active: {},
							a: '',
							a_hover: ''
						},
						item_info: {
							wrapper: {},
							block: {},
							item: {},
							item_lbl: {}
						},
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
					
					case 'prdpg_general':
					$scope.themeData = new $scope.themeDefault()['prdpg_general'];
					break;

					case 'prdpg_main_img':
					$scope.themeData = new $scope.themeDefault()['prdpg_main_img'];
					break;

					case 'prdpg_tabs':
					$scope.themeData = new $scope.themeDefault()['prdpg_tabs'];
					break;

					case 'prdpg_options':
					$scope.themeData = new $scope.themeDefault()['prdpg_options'];
					break;

					case 'prdpg_qty':
					$scope.themeData = new $scope.themeDefault()['prdpg_qty'];
					break;

					case 'prdpg_ly1':
					$scope.themeData = new $scope.themeDefault()['prdpg_ly1'];
					break;

					case 'prdpg_ly2':
					$scope.themeData = new $scope.themeDefault()['prdpg_ly2'];
					break;

					case 'prdpg_ly3':
					$scope.themeData = new $scope.themeDefault()['prdpg_ly3'];
					break;

					case 'prdpg_ly4':
					$scope.themeData = new $scope.themeDefault()['prdpg_ly4'];
					break;
					
				}
			}

			$scope.fontObj = function (id) {
				switch(id) {
					case 'prdpg_general':
						return _.object([
							['prdpg_tags'      , Rest.objChk($scope.themeData, 'tags') ? Rest.findFonts($scope.themeData.tags) : null ],
							['prdpg_title'      , Rest.objChk($scope.themeData, 'title') ? Rest.findFonts($scope.themeData.title) : null ]
						]);
					break;

					case 'prdpg_tabs':
						return _.object([
							['prdpg_tabs_item'        , Rest.objChk($scope.themeData, 'tabs.item') ? Rest.findFonts($scope.themeData.tabs.item) : null ],
							['prdpg_tabs_table_th'    , Rest.objChk($scope.themeData, 'table_style.th.block') ? Rest.findFonts($scope.themeData.table_style.th.block) : null ],
							['prdpg_reviewfrm_hd'     , Rest.objChk($scope.themeData, 'review_tab.frm.hd') ? Rest.findFonts($scope.themeData.review_tab.frm.hd) : null ],
							['prdpg_reviewfrm_fields' , Rest.objChk($scope.themeData, 'review_tab.frm.fields') ? Rest.findFonts($scope.themeData.review_tab.frm.fields) : null ],
							['prdpg_reviewfrm_btn'    , Rest.objChk($scope.themeData, 'review_tab.frm.btn') ? Rest.findFonts($scope.themeData.review_tab.frm.btn) : null ]
						]);
					break;

					case 'prdpg_options':
						return _.object([
							['prdpg_options_hd'  , Rest.objChk($scope.themeData, 'hd') ? Rest.findFonts($scope.themeData.hd) : null ],
							['prdpg_options_btn' , Rest.objChk($scope.themeData, 'frm_btn') ? Rest.findFonts($scope.themeData.frm_btn) : null ]
						]);
					break;

					case 'prdpg_qty':
						return _.object([
							['prdpg_qty_lbl'    , Rest.objChk($scope.themeData, 'qty_input') ? Rest.findFonts($scope.themeData.qty_input) : null ],
							['prdpg_qty_input'  , Rest.objChk($scope.themeData, 'qty_lbl') ? Rest.findFonts($scope.themeData.qty_lbl) : null ],
							['prdpg_qty_cartbt' , Rest.objChk($scope.themeData, 'cart_btn') ? Rest.findFonts($scope.themeData.cart_btn) : null ]
						]);
					break;

					case 'prdpg_ly1':
						return _.object([
							['prdpg_ly1_price_spl'  , Rest.objChk($scope.themeData, 'price.price_spl') ? Rest.findFonts($scope.themeData.price.price_spl) : null ],
							['prdpg_ly1_price_new'  , Rest.objChk($scope.themeData, 'price.price_new') ? Rest.findFonts($scope.themeData.price.price_new) : null ],
							['prdpg_ly1_price_old'  , Rest.objChk($scope.themeData, 'price.price_old') ? Rest.findFonts($scope.themeData.price.price_old) : null ],
							['prdpg_ly1_price_tax'  , Rest.objChk($scope.themeData, 'price.price_tax') ? Rest.findFonts($scope.themeData.price.price_tax) : null ],
							['prdpg_ly1_infolinks'  , Rest.objChk($scope.themeData, 'info_links.links') ? Rest.findFonts($scope.themeData.info_links.links) : null ]
						]);
					break;

					case 'prdpg_ly2':
						return _.object([
							['prdpg_ly2_price_spl'  , Rest.objChk($scope.themeData, 'price.price_spl') ? Rest.findFonts($scope.themeData.price.price_spl) : null ],
							['prdpg_ly2_price_new'  , Rest.objChk($scope.themeData, 'price.price_new') ? Rest.findFonts($scope.themeData.price.price_new) : null ],
							['prdpg_ly2_price_old'  , Rest.objChk($scope.themeData, 'price.price_old') ? Rest.findFonts($scope.themeData.price.price_old) : null ],
							['prdpg_ly2_price_tax'  , Rest.objChk($scope.themeData, 'price.price_tax') ? Rest.findFonts($scope.themeData.price.price_tax) : null ],
							['prdpg_ly2_infolinks'  , Rest.objChk($scope.themeData, 'info_links.links') ? Rest.findFonts($scope.themeData.info_links.links) : null ]
						]);
					break;

					case 'prdpg_ly3':
						return _.object([
							['prdpg_ly3_price_spl'  , Rest.objChk($scope.themeData, 'price.price_spl') ? Rest.findFonts($scope.themeData.price.price_spl) : null ],
							['prdpg_ly3_price_new'  , Rest.objChk($scope.themeData, 'price.price_new') ? Rest.findFonts($scope.themeData.price.price_new) : null ],
							['prdpg_ly3_price_old'  , Rest.objChk($scope.themeData, 'price.price_old') ? Rest.findFonts($scope.themeData.price.price_old) : null ],
							['prdpg_ly3_price_tax'  , Rest.objChk($scope.themeData, 'price.price_tax') ? Rest.findFonts($scope.themeData.price.price_tax) : null ]
						]);
					break;

					case 'prdpg_ly4':
						return _.object([
							['prdpg_ly4_price_spl'    , Rest.objChk($scope.themeData, 'price.price_spl') ? Rest.findFonts($scope.themeData.price.price_spl) : null ],
							['prdpg_ly4_price_new'    , Rest.objChk($scope.themeData, 'price.price_new') ? Rest.findFonts($scope.themeData.price.price_new) : null ],
							['prdpg_ly4_price_old'    , Rest.objChk($scope.themeData, 'price.price_old') ? Rest.findFonts($scope.themeData.price.price_old) : null ],
							['prdpg_ly4_price_tax'    , Rest.objChk($scope.themeData, 'price.price_tax') ? Rest.findFonts($scope.themeData.price.price_tax) : null ],
							['prdpg_ly4_info_item'    , Rest.objChk($scope.themeData, 'item_info.item') ? Rest.findFonts($scope.themeData.item_info.item) : null ],
							['prdpg_ly4_info_itemlbl' , Rest.objChk($scope.themeData, 'item_info.item_lbl') ? Rest.findFonts($scope.themeData.item_info.item_lbl) : null ]
						]);
					break;
					
				}
			}

			$scope.settingsObj = function (id) {
				switch(id) {
					case 'prdpg_general':
						return {
							prdpg_layout               : Rest.getVal($scope.themeData, 'layout_style', 1),
							prdpg_rel_prdstyle         : Rest.getVal($scope.themeData, 'rel_prdstyle', 1),
							
							prdpg_cart_status          : Rest.getVal($scope.themeData, 'cart_status', true),
							prdpg_wishlist_status      : Rest.getVal($scope.themeData, 'wishlist_status', true),
							prdpg_compare_status       : Rest.getVal($scope.themeData, 'compare_status', true),
							prdpg_rating_status        : Rest.getVal($scope.themeData, 'rating_status', true),
							prdpg_price_status         : Rest.getVal($scope.themeData, 'price_status', true),
							prdpg_tax_status           : Rest.getVal($scope.themeData, 'tax_status', true),
							prdpg_options_status       : Rest.getVal($scope.themeData, 'options_status', true),
							prdpg_description_status   : Rest.getVal($scope.themeData, 'description_status', true),
							prdpg_specification_status : Rest.getVal($scope.themeData, 'specification_status', true),
							prdpg_social_sharing       : Rest.getVal($scope.themeData, 'social_sharing', ''),
						};
					break;
					case 'prdpg_main_img':
						return {
							prdpg_cloudzoom : Rest.getVal($scope.themeData, 'cloudzoom', true),
							prdpg_popup     : Rest.getVal($scope.themeData, 'popup', true)
						};
					break;

					case 'prdpg_qty':
						return {
							prdpg_cartbtn_txt         : Rest.getVal($scope.themeData, 'cart_txt', true),

							prdpg_cartbtn_ico_type    : Rest.getVal($scope.themeData, 'cart_icon.type', 'ico'),
							prdpg_cartbtn_ico         : Rest.getVal($scope.themeData, 'cart_icon.icon', 'glyphicon glyphicon-shopping-cart'),
							
							prdpg_wishbtn_ico_type    : Rest.getVal($scope.themeData, 'wish_icon.type', 'ico'),
							prdpg_wishbtn_ico         : Rest.getVal($scope.themeData, 'wish_icon.icon', 'fa fa-heart'),
							
							prdpg_comparebtn_ico_type : Rest.getVal($scope.themeData, 'compare_icon.type', 'ico'),
							prdpg_comparebtn_ico      : Rest.getVal($scope.themeData, 'compare_icon.icon', 'fa fa-retweet')
						};
					break;
					case 'prdpg_ly1':
						return {
							prdpgly1_l_size: Rest.getVal($scope.themeData, 'l_size', 6),
							prdpgly1_gt: Rest.getVal($scope.themeData, 'gt', 'gt40')
						};
					break;
					case 'prdpg_ly2':
						return {
							prdpgly2_l_size: Rest.getVal($scope.themeData, 'l_size', 6),
							prdpgly2_gt: Rest.getVal($scope.themeData, 'gt', 'gt40')
						};
					break;

					case 'prdpg_ly3':
						return {
							prdpgly3_l_size: Rest.getVal($scope.themeData, 'l_size', 5),
							prdpgly3_gt: Rest.getVal($scope.themeData, 'gt', 'gt30')
						};
					break;

					case 'prdpg_ly4':
						return {
							prdpgly4_l_size: Rest.getVal($scope.themeData, 'l_size', 8),
							prdpgly4_gt: Rest.getVal($scope.themeData, 'gt', 'gt30')
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