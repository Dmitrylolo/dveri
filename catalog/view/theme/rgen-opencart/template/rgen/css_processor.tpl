<?php
echo isset($gfont_url) ? $gfont_url : null;

/* Small product blocks
=========================*/
include $css_fn_autosearch;
include $css_fn_prdblocks;
include $css_fn_productgroups;
include 'css_customhtml.tpl';
include $css_fn_contentblocks;
include $css_fn_revslider;
include $css_fn_gridmanager;
include $css_fn_bannergrids;
include $css_fn_imagegallery;
include $css_fn_prdpghtml;
include $css_fn_stickyhtml;
include $css_fn_catshowcase;
include $css_fn_deals;


/* THEME - GENERAL
**************************/
echo isset($body_css) ? 'body {'.$body_css.'}' : '';
echo isset($page_container) ? '.main-wrapper {'.$page_container.'}' : '';
echo isset($contentarea_css) ? '.content-area {'.$contentarea_css.'}' : '';
echo isset($contentbox_css) ? '.content-area > .container {'.$contentbox_css.'}' : '';


if (!$settings['wide_status']) {
	if ($settings['responsive_status']) {
		echo '
		@media only screen and (min-width: 980px){
			.main-wrapper { max-width: 1140px; min-width: 980px; }
			.fw.out-wrapper .container,	.out-wrapper, .container { width: 960px; }

			.layout-wrp .ly-body-2 { width: 76%; }
			.layout-wrp .ly-column { width: 24%; }
		}';
	} else {
		echo '
		.main-wrapper { max-width: 1140px; min-width: 980px; }
		.fw.out-wrapper .container,	.out-wrapper, .container { width: 960px; }

		.layout-wrp .ly-body-2 { width: 76%; }
		.layout-wrp .ly-column { width: 24%; }
		';
	}
}

/* THEME - OC MAIN MENU
**************************/
if (isset($ocmenu)) {
	echo isset($ocmenu['menu_wrp']) ? '
	.oc-default { '.$ocmenu['menu_wrp'].'}' : '';
	
	echo isset($ocmenu['container']) ? '
	.oc-default .container { '.$ocmenu['container'].'}' : '';

	echo isset($ocmenu['mainitem']) ? '
	.oc-default .rg-nav > li > .main-item { '.$ocmenu['mainitem'].'}' : '';

	echo isset($ocmenu['mainitem_hover']) ? '
	.oc-default .rg-nav > li:hover > .main-item { '.$ocmenu['mainitem_hover'].'}' : '';

	echo isset($ocmenu['subwrp']) ? '
	.oc-default .sub { '.$ocmenu['subwrp'].'} .oc-default .nav-fly { background-color: transparent; }' : '';

	echo isset($ocmenu['subitem']) ? '
	.oc-default .nav-fly li > a { '.$ocmenu['subitem'].'}' : '';

	echo isset($ocmenu['subitem_hover']) ? '
	.oc-default .nav-fly li:hover > a { '.$ocmenu['subitem_hover'].'}' : '';

	echo isset($ocmenu['m_handle']) ? '
	.mob.oc-default .rg-nav-handle { '.$ocmenu['m_handle'].'}' : '';

	echo isset($ocmenu['m_subhandle']) ? '
	.mob.oc-default .nav-sub-handle { '.$ocmenu['m_subhandle'].'}' : '';

	echo isset($ocmenu['m_nav']) ? '
	.mob.oc-default .rg-nav.open { '.$ocmenu['m_nav'].'}' : '';

	echo isset($ocmenu['m_subwrp']) ? '
	.mob.oc-default .rg-nav > li.active > .sub { '.$ocmenu['m_subwrp'].'}' : '';

	echo isset($ocmenu['m_mainitem']) ? '
	.mob.oc-default .rg-nav > li > .main-item { '.$ocmenu['m_mainitem'].'}' : '';

	echo isset($ocmenu['m_subitem']) ? '
	.mob.oc-default .nav-fly li > a { '.$ocmenu['m_subitem'].'}' : '';

	echo isset($ocmenu['m_seeall']) ? '
	.mob.oc-default .see-all { '.$ocmenu['m_seeall'].'}' : '';
	
}

/* COMMON COMPONENTS
**************************/
echo isset($global_link_normal) ? '.page-head a:hover, a {'.$global_link_normal.'}' : '';
echo isset($global_link_hover) ? '.page-head a, a:focus, a:hover {'.$global_link_hover.'}' : '';

echo isset($scrolltop_css) ? '.scroll-top {'.$scrolltop_css.'}' : '';
echo isset($scrolltop_ico) ? '.scroll-top i { margin-top: 0;'.$scrolltop_ico.'}' : '';

echo isset($global_border_color) ? '
.sitemap-info .first > li,
.tbar1 #cart > .btn,
#search .btn-lg,
#search .input-lg,
.mod-hd,
.ctrl-b .owl-nav:after,
.oc-carousel .owl-stage-outer,
footer .footer-upper,
footer .footer-bottom,
.ft-hd,
.prd-block1,
.prd-block1 .price,
.prd-block1 .btn,
.owl-nav > a, .owl-nav > div,
.ly-column .mod-wrp .mod-hd,
.col-mod-hd,
.oc-filter .filter-group,
.link-list a.active, 
.link-list a.active:hover, 
.link-list a:hover,
.category-info,
.page-head,
.product-images .main-img a,
.additional-img .img,
.buying-info .price,
.buying-info1 .rating-wrp, 
.buying-info .rating-wrp,
.options-wrp,
.options-wrp .form-group,
.buy-btn-wrp,
.control-qty .qty-handle,
.nav-tabs > li a,
.nav-tabs>li>a:hover,
.tab-content,
.nav-tabs>li.active>a, 
.nav-tabs>li.active>a:hover, 
.nav-tabs>li.active>a:focus,
hr,
.table-bordered>thead>tr>th,
.table-bordered>tbody>tr>th,
.table-bordered>tfoot>tr>th,
.table-bordered>thead>tr>td,
.table-bordered>tbody>tr>td,
.table-bordered>tfoot>tr>td,
.bdr-color,
#review,
.bdr-b,
.bdr,
.bdr-b,
.bdr-t,
.bdr-l,
.bdr-r,
.bdr-t-color,
.bdr-r-color,
.bdr-b-color,
.bdr-l-color,
#tab-review .rating li,
.cart-pg .cart-total .table tr:last-child td,
.frm-hd,
.frm-wrp,
.panel,
.panel-default>.panel-heading+.panel-collapse>.panel-body,
.buttons,
.link-list a,
.link-list a.active, 
.link-list a.active:hover, 
.link-list a:hover,
.small-prd-block2,
.small-prd-block2 .more-btn,
.small-prd-block1,
.product-list .prd-block2
{ '.$global_border_color.'}' : '';

echo isset($global_hr) ? '
.hr { '.$global_hr.'}' : '';

echo isset($ocmenu['menu_wrp']) ? '
.oc-default { '.$ocmenu['menu_wrp'].'}' : '';

echo isset($global_pagination_wrp) ? '
.pagination-wrp { '.$global_pagination_wrp.'}' : '';

echo isset($global_pagination_block) ? '
.pagination-wrp .pagination { '.$global_pagination_block.'}' : '';

echo isset($global_pagination_normal) ? '
.pagination-wrp .pagination li a, 
.pagination-wrp .pagination li a:hover { '.$global_pagination_normal.'}' : '';

echo isset($global_pagination_active) ? '
.pagination-wrp .pagination .active span { '.$global_pagination_active.'}' : '';

/* Global arrows
=========================*/
echo isset($global_owl_arrows['arrow_wrp']) ?
'.owl-controls { '. $global_owl_arrows['arrow_wrp'] . ' }' : '';

echo isset($global_owl_arrows['arrow_line']) ?
'.owl-controls .owl-nav:after { '. $global_owl_arrows['arrow_line'] . ' }' : '';

echo isset($global_owl_arrows['arrows']) ?
'.owl-controls .owl-nav > div { '. $global_owl_arrows['arrows'] . ' }' : '';

echo isset($global_owl_arrows['arrows_hover']) ?
'.owl-controls .owl-nav > div:hover { '. $global_owl_arrows['arrows_hover'] . ' }' : '';

/* Global slide show dots
=========================*/
echo isset($global_slideshow_dots['dot_line']) ? '
.dots-typ1 .dots:after,
.oc-slideshow .dots-typ1 .owl-dots:after { '. $global_slideshow_dots['dot_line'] . ' }' : '';

echo isset($global_slideshow_dots['dot_normal']) ? '
.dots-typ1 .dots li,
.dots-typ1 .dots li a,
.oc-slideshow .dots-typ1 .owl-dots .owl-dot,
.oc-slideshow .dots-typ2 .owl-dots .owl-dot span { '. $global_slideshow_dots['dot_normal'] . ' }' : '';

echo isset($global_slideshow_dots['dot_active']) ? 
'.dots-typ1 .dots li:hover,'.
'.dots-typ1 .dots li.current,'.
'.oc-slideshow .dots-typ1 .owl-dots .owl-dot:hover,'.
'.oc-slideshow .dots-typ1 .owl-dots .owl-dot.active,'.
'.oc-slideshow .dots-typ2 .owl-dots .owl-dot:hover span,'.
'.oc-slideshow .dots-typ2 .owl-dots .owl-dot.active span { '. $global_slideshow_dots['dot_active'] . ' }' : '';	


/* Headings
=========================*/
echo isset($other_hd_fonts) ? 
'.h1, .h2, .h3, .h4, .h5, .h6, h1, h2, h3, h4, h5, h6 { '.$other_hd_fonts.'}' : '';

echo isset($other_hd_h1) ? '.h1, h1 { '.$other_hd_h1.'}' : '';
echo isset($other_hd_h2) ? '.h2, h2 { '.$other_hd_h2.'}' : '';
echo isset($other_hd_h3) ? '.h3, h3 { '.$other_hd_h3.'}' : '';
echo isset($other_hd_h4) ? '.h4, h4 { '.$other_hd_h4.'}' : '';
echo isset($other_hd_h5) ? '.h5, h5 { '.$other_hd_h5.'}' : '';
echo isset($other_hd_h6) ? '.h6, h6 { '.$other_hd_h6.'}' : '';

/* Module headings */
echo isset($module_hd) ? 
'.mod-hd { '.$module_hd.'}' : '';

/* Column module headings */
echo isset($column_module_hd) ? 
'.col-mod-hd { '.$column_module_hd.'}' : '';

/* Footer headings */
echo isset($footer_hd) ? 
'.ft-hd { '.$footer_hd.'}' : '';


/* Page heading
=========================*/
echo isset($pg_heading_wrp) ? 
'.page-head { '.$pg_heading_wrp.'}' : '';

echo isset($pg_heading_h1_block) ? 
'.page-head h1 { '.$pg_heading_h1_block.'}' : '';

echo isset($pg_heading_h1_text) ? 
'.page-head h1 strong { '.$pg_heading_h1_text.'}' : '';

echo isset($breadcrumb_wrp) ? '
.page-head .breadcrumb, 
.breadcrumb-wrp .breadcrumb { '.$breadcrumb_wrp.'}' : '';

echo isset($breadcrumb_sep) ? '
.page-head .breadcrumb b,
.breadcrumb-wrp .breadcrumb b { '.$breadcrumb_sep.'}' : '';

echo isset($breadcrumb_a) ? '
.page-head .breadcrumb a,
.breadcrumb-wrp .breadcrumb a { '.$breadcrumb_a.'}' : '';

echo isset($breadcrumb_a_hover) ? '
.page-head .breadcrumb a:hover,
.breadcrumb-wrp .breadcrumb a:hover { '.$breadcrumb_a_hover.'}' : '';


/* Buttons
=========================*/
echo isset($default_btn) ? 
'.default-btn, a.default-btn, .buttons a.default-btn { '.$default_btn.'}' : '';
echo isset($default_btn_hover) ? '
.default-btn:hover, 
.default-btn:focus, 
.default-btn:active, 
.default-btn.active,
a.default-btn:hover, 
a.default-btn:focus, 
a.default-btn:active, 
a.default-btn.active,
.buttons a.default-btn:hover, 
.buttons a.default-btn:focus, 
.buttons a.default-btn:active, 
.buttons a.default-btn.active { '.$default_btn_hover.'}' : '';

echo isset($primary_btn) ? 
'.primary-btn, a.primary-btn, .buttons a.primary-btn, .btn-primary { '.$primary_btn.'}' : '';
echo isset($primary_btn_hover) ? '
.btn-primary:hover, 
.btn-primary:focus, 
.btn-primary:active, 
.btn-primary.active,
.primary-btn:hover, 
.primary-btn:focus, 
.primary-btn:active, 
.primary-btn.active,
a.primary-btn:hover, 
a.primary-btn:focus, 
a.primary-btn:active, 
a.primary-btn.active { '.$primary_btn_hover.'}' : '';

echo isset($small_btn) ? 
'.btn-small, a.btn-small, .buttons a.btn-small { '.$small_btn.'}' : '';
echo isset($small_btn_hover) ? '
.btn-small:hover, 
.btn-small:focus, 
.btn-small:active, 
.btn-small.active,
a.btn-small:hover, 
a.btn-small:focus, 
a.btn-small:active, 
a.btn-small.active,
.buttons a.btn-small:hover, 
.buttons a.btn-small:focus, 
.buttons a.btn-small:active, 
.buttons a.btn-small.active { '.$small_btn_hover.'}' : '';

