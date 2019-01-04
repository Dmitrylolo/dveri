<?php 
function contentblocks($arr, $prefix='') {
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

	/* Content block 1
	------------------------*/
	if (isset($arr['ctn_block1'])) {
		$ctn_block1 = $arr['ctn_block1'];
		ctnblocks($ctn_block1, $prefix, '.ctn-block1');
	}

	/* Content block 2
	------------------------*/
	if (isset($arr['ctn_block2'])) {
		$ctn_block2 = $arr['ctn_block2'];
		ctnblocks($ctn_block2, $prefix, '.ctn-block2');
	}

	/* Content block 3
	------------------------*/
	if (isset($arr['ctn_block3'])) {
		$ctn_block3 = $arr['ctn_block3'];
		ctnblocks($ctn_block3, $prefix, '.ctn-block3');
	}

	/* Content block 3
	------------------------*/
	if (isset($arr['ctn_block4'])) {
		$ctn_block4 = $arr['ctn_block4'];
		ctnblocks($ctn_block4, $prefix, '.ctn-block4');
	}

	/* Content block small 1
	------------------------*/
	if (isset($arr['ctn_block_small1'])) {
		$ctn_block_small1 = $arr['ctn_block_small1'];
		ctnblocks($ctn_block_small1, $prefix, '.ctn-block-small1');
	}

	/* Content block small 2
	------------------------*/
	if (isset($arr['ctn_block_small2'])) {
		$ctn_block_small2 = $arr['ctn_block_small2'];
		ctnblocks($ctn_block_small2, $prefix, '.ctn-block-small2');
	}
}

function ctnblocks($arr, $prefix='', $ctnblockstyle) {
	echo isset($arr['main']['normal']) ? 
	$prefix.' .m-cl '.$ctnblockstyle.' { '. $arr['main']['normal'] . ' }' : '';

	echo isset($arr['main']['hover']) ? 
	$prefix.' .m-cl '.$ctnblockstyle.':hover { '. $arr['main']['hover'] . ' }' : '';

	echo isset($arr['inner_wrp']['normal']) ? 
	$prefix.' .m-cl '.$ctnblockstyle.' .ctn-inner-wrp { '. $arr['inner_wrp']['normal'] . ' }' : '';

	echo isset($arr['inner_wrp']['hover']) ? 
	$prefix.' .m-cl '.$ctnblockstyle.':hover .ctn-inner-wrp { '. $arr['inner_wrp']['hover'] . ' }' : '';

	echo isset($arr['figure']['normal']) ? 
	$prefix.' .m-cl '.$ctnblockstyle.' figure { '. $arr['figure']['normal'] . ' }' : '';

	echo isset($arr['figure']['hover']) ? 
	$prefix.' .m-cl '.$ctnblockstyle.':hover figure { '. $arr['figure']['hover'] . ' }' : '';

	echo isset($arr['text_wrp']['normal']) ? 
	$prefix.' .m-cl '.$ctnblockstyle.' .text-wrp { '. $arr['text_wrp']['normal'] . ' }' : '';

	echo isset($arr['text_wrp']['hover']) ? 
	$prefix.' .m-cl '.$ctnblockstyle.':hover .text-wrp { '. $arr['text_wrp']['hover'] . ' }' : '';

	echo isset($arr['name']['normal']) ? 
	$prefix.' .m-cl '.$ctnblockstyle.' .name { '. $arr['name']['normal'] . ' }'. 
	$prefix.' .m-cl '.$ctnblockstyle.' .name a { color: inherit; }' : '';

	echo isset($arr['name']['hover']) ? 
	$prefix.' .m-cl '.$ctnblockstyle.':hover .name { '. $arr['name']['hover'] . ' }' : '';

	echo isset($arr['text']['normal']) ? 
	$prefix.' .m-cl '.$ctnblockstyle.' .text { '. $arr['text']['normal'] . ' }' .
	$prefix.' .m-cl '.$ctnblockstyle.' .text a { color: inherit; }' : '';

	echo isset($arr['text']['hover']) ? 
	$prefix.' .m-cl '.$ctnblockstyle.':hover .text { '. $arr['text']['hover'] . ' }' : '';

	echo isset($arr['btn_wrp']['normal']) ? 
	$prefix.' .m-cl '.$ctnblockstyle.' .btn-wrp { '. $arr['btn_wrp']['normal'] . ' }' : '';

	echo isset($arr['btn_wrp']['hover']) ? 
	$prefix.' .m-cl '.$ctnblockstyle.':hover .btn-wrp { '. $arr['btn_wrp']['hover'] . ' }' : '';

	echo isset($arr['btn']['normal']) ? 
	$prefix.' .m-cl '.$ctnblockstyle.' .default-btn { '. $arr['btn']['normal'] . ' }' : '';

	echo isset($arr['btn']['hover']) ? 
	$prefix.' .m-cl '.$ctnblockstyle.':hover .default-btn { '. $arr['btn']['hover'] . ' }' : '';

	echo isset($arr['link']['normal']) ? 
	$prefix.' .m-cl '.$ctnblockstyle.' .ctn-block-lnk { '. $arr['link']['normal'] . ' }' : '';

	echo isset($arr['link']['hover']) ? 
	$prefix.' .m-cl '.$ctnblockstyle.':hover .ctn-block-lnk { '. $arr['link']['hover'] . ' }' : '';
}


?>