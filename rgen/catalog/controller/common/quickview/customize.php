<?php
$quickview = $this->rgen->storage->get('theme_data', 'rgen_prdblocks');
$quickview = $factory->node($quickview, 'global_quickview', 0, 0);

if ($this->chk($quickview)) {
	
	$data['quickview']['status'] = $factory->node($quickview, 'status', 0, 0);

	$data['quickview']['popup_h'] = $factory->node($quickview, 'popup_h', 0, 'min_h');

	$data['quickview']['body']       = $factory->node($quickview, 'body', 1);
	$data['quickview']['title']      = $factory->node($quickview, 'title', 1);
	$data['quickview']['main_img']   = $factory->node($quickview, 'main_img', 1);
	$data['quickview']['sub_img']    = $factory->node($quickview, 'sub_img', 1);
	$data['quickview']['active_img'] = $factory->node($quickview, 'active_img', 0, 'bdrcolor');
	
	$data['quickview']['arrows']['wrp']        = $factory->node($quickview, 'arrows/wrp', 1);
	$data['quickview']['arrows']['arrow_line'] = $factory->node($quickview, 'arrows/arrow_line', 0, 'bdrcolor');
	$data['quickview']['arrows']['arrow']      = $factory->node($quickview, 'arrows/arrow', 1, 0, 'css_normal');
	$data['quickview']['arrows']['arrow_h']    = $factory->node($quickview, 'arrows/arrow', 1, 0, 'css_hover');
	
	$data['quickview']['tabs']['bar']        = $factory->node($quickview, 'tabs/bar', 1);
	$data['quickview']['tabs']['item']       = $factory->node($quickview, 'tabs/item', 1);
	$data['quickview']['tabs']['item_wrp']   = $factory->node($quickview, 'tabs/item_wrp', 1);
	$data['quickview']['tabs']['active']     = $factory->node($quickview, 'tabs/active', 1);
	$data['quickview']['tabs']['active_wrp'] = $factory->node($quickview, 'tabs/active_wrp', 1);
	$data['quickview']['tabs']['container']  = $factory->node($quickview, 'tabs/container', 1);
	$data['quickview']['tabs']['pane']       = $factory->node($quickview, 'tabs/pane', 1);

	$data['quickview']['item_info']['block']    = $factory->node($quickview, 'item_info/block', 1);
	$data['quickview']['item_info']['item']     = $factory->node($quickview, 'item_info/item', 1);
	$data['quickview']['item_info']['item_lbl'] = $factory->node($quickview, 'item_info/item_lbl', 1);

	$data['quickview']['rating']['stars_normal'] = $factory->node($quickview, 'rating/stars_normal', 1);
	$data['quickview']['rating']['stars_active'] = $factory->node($quickview, 'rating/stars_active', 1);

	$data['quickview']['options']['block']      = $factory->node($quickview, 'prdpg_options/block', 1);
	$data['quickview']['options']['frm_group']  = $factory->node($quickview, 'prdpg_options/frm_group', 1);
	$data['quickview']['options']['frm_lbl']    = $factory->node($quickview, 'prdpg_options/frm_lbl', 1);
	$data['quickview']['options']['frm_fields'] = $factory->node($quickview, 'prdpg_options/frm_fields', 1);
	$data['quickview']['options']['frm_ctrls']  = $factory->node($quickview, 'prdpg_options/frm_ctrls', 1);
	$data['quickview']['options']['frm_btn']    = $factory->node($quickview, 'prdpg_options/frm_btn', 1, 0, 'css_normal');
	$data['quickview']['options']['frm_btn_h']  = $factory->node($quickview, 'prdpg_options/frm_btn', 1, 0, 'css_hover');

	$data['quickview']['price_wrapper'] = $factory->node($quickview, 'price/wrapper', 1);
	$data['quickview']['price_block']   = $factory->node($quickview, 'price/block', 1);
	$data['quickview']['price_spl']     = $factory->node($quickview, 'price/price_spl', 1);
	$data['quickview']['price_new']     = $factory->node($quickview, 'price/price_new', 1);
	$data['quickview']['price_old']     = $factory->node($quickview, 'price/price_old', 1);
	$data['quickview']['price_tax']     = $factory->node($quickview, 'price/price_tax', 1);
	$data['quickview']['reward']        = $factory->node($quickview, 'price/reward', 0, 'color');
	$data['quickview']['discount']      = $factory->node($quickview, 'price/discount', 1);
	$data['quickview']['discount_item'] = $factory->node($quickview, 'price/discount_items', 1);

	$data['quickview']['qty']['block']      = $factory->node($quickview, 'prdpg_qty/block', 1);
	$data['quickview']['qty']['qty_lbl']    = $factory->node($quickview, 'prdpg_qty/qty_lbl', 1);
	$data['quickview']['qty']['qty_block']  = $factory->node($quickview, 'prdpg_qty/qty_block', 1);
	$data['quickview']['qty']['qty_input']  = $factory->node($quickview, 'prdpg_qty/qty_input', 1);
	$data['quickview']['qty']['cart_icon']  = $factory->node($quickview, 'prdpg_qty/cart_icon', 1);
	$data['quickview']['qty']['cart_btn']   = $factory->node($quickview, 'prdpg_qty/cart_btn', 1, 0, 'css_normal');
	$data['quickview']['qty']['cart_btn_h'] = $factory->node($quickview, 'prdpg_qty/cart_btn', 1, 0, 'css_hover');
	
	$data['quickview']['qty']['links']      = $factory->node($quickview, 'prdpg_qty/links', 0, 'color');
	$data['quickview']['qty']['links_h']    = $factory->node($quickview, 'prdpg_qty/links_h', 0, 'color');
}
