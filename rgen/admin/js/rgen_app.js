(function(){
	'use strict';

	/* Other scripts
	================================================*/
	var offset = 400;
	$(window).scroll(function() {
		if ($(this).scrollTop() > offset) {
			$('.sticky-true').addClass('sticky');
		} else {
			$('.sticky-true').removeClass('sticky');
		}
	});

	$('.menu .sub-menu > ul > li').each(function() {
		if ($(this).children('.sub-menu').length > 0) {
			$(this).addClass('sub');
			$(this).children('a').append('<i class="fa fa-caret-right"></i>');
		};
	});

	$('.vm').each(function(){ $(this).children().addClass('vm-item'); });
	
	$('title').text('R.Gen - OpenCart Control Panel');

	/* App scripts
	================================================*/
	var rgen = angular.module('rgen', [
		//'ngRoute',
		'ngSanitize',
		'ngAnimate',
		'ui.bootstrap',
		'ui.router',
		'rgenDirectives',
		'rgenServices',
		'ui.tree',
		'oitozero.ngSweetAlert'
	]);

	rgen.config(['$urlRouterProvider', '$stateProvider', function($urlRouterProvider, $stateProvider) {

		$urlRouterProvider.otherwise('/home');
		$stateProvider
			
			/* Theme
			================================================*/
			// Home - Dashboard
			.state("home", { 
				url: "/home",
				templateUrl: tpl('layout/dashboard'),
				controller: 'dashboardController'
			})

			// Theme - General options
			.state("general", { 
				url: "/theme/general",
				templateUrl: tpl('theme/general'),
				controller: 'themeGeneral'
			})

			// Theme - Custom code
			.state("customcode", { 
				url: "/theme/customcode",
				templateUrl: tpl('theme/customcode'),
				controller: 'themeCustomcode'
			})

			// Theme - Default menu
			.state("ocmenu", { 
				url: "/theme/ocmenu",
				templateUrl: tpl('theme/ocmenu'),
				controller: 'themeOcmenu'
			})

			// Theme - General options
			.state("commoncomponents", { 
				url: "/theme/commoncomponents",
				templateUrl: tpl('theme/commoncomponents'),
				controller: 'themeCommoncomponents'
			})

			// Theme - Menu
			.state("module-menu", { 
				url: "/theme/menu",
				templateUrl: tpl('theme/menu'),
				controller: 'themeMenu'
			})

			// Theme - Basic slide show
			.state("module-basicslideshow", { 
				url: "/theme/basicslideshow",
				templateUrl: tpl('theme/basicslideshow'),
				controller: 'themeBasicslideshow'
			})

			// Theme - Basic banners
			.state("module-basicbanners", { 
				url: "/theme/basicbanners",
				templateUrl: tpl('theme/basicbanners'),
				controller: 'themeBasicbanners'
			})

			// Theme - Product groups
			.state("module-productgroups", { 
				url: "/theme/productgroups",
				templateUrl: tpl('theme/productgroups'),
				controller: 'themeProductgroups'
			})

			// Theme - Custom HTML
			.state("module-customhtml", { 
				url: "/theme/customhtml",
				templateUrl: tpl('theme/customhtml'),
				controller: 'themeCustomhtml'
			})

			// Theme - Top header
			.state("header", { 
				url: "/theme/header",
				templateUrl: tpl('theme/header'),
				controller: 'themeHeader'
					})
					.state("header.general", { 
						url: "/general",
						templateUrl: tpl('theme/header_general'),
						controller: 'themeHeaderGeneral'
					})
					.state("header.home", { 
						url: "/home",
						templateUrl: tpl('theme/header_home'),
						controller: 'themeHeaderData'
					})
					.state("header.inner", { 
						url: "/inner",
						templateUrl: tpl('theme/header_inner'),
						controller: 'themeHeaderData'
					})

			// Theme - Default footer
			.state("footer", { 
				url: "/theme/footer",
				templateUrl: tpl('theme/footer'),
				controller: 'themeFooter'
			})

			// Product blocks
			.state("prdblocks", { 
				url: "/theme/prdblocks",
				templateUrl: tpl('theme/prdblocks'),
				controller: 'themePrdblocks'
			})

			/* Theme - OpenCart modules
			================================================*/
			// Featured
			.state("oc-module-featured", { 
				url: "/theme/oc-modules/featured",
				templateUrl: tpl('theme/ocmod_featured'),
				controller: 'themeOcmodFeatured'
			})
			// Latest
			.state("oc-module-latest", { 
				url: "/theme/oc-modules/latest",
				templateUrl: tpl('theme/ocmod_latest'),
				controller: 'themeOcmodLatest'
			})
			// Best seller
			.state("oc-module-best", { 
				url: "/theme/oc-modules/best",
				templateUrl: tpl('theme/ocmod_best'),
				controller: 'themeOcmodBest'
			})
			// Special offer
			.state("oc-module-special", { 
				url: "/theme/oc-modules/special",
				templateUrl: tpl('theme/ocmod_special'),
				controller: 'themeOcmodSpecial'
			})
			// Slide show
			.state("oc-module-slideshow", { 
				url: "/theme/oc-modules/slideshow",
				templateUrl: tpl('theme/ocmod_slideshow'),
				controller: 'themeOcmodSlideshow'
			})
			// Category and My account
			.state("oc-module-cataccount", { 
				url: "/theme/oc-modules/cataccount",
				templateUrl: tpl('theme/ocmod_cataccount'),
				controller: 'themeOcmodCatAccount'
			})
			// Banners
			.state("oc-module-banners", { 
				url: "/theme/oc-modules/banners",
				templateUrl: tpl('theme/ocmod_banners'),
				controller: 'themeOcmodBanners'
			})
			
			/* Theme - Pages
			================================================*/
			// Page - Category
			.state("page-category", { 
				url: "/theme/page/category",
				templateUrl: tpl('theme/page_category'),
				controller: 'themePageCategory'
			})

			// Page - Product
			.state("page-product", { 
				url: "/theme/page/product",
				templateUrl: tpl('theme/page_product'),
				controller: 'themePageProduct'
			})

			// Page - Shopping cart
			.state("page-shoppingcart", { 
				url: "/theme/page/shoppingcart",
				templateUrl: tpl('theme/page_shoppingcart'),
				controller: 'themePageShoppingcart'
			})

			// Page - Checkout
			.state("page-checkout", { 
				url: "/theme/page/checkout",
				templateUrl: tpl('theme/page_checkout'),
				controller: 'themePageCheckout'
			})

			// Page - Other
			.state("page-other", { 
				url: "/theme/page/other",
				templateUrl: tpl('theme/page_other'),
				controller: 'themeOtherPages'
			})



			/* Modules
			================================================*/
			// Menu
			.state("mod_menu", { 
				url: "/module/menu",
				templateUrl: tpl('modules/menu'),
				controller: 'moduleMenu'
					})
					.state("mod_menu.assign", { 
						url: "/assign",
						templateUrl: tpl('modules/menu/menu_assign'),
						controller: 'moduleMenuAssign'
					})
					.state("mod_menu.manage", { 
						url: "/manage",
						templateUrl: tpl('modules/menu/menu_manage'),
						controller: 'moduleMenuData'
					})
					.state("mod_menu.customize", { 
						url: "/customize",
						templateUrl: tpl('modules/menu/customize'),
						controller: 'moduleMenuCustomize'
					})

			// Basic slide show
			.state("mod_basicslideshow", { 
				url: "/module/basicslideshow",
				templateUrl: tpl('modules/basicslideshow'),
				controller: 'moduleBasicslideshow'
					})
					.state("mod_basicslideshow.assign", { 
						url: "/assign",
						templateUrl: tpl('modules/basicslideshow/assign'),
						controller: 'moduleBasicslideshowAssign'
					})
					.state("mod_basicslideshow.manage", { 
						url: "/manage",
						templateUrl: tpl('modules/basicslideshow/manage'),
						controller: 'moduleBasicslideshowData'
					})
					.state("mod_basicslideshow.customize", { 
						url: "/customize",
						templateUrl: tpl('modules/basicslideshow/customize'),
						controller: 'moduleBasicslideshowCustomize'
					})

			// Basic banners
			.state("mod_basicbanners", { 
				url: "/module/basicbanners",
				templateUrl: tpl('modules/basicbanners'),
				controller: 'moduleBasicbanners'
					})
					.state("mod_basicbanners.assign", { 
						url: "/assign",
						templateUrl: tpl('modules/basicbanners/assign'),
						controller: 'moduleBasicbannersAssign'
					})
					.state("mod_basicbanners.manage", { 
						url: "/manage",
						templateUrl: tpl('modules/basicbanners/manage'),
						controller: 'moduleBasicbannersData'
					})
					.state("mod_basicbanners.customize", { 
						url: "/customize",
						templateUrl: tpl('modules/basicbanners/customize'),
						controller: 'moduleBasicbannersCustomize'
					})

			// Product groups
			.state("mod_productgroups", { 
				url: "/module/productgroups",
				templateUrl: tpl('modules/productgroups'),
				controller: 'moduleProductgroups'
					})
					.state("mod_productgroups.assign", { 
						url: "/assign",
						templateUrl: tpl('modules/productgroups/assign'),
						controller: 'moduleProductgroupsAssign'
					})
					.state("mod_productgroups.manage", { 
						url: "/manage",
						templateUrl: tpl('modules/productgroups/manage'),
						controller: 'moduleProductgroupsData'
					})
					.state("mod_productgroups.customize", { 
						url: "/customize",
						templateUrl: tpl('modules/productgroups/customize'),
						controller: 'moduleProductgroupsCustomize'
					})

			// Custom HTML
			.state("mod_customhtml", { 
				url: "/module/customhtml",
				templateUrl: tpl('modules/customhtml'),
				controller: 'moduleCustomhtml'
					})
					.state("mod_customhtml.assign", { 
						url: "/assign",
						templateUrl: tpl('modules/customhtml/assign'),
						controller: 'moduleCustomhtmlAssign'
					})
					.state("mod_customhtml.manage", { 
						url: "/manage",
						templateUrl: tpl('modules/customhtml/manage'),
						controller: 'moduleCustomhtmlData'
					})
					.state("mod_customhtml.customize", { 
						url: "/customize",
						templateUrl: tpl('modules/customhtml/customize'),
						controller: 'moduleCustomhtmlCustomize'
					})

			// Content blocks
			.state("mod_contentblocks", { 
				url: "/module/contentblocks",
				templateUrl: tpl('modules/contentblocks'),
				controller: 'moduleContentblocks'
					})
					.state("mod_contentblocks.assign", { 
						url: "/assign",
						templateUrl: tpl('modules/contentblocks/assign'),
						controller: 'moduleContentblocksAssign'
					})
					.state("mod_contentblocks.manage", { 
						url: "/manage",
						templateUrl: tpl('modules/contentblocks/manage'),
						controller: 'moduleContentblocksData'
					})
					.state("mod_contentblocks.customize", { 
						url: "/customize",
						templateUrl: tpl('modules/contentblocks/customize'),
						controller: 'moduleContentblocksCustomize'
					})

			// Revo slider
			.state("mod_revslider", { 
				url: "/module/revslider",
				templateUrl: tpl('modules/revslider'),
				controller: 'moduleRevslider'
					})
					.state("mod_revslider.assign", { 
						url: "/assign",
						templateUrl: tpl('modules/revslider/assign'),
						controller: 'moduleRevsliderAssign'
					})
					.state("mod_revslider.manage", { 
						url: "/manage",
						templateUrl: tpl('modules/revslider/manage'),
						controller: 'moduleRevsliderData'
					})
					.state("mod_revslider.customize", { 
						url: "/customize",
						templateUrl: tpl('modules/revslider/customize'),
						controller: 'moduleRevsliderCustomize'
					})

			// Banner grids
			.state("mod_bannergrids", { 
				url: "/module/bannergrids",
				templateUrl: tpl('modules/bannergrids'),
				controller: 'moduleBannergrids'
					})
					.state("mod_bannergrids.assign", { 
						url: "/assign",
						templateUrl: tpl('modules/bannergrids/assign'),
						controller: 'moduleBannergridsAssign'
					})
					.state("mod_bannergrids.manage", { 
						url: "/manage",
						templateUrl: tpl('modules/bannergrids/manage'),
						controller: 'moduleBannergridsData'
					})
					.state("mod_bannergrids.customize", { 
						url: "/customize",
						templateUrl: tpl('modules/bannergrids/customize'),
						controller: 'moduleBannergridsCustomize'
					})

			// Image gallery
			.state("mod_imagegallery", { 
				url: "/module/imagegallery",
				templateUrl: tpl('modules/imagegallery'),
				controller: 'moduleImagegallery'
					})
					.state("mod_imagegallery.assign", { 
						url: "/assign",
						templateUrl: tpl('modules/imagegallery/assign'),
						controller: 'moduleImagegalleryAssign'
					})
					.state("mod_imagegallery.manage", { 
						url: "/manage",
						templateUrl: tpl('modules/imagegallery/manage'),
						controller: 'moduleImagegalleryData'
					})
					.state("mod_imagegallery.customize", { 
						url: "/customize",
						templateUrl: tpl('modules/imagegallery/customize'),
						controller: 'moduleImagegalleryCustomize'
					})

			// Grid manager
			.state("mod_gridmanager", { 
				url: "/module/gridmanager",
				templateUrl: tpl('modules/gridmanager'),
				controller: 'moduleGridmanager'
					})
					.state("mod_gridmanager.assign", { 
						url: "/assign",
						templateUrl: tpl('modules/gridmanager/assign'),
						controller: 'moduleGridmanagerAssign'
					})
					.state("mod_gridmanager.manage", { 
						url: "/manage",
						templateUrl: tpl('modules/gridmanager/manage'),
						controller: 'moduleGridmanagerData'
					})
					.state("mod_gridmanager.customize", { 
						url: "/customize",
						templateUrl: tpl('modules/gridmanager/customize'),
						controller: 'moduleGridmanagerCustomize'
					})

			// Product page - Custom HTML
			.state("mod_prdpghtml", { 
				url: "/module/prdpghtml",
				templateUrl: tpl('modules/prdpghtml'),
				controller: 'modulePrdpghtml'
					})
					.state("mod_prdpghtml.assign", { 
						url: "/assign",
						templateUrl: tpl('modules/prdpghtml/assign'),
						controller: 'modulePrdpghtmlAssign'
					})
					.state("mod_prdpghtml.manage", { 
						url: "/manage",
						templateUrl: tpl('modules/prdpghtml/manage'),
						controller: 'modulePrdpghtmlData'
					})
					.state("mod_prdpghtml.customize", { 
						url: "/customize",
						templateUrl: tpl('modules/prdpghtml/customize'),
						controller: 'modulePrdpghtmlCustomize'
					})

			// Product page - Custom tabs
			.state("mod_prdpgtabs", { 
				url: "/module/prdpgtabs",
				templateUrl: tpl('modules/prdpgtabs'),
				controller: 'modulePrdpgtabs'
					})
					.state("mod_prdpgtabs.assign", { 
						url: "/assign",
						templateUrl: tpl('modules/prdpgtabs/assign'),
						controller: 'modulePrdpgtabsAssign'
					})
					.state("mod_prdpgtabs.manage", { 
						url: "/manage",
						templateUrl: tpl('modules/prdpgtabs/manage'),
						controller: 'modulePrdpgtabsData'
					})

			// Sticky HTML
			.state("mod_stickyhtml", { 
				url: "/module/stickyhtml",
				templateUrl: tpl('modules/stickyhtml'),
				controller: 'moduleStickyhtml'
					})
					.state("mod_stickyhtml.assign", { 
						url: "/assign",
						templateUrl: tpl('modules/stickyhtml/assign'),
						controller: 'moduleStickyhtmlAssign'
					})
					.state("mod_stickyhtml.manage", { 
						url: "/manage",
						templateUrl: tpl('modules/stickyhtml/manage'),
						controller: 'moduleStickyhtmlData'
					})
					.state("mod_stickyhtml.customize", { 
						url: "/customize",
						templateUrl: tpl('modules/stickyhtml/customize'),
						controller: 'moduleStickyhtmlCustomize'
					})

			// Category show case
			.state("mod_catshowcase", { 
				url: "/module/catshowcase",
				templateUrl: tpl('modules/catshowcase'),
				controller: 'moduleCatshowcase'
					})
					.state("mod_catshowcase.assign", { 
						url: "/assign",
						templateUrl: tpl('modules/catshowcase/assign'),
						controller: 'moduleCatshowcaseAssign'
					})
					.state("mod_catshowcase.manage", { 
						url: "/manage",
						templateUrl: tpl('modules/catshowcase/manage'),
						controller: 'moduleCatshowcaseData'
					})
					.state("mod_catshowcase.customize", { 
						url: "/customize",
						templateUrl: tpl('modules/catshowcase/customize'),
						controller: 'moduleCatshowcaseCustomize'
					})

			// Deals
			.state("mod_deals", { 
				url: "/module/deals",
				templateUrl: tpl('modules/deals'),
				controller: 'moduleDeals'
					})
					.state("mod_deals.assign", { 
						url: "/assign",
						templateUrl: tpl('modules/deals/assign'),
						controller: 'moduleDealsAssign'
					})
					.state("mod_deals.manage", { 
						url: "/manage",
						templateUrl: tpl('modules/deals/manage'),
						controller: 'moduleDealsData'
					})
					.state("mod_deals.customize", { 
						url: "/customize",
						templateUrl: tpl('modules/deals/customize'),
						controller: 'moduleDealsCustomize'
					})

			/* System - modules
			================================================*/
			// Backup restore
			.state("sys-backuprestore", { 
				url: "/system/backuprestore",
				templateUrl: tpl('system/backup_restore'),
				controller: 'systemBackuprestore'
			})

			// Optimization
			.state("sys-optimization", { 
				url: "/system/optimization",
				templateUrl: tpl('system/optimization'),
				controller: 'systemOptimization'
			})

	}]);

	rgen.run(['$rootScope', '$modal', 'Rest', function($rootScope, $modal, Rest){
		$rootScope.url_prefix = rgen_config.url_prefix;
	}]);

})();
