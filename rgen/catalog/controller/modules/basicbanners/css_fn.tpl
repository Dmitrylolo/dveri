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

		echo isset($h_effect1['background']) ? 
		$prefix.' .effect-1.h-effect { '. $h_effect1['background'] . ' }' : '';

		echo isset($h_effect1['overlay']) ? 
		$prefix.' .h-effect.effect-1:hover figcaption { '. $h_effect1['overlay'] . ' }' : '';

		echo isset($h_effect1['title']) ? 
		$prefix.' .h-effect.effect-1 .h3 { '. $h_effect1['title'] . ' }' : '';

		echo isset($h_effect1['description']) ? 
		$prefix.' .h-effect.effect-1 p { '. $h_effect1['description'] . ' }' : '';

		echo isset($h_effect1['img_opacity']) ? 
		$prefix.' .h-effect.effect-1 img { '. $h_effect1['img_opacity'] . ' }' : '';

		echo isset($h_effect1['img_scale']) ? 
		$prefix.' .h-effect.effect-1 img { transform: scale('. $h_effect1['img_scale'] . '); -webkit-transform: scale('. $h_effect1['img_scale'] . '); }' : '';

		echo isset($h_effect1['img_scale_h']) ? 
		$prefix.' .h-effect.effect-1:hover img { transform: scale('. $h_effect1['img_scale_h'] . '); -webkit-transform: scale('. $h_effect1['img_scale_h'] . '); }' : '';
	}

	/* Effect 2
	------------------------*/
	if (isset($arr['h_effect2'])) {
		$h_effect2 = $arr['h_effect2'];

		echo isset($h_effect2['background']) ? 
		$prefix.' .effect-2.h-effect { '. $h_effect2['background'] . ' }' : '';

		echo isset($h_effect2['overlay']) ? 
		$prefix.' .h-effect.effect-2 figcaption::before { '. $h_effect2['overlay'] . ' }' : '';

		echo isset($h_effect2['title']) ? 
		$prefix.' .h-effect.effect-2 .h3 { '. $h_effect2['title'] . ' }' : '';

		echo isset($h_effect2['description']) ? 
		$prefix.' .h-effect.effect-2 p { '. $h_effect2['description'] . ' }' : '';

		echo isset($h_effect2['img_opacity']) ? 
		$prefix.' .h-effect.effect-2 img { '. $h_effect2['img_opacity'] . ' }' : '';

		echo isset($h_effect2['img_scale']) ? 
		$prefix.' .h-effect.effect-2 img { transform: scale('. $h_effect2['img_scale'] . '); -webkit-transform: scale('. $h_effect2['img_scale'] . '); }' : '';

		echo isset($h_effect2['img_scale_h']) ? 
		$prefix.' .h-effect.effect-2:hover img { transform: scale('. $h_effect2['img_scale_h'] . '); -webkit-transform: scale('. $h_effect2['img_scale_h'] . '); }' : '';
	}

	/* Effect 3
	------------------------*/
	if (isset($arr['h_effect3'])) {
		$h_effect3 = $arr['h_effect3'];

		echo isset($h_effect3['background']) ? 
		$prefix.' .effect-3.h-effect { '. $h_effect3['background'] . ' }' : '';

		echo isset($h_effect3['overlay']) ? 
		$prefix.' .h-effect.effect-3:hover figcaption { '. $h_effect3['overlay'] . ' }' : '';

		echo isset($h_effect3['bdrcolor']) ? 
		$prefix.' .h-effect.effect-3 figcaption::before,'.
		$prefix.' .h-effect.effect-3 figcaption::after { '. $h_effect3['bdrcolor'] . ' }' : '';

		echo isset($h_effect3['title']) ? 
		$prefix.' .h-effect.effect-3 .h3 { '. $h_effect3['title'] . ' }' : '';

		echo isset($h_effect3['description']) ? 
		$prefix.' .h-effect.effect-3 p { '. $h_effect3['description'] . ' }' : '';

		echo isset($h_effect3['img_opacity']) ? 
		$prefix.' .h-effect.effect-3 img { '. $h_effect3['img_opacity'] . ' }' : '';

		echo isset($h_effect3['img_scale']) ? 
		$prefix.' .h-effect.effect-3 img { transform: scale('. $h_effect3['img_scale'] . '); -webkit-transform: scale('. $h_effect3['img_scale'] . '); }' : '';

		echo isset($h_effect3['img_scale_h']) ? 
		$prefix.' .h-effect.effect-3:hover img { transform: scale('. $h_effect3['img_scale_h'] . '); -webkit-transform: scale('. $h_effect3['img_scale_h'] . '); }' : '';
	}

	/* Effect 4
	------------------------*/
	if (isset($arr['h_effect4'])) {
		$h_effect4 = $arr['h_effect4'];

		echo isset($h_effect4['background']) ? 
		$prefix.' .effect-4.h-effect { '. $h_effect4['background'] . ' }' : '';

		echo isset($h_effect4['overlay']) ? 
		$prefix.' .h-effect.effect-4 figcaption { '. $h_effect4['overlay'] . ' }' : '';

		echo isset($h_effect4['title']) ? 
		$prefix.' .h-effect.effect-4 .h4 { '. $h_effect4['title'] . ' }' : '';

		echo isset($h_effect4['description']) ? 
		$prefix.' .h-effect.effect-4 p { '. $h_effect4['description'] . ' }' : '';

		echo isset($h_effect4['img_opacity']) ? 
		$prefix.' .h-effect.effect-4 img { '. $h_effect4['img_opacity'] . ' }' : '';

		echo isset($h_effect4['img_scale']) ? 
		$prefix.' .h-effect.effect-4 img { transform: scale('. $h_effect4['img_scale'] . '); -webkit-transform: scale('. $h_effect4['img_scale'] . '); }' : '';

		echo isset($h_effect4['img_scale_h']) ? 
		$prefix.' .h-effect.effect-4:hover img { transform: scale('. $h_effect4['img_scale_h'] . '); -webkit-transform: scale('. $h_effect4['img_scale_h'] . '); }' : '';
	}

	/* Effect 5
	------------------------*/
	if (isset($arr['h_effect5'])) {
		$h_effect5 = $arr['h_effect5'];

		echo isset($h_effect5['background']) ? 
		$prefix.' .effect-5.h-effect { '. $h_effect5['background'] . ' }' : '';

		echo isset($h_effect5['overlay']) ? 
		$prefix.' .h-effect.effect-5:hover figcaption { '. $h_effect5['overlay'] . ' }' : '';

		echo isset($h_effect5['bdrcolor']) ? 
		$prefix.' .h-effect.effect-5 figcaption::before,'.
		$prefix.' .h-effect.effect-5 figcaption::after { '. $h_effect5['bdrcolor'] . ' }' : '';

		echo isset($h_effect5['title']) ? 
		$prefix.' .h-effect.effect-5 .h3 { '. $h_effect5['title'] . ' }' : '';

		echo isset($h_effect5['description']) ? 
		$prefix.' .h-effect.effect-5 p { '. $h_effect5['description'] . ' }' : '';

		echo isset($h_effect5['img_opacity']) ? 
		$prefix.' .h-effect.effect-5 img { '. $h_effect5['img_opacity'] . ' }' : '';

		echo isset($h_effect5['img_scale']) ? 
		$prefix.' .h-effect.effect-5 img { transform: scale('. $h_effect5['img_scale'] . '); -webkit-transform: scale('. $h_effect5['img_scale'] . '); }' : '';

		echo isset($h_effect5['img_scale_h']) ? 
		$prefix.' .h-effect.effect-5:hover img { transform: scale('. $h_effect5['img_scale_h'] . '); -webkit-transform: scale('. $h_effect5['img_scale_h'] . '); }' : '';
	}

	/* Effect 6
	------------------------*/
	if (isset($arr['h_effect6'])) {
		$h_effect6 = $arr['h_effect6'];

		echo isset($h_effect6['background']) ? 
		$prefix.' .effect-6.h-effect { '. $h_effect6['background'] . ' }' : '';

		echo isset($h_effect6['overlay']) ? 
		$prefix.' .h-effect.effect-6:hover figcaption { '. $h_effect6['overlay'] . ' }' : '';

		echo isset($h_effect6['bdrcolor']) ? 
		$prefix.' .h-effect.effect-6 figcaption::before { '. $h_effect6['bdrcolor'] . ' }' : '';

		echo isset($h_effect6['title']) ? 
		$prefix.' .h-effect.effect-6 .h3 { '. $h_effect6['title'] . ' }' : '';

		echo isset($h_effect6['description']) ? 
		$prefix.' .h-effect.effect-6 p { '. $h_effect6['description'] . ' }' : '';

		echo isset($h_effect6['img_opacity']) ? 
		$prefix.' .h-effect.effect-6 img { '. $h_effect6['img_opacity'] . ' }' : '';

		echo isset($h_effect6['img_scale']) ? 
		$prefix.' .h-effect.effect-6 img { transform: scale('. $h_effect6['img_scale'] . '); -webkit-transform: scale('. $h_effect6['img_scale'] . '); }' : '';

		echo isset($h_effect6['img_scale_h']) ? 
		$prefix.' .h-effect.effect-6:hover img { transform: scale('. $h_effect6['img_scale_h'] . '); -webkit-transform: scale('. $h_effect6['img_scale_h'] . '); }' : '';
	}
	
}
?>