echo isset($mini_btn) ? 
'.btn-mini, a.btn-mini, .buttons a.btn-mini { '.$mini_btn.'}' : '';
echo isset($mini_btn_hover) ? '
.btn-mini:hover, 
.btn-mini:focus, 
.btn-mini:active, 
.btn-mini.active,
a.btn-mini:hover, 
a.btn-mini:focus, 
a.btn-mini:active, 
a.btn-mini.active,
.buttons a.btn-mini:hover, 
.buttons a.btn-mini:focus, 
.buttons a.btn-mini:active, 
.buttons a.btn-mini.active { '.$mini_btn_hover.'}' : '';

echo isset($xs_btn) ? 
'.btn-xs, a.btn-xs, .buttons a.btn-xs { '.$xs_btn.'}' : '';
echo isset($xs_btn_hover) ? '
.btn-xs:hover, 
.btn-xs:focus, 
.btn-xs:active, 
.btn-xs.active,
a.btn-xs:hover, 
a.btn-xs:focus, 
a.btn-xs:active, 
a.btn-xs.active,
.buttons a.btn-xs:hover, 
.buttons a.btn-xs:focus, 
.buttons a.btn-xs:active, 
.buttons a.btn-xs.active { '.$xs_btn_hover.'}' : '';


/* Product filters
=========================*/
echo isset($filter_wrp) ?
'.product-filter { '. $filter_wrp . ' }' : '';

echo isset($filter_compare) ?
'.product-filter .compare a { '. $filter_compare . ' }' : '';

echo isset($filter_compare_hover) ?
'.product-filter .compare a:hover { '. $filter_compare_hover . ' }' : '';

echo isset($filter_labels) ?
'.product-filter li label { '. $filter_labels . ' }' : '';

echo isset($filter_ctrl) ?
'.product-filter select.form-control { '. $filter_ctrl . ' }' : '';

echo isset($display_btn) ?
'.product-filter .display button { '. $display_btn . ' } .product-filter .display button i { font-size: inherit; } ' : '';

echo isset($display_btn_active) ?
'.product-filter .display .active { '. $display_btn_active . ' }' : '';


/* Table style
=========================*/
echo isset($table) ? 
'.table-bordered { '.$table.'}' : '';

echo isset($thead) ? '
.table-bordered>thead>tr>th,
.table-bordered>thead>tr>td { '.$thead.'}' : '';

echo isset($thead_last) ? '
.table-bordered>thead>tr>th:last-child,
.table-bordered>thead>tr>td:last-child { '.$thead_last.'}' : '';

echo isset($thead_first) ? '
.table-bordered>thead>tr>th:first-child,
.table-bordered>thead>tr>td:first-child { '.$thead_first.'}' : '';


echo isset($tbody) ? '
.table-bordered>tbody>tr>th,
.table-bordered>tbody>tr>td { '.$tbody.'}' : '';

echo isset($tbody_last) ? '
.table-bordered>tbody>tr>th:last-child,
.table-bordered>tbody>tr>td:last-child { '.$tbody_last.'}' : '';

echo isset($tbody_first) ? '
.table-bordered>tbody>tr>th:first-child,
.table-bordered>tbody>tr>td:first-child { '.$tbody_first.'}' : '';


/* FORM STYLE
**************************/
echo isset($frm_wrp) ? '
.frm-wrp { '.$frm_wrp.'}' : '';

echo isset($frm_title) ? '
.frm-hd { '.$frm_title.'}' : '';

echo isset($frm_label) ? '
.frm-wrp .control-label { '.$frm_label.'}' : '';

echo isset($frm_ctrl) ? '
select.form-control, textarea.form-control, input[type="text"].form-control, input[type="password"].form-control, input[type="datetime"].form-control, input[type="datetime-local"].form-control, input[type="date"].form-control, input[type="month"].form-control, input[type="time"].form-control, input[type="week"].form-control, input[type="number"].form-control, input[type="email"].form-control, input[type="url"].form-control, input[type="search"].form-control, input[type="tel"].form-control, input[type="color"].form-control { '.$frm_ctrl.' }' : '';
echo 'select.form-control option { color: #666; }';
echo isset($frm_btnbar) ? '
.buttons { '.$frm_btnbar.'} .buttons a { color: inherit; }' : '';

/* POP UP
**************************/
echo isset($modal_wrp) ? '
.modal-content { '.$modal_wrp.'}' : '';
echo isset($modal_header) ? '
.modal-header { '.$modal_header.'}' : '';
echo isset($modal_header_fonts) ? '
.modal-title { '.$modal_header_fonts.'}' : '';
echo isset($modal_body) ? '
.modal-body { '.$modal_body.'}' : '';
echo isset($modal_close) ? '
.modal-header .close { '.$modal_close.' opacity: 0.5}' : '';

/* PANELS
**************************/
echo isset($panel['panel_wrp']) ? '
.panel { '.$panel['panel_wrp'].'}' : '';

echo isset($panel['title_block']) ? '
.panel .panel-heading { '.$panel['title_block'].'}' : '';

echo isset($panel['title']) ? '
.panel .panel-title { '.$panel['title'].'}' : '';

echo isset($panel['body_wrp']) ? '
.panel .panel-collapse { '.$panel['body_wrp'].'}' : '';

echo isset($panel['body']) ? '
.panel .panel-body { '.$panel['body'].'}' : '';


/* TOPBAR
**************************/

/* Top bar 1
------------------------*/
if (isset($topbar1) || isset($topbar1_inner)) {

	if($topbar1_inner_status == 'n' && $route != 'common/home') {
		$topbar1_cls = '.inner_pg ';
		$topbar1 = $topbar1_inner;
	} else {
		$topbar1_cls = '';
	}

	echo isset($topbar1['header']) ? 
	$topbar1_cls.'header.topbar-1 { '.$topbar1['header'].'}' : '';

	echo isset($topbar1['innerblock']) ? 
	$topbar1_cls.'header.topbar-1 .tbar1 { '.$topbar1['innerblock'].'}' : '';

	echo isset($topbar1['logo']) ? 
	$topbar1_cls.'.tbar1 #logo a { '.$topbar1['logo'].'}' : '';

	echo isset($topbar1['logo']) ? 
	$topbar1_cls.'.menu-wrp .logo-wrp { '.$topbar1['logo'].'}' : '';

	// Breadcrumb
	echo isset($topbar1['breadcrumb_mainwrp']) ? 
	$topbar1_cls.'header.topbar-1 .breadcrumb-wrp { '.$topbar1['breadcrumb_mainwrp'].'}' : '';

	echo isset($topbar1['breadcrumb_wrp']) ? 
	$topbar1_cls.'header.topbar-1 .breadcrumb { '.$topbar1['breadcrumb_wrp'].'}' : '';

	echo isset($topbar1['breadcrumb_sep']) ? 
	$topbar1_cls.'header.topbar-1 .breadcrumb b { '.$topbar1['breadcrumb_sep'].'}' : '';

	echo isset($topbar1['breadcrumb_a']) ? 
	$topbar1_cls.'header.topbar-1 .breadcrumb a { '.$topbar1['breadcrumb_a'].'}' : '';

	echo isset($topbar1['breadcrumb_a_hover']) ? 
	$topbar1_cls.'header.topbar-1 .breadcrumb a:hover { '.$topbar1['breadcrumb_a_hover'].'}' : '';

	// Top links
	echo isset($topbar1['toplinks_wrp']) ? 
	$topbar1_cls.'.tbar1 .top-links-wrp { '.$topbar1['toplinks_wrp'].'}' : '';
	echo isset($topbar1['toplinks_normal']) ? 
	$topbar1_cls.'.tbar1 .top-links > li > a { '.$topbar1['toplinks_normal'].'}' : '';
	echo isset($topbar1['toplinks_hover']) ? 
	$topbar1_cls.'.tbar1 .top-links > li > a:hover { '.$topbar1['toplinks_hover'].'}' : '';

	// Top drop down
	echo isset($topbar1['tdd']) ? 
	$topbar1_cls.'.tbar1 .t-dd { '.$topbar1['tdd'].'}' : '';

	echo isset($topbar1['tdd_hover']) ? 
	$topbar1_cls.'.tbar1 .t-dd.active { '.$topbar1['tdd_hover'].'}' : '';

	echo isset($topbar1['tdd_sub']) ? 
	$topbar1_cls.'.tbar1 .t-dd .t-dd-menu { '.$topbar1['tdd_sub'].'}' : '';

	echo isset($topbar1['tdd_item']) ? 
	$topbar1_cls.'.t-dd.active .t-dd-menu a {'.$topbar1['tdd_item'].'}' : '';

	echo isset($topbar1['tdd_item_hover']) ? 
	$topbar1_cls.'.t-dd.active .t-dd-menu a:hover {'.$topbar1['tdd_item_hover'].'}' : '';

	// Cart
	echo isset($topbar1['cart']) ? 
	$topbar1_cls.'.tbar1 #cart > .btn { '.$topbar1['cart'].'}' : '';

	echo isset($topbar1['cart_icon']) ? 
	$topbar1_cls.'.tbar1 #cart > .btn i { '.$topbar1['cart_icon'].'}' : '';

	echo isset($topbar1['cart_popup']) ? 
	$topbar1_cls.'.tbar1 #cart .dropdown-menu { '.$topbar1['cart_popup'].'}' : '';

	echo isset($topbar1['cart_popup_link']) ? 
	$topbar1_cls.'.tbar1 #cart .mini-cart-prd a { '.$topbar1['cart_popup_link'].'}' : '';

	echo isset($topbar1['cart_popup_link_hover']) ? 
	$topbar1_cls.'.tbar1 #cart .mini-cart-prd a:hover { '.$topbar1['cart_popup_link_hover'].'}' : '';

	echo isset($topbar1['cart_popup_border_color']) ? 
	$topbar1_cls.'.tbar1 #cart .mini-cart-prd td { '.$topbar1['cart_popup_border_color'].'}' : '';

	echo isset($topbar1['cart_popup_text']) ? 
	$topbar1_cls.'.tbar1 #cart .mini-cart-prd td { '.$topbar1['cart_popup_text'].'}' : '';

	echo isset($topbar1['cart_popup_remove_color']) ? 
	$topbar1_cls.'.tbar1 #cart .mini-cart-prd .btn-default { '.$topbar1['cart_popup_remove_color'].'}' : '';

	echo isset($topbar1['cart_popup_total_block']) ? 
	$topbar1_cls.'.tbar1 #cart .mini-cart-total { '.$topbar1['cart_popup_total_block'].'}' : '';

	echo isset($topbar1['cart_popup_total_text']) ? 
	$topbar1_cls.'.tbar1 #cart .mini-cart-total table { '.$topbar1['cart_popup_total_text'].'}' : '';

	echo isset($topbar1['cart_total_cartbtn']) ? 
	$topbar1_cls.'.tbar1 #cart .mini-cart-total .default-btn { '.$topbar1['cart_total_cartbtn'].'}' : '';

	echo isset($topbar1['cart_total_cartbtn_hover']) ? 
	$topbar1_cls.'.tbar1 #cart .mini-cart-total .default-btn:hover { '.$topbar1['cart_total_cartbtn_hover'].'}' : '';

	echo isset($topbar1['cart_total_checkoutbtn']) ? 
	$topbar1_cls.'.tbar1 #cart .mini-cart-total .primary-btn { '.$topbar1['cart_total_checkoutbtn'].'}' : '';

	echo isset($topbar1['cart_total_checkoutbtn_hover']) ? 
	$topbar1_cls.'.tbar1 #cart .mini-cart-total .primary-btn:hover { '.$topbar1['cart_total_checkoutbtn_hover'].'}' : '';

	// Search box
	echo isset($topbar1['top_search_wrp']) ? 
	$topbar1_cls.'.tbar1 .search-1 .input-wrp { '.$topbar1['top_search_wrp'].'}' : '';
	echo isset($topbar1['top_search_wrp_h']) ? 
	$topbar1_cls.'.tbar1 .search-1:hover .input-wrp { '.$topbar1['top_search_wrp_h'].'}' : '';
	echo isset($topbar1['top_search_input']) ? 
	$topbar1_cls.'.tbar1 .search-1 .input-wrp input { '.$topbar1['top_search_input'].'}' : '';
	echo isset($topbar1['top_search_btn']) ? 
	$topbar1_cls.'.tbar1 .search-1 .btn-wrp .search-btn { '.$topbar1['top_search_btn'].'}' : '';
	echo isset($topbar1['top_search_btn_hover']) ? 
	$topbar1_cls.'.tbar1 .search-1 .btn-wrp .search-btn:hover { '.$topbar1['top_search_btn_hover'].'}' : '';

	// Auto search
	if (isset($topbar1['autosearch'])) { autosearch($topbar1['autosearch'], $topbar1_cls); }
	
	if ($settings['responsive_status']) {
		echo '@media only screen and (min-width: 200px) and (max-width: 979px) {';
		
		echo isset($topbar1['m_header']) ? 
		$topbar1_cls.'header.topbar-1 { '.$topbar1['m_header'].'}' : '';

		echo isset($topbar1['m_logo']) ? 
		$topbar1_cls.'.tbar1 #logo a { '.$topbar1['m_logo'].'}' : '';

		echo isset($topbar1['m_cart']) ? 
		$topbar1_cls.'.topbar-1 #cart > .btn { '.$topbar1['m_cart'].'}' : '';

		echo isset($topbar1['m_search']) ? 
		$topbar1_cls.'.topbar-1 .m-search #search { '.$topbar1['m_search'].'}' : '';

		echo '}';
	}
}



