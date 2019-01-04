<?php 
function catshowcase($arr, $prefix='') {
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

	/* Content row
	------------------------*/
	echo isset($arr['content_rw']) ? 
	$prefix.' .mod-content > .rw > .cl > .rw { '. $arr['content_rw'] . ' }' : '';

	echo isset($arr['content_rw_cl']) ? 
	$prefix.' .mod-content > .rw > .cl > .rw > .cl { '. $arr['content_rw_cl'] . ' }' : '';

	echo isset($arr['content_rw_cl_first']) ? 
	$prefix.' .mod-content > .rw > .cl > .rw > .cl:first-child { '. $arr['content_rw_cl_first'] . ' }' : '';

	echo isset($arr['content_rw_cl_last']) ? 
	$prefix.' .mod-content > .rw > .cl > .rw > .cl:last-child { '. $arr['content_rw_cl_last'] . ' }' : '';

	/* Block 1
	------------------------*/
	if (isset($arr['ct_box1'])) {
		$block1 = $arr['ct_box1'];

		catblock($block1, $prefix, '.catshowcase-box1');

		echo isset($block1['normal']['info']) ? 
		$prefix.' .catshowcase-box1 .info { '. $block1['normal']['info'] . ' }' : '';
		
		echo isset($block1['hover']['info']) ? 
		$prefix.' .catshowcase-box1:hover .info { '. $block1['hover']['info'] . ' }' : '';

		echo isset($block1['normal']['img_overlay']) ? 
		$prefix.' .catshowcase-box1 .img > span { '. $block1['normal']['img_overlay'] . ' }' : '';
	}

	/* Block 2
	------------------------*/
	if (isset($arr['ct_box2'])) {
		$block2 = $arr['ct_box2'];

		catblock($block2, $prefix, '.catshowcase-box2');

		echo isset($block2['normal']['info']) ? 
		$prefix.' .catshowcase-box2 .info-wrp { '. $block2['normal']['info'] . ' }' : '';
		
		echo isset($block2['hover']['info']) ? 
		$prefix.' .catshowcase-box2:hover .info-wrp { '. $block2['hover']['info'] . ' }' : '';
	}

	/* Block 4
	------------------------*/
	if (isset($arr['ct_box4'])) {
		$block4 = $arr['ct_box4'];

		catblock($block4, $prefix, '.catshowcase-box4');

		echo isset($block4['normal']['info']) ? 
		$prefix.' .catshowcase-box4 .info { '. $block4['normal']['info'] . ' }' : '';
		
		echo isset($block4['hover']['info']) ? 
		$prefix.' .catshowcase-box4:hover .info { '. $block4['hover']['info'] . ' }' : '';
	}

	/* Block 3
	------------------------*/
	if (isset($arr['ct_box3'])) {
		$block3 = $arr['ct_box3'];

		echo isset($block3['info']) ? 
		$prefix.' .catshowcase-box3 .info { '. $block3['info'] . ' }' : '';

		echo isset($block3['name']) ? 
		$prefix.' .catshowcase-box3 .name { '. $block3['name'] . ' }' : '';

		echo isset($block3['text']) ? 
		$prefix.' .catshowcase-box3 .text { '. $block3['text'] . ' }' : '';

		echo isset($block3['sub_ct']) ? 
		$prefix.' .catshowcase-box3 .sub-ct { '. $block3['sub_ct'] . ' }' : '';

		echo isset($block3['sub_ct_items']) ? 
		$prefix.' .catshowcase-box3 .sub-ct > a { '. $block3['sub_ct_items'] . ' }' : '';

		echo isset($block3['sub_ct_items_h']) ? 
		$prefix.' .catshowcase-box3 .sub-ct > a:hover { '. $block3['sub_ct_items_h'] . ' }' : '';

		echo isset($block3['btn_wrp']) ? 
		$prefix.' .catshowcase-box3 .btn_wrp { '. $block3['btn_wrp'] . ' }' : '';

		echo isset($block3['btn']) ? 
		$prefix.' .catshowcase-box3 .default-btn { '. $block3['btn'] . ' }' : '';
		echo isset($block3['btn_h']) ? 
		$prefix.' .catshowcase-box3 .default-btn:hover { '. $block3['btn_h'] . ' }' : '';

		echo isset($block3['link']) ? 
		$prefix.' .catshowcase-box3 .button-link { '. $block3['link'] . ' }' : '';
		echo isset($block3['link_h']) ? 
		$prefix.' .catshowcase-box3 .button-link:hover { '. $block3['link_h'] . ' }' : '';
		
	}
}

