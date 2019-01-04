(function(){
	'use strict';

	angular.module('rgen').controller('themePrdblocks', [
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
				section  : 'prdblocks',
				suffix   : ''
			}
			
			// Default parameters
			$scope.modType    = 'new';
			$scope.modId      = null;
			$scope.themeData  = {};
			$scope.namePrefix = '';
			$scope.imgPath    = rgen_config.DIR_ADMIN_IMG;
			$scope.helpImg    = function (img) { Pop.help(img); };
			$scope.modList    = [
				{ name:'Product blocks'       , val:'global_prdblocks' },
				{ name:'Small product blocks' , val:'global_smallprdblocks' },
				{ name:'Product list pages'   , val:'global_prdgirdpages' },
				{ name:'Quick view'           , val:'global_quickview' }
			];

			$scope.tpl = {
				global_prdblocks      : tpl('theme/prdblocks/prdblocks'),
				global_smallprdblocks : tpl('theme/prdblocks/smallprdblocks'),
				global_prdgirdpages   : tpl('theme/prdblocks/prdgirdpages'),
				global_quickview      : tpl('theme/prdblocks/quickview'),
				prd1                  : tpl('theme/prdblocks/prd1'),
				prd2                  : tpl('theme/prdblocks/prd2'),
				prd3                  : tpl('theme/prdblocks/prd3'),
				prd4                  : tpl('theme/prdblocks/prd4')
			}

			// Product box styles
			$scope.prdblock_tab = 1;
			$scope.prdblock_styles = [
				{ label:'Style 1', val: 1 },
				{ label:'Style 2', val: 2 },
				{ label:'Style 3', val: 3 },
				{ label:'Style 4', val: 4 }
			];
			$scope.smallprdblock_styles = [
				{ label:'Small 1', val: 1 },
				{ label:'Small 2', val: 2 }
			];
			$scope.itemtype = function (type) {
				Loader.on('.rgen-container');
				$scope.prdblock_tab = type;
				setTimeout(function(){ Loader.off('.rgen-container'); }, 200);
			}

			$scope.prdblockcomponents = function() {
				return {
					cart: true,
					wishlist: true,
					compare: true,
					more: true,
					description: true,
					rating: true,
					price: true,
					tax: true,
					quickview: true,
					style: {}
				}
			}

			$scope.prdblockcommon = function() {
				return {
					status: true,
					normal: new $scope.prdblockcomponents(),
					grid: new $scope.prdblockcomponents(),
					list: new $scope.prdblockcomponents(),
					cart_ico: {},
					wish_ico: {},
					compare_ico: {},
					more_ico: {},
					quickview_ico: {},
					offer_tag: 'dis',
					offer_img: {
						img: {},
						tag_w: 40,
						tag_h: 40
					},
					offer_discount: {},
					offer_text: {
						box: {},
						text: {}
					}
				}
			}

			$scope.themeDefault = function () {
				return {
					global_prdblocks: {
						prd1: new $scope.prdblockcommon(),
						prd2: new $scope.prdblockcommon(),
						prd3: new $scope.prdblockcommon(),
						prd4: new $scope.prdblockcommon()
					},
					global_smallprdblocks:{
						smallprd1: {},
						smallprd2: {}
					},
					global_prdgirdpages: {
						category: {
							prd_style: 1,
							gridview: {},
							listview: {}
						},
						special: {
							prd_style: 1,
							gridview: {},
							listview: {}
						},
						brand_info: {
							prd_style: 1,
							gridview: {},
							listview: {}
						},
						search: {
							prd_style: 1,
							gridview: {},
							listview: {}
						}
					},
					global_quickview: {
						status: true,
						cart_status: true,
						wishlist_status: true,
						compare_status: true,
						rating_status: true,
						price_status: true,
						tax_status: true,
						options_status: true,
						description_status: true,
						quickview_text: {},
						moreinfo_text: {},

						popup_h: 650,
						body: {},
						title: {},
						main_img: {},
						sub_img: {},
						active_img: '',
						arrows: {
							wrp: {},
							arrow_line: '',
							arrow: {}
						},
						tabs: {
							bar: {},
							item: {},
							item_wrp: {},
							active: {},
							active_wrp: {},
							container: {},
							pane: {}	
						},
						item_info: {
							block: {},
							item: {},
							item_lbl: {}
						},
						rating: {
							stars_normal: {},
							stars_active: {}
						},
						prdpg_options: {
							status: true,
							block: {},
							frm_group: {},
							frm_lbl: {},
							frm_fields: {},
							frm_ctrls: {},
							frm_btn: {}
						},
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
						}
					}
					
				}
			}

			$scope.prd_viewtypes = 'normal';
			$scope.viewtypes = function (type) {
				$scope.prd_viewtypes = type;
			}

			$scope.prd_types = [
				{ label:'Normal', val:'normal' },
				{ label:'Grid view', val:'grid' },
				{ label:'List view', val:'list' }
			];

			$scope.prd_offertag = [
				{ label:'Image', val:'img' },
				{ label:'Discount value', val:'dis' },
				{ label:'Custom text', val:'txt' }
			];

			$scope.copySettings = function (prd, from, to) {
				Loader.on('.rgen-container');
				$scope.themeData[prd][to] = angular.copy($scope.themeData[prd][from]);
				setTimeout(function(){
					$scope.$apply(function() {
						Loader.off('.rgen-container');
					});
				}, 300);
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
					
					// Prd 1 reset
					case 1:
					$scope.themeData.prd1 = new $scope.themeDefault()['global_prdblocks']['prd1'];
					break;

					// Prd 2 reset
					case 2:
					$scope.themeData.prd2 = new $scope.themeDefault()['global_prdblocks']['prd2'];
					break;

					// Prd 3 reset
					case 3:
					$scope.themeData.prd3 = new $scope.themeDefault()['global_prdblocks']['prd3'];
					break;

					// Prd 4 reset
					case 4:
					$scope.themeData.prd4 = new $scope.themeDefault()['global_prdblocks']['prd4'];
					break;

					case 'global_prdgirdpages':
					$scope.themeData = new $scope.themeDefault()['global_prdgirdpages'];
					break;

					case 'global_smallprdblocks':
					$scope.themeData = new $scope.themeDefault()['global_smallprdblocks'];
					break;

					case 'smallprd1':
					$scope.themeData.smallprd1 = new $scope.themeDefault()['global_smallprdblocks']['smallprd1'];
					break;

					case 'smallprd2':
					$scope.themeData.smallprd2 = new $scope.themeDefault()['global_smallprdblocks']['smallprd2'];
					break;

					case 'global_quickview':
					$scope.themeData = new $scope.themeDefault()['global_quickview'];
					break;
				}
			}
			
			$scope.fontObj = function (id) {
				switch(id) {
					case 'global_prdblocks':
						var prd1 = $scope.themeData.prd1;
						var prd2 = $scope.themeData.prd2;
						var prd3 = $scope.themeData.prd3;
						var prd4 = $scope.themeData.prd4;
						return _.object([
							['prd1_offer_dis'        , Rest.objChk(prd1, 'offer_discount') ? Rest.findFonts(prd1.offer_discount) : null ],
							['prd1_offer_txt'        , Rest.objChk(prd1, 'offer_text.box') ? Rest.findFonts(prd1.offer_text.box) : null ],

							['prd1_normal_name'        , Rest.objChk(prd1, 'normal.style.prd.info_name') ? Rest.findFonts(prd1.normal.style.prd.info_name) : null ],
							['prd1_normal_description' , Rest.objChk(prd1, 'normal.style.prd.info_description') ? Rest.findFonts(prd1.normal.style.prd.info_description) : null ],
							['prd1_normal_price_spl'   , Rest.objChk(prd1, 'normal.style.prd.price_spl') ? Rest.findFonts(prd1.normal.style.prd.price_spl) : null ],
							['prd1_normal_price_new'   , Rest.objChk(prd1, 'normal.style.prd.price_new') ? Rest.findFonts(prd1.normal.style.prd.price_new) : null ],
							['prd1_normal_cartbtn'     , Rest.objChk(prd1, 'normal.style.prd.cart.btn') ? Rest.findFonts(prd1.normal.style.prd.cart.btn) : null ],

							['prd1_grid_name'        , Rest.objChk(prd1, 'grid.style.prd.info_name') ? Rest.findFonts(prd1.grid.style.prd.info_name) : null ],
							['prd1_grid_description' , Rest.objChk(prd1, 'grid.style.prd.info_description') ? Rest.findFonts(prd1.grid.style.prd.info_description) : null ],
							['prd1_grid_price_spl'   , Rest.objChk(prd1, 'grid.style.prd.price_spl') ? Rest.findFonts(prd1.grid.style.prd.price_spl) : null ],
							['prd1_grid_price_new'   , Rest.objChk(prd1, 'grid.style.prd.price_new') ? Rest.findFonts(prd1.grid.style.prd.price_new) : null ],
							['prd1_grid_cartbtn'     , Rest.objChk(prd1, 'grid.style.prd.cart.btn') ? Rest.findFonts(prd1.grid.style.prd.cart.btn) : null ],

							['prd1_list_name'        , Rest.objChk(prd1, 'list.style.prd.info_name') ? Rest.findFonts(prd1.list.style.prd.info_name) : null ],
							['prd1_list_description' , Rest.objChk(prd1, 'list.style.prd.info_description') ? Rest.findFonts(prd1.list.style.prd.info_description) : null ],
							['prd1_list_price_spl'   , Rest.objChk(prd1, 'list.style.prd.price_spl') ? Rest.findFonts(prd1.list.style.prd.price_spl) : null ],
							['prd1_list_price_new'   , Rest.objChk(prd1, 'list.style.prd.price_new') ? Rest.findFonts(prd1.list.style.prd.price_new) : null ],
							['prd1_list_cartbtn'     , Rest.objChk(prd1, 'list.style.prd.cart.btn') ? Rest.findFonts(prd1.list.style.prd.cart.btn) : null ],
							
							/*----------------*/

							['prd2_offer_dis'        , Rest.objChk(prd2, 'offer_discount') ? Rest.findFonts(prd2.offer_discount) : null ],
							['prd2_offer_txt'        , Rest.objChk(prd2, 'offer_text.box') ? Rest.findFonts(prd2.offer_text.box) : null ],

							['prd2_normal_name'        , Rest.objChk(prd2, 'normal.style.prd.info_name') ? Rest.findFonts(prd2.normal.style.prd.info_name) : null ],
							['prd2_normal_description' , Rest.objChk(prd2, 'normal.style.prd.info_description') ? Rest.findFonts(prd2.normal.style.prd.info_description) : null ],
							['prd2_normal_price_spl'   , Rest.objChk(prd2, 'normal.style.prd.price_spl') ? Rest.findFonts(prd2.normal.style.prd.price_spl) : null ],
							['prd2_normal_price_new'   , Rest.objChk(prd2, 'normal.style.prd.price_new') ? Rest.findFonts(prd2.normal.style.prd.price_new) : null ],
							['prd2_normal_cartbtn'     , Rest.objChk(prd2, 'normal.style.prd.cart.btn') ? Rest.findFonts(prd2.normal.style.prd.cart.btn) : null ],

							['prd2_grid_name'        , Rest.objChk(prd2, 'grid.style.prd.info_name') ? Rest.findFonts(prd2.grid.style.prd.info_name) : null ],
							['prd2_grid_description' , Rest.objChk(prd2, 'grid.style.prd.info_description') ? Rest.findFonts(prd2.grid.style.prd.info_description) : null ],
							['prd2_grid_price_spl'   , Rest.objChk(prd2, 'grid.style.prd.price_spl') ? Rest.findFonts(prd2.grid.style.prd.price_spl) : null ],
							['prd2_grid_price_new'   , Rest.objChk(prd2, 'grid.style.prd.price_new') ? Rest.findFonts(prd2.grid.style.prd.price_new) : null ],
							['prd2_grid_cartbtn'     , Rest.objChk(prd2, 'grid.style.prd.cart.btn') ? Rest.findFonts(prd2.grid.style.prd.cart.btn) : null ],

							['prd2_list_name'        , Rest.objChk(prd2, 'list.style.prd.info_name') ? Rest.findFonts(prd2.list.style.prd.info_name) : null ],
							['prd2_list_description' , Rest.objChk(prd2, 'list.style.prd.info_description') ? Rest.findFonts(prd2.list.style.prd.info_description) : null ],
							['prd2_list_price_spl'   , Rest.objChk(prd2, 'list.style.prd.price_spl') ? Rest.findFonts(prd2.list.style.prd.price_spl) : null ],
							['prd2_list_price_new'   , Rest.objChk(prd2, 'list.style.prd.price_new') ? Rest.findFonts(prd2.list.style.prd.price_new) : null ],
							['prd2_list_cartbtn'     , Rest.objChk(prd2, 'list.style.prd.cart.btn') ? Rest.findFonts(prd2.list.style.prd.cart.btn) : null ],

							/*----------------*/

							['prd3_offer_dis'        , Rest.objChk(prd3, 'offer_discount') ? Rest.findFonts(prd3.offer_discount) : null ],
							['prd3_offer_txt'        , Rest.objChk(prd3, 'offer_text.box') ? Rest.findFonts(prd3.offer_text.box) : null ],

							['prd3_normal_name'        , Rest.objChk(prd3, 'normal.style.prd.info_name') ? Rest.findFonts(prd3.normal.style.prd.info_name) : null ],
							['prd3_normal_description' , Rest.objChk(prd3, 'normal.style.prd.info_description') ? Rest.findFonts(prd3.normal.style.prd.info_description) : null ],
							['prd3_normal_price_spl'   , Rest.objChk(prd3, 'normal.style.prd.price_spl') ? Rest.findFonts(prd3.normal.style.prd.price_spl) : null ],
							['prd3_normal_price_new'   , Rest.objChk(prd3, 'normal.style.prd.price_new') ? Rest.findFonts(prd3.normal.style.prd.price_new) : null ],
							['prd3_normal_cartbtn'     , Rest.objChk(prd3, 'normal.style.prd.cart.btn') ? Rest.findFonts(prd3.normal.style.prd.cart.btn) : null ],

							['prd3_grid_name'        , Rest.objChk(prd3, 'grid.style.prd.info_name') ? Rest.findFonts(prd3.grid.style.prd.info_name) : null ],
							['prd3_grid_description' , Rest.objChk(prd3, 'grid.style.prd.info_description') ? Rest.findFonts(prd3.grid.style.prd.info_description) : null ],
							['prd3_grid_price_spl'   , Rest.objChk(prd3, 'grid.style.prd.price_spl') ? Rest.findFonts(prd3.grid.style.prd.price_spl) : null ],
							['prd3_grid_price_new'   , Rest.objChk(prd3, 'grid.style.prd.price_new') ? Rest.findFonts(prd3.grid.style.prd.price_new) : null ],
							['prd3_grid_cartbtn'     , Rest.objChk(prd3, 'grid.style.prd.cart.btn') ? Rest.findFonts(prd3.grid.style.prd.cart.btn) : null ],

							['prd3_list_name'        , Rest.objChk(prd3, 'list.style.prd.info_name') ? Rest.findFonts(prd3.list.style.prd.info_name) : null ],
							['prd3_list_description' , Rest.objChk(prd3, 'list.style.prd.info_description') ? Rest.findFonts(prd3.list.style.prd.info_description) : null ],
							['prd3_list_price_spl'   , Rest.objChk(prd3, 'list.style.prd.price_spl') ? Rest.findFonts(prd3.list.style.prd.price_spl) : null ],
							['prd3_list_price_new'   , Rest.objChk(prd3, 'list.style.prd.price_new') ? Rest.findFonts(prd3.list.style.prd.price_new) : null ],
							['prd3_list_cartbtn'     , Rest.objChk(prd3, 'list.style.prd.cart.btn') ? Rest.findFonts(prd3.list.style.prd.cart.btn) : null ],

							/*----------------*/

							['prd4_offer_dis'        , Rest.objChk(prd4, 'offer_discount') ? Rest.findFonts(prd4.offer_discount) : null ],
							['prd4_offer_txt'        , Rest.objChk(prd4, 'offer_text.box') ? Rest.findFonts(prd4.offer_text.box) : null ],

							['prd4_normal_name'        , Rest.objChk(prd4, 'normal.style.prd.info_name') ? Rest.findFonts(prd4.normal.style.prd.info_name) : null ],
							['prd4_normal_description' , Rest.objChk(prd4, 'normal.style.prd.info_description') ? Rest.findFonts(prd4.normal.style.prd.info_description) : null ],
							['prd4_normal_price_spl'   , Rest.objChk(prd4, 'normal.style.prd.price_spl') ? Rest.findFonts(prd4.normal.style.prd.price_spl) : null ],
							['prd4_normal_price_new'   , Rest.objChk(prd4, 'normal.style.prd.price_new') ? Rest.findFonts(prd4.normal.style.prd.price_new) : null ],
							['prd4_normal_cartbtn'     , Rest.objChk(prd4, 'normal.style.prd.cart.btn') ? Rest.findFonts(prd4.normal.style.prd.cart.btn) : null ],

							['prd4_grid_name'        , Rest.objChk(prd4, 'grid.style.prd.info_name') ? Rest.findFonts(prd4.grid.style.prd.info_name) : null ],
							['prd4_grid_description' , Rest.objChk(prd4, 'grid.style.prd.info_description') ? Rest.findFonts(prd4.grid.style.prd.info_description) : null ],
							['prd4_grid_price_spl'   , Rest.objChk(prd4, 'grid.style.prd.price_spl') ? Rest.findFonts(prd4.grid.style.prd.price_spl) : null ],
							['prd4_grid_price_new'   , Rest.objChk(prd4, 'grid.style.prd.price_new') ? Rest.findFonts(prd4.grid.style.prd.price_new) : null ],
							['prd4_grid_cartbtn'     , Rest.objChk(prd4, 'grid.style.prd.cart.btn') ? Rest.findFonts(prd4.grid.style.prd.cart.btn) : null ],

							['prd4_list_name'        , Rest.objChk(prd4, 'list.style.prd.info_name') ? Rest.findFonts(prd4.list.style.prd.info_name) : null ],
							['prd4_list_description' , Rest.objChk(prd4, 'list.style.prd.info_description') ? Rest.findFonts(prd4.list.style.prd.info_description) : null ],
							['prd4_list_price_spl'   , Rest.objChk(prd4, 'list.style.prd.price_spl') ? Rest.findFonts(prd4.list.style.prd.price_spl) : null ],
							['prd4_list_price_new'   , Rest.objChk(prd4, 'list.style.prd.price_new') ? Rest.findFonts(prd4.list.style.prd.price_new) : null ],
							['prd4_list_cartbtn'     , Rest.objChk(prd4, 'list.style.prd.cart.btn') ? Rest.findFonts(prd4.list.style.prd.cart.btn) : null ],
							
						]);
					break;
					case 'global_smallprdblocks':
						return _.object([
							['smallprd1_name'     , Rest.objChk($scope.themeData, 'smallprd1.prd.prdname') ? Rest.findFonts($scope.themeData.smallprd1.prd.prdname) : null ],
							['smallprd2_name'     , Rest.objChk($scope.themeData, 'smallprd2.prd.prdname') ? Rest.findFonts($scope.themeData.smallprd2.prd.prdname) : null ]
						]);
					break;

					case 'global_quickview':
						return _.object([
							['quickview_body'    , Rest.objChk($scope.themeData, 'body') ? Rest.findFonts($scope.themeData.body) : null ],
							['quickview_title'   , Rest.objChk($scope.themeData, 'title') ? Rest.findFonts($scope.themeData.title) : null ],
							['quickview_tb_item' , Rest.objChk($scope.themeData, 'tabs.item') ? Rest.findFonts($scope.themeData.tabs.item) : null ],
							['quickview_qty_lbl' , Rest.objChk($scope.themeData, 'prdpg_qty.qty_lbl') ? Rest.findFonts($scope.themeData.prdpg_qty.qty_lbl) : null ],
							['quickview_cart_btn' , Rest.objChk($scope.themeData, 'prdpg_qty.cart_btn') ? Rest.findFonts($scope.themeData.prdpg_qty.cart_btn) : null ],

							['quickview_price_spl'  , Rest.objChk($scope.themeData, 'price.price_spl') ? Rest.findFonts($scope.themeData.price.price_spl) : null ],
							['quickview_price_new'  , Rest.objChk($scope.themeData, 'price.price_new') ? Rest.findFonts($scope.themeData.price.price_new) : null ],
							['quickview_price_old'  , Rest.objChk($scope.themeData, 'price.price_old') ? Rest.findFonts($scope.themeData.price.price_old) : null ],
							['quickview_price_tax'  , Rest.objChk($scope.themeData, 'price.price_tax') ? Rest.findFonts($scope.themeData.price.price_tax) : null ],
						]);
					break;
				}
			}
			
			$scope.prdsettingscommon = function (prd){
				return {
					grid: {
						cart        : Rest.getVal(prd, 'grid.cart', true),
						wishlist    : Rest.getVal(prd, 'grid.wishlist', true),
						compare     : Rest.getVal(prd, 'grid.compare', true),
						more        : Rest.getVal(prd, 'grid.more', true),
						description : Rest.getVal(prd, 'grid.description', true),
						rating      : Rest.getVal(prd, 'grid.rating', true),
						price       : Rest.getVal(prd, 'grid.price', true),
						quickview   : Rest.getVal(prd, 'grid.quickview', true),
						tax         : Rest.getVal(prd, 'grid.tax', true)
					},
					list: {
						cart        : Rest.getVal(prd, 'list.cart', true),
						wishlist    : Rest.getVal(prd, 'list.wishlist', true),
						compare     : Rest.getVal(prd, 'list.compare', true),
						more        : Rest.getVal(prd, 'list.more', true),
						description : Rest.getVal(prd, 'list.description', true),
						rating      : Rest.getVal(prd, 'list.rating', true),
						price       : Rest.getVal(prd, 'list.price', true),
						quickview   : Rest.getVal(prd, 'list.quickview', true),
						tax         : Rest.getVal(prd, 'list.tax', true)
					},
					normal: {
						cart        : Rest.getVal(prd, 'normal.cart', true),
						wishlist    : Rest.getVal(prd, 'normal.wishlist', true),
						compare     : Rest.getVal(prd, 'normal.compare', true),
						more        : Rest.getVal(prd, 'normal.more', true),
						description : Rest.getVal(prd, 'normal.description', true),
						rating      : Rest.getVal(prd, 'normal.rating', true),
						price       : Rest.getVal(prd, 'normal.price', true),
						quickview   : Rest.getVal(prd, 'normal.quickview', true),
						tax         : Rest.getVal(prd, 'normal.tax', true)
					},
					common: {
						cart_ico_status    : Rest.getVal(prd, 'cart_ico.status', true),
						cart_ico_type      : Rest.getVal(prd, 'cart_ico.type', 'ico'),
						cart_ico           : Rest.getVal(prd, 'cart_ico.icon', 'glyphicon glyphicon-shopping-cart'),
						wish_ico_status    : Rest.getVal(prd, 'wish_ico.status', true),
						wish_ico_type      : Rest.getVal(prd, 'wish_ico.type', 'ico'),
						wish_ico           : Rest.getVal(prd, 'wish_ico.icon', 'fa fa-heart'),
						compare_ico_status : Rest.getVal(prd, 'compare_ico.status', true),
						compare_ico_type   : Rest.getVal(prd, 'compare_ico.type', 'ico'),
						compare_ico        : Rest.getVal(prd, 'compare_ico.icon', 'fa fa-retweet'),
						more_ico_status    : Rest.getVal(prd, 'more_ico.status', true),
						more_ico_type      : Rest.getVal(prd, 'more_ico.type', 'ico'),
						more_ico           : Rest.getVal(prd, 'more_ico.icon', 'fa fa-arrow-circle-o-right'),
						quickview_ico      : Rest.getVal(prd, 'quickview_ico.icon', 'fa fa-eye'),
						offer_tag          : Rest.getVal(prd, 'offer_tag', 'img'),
						offer_text         : Rest.getVal(prd, 'offer_text.text', 'Offer')
					}
				}
			}
			$scope.settingsObj = function (id) {

				switch(id) {
					case 'global_prdblocks':
						var prd1 = $scope.themeData.prd1;
						var prd2 = $scope.themeData.prd2;
						var prd3 = $scope.themeData.prd3;
						var prd4 = $scope.themeData.prd4;
						return {
							gb_prd1: $scope.prdsettingscommon(prd1),
							gb_prd2: $scope.prdsettingscommon(prd2),
							gb_prd3: $scope.prdsettingscommon(prd3),
							gb_prd4: $scope.prdsettingscommon(prd4)
						};
					break;

					case 'global_prdgirdpages':
						return {
							category: {
								prd_style : Rest.getVal($scope.themeData.category, 'prd_style', 1),
								gridview  : Rest.getVal($scope.themeData.category, 'gridview.classGroup', 'eq4 d-eq4 t-eq3 mxl-eq2 msm-eq2 mxs-eq1 gt20 mb20'),
								listview  : Rest.getVal($scope.themeData.category, 'listview.classGroup', 'eq1 gt0 mb20')
							},
							special: {
								prd_style : Rest.getVal($scope.themeData.special, 'prd_style', 1),
								gridview  : Rest.getVal($scope.themeData.special, 'gridview.classGroup', 'eq4 d-eq4 t-eq3 mxl-eq2 msm-eq2 mxs-eq1 gt20 mb20'),
								listview  : Rest.getVal($scope.themeData.special, 'listview.classGroup', 'eq1 gt0 mb20')
							},
							brand_info: {
								prd_style : Rest.getVal($scope.themeData.brand_info, 'prd_style', 1),
								gridview  : Rest.getVal($scope.themeData.brand_info, 'gridview.classGroup', 'eq4 d-eq4 t-eq3 mxl-eq2 msm-eq2 mxs-eq1 gt20 mb20'),
								listview  : Rest.getVal($scope.themeData.brand_info, 'listview.classGroup', 'eq1 gt0 mb20')
							},
							search: {
								prd_style : Rest.getVal($scope.themeData.search, 'prd_style', 1),
								gridview  : Rest.getVal($scope.themeData.search, 'gridview.classGroup', 'eq4 d-eq4 t-eq3 mxl-eq2 msm-eq2 mxs-eq1 gt20 mb20'),
								listview  : Rest.getVal($scope.themeData.search, 'listview.classGroup', 'eq1 gt0 mb20')
							}
						};
					break;

					case 'global_quickview':
						return {
							quickview: {
								cart_status        : Rest.getVal($scope.themeData, 'cart_status', true),
								wishlist_status    : Rest.getVal($scope.themeData, 'wishlist_status', true),
								compare_status     : Rest.getVal($scope.themeData, 'compare_status', true),
								rating_status      : Rest.getVal($scope.themeData, 'rating_status', true),
								price_status       : Rest.getVal($scope.themeData, 'price_status', true),
								tax_status         : Rest.getVal($scope.themeData, 'tax_status', true),
								options_status     : Rest.getVal($scope.themeData, 'options_status', true),
								description_status : Rest.getVal($scope.themeData, 'description_status', true),
								quickview_text     : Rest.getVal($scope.themeData, 'quickview_text', ''),
								moreinfo_text      : Rest.getVal($scope.themeData, 'moreinfo_text', ''),
								cart_icon          : Rest.getVal($scope.themeData, 'prdpg_qty.cart_icon.icon', 'glyphicon glyphicon-shopping-cart')
							}
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