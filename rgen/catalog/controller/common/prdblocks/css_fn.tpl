<?php 
function prd1($arr, $prefix='') {
	echo isset($arr['block_normal']) ? 
	$prefix.'.prd-block1 { '. $arr['block_normal'] . ' }' : '';

	echo isset($arr['block_hover']) ? 
	$prefix.'.prd-block1:hover { '. $arr['block_hover'] . ' }' : '';

	echo isset($arr['image_normal']) ? 
	$prefix.'.prd-block1 .image { '. $arr['image_normal'] . ' }' : '';

	echo isset($arr['image_hover']) ? 
	$prefix.'.prd-block1 .image:hover { '. $arr['image_hover'] . ' }' : '';

	echo isset($arr['info_block']) ? 
	$prefix.'.prd-block1 .info-wrp { '. $arr['info_block'] . ' }' : '';

	echo isset($arr['info_wrpper']) ? 
	$prefix.'.prd-block1 .info-wrp .info { '. $arr['info_wrpper'] . ' }' : '';

	echo isset($arr['info_name']) ? 
	$prefix.'.prd-block1 .name { '. $arr['info_name'] . ' }' : '';

	echo isset($arr['info_name_hover']) ? 
	$prefix.'.prd-block1 .name:hover { '. $arr['info_name_hover'] . ' }' : '';

	echo isset($arr['info_description']) ? 
	$prefix.'.prd-block1 .description { '. $arr['info_description'] . ' }' : '';

	echo isset($arr['price_wrp']) ? 
	$prefix.'.prd-block1 .price-wrp { '. $arr['price_wrp'] . ' }' : '';
	
	echo isset($arr['price_block']) ? 
	$prefix.'.prd-block1 .price { '. $arr['price_block'] . ' }' : '';

	echo isset($arr['price_new']) ? 
	$prefix.'.prd-block1 .price .price-new { '. $arr['price_new'] . ' }' : '';

	echo isset($arr['price_spl']) ? 
	$prefix.'.prd-block1 .price .price-spl { '. $arr['price_spl'] . ' }' : '';

	echo isset($arr['price_old']) ? 
	$prefix.'.prd-block1 .price .price-old { '. $arr['price_old'] . ' }' : '';

	echo isset($arr['price_tax']) ? 
	$prefix.'.prd-block1 .price .price-tax { '. $arr['price_tax'] . ' }' : '';

	echo isset($arr['btn_wrp']) ? 
	$prefix.'.prd-block1 .buy-option { '. $arr['btn_wrp'] . ' }' : '';

	echo isset($arr['cart_btn_normal']) ? 
	$prefix.'.prd-block1 .btn-cart { '. $arr['cart_btn_normal'] . ' }' : '';

	echo isset($arr['cart_btn_hover']) ? 
	$prefix.'.prd-block1 .btn-cart:hover { '. $arr['cart_btn_hover'] . ' }' : '';

	echo isset($arr['links_wrp']) ? 
	$prefix.'.prd-block1 .info-wrp ul { '. $arr['links_wrp'] . ' }' : '';

	echo isset($arr['links_normal']) ? 
	$prefix.'.prd-block1 .info-wrp ul li { '. $arr['links_normal'] . ' }' : '';

	echo isset($arr['links_hover']) ? 
	$prefix.'.prd-block1 .info-wrp ul li:hover { '. $arr['links_hover'] . ' }' : '';

	echo isset($arr['quickview_btn_normal']) ? 
	$prefix.'.prd-block1 a.quickview-link { '. $arr['quickview_btn_normal'] . ' }' : '';

	echo isset($arr['quickview_btn_hover']) ? 
	$prefix.'.prd-block1 a.quickview-link:hover { '. $arr['quickview_btn_hover'] . ' }' : '';
	
}