function catblock($arr, $prefix='', $catblock) {
	// Normal
	echo isset($arr['normal']['main']) ? 
	$prefix.' '.$catblock.' { '. $arr['normal']['main'] . ' }' : '';

	echo isset($arr['normal']['main_ct']) ? 
	$prefix.' '.$catblock.' .main-ct { '. $arr['normal']['main_ct'] . ' }' : '';

	echo isset($arr['normal']['img']) ? 
	$prefix.' '.$catblock.' .img { '. $arr['normal']['img'] . ' }' : '';

	echo isset($arr['normal']['name']) ? 
	$prefix.' '.$catblock.' .name { '. $arr['normal']['name'] . ' }' : '';

	echo isset($arr['normal']['text']) ? 
	$prefix.' '.$catblock.' .text { '. $arr['normal']['text'] . ' }' : '';

	echo isset($arr['normal']['sub_ct']) ? 
	$prefix.' '.$catblock.' .sub-ct { '. $arr['normal']['sub_ct'] . ' }' : '';

	echo isset($arr['normal']['sub_ct_items']) ? 
	$prefix.' '.$catblock.' .sub-ct > li > a { '. $arr['normal']['sub_ct_items'] . ' }' : '';

	echo isset($arr['normal']['btn_wrp']) ? 
	$prefix.' '.$catblock.' .btn-wrp { '. $arr['normal']['btn_wrp'] . ' }' : '';

	echo isset($arr['normal']['btn']) ? 
	$prefix.' '.$catblock.' .btn-wrp > .default-btn { '. $arr['normal']['btn'] . ' }' : '';

	echo isset($arr['normal']['link']) ? 
	$prefix.' '.$catblock.' .btn-wrp > .button-link { '. $arr['normal']['link'] . ' }' : '';

	// Hover
	echo isset($arr['hover']['main']) ? 
	$prefix.' '.$catblock.':hover { '. $arr['hover']['main'] . ' }' : '';

	echo isset($arr['hover']['main_ct']) ? 
	$prefix.' '.$catblock.':hover .main-ct { '. $arr['hover']['main_ct'] . ' }' : '';

	echo isset($arr['hover']['img']) ? 
	$prefix.' '.$catblock.':hover .img { '. $arr['hover']['img'] . ' }' : '';

	echo isset($arr['hover']['name']) ? 
	$prefix.' '.$catblock.':hover .name { '. $arr['hover']['name'] . ' }' : '';

	echo isset($arr['hover']['text']) ? 
	$prefix.' '.$catblock.':hover .text { '. $arr['hover']['text'] . ' }' : '';

	echo isset($arr['hover']['sub_ct_items']) ? 
	$prefix.' '.$catblock.' .sub-ct > li:hover > a { '. $arr['hover']['sub_ct_items'] . ' }' : '';

	echo isset($arr['hover']['btn_wrp']) ? 
	$prefix.' '.$catblock.' .btn-wrp:hover { '. $arr['hover']['btn_wrp'] . ' }' : '';

	echo isset($arr['hover']['btn']) ? 
	$prefix.' '.$catblock.' .btn-wrp > .default-btn:hover { '. $arr['hover']['btn'] . ' }' : '';

	echo isset($arr['hover']['link']) ? 
	$prefix.' '.$catblock.' .btn-wrp > .button-link:hover { '. $arr['hover']['link'] . ' }' : '';
}
?>