/* Top bar 2
------------------------*/
if (isset($topbar2) || isset($topbar2_inner)) {

	if($topbar2_inner_status == 'n' && $route != 'common/home') {
		$topbar2_cls = '.inner_pg ';
		$topbar2 = $topbar2_inner;
	} else {
		$topbar2_cls = '';
	}

	echo isset($topbar2['header']) ? 
	$topbar2_cls.'header.topbar-2 { '.$topbar2['header'].'}' : '';

	echo isset($topbar2['innerblock']) ? 
	$topbar2_cls.'header.topbar-2 .tbar2 { '.$topbar2['innerblock'].'}' : '';

	echo isset($topbar2['uppertop']) ? 
	$topbar2_cls.'header.topbar-2 .tbar2 .upper-top { '.$topbar2['uppertop'].'}' : '';

	echo isset($topbar2['bottomtop']) ? 
	$topbar2_cls.'header.topbar-2 .tbar2 .bottom-top { '.$topbar2['bottomtop'].'}' : '';

	echo isset($topbar2['logo']) ? 
	$topbar2_cls.'.tbar2 #logo a { '.$topbar2['logo'].'}' : '';
	
	echo isset($topbar2['logo']) ? 
	$topbar2_cls.'.menu-wrp .logo-wrp { '.$topbar2['logo'].'}' : '';

	// Breadcrumb
	echo isset($topbar2['breadcrumb_mainwrp']) ? 
	$topbar2_cls.'header.topbar-2 .breadcrumb-wrp { '.$topbar2['breadcrumb_mainwrp'].'}' : '';
	
	echo isset($topbar2['breadcrumb_wrp']) ? 
	$topbar2_cls.'header.topbar-2 .breadcrumb { '.$topbar2['breadcrumb_wrp'].'}' : '';

	echo isset($topbar2['breadcrumb_sep']) ? 
	$topbar2_cls.'header.topbar-2 .breadcrumb b { '.$topbar2['breadcrumb_sep'].'}' : '';

	echo isset($topbar2['breadcrumb_a']) ? 
	$topbar2_cls.'header.topbar-2 .breadcrumb a { '.$topbar2['breadcrumb_a'].'}' : '';

	echo isset($topbar2['breadcrumb_a_hover']) ? 
	$topbar2_cls.'header.topbar-2 .breadcrumb a:hover { '.$topbar2['breadcrumb_a_hover'].'}' : '';

	// Top links
	echo isset($topbar2['toplinks_wrp']) ? 
	$topbar2_cls.'.tbar2 .top-links { '.$topbar2['toplinks_wrp'].'}' : '';
	echo isset($topbar2['toplinks_normal']) ? 
	$topbar2_cls.'.tbar2 .top-links > li > a { '.$topbar2['toplinks_normal'].'}' : '';
	echo isset($topbar2['toplinks_hover']) ? 
	$topbar2_cls.'.tbar2 .top-links > li > a:hover { '.$topbar2['toplinks_hover'].'}' : '';

	// Top drop down
	echo isset($topbar2['tdd']) ? 
	$topbar2_cls.'.tbar2 .t-dd { '.$topbar2['tdd'].'}' : '';

	echo isset($topbar2['tdd_hover']) ? 
	$topbar2_cls.'.tbar2 .t-dd.active { '.$topbar2['tdd_hover'].'}' : '';

	echo isset($topbar2['tdd_sub']) ? 
	$topbar2_cls.'.tbar2 .t-dd .t-dd-menu { '.$topbar2['tdd_sub'].'}' : '';

	echo isset($topbar2['tdd_item']) ? 
	$topbar2_cls.'.t-dd.active .t-dd-menu a {'.$topbar2['tdd_item'].'}' : '';

	echo isset($topbar2['tdd_item_hover']) ? 
	$topbar2_cls.'.t-dd.active .t-dd-menu a:hover {'.$topbar2['tdd_item_hover'].'}' : '';

	// Cart
	echo isset($topbar2['cart']) ? 
	$topbar2_cls.'.tbar2 #cart > .btn { '.$topbar2['cart'].'}' : '';

	echo isset($topbar2['cart_h']) ? 
	$topbar2_cls.'.tbar2 .cart-lg #cart > .btn:hover { '.$topbar2['cart_h'].'}' : '';

	echo isset($topbar2['cart_icon']) ? 
	$topbar2_cls.'.tbar2 #cart > .btn i { '.$topbar2['cart_icon'].' color: inherit; }' : '';

	echo isset($topbar2['cart_popup']) ? 
	$topbar2_cls.'.tbar2 #cart .dropdown-menu { '.$topbar2['cart_popup'].'}' : '';

	echo isset($topbar2['cart_popup_link']) ? 
	$topbar2_cls.'.tbar2 #cart .mini-cart-prd a { '.$topbar2['cart_popup_link'].'}' : '';

	echo isset($topbar2['cart_popup_link_hover']) ? 
	$topbar2_cls.'.tbar2 #cart .mini-cart-prd a:hover { '.$topbar2['cart_popup_link_hover'].'}' : '';

	echo isset($topbar2['cart_popup_border_color']) ? 
	$topbar2_cls.'.tbar2 #cart .mini-cart-prd td { '.$topbar2['cart_popup_border_color'].'}' : '';

	echo isset($topbar2['cart_popup_text']) ? 
	$topbar2_cls.'.tbar2 #cart .mini-cart-prd td { '.$topbar2['cart_popup_text'].'}' : '';

	echo isset($topbar2['cart_popup_remove_color']) ? 
	$topbar2_cls.'.tbar2 #cart .mini-cart-prd .btn-default { '.$topbar2['cart_popup_remove_color'].'}' : '';

	echo isset($topbar2['cart_popup_total_block']) ? 
	$topbar2_cls.'.tbar2 #cart .mini-cart-total { '.$topbar2['cart_popup_total_block'].'}' : '';

	echo isset($topbar2['cart_popup_total_text']) ? 
	$topbar2_cls.'.tbar2 #cart .mini-cart-total table { '.$topbar2['cart_popup_total_text'].'}' : '';

	echo isset($topbar2['cart_total_cartbtn']) ? 
	$topbar2_cls.'.tbar2 #cart .mini-cart-total .default-btn { '.$topbar2['cart_total_cartbtn'].'}' : '';

	echo isset($topbar2['cart_total_cartbtn_hover']) ? 
	$topbar2_cls.'.tbar2 #cart .mini-cart-total .default-btn:hover { '.$topbar2['cart_total_cartbtn_hover'].'}' : '';

	echo isset($topbar2['cart_total_checkoutbtn']) ? 
	$topbar2_cls.'.tbar2 #cart .mini-cart-total .primary-btn { '.$topbar2['cart_total_checkoutbtn'].'}' : '';

	echo isset($topbar2['cart_total_checkoutbtn_hover']) ? 
	$topbar2_cls.'.tbar2 #cart .mini-cart-total .primary-btn:hover { '.$topbar2['cart_total_checkoutbtn_hover'].'}' : '';

	// Search box
	echo isset($topbar2['top_search_wrp']) ? 
	$topbar2_cls.'.tbar2 .search-2 #search { '.$topbar2['top_search_wrp'].'}' : '';
	echo isset($topbar2['top_search_wrp_h']) ? 
	$topbar2_cls.'.tbar2 .search-2:hover #search { '.$topbar2['top_search_wrp_h'].'}' : '';
	echo isset($topbar2['top_search_input']) ? 
	$topbar2_cls.'.tbar2 .search-2 .input-wrp input { '.$topbar2['top_search_input'].'}' : '';
	echo isset($topbar2['top_search_btn']) ? 
	$topbar2_cls.'.tbar2 .search-2 .btn-wrp .search-btn { '.$topbar2['top_search_btn'].'}' : '';

	echo isset($topbar2['top_search_btn_hover']) ? 
	$topbar2_cls.'.tbar2 .search-2 .btn-wrp .search-btn:hover { '.$topbar2['top_search_btn_hover'].'}' : '';

	echo isset($topbar2['top_search_btn_hover']) ? 
	$topbar2_cls.'.tbar2 .search-2:hover .btn-wrp .search-btn { '.$topbar2['top_search_btn_hover'].'}' : '';

	if (isset($topbar2['autosearch'])) { autosearch($topbar2['autosearch'], $topbar2_cls); }
	
	if ($settings['responsive_status']) {
		echo '@media only screen and (min-width: 200px) and (max-width: 979px) {';
		
		echo isset($topbar2['m_header']) ? 
		$topbar2_cls.'header.topbar-2 { '.$topbar2['m_header'].'}' : '';

		echo isset($topbar2['m_logo']) ? 
		$topbar2_cls.'.tbar2 #logo a { '.$topbar2['m_logo'].'}' : '';

		echo isset($topbar2['m_cart']) ? 
		$topbar2_cls.'#cart > .btn i { color: inherit; }'.
		$topbar2_cls.'.topbar-2 #cart > .btn { '.$topbar2['m_cart'].'}' : '';

		echo isset($topbar2['m_search']) ? 
		$topbar2_cls.'.tbar2 .m-search #search { '.$topbar2['m_search'].'}' : '';

		echo '}';
	}
}


/* PRODUCT BLOCKS
**************************/
include $css_prdblocks;

/* QUICK VIEW
**************************/
include $css_quickview;

/* THEME - OC MODULE : FEATURED
**************************/
if (isset($ocmd_featured)) {

	echo isset($ocmd_featured['wrapper']) ? '
	#content .oc-featured { '. $ocmd_featured['wrapper'] . ' }' : '';

	echo isset($ocmd_featured['mod_hd']) ? '
	#content .oc-featured .mod-hd { '. $ocmd_featured['mod_hd'] . ' }' : '';

	echo isset($ocmd_featured['prd_wrp']) ? '
	#content .oc-featured .mod-content { '. $ocmd_featured['prd_wrp'] . ' }' : '';

	if (isset($ocmd_featured['prd1'])) {
		prd1($ocmd_featured['prd1'], '.oc-featured ');
	}
	if (isset($ocmd_featured['prd2'])) {
		prd2($ocmd_featured['prd2'], '.oc-featured ');
	}
	if (isset($ocmd_featured['smallprd1'])) {
		smallprd1($ocmd_featured['smallprd1'], '.oc-featured ');
	}
	if (isset($ocmd_featured['smallprd2'])) {
		smallprd2($ocmd_featured['smallprd2'], '.oc-featured ');
	}
}

/* THEME - OC MODULE : LATEST
**************************/
if (isset($ocmd_latest)) {

	echo isset($ocmd_latest['wrapper']) ? '
	#content .oc-latest { '. $ocmd_latest['wrapper'] . ' }' : '';

	echo isset($ocmd_latest['mod_hd']) ? '
	#content .oc-latest .mod-hd { '. $ocmd_latest['mod_hd'] . ' }' : '';

	echo isset($ocmd_latest['prd_wrp']) ? '
	#content .oc-latest .mod-content { '. $ocmd_latest['prd_wrp'] . ' }' : '';

	if (isset($ocmd_latest['prd1'])) {
		prd1($ocmd_latest['prd1'], '.oc-latest ');
	}
	if (isset($ocmd_latest['prd2'])) {
		prd2($ocmd_latest['prd2'], '.oc-latest ');
	}
	if (isset($ocmd_latest['smallprd1'])) {
		smallprd1($ocmd_latest['smallprd1'], '.oc-latest ');
	}
	if (isset($ocmd_latest['smallprd2'])) {
		smallprd2($ocmd_latest['smallprd2'], '.oc-latest ');
	}
}

/* THEME - OC MODULE : BEST SELLERS
**************************/
if (isset($ocmd_best)) {

	echo isset($ocmd_best['wrapper']) ? '
	#content .oc-best { '. $ocmd_best['wrapper'] . ' }' : '';

	echo isset($ocmd_best['mod_hd']) ? '
	#content .oc-best .mod-hd { '. $ocmd_best['mod_hd'] . ' }' : '';

	echo isset($ocmd_best['prd_wrp']) ? '
	#content .oc-best .mod-content { '. $ocmd_best['prd_wrp'] . ' }' : '';

	if (isset($ocmd_best['prd1'])) {
		prd1($ocmd_best['prd1'], '.oc-best ');
	}
	if (isset($ocmd_best['prd2'])) {
		prd2($ocmd_best['prd2'], '.oc-best ');
	}
	if (isset($ocmd_best['smallprd1'])) {
		smallprd1($ocmd_best['smallprd1'], '.oc-best ');
	}
	if (isset($ocmd_best['smallprd2'])) {
		smallprd2($ocmd_best['smallprd2'], '.oc-best ');
	}
}

/* THEME - OC MODULE : SPECIAL
**************************/
if (isset($ocmd_special)) {

	echo isset($ocmd_special['wrapper']) ? '
	#content .oc-special { '. $ocmd_special['wrapper'] . ' }' : '';

	echo isset($ocmd_special['mod_hd']) ? '
	#content .oc-special .mod-hd { '. $ocmd_special['mod_hd'] . ' }' : '';

	echo isset($ocmd_special['prd_wrp']) ? '
	#content .oc-special .mod-content { '. $ocmd_special['prd_wrp'] . ' }' : '';

	if (isset($ocmd_special['prd1'])) {
		prd1($ocmd_special['prd1'], '.oc-special ');
	}
	if (isset($ocmd_special['prd2'])) {
		prd2($ocmd_special['prd2'], '.oc-special ');
	}
	if (isset($ocmd_special['smallprd1'])) {
		smallprd1($ocmd_special['smallprd1'], '.oc-special ');
	}
	if (isset($ocmd_special['smallprd2'])) {
		smallprd2($ocmd_special['smallprd2'], '.oc-special ');
	}
}

