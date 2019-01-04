<?php 
class ControllerRgenSettings extends Controller {
	public function index() {
		
		$storage      = $this->rgen->storage;
		$rgenSettings = $this->rgen->rgenSettings;
		$factory      = $this->rgen->factory;
		$rgenConfig   = $storage->getfull('settings_data');
		$route        = isset($this->registry->get('request')->get['route']) ? $this->registry->get('request')->get['route'] : 'common/home';
		
		/* Product blocks default data
		------------------------*/
		$gb_prd_default = array (
			'grid' => array (
				'cart'        => true,
				'wishlist'    => true,
				'compare'     => true,
				'more'        => true,
				'description' => true,
				'rating'      => true,
				'price'       => true,
				'quickview'   => true,
				'tax'         => true
			),
			'list' => array (
				'cart'        => true,
				'wishlist'    => true,
				'compare'     => true,
				'more'        => true,
				'description' => true,
				'rating'      => true,
				'price'       => true,
				'quickview'   => true,
				'tax'         => true
			),
			'normal' => array (
				'cart'        => true,
				'wishlist'    => true,
				'compare'     => true,
				'more'        => true,
				'description' => true,
				'rating'      => true,
				'price'       => true,
				'quickview'   => true,
				'tax'         => true
			),
			'common' => array (
				'cart_ico_status'    => true,
				'cart_ico_type'      => 'ico',
				'cart_ico'           => 'glyphicon glyphicon-shopping-cart',
				'wish_ico_status'    => true,
				'wish_ico_type'      => 'ico',
				'wish_ico'           => 'fa fa-heart',
				'compare_ico_status' => true,
				'compare_ico_type'   => 'ico',
				'compare_ico'        => 'fa fa-retweet',
				'more_ico_status'    => true,
				'more_ico_type'      => 'ico',
				'more_ico'           => 'fa fa-arrow-circle-o-right',
				'quickview_ico'      => 'fa fa-eye',
				'offer_tag'          => 'img',
				'offer_text'         => 'Offer'
			)
		);
		if (isset($rgenConfig['rgen_prdblocks']['gb_prd1'])) {
			foreach ($rgenConfig['rgen_prdblocks']['gb_prd1'] as $key => $value) {
				$gb_prd1_new[$key] = __::defaults($rgenConfig['rgen_prdblocks']['gb_prd1'][$key], $gb_prd_default[$key]);
			}
		}
		if (isset($rgenConfig['rgen_prdblocks']['gb_prd2'])) {
			foreach ($rgenConfig['rgen_prdblocks']['gb_prd2'] as $key => $value) {
				$gb_prd2_new[$key] = __::defaults($rgenConfig['rgen_prdblocks']['gb_prd2'][$key], $gb_prd_default[$key]);
			}
		}
		if (isset($rgenConfig['rgen_prdblocks']['gb_prd3'])) {
			foreach ($rgenConfig['rgen_prdblocks']['gb_prd3'] as $key => $value) {
				$gb_prd3_new[$key] = __::defaults($rgenConfig['rgen_prdblocks']['gb_prd3'][$key], $gb_prd_default[$key]);
			}
		}
		if (isset($rgenConfig['rgen_prdblocks']['gb_prd4'])) {
			foreach ($rgenConfig['rgen_prdblocks']['gb_prd4'] as $key => $value) {
				$gb_prd4_new[$key] = __::defaults($rgenConfig['rgen_prdblocks']['gb_prd4'][$key], $gb_prd_default[$key]);
			}
		}

		/* Top bar
		------------------------*/
		$topbar1_general = array(
			'logo_in_menu'    => 'y',
			'logo_w'          => 190,
			'logo_position'   => 'l',
			'cart_link'       => true,
			'checkout_link'   => true,
			'wishlist'        => true,
			'myaccount'       => true,
			'myaccount_icon'  => 'fa fa-user',
			'cart'            => true,
			'cart_icon'       => 'glyphicon glyphicon-shopping-cart',
			'search'          => true,
			'currency'        => true,
			'language'        => true,
			'customlinks'     => true,
			'customlink_data' => array()
		);
		$topbar2_general = array(
			'logo_in_menu'    => 'y',
			'logo_w'          => 190,
			'logo_position'   => 'l',
			'cart_link'       => true,
			'checkout_link'   => true,
			'wishlist'        => true,
			'myaccount'       => true,
			'myaccount_icon'  => 'fa fa-user',
			'cart'            => true,
			'cart_icon'       => 'glyphicon glyphicon-shopping-cart',
			'search'          => true,
			'currency'        => true,
			'language'        => true,
			'customlinks'     => true,
			'customlink_data' => array()
		);

		/* Footer contact info defaults
		------------------------*/
		$ft_ph = array (
			'status'    => true,
			'ph1'       => '',
			'ph2'       => '',
			'icon_type' => 'ico',
			'icon'      => 'fa fa-phone'
		);
		isset($rgenConfig['rgen_footer']['default_ft_ph']) ? 
		$new_ft_ph = __::defaults($rgenConfig['rgen_footer']['default_ft_ph'], $ft_ph) : 
		$new_ft_ph = $ft_ph;

		$ft_fax = array (
			'status'    => true,
			'fax1'      => '',
			'fax2'      => '',
			'icon_type' => 'ico',
			'icon'      => 'fa fa-fax'
		);
		isset($rgenConfig['rgen_footer']['default_ft_fax']) ? 
		$new_ft_fax = __::defaults($rgenConfig['rgen_footer']['default_ft_fax'], $ft_fax) : 
		$new_ft_fax = $ft_fax;

		$ft_mail = array (
			'status'    => true,
			'text'      => '',
			'email'     => '',
			'icon_type' => 'ico',
			'icon'      => 'fa fa-envelope'
		);
		isset($rgenConfig['rgen_footer']['default_ft_mail']) ? 
		$new_ft_mail = __::defaults($rgenConfig['rgen_footer']['default_ft_mail'], $ft_mail) : 
		$new_ft_mail = $ft_mail;


		/* Product grid default data
		------------------------*/
		$prdgrid_default = array(
			'prd_style' => true,
			'gridview'  => 'eq4 d-eq4 t-eq3 mxl-eq2 msm-eq2 mxs-eq1 gt20 mb20',
			'listview'  => 'eq1 gt0 mb20'
		);

		/* OC slideshow default data
		------------------------*/
		$ocmod_slideshow_default = array(
			'speed'          => 450,
			'interval'       => 4000,
			'loop'           => true,
			'autoplay'       => true,
			'autoplay_hover' => true,
			'animateOut'     => 'fadeOut',
			'animateIn'      => 'fadeIn',
			'arrow'          => true,
			'dots'           => true,
			'dot_style'      => 1
		);
		
		/* System - Optimization
		------------------------*/
		$optimization = $factory->node($rgenConfig, 'rgen_optimization/system_optimization', 0, 0);


		$configData = array(
			
			/* Language data
			------------------------*/
			'language_data' => $storage->getfull('language_data'),
			'lng'           => $this->config->get('config_language_id'),
			
			/* General settings
			------------------------*/
			'wide_status'       => isset($rgenConfig['rgen_general']['wide_status']) ? $rgenConfig['rgen_general']['wide_status'] : true,
			'responsive_status' => isset($rgenConfig['rgen_general']['responsive_status']) ? $rgenConfig['rgen_general']['responsive_status'] : true,
			'layout_width'      => isset($rgenConfig['rgen_general']['layout_width']) ? $rgenConfig['rgen_general']['layout_width'] : 'bx',
			'wide_class'        => isset($rgenConfig['rgen_general']['layout_width']) && $rgenConfig['rgen_general']['layout_width'] == 'fw' ? ' fw' : '',

			/* Custom codes
			------------------------*/
			'css_status'     => isset($rgenConfig['rgen_customcode']['css_status']) ? $rgenConfig['rgen_customcode']['css_status'] : false,
			'js_status'      => isset($rgenConfig['rgen_customcode']['js_status']) ? $rgenConfig['rgen_customcode']['js_status'] : false,
			'cssfile_status' => isset($rgenConfig['rgen_customcode']['cssfile_status']) ? $rgenConfig['rgen_customcode']['cssfile_status'] : false,
			'jsfile_status'  => isset($rgenConfig['rgen_customcode']['jsfile_status']) ? $rgenConfig['rgen_customcode']['jsfile_status'] : false,
			
			'csscode'        => isset($rgenConfig['rgen_customcode']['csscode']) ? $rgenConfig['rgen_customcode']['csscode'] : '',
			'jscode'         => isset($rgenConfig['rgen_customcode']['jscode']) ? $rgenConfig['rgen_customcode']['jscode'] : '',
			'cssfiles'       => isset($rgenConfig['rgen_customcode']['cssfiles']) ? $rgenConfig['rgen_customcode']['cssfiles'] : array(),
			'jsfiles'        => isset($rgenConfig['rgen_customcode']['jsfiles']) ? $rgenConfig['rgen_customcode']['jsfiles'] : array(),
			
			/* Common components
			------------------------*/
			'page_hd_style'   => isset($rgenConfig['rgen_commoncomponents']['page_hd_style']) ? $rgenConfig['rgen_commoncomponents']['page_hd_style'] : 1,
			'page_hd_pos'     => isset($rgenConfig['rgen_commoncomponents']['page_hd_pos']) ? $rgenConfig['rgen_commoncomponents']['page_hd_pos'] : 'in',
			'breadcrumb_home' => isset($rgenConfig['rgen_commoncomponents']['breadcrumb_home']) ? $rgenConfig['rgen_commoncomponents']['breadcrumb_home'] : 'lnk',
			'scroll_top_icon' => isset($rgenConfig['rgen_commoncomponents']['scroll_top_icon']) ? $rgenConfig['rgen_commoncomponents']['scroll_top_icon'] : 'fa fa-chevron-up',

			/* Product blocks
			------------------------*/
			'gb_prd1' => isset($rgenConfig['rgen_prdblocks']['gb_prd1']) ? $gb_prd1_new : $gb_prd_default,
			'gb_prd2' => isset($rgenConfig['rgen_prdblocks']['gb_prd2']) ? $gb_prd2_new : $gb_prd_default,
			'gb_prd3' => isset($rgenConfig['rgen_prdblocks']['gb_prd3']) ? $gb_prd3_new : $gb_prd_default,
			'gb_prd4' => isset($rgenConfig['rgen_prdblocks']['gb_prd4']) ? $gb_prd4_new : $gb_prd_default,
			
			'category_prd' => array(
				'prd_style' => isset($rgenConfig['rgen_prdblocks']['category']['prd_style']) ? $rgenConfig['rgen_prdblocks']['category']['prd_style'] : $prdgrid_default['prd_style'],
				'gridview'  => isset($rgenConfig['rgen_prdblocks']['category']['gridview']) ? $rgenConfig['rgen_prdblocks']['category']['gridview'] : $prdgrid_default['gridview'],
				'listview'  => isset($rgenConfig['rgen_prdblocks']['category']['listview']) ? $rgenConfig['rgen_prdblocks']['category']['listview'] : $prdgrid_default['listview']
			),
			'special_prd' => array(
				'prd_style' => isset($rgenConfig['rgen_prdblocks']['special']['prd_style']) ? $rgenConfig['rgen_prdblocks']['special']['prd_style'] : $prdgrid_default['prd_style'],
				'gridview'  => isset($rgenConfig['rgen_prdblocks']['special']['gridview']) ? $rgenConfig['rgen_prdblocks']['special']['gridview'] : $prdgrid_default['gridview'],
				'listview'  => isset($rgenConfig['rgen_prdblocks']['special']['listview']) ? $rgenConfig['rgen_prdblocks']['special']['listview'] : $prdgrid_default['listview']
			),
			'brand_prd' => array(
				'prd_style' => isset($rgenConfig['rgen_prdblocks']['brand_info']['prd_style']) ? $rgenConfig['rgen_prdblocks']['brand_info']['prd_style'] : $prdgrid_default['prd_style'],
				'gridview'  => isset($rgenConfig['rgen_prdblocks']['brand_info']['gridview']) ? $rgenConfig['rgen_prdblocks']['brand_info']['gridview'] : $prdgrid_default['gridview'],
				'listview'  => isset($rgenConfig['rgen_prdblocks']['brand_info']['listview']) ? $rgenConfig['rgen_prdblocks']['brand_info']['listview'] : $prdgrid_default['listview']
			),
			'search_prd' => array(
				'prd_style' => isset($rgenConfig['rgen_prdblocks']['search']['prd_style']) ? $rgenConfig['rgen_prdblocks']['search']['prd_style'] : $prdgrid_default['prd_style'],
				'gridview'  => isset($rgenConfig['rgen_prdblocks']['search']['gridview']) ? $rgenConfig['rgen_prdblocks']['search']['gridview'] : $prdgrid_default['gridview'],
				'listview'  => isset($rgenConfig['rgen_prdblocks']['search']['listview']) ? $rgenConfig['rgen_prdblocks']['search']['listview'] : $prdgrid_default['listview']
			),
			'quickview' => array(
				'cart_status'        => isset($rgenConfig['rgen_prdblocks']['quickview']['cart_status']) ? $rgenConfig['rgen_prdblocks']['quickview']['cart_status'] : true,
				'wishlist_status'    => isset($rgenConfig['rgen_prdblocks']['quickview']['wishlist_status']) ? $rgenConfig['rgen_prdblocks']['quickview']['wishlist_status'] : true,
				'compare_status'     => isset($rgenConfig['rgen_prdblocks']['quickview']['compare_status']) ? $rgenConfig['rgen_prdblocks']['quickview']['compare_status'] : true,
				'rating_status'      => isset($rgenConfig['rgen_prdblocks']['quickview']['rating_status']) ? $rgenConfig['rgen_prdblocks']['quickview']['rating_status'] : true,
				'price_status'       => isset($rgenConfig['rgen_prdblocks']['quickview']['price_status']) ? $rgenConfig['rgen_prdblocks']['quickview']['price_status'] : true,
				'tax_status'         => isset($rgenConfig['rgen_prdblocks']['quickview']['tax_status']) ? $rgenConfig['rgen_prdblocks']['quickview']['tax_status'] : true,
				'options_status'     => isset($rgenConfig['rgen_prdblocks']['quickview']['options_status']) ? $rgenConfig['rgen_prdblocks']['quickview']['options_status'] : true,
				'description_status' => isset($rgenConfig['rgen_prdblocks']['quickview']['description_status']) ? $rgenConfig['rgen_prdblocks']['quickview']['description_status'] : true,
				'quickview_text'     => isset($rgenConfig['rgen_prdblocks']['quickview']['quickview_text']) ? $rgenConfig['rgen_prdblocks']['quickview']['quickview_text'] : array(),
				'moreinfo_text'      => isset($rgenConfig['rgen_prdblocks']['quickview']['moreinfo_text']) ? $rgenConfig['rgen_prdblocks']['quickview']['moreinfo_text'] : array(),
				'cart_icon'          => isset($rgenConfig['rgen_prdblocks']['quickview']['cart_icon']) ? $rgenConfig['rgen_prdblocks']['quickview']['cart_icon'] : 'glyphicon glyphicon-shopping-cart'
			),
			
			/* Top bar settings
			------------------------*/
			'topbar_style'  => isset($rgenConfig['rgen_topbar']['style']) ? $rgenConfig['rgen_topbar']['style'] : '1',
			'topbar_layout' => isset($rgenConfig['rgen_topbar']['layout']) ? $rgenConfig['rgen_topbar']['layout'] : 'bx',
			'topbar_autosearch' => isset($rgenConfig['rgen_topbar']['autosearch']) ? $rgenConfig['rgen_topbar']['autosearch'] : false,

			'topbar1_general' => isset($rgenConfig['rgen_topbar']['topbar1_general']) ? __::defaults($rgenConfig['rgen_topbar']['topbar1_general'], $topbar1_general) : $topbar1_general,
			'topbar2_general' => isset($rgenConfig['rgen_topbar']['topbar2_general']) ? __::defaults($rgenConfig['rgen_topbar']['topbar2_general'], $topbar1_general) : $topbar2_general,

			'topbar_popup_cart_btn_icon'     => isset($rgenConfig['rgen_topbar']['topbar_popup_cart_btn_icon']) ? $rgenConfig['rgen_topbar']['topbar_popup_cart_btn_icon'] : true,
			'topbar_popup_checkout_btn_icon' => isset($rgenConfig['rgen_topbar']['topbar_popup_checkout_btn_icon']) ? $rgenConfig['rgen_topbar']['topbar_popup_checkout_btn_icon'] : true,
			
			/* Footer settings
			------------------------*/
			'default_ft_tw'   => isset($rgenConfig['rgen_footer']['default_ft_tw']) ? $rgenConfig['rgen_footer']['default_ft_tw'] : 'bx',
			'default_ft_bw'   => isset($rgenConfig['rgen_footer']['default_ft_bw']) ? $rgenConfig['rgen_footer']['default_ft_bw'] : 'bx',
			'default_ft_cards'=> isset($rgenConfig['rgen_footer']['default_ft_cards']) ? $rgenConfig['rgen_footer']['default_ft_cards'] : array(),
			
			'default_ft_ph'   => $new_ft_ph,
			'default_ft_fax'  => $new_ft_fax,
			'default_ft_mail' => $new_ft_mail,

			'default_ft_social' => isset($rgenConfig['rgen_footer']['default_ft_social']) ? $rgenConfig['rgen_footer']['default_ft_social'] : array(),

			'default_ft_cphtml'=>  $factory->node($rgenConfig, 'rgen_footer/default_ft_cphtml', 0, 0),
			
			/* OC Modules
			------------------------*/
			'ocmd_featured' => array (
				'prd_view'      => isset($rgenConfig['rgen_ocmodule']['ocmd_featured']['prd_view']) ? $rgenConfig['rgen_ocmodule']['ocmd_featured']['prd_view'] : 'carousel',
				'prd_style'     => isset($rgenConfig['rgen_ocmodule']['ocmd_featured']['prd_style']) ? $rgenConfig['rgen_ocmodule']['ocmd_featured']['prd_style'] : 1,
				'col_prd_style' => isset($rgenConfig['rgen_ocmodule']['ocmd_featured']['col_prd_style']) ? $rgenConfig['rgen_ocmodule']['ocmd_featured']['col_prd_style'] : 1,
				'grids'         => isset($rgenConfig['rgen_ocmodule']['ocmd_featured']['grids']) ? $rgenConfig['rgen_ocmodule']['ocmd_featured']['grids'] : 'eq4 d-eq4 t-eq3 mxl-eq2 msm-eq2 mxs-eq1 gt20 mb20',
				'carousel'      => isset($rgenConfig['rgen_ocmodule']['ocmd_featured']['carousel']) ? $rgenConfig['rgen_ocmodule']['ocmd_featured']['carousel'] : array('item_margin'=> 20,'item_display'=> 5)
			),
			'ocmd_latest' => array (
				'prd_view'      => isset($rgenConfig['rgen_ocmodule']['ocmd_latest']['prd_view']) ? $rgenConfig['rgen_ocmodule']['ocmd_latest']['prd_view'] : 'carousel',
				'prd_style'     => isset($rgenConfig['rgen_ocmodule']['ocmd_latest']['prd_style']) ? $rgenConfig['rgen_ocmodule']['ocmd_latest']['prd_style'] : 1,
				'col_prd_style' => isset($rgenConfig['rgen_ocmodule']['ocmd_latest']['col_prd_style']) ? $rgenConfig['rgen_ocmodule']['ocmd_latest']['col_prd_style'] : 1,
				'grids'         => isset($rgenConfig['rgen_ocmodule']['ocmd_latest']['grids']) ? $rgenConfig['rgen_ocmodule']['ocmd_latest']['grids'] : 'eq4 d-eq4 t-eq3 mxl-eq2 msm-eq2 mxs-eq1 gt20 mb20',
				'carousel'      => isset($rgenConfig['rgen_ocmodule']['ocmd_latest']['carousel']) ? $rgenConfig['rgen_ocmodule']['ocmd_latest']['carousel'] : array('item_margin'=> 20,'item_display'=> 5)
			),
			'ocmd_best' => array (
				'prd_view'      => isset($rgenConfig['rgen_ocmodule']['ocmd_best']['prd_view']) ? $rgenConfig['rgen_ocmodule']['ocmd_best']['prd_view'] : 'carousel',
				'prd_style'     => isset($rgenConfig['rgen_ocmodule']['ocmd_best']['prd_style']) ? $rgenConfig['rgen_ocmodule']['ocmd_best']['prd_style'] : 1,
				'col_prd_style' => isset($rgenConfig['rgen_ocmodule']['ocmd_best']['col_prd_style']) ? $rgenConfig['rgen_ocmodule']['ocmd_best']['col_prd_style'] : 1,
				'grids'         => isset($rgenConfig['rgen_ocmodule']['ocmd_best']['grids']) ? $rgenConfig['rgen_ocmodule']['ocmd_best']['grids'] : 'eq4 d-eq4 t-eq3 mxl-eq2 msm-eq2 mxs-eq1 gt20 mb20',
				'carousel'      => isset($rgenConfig['rgen_ocmodule']['ocmd_best']['carousel']) ? $rgenConfig['rgen_ocmodule']['ocmd_best']['carousel'] : array('item_margin'=> 20,'item_display'=> 5)
			),
			'ocmd_special' => array (
				'prd_view'      => isset($rgenConfig['rgen_ocmodule']['ocmd_special']['prd_view']) ? $rgenConfig['rgen_ocmodule']['ocmd_special']['prd_view'] : 'carousel',
				'prd_style'     => isset($rgenConfig['rgen_ocmodule']['ocmd_special']['prd_style']) ? $rgenConfig['rgen_ocmodule']['ocmd_special']['prd_style'] : 1,
				'col_prd_style' => isset($rgenConfig['rgen_ocmodule']['ocmd_special']['col_prd_style']) ? $rgenConfig['rgen_ocmodule']['ocmd_special']['col_prd_style'] : 1,
				'grids'         => isset($rgenConfig['rgen_ocmodule']['ocmd_special']['grids']) ? $rgenConfig['rgen_ocmodule']['ocmd_special']['grids'] : 'eq4 d-eq4 t-eq3 mxl-eq2 msm-eq2 mxs-eq1 gt20 mb20',
				'carousel'      => isset($rgenConfig['rgen_ocmodule']['ocmd_special']['carousel']) ? $rgenConfig['rgen_ocmodule']['ocmd_special']['carousel'] : array('item_margin'=> 20,'item_display'=> 5)
			),

			'ocmd_special' => array (
				'prd_view'      => isset($rgenConfig['rgen_ocmodule']['ocmd_special']['prd_view']) ? $rgenConfig['rgen_ocmodule']['ocmd_special']['prd_view'] : 'carousel',
				'prd_style'     => isset($rgenConfig['rgen_ocmodule']['ocmd_special']['prd_style']) ? $rgenConfig['rgen_ocmodule']['ocmd_special']['prd_style'] : 1,
				'col_prd_style' => isset($rgenConfig['rgen_ocmodule']['ocmd_special']['col_prd_style']) ? $rgenConfig['rgen_ocmodule']['ocmd_special']['col_prd_style'] : 1,
				'grids'         => isset($rgenConfig['rgen_ocmodule']['ocmd_special']['grids']) ? $rgenConfig['rgen_ocmodule']['ocmd_special']['grids'] : 'eq4 d-eq4 t-eq3 mxl-eq2 msm-eq2 mxs-eq1 gt20 mb20',
				'carousel'      => isset($rgenConfig['rgen_ocmodule']['ocmd_special']['carousel']) ? $rgenConfig['rgen_ocmodule']['ocmd_special']['carousel'] : array('item_margin'=> 20,'item_display'=> 5)
			),

			'ocmd_slideshow' => array (
				'speed'          => isset($rgenConfig['rgen_ocmodule']['ocmd_slideshow']['speed']) ? $rgenConfig['rgen_ocmodule']['ocmd_slideshow']['speed'] : 450,
				'interval'       => isset($rgenConfig['rgen_ocmodule']['ocmd_slideshow']['interval']) ? $rgenConfig['rgen_ocmodule']['ocmd_slideshow']['interval'] : 4000,
				'loop'           => isset($rgenConfig['rgen_ocmodule']['ocmd_slideshow']['loop']) ? $rgenConfig['rgen_ocmodule']['ocmd_slideshow']['loop'] : true,
				'autoplay'       => isset($rgenConfig['rgen_ocmodule']['ocmd_slideshow']['autoplay']) ? $rgenConfig['rgen_ocmodule']['ocmd_slideshow']['autoplay'] : true,
				'autoplay_hover' => isset($rgenConfig['rgen_ocmodule']['ocmd_slideshow']['autoplay_hover']) ? $rgenConfig['rgen_ocmodule']['ocmd_slideshow']['autoplay_hover'] : true,
				'animateOut'     => isset($rgenConfig['rgen_ocmodule']['ocmd_slideshow']['animateOut']) ? $rgenConfig['rgen_ocmodule']['ocmd_slideshow']['animateOut'] : 'fadeOut',
				'animateIn'      => isset($rgenConfig['rgen_ocmodule']['ocmd_slideshow']['animateOut']) ? $rgenConfig['rgen_ocmodule']['ocmd_slideshow']['animateOut'] : 'fadeIn',
				'arrow'          => isset($rgenConfig['rgen_ocmodule']['ocmd_slideshow']['arrow']) ? $rgenConfig['rgen_ocmodule']['ocmd_slideshow']['arrow'] : true,
				'dots'           => isset($rgenConfig['rgen_ocmodule']['ocmd_slideshow']['dots']) ? $rgenConfig['rgen_ocmodule']['ocmd_slideshow']['dots'] : true,
				'dot_style'      => isset($rgenConfig['rgen_ocmodule']['ocmd_slideshow']['dot_style']) ? $rgenConfig['rgen_ocmodule']['ocmd_slideshow']['dot_style'] : 1,
			),

			'ocmod_banners' => array (
				'contentarea_view' => isset($rgenConfig['rgen_ocmodule']['ocmd_banners']['contentarea_view']) ? $rgenConfig['rgen_ocmodule']['ocmd_banners']['contentarea_view'] : 'grid',
				'grids'            => isset($rgenConfig['rgen_ocmodule']['ocmd_banners']['grids']) ? $rgenConfig['rgen_ocmodule']['ocmd_banners']['grids'] : 'eq4 d-eq4 t-eq3 mxl-eq2 msm-eq2 mxs-eq1 gt20 mb20',
				'carousel'         => isset($rgenConfig['rgen_ocmodule']['ocmd_banners']['carousel']) ? $rgenConfig['rgen_ocmodule']['ocmd_banners']['carousel'] : array('item_margin'=> 10,'item_display'=> 4),
				
				'column_view'      => isset($rgenConfig['rgen_ocmodule']['ocmd_banners']['column_view']) ? $rgenConfig['rgen_ocmodule']['ocmd_banners']['column_view'] : 'grid',
				'column_grids'     => isset($rgenConfig['rgen_ocmodule']['ocmd_banners']['column_grids']) ? $rgenConfig['rgen_ocmodule']['ocmd_banners']['column_grids'] : 'eq1 gt0 mb10',
				'column_carousel'  => isset($rgenConfig['rgen_ocmodule']['ocmd_banners']['carousel']) ? $rgenConfig['rgen_ocmodule']['ocmd_banners']['carousel'] : array('item_margin'=> 10,'item_display'=> 1),
			),

			/* Pages
			------------------------*/
			// Category page
			'cat_info'                   => isset($rgenConfig['rgen_page']['cat_info']) ? $rgenConfig['rgen_page']['cat_info'] : true,
			'refine_search'              => isset($rgenConfig['rgen_page']['refine_search']) ? $rgenConfig['rgen_page']['refine_search'] : 1,
			'refine_view'                => isset($rgenConfig['rgen_page']['refine_view']) ? $rgenConfig['rgen_page']['refine_view'] : 'grid',
			
			// Product page
			'prdpg_layout'               => isset($rgenConfig['rgen_page']['prdpg_layout']) ? $rgenConfig['rgen_page']['prdpg_layout'] : 1,
			'prdpg_rel_prdstyle'         => isset($rgenConfig['rgen_page']['prdpg_rel_prdstyle']) ? $rgenConfig['rgen_page']['prdpg_rel_prdstyle'] : 1,
			
			'prdpg_cart_status'          => isset($rgenConfig['rgen_page']['prdpg_cart_status']) ? $rgenConfig['rgen_page']['prdpg_cart_status'] : true,
			'prdpg_wishlist_status'      => isset($rgenConfig['rgen_page']['prdpg_wishlist_status']) ? $rgenConfig['rgen_page']['prdpg_wishlist_status'] : true,
			'prdpg_compare_status'       => isset($rgenConfig['rgen_page']['prdpg_compare_status']) ? $rgenConfig['rgen_page']['prdpg_compare_status'] : true,
			'prdpg_description_status'   => isset($rgenConfig['rgen_page']['prdpg_description_status']) ? $rgenConfig['rgen_page']['prdpg_description_status'] : true,
			'prdpg_rating_status'        => isset($rgenConfig['rgen_page']['prdpg_rating_status']) ? $rgenConfig['rgen_page']['prdpg_rating_status'] : true,
			'prdpg_price_status'         => isset($rgenConfig['rgen_page']['prdpg_price_status']) ? $rgenConfig['rgen_page']['prdpg_price_status'] : true,
			'prdpg_tax_status'           => isset($rgenConfig['rgen_page']['prdpg_tax_status']) ? $rgenConfig['rgen_page']['prdpg_tax_status'] : true,
			'prdpg_options_status'       => isset($rgenConfig['rgen_page']['prdpg_options_status']) ? $rgenConfig['rgen_page']['prdpg_options_status'] : true,
			'prdpg_specification_status' => isset($rgenConfig['rgen_page']['prdpg_specification_status']) ? $rgenConfig['rgen_page']['prdpg_specification_status'] : true,
			'prdpg_social_sharing'       => isset($rgenConfig['rgen_page']['prdpg_social_sharing']) ? $rgenConfig['rgen_page']['prdpg_social_sharing'] : '',
			
			'prdpg_cloudzoom'            => isset($rgenConfig['rgen_page']['prdpg_cloudzoom']) ? $rgenConfig['rgen_page']['prdpg_cloudzoom'] : true,
			'prdpg_popup'                => isset($rgenConfig['rgen_page']['prdpg_popup']) ? $rgenConfig['rgen_page']['prdpg_popup'] : true,
			
			'prdpg_cartbtn_txt'          => isset($rgenConfig['rgen_page']['prdpg_cartbtn_txt']) ? $rgenConfig['rgen_page']['prdpg_cartbtn_txt'] : false,
			
			'prdpg_cartbtn_ico_type'     => isset($rgenConfig['rgen_page']['prdpg_cartbtn_ico_type']) ? $rgenConfig['rgen_page']['prdpg_cartbtn_ico_type'] : 'ico',
			'prdpg_cartbtn_ico'          => isset($rgenConfig['rgen_page']['prdpg_cartbtn_ico']) ? $rgenConfig['rgen_page']['prdpg_cartbtn_ico'] : 'glyphicon glyphicon-shopping-cart',
			
			'prdpg_wishbtn_ico_type'     => isset($rgenConfig['rgen_page']['prdpg_wishbtn_ico_type']) ? $rgenConfig['rgen_page']['prdpg_wishbtn_ico_type'] : 'ico',
			'prdpg_wishbtn_ico'          => isset($rgenConfig['rgen_page']['prdpg_wishbtn_ico']) ? $rgenConfig['rgen_page']['prdpg_wishbtn_ico'] : 'fa fa-heart',
			
			'prdpg_comparebtn_ico_type'  => isset($rgenConfig['rgen_page']['prdpg_comparebtn_ico_type']) ? $rgenConfig['rgen_page']['prdpg_comparebtn_ico_type'] : 'ico',
			'prdpg_comparebtn_ico'       => isset($rgenConfig['rgen_page']['prdpg_comparebtn_ico']) ? $rgenConfig['rgen_page']['prdpg_comparebtn_ico'] : 'fa fa-retweet',
			
			'prdpgly1_l_size'            => isset($rgenConfig['rgen_page']['prdpgly1_l_size']) ? $rgenConfig['rgen_page']['prdpgly1_l_size'] : 6,
			'prdpgly1_gt'                => isset($rgenConfig['rgen_page']['prdpgly1_gt']) ? $rgenConfig['rgen_page']['prdpgly1_gt'] : 'gt40',
			
			'prdpgly2_l_size'            => isset($rgenConfig['rgen_page']['prdpgly2_l_size']) ? $rgenConfig['rgen_page']['prdpgly2_l_size'] : 6,
			'prdpgly2_gt'                => isset($rgenConfig['rgen_page']['prdpgly2_gt']) ? $rgenConfig['rgen_page']['prdpgly2_gt'] : 'gt40',
			
			'prdpgly3_l_size'            => isset($rgenConfig['rgen_page']['prdpgly3_l_size']) ? $rgenConfig['rgen_page']['prdpgly3_l_size'] : 5,
			'prdpgly3_gt'                => isset($rgenConfig['rgen_page']['prdpgly3_gt']) ? $rgenConfig['rgen_page']['prdpgly3_gt'] : 'gt30',
			
			'prdpgly4_l_size'            => isset($rgenConfig['rgen_page']['prdpgly4_l_size']) ? $rgenConfig['rgen_page']['prdpgly4_l_size'] : 8,
			'prdpgly4_gt'                => isset($rgenConfig['rgen_page']['prdpgly4_gt']) ? $rgenConfig['rgen_page']['prdpgly4_gt'] : 'gt30',


			/* System
			------------------------*/
			'cssminify' => $factory->node($optimization, 'cssminify', 0, 0) != '' ? $factory->node($optimization, 'cssminify', 0, 0) : false,
			'jsminify'  => $factory->node($optimization, 'jsminify', 0, 0) != '' ? $factory->node($optimization, 'jsminify', 0, 0) : false,

			'jsminify'  => $factory->node($optimization, 'jsminify', 0, 0) != '' ? $factory->node($optimization, 'jsminify', 0, 0) : false,

			'cache_menu'           => $factory->node($optimization, 'menu', 0, 0) != '' ? $factory->node($optimization, 'menu', 0, 0) : false,
			'cache_basicslideshow' => $factory->node($optimization, 'basicslideshow', 0, 0) != '' ? $factory->node($optimization, 'basicslideshow', 0, 0) : false,
			'cache_basicbanners'   => $factory->node($optimization, 'basicbanners', 0, 0) != '' ? $factory->node($optimization, 'basicbanners', 0, 0) : false,
			'cache_bannergrids'    => $factory->node($optimization, 'bannergrids', 0, 0) != '' ? $factory->node($optimization, 'bannergrids', 0, 0) : false,
			'cache_imagegallery'   => $factory->node($optimization, 'imagegallery', 0, 0) != '' ? $factory->node($optimization, 'imagegallery', 0, 0) : false,
			'cache_productgroups'  => $factory->node($optimization, 'productgroups', 0, 0) != '' ? $factory->node($optimization, 'productgroups', 0, 0) : false,
			'cache_customhtml'     => $factory->node($optimization, 'customhtml', 0, 0) != '' ? $factory->node($optimization, 'customhtml', 0, 0) : false,
			'cache_contentblocks'  => $factory->node($optimization, 'contentblocks', 0, 0) != '' ? $factory->node($optimization, 'contentblocks', 0, 0) : false,
			'cache_revslider'      => $factory->node($optimization, 'revslider', 0, 0) != '' ? $factory->node($optimization, 'revslider', 0, 0) : false,
			'cache_gridmanager'    => $factory->node($optimization, 'gridmanager', 0, 0) != '' ? $factory->node($optimization, 'gridmanager', 0, 0) : false,
			'cache_stickyhtml'     => $factory->node($optimization, 'stickyhtml', 0, 0) != '' ? $factory->node($optimization, 'stickyhtml', 0, 0) : false,
			'cache_catshowcase'    => $factory->node($optimization, 'catshowcase', 0, 0) != '' ? $factory->node($optimization, 'catshowcase', 0, 0) : false,
			'cache_deals'          => $factory->node($optimization, 'deals', 0, 0) != '' ? $factory->node($optimization, 'deals', 0, 0) : false
		);

		foreach ($configData as $key => $value) {
			$rgenSettings->setSettings($key, $value);
		}
		
	}

	private function getValue($arr, $path = '', $default) {
		$val = $this->rgen->factory->node($arr, $path, 0, 0);
		if ($val === false){ 
			return $default; 
		} else {
			return $val; 
		}
	}
}