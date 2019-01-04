<?php 
function deal($arr, $prefix='') {
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
	if (isset($arr['box1'])) {
		$block1 = $arr['box1'];
		
		dealblock($block1, $prefix, '.deals-box1');
		
	}

	/* Block 2
	------------------------*/
	if (isset($arr['box2'])) {
		$block2 = $arr['box2'];
		
		echo isset($block2['overlay']) ? 
		$prefix.' .deals-box2 .overlay { '. $block2['overlay'] . ' }' : '';

		dealblock($block2, $prefix, '.deals-box2');
	}

	/* Block 3
	------------------------*/
	if (isset($arr['box3'])) {
		$block3 = $arr['box3'];
		
		echo isset($block3['overlay']) ? 
		$prefix.' .deals-box3 .overlay { '. $block3['overlay'] . ' }' : '';

		dealblock($block3, $prefix, '.deals-box3');
	}

	
}

function dealblock($arr, $prefix='', $block) {
	
	echo isset($arr['main_wrp']) ? 
	$prefix.' '.$block.' { '. $arr['main_wrp'] . ' }' : '';

	echo isset($arr['img_wrp']) ? 
	$prefix.' '.$block.' .img-wrp { '. $arr['img_wrp'] . ' }' : '';

	echo isset($arr['th_wrp']) ? 
	$prefix.' '.$block.' .img-wrp ul { '. $arr['th_wrp'] . ' }' : '';

	echo isset($arr['th_img']) ? 
	$prefix.' '.$block.' .img-wrp ul li a { '. $arr['th_img'] . ' }' : '';

	echo isset($arr['info_wrp']) ? 
	$prefix.' '.$block.' .info-wrp { '. $arr['info_wrp'] . ' }' : '';

	echo isset($arr['name_wrp']) ? 
	$prefix.' '.$block.' .name { '. $arr['name_wrp'] . ' }' : '';

	echo isset($arr['name']) ? 
	$prefix.' '.$block.' .name .h2 { '. $arr['name'] . ' }' : '';

	echo isset($arr['cat_wrp']) ? 
	$prefix.' '.$block.' .name p { '. $arr['cat_wrp'] . ' }' : '';

	echo isset($arr['cat_links']) ? 
	$prefix.' '.$block.' .name p > a { '. $arr['cat_links'] . ' }' : '';

	echo isset($arr['cat_links_h']) ? 
	$prefix.' '.$block.' .name p > a:hover { '. $arr['cat_links_h'] . ' }' : '';

	echo isset($arr['price_wrp']) ? 
	$prefix.' '.$block.' .price-wrp { '. $arr['price_wrp'] . ' }' : '';

	echo isset($arr['price_box']) ? 
	$prefix.' '.$block.' .price { '. $arr['price_box'] . ' }' : '';

	echo isset($arr['price_p_new']) ? 
	$prefix.' '.$block.' .price-new { '. $arr['price_p_new'] . ' }' : '';

	echo isset($arr['price_p_old']) ? 
	$prefix.' '.$block.' .price-old { '. $arr['price_p_old'] . ' }' : '';

	echo isset($arr['tag']) ? 
	$prefix.' '.$block.' .discount-tag { '. $arr['tag'] . ' }' : '';

	echo isset($arr['review_wrp']) ? 
	$prefix.' '.$block.' .review-stars { '. $arr['review_wrp'] . ' }' : '';

	echo isset($arr['star']) ? 
	$prefix.' '.$block.' .review-stars i { '. $arr['star'] . ' font-size: inherit; }' : '';

	echo isset($arr['star_active']) ? 
	$prefix.' '.$block.' .review-stars .fa-star { '. $arr['star_active'] . ' }' : '';

	echo isset($arr['countdown_out_wrp']) ? 
	$prefix.' '.$block.' .countdown { '. $arr['countdown_out_wrp'] . ' }' : '';

	echo isset($arr['countdown_in_wrp']) ? 
	$prefix.' '.$block.' .countdown ul { '. $arr['countdown_in_wrp'] . ' }' : '';

	echo isset($arr['countdown_box']) ? 
	$prefix.' '.$block.' .countdown li { '. $arr['countdown_box'] . ' }' : '';

	echo isset($arr['countdown_count']) ? 
	$prefix.' '.$block.' .countdown li .count { '. $arr['countdown_count'] . ' }' : '';

	echo isset($arr['countdown_label']) ? 
	$prefix.' '.$block.' .countdown li .label { '. $arr['countdown_label'] . ' }' : '';

	echo isset($arr['description']) ? 
	$prefix.' '.$block.' .description { '. $arr['description'] . ' }' : '';

	echo isset($arr['btn_wrp']) ? 
	$prefix.' '.$block.' .btn-wrp { '. $arr['btn_wrp'] . ' }' : '';

	echo isset($arr['btn']) ? 
	$prefix.' '.$block.' .btn-wrp .default-btn { '. $arr['btn'] . ' }' : '';

	echo isset($arr['btn_h']) ? 
	$prefix.' '.$block.' .btn-wrp .default-btn:hover { '. $arr['btn_h'] . ' }' : '';

	echo isset($arr['links']) ? 
	$prefix.' '.$block.' .btn-wrp .links { '. $arr['links'] . ' }' : '';

	echo isset($arr['link']) ? 
	$prefix.' '.$block.' .btn-wrp .links a { '. $arr['link'] . ' }' : '';

	echo isset($arr['link_h']) ? 
	$prefix.' '.$block.' .btn-wrp .links a:hover { '. $arr['link_h'] . ' }' : '';
}
?>