/* THEME - OC MODULE : SLIDE SHOW
**************************/
if (isset($ocmd_slideshow)) {

	echo isset($ocmd_slideshow['wrapper']) ? 
	'.oc-slideshow { '. $ocmd_slideshow['wrapper'] . ' }' : '';

	echo isset($ocmd_slideshow['dot_line']) ? 
	'.oc-slideshow .dots-typ1 .owl-dots:after { '. $ocmd_slideshow['dot_line'] . ' }' : '';

	echo isset($ocmd_slideshow['dot_normal']) ? 
	'.oc-slideshow .dots-typ1 .owl-dots .owl-dot,'.
	'.oc-slideshow .dots-typ2 .owl-dots .owl-dot span { '. $ocmd_slideshow['dot_normal'] . ' }' : '';

	echo isset($ocmd_slideshow['dot_active']) ? 
	'.oc-slideshow .dots-typ1 .owl-dots .owl-dot:hover,'.
	'.oc-slideshow .dots-typ1 .owl-dots .owl-dot.active,'.
	'.oc-slideshow .dots-typ2 .owl-dots .owl-dot:hover span,'.
	'.oc-slideshow .dots-typ2 .owl-dots .owl-dot.active span { '. $ocmd_slideshow['dot_active'] . ' }' : '';	
	
}

/* THEME - OC MODULE : MY ACCOUNT AND CATEGORY LINKS
**************************/
if (isset($ocmod_cataccount)) {
	
	echo isset($ocmod_cataccount['hd']) ? '
	.cat-links .col-mod-hd, 
	.account-links .col-mod-hd { '. $ocmod_cataccount['hd'] . ' }' : '';

	echo isset($ocmod_cataccount['list_wrp']) ? '
	.cat-links .col-links, 
	.account-links .col-links,
	.cat-links .link-list, 
	.account-links .link-list { '. $ocmod_cataccount['list_wrp'] . ' }' : '';

	echo isset($ocmod_cataccount['list_item']) ? '
	.cat-links .col-links > ul > li, 
	.account-links .col-links > ul > li, 
	.cat-links .link-list > a, 
	.account-links .link-list > a { '. $ocmod_cataccount['list_item'] . ' }' : '';

	echo isset($ocmod_cataccount['list_item_hover']) ? '
	.cat-links .col-links > ul > li:hover,
	.account-links .col-links > ul > li:hover,
	.cat-links .link-list > a:hover, 
	.account-links .link-list > a:hover { '. $ocmod_cataccount['list_item_hover'] . ' }' : '';

	echo isset($ocmod_cataccount['sublink_wrp']) ? '
	.cat-links .col-links > ul > li > ul, 
	.account-links .col-links > ul > li > ul, 
	.cat-links .link-list .sub-links, 
	.account-links .link-list .sub-links { '. $ocmod_cataccount['sublink_wrp'] . ' }' : '';

	echo isset($ocmod_cataccount['sublink_item']) ? '
	.cat-links .col-links > ul > li ul > li, 
	.account-links .col-links > ul > li ul > li, 
	.cat-links .link-list .sub-links a, 
	.account-links .link-list .sub-links a { '. $ocmod_cataccount['sublink_item'] . ' }' : '';

	echo isset($ocmod_cataccount['sublink_item_hover']) ? '
	.cat-links .col-links > ul > li ul > li:hover, 
	.account-links .col-links > ul > li ul > li:hover, 
	.cat-links .link-list .sub-links a:hover, 
	.account-links .link-list .sub-links a:hover { '. $ocmod_cataccount['sublink_item_hover'] . ' }' : '';

	echo isset($ocmod_cataccount['sublink_bullet']) ? '
	.cat-links .col-links > ul > li ul > li:before, 
	.account-links .col-links > ul > li ul > li:before, 
	.cat-links .link-list .sub-links a:before, 
	.account-links .link-list .sub-links a:before { '. $ocmod_cataccount['sublink_bullet'] . ' }' : '';
}


/* MODULE - MEGA MENU
**************************/
if (isset($rgen_menu)) {
	foreach ($rgen_menu as $key => $value) {
		
		$keyparts = explode('.', $key);
		$menuclass = '.menu-'.$keyparts[1];

		/* Menu bar
		------------------------*/
		echo isset($value['container']) ? '
		#menu { '. $value['container'] . ' }' : '';

		echo isset($value['menubar']) ? 
		$menuclass.' { '. $value['menubar'] . ' }' : '';

		echo isset($value['m_handle']) ? 
		'.mob '.$menuclass.' .rg-nav-handle { '.$value['m_handle'].'}' : '';

		echo isset($value['m_subhandle']) ? 
		'.mob '.$menuclass.' .nav-sub-handle { '.$value['m_subhandle'].'}' : '';

		echo isset($value['m_nav']) ? 
		'.mob '.$menuclass.' .rg-nav.open { '.$value['m_nav'].'}' : '';

		echo isset($value['m_subwrp']) ? 
		'.mob '.$menuclass.' .rg-nav > li.active > .sub { '.$value['m_subwrp'].'}' : '';

		echo isset($value['m_sub']) ? 
		'.mob '.$menuclass.' .rg-nav > li.active .nav-mega { '.$value['m_sub'].'}' : '';

		echo isset($value['m_mainitem']) ? 
		'.mob '.$menuclass.' .rg-nav > li > .main-item,
		.mob '.$menuclass.' .rg-nav > li:first-child > .main-item { '.$value['m_mainitem'].'}' : '';

		echo isset($value['m_subitem']) ? 
		'.mob '.$menuclass.' .nav-fly li > a { '.$value['m_subitem'].'}' : '';

		/* Menu item
		------------------------*/
		echo isset($value['menuitem_wrp']) ?
		$menuclass.' .rg-nav > li { '. $value['menuitem_wrp'] . ' }' : '';

		echo isset($value['menuitem']) ?
		$menuclass.' .rg-nav > li > .main-item { '. $value['menuitem'] . ' }' : '';

		echo isset($value['menuitem_hover']) ?
		$menuclass.' .rg-nav > li:hover > .main-item { '. $value['menuitem_hover'] . ' }' : '';

		echo isset($value['menuitem_first']) ?
		$menuclass.' .rg-nav > li:first-child > .main-item { '. $value['menuitem_first'] . ' }' : '';

		echo isset($value['menuitem_first_hover']) ?
		$menuclass.' .rg-nav > li:first-child:hover > .main-item { '. $value['menuitem_first_hover'] . ' }' : '';

		echo isset($value['menuitem_last']) ?
		$menuclass.' .rg-nav > li:last-child > .main-item { '. $value['menuitem_last'] . ' }' : '';

		echo isset($value['menuitem_last_hover']) ?
		$menuclass.' .rg-nav > li:last-child:hover > .main-item { '. $value['menuitem_last_hover'] . ' }' : '';

		
		/* Flyout menu item
		------------------------*/
		echo isset($value['flyout_wrp']) ?
		$menuclass.' .nav-fly { '. $value['flyout_wrp'] . ' }' : '';

		echo isset($value['flyout_item']) ?
		$menuclass.' 
		.nav-fly li > a, 
		.flyout-prd,
		.flyout-brand { '. $value['flyout_item'] . ' }' : '';

		echo isset($value['flyout_item_hover']) ?
		$menuclass.' 
		.nav-fly li:hover > a,
		.nav-fly li:hover .flyout-prd,
		.nav-fly li:hover .flyout-brand { '. $value['flyout_item_hover'] . ' }' : '';

		/*echo isset($value['flyout_item_text']) ?
		$menuclass.' 
		.flyout-prd .info-wrp a,
		.flyout-brand a { '. $value['flyout_item_text'] . ' }' : '';

		echo isset($value['flyout_item_text_hover']) ?
		$menuclass.' 
		.nav-fly li:hover .flyout-prd a,
		.nav-fly li:hover .flyout-brand a { '. $value['flyout_item_text_hover'] . ' }' : '';*/

		/* Mega menu block
		------------------------*/
		echo isset($value['megamenu_wrp']) ?
		$menuclass.' .nav-mega { '. $value['megamenu_wrp'] . ' }' : '';

		/* Mega menu item - normal 
		------------------------*/
		echo isset($value['normal']['block']) ?
		$menuclass.' .normal-item { '. $value['normal']['block'] . ' }' : '';

		echo isset($value['normal']['link']) ?
		$menuclass.' .normal-item > li .sub-item { '. $value['normal']['link'] . ' }' : '';

		echo isset($value['normal']['link_hover']) ?
		$menuclass.' .normal-item > li:hover .sub-item { '. $value['normal']['link_hover'] . ' }' : '';

		echo isset($value['normal']['heading']) ?
		$menuclass.' .normal-item > .hd .sub-item { '. $value['normal']['heading'] . ' }' : '';

		echo isset($value['normal']['heading_hover']) ?
		$menuclass.' .normal-item > .hd:hover .sub-item { '. $value['normal']['heading_hover'] . ' }' : '';

		/* Mega menu item - Category block 1
		------------------------*/
		echo isset($value['catblock1']['block']) ?
		$menuclass.' .cat-block1 { '. $value['catblock1']['block'] . ' }' : '';

		echo isset($value['catblock1']['link']) ?
		$menuclass.' .cat-block1 > li .sub-item { '. $value['catblock1']['link'] . ' }' : '';

		echo isset($value['catblock1']['link_hover']) ?
		$menuclass.' .cat-block1 > li:hover .sub-item { '. $value['catblock1']['link_hover'] . ' }' : '';

		echo isset($value['catblock1']['heading']) ?
		$menuclass.' .cat-block1 > .hd .sub-item { '. $value['catblock1']['heading'] . ' }' : '';

		echo isset($value['catblock1']['heading_hover']) ?
		$menuclass.' .cat-block1 > .hd:hover .sub-item { '. $value['catblock1']['heading_hover'] . ' }' : '';

		/* Mega menu item - Category block 2
		------------------------*/
		echo isset($value['catblock2']['block']) ?
		$menuclass.' .cat-block2 { '. $value['catblock2']['block'] . ' }' : '';

		echo isset($value['catblock2']['img']) ?
		$menuclass.' .cat-block2 .cat-img { '. $value['catblock2']['img'] . ' }' : '';
		
		echo isset($value['catblock2']['link']) ?
		$menuclass.' .cat-block2 > li .sub-item { '. $value['catblock2']['link'] . ' }' : '';

		echo isset($value['catblock2']['link_hover']) ?
		$menuclass.' .cat-block2 > li:hover .sub-item { '. $value['catblock2']['link_hover'] . ' }' : '';

		echo isset($value['catblock2']['heading']) ?
		$menuclass.' .cat-block2 > .hd .sub-item { '. $value['catblock2']['heading'] . ' }' : '';

		echo isset($value['catblock2']['heading_hover']) ?
		$menuclass.' .cat-block2 > .hd:hover .sub-item { '. $value['catblock2']['heading_hover'] . ' }' : '';


		/* Mega menu item - prd 1 
		------------------------*/
		echo isset($value['prdblock1']['block']) ?
		$menuclass.' .sm-prd-block1 { '. $value['prdblock1']['block'] . ' }' : '';

		echo isset($value['prdblock1']['linktext']) ?
		$menuclass.' .sm-prd-block1 .name a { '. $value['prdblock1']['linktext'] . ' }' : '';

		echo isset($value['prdblock1']['linktext_hover']) ?
		$menuclass.' .sm-prd-block1 .name a:hover { '. $value['prdblock1']['linktext_hover'] . ' }' : '';

		echo isset($value['prdblock1']['price']) ?
		$menuclass.' .sm-prd-block1 .price { '. $value['prdblock1']['price'] . ' }' : '';

		echo isset($value['prdblock1']['button']) ?
		$menuclass.' .sm-prd-block1 .btn { '. $value['prdblock1']['button'] . ' }' : '';

		echo isset($value['prdblock1']['button_hover']) ?
		$menuclass.' .sm-prd-block1 .btn:hover { '. $value['prdblock1']['button_hover'] . ' }' : '';

		/* Mega menu item - prd 2 
		------------------------*/
		echo isset($value['prdblock2']['block']) ?
		$menuclass.' .sm-prd-block2 { '. $value['prdblock2']['block'] . ' }' : '';

		echo isset($value['prdblock2']['linktext']) ?
		$menuclass.' .sm-prd-block2 .name a { '. $value['prdblock2']['linktext'] . ' }' : '';

		echo isset($value['prdblock2']['linktext_hover']) ?
		$menuclass.' .sm-prd-block2 .name a:hover { '. $value['prdblock2']['linktext_hover'] . ' }' : '';

		echo isset($value['prdblock2']['price']) ?
		$menuclass.' .sm-prd-block2 .price { '. $value['prdblock2']['price'] . ' }' : '';

		echo isset($value['prdblock2']['button']) ?
		$menuclass.' .sm-prd-block2 .btn { '. $value['prdblock2']['button'] . ' }' : '';

		echo isset($value['prdblock2']['button_hover']) ?
		$menuclass.' .sm-prd-block2 .btn:hover { '. $value['prdblock2']['button_hover'] . ' }' : '';

		/* Mega menu item - Brand 1 
		------------------------*/
		echo isset($value['brandblock1']['block']) ?
		$menuclass.' .brand-block1 { '. $value['brandblock1']['block'] . ' }' : '';

		echo isset($value['brandblock1']['block_hover']) ?
		$menuclass.' .brand-block1:hover { '. $value['brandblock1']['block_hover'] . ' }' : '';

		echo isset($value['brandblock1']['linktext']) ?
		$menuclass.' .brand-block1 span { '. $value['brandblock1']['linktext'] . ' }' : '';

		echo isset($value['brandblock1']['linktext_hover']) ?
		$menuclass.' .brand-block1:hover span { '. $value['brandblock1']['linktext_hover'] . ' }' : '';
		
		/* Mega menu item - Brand 2
		------------------------*/
		echo isset($value['brandblock2']['block']) ?
		$menuclass.' .brand-block2 { '. $value['brandblock2']['block'] . ' }' : '';

		echo isset($value['brandblock2']['block_hover']) ?
		$menuclass.' .brand-block2:hover span { '. $value['brandblock2']['block_hover'] . ' }' : '';

		echo isset($value['brandblock2']['text']) ?
		$menuclass.' .brand-block2:hover span b { '. $value['brandblock2']['text'] . ' }' : '';


		/* Mega menu item - Image 1 
		------------------------*/
		echo isset($value['imageblock1']['block']) ?
		$menuclass.' .bannerimg-block1 { '. $value['imageblock1']['block'] . ' }' : '';

		echo isset($value['imageblock1']['block_hover']) ?
		$menuclass.' .bannerimg-block1:hover { '. $value['imageblock1']['block_hover'] . ' }' : '';

		echo isset($value['imageblock1']['linktext']) ?
		$menuclass.' .bannerimg-block1 span { '. $value['imageblock1']['linktext'] . ' }' : '';

		echo isset($value['imageblock1']['linktext_hover']) ?
		$menuclass.' .bannerimg-block1:hover span { '. $value['imageblock1']['linktext_hover'] . ' }' : '';

		/* Mega menu item - Image 2
		------------------------*/
		echo isset($value['imageblock2']['block']) ?
		$menuclass.' .bannerimg-block2 { '. $value['imageblock2']['block'] . ' }' : '';

		echo isset($value['imageblock2']['block_hover']) ?
		$menuclass.' .bannerimg-block2:hover span { '. $value['imageblock2']['block_hover'] . ' }' : '';

		echo isset($value['imageblock2']['text']) ?
		$menuclass.' .bannerimg-block2:hover span b { '. $value['imageblock2']['text'] . ' }' : '';

		/* Mega menu item - Image 3 
		------------------------*/
		echo isset($value['imageblock3']['block']) ?
		$menuclass.' .bannerimg-block3 { '. $value['imageblock3']['block'] . ' }' : '';

		echo isset($value['imageblock3']['block_hover']) ?
		$menuclass.' .bannerimg-block3:hover { '. $value['imageblock3']['block_hover'] . ' }' : '';

		echo isset($value['imageblock3']['linktext']) ?
		$menuclass.' .bannerimg-block3 span { '. $value['imageblock3']['linktext'] . ' }' : '';

		echo isset($value['imageblock3']['linktext_hover']) ?
		$menuclass.' .bannerimg-block3:hover span { '. $value['imageblock3']['linktext_hover'] . ' }' : '';

		/* Mega menu item - Image 4
		------------------------*/
		echo isset($value['imageblock4']['block']) ?
		$menuclass.' .bannerimg-block4 { '. $value['imageblock4']['block'] . ' }' : '';

		echo isset($value['imageblock4']['block_hover']) ?
		$menuclass.' .bannerimg-block4:hover { '. $value['imageblock4']['block_hover'] . ' }' : '';

		/* Mega menu item - Info box 1
		------------------------*/
		echo isset($value['infoblock1']['block']) ?
		$menuclass.' .menu-infobox1 { '. $value['infoblock1']['block'] . ' }' : '';

		echo isset($value['infoblock1']['heading']) ?
		$menuclass.' .menu-infobox1 .name { '. $value['infoblock1']['heading'] . ' }' : '';

		echo isset($value['infoblock1']['image']) ?
		$menuclass.' .menu-infobox1 .image { '. $value['infoblock1']['image'] . ' }' : '';

		echo isset($value['infoblock1']['content']) ?
		$menuclass.' .menu-infobox1 .text { '. $value['infoblock1']['content'] . ' }' : '';

		echo isset($value['infoblock1']['button_wrp']) ?
		$menuclass.' .menu-infobox1 .btn-wrp { '. $value['infoblock1']['button_wrp'] . ' }' : '';

		echo isset($value['infoblock1']['button']) ?
		$menuclass.' .menu-infobox1 .default-btn { '. $value['infoblock1']['button'] . ' }' : '';

		echo isset($value['infoblock1']['button_hover']) ?
		$menuclass.' .menu-infobox1 .default-btn:hover { '. $value['infoblock1']['button_hover'] . ' }' : '';

		/* Mega menu item - Info box 2
		------------------------*/
		echo isset($value['infoblock2']['block']) ?
		$menuclass.' .menu-infobox2 { '. $value['infoblock2']['block'] . ' }' : '';

		echo isset($value['infoblock2']['heading']) ?
		$menuclass.' .menu-infobox2 .name { '. $value['infoblock2']['heading'] . ' }' : '';

		echo isset($value['infoblock2']['image']) ?
		$menuclass.' .menu-infobox2 .image { '. $value['infoblock2']['image'] . ' }' : '';

		echo isset($value['infoblock2']['content']) ?
		$menuclass.' .menu-infobox2 .text { '. $value['infoblock2']['content'] . ' }' : '';

		echo isset($value['infoblock2']['button_wrp']) ?
		$menuclass.' .menu-infobox2 .btn-wrp { '. $value['infoblock2']['button_wrp'] . ' }' : '';

		echo isset($value['infoblock2']['button']) ?
		$menuclass.' .menu-infobox2 .default-btn { '. $value['infoblock2']['button'] . ' }' : '';

		echo isset($value['infoblock2']['button_hover']) ?
		$menuclass.' .menu-infobox2 .default-btn:hover { '. $value['infoblock2']['button_hover'] . ' }' : '';

		/* Mega menu item - Info box 3
		------------------------*/
		echo isset($value['infoblock3']['block']) ?
		$menuclass.' .menu-infobox3 { '. $value['infoblock3']['block'] . ' }' : '';

		echo isset($value['infoblock3']['heading']) ?
		$menuclass.' .menu-infobox3 .name { '. $value['infoblock3']['heading'] . ' }' : '';

		echo isset($value['infoblock3']['image']) ?
		$menuclass.' .menu-infobox3 .image { '. $value['infoblock3']['image'] . ' }' : '';

		echo isset($value['infoblock3']['content']) ?
		$menuclass.' .menu-infobox3 .text { '. $value['infoblock3']['content'] . ' }' : '';

		echo isset($value['infoblock3']['button_wrp']) ?
		$menuclass.' .menu-infobox3 .btn-wrp { '. $value['infoblock3']['button_wrp'] . ' }' : '';

		echo isset($value['infoblock3']['button']) ?
		$menuclass.' .menu-infobox3 .default-btn { '. $value['infoblock3']['button'] . ' }' : '';

		echo isset($value['infoblock3']['button_hover']) ?
		$menuclass.' .menu-infobox3 .default-btn:hover { '. $value['infoblock3']['button_hover'] . ' }' : '';

		/* Mega menu item - Info box 4
		------------------------*/
		echo isset($value['infoblock4']['block']) ?
		$menuclass.' .menu-infobox4 { '. $value['infoblock4']['block'] . ' }' : '';

		echo isset($value['infoblock4']['heading']) ?
		$menuclass.' .menu-infobox4 .name { '. $value['infoblock4']['heading'] . ' }' : '';

		echo isset($value['infoblock4']['image']) ?
		$menuclass.' .menu-infobox4 .image { '. $value['infoblock4']['image'] . ' }' : '';

		echo isset($value['infoblock4']['content']) ?
		$menuclass.' .menu-infobox4 .text { '. $value['infoblock4']['content'] . ' }' : '';

		echo isset($value['infoblock4']['button']) ?
		$menuclass.' .menu-infobox4 .default-btn { '. $value['infoblock4']['button'] . ' }' : '';

		echo isset($value['infoblock4']['button_hover']) ?
		$menuclass.' .menu-infobox4 .default-btn:hover { '. $value['infoblock4']['button_hover'] . ' }' : '';

		/* Mega menu item - Custom HTML
		------------------------*/
		echo isset($value['customhtml']['block']) ?
		$menuclass.' .nav-customhtml { '. $value['customhtml']['block'] . ' }' : '';
	}
}

