<?php 
function bannergrids($arr, $prefix='') {
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

	/* No Effect
	------------------------*/
	if (isset($arr['no_effect'])) {
		$no_effect = $arr['no_effect'];

		echo isset($no_effect['block']) ? 
		$prefix.' .banner-grid-item .bnr-img { '. $no_effect['block'] . ' }' : '';

		echo isset($no_effect['block_h']) ? 
		$prefix.' .banner-grid-item .bnr-img:hover { '. $no_effect['block_h'] . ' }' : '';

		echo isset($no_effect['img']) ? 
		$prefix.' .banner-grid-item .bnr-img img { '. $no_effect['img'] . ' }' : '';
		
		echo isset($no_effect['img_h']) ? 
		$prefix.' .banner-grid-item .bnr-img:hover img { '. $no_effect['img_h'] . ' }' : '';
	}

	/* Effect 1
	------------------------*/
	if (isset($arr['h_effect1'])) {
		$h_effect1 = $arr['h_effect1'];

		// Normal
		echo isset($h_effect1['normal']['background']) ? 
		$prefix.' .effect-1.h-effect { '. $h_effect1['normal']['background'] . ' }' : '';

		echo isset($h_effect1['normal']['overlay']) ? 
		$prefix.' .h-effect.effect-1 figcaption { '. $h_effect1['normal']['overlay'] . ' }' : '';

		echo isset($h_effect1['normal']['title']) ? 
		$prefix.' .h-effect.effect-1 .h3 { '. $h_effect1['normal']['title'] . ' }' : '';

		echo isset($h_effect1['normal']['description']) ? 
		$prefix.' .h-effect.effect-1 p { '. $h_effect1['normal']['description'] . ' }' : '';

		echo isset($h_effect1['normal']['img_opacity']) ? 
		$prefix.' .h-effect.effect-1 img { '. $h_effect1['normal']['img_opacity'] . ' }' : '';

		echo isset($h_effect1['normal']['scale']) ? 
		$prefix.' .h-effect.effect-1 img { transform: scale('. $h_effect1['normal']['scale'] . '); 
		-webkit-transform: scale('. $h_effect1['normal']['scale'] . '); }' : '';

		// Hover
		echo isset($h_effect1['hover']['background']) ? 
		$prefix.' .effect-1.h-effect:hover { '. $h_effect1['hover']['background'] . ' }' : '';

		echo isset($h_effect1['hover']['overlay']) ? 
		$prefix.' .h-effect.effect-1:hover figcaption { '. $h_effect1['hover']['overlay'] . ' }' : '';

		echo isset($h_effect1['hover']['title']) ? 
		$prefix.' .h-effect.effect-1:hover .h3 { '. $h_effect1['hover']['title'] . ' }' : '';

		echo isset($h_effect1['hover']['description']) ? 
		$prefix.' .h-effect.effect-1:hover p { '. $h_effect1['hover']['description'] . ' }' : '';

		echo isset($h_effect1['hover']['img_opacity']) ? 
		$prefix.' .h-effect.effect-1:hover img { '. $h_effect1['hover']['img_opacity'] . ' }' : '';

		echo isset($h_effect1['hover']['scale']) ? 
		$prefix.' .h-effect.effect-1:hover img { transform: scale('. $h_effect1['hover']['scale'] . '); 
		-webkit-transform: scale('. $h_effect1['hover']['scale'] . '); }' : '';
	}

	/* Effect 2
	------------------------*/
	if (isset($arr['h_effect2'])) {
		$h_effect2 = $arr['h_effect2'];

		// Normal
		echo isset($h_effect2['normal']['background']) ? 
		$prefix.' .effect-2.h-effect { '. $h_effect2['normal']['background'] . ' }' : '';

		echo isset($h_effect2['normal']['overlay']) ? 
		$prefix.' .h-effect.effect-2 figcaption::before { '. $h_effect2['normal']['overlay'] . ' }' : '';

		echo isset($h_effect2['normal']['title']) ? 
		$prefix.' .h-effect.effect-2 .h3 { '. $h_effect2['normal']['title'] . ' }' : '';

		echo isset($h_effect2['normal']['description']) ? 
		$prefix.' .h-effect.effect-2 p { '. $h_effect2['normal']['description'] . ' }' : '';

		echo isset($h_effect2['normal']['img_opacity']) ? 
		$prefix.' .h-effect.effect-2 img { '. $h_effect2['normal']['img_opacity'] . ' }' : '';

		echo isset($h_effect2['normal']['scale']) ? 
		$prefix.' .h-effect.effect-2 img { transform: scale('. $h_effect2['normal']['scale'] . '); 
		-webkit-transform: scale('. $h_effect2['normal']['scale'] . '); }' : '';

		// Hover
		echo isset($h_effect2['hover']['background']) ? 
		$prefix.' .h-effect.effect-2:hover { '. $h_effect2['hover']['background'] . ' }' : '';

		echo isset($h_effect2['hover']['overlay']) ? 
		$prefix.' .h-effect.effect-2:hover figcaption::before { '. $h_effect2['hover']['overlay'] . ' }' : '';

		echo isset($h_effect2['hover']['title']) ? 
		$prefix.' .h-effect.effect-2:hover .h3 { '. $h_effect2['hover']['title'] . ' }' : '';

		echo isset($h_effect2['hover']['description']) ? 
		$prefix.' .h-effect.effect-2:hover p { '. $h_effect2['hover']['description'] . ' }' : '';

		echo isset($h_effect2['hover']['img_opacity']) ? 
		$prefix.' .h-effect.effect-2:hover img { '. $h_effect2['hover']['img_opacity'] . ' }' : '';

		echo isset($h_effect2['hover']['scale']) ? 
		$prefix.' .h-effect.effect-2:hover img { transform: scale('. $h_effect2['hover']['scale'] . '); 
		-webkit-transform: scale('. $h_effect2['hover']['scale'] . '); }' : '';
	}

	/* Effect 3
	------------------------*/
	if (isset($arr['h_effect3'])) {
		$h_effect3 = $arr['h_effect3'];

		// Normal
		echo isset($h_effect3['normal']['background']) ? 
		$prefix.' .effect-3.h-effect { '. $h_effect3['normal']['background'] . ' }' : '';

		echo isset($h_effect3['normal']['overlay']) ? 
		$prefix.' .h-effect.effect-3 figcaption { '. $h_effect3['normal']['overlay'] . ' }' : '';

		echo isset($h_effect3['normal']['title']) ? 
		$prefix.' .h-effect.effect-3 .h3 { '. $h_effect3['normal']['title'] . ' }' : '';

		echo isset($h_effect3['normal']['description']) ? 
		$prefix.' .h-effect.effect-3 p { '. $h_effect3['normal']['description'] . ' }' : '';

		echo isset($h_effect3['normal']['img_opacity']) ? 
		$prefix.' .h-effect.effect-3 img { '. $h_effect3['normal']['img_opacity'] . ' }' : '';

		echo isset($h_effect3['normal']['scale']) ? 
		$prefix.' .h-effect.effect-3 img { transform: scale('. $h_effect3['normal']['scale'] . '); 
		-webkit-transform: scale('. $h_effect3['normal']['scale'] . '); }' : '';

		// Hover
		echo isset($h_effect3['hover']['background']) ? 
		$prefix.' .h-effect.effect-3:hover { '. $h_effect3['hover']['background'] . ' }' : '';

		echo isset($h_effect3['hover']['bdrcolor']) ? 
		$prefix.' .h-effect.effect-3:hover figcaption::before,'.
		$prefix.' .h-effect.effect-3:hover figcaption::after { '. $h_effect3['hover']['bdrcolor'] . ' }' : '';

		echo isset($h_effect3['hover']['overlay']) ? 
		$prefix.' .h-effect.effect-3:hover figcaption { '. $h_effect3['hover']['overlay'] . ' }' : '';

		echo isset($h_effect3['hover']['title']) ? 
		$prefix.' .h-effect.effect-3:hover .h3 { '. $h_effect3['hover']['title'] . ' }' : '';

		echo isset($h_effect3['hover']['description']) ? 
		$prefix.' .h-effect.effect-3:hover p { '. $h_effect3['hover']['description'] . ' }' : '';

		echo isset($h_effect3['hover']['img_opacity']) ? 
		$prefix.' .h-effect.effect-3:hover img { '. $h_effect3['hover']['img_opacity'] . ' }' : '';

		echo isset($h_effect3['hover']['scale']) ? 
		$prefix.' .h-effect.effect-3:hover img { transform: scale('. $h_effect3['hover']['scale'] . '); 
		-webkit-transform: scale('. $h_effect3['hover']['scale'] . '); }' : '';
	}

	/* Effect 4
	------------------------*/
	if (isset($arr['h_effect4'])) {
		$h_effect4 = $arr['h_effect4'];

		// Normal
		echo isset($h_effect4['normal']['background']) ? 
		$prefix.' .effect-4.h-effect { '. $h_effect4['normal']['background'] . ' }' : '';

		echo isset($h_effect4['normal']['overlay']) ? 
		$prefix.' .h-effect.effect-4 figcaption { '. $h_effect4['normal']['overlay'] . ' }' : '';

		echo isset($h_effect4['normal']['title']) ? 
		$prefix.' .h-effect.effect-4 .h4 { '. $h_effect4['normal']['title'] . ' }' : '';

		echo isset($h_effect4['normal']['description']) ? 
		$prefix.' .h-effect.effect-4 p { '. $h_effect4['normal']['description'] . ' }' : '';

		echo isset($h_effect4['normal']['img_opacity']) ? 
		$prefix.' .h-effect.effect-4 img { '. $h_effect4['normal']['img_opacity'] . ' }' : '';

		echo isset($h_effect4['normal']['scale']) ? 
		$prefix.' .h-effect.effect-4 img { transform: scale('. $h_effect4['normal']['scale'] . '); 
		-webkit-transform: scale('. $h_effect4['normal']['scale'] . '); }' : '';

		// Hover
		echo isset($h_effect4['hover']['background']) ? 
		$prefix.' .h-effect.effect-4:hover { '. $h_effect4['hover']['background'] . ' }' : '';

		echo isset($h_effect4['hover']['overlay']) ? 
		$prefix.' .h-effect.effect-4:hover figcaption { '. $h_effect4['hover']['overlay'] . ' }' : '';

		echo isset($h_effect4['hover']['title']) ? 
		$prefix.' .h-effect.effect-4:hover .h4 { '. $h_effect4['hover']['title'] . ' }' : '';

		echo isset($h_effect4['hover']['description']) ? 
		$prefix.' .h-effect.effect-4:hover p { '. $h_effect4['hover']['description'] . ' }' : '';

		echo isset($h_effect4['hover']['img_opacity']) ? 
		$prefix.' .h-effect.effect-4:hover img { '. $h_effect4['hover']['img_opacity'] . ' }' : '';

		echo isset($h_effect4['hover']['scale']) ? 
		$prefix.' .h-effect.effect-4:hover img { transform: scale('. $h_effect4['hover']['scale'] . '); 
		-webkit-transform: scale('. $h_effect4['hover']['scale'] . '); }' : '';
	}

	/* Effect 5
	------------------------*/
	if (isset($arr['h_effect5'])) {
		$h_effect5 = $arr['h_effect5'];

		// Normal
		echo isset($h_effect5['normal']['background']) ? 
		$prefix.' .h-effect.effect-5 { '. $h_effect5['normal']['background'] . ' }' : '';

		echo isset($h_effect5['normal']['overlay']) ? 
		$prefix.' .h-effect.effect-5 figcaption { '. $h_effect5['normal']['overlay'] . ' }' : '';

		echo isset($h_effect5['normal']['bdrcolor']) ? 
		$prefix.' .h-effect.effect-5 figcaption::before,'.
		$prefix.' .h-effect.effect-5 figcaption::after { '. $h_effect5['normal']['bdrcolor'] . ' }' : '';

		echo isset($h_effect5['normal']['title']) ? 
		$prefix.' .h-effect.effect-5 .h3 { '. $h_effect5['normal']['title'] . ' }' : '';

		echo isset($h_effect5['normal']['description']) ? 
		$prefix.' .h-effect.effect-5 p { '. $h_effect5['normal']['description'] . ' }' : '';

		echo isset($h_effect5['normal']['img_opacity']) ? 
		$prefix.' .h-effect.effect-5 img { '. $h_effect5['normal']['img_opacity'] . ' }' : '';

		echo isset($h_effect5['normal']['scale']) ? 
		$prefix.' .h-effect.effect-5 img { transform: scale('. $h_effect5['normal']['scale'] . '); 
		-webkit-transform: scale('. $h_effect5['normal']['scale'] . '); }' : '';

		// Hover
		echo isset($h_effect5['hover']['background']) ? 
		$prefix.' .h-effect.effect-5:hover { '. $h_effect5['hover']['background'] . ' }' : '';

		echo isset($h_effect5['hover']['overlay']) ? 
		$prefix.' .h-effect.effect-5:hover figcaption { '. $h_effect5['hover']['overlay'] . ' }' : '';

		echo isset($h_effect5['hover']['bdrcolor']) ? 
		$prefix.' .h-effect.effect-5:hover figcaption::before,'.
		$prefix.' .h-effect.effect-5:hover figcaption::after { '. $h_effect5['hover']['bdrcolor'] . ' }' : '';

		echo isset($h_effect5['hover']['title']) ? 
		$prefix.' .h-effect.effect-5:hover .h3 { '. $h_effect5['hover']['title'] . ' }' : '';

		echo isset($h_effect5['hover']['description']) ? 
		$prefix.' .h-effect.effect-5:hover p { '. $h_effect5['hover']['description'] . ' }' : '';

		echo isset($h_effect5['hover']['img_opacity']) ? 
		$prefix.' .h-effect.effect-5:hover img { '. $h_effect5['hover']['img_opacity'] . ' }' : '';

		echo isset($h_effect5['hover']['scale']) ? 
		$prefix.' .h-effect.effect-5:hover img { transform: scale('. $h_effect5['hover']['scale'] . '); 
		-webkit-transform: scale('. $h_effect5['hover']['scale'] . '); }' : '';
	}

	/* Effect 6
	------------------------*/
	if (isset($arr['h_effect6'])) {
		$h_effect6 = $arr['h_effect6'];

		// Normal
		echo isset($h_effect6['normal']['background']) ? 
		$prefix.' .h-effect.effect-6 { '. $h_effect6['normal']['background'] . ' }' : '';

		echo isset($h_effect6['normal']['overlay']) ? 
		$prefix.' .h-effect.effect-6 figcaption { '. $h_effect6['normal']['overlay'] . ' }' : '';

		echo isset($h_effect6['normal']['bdrcolor']) ? 
		$prefix.' .h-effect.effect-6 figcaption::before { '. $h_effect6['normal']['bdrcolor'] . ' }' : '';

		echo isset($h_effect6['normal']['title']) ? 
		$prefix.' .h-effect.effect-6 .h3 { '. $h_effect6['normal']['title'] . ' }' : '';

		echo isset($h_effect6['normal']['description']) ? 
		$prefix.' .h-effect.effect-6 p { '. $h_effect6['normal']['description'] . ' }' : '';

		echo isset($h_effect6['normal']['img_opacity']) ? 
		$prefix.' .h-effect.effect-6 img { '. $h_effect6['normal']['img_opacity'] . ' }' : '';

		echo isset($h_effect6['normal']['scale']) ? 
		$prefix.' .h-effect.effect-6 img { transform: scale('. $h_effect6['normal']['scale'] . '); 
		-webkit-transform: scale('. $h_effect6['normal']['scale'] . '); }' : '';

		// Hover
		echo isset($h_effect6['hover']['background']) ? 
		$prefix.' .h-effect.effect-6:hover { '. $h_effect6['hover']['background'] . ' }' : '';

		echo isset($h_effect6['hover']['overlay']) ? 
		$prefix.' .h-effect.effect-6:hover figcaption { '. $h_effect6['hover']['overlay'] . ' }' : '';

		echo isset($h_effect6['hover']['bdrcolor']) ? 
		$prefix.' .h-effect.effect-6:hover figcaption::before { '. $h_effect6['hover']['bdrcolor'] . ' }' : '';

		echo isset($h_effect6['hover']['title']) ? 
		$prefix.' .h-effect.effect-6:hover .h3 { '. $h_effect6['hover']['title'] . ' }' : '';

		echo isset($h_effect6['hover']['description']) ? 
		$prefix.' .h-effect.effect-6:hover p { '. $h_effect6['hover']['description'] . ' }' : '';

		echo isset($h_effect6['hover']['img_opacity']) ? 
		$prefix.' .h-effect.effect-6:hover img { '. $h_effect6['hover']['img_opacity'] . ' }' : '';

		echo isset($h_effect6['hover']['scale']) ? 
		$prefix.' .h-effect.effect-6:hover img { transform: scale('. $h_effect6['hover']['scale'] . '); 
		-webkit-transform: scale('. $h_effect6['hover']['scale'] . '); }' : '';
	}
	
}
?>