function prd2($arr, $prefix='') {
	echo isset($arr['block_normal']) ?
	$prefix.'.prd-block2 { '. $arr['block_normal'] . ' }' : '';

	echo isset($arr['block_hover']) ? 
	$prefix.'.prd-block2:hover { '. $arr['block_hover'] . ' }' : '';

	echo isset($arr['image_normal']) ? 
	$prefix.'.prd-block2 .image { '. $arr['image_normal'] . ' }' : '';

	echo isset($arr['image_hover']) ? 
	$prefix.'.prd-block2 .image:hover { '. $arr['image_hover'] . ' }' : '';

	echo isset($arr['info_block']) ? 
	$prefix.'.prd-block2 .image .info-wrp { '. $arr['info_block'] . ' }' : '';

	echo isset($arr['info_block_hover']) ? 
	$prefix.'.prd-block2:hover .image .info-wrp { '. $arr['info_block_hover'] . ' }' : '';

	echo isset($arr['info_name']) ? 
	$prefix.'.prd-block2 .info-wrp .name a { '. $arr['info_name'] . ' }' : '';

	echo isset($arr['info_name_hover']) ? 
	$prefix.'.prd-block2 .info-wrp .name a:hover { '. $arr['info_name_hover'] . ' }' : '';

	echo isset($arr['info_description']) ? 
	$prefix.'.prd-block2 .info-wrp .info { '. $arr['info_description'] . ' }' : '';

	echo isset($arr['price_block']) ? 
	$prefix.'.prd-block2 .price { '. $arr['price_block'] . ' }' : '';

	echo isset($arr['price_new']) ? 
	$prefix.'.prd-block2 .price .price-new { '. $arr['price_new'] . ' }' : '';

	echo isset($arr['price_spl']) ? 
	$prefix.'.prd-block2 .price .price-spl { '. $arr['price_spl'] . ' }' : '';

	echo isset($arr['price_old']) ? 
	$prefix.'.prd-block2 .price .price-old { '. $arr['price_old'] . ' }' : '';

	echo isset($arr['price_tax']) ? 
	$prefix.'.prd-block2 .price .price-tax { '. $arr['price_tax'] . ' }' : '';

	echo isset($arr['btn_wrp']) ? 
	$prefix.'.prd-block2 .btn-wrp { '. $arr['btn_wrp'] . ' }' : '';

	echo isset($arr['cart_btn_normal']) ? 
	$prefix.'.prd-block2 .btn-cart { '. $arr['cart_btn_normal'] . ' }' : '';

	echo isset($arr['cart_btn_hover']) ? 
	$prefix.'.prd-block2 .btn-cart:hover { '. $arr['cart_btn_hover'] . ' }' : '';

	echo isset($arr['wish_btn_normal']) ? 
	$prefix.'.prd-block2 .btn-wish { '. $arr['wish_btn_normal'] . ' }' : '';

	echo isset($arr['wish_btn_hover']) ? 
	$prefix.'.prd-block2 .btn-wish:hover { '. $arr['wish_btn_hover'] . ' }' : '';

	echo isset($arr['compare_btn_normal']) ? 
	$prefix.'.prd-block2 .btn-compare { '. $arr['compare_btn_normal'] . ' }' : '';

	echo isset($arr['compare_btn_hover']) ? 
	$prefix.'.prd-block2 .btn-compare:hover { '. $arr['compare_btn_hover'] . ' }' : '';

	echo isset($arr['more_btn_normal']) ? 
	$prefix.'.prd-block2 .btn-more { '. $arr['more_btn_normal'] . ' }' : '';

	echo isset($arr['more_btn_hover']) ? 
	$prefix.'.prd-block2 .btn-more:hover { '. $arr['more_btn_hover'] . ' }' : '';

	echo isset($arr['quickview_btn_normal']) ? 
	$prefix.'.prd-block2 a.quickview-link { '. $arr['quickview_btn_normal'] . ' }' : '';
	
	echo isset($arr['quickview_btn_hover']) ? 
	$prefix.'.prd-block2 a.quickview-link:hover { '. $arr['quickview_btn_hover'] . ' }' : '';
}