/* MODULE - BASIC SLIDESHOW
**************************/
if (isset($basicslideshow)) {
	foreach ($basicslideshow as $key => $value) {
		
		$keyparts = explode('.', $key);
		$basicslideshowcls = '.basicslideshow-'.$keyparts[1];

		/* Structure
		------------------------*/
		echo isset($value['main_wrp']) ? 
		$basicslideshowcls.' { '. $value['main_wrp'] . ' }' : '';

		echo isset($value['container']) ? 
		$basicslideshowcls.' > .container { '. $value['container'] . ' }' : '';

		echo isset($value['slideshow_wrp']) ? 
		$basicslideshowcls.' .slideshow-wrp { '. $value['slideshow_wrp'] . ' }' : '';

		echo isset($value['slideshow']) ? 
		$basicslideshowcls.' .slideshow { '. $value['slideshow'] . ' }' : '';
	}
}

/* MODULE - PRODUCT GROUPS
**************************/
include $css_productgroups;

/* MODULE - BASIC BANNERS
**************************/
include $css_basicbanners;

/* MODULE - CONTENT BLOCKS
**************************/
include $css_contentblocks;

/* MODULE - REVO SLIDER
**************************/
include $css_revslider;

/* MODULE - REVO SLIDER
**************************/
include $css_gridmanager;

/* MODULE - BANNER GRIDS
**************************/
include $css_bannergrids;

/* MODULE - IMAGE GALLERY
**************************/
include $css_imagegallery;

/* MODULE - CUSTOM HTML
**************************/
if (isset($customhtmls)) {
	foreach ($customhtmls as $key => $value) {
		
		$keyparts = explode('.', $key);
		$customhtmlscls = '.customhtml-'.$keyparts[1];

		/* Large screens
		------------------------*/
		if (isset($value['d'])) {
			fn_customhtmls($value['d'], $customhtmlscls);
		}
		
		/* Tablet and Mobile
		------------------------*/
		if ($settings['responsive_status']) {
			echo '@media only screen and (min-width: 768px) and (max-width: 979px) {';
			if (isset($value['t'])) {
				fn_customhtmls($value['t'], $customhtmlscls);
			}
			echo '}';

			echo '@media only screen and (min-width: 200px) and (max-width: 767px) {';
			if (isset($value['m'])) {
				fn_customhtmls($value['m'], $customhtmlscls);
			}
			echo '}';
		}
	}
}

/* MODULE - PRODUCT PAGE : HTML
**************************/
include $css_prdpghtml;

/* MODULE - STICKY HTML
**************************/
include $css_stickyhtml;

/* MODULE - CATEGORY SHOWCASE
**************************/
include $css_catshowcase;

/* MODULE - DEALS SHOWCASE
**************************/
include $css_deals;

/* PAGES
**************************/

/* Category page
=========================*/
echo isset($pg_category['catinfo']) ?
'.category_pg .category-info { '. $pg_category['catinfo'] . ' }' : '';

// Refine category 1
echo isset($pg_category['refine1_block']) ?
'.category_pg .refine-search1 { '. $pg_category['refine1_block'] . ' }' : '';

echo isset($pg_category['refine1_title']) ?
'.category_pg .refine-search1 .h3 { '. $pg_category['refine1_title'] . ' }' : '';

echo isset($pg_category['refine1_links']) ?
'.category_pg .refine-search1 a { '. $pg_category['refine1_links'] . ' }' : '';

echo isset($pg_category['refine1_links_hover']) ?
'.category_pg .refine-search1 a:hover { '. $pg_category['refine1_links_hover'] . ' }' : '';

// Refine category 2
echo isset($pg_category['refine2_block']) ?
'.category_pg .refine-search2 { '. $pg_category['refine2_block'] . ' }' : '';

echo isset($pg_category['refine2_title']) ?
'.category_pg .refine-search2 .h3 { '. $pg_category['refine2_title'] . ' }' : '';

echo isset($pg_category['refine2_links']) ?
'.category_pg .refine-search2 a { '. $pg_category['refine2_links'] . ' }' : '';

echo isset($pg_category['refine2_links_hover']) ?
'.category_pg .refine-search2 a:hover { '. $pg_category['refine2_links_hover'] . ' }' : '';


