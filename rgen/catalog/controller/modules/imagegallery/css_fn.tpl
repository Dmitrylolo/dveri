<?php 
function imagegallery($arr, $prefix='') {
	echo isset($arr['main']) ? 
	$prefix.' { '. $arr['main'] . ' }' : '';

	echo isset($arr['main_bg']) ? 
	$prefix.' { '. $arr['main_bg'] . ' }' : '';

	echo isset($arr['mod_wrp']) ? 
	$prefix.' .mod-wrp { '. $arr['mod_wrp'] . ' }' : '';

	echo isset($arr['mod_content']) ? 
	$prefix.' .mod-content { '. $arr['mod_content'] . ' }' : '';

	echo isset($arr['mod_hd']) ? 
	$prefix.' .mod-hd { '. $arr['mod_hd'] . ' }' : '';

	echo isset($arr['mod_sub_hd']) ? 
	$prefix.' .sub-mod-hd { '. $arr['mod_sub_hd'] . ' }' : '';

	/* Custom HTML
	------------------------*/
	echo isset($arr['t_html']) ? 
	$prefix.' .t-html { '. $arr['t_html'] . ' }' : '';

	echo isset($arr['b_html']) ? 
	$prefix.' .b-html { '. $arr['b_html'] . ' }' : '';
	
	echo isset($arr['l_html']) ? 
	$prefix.' .l-html { '. $arr['l_html'] . ' }' : '';
	
	echo isset($arr['r_html']) ? 
	$prefix.' .r-html { '. $arr['r_html'] . ' }' : '';

	/* Custom HTML grids
	------------------------*/
	echo isset($arr['rw']) ? 
	$prefix.' .mod-wrp > .rw { '. $arr['rw'] . ' }' : '';

	echo isset($arr['l_cl']) ? 
	$prefix.' .mod-wrp > .rw > .l-cl { '. $arr['l_cl'] . ' }' : '';

	echo isset($arr['m_cl']) ? 
	$prefix.' .mod-wrp > .rw > .m-cl { '. $arr['m_cl'] . ' }' : '';

	echo isset($arr['r_cl']) ? 
	$prefix.' .mod-wrp > .rw > .r-cl { '. $arr['r_cl'] . ' }' : '';

	/* Main row
	------------------------*/
	echo isset($arr['outer_rw']) ? 
	$prefix.' .mod-content > .rw { '. $arr['outer_rw'] . ' }' : '';

	echo isset($arr['outer_rw_first']) ? 
	$prefix.' .mod-content > .rw:first-child { '. $arr['outer_rw_first'] . ' }' : '';

	echo isset($arr['outer_rw_last']) ? 
	$prefix.' .mod-content > .rw:last-child { '. $arr['outer_rw_last'] . ' }' : '';

	echo isset($arr['outer_rw_cl']) ? 
	$prefix.' .mod-content > .rw > .cl { '. $arr['outer_rw_cl'] . ' }' : '';

	echo isset($arr['outer_rw_cl_first']) ? 
	$prefix.' .mod-content > .rw > .cl:first-child { '. $arr['outer_rw_cl_first'] . ' }' : '';

	echo isset($arr['outer_rw_cl_last']) ? 
	$prefix.' .mod-content > .rw > .cl:last-child { '. $arr['outer_rw_cl_last'] . ' }' : '';

	/* Gallery item
	------------------------*/
	if (isset($arr['image_block'])) {
		$item = $arr['image_block'];
		
		echo isset($item['block']) ? 
		$prefix.' .gallery-item { '. $item['block'] . ' }' : '';

		echo isset($item['overlay']) ? 
		$prefix.' .gallery-item .overlay { '. $item['overlay'] . ' }' : '';

		echo isset($item['icon']) ? 
		$prefix.' .gallery-item .overlay .ico { '. $item['icon'] . ' }' : '';

		echo isset($item['icon_h']) ? 
		$prefix.' .gallery-item .overlay .ico:hover { '. $item['icon_h'] . ' }' : '';
	}
	
}
?>