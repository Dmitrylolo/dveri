<?php 
if (isset($quickview) && $quickview['status']) {
	
	echo isset($quickview['popup_h']) ? '
	.quickview-wrp, .quickview-popup .mfp-iframe-scaler { '. $quickview['popup_h'] . ' }' : '';	

	echo isset($quickview['body']) ? '
	.quickview-wrp { '. $quickview['body'] . ' }' : '';

	echo isset($quickview['title']) ? '
	.quickview-wrp h1 { '. $quickview['title'] . ' }' : '';

	// Main image
	echo isset($quickview['main_img']) ? '
	.quickview-wrp .product-images .main-img { '. $quickview['main_img'] . ' }' : '';

	echo isset($quickview['sub_img']) ? '
	.quickview-wrp .additional-img .img { '. $quickview['sub_img'] . ' }' : '';

	echo isset($quickview['active_img']) ? '
	.quickview-wrp .additional-img .img.active img { '. $quickview['active_img'] . ' }' : '';


	// Arrows
	echo isset($quickview['arrows']['wrp']) ?
	'.quickview-wrp .owl-controls { '. $quickview['arrows']['wrp'] . ' }' : '';

	echo isset($quickview['arrows']['arrow_line']) ?
	'.quickview-wrp .owl-controls .owl-nav:after { '. $quickview['arrows']['arrow_line'] . ' }' : '';

	echo isset($quickview['arrows']['arrow']) ?
	'.quickview-wrp .owl-controls .owl-nav > div { '. $quickview['arrows']['arrow'] . ' }' : '';

	echo isset($quickview['arrows']['arrow_h']) ?
	'.quickview-wrp .owl-controls .owl-nav > div:hover { '. $quickview['arrows']['arrow_h'] . ' }' : '';


	// Tabs
	echo isset($quickview['tabs']['bar']) ? '
	.quickview-wrp .nav-tabs { '. $quickview['tabs']['bar'] . ' }' : '';

	echo isset($quickview['tabs']['item_wrp']) ? '
	.quickview-wrp .nav-tabs > li { '. $quickview['tabs']['item_wrp'] . ' }' : '';

	echo isset($quickview['tabs']['active_wrp']) ? '
	.quickview-wrp .nav-tabs > li.active { '. $quickview['tabs']['active_wrp'] . ' }' : '';

	echo isset($quickview['tabs']['item']) ? '
	.quickview-wrp .nav-tabs > li a,
	.quickview-wrp .nav-tabs > li a:hover { '. $quickview['tabs']['item'] . ' }' : '';

	echo isset($quickview['tabs']['active']) ? '
	.quickview-wrp .nav-tabs>li.active>a, 
	.quickview-wrp .nav-tabs>li.active>a:hover, 
	.quickview-wrp .nav-tabs>li.active>a:focus { '. $quickview['tabs']['active'] . ' }' : '';

	echo isset($quickview['tabs']['container']) ? '
	.quickview-wrp .tab-content { '. $quickview['tabs']['container'] . ' }' : '';

	echo isset($quickview['tabs']['pane']) ? '
	.quickview-wrp .tab-content>.tab-pane { '. $quickview['tabs']['pane'] . ' }' : '';

	// Item info
	echo isset($quickview['item_info']['block']) ? '
	.quickview-wrp .item-info { '. $quickview['item_info']['block'] . ' }' : '';
	
	echo isset($quickview['item_info']['item']) ? '
	.quickview-wrp .item-info li { '. $quickview['item_info']['item'] . ' }
	.quickview-wrp .item-info li a { color: inherit; text-decoration: underline; }' : '';
	
	echo isset($quickview['item_info']['item_lbl']) ? '
	.quickview-wrp .item-info span { '. $quickview['item_info']['item_lbl'] . ' }' : '';

	// Rating
	echo isset($quickview['rating']['stars_active']) ?
	'.quickview-wrp .rating-wrp .review-stars .fa-star { '. $quickview['rating']['stars_active'] . ' }' : '';

	echo isset($quickview['rating']['stars_normal']) ?
	'.quickview-wrp .rating-wrp .review-stars .fa-star-o { '. $quickview['rating']['stars_normal'] . ' }' : '';


	// Product options
	echo isset($quickview['options']['block']) ? '
	.quickview-wrp .options-wrp { '.$quickview['options']['block'].'}' : '';

	echo isset($quickview['options']['frm_group']) ? '
	.quickview-wrp .options-wrp .form-group { '.$quickview['options']['frm_group'].'}' : '';

	echo isset($quickview['options']['frm_lbl']) ? '
	.quickview-wrp .options-wrp .form-group .control-label { '.$quickview['options']['frm_lbl'].'}' : '';

	echo isset($quickview['options']['frm_fields']) ? '
	.quickview-wrp .options-wrp .form-group .fields { '.$quickview['options']['frm_fields'].'}' : '';

	echo isset($quickview['options']['frm_ctrls']) ? '
	.quickview-wrp .options-wrp select.form-control, 
	.quickview-wrp .options-wrp textarea.form-control, 
	.quickview-wrp .options-wrp input[type="text"].form-control, 
	.quickview-wrp .options-wrp input[type="password"].form-control, 
	.quickview-wrp .options-wrp input[type="datetime"].form-control, 
	.quickview-wrp .options-wrp input[type="datetime-local"].form-control, 
	.quickview-wrp .options-wrp input[type="date"].form-control, 
	.quickview-wrp .options-wrp input[type="month"].form-control, 
	.quickview-wrp .options-wrp input[type="time"].form-control, 
	.quickview-wrp .options-wrp input[type="week"].form-control, 
	.quickview-wrp .options-wrp input[type="number"].form-control, 
	.quickview-wrp .options-wrp input[type="email"].form-control, 
	.quickview-wrp .options-wrp input[type="url"].form-control, 
	.quickview-wrp .options-wrp input[type="search"].form-control, 
	.quickview-wrp .options-wrp input[type="tel"].form-control, 
	.quickview-wrp .options-wrp input[type="color"].form-control { '.$quickview['options']['frm_ctrls'].' }' : '';

	echo isset($quickview['options']['frm_btn']) ? '
	.quickview-wrp .options-wrp .default-btn { '.$quickview['options']['frm_btn'].'}' : '';

	echo isset($quickview['options']['frm_btn_h']) ? '
	.quickview-wrp .options-wrp .default-btn:hover { '.$quickview['options']['frm_btn_h'].'}' : '';


	// Price
	echo isset($quickview['price_wrapper']) ? '
	.quickview-wrp .price-info { '.$quickview['price_wrapper'].'}' : '';

	echo isset($quickview['price_block']) ? '
	.quickview-wrp .price-info .price { '.$quickview['price_block'].'}' : '';

	echo isset($quickview['price_new']) ? '
	.quickview-wrp .price-info .price .price-new { '.$quickview['price_new'].'}' : '';

	echo isset($quickview['price_spl']) ? '
	.quickview-wrp .price-info .price .price-spl { '.$quickview['price_spl'].'}' : '';

	echo isset($quickview['price_old']) ? '
	.quickview-wrp .price-info .price .price-old { '.$quickview['price_old'].'}' : '';

	echo isset($quickview['price_tax']) ? '
	.quickview-wrp .price-info .price .price-tax { '.$quickview['price_tax'].'}' : '';

	echo isset($quickview['reward']) ? '
	.quickview-wrp .price-info .reward { '.$quickview['reward'].'}' : '';

	echo isset($quickview['discount']) ? '
	.quickview-wrp .price-info .discount { '.$quickview['discount'].'}' : '';

	echo isset($quickview['discount_item']) ? '
	.quickview-wrp .price-info .discount li { '.$quickview['discount_item'].'}' : '';


	// Quantity block
	echo isset($quickview['qty']['block']) ? '
	.quickview-wrp .buy-btn-block { '.$quickview['qty']['block'].'}' : '';

	echo isset($quickview['qty']['qty_lbl']) ? '
	.quickview-wrp .buy-btn-block .control-label { '.$quickview['qty']['qty_lbl'].'}' : '';

	echo isset($quickview['qty']['qty_block']) ? '
	.quickview-wrp .buy-btn-block .control-qty { '.$quickview['qty']['qty_block'].'}' : '';

	echo isset($quickview['qty']['qty_input']) ? '
	.quickview-wrp .buy-btn-block .control-qty input[type="text"].form-control { '.$quickview['qty']['qty_input'].'}' : '';

	echo isset($quickview['qty']['cart_icon']) ? '
	.quickview-wrp .buy-btn-block .btn-cart i { '.$quickview['qty']['cart_icon'].'}' : '';

	echo isset($quickview['qty']['cart_btn']) ? '
	.quickview-wrp .buy-btn-block .btn-cart { '.$quickview['qty']['cart_btn'].'}' : '';

	echo isset($quickview['qty']['cart_btn_h']) ? '
	.quickview-wrp .buy-btn-block .btn-cart:hover { '.$quickview['qty']['cart_btn_h'].'}' : '';

	echo isset($quickview['qty']['links']) ? '
	.quickview-wrp .buy-btn-block .cart-option a { '.$quickview['qty']['links'].'}' : '';

	echo isset($quickview['qty']['links_h']) ? '
	.quickview-wrp .buy-btn-block .cart-option a:hover { '.$quickview['qty']['links_h'].'}' : '';
}
?>