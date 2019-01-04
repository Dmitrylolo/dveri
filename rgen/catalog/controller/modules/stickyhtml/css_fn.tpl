<?php 
function fn_stickyhtmls($arr, $prefix='') {
	echo isset($arr['main']) ? 
	$prefix.' .mod-out-wrp { '. $arr['main'] . ' }' : '';

	echo isset($arr['mod_wrp']) ? 
	$prefix.' .mod-wrp { '. $arr['mod_wrp'] . ' }' : '';

	echo isset($arr['mod_content']) ? 
	$prefix.' .mod-content { '. $arr['mod_content'] . ' }' : '';

	echo isset($arr['mod_hd']) ? 
	$prefix.' .mod-hd { '. $arr['mod_hd'] . ' }' : '';

	echo isset($arr['content']) ? 
	$prefix.' .mod-customhtml { '. $arr['content'] . ' }' : '';

	echo isset($arr['icon']) ? 
	$prefix.' .sticky-handle { '. $arr['icon'] . ' }' : '';
}
?>