/* Product page
=========================*/
if (isset($prdpg_general)) {

	// Product structure
	echo isset($prdpg_general['main_wrp']) ? '
	.product-info { '. $prdpg_general['main_wrp'] . ' }' : '';

	echo isset($prdpg_general['main_rw']) ? '
	.product-info .rw-wrp { '. $prdpg_general['main_rw'] . ' }' : '';

	echo isset($prdpg_general['l_wrp']) ? '
	.product-info .rw-wrp > l-wrp { '. $prdpg_general['l_wrp'] . ' }' : '';

	echo isset($prdpg_general['l_in']) ? '
	.product-info .rw-wrp > l-wrp prdinfo-left { '. $prdpg_general['l_in'] . ' }' : '';

	echo isset($prdpg_general['r_wrp']) ? '
	.product-info .rw-wrp > r-wrp { '. $prdpg_general['r_wrp'] . ' }' : '';

	echo isset($prdpg_general['r_in']) ? '
	.product-info .rw-wrp > r-wrp prdinfo-right { '. $prdpg_general['r_in'] . ' }' : '';

	// Breadcrumb
	echo isset($prdpg_general['pg_heading_wrp']) ? 
	'.product_pg .page-head { '.$prdpg_general['pg_heading_wrp'].'}' : '';

	echo isset($prdpg_general['breadcrumb_wrp']) ? 
	'.product_pg .page-head .breadcrumb { '.$prdpg_general['breadcrumb_wrp'].'}' : '';

	echo isset($prdpg_general['breadcrumb_sep']) ? 
	'.product_pg .page-head .breadcrumb b { '.$prdpg_general['breadcrumb_sep'].'}' : '';

	echo isset($prdpg_general['breadcrumb_a']) ? 
	'.product_pg .page-head .breadcrumb a { '.$prdpg_general['breadcrumb_a'].'}' : '';

	echo isset($prdpg_general['breadcrumb_a_hover']) ? 
	'.product_pg .page-head .breadcrumb a:hover { '.$prdpg_general['breadcrumb_a_hover'].'}' : '';


	// Title
	echo isset($prdpg_general['title']) ? '
	.product-info h1 { '. $prdpg_general['title'] . ' } .product-info h1 strong { font-weight: inherit; }' : '';

	echo isset($prdpg_general['hr']) ? '
	.product-info h1 .hr { '. $prdpg_general['hr'] . ' }' : '';

	// Item info
	echo isset($prdpg_general['iteminfo_block']) ? '
	.product-info .item-info { '. $prdpg_general['iteminfo_block'] . ' }' : '';
	
	echo isset($prdpg_general['iteminfo_item']) ? '
	.product-info .item-info li { '. $prdpg_general['iteminfo_item'] . ' }
	.product-info .item-info li a { color: inherit; text-decoration: underline; }' : '';
	
	echo isset($prdpg_general['iteminfo_lbl']) ? '
	.product-info .item-info span { '. $prdpg_general['iteminfo_lbl'] . ' }' : '';

	// Tags
	echo isset($prdpg_general['tags_a']) ?
	'.product-info .tags a { '. $prdpg_general['tags_a'] . ' }' : '';

	echo isset($prdpg_general['tags_a_hover']) ?
	'.product-info .tags a:hover { '. $prdpg_general['tags_a_hover'] . ' }' : '';

	// Rating
	echo isset($prdpg_general['rating_block']) ?
	'.product-info .rating-wrp { '. $prdpg_general['rating_block'] . ' }' : '';

	echo isset($prdpg_general['rating_active']) ?
	'.product-info .rating-wrp .review-stars .fa-star { '. $prdpg_general['rating_active'] . ' }' : '';

	echo isset($prdpg_general['rating_normal']) ?
	'.product-info .rating-wrp .review-stars .fa-star-o { '. $prdpg_general['rating_normal'] . ' }' : '';

	echo isset($prdpg_general['rating_a']) ?
	'.product-info .rating-wrp a { '. $prdpg_general['rating_a'] . ' }' : '';

	echo isset($prdpg_general['rating_a_hover']) ?
	'.product-info .rating-wrp a:hover { '. $prdpg_general['rating_a_hover'] . ' }' : '';
}
// Main image block
if (isset($prdpg_main_img)) {
	
	echo isset($prdpg_main_img['outer_block']) ?
	'.product-info .product-images { '. $prdpg_main_img['outer_block'] . ' }' : '';

	echo isset($prdpg_main_img['main_img_wrp']) ?
	'.product-info .product-images .main-img { '. $prdpg_main_img['main_img_wrp'] . ' }' : '';

	echo isset($prdpg_main_img['main_img']) ?
	'.product-info .product-images .main-img a { '. $prdpg_main_img['main_img'] . ' }' : '';

	echo isset($prdpg_main_img['th_wrp']) ?
	'.product-info .product-images .additional-img { '. $prdpg_main_img['th_wrp'] . ' }' : '';

	echo isset($prdpg_main_img['th_img']) ?
	'.product-info .product-images .additional-img .img { '. $prdpg_main_img['th_img'] . ' }' : '';

	echo isset($prdpg_main_img['th_active']) ?
	'.product-info .product-images .additional-img .img.active { '. $prdpg_main_img['th_active'] . ' }' : '';

	echo isset($prdpg_main_img['th_active_img']) ?
	'.product-info .product-images .additional-img .img.active img { '. $prdpg_main_img['th_active_img'] . ' }' : '';

	echo isset($prdpg_main_img['arrow_wrp']) ?
	'.product-info .product-images .additional-img .owl-controls { '. $prdpg_main_img['arrow_wrp'] . ' }' : '';

	echo isset($prdpg_main_img['arrow_line']) ?
	'.product-info .product-images .additional-img .owl-controls .owl-nav:after { '. $prdpg_main_img['arrow_line'] . ' }' : '';

	echo isset($prdpg_main_img['arrows']) ?
	'.product-info .product-images .additional-img .owl-controls .owl-nav > div { '. $prdpg_main_img['arrows'] . ' }' : '';

	echo isset($prdpg_main_img['arrows_hover']) ?
	'.product-info .product-images .additional-img .owl-controls .owl-nav > div:hover { '. $prdpg_main_img['arrows_hover'] . ' }' : '';
}
// Tabs
if (isset($prdpg_tabs)) {
	echo isset($prdpg_tabs['tabs']['bar']) ? '
	.product-info .nav-tabs { '. $prdpg_tabs['tabs']['bar'] . ' }' : '';

	echo isset($prdpg_tabs['tabs']['item_wrp']) ? '
	.product-info .nav-tabs > li { '. $prdpg_tabs['tabs']['item_wrp'] . ' }' : '';

	echo isset($prdpg_tabs['tabs']['active_wrp']) ? '
	.product-info .nav-tabs > li.active { '. $prdpg_tabs['tabs']['active_wrp'] . ' }' : '';

	echo isset($prdpg_tabs['tabs']['item']) ? '
	.product-info .nav-tabs > li a,
	.product-info .nav-tabs > li a:hover { '. $prdpg_tabs['tabs']['item'] . ' }' : '';

	echo isset($prdpg_tabs['tabs']['active']) ? '
	.product-info .nav-tabs>li.active>a, 
	.product-info .nav-tabs>li.active>a:hover, 
	.product-info .nav-tabs>li.active>a:focus { '. $prdpg_tabs['tabs']['active'] . ' }' : '';

	echo isset($prdpg_tabs['tabs']['container']) ? '
	.product-info .tab-content { '. $prdpg_tabs['tabs']['container'] . ' }' : '';

	echo isset($prdpg_tabs['tabs']['pane']) ? '
	.product-info .tab-content>.tab-pane { '. $prdpg_tabs['tabs']['pane'] . ' }' : '';

	/*==================*/

	echo isset($prdpg_tabs['table_style']['table']) ? '
	.product-info #tab-specification .table-bordered { '.$prdpg_tabs['table_style']['table'].'}' : '';

	echo isset($prdpg_tabs['table_style']['thead']) ? '
	.product-info #tab-specification .table-bordered>thead>tr>th,
	.product-info #tab-specification .table-bordered>thead>tr>td { font-weight: normal;'.$prdpg_tabs['table_style']['thead'].' }' : '';

	echo isset($prdpg_tabs['table_style']['thead_last']) ? '
	.product-info #tab-specification .table-bordered>thead>tr>th:last-child,
	.product-info #tab-specification .table-bordered>thead>tr>td:last-child { '.$prdpg_tabs['table_style']['thead_last'].'}' : '';

	echo isset($prdpg_tabs['table_style']['thead_first']) ? '
	.product-info #tab-specification .table-bordered>thead>tr>th:first-child,
	.product-info #tab-specification .table-bordered>thead>tr>td:first-child { '.$prdpg_tabs['table_style']['thead_first'].'}' : '';

	echo isset($prdpg_tabs['table_style']['tbody']) ? '
	.product-info #tab-specification .table-bordered>tbody>tr>th,
	.product-info #tab-specification .table-bordered>tbody>tr>td { '.$prdpg_tabs['table_style']['tbody'].'}' : '';

	echo isset($prdpg_tabs['table_style']['tbody_last']) ? '
	.product-info #tab-specification .table-bordered>tbody>tr>th:last-child,
	.product-info #tab-specification .table-bordered>tbody>tr>td:last-child { '.$prdpg_tabs['table_style']['tbody_last'].'}' : '';

	echo isset($prdpg_tabs['table_style']['tbody_first']) ? '
	.product-info #tab-specification .table-bordered>tbody>tr>th:first-child,
	.product-info #tab-specification .table-bordered>tbody>tr>td:first-child { '.$prdpg_tabs['table_style']['tbody_first'].'}' : '';

	/*==================*/

	// Review comment
	echo isset($prdpg_tabs['review_tab']['block']) ? '
	.product-info #review { '. $prdpg_tabs['review_tab']['block'] . ' }' : '';

	echo isset($prdpg_tabs['review_tab']['comment_block']) ? '
	.product-info #review .reivew-comment { '. $prdpg_tabs['review_tab']['comment_block'] . ' }' : '';

	echo isset($prdpg_tabs['review_tab']['comment_title']) ? '
	.product-info #review .reivew-comment .name { '. $prdpg_tabs['review_tab']['comment_title'] . ' }' : '';

	echo isset($prdpg_tabs['review_tab']['comment_txt']) ? '
	.product-info #review .reivew-comment .comment-txt { '. $prdpg_tabs['review_tab']['comment_txt'] . ' }' : '';

	echo isset($prdpg_tabs['review_tab']['comment_stars_active']) ? '
	.product-info #review .reivew-comment .fa-star { '. $prdpg_tabs['review_tab']['comment_stars_active'] . ' }' : '';

	echo isset($prdpg_tabs['review_tab']['comment_stars_normal']) ? '
	.product-info #review .reivew-comment .fa-star-o { '. $prdpg_tabs['review_tab']['comment_stars_normal'] . ' }' : '';

	echo isset($prdpg_tabs['review_tab']['pagination_wrp']) ? '
	.product-info #review .reivew-comment .fa-star-o { '. $prdpg_tabs['review_tab']['pagination_wrp'] . ' }' : '';

	// Pagination
	echo isset($prdpg_tabs['review_tab']['pagination_wrp']) ? '
	.product-info #review .pagination-wrp { '.$prdpg_tabs['review_tab']['pagination_wrp'].'}' : '';

	echo isset($prdpg_tabs['review_tab']['pagination_block']) ? '
	.product-info #review .pagination-wrp .pagination { '.$prdpg_tabs['review_tab']['pagination_block'].'}' : '';

	echo isset($prdpg_tabs['review_tab']['pagination_normal']) ? '
	.product-info #review .pagination-wrp .pagination li a, 
	.product-info #review .pagination-wrp .pagination li a:hover { '.$prdpg_tabs['review_tab']['pagination_normal'].'}' : '';

	echo isset($prdpg_tabs['review_tab']['pagination_active']) ? '
	.product-info #review .pagination-wrp .pagination .active span { '.$prdpg_tabs['review_tab']['pagination_active'].'}' : '';

	// Review form
	echo isset($prdpg_tabs['review_tab']['frm_block']) ? '
	.product-info #tab-review form { '.$prdpg_tabs['review_tab']['frm_block'].'}' : '';

	echo isset($prdpg_tabs['review_tab']['frm_hd']) ? '
	.product-info #tab-review form .h4 { '.$prdpg_tabs['review_tab']['frm_hd'].'}' : '';

	echo isset($prdpg_tabs['review_tab']['frm_fields']) ? '
	.product-info #tab-review form input[type="text"].form-control,
	.product-info #tab-review form textarea.form-control { '.$prdpg_tabs['review_tab']['frm_fields'].'}' : '';

	echo isset($prdpg_tabs['review_tab']['frm_label']) ? '
	.product-info #tab-review form .control-label { '.$prdpg_tabs['review_tab']['frm_label'].'}' : '';

	echo isset($prdpg_tabs['review_tab']['frm_rating']) ? '
	.product-info #tab-review form .rating { '.$prdpg_tabs['review_tab']['frm_rating'].'}' : '';

	echo isset($prdpg_tabs['review_tab']['frm_rating_lbl']) ? '
	.product-info #tab-review form .rating li:first-child, 
	.product-info #tab-review form .rating li:last-child { '.$prdpg_tabs['review_tab']['frm_rating_lbl'].'}' : '';

	echo isset($prdpg_tabs['review_tab']['frm_rating_count']) ? '
	.product-info #tab-review form .rating .rate-count { '.$prdpg_tabs['review_tab']['frm_rating_count'].'}' : '';

	echo isset($prdpg_tabs['review_tab']['frm_btn']) ? '
	.product-info #tab-review form .default-btn { '.$prdpg_tabs['review_tab']['frm_btn'].'}' : '';

	echo isset($prdpg_tabs['review_tab']['frm_btn_hover']) ? '
	.product-info #tab-review form .default-btn:hover { '.$prdpg_tabs['review_tab']['frm_btn_hover'].'}' : '';
}
if (isset($prdpg_options)) {
	// Product options
	echo isset($prdpg_options['block']) ? '
	.product-info .options-wrp { '.$prdpg_options['block'].'}' : '';

	echo isset($prdpg_options['hd']) ? '
	.product-info .options-title { '.$prdpg_options['hd'].'}' : '';

	echo isset($prdpg_options['frm_group']) ? '
	.product-info .options-wrp .form-group { '.$prdpg_options['frm_group'].'}' : '';

	echo isset($prdpg_options['frm_lbl']) ? '
	.product-info .options-wrp .form-group .control-label { '.$prdpg_options['frm_lbl'].'}' : '';

	echo isset($prdpg_options['frm_fields']) ? '
	.product-info .options-wrp .form-group .fields { '.$prdpg_options['frm_fields'].'}' : '';

	echo isset($prdpg_options['frm_ctrls']) ? '
	.product-info .options-wrp select.form-control, 
	.product-info .options-wrp textarea.form-control, 
	.product-info .options-wrp input[type="text"].form-control, 
	.product-info .options-wrp input[type="password"].form-control, 
	.product-info .options-wrp input[type="datetime"].form-control, 
	.product-info .options-wrp input[type="datetime-local"].form-control, 
	.product-info .options-wrp input[type="date"].form-control, 
	.product-info .options-wrp input[type="month"].form-control, 
	.product-info .options-wrp input[type="time"].form-control, 
	.product-info .options-wrp input[type="week"].form-control, 
	.product-info .options-wrp input[type="number"].form-control, 
	.product-info .options-wrp input[type="email"].form-control, 
	.product-info .options-wrp input[type="url"].form-control, 
	.product-info .options-wrp input[type="search"].form-control, 
	.product-info .options-wrp input[type="tel"].form-control, 
	.product-info .options-wrp input[type="color"].form-control { '.$prdpg_options['frm_ctrls'].' }' : '';

	echo isset($prdpg_options['frm_btn']) ? '
	.product-info .options-wrp .default-btn { '.$prdpg_options['frm_btn'].'}' : '';

	echo isset($prdpg_options['frm_btn_hover']) ? '
	.product-info .options-wrp .default-btn:hover { '.$prdpg_options['frm_btn_hover'].'}' : '';
}
if (isset($prdpg_qty)) {
	// Quantity block
	echo isset($prdpg_qty['block']) ? '
	.product-info .buy-btn-wrp1,
	.product-info .buy-btn-wrp { '.$prdpg_qty['block'].'}' : '';

	echo isset($prdpg_qty['qty_lbl']) ? '
	.product-info .buy-btn-wrp1 .control-label,
	.product-info .buy-btn-wrp .control-label { '.$prdpg_qty['qty_lbl'].'}' : '';

	echo isset($prdpg_qty['qty_block']) ? '
	.product-info .buy-btn-wrp1 .control-qty,
	.product-info .buy-btn-wrp .control-qty { '.$prdpg_qty['qty_block'].'}' : '';

	echo isset($prdpg_qty['qty_input']) ? '
	.product-info .buy-btn-wrp1 .control-qty input[type="text"].form-control,
	.product-info .buy-btn-wrp .control-qty input[type="text"].form-control { '.$prdpg_qty['qty_input'].'}' : '';

	echo isset($prdpg_qty['qty_btn']) ? '
	.product-info .buy-btn-wrp .control-qty .qty-handle { '.$prdpg_qty['qty_btn'].'}' : '';

	echo isset($prdpg_qty['qty_btn_hover']) ? '
	.product-info .buy-btn-wrp .control-qty .qty-handle:hover { '.$prdpg_qty['qty_btn_hover'].'}' : '';

	echo isset($prdpg_qty['cart_btn_ico']) ? '
	.product-info .buy-btn-wrp1 .btn-cart i,
	.product-info .buy-btn-wrp .btn-cart i { '.$prdpg_qty['cart_btn_ico'].'}' : '';

	echo isset($prdpg_qty['cart_btn']) ? '
	.product-info .buy-btn-wrp1 .btn-cart,
	.product-info .buy-btn-wrp .btn-cart { '.$prdpg_qty['cart_btn'].'}' : '';

	echo isset($prdpg_qty['cart_btn_hover']) ? '
	.product-info .buy-btn-wrp1 .btn-cart:hover,
	.product-info .buy-btn-wrp .btn-cart:hover { '.$prdpg_qty['cart_btn_hover'].'}' : '';

	echo isset($prdpg_qty['links']) ? '
	.product-info .buy-btn-wrp1 .cart-option a,
	.product-info .buy-btn-wrp .cart-option a { '.$prdpg_qty['links'].'}' : '';

	echo isset($prdpg_qty['links_h']) ? '
	.product-info .buy-btn-wrp1 .cart-option a:hover,
	.product-info .buy-btn-wrp .cart-option a:hover { '.$prdpg_qty['links_h'].'}' : '';

}