function prd3($arr, $prefix='') {
	echo isset($arr['block_normal']) ?
	$prefix.'.prd-block3 { '. $arr['block_normal'] . ' }' : '';

	echo isset($arr['block_hover']) ? 
	$prefix.'.prd-block3:hover { '. $arr['block_hover'] . ' }' : '';

	echo isset($arr['image_normal']) ? 
	$prefix.'.prd-block3 .image { '. $arr['image_normal'] . ' }' : '';

	echo isset($arr['image_hover']) ? 
	$prefix.'.prd-block3:hover .image { '. $arr['image_hover'] . ' }' : '';

	echo isset($arr['info_block']) ? 
	$prefix.'.prd-block3 .info-wrp { '. $arr['info_block'] . ' }' : '';

	echo isset($arr['info_block_hover']) ? 
	$prefix.'.prd-block3:hover .info-wrp { '. $arr['info_block_hover'] . ' }' : '';

	echo isset($arr['info_name']) ? 
	$prefix.'.prd-block3 .info-wrp .name { '. $arr['info_name'] . ' }'. 
	$prefix.'.prd-block3 .info-wrp .name a { color: inherit; }' : '';

	echo isset($arr['info_name_hover']) ? 
	$prefix.'.prd-block3 .info-wrp .name:hover { '. $arr['info_name_hover'] . ' }'.
	$prefix.'.prd-block3 .info-wrp .name:hover a { color: inherit; }' : '';

	echo isset($arr['info_description']) ? 
	$prefix.'.prd-block3 .info-wrp .info { '. $arr['info_description'] . ' }' : '';

	echo isset($arr['price_block']) ? 
	$prefix.'.prd-block3 .price { '. $arr['price_block'] . ' }' : '';

	echo isset($arr['price_new']) ? 
	$prefix.'.prd-block3 .price .price-new { '. $arr['price_new'] . ' }' : '';

	echo isset($arr['price_spl']) ? 
	$prefix.'.prd-block3 .price .price-spl { '. $arr['price_spl'] . ' }' : '';

	echo isset($arr['price_old']) ? 
	$prefix.'.prd-block3 .price .price-old { '. $arr['price_old'] . ' }' : '';

	echo isset($arr['price_tax']) ? 
	$prefix.'.prd-block3 .price .price-tax { '. $arr['price_tax'] . ' }' : '';

	echo isset($arr['btn_wrp']) ? 
	$prefix.'.prd-block3 .btn-wrp { '. $arr['btn_wrp'] . ' }' : '';

	echo isset($arr['cart_btn_normal']) ? 
	$prefix.'.prd-block3 .btn-cart { '. $arr['cart_btn_normal'] . ' }' : '';

	echo isset($arr['cart_btn_hover']) ? 
	$prefix.'.prd-block3 .btn-cart:hover { '. $arr['cart_btn_hover'] . ' }' : '';

	echo isset($arr['wish_btn_normal']) ? 
	$prefix.'.prd-block3 .btn-wish { '. $arr['wish_btn_normal'] . ' }' : '';

	echo isset($arr['wish_btn_hover']) ? 
	$prefix.'.prd-block3 .btn-wish:hover { '. $arr['wish_btn_hover'] . ' }' : '';

	echo isset($arr['compare_btn_normal']) ? 
	$prefix.'.prd-block3 .btn-compare { '. $arr['compare_btn_normal'] . ' }' : '';

	echo isset($arr['compare_btn_hover']) ? 
	$prefix.'.prd-block3 .btn-compare:hover { '. $arr['compare_btn_hover'] . ' }' : '';

	echo isset($arr['quickview_btn_normal']) ? 
	$prefix.'.prd-block3 a.quickview-link { '. $arr['quickview_btn_normal'] . ' }' : '';
	
	echo isset($arr['quickview_btn_hover']) ? 
	$prefix.'.prd-block3 a.quickview-link:hover { '. $arr['quickview_btn_hover'] . ' }' : '';
}

function prd4($arr, $prefix='') {
	echo isset($arr['block_normal']) ?
	$prefix.'.prd-block4 { '. $arr['block_normal'] . ' }' : '';

	echo isset($arr['block_hover']) ? 
	$prefix.'.prd-block4:hover { '. $arr['block_hover'] . ' }' : '';

	echo isset($arr['image_normal']) ? 
	$prefix.'.prd-block4 .image { '. $arr['image_normal'] . ' }' : '';

	echo isset($arr['image_hover']) ? 
	$prefix.'.prd-block4:hover .image { '. $arr['image_hover'] . ' }' : '';

	echo isset($arr['info_block']) ? 
	$prefix.'.prd-block4 .info-wrp { '. $arr['info_block'] . ' }' : '';

	echo isset($arr['info_block_hover']) ? 
	$prefix.'.prd-block4:hover .info-wrp { '. $arr['info_block_hover'] . ' }' : '';

	echo isset($arr['info_name']) ? 
	$prefix.'.prd-block4 .info-wrp .name { '. $arr['info_name'] . ' }'. 
	$prefix.'.prd-block4 .info-wrp .name a { color: inherit; }' : '';

	echo isset($arr['info_name_hover']) ? 
	$prefix.'.prd-block4 .info-wrp .name:hover { '. $arr['info_name_hover'] . ' }'.
	$prefix.'.prd-block4 .info-wrp .name:hover a { color: inherit; }' : '';

	echo isset($arr['info_description']) ? 
	$prefix.'.prd-block4 .info-wrp .info { '. $arr['info_description'] . ' }' : '';

	echo isset($arr['price_block']) ? 
	$prefix.'.prd-block4 .price { '. $arr['price_block'] . ' }' : '';

	echo isset($arr['price_new']) ? 
	$prefix.'.prd-block4 .price .price-new { '. $arr['price_new'] . ' }' : '';

	echo isset($arr['price_spl']) ? 
	$prefix.'.prd-block4 .price .price-spl { '. $arr['price_spl'] . ' }' : '';

	echo isset($arr['price_old']) ? 
	$prefix.'.prd-block4 .price .price-old { '. $arr['price_old'] . ' }' : '';

	echo isset($arr['price_tax']) ? 
	$prefix.'.prd-block4 .price .price-tax { '. $arr['price_tax'] . ' }' : '';

	echo isset($arr['btn_wrp']) ? 
	$prefix.'.prd-block4 .btn-wrp { '. $arr['btn_wrp'] . ' }' : '';

	echo isset($arr['cart_btn_normal']) ? 
	$prefix.'.prd-block4 .btn-cart { '. $arr['cart_btn_normal'] . ' }' : '';

	echo isset($arr['cart_btn_hover']) ? 
	$prefix.'.prd-block4 .btn-cart:hover { '. $arr['cart_btn_hover'] . ' }' : '';

	echo isset($arr['other_btn_normal']) ? 
	$prefix.'.prd-block4 .other-btn-wrp a { '. $arr['other_btn_normal'] . ' }' : '';

	echo isset($arr['other_btn_hover']) ? 
	$prefix.'.prd-block4 .other-btn-wrp a:hover { '. $arr['other_btn_hover'] . ' }' : '';
	
	echo isset($arr['quickview_btn_normal']) ? 
	$prefix.'.prd-block4 a.quickview-link { '. $arr['quickview_btn_normal'] . ' }' : '';
	
	echo isset($arr['quickview_btn_hover']) ? 
	$prefix.'.prd-block4 a.quickview-link:hover { '. $arr['quickview_btn_hover'] . ' }' : '';
}

