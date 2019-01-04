<?php 
function smallprd1($arr, $prefix='') {

	echo isset($arr['block_normal']) ? 
	$prefix.'.small-prd-block1 { '. $arr['block_normal'] . ' }' : '';

	echo isset($arr['block_hover']) ? 
	$prefix.'.small-prd-block1:hover { '. $arr['block_hover'] . ' }' : '';

	echo isset($arr['image']) ? 
	$prefix.'.small-prd-block1 .image { '. $arr['image'] . ' }' : '';

	echo isset($arr['prdname']) ? 
	$prefix.'.small-prd-block1 .info .name { '. $arr['prdname'] . ' }' : '';

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
	$prefix.'.small-prd-block2 .info .name { '. $arr['prdname'] . ' }' : '';

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