if (isset($prdpg_ly1)) {

	echo isset($prdpg_ly1['price_wrapper']) ? '
	.product-info1 .buying-info { '.$prdpg_ly1['price_wrapper'].'}' : '';

	echo isset($prdpg_ly1['price_block']) ? '
	.product-info1 .buying-info .price { '.$prdpg_ly1['price_block'].'}' : '';

	echo isset($prdpg_ly1['price_new']) ? '
	.product-info1 .buying-info .price .price-new { '.$prdpg_ly1['price_new'].'}' : '';

	echo isset($prdpg_ly1['price_spl']) ? '
	.product-info1 .buying-info .price .price-spl { '.$prdpg_ly1['price_spl'].'}' : '';

	echo isset($prdpg_ly1['price_old']) ? '
	.product-info1 .buying-info .price .price-old { '.$prdpg_ly1['price_old'].'}' : '';

	echo isset($prdpg_ly1['price_tax']) ? '
	.product-info1 .buying-info .price .price-tax { '.$prdpg_ly1['price_tax'].'}' : '';

	echo isset($prdpg_ly1['reward']) ? '
	.product-info1 .buying-info .reward { '.$prdpg_ly1['reward'].'}' : '';

	echo isset($prdpg_ly1['discount']) ? '
	.product-info1 .buying-info .discount { '.$prdpg_ly1['discount'].'}' : '';

	echo isset($prdpg_ly1['discount_item']) ? '
	.product-info1 .buying-info .discount li { '.$prdpg_ly1['discount_item'].'}' : '';

	echo isset($prdpg_ly1['info_link_block']) ? '
	.product-info1 .buying-info .info-links { '.$prdpg_ly1['info_link_block'].'}' : '';

	echo isset($prdpg_ly1['info_links']) ? '
	.product-info1 .buying-info .info-links a { '.$prdpg_ly1['info_links'].'}' : '';

	echo isset($prdpg_ly1['info_links_hover']) ? '
	.product-info1 .buying-info .info-links a:hover { '.$prdpg_ly1['info_links_hover'].'}' : '';

}

if (isset($prdpg_ly2)) {

	echo isset($prdpg_ly2['price_wrapper']) ? '
	.product-info2 .buying-info1 { '.$prdpg_ly2['price_wrapper'].'}' : '';

	echo isset($prdpg_ly2['price_block']) ? '
	.product-info2 .buying-info1 .price { '.$prdpg_ly2['price_block'].'}' : '';

	echo isset($prdpg_ly2['price_new']) ? '
	.product-info2 .buying-info1 .price .price-new { '.$prdpg_ly2['price_new'].'}' : '';

	echo isset($prdpg_ly2['price_spl']) ? '
	.product-info2 .buying-info1 .price .price-spl { '.$prdpg_ly2['price_spl'].'}' : '';

	echo isset($prdpg_ly2['price_old']) ? '
	.product-info2 .buying-info1 .price .price-old { '.$prdpg_ly2['price_old'].'}' : '';

	echo isset($prdpg_ly2['price_tax']) ? '
	.product-info2 .buying-info1 .price .price-tax { '.$prdpg_ly2['price_tax'].'}' : '';

	echo isset($prdpg_ly2['reward']) ? '
	.product-info2 .buying-info1 .reward { '.$prdpg_ly2['reward'].'}' : '';

	echo isset($prdpg_ly2['discount']) ? '
	.product-info2 .buying-info1 .discount { '.$prdpg_ly2['discount'].'}' : '';

	echo isset($prdpg_ly2['discount_item']) ? '
	.product-info2 .buying-info1 .discount li { '.$prdpg_ly2['discount_item'].'}' : '';

	echo isset($prdpg_ly2['info_link_block']) ? '
	.product-info2 .buying-info1 .info-links { '.$prdpg_ly2['info_link_block'].'}' : '';

	echo isset($prdpg_ly2['info_links']) ? '
	.product-info2 .buying-info1 .info-links a { '.$prdpg_ly2['info_links'].'}' : '';

	echo isset($prdpg_ly2['info_links_hover']) ? '
	.product-info2 .buying-info1 .info-links a:hover { '.$prdpg_ly2['info_links_hover'].'}' : '';
}

if (isset($prdpg_ly3)) {

	echo isset($prdpg_ly3['price_wrapper']) ? '
	.product-info3 .buying-info2 { '.$prdpg_ly3['price_wrapper'].'}' : '';

	echo isset($prdpg_ly3['price_block']) ? '
	.product-info3 .buying-info2 .price { '.$prdpg_ly3['price_block'].'}' : '';

	echo isset($prdpg_ly3['price_new']) ? '
	.product-info3 .buying-info2 .price .price-new { '.$prdpg_ly3['price_new'].'}' : '';

	echo isset($prdpg_ly3['price_spl']) ? '
	.product-info3 .buying-info2 .price .price-spl { '.$prdpg_ly3['price_spl'].'}' : '';

	echo isset($prdpg_ly3['price_old']) ? '
	.product-info3 .buying-info2 .price .price-old { '.$prdpg_ly3['price_old'].'}' : '';

	echo isset($prdpg_ly3['price_tax']) ? '
	.product-info3 .buying-info2 .price .price-tax { '.$prdpg_ly3['price_tax'].'}' : '';

	echo isset($prdpg_ly3['reward']) ? '
	.product-info3 .buying-info2 .offer-info .reward { '.$prdpg_ly3['reward'].'}' : '';

	echo isset($prdpg_ly3['discount']) ? '
	.product-info3 .buying-info2 .offer-info .discount { '.$prdpg_ly3['discount'].'}' : '';

	echo isset($prdpg_ly3['offer_info']) ? '
	.product-info3 .buying-info2 .offer-info { '.$prdpg_ly3['offer_info'].'}' : '';

	// Rating
	echo isset($prdpg_ly3['rating_block']) ?
	'.product-info3 .buying-info2 .rating-wrp { '. $prdpg_ly3['rating_block'] . ' }' : '';

	echo isset($prdpg_ly3['rating_active']) ?
	'.product-info3 .buying-info2 .rating-wrp .review-stars .fa-star { '. $prdpg_ly3['rating_active'] . ' }' : '';

	echo isset($prdpg_ly3['rating_normal']) ?
	'.product-info3 .buying-info2 .rating-wrp .review-stars .fa-star-o { '. $prdpg_ly3['rating_normal'] . ' }' : '';

	echo isset($prdpg_ly3['rating_a']) ?
	'.product-info3 .buying-info2 .rating-wrp a { '. $prdpg_ly3['rating_a'] . ' }' : '';

	echo isset($prdpg_ly3['rating_a_hover']) ?
	'.product-info3 .buying-info2 .rating-wrp a:hover { '. $prdpg_ly3['rating_a_hover'] . ' }' : '';

}

if (isset($prdpg_ly4)) {

	echo isset($prdpg_ly4['price_wrapper']) ? '
	.product-info4 .buying-info2 { '.$prdpg_ly4['price_wrapper'].'}' : '';

	echo isset($prdpg_ly4['price_block']) ? '
	.product-info4 .buying-info2 .price { '.$prdpg_ly4['price_block'].'}' : '';

	echo isset($prdpg_ly4['price_spl']) ? '
	.product-info4 .buying-info2 .price .price-spl { '.$prdpg_ly4['price_spl'].'}' : '';

	echo isset($prdpg_ly4['price_new']) ? '
	.product-info4 .buying-info2 .price .price-new { '.$prdpg_ly4['price_new'].'}' : '';

	echo isset($prdpg_ly4['price_old']) ? '
	.product-info4 .buying-info2 .price .price-old { '.$prdpg_ly4['price_old'].'}' : '';

	echo isset($prdpg_ly4['price_tax']) ? '
	.product-info4 .buying-info2 .price .price-tax { '.$prdpg_ly4['price_tax'].'}' : '';

	echo isset($prdpg_ly4['reward']) ? '
	.product-info4 .buying-info2 .price .reward { '.$prdpg_ly4['reward'].'}' : '';

	echo isset($prdpg_ly4['discount']) ? '
	.product-info4 .buying-info2 .price .discount { '.$prdpg_ly4['discount'].'}' : '';

	echo isset($prdpg_ly4['offer_info']) ? '
	.product-info4 .buying-info2 .price { '.$prdpg_ly4['offer_info'].'}' : '';

	// Rating
	echo isset($prdpg_ly4['rating_block']) ?
	'.product-info4 .buying-info2 .rating-wrp { '. $prdpg_ly4['rating_block'] . ' }' : '';

	echo isset($prdpg_ly4['rating_active']) ?
	'.product-info4 .buying-info2 .rating-wrp .review-stars .fa-star { '. $prdpg_ly4['rating_active'] . ' }' : '';

	echo isset($prdpg_ly4['rating_normal']) ?
	'.product-info4 .buying-info2 .rating-wrp .review-stars .fa-star-o { '. $prdpg_ly4['rating_normal'] . ' }' : '';

	echo isset($prdpg_ly4['rating_a']) ?
	'.product-info4 .buying-info2 .rating-wrp a { '. $prdpg_ly4['rating_a'] . ' }' : '';

	echo isset($prdpg_ly4['rating_a_hover']) ?
	'.product-info4 .buying-info2 .rating-wrp a:hover { '. $prdpg_ly4['rating_a_hover'] . ' }' : '';

	// Item info
	echo isset($prdpg_ly4['iteminfo_block']) ? '
	.product-info4 .item-info { '. $prdpg_ly4['iteminfo_block'] . ' }' : '';
	
	echo isset($prdpg_ly4['iteminfo_lbl']) ? '
	.product-info4 .item-info li span { '. $prdpg_ly4['iteminfo_lbl'] . ' }' : '';

	echo isset($prdpg_ly4['iteminfo_item']) ? '
	.product-info4 .item-info li { '. $prdpg_ly4['iteminfo_item'] . ' }
	.product-info4 .item-info li a { color: inherit; text-decoration: underline; }' : '';

}