function smallprd1($arr, $prefix='') {

	echo isset($arr['block_normal']) ? 
	$prefix.'.small-prd-block1 { '. $arr['block_normal'] . ' }' : '';

	echo isset($arr['block_hover']) ? 
	$prefix.'.small-prd-block1:hover { '. $arr['block_hover'] . ' }' : '';

	echo isset($arr['image']) ? 
	$prefix.'.small-prd-block1 .image { '. $arr['image'] . ' }' : '';

	echo isset($arr['prdname']) ? 
	$prefix.'.small-prd-block1 .info .name { '. $arr['prdname'] . ' }' .
	$prefix.'.small-prd-block1 .info .name a { color: inherit; }' : '';

	echo isset($arr['prdname_hover']) ? 
	$prefix.'.small-prd-block1 .info .name:hover a { '. $arr['prdname_hover'] . ' }' : '';

	echo isset($arr['price_block']) ? 
	$prefix.'.small-prd-block1 .price { '. $arr['price_block'] . ' }' : '';

	echo isset($arr['price_spl']) ? 
	$prefix.'.small-prd-block1 .price .price-spl { '. $arr['price_spl'] . ' }' : '';

	echo isset($arr['price_new']) ? 
	$prefix.'.small-prd-block1 .price .price-new { '. $arr['price_new'] . ' }' : '';

	echo isset($arr['price_old']) ? 
	$prefix.'.small-prd-block1 .price .price-old { '. $arr['price_old'] . ' }' : '';

	echo isset($arr['btn']) ? 
	$prefix.'.small-prd-block1 .more-btn { '. $arr['btn'] . ' }' : '';

	echo isset($arr['btn_hover']) ? 
	$prefix.'.small-prd-block1:hover .more-btn,'.
	$prefix.'.small-prd-block1 .more-btn:hover { '. $arr['btn_hover'] . ' }' : '';
}
function smallprd2($arr, $prefix='') {
	echo isset($arr['block_normal']) ? 
	$prefix.'.small-prd-block2 { '. $arr['block_normal'] . ' }' : '';

	echo isset($arr['block_hover']) ? 
	$prefix.'.small-prd-block2:hover { '. $arr['block_hover'] . ' }' : '';

	echo isset($arr['image']) ? 
	$prefix.'.small-prd-block2 .image { '. $arr['image'] . ' }' : '';

	echo isset($arr['prdname']) ? 
	$prefix.'.small-prd-block2 .info .name { '. $arr['prdname'] . ' }' .
	$prefix.'.small-prd-block2 .info .name a { color: inherit; }' : '';

	echo isset($arr['prdname_hover']) ? 
	$prefix.'.small-prd-block2 .info .name:hover a { '. $arr['prdname_hover'] . ' }' : '';

	echo isset($arr['price_block']) ? 
	$prefix.'.small-prd-block2 .price { '. $arr['price_block'] . ' }' : '';

	echo isset($arr['price_spl']) ? 
	$prefix.'.small-prd-block2 .price .price-spl { '. $arr['price_spl'] . ' }' : '';

	echo isset($arr['price_new']) ? 
	$prefix.'.small-prd-block2 .price .price-new { '. $arr['price_new'] . ' }' : '';

	echo isset($arr['price_old']) ? 
	$prefix.'.small-prd-block2 .price .price-old { '. $arr['price_old'] . ' }' : '';

	echo isset($arr['btn_normal']) ? 
	$prefix.'.small-prd-block2 .more-btn { '. $arr['btn_normal'] . ' }' : '';

	echo isset($arr['btn_hover']) ? 
	$prefix.'.small-prd-block2:hover .more-btn,'.
	$prefix.'.small-prd-block2 .more-btn:hover { '. $arr['btn_hover'] . ' }' : '';
}

?>