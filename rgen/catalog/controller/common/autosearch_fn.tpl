<?php 
function autosearch ($arr, $prefix=''){

	// Auto search
	echo isset($arr['wrp']) ? 
	$prefix.'.autocomplete-suggestions { '.$arr['wrp'].'}' : '';

	echo isset($arr['prd']) ? 
	$prefix.'.search-prd { '.$arr['prd'].'}' : '';

	echo isset($arr['links']) ? 
	$prefix.'.search-prd a { '.$arr['links'].'}' : '';

	echo isset($arr['normal_price']) ? 
	$prefix.'.search-prd .price { '.$arr['normal_price'].'}' : '';

	echo isset($arr['spl_price']) ? 
	$prefix.'.search-prd .price-spl { '.$arr['spl_price'].'}' : '';

	echo isset($arr['old_price']) ? 
	$prefix.'.search-prd .price-old { '.$arr['old_price'].'}' : '';

	echo isset($arr['prd_h']) ? 
	$prefix.'.autocomplete-selected .search-prd, 
	.view-more-wrp:hover .search-prd { '.$arr['prd_h'].'}' : '';

	echo isset($arr['links_h']) ? 
	$prefix.'.autocomplete-selected .search-prd a, 
	.view-more-wrp:hover .search-prd a { '.$arr['links_h'].'}' : '';

	echo isset($arr['normal_price_h']) ? 
	$prefix.'.autocomplete-selected .search-prd .price { '.$arr['normal_price_h'].'}' : '';

	echo isset($arr['spl_price_h']) ? 
	$prefix.'.autocomplete-selected .search-prd .price-spl { '.$arr['spl_price_h'].'}' : '';

	echo isset($arr['old_price_h']) ? 
	$prefix.'.autocomplete-selected .search-prd .price-old { '.$arr['old_price_h'].'}' : '';
}
?>