/* Shopping cart page
=========================*/
echo isset($pg_shoppingcart['cart_title']) ?
'.cart-pg .h3 { '. $pg_shoppingcart['cart_title'] . ' }' : '';

echo isset($pg_shoppingcart['other_title']) ?
'.cart-pg .h4 { '. $pg_shoppingcart['other_title'] . ' }' : '';

echo isset($pg_shoppingcart['qty']) ?
'.cart-pg .cart-qty input[type="text"].form-control { '. $pg_shoppingcart['qty'] . ' }' : '';

echo isset($pg_shoppingcart['total_block']) ?
'.cart-pg .cart-total { '. $pg_shoppingcart['total_block'] . ' }' : '';

echo isset($pg_shoppingcart['total_summary']) ?
'.cart-pg .cart-total .table td { font-weight: inherit; '. $pg_shoppingcart['total_summary'] . ' }' : '';

echo isset($pg_shoppingcart['total']) ?
'.cart-pg .cart-total .table tr:last-child td { '. $pg_shoppingcart['total'] . ' }' : '';

/* Checkout page
=========================*/

if (isset($pg_checkout)) {
	
	/* PANELS */
	echo isset($pg_checkout['panel_wrp']) ? '
	.checkout-pg .panel { '.$pg_checkout['panel_wrp'].'}' : '';

	echo isset($pg_checkout['title_block']) ? '
	.checkout-pg .panel .panel-heading { '.$pg_checkout['title_block'].'}' : '';

	echo isset($pg_checkout['title']) ? '
	.checkout-pg .panel .panel-title { '.$pg_checkout['title'].'} .checkout-pg .panel .panel-title a { color: inherit; }' : '';

	echo isset($pg_checkout['body_wrp']) ? '
	.checkout-pg .panel .panel-collapse { '.$pg_checkout['body_wrp'].'}' : '';

	echo isset($pg_checkout['body']) ? '
	.checkout-pg .panel .panel-body, .checkout-pg .panel-default>.panel-heading+.panel-collapse>.panel-body { '.$pg_checkout['body'].'}' : '';

	/* FORMS */
	echo isset($pg_checkout['frm_wrp']) ? '
	.checkout-pg .frm-wrp { '.$pg_checkout['frm_wrp'].'}' : '';

	echo isset($pg_checkout['frm_title']) ? '
	.checkout-pg .frm-hd { '.$pg_checkout['frm_title'].'}' : '';

	echo isset($pg_checkout['frm_label']) ? '
	.checkout-pg .frm-wrp .control-label { '.$pg_checkout['frm_label'].'}' : '';

	echo isset($pg_checkout['frm_ctrl']) ? '
	.checkout-pg select.form-control, 
	.checkout-pg textarea.form-control, 
	.checkout-pg input[type="text"].form-control, 
	.checkout-pg input[type="password"].form-control, 
	.checkout-pg input[type="month"].form-control, 
	.checkout-pg input[type="email"].form-control, 
	.checkout-pg input[type="url"].form-control, 
	.checkout-pg input[type="tel"].form-control { '.$pg_checkout['frm_ctrl'].' height: auto; }' : '';

	echo isset($pg_checkout['frm_btnbar']) ? '
	.checkout-pg .buttons { '.$pg_checkout['frm_btnbar'].'}' : '';

	/* TABLE */
	echo isset($pg_checkout['table']) ? '
	.checkout-pg .table-bordered { '.$pg_checkout['table'].'}' : '';

	echo isset($pg_checkout['thead']) ? '
	.checkout-pg .table-bordered>thead>tr>th,
	.checkout-pg .table-bordered>thead>tr>td { '.$pg_checkout['thead'].'}' : '';

	echo isset($pg_checkout['thead_last']) ? '
	.checkout-pg .table-bordered>thead>tr>th:last-child,
	.checkout-pg .table-bordered>thead>tr>td:last-child { '.$pg_checkout['thead_last'].'}' : '';

	echo isset($pg_checkout['thead_first']) ? '
	.checkout-pg .table-bordered>thead>tr>th:first-child,
	.checkout-pg .table-bordered>thead>tr>td:first-child { '.$pg_checkout['thead_first'].'}' : '';

	echo isset($pg_checkout['tbody']) ? '
	.checkout-pg .table-bordered>tbody>tr>th,
	.checkout-pg .table-bordered>tbody>tr>td { '.$pg_checkout['tbody'].'}' : '';

	echo isset($pg_checkout['tbody_last']) ? '
	.checkout-pg .table-bordered>tbody>tr>th:last-child,
	.checkout-pg .table-bordered>tbody>tr>td:last-child { '.$pg_checkout['tbody_last'].'}' : '';

	echo isset($pg_checkout['tbody_first']) ? '
	.checkout-pg .table-bordered>tbody>tr>th:first-child,
	.checkout-pg .table-bordered>tbody>tr>td:first-child { '.$pg_checkout['tbody_first'].'}' : '';
}

/* Checkout page
=========================*/
if (isset($pg_contactus)) {

	echo isset($pg_contactus['info_block']) ? '
	.contact-info { '.$pg_contactus['info_block'].'}' : '';

	echo isset($pg_contactus['info_hd']) ? '
	.contact-info .frm-hd { '.$pg_contactus['info_hd'].'}' : '';

	echo isset($pg_contactus['info_sub_hd']) ? '
	.contact-info .h5 { '.$pg_contactus['info_sub_hd'].'}' : '';

	echo isset($pg_contactus['img_block']) ? '
	.contact-info .img-thumbnail { '.$pg_contactus['img_block'].'}' : '';
	
}

/* Brands page
=========================*/
if (isset($pg_brands)) {

	echo isset($pg_brands['index']['block']) ? '
	.brands-a2z { '.$pg_brands['index']['block'].'}' : '';	

	echo isset($pg_brands['index']['hd']) ? '
	.brands-a2z .h4 { '.$pg_brands['index']['hd'].'}' : '';

	echo isset($pg_brands['index']['atoz']) ? '
	.brands-a2z a { '.$pg_brands['index']['atoz'].'}' : '';

	echo isset($pg_brands['index']['atoz_hover']) ? '
	.brands-a2z a:hover { '.$pg_brands['index']['atoz_hover'].'}' : '';

	echo isset($pg_brands['list']['block']) ? '
	.manufacturer-list { '.$pg_brands['list']['block'].'}' : '';

	echo isset($pg_brands['list']['hd']) ? '
	.manufacturer-list .manufacturer-heading { '.$pg_brands['list']['hd'].'}' : '';

	echo isset($pg_brands['list']['body']) ? '
	.manufacturer-list .manufacturer-content { '.$pg_brands['list']['body'].'}' : '';

	echo isset($pg_brands['list']['item']) ? '
	.manufacturer-list ul li { '.$pg_brands['list']['item'].'}' : '';

	echo isset($pg_brands['list']['a']) ? '
	.manufacturer-list ul li a { '.$pg_brands['list']['a'].'}' : '';

	echo isset($pg_brands['list']['a_hover']) ? '
	.manufacturer-list ul li a:hover { '.$pg_brands['list']['a_hover'].'}' : '';
}

/* Site map page
=========================*/
if (isset($pg_sitemap)) {
	echo isset($pg_sitemap['main']) ? '
	.sitemap-info { '.$pg_sitemap['main'].'}' : '';

	echo isset($pg_sitemap['left']) ? '
	.sitemap-info .left { '.$pg_sitemap['left'].'}' : '';

	echo isset($pg_sitemap['right']) ? '
	.sitemap-info .right { '.$pg_sitemap['right'].'}' : '';

	echo isset($pg_sitemap['main_links']) ? '
	.sitemap-info .first > li > a { '.$pg_sitemap['main_links'].'} .sitemap-info .first > li > a:hover { color: inherit; }' : '';

	echo isset($pg_sitemap['sub_links']) ? '
	.sitemap-info .ul-list-1 .ul-list-1 li { '.$pg_sitemap['sub_links'].'}' : '';

	echo isset($pg_sitemap['a']) ? '
	.sitemap-info .ul-list-1 .ul-list-1 li a { '.$pg_sitemap['a'].'}' : '';

	echo isset($pg_sitemap['a_hover']) ? '
	.sitemap-info .ul-list-1 .ul-list-1 li a:hover { '.$pg_sitemap['a_hover'].'}' : '';
}

/* Login page
=========================*/
if (isset($pg_login)) {

	echo isset($pg_login['new_block']) ? '
	.login > div:first-child .frm-wrp { '.$pg_login['new_block'].'}' : '';

	echo isset($pg_login['new_hd']) ? '
	.login > div:first-child .frm-hd { '.$pg_login['new_hd'].'}' : '';

	echo isset($pg_login['new_btn']) ? '
	.login > div:first-child .default-btn { '.$pg_login['new_btn'].'}' : '';

	echo isset($pg_login['new_btn_hover']) ? '
	.login > div:first-child .default-btn:hover { '.$pg_login['new_btn_hover'].'}' : '';


	echo isset($pg_login['old_block']) ? '
	.login > div:first-child + div .frm-wrp { '.$pg_login['old_block'].'}' : '';

	echo isset($pg_login['old_hd']) ? '
	.login > div:first-child + div .frm-hd { '.$pg_login['old_hd'].'}' : '';

	echo isset($pg_login['old_btn']) ? '
	.login > div:first-child + div .default-btn { '.$pg_login['old_btn'].'}' : '';

	echo isset($pg_login['old_btn_hover']) ? '
	.login > div:first-child + div .default-btn:hover { '.$pg_login['old_btn_hover'].'}' : '';

	echo isset($pg_login['old_label']) ? '
	.login > div:first-child + div .control-label { '.$pg_login['old_label'].'}' : '';

	echo isset($pg_login['old_fields']) ? '
	.login > div:first-child + div input[type="password"].form-control,
	.login > div:first-child + div input[type="text"].form-control { '.$pg_login['old_fields'].'}' : '';
}

/* Footer
=========================*/
if (isset($df_ft_general)) {

	echo isset($df_ft_general['main_wrp']) ? '
	footer { '.$df_ft_general['main_wrp'].'}' : '';

	echo isset($df_ft_general['top_wrp']) ? '
	footer .footer-upper { '.$df_ft_general['top_wrp'].'}' : '';

	echo isset($df_ft_general['top_a']) ? '
	footer .footer-upper a { '.$df_ft_general['top_a'].'}' : '';

	echo isset($df_ft_general['top_a_hover']) ? '
	footer .footer-upper a:hover { '.$df_ft_general['top_a_hover'].'}' : '';

	echo isset($df_ft_general['bottom_wrp']) ? '
	footer .footer-bottom { '.$df_ft_general['bottom_wrp'].'}' : '';

	echo isset($df_ft_general['bottom_a']) ? '
	footer .footer-bottom a { '.$df_ft_general['bottom_a'].'}' : '';
	
	echo isset($df_ft_general['bottom_a_hover']) ? '
	footer .footer-bottom a:hover { '.$df_ft_general['bottom_a_hover'].'}' : '';

	echo isset($df_ft_general['cp_block']['wrp']) ? '
	footer .cp-text { '.$df_ft_general['cp_block']['wrp'].'} footer .cp-text a { color: inherit; }' : '';

	echo isset($df_ft_general['cp_block']['container']) ? '
	footer .cp-text > .container { '.$df_ft_general['cp_block']['container'].'}' : '';

}
if (isset($df_ft_contactinfo)) {
	echo isset($df_ft_contactinfo['block']) ? '
	footer .ft-contact { '.$df_ft_contactinfo['block'].'} footer .ft-contact .info h5 { font-size: inherit; }' : '';

	echo isset($df_ft_contactinfo['icon_blocks']) ? '
	footer .ft-contact .icon { '.$df_ft_contactinfo['icon_blocks'].'}' : '';

	echo isset($df_ft_contactinfo['a']) ? '
	footer .ft-contact a { '.$df_ft_contactinfo['a'].'}' : '';

	echo isset($df_ft_contactinfo['a_hover']) ? '
	footer .ft-contact a:hover { '.$df_ft_contactinfo['a_hover'].'}' : '';

	echo isset($df_ft_contactinfo['phone_icon']) ? '
	footer .ft-contact .phone i { '.$df_ft_contactinfo['phone_icon'].'}' : '';

	echo isset($df_ft_contactinfo['fax_icon']) ? '
	footer .ft-contact .fax i { '.$df_ft_contactinfo['fax_icon'].'}' : '';

	echo isset($df_ft_contactinfo['mail_icon']) ? '
	footer .ft-contact .mail i { '.$df_ft_contactinfo['mail_icon'].'}' : '';
}

if (isset($df_ft_social)) {

	echo isset($df_ft_social['icon_blocks']) ? '
	footer .footer-bottom .social a { '.$df_ft_social['icon_blocks'].'}' : '';

	echo isset($df_ft_social['icon_blocks_hover']) ? '
	footer .footer-bottom .social a:hover { '.$df_ft_social['icon_blocks_hover'].'}' : '';

	if (isset($df_ft_social_icons)) {
	foreach ($df_ft_social_icons as $key => $value) {
		echo isset($value) ? '
		footer .footer-bottom .social a:nth-child('.($key+1).') i { '.$value.'}' : '';
	}}
	
}
?>