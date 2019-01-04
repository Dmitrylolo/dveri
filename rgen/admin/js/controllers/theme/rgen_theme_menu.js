(function(){
	'use strict';

	angular.module('rgen').controller('themeMenu', [
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
				section  : 'menu',
				suffix   : '',
				type     : 'manage'
			}
			
			// Default parameters
			$scope.modType    = 'new';
			$scope.modId      = null;
			$scope.themeData  = {};
			$scope.namePrefix = 'Menu';
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
					menubar: {},
					menuitem: {
						wrapper: {},
						link: { 
							font_color: {
								normal: '#434444',
								hover: '#ffffff'
							},
							background: {
								normal: '#ffffff',
								hover: '#ed5f79'
							},
							f_size: '16px',
							text_align: 'center'
						}
					},
					flyoutmenu: new $scope.flyout(),
					megamenu: {
						wrapper: {},
						normalmenu: {
							block: {},
							heading: {},
							links: {}
						},
						catblock1: {
							block: {},
							heading: {},
							links: {}
						},
						catblock2: {
							block: {},
							image: {},
							heading: {},
							links: {}
						},
						prdblock1: {
							block: {},
							linktext: {
								normal: '',
								hover: ''
							},
							price: '',
							button: {}
						},
						prdblock2: {
							block: {},
							linktext: {
								normal: '',
								hover: ''
							},
							price: '',
							button: {}
						},
						brandblock1: {
							block: {
								normal: {},
								hover: {}
							},
							linktext: {
								normal: {},
								hover: {}
							}
						},
						brandblock2: {
							block: {},
							hover: {
								background: "",
								textcolor: ""
							}
						},
						imageblock1: {
							block: {
								normal: {},
								hover: {}
							},
							linktext: {
								normal: {},
								hover: {}
							}
						},
						imageblock2: {
							block: {},
							hover: {
								background: "",
								textcolor: ""
							}
						},
						imageblock3: {
							block: {
								normal: {},
								hover: {}
							},
							linktext: {
								normal: {},
								hover: {}
							}
						},
						imageblock4: {
							block: {}
						},
						infoblock1: {
							block: {},
							image: {},
							heading: {},
							content: {},
							button_wrp: {},
							button: {}
						},
						infoblock2: {
							block: {},
							image: {},
							heading: {},
							content: {},
							button_wrp: {},
							button: {}
						},
						infoblock3: {
							block: {},
							image: {},
							heading: {},
							content: {},
							button_wrp: {},
							button: {}
						},
						infoblock4: {
							block: {},
							image: {},
							heading: {},
							content: {},
							button: {}
						},
						customhtml: {
							block: {}
						}
					},
					m_handle: {},
					m_subhandle: {},
					m_nav: {},
					m_subwrp: {},
					m_mainitem: {},
					m_subitem: {}
				}
			}

			$scope.item_type = [
				{ label:'Normal'      , val:'normal' },
				{ label:'Category'    , val:'cat' },
				{ label:'Products'    , val:'prd' },
				{ label:'Brands'      , val:'brand' },
				{ label:'Image'       , val:'bannerimg' },
				{ label:'Info boxes'  , val:'infobox' },
				{ label:'Custom HTML' , val:'customhtml' }
			];
			
			$scope.tpl = {
				mg_normal     : tpl('theme/menu/normal'),
				mg_cat        : tpl('theme/menu/cat'),
				mg_prd        : tpl('theme/menu/prd'),
				mg_brand      : tpl('theme/menu/brand'),
				mg_bannerimg  : tpl('theme/menu/bannerimg'),
				mg_infobox    : tpl('theme/menu/infobox'),
				mg_customhtml : tpl('theme/menu/customhtml')
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
					case 'fullmenu':
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
					[$scope.modId+'.menuitem'   , Rest.objChk($scope.themeData, 'menuitem.link') ? Rest.findFonts($scope.themeData.menuitem.link) : null ],
					[$scope.modId+'.flyout'     , Rest.objChk($scope.themeData, 'flyoutmenu.link') ? Rest.findFonts($scope.themeData.flyoutmenu.link) : null ],
					[$scope.modId+'.normalhd'   , Rest.objChk($scope.themeData, 'megamenu.normalmenu.heading') ? Rest.findFonts($scope.themeData.megamenu.normalmenu.heading) : null ],
					[$scope.modId+'.normallink' , Rest.objChk($scope.themeData, 'megamenu.normalmenu.links') ? Rest.findFonts($scope.themeData.megamenu.normalmenu.links) : null ],
					[$scope.modId+'.cat1hd'     , Rest.objChk($scope.themeData, 'megamenu.catblock1.heading') ? Rest.findFonts($scope.themeData.megamenu.catblock1.heading) : null ],
					[$scope.modId+'.cat1links'  , Rest.objChk($scope.themeData, 'megamenu.catblock1.links') ? Rest.findFonts($scope.themeData.megamenu.catblock1.links) : null ],
					[$scope.modId+'.cat2hd'     , Rest.objChk($scope.themeData, 'megamenu.catblock2.heading') ? Rest.findFonts($scope.themeData.megamenu.catblock2.heading) : null ],
					[$scope.modId+'.cat2links'  , Rest.objChk($scope.themeData, 'megamenu.catblock2.links') ? Rest.findFonts($scope.themeData.megamenu.catblock2.links) : null ],
					[$scope.modId+'.prd1btn'    , Rest.objChk($scope.themeData, 'megamenu.prdblock1.button') ? Rest.findFonts($scope.themeData.megamenu.prdblock1.button) : null ],
					[$scope.modId+'.prd2btn'    , Rest.objChk($scope.themeData, 'megamenu.prdblock2.button') ? Rest.findFonts($scope.themeData.megamenu.prdblock2.button) : null ],
					[$scope.modId+'.brd1'       , Rest.objChk($scope.themeData, 'megamenu.brandblock1.linktext.normal') ? Rest.findFonts($scope.themeData.megamenu.brandblock1.linktext.normal) : null ],
					[$scope.modId+'.img1'       , Rest.objChk($scope.themeData, 'megamenu.imageblock1.linktext.normal') ? Rest.findFonts($scope.themeData.megamenu.imageblock1.linktext.normal) : null ],
					[$scope.modId+'.img3'       , Rest.objChk($scope.themeData, 'megamenu.imageblock3.linktext.normal') ? Rest.findFonts($scope.themeData.megamenu.imageblock3.linktext.normal) : null ],
					[$scope.modId+'.infobox1hd' , Rest.objChk($scope.themeData, 'megamenu.infoblock1.heading') ? Rest.findFonts($scope.themeData.megamenu.infoblock1.heading) : null ],
					[$scope.modId+'.infobox1bt' , Rest.objChk($scope.themeData, 'megamenu.infoblock1.button') ? Rest.findFonts($scope.themeData.megamenu.infoblock1.button) : null ],
					[$scope.modId+'.infobox2hd' , Rest.objChk($scope.themeData, 'megamenu.infoblock2.heading') ? Rest.findFonts($scope.themeData.megamenu.infoblock2.heading) : null ],
					[$scope.modId+'.infobox2bt' , Rest.objChk($scope.themeData, 'megamenu.infoblock2.button') ? Rest.findFonts($scope.themeData.megamenu.infoblock2.button) : null ],
					[$scope.modId+'.infobox3hd' , Rest.objChk($scope.themeData, 'megamenu.infoblock3.heading') ? Rest.findFonts($scope.themeData.megamenu.infoblock3.heading) : null ],
					[$scope.modId+'.infobox3bt' , Rest.objChk($scope.themeData, 'megamenu.infoblock3.button') ? Rest.findFonts($scope.themeData.megamenu.infoblock3.button) : null ],
					[$scope.modId+'.infobox4hd' , Rest.objChk($scope.themeData, 'megamenu.infoblock4.heading') ? Rest.findFonts($scope.themeData.megamenu.infoblock4.heading) : null ],
					[$scope.modId+'.infobox4bt' , Rest.objChk($scope.themeData, 'megamenu.infoblock4.button') ? Rest.findFonts($scope.themeData.megamenu.infoblock4.button) : null ],
					[$scope.modId+'.customhtml' , Rest.objChk($scope.themeData, 'megamenu.customhtml.block') ? Rest.findFonts($scope.themeData.megamenu.customhtml.block) : null ]

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