<?php
if (isset($basicbanners)) {
	foreach ($basicbanners as $key => $value) {
		
		$keyparts = explode('.', $key);
		$basicbannerscls = '.basicbanners-'.$keyparts[1];

		/* Structure
		------------------------*/
		echo isset($value['container']) ? 
		$basicbannerscls.' { '. $value['container'] . ' }' : '';

		echo isset($value['wrapper']) ? 
		$basicbannerscls.' .mod-wrp { '. $value['wrapper'] . ' }' : '';

		echo isset($value['mod_hd']) ? 
		$basicbannerscls.' .mod-hd { '. $value['mod_hd'] . ' }' : '';

		echo isset($value['mod_customhtml']) ? 
		$basicbannerscls.' .mod-customhtml { '. $value['mod_customhtml'] . ' }' : '';

		echo isset($value['content_wrp']) ? 
		$basicbannerscls.' .mod-content { '. $value['content_wrp'] . ' }' : '';

		echo isset($value['items']) ? 
		$basicbannerscls.' .h-effect, '.
		$basicbannerscls.' .bnr-img { '. $value['items'] . ' }' : '';

		/* No effects
		------------------------*/
		echo isset($no_effect['block']) ? 
		$basicbannerscls.' .bnr-img { '. $no_effect['block'] . ' }' : '';

		echo isset($no_effect['block_h']) ? 
		$basicbannerscls.' .bnr-img:hover { '. $no_effect['block_h'] . ' }' : '';

		echo isset($no_effect['img']) ? 
		$basicbannerscls.' .bnr-img img { '. $no_effect['img'] . ' }' : '';
		
		echo isset($no_effect['img_h']) ? 
		$basicbannerscls.' .bnr-img:hover img { '. $no_effect['img_h'] . ' }' : '';

		/* Hover effect 1
		------------------------*/
		echo isset($value['h_effect1']['background']) ? 
		$basicbannerscls.' .effect-1.h-effect { '. $value['h_effect1']['background'] . ' }' : '';

		echo isset($value['h_effect1']['overlay']) ? 
		$basicbannerscls.' .h-effect.effect-1:hover figcaption { '. $value['h_effect1']['overlay'] . ' }' : '';

		echo isset($value['h_effect1']['title']) ? 
		$basicbannerscls.' .h-effect.effect-1 .h3 { '. $value['h_effect1']['title'] . ' }' : '';

		echo isset($value['h_effect1']['description']) ? 
		$basicbannerscls.' .h-effect.effect-1 p { '. $value['h_effect1']['description'] . ' }' : '';

		echo isset($value['h_effect1']['img_opacity']) ? 
		$basicbannerscls.' .h-effect.effect-1 img { '. $value['h_effect1']['img_opacity'] . ' }' : '';

		echo isset($value['h_effect1']['img_scale']) ? 
		$basicbannerscls.' .h-effect.effect-1 img { transform: scale('. $value['h_effect1']['img_scale'] . '); 
		-webkit-transform: scale('. $value['h_effect1']['img_scale'] . '); }' : '';

		echo isset($value['h_effect1']['img_scale_h']) ? 
		$basicbannerscls.' .h-effect.effect-1:hover img { transform: scale('. $value['h_effect1']['img_scale_h'] . '); 
		-webkit-transform: scale('. $value['h_effect1']['img_scale_h'] . '); }' : '';

		// Normal
		echo isset($value['h_effect1']['normal']['background']) ? 
		$basicbannerscls.' .effect-1.h-effect { '. $value['h_effect1']['normal']['background'] . ' }' : '';

		echo isset($value['h_effect1']['normal']['overlay']) ? 
		$basicbannerscls.' .h-effect.effect-1 figcaption { '. $value['h_effect1']['normal']['overlay'] . ' }' : '';

		echo isset($value['h_effect1']['normal']['title']) ? 
		$basicbannerscls.' .h-effect.effect-1 .h3 { '. $value['h_effect1']['normal']['title'] . ' }' : '';

		echo isset($value['h_effect1']['normal']['description']) ? 
		$basicbannerscls.' .h-effect.effect-1 p { '. $value['h_effect1']['normal']['description'] . ' }' : '';

		echo isset($value['h_effect1']['normal']['img_opacity']) ? 
		$basicbannerscls.' .h-effect.effect-1 img { '. $value['h_effect1']['normal']['img_opacity'] . ' }' : '';

		echo isset($value['h_effect1']['normal']['scale']) ? 
		$basicbannerscls.' .h-effect.effect-1 img { transform: scale('. $value['h_effect1']['normal']['scale'] . '); 
		-webkit-transform: scale('. $value['h_effect1']['normal']['scale'] . '); }' : '';

		// Hover
		echo isset($value['h_effect1']['hover']['background']) ? 
		$basicbannerscls.' .effect-1.h-effect:hover { '. $value['h_effect1']['hover']['background'] . ' }' : '';

		echo isset($value['h_effect1']['hover']['overlay']) ? 
		$basicbannerscls.' .h-effect.effect-1:hover figcaption { '. $value['h_effect1']['hover']['overlay'] . ' }' : '';

		echo isset($value['h_effect1']['hover']['title']) ? 
		$basicbannerscls.' .h-effect.effect-1:hover .h3 { '. $value['h_effect1']['hover']['title'] . ' }' : '';

		echo isset($value['h_effect1']['hover']['description']) ? 
		$basicbannerscls.' .h-effect.effect-1:hover p { '. $value['h_effect1']['hover']['description'] . ' }' : '';

		echo isset($value['h_effect1']['hover']['img_opacity']) ? 
		$basicbannerscls.' .h-effect.effect-1:hover img { '. $value['h_effect1']['hover']['img_opacity'] . ' }' : '';

		echo isset($value['h_effect1']['hover']['scale']) ? 
		$basicbannerscls.' .h-effect.effect-1:hover img { transform: scale('. $value['h_effect1']['hover']['scale'] . '); 
		-webkit-transform: scale('. $value['h_effect1']['hover']['scale'] . '); }' : '';


		/* Hover effect 2
		------------------------*/
		echo isset($value['h_effect2']['background']) ? 
		$basicbannerscls.' .effect-2.h-effect { '. $value['h_effect2']['background'] . ' }' : '';

		echo isset($value['h_effect2']['overlay']) ? 
		$basicbannerscls.' .h-effect.effect-2 figcaption::before { '. $value['h_effect2']['overlay'] . ' }' : '';

		echo isset($value['h_effect2']['title']) ? 
		$basicbannerscls.' .h-effect.effect-2 .h3 { '. $value['h_effect2']['title'] . ' }' : '';

		echo isset($value['h_effect2']['description']) ? 
		$basicbannerscls.' .h-effect.effect-2 p { '. $value['h_effect2']['description'] . ' }' : '';

		echo isset($value['h_effect2']['img_opacity']) ? 
		$basicbannerscls.' .h-effect.effect-2 img { '. $value['h_effect2']['img_opacity'] . ' }' : '';

		echo isset($value['h_effect2']['img_scale']) ? 
		$basicbannerscls.' .h-effect.effect-2 img { transform: scale('. $value['h_effect2']['img_scale'] . '); 
		-webkit-transform: scale('. $value['h_effect2']['img_scale'] . '); }' : '';

		echo isset($value['h_effect2']['img_scale_h']) ? 
		$basicbannerscls.' .h-effect.effect-2:hover img { transform: scale('. $value['h_effect2']['img_scale_h'] . '); 
		-webkit-transform: scale('. $value['h_effect2']['img_scale_h'] . '); }' : '';

		// Normal
		echo isset($value['h_effect2']['normal']['background']) ? 
		$basicbannerscls.' .effect-2.h-effect { '. $value['h_effect2']['normal']['background'] . ' }' : '';

		echo isset($value['h_effect2']['normal']['overlay']) ? 
		$basicbannerscls.' .h-effect.effect-2 figcaption::before { '. $value['h_effect2']['normal']['overlay'] . ' }' : '';

		echo isset($value['h_effect2']['normal']['title']) ? 
		$basicbannerscls.' .h-effect.effect-2 .h3 { '. $value['h_effect2']['normal']['title'] . ' }' : '';

		echo isset($value['h_effect2']['normal']['description']) ? 
		$basicbannerscls.' .h-effect.effect-2 p { '. $value['h_effect2']['normal']['description'] . ' }' : '';

		echo isset($value['h_effect2']['normal']['img_opacity']) ? 
		$basicbannerscls.' .h-effect.effect-2 img { '. $value['h_effect2']['normal']['img_opacity'] . ' }' : '';

		echo isset($value['h_effect2']['normal']['scale']) ? 
		$basicbannerscls.' .h-effect.effect-2 img { transform: scale('. $value['h_effect2']['normal']['scale'] . '); 
		-webkit-transform: scale('. $value['h_effect2']['normal']['scale'] . '); }' : '';

		// Hover
		echo isset($value['h_effect2']['hover']['background']) ? 
		$basicbannerscls.' .h-effect.effect-2:hover { '. $value['h_effect2']['hover']['background'] . ' }' : '';

		echo isset($value['h_effect2']['hover']['overlay']) ? 
		$basicbannerscls.' .h-effect.effect-2:hover figcaption::before { '. $value['h_effect2']['hover']['overlay'] . ' }' : '';

		echo isset($value['h_effect2']['hover']['title']) ? 
		$basicbannerscls.' .h-effect.effect-2:hover .h3 { '. $value['h_effect2']['hover']['title'] . ' }' : '';

		echo isset($value['h_effect2']['hover']['description']) ? 
		$basicbannerscls.' .h-effect.effect-2:hover p { '. $value['h_effect2']['hover']['description'] . ' }' : '';

		echo isset($value['h_effect2']['hover']['img_opacity']) ? 
		$basicbannerscls.' .h-effect.effect-2:hover img { '. $value['h_effect2']['hover']['img_opacity'] . ' }' : '';

		echo isset($value['h_effect2']['hover']['scale']) ? 
		$basicbannerscls.' .h-effect.effect-2:hover img { transform: scale('. $value['h_effect2']['hover']['scale'] . '); 
		-webkit-transform: scale('. $value['h_effect2']['hover']['scale'] . '); }' : '';


		/* Hover effect 3
		------------------------*/
		echo isset($value['h_effect3']['background']) ? 
		$basicbannerscls.' .effect-3.h-effect { '. $value['h_effect3']['background'] . ' }' : '';

		echo isset($value['h_effect3']['overlay']) ? 
		$basicbannerscls.' .h-effect.effect-3:hover figcaption { '. $value['h_effect3']['overlay'] . ' }' : '';

		echo isset($value['h_effect3']['bdrcolor']) ? 
		$basicbannerscls.' .h-effect.effect-3 figcaption::before,'.
		$basicbannerscls.' .h-effect.effect-3 figcaption::after { '. $value['h_effect3']['bdrcolor'] . ' }' : '';

		echo isset($value['h_effect3']['title']) ? 
		$basicbannerscls.' .h-effect.effect-3 .h3 { '. $value['h_effect3']['title'] . ' }' : '';

		echo isset($value['h_effect3']['description']) ? 
		$basicbannerscls.' .h-effect.effect-3 p { '. $value['h_effect3']['description'] . ' }' : '';

		echo isset($value['h_effect3']['img_opacity']) ? 
		$basicbannerscls.' .h-effect.effect-3 img { '. $value['h_effect3']['img_opacity'] . ' }' : '';

		echo isset($value['h_effect3']['img_scale']) ? 
		$basicbannerscls.' .h-effect.effect-3 img { transform: scale('. $value['h_effect3']['img_scale'] . '); 
		-webkit-transform: scale('. $value['h_effect3']['img_scale'] . '); }' : '';

		echo isset($value['h_effect3']['img_scale_h']) ? 
		$basicbannerscls.' .h-effect.effect-3:hover img { transform: scale('. $value['h_effect3']['img_scale_h'] . '); 
		-webkit-transform: scale('. $value['h_effect3']['img_scale_h'] . '); }' : '';

		// Normal
		echo isset($value['h_effect3']['normal']['background']) ? 
		$basicbannerscls.' .effect-3.h-effect { '. $value['h_effect3']['normal']['background'] . ' }' : '';

		echo isset($value['h_effect3']['normal']['overlay']) ? 
		$basicbannerscls.' .h-effect.effect-3 figcaption { '. $value['h_effect3']['normal']['overlay'] . ' }' : '';

		echo isset($value['h_effect3']['normal']['title']) ? 
		$basicbannerscls.' .h-effect.effect-3 .h3 { '. $value['h_effect3']['normal']['title'] . ' }' : '';

		echo isset($value['h_effect3']['normal']['description']) ? 
		$basicbannerscls.' .h-effect.effect-3 p { '. $value['h_effect3']['normal']['description'] . ' }' : '';

		echo isset($value['h_effect3']['normal']['img_opacity']) ? 
		$basicbannerscls.' .h-effect.effect-3 img { '. $value['h_effect3']['normal']['img_opacity'] . ' }' : '';

		echo isset($value['h_effect3']['normal']['scale']) ? 
		$basicbannerscls.' .h-effect.effect-3 img { transform: scale('. $value['h_effect3']['normal']['scale'] . '); 
		-webkit-transform: scale('. $value['h_effect3']['normal']['scale'] . '); }' : '';

		// Hover
		echo isset($value['h_effect3']['hover']['background']) ? 
		$basicbannerscls.' .h-effect.effect-3:hover { '. $value['h_effect3']['hover']['background'] . ' }' : '';

		echo isset($value['h_effect3']['hover']['bdrcolor']) ? 
		$basicbannerscls.' .h-effect.effect-3:hover figcaption::before,'.
		$basicbannerscls.' .h-effect.effect-3:hover figcaption::after { '. $value['h_effect3']['hover']['bdrcolor'] . ' }' : '';

		echo isset($value['h_effect3']['hover']['overlay']) ? 
		$basicbannerscls.' .h-effect.effect-3:hover figcaption { '. $value['h_effect3']['hover']['overlay'] . ' }' : '';

		echo isset($value['h_effect3']['hover']['title']) ? 
		$basicbannerscls.' .h-effect.effect-3:hover .h3 { '. $value['h_effect3']['hover']['title'] . ' }' : '';

		echo isset($value['h_effect3']['hover']['description']) ? 
		$basicbannerscls.' .h-effect.effect-3:hover p { '. $value['h_effect3']['hover']['description'] . ' }' : '';

		echo isset($value['h_effect3']['hover']['img_opacity']) ? 
		$basicbannerscls.' .h-effect.effect-3:hover img { '. $value['h_effect3']['hover']['img_opacity'] . ' }' : '';

		echo isset($value['h_effect3']['hover']['scale']) ? 
		$basicbannerscls.' .h-effect.effect-3:hover img { transform: scale('. $value['h_effect3']['hover']['scale'] . '); 
		-webkit-transform: scale('. $value['h_effect3']['hover']['scale'] . '); }' : '';

		

		/* Hover effect 4
		------------------------*/
		echo isset($value['h_effect4']['background']) ? 
		$basicbannerscls.' .effect-4.h-effect { '. $value['h_effect4']['background'] . ' }' : '';

		echo isset($value['h_effect4']['overlay']) ? 
		$basicbannerscls.' .h-effect.effect-4 figcaption { '. $value['h_effect4']['overlay'] . ' }' : '';

		echo isset($value['h_effect4']['title']) ? 
		$basicbannerscls.' .h-effect.effect-4 .h4 { '. $value['h_effect4']['title'] . ' }' : '';

		echo isset($value['h_effect4']['description']) ? 
		$basicbannerscls.' .h-effect.effect-4 p { '. $value['h_effect4']['description'] . ' }' : '';

		echo isset($value['h_effect4']['img_opacity']) ? 
		$basicbannerscls.' .h-effect.effect-4 img { '. $value['h_effect4']['img_opacity'] . ' }' : '';

		echo isset($value['h_effect4']['img_scale']) ? 
		$basicbannerscls.' .h-effect.effect-4 img { transform: scale('. $value['h_effect4']['img_scale'] . '); 
		-webkit-transform: scale('. $value['h_effect4']['img_scale'] . '); }' : '';

		echo isset($value['h_effect4']['img_scale_h']) ? 
		$basicbannerscls.' .h-effect.effect-4:hover img { transform: scale('. $value['h_effect4']['img_scale_h'] . '); 
		-webkit-transform: scale('. $value['h_effect4']['img_scale_h'] . '); }' : '';

		// Normal
		echo isset($value['h_effect4']['normal']['background']) ? 
		$basicbannerscls.' .effect-4.h-effect { '. $value['h_effect4']['normal']['background'] . ' }' : '';

		echo isset($value['h_effect4']['normal']['overlay']) ? 
		$basicbannerscls.' .h-effect.effect-4 figcaption { '. $value['h_effect4']['normal']['overlay'] . ' }' : '';

		echo isset($value['h_effect4']['normal']['title']) ? 
		$basicbannerscls.' .h-effect.effect-4 .h4 { '. $value['h_effect4']['normal']['title'] . ' }' : '';

		echo isset($value['h_effect4']['normal']['description']) ? 
		$basicbannerscls.' .h-effect.effect-4 p { '. $value['h_effect4']['normal']['description'] . ' }' : '';

		echo isset($value['h_effect4']['normal']['img_opacity']) ? 
		$basicbannerscls.' .h-effect.effect-4 img { '. $value['h_effect4']['normal']['img_opacity'] . ' }' : '';

		echo isset($value['h_effect4']['normal']['scale']) ? 
		$basicbannerscls.' .h-effect.effect-4 img { transform: scale('. $value['h_effect4']['normal']['scale'] . '); 
		-webkit-transform: scale('. $value['h_effect4']['normal']['scale'] . '); }' : '';

		// Hover
		echo isset($value['h_effect4']['hover']['background']) ? 
		$basicbannerscls.' .h-effect.effect-4:hover { '. $value['h_effect4']['hover']['background'] . ' }' : '';

		echo isset($value['h_effect4']['hover']['overlay']) ? 
		$basicbannerscls.' .h-effect.effect-4:hover figcaption { '. $value['h_effect4']['hover']['overlay'] . ' }' : '';

		echo isset($value['h_effect4']['hover']['title']) ? 
		$basicbannerscls.' .h-effect.effect-4:hover .h4 { '. $value['h_effect4']['hover']['title'] . ' }' : '';

		echo isset($value['h_effect4']['hover']['description']) ? 
		$basicbannerscls.' .h-effect.effect-4:hover p { '. $value['h_effect4']['hover']['description'] . ' }' : '';

		echo isset($value['h_effect4']['hover']['img_opacity']) ? 
		$basicbannerscls.' .h-effect.effect-4:hover img { '. $value['h_effect4']['hover']['img_opacity'] . ' }' : '';

		echo isset($value['h_effect4']['hover']['scale']) ? 
		$basicbannerscls.' .h-effect.effect-4:hover img { transform: scale('. $value['h_effect4']['hover']['scale'] . '); 
		-webkit-transform: scale('. $value['h_effect4']['hover']['scale'] . '); }' : '';


		/* Hover effect 5
		------------------------*/
		echo isset($value['h_effect5']['background']) ? 
		$basicbannerscls.' .effect-5.h-effect { '. $value['h_effect5']['background'] . ' }' : '';

		echo isset($value['h_effect5']['overlay']) ? 
		$basicbannerscls.' .h-effect.effect-5:hover figcaption { '. $value['h_effect5']['overlay'] . ' }' : '';

		echo isset($value['h_effect5']['bdrcolor']) ? 
		$basicbannerscls.' .h-effect.effect-5 figcaption::before,'.
		$basicbannerscls.' .h-effect.effect-5 figcaption::after { '. $value['h_effect5']['bdrcolor'] . ' }' : '';

		echo isset($value['h_effect5']['title']) ? 
		$basicbannerscls.' .h-effect.effect-5 .h3 { '. $value['h_effect5']['title'] . ' }' : '';

		echo isset($value['h_effect5']['description']) ? 
		$basicbannerscls.' .h-effect.effect-5 p { '. $value['h_effect5']['description'] . ' }' : '';

		echo isset($value['h_effect5']['img_opacity']) ? 
		$basicbannerscls.' .h-effect.effect-5 img { '. $value['h_effect5']['img_opacity'] . ' }' : '';

		echo isset($value['h_effect5']['img_scale']) ? 
		$basicbannerscls.' .h-effect.effect-5 img { transform: scale('. $value['h_effect5']['img_scale'] . '); 
		-webkit-transform: scale('. $value['h_effect5']['img_scale'] . '); }' : '';

		echo isset($value['h_effect5']['img_scale_h']) ? 
		$basicbannerscls.' .h-effect.effect-5:hover img { transform: scale('. $value['h_effect5']['img_scale_h'] . '); 
		-webkit-transform: scale('. $value['h_effect5']['img_scale_h'] . '); }' : '';

		// Normal
		echo isset($value['h_effect5']['normal']['background']) ? 
		$basicbannerscls.' .h-effect.effect-5 { '. $value['h_effect5']['normal']['background'] . ' }' : '';

		echo isset($value['h_effect5']['normal']['overlay']) ? 
		$basicbannerscls.' .h-effect.effect-5 figcaption { '. $value['h_effect5']['normal']['overlay'] . ' }' : '';

		echo isset($value['h_effect5']['normal']['bdrcolor']) ? 
		$basicbannerscls.' .h-effect.effect-5 figcaption::before,'.
		$basicbannerscls.' .h-effect.effect-5 figcaption::after { '. $value['h_effect5']['normal']['bdrcolor'] . ' }' : '';

		echo isset($value['h_effect5']['normal']['title']) ? 
		$basicbannerscls.' .h-effect.effect-5 .h3 { '. $value['h_effect5']['normal']['title'] . ' }' : '';

		echo isset($value['h_effect5']['normal']['description']) ? 
		$basicbannerscls.' .h-effect.effect-5 p { '. $value['h_effect5']['normal']['description'] . ' }' : '';

		echo isset($value['h_effect5']['normal']['img_opacity']) ? 
		$basicbannerscls.' .h-effect.effect-5 img { '. $value['h_effect5']['normal']['img_opacity'] . ' }' : '';

		echo isset($value['h_effect5']['normal']['scale']) ? 
		$basicbannerscls.' .h-effect.effect-5 img { transform: scale('. $value['h_effect5']['normal']['scale'] . '); 
		-webkit-transform: scale('. $value['h_effect5']['normal']['scale'] . '); }' : '';

		// Hover
		echo isset($value['h_effect5']['hover']['background']) ? 
		$basicbannerscls.' .h-effect.effect-5:hover { '. $value['h_effect5']['hover']['background'] . ' }' : '';

		echo isset($value['h_effect5']['hover']['overlay']) ? 
		$basicbannerscls.' .h-effect.effect-5:hover figcaption { '. $value['h_effect5']['hover']['overlay'] . ' }' : '';

		echo isset($value['h_effect5']['hover']['bdrcolor']) ? 
		$basicbannerscls.' .h-effect.effect-5:hover figcaption::before,'.
		$basicbannerscls.' .h-effect.effect-5:hover figcaption::after { '. $value['h_effect5']['hover']['bdrcolor'] . ' }' : '';

		echo isset($value['h_effect5']['hover']['title']) ? 
		$basicbannerscls.' .h-effect.effect-5:hover .h3 { '. $value['h_effect5']['hover']['title'] . ' }' : '';

		echo isset($value['h_effect5']['hover']['description']) ? 
		$basicbannerscls.' .h-effect.effect-5:hover p { '. $value['h_effect5']['hover']['description'] . ' }' : '';

		echo isset($value['h_effect5']['hover']['img_opacity']) ? 
		$basicbannerscls.' .h-effect.effect-5:hover img { '. $value['h_effect5']['hover']['img_opacity'] . ' }' : '';

		echo isset($value['h_effect5']['hover']['scale']) ? 
		$basicbannerscls.' .h-effect.effect-5:hover img { transform: scale('. $value['h_effect5']['hover']['scale'] . '); 
		-webkit-transform: scale('. $value['h_effect5']['hover']['scale'] . '); }' : '';


		/* Hover effect 6
		------------------------*/
		echo isset($value['h_effect6']['background']) ? 
		$basicbannerscls.' .effect-6.h-effect { '. $value['h_effect6']['background'] . ' }' : '';

		echo isset($value['h_effect6']['overlay']) ? 
		$basicbannerscls.' .h-effect.effect-6:hover figcaption { '. $value['h_effect6']['overlay'] . ' }' : '';

		echo isset($value['h_effect6']['bdrcolor']) ? 
		$basicbannerscls.' .h-effect.effect-6 figcaption::before { '. $value['h_effect6']['bdrcolor'] . ' }' : '';

		echo isset($value['h_effect6']['title']) ? 
		$basicbannerscls.' .h-effect.effect-6 .h3 { '. $value['h_effect6']['title'] . ' }' : '';

		echo isset($value['h_effect6']['description']) ? 
		$basicbannerscls.' .h-effect.effect-6 p { '. $value['h_effect6']['description'] . ' }' : '';

		echo isset($value['h_effect6']['img_opacity']) ? 
		$basicbannerscls.' .h-effect.effect-6 img { '. $value['h_effect6']['img_opacity'] . ' }' : '';

		echo isset($value['h_effect6']['img_scale']) ? 
		$basicbannerscls.' .h-effect.effect-6 img { transform: scale('. $value['h_effect6']['img_scale'] . '); 
		-webkit-transform: scale('. $value['h_effect6']['img_scale'] . '); }' : '';

		echo isset($value['h_effect6']['img_scale_h']) ? 
		$basicbannerscls.' .h-effect.effect-6:hover img { transform: scale('. $value['h_effect6']['img_scale_h'] . '); 
		-webkit-transform: scale('. $value['h_effect6']['img_scale_h'] . '); }' : '';

		// Normal
		echo isset($value['h_effect6']['normal']['background']) ? 
		$basicbannerscls.' .h-effect.effect-6 { '. $value['h_effect6']['normal']['background'] . ' }' : '';

		echo isset($value['h_effect6']['normal']['overlay']) ? 
		$basicbannerscls.' .h-effect.effect-6 figcaption { '. $value['h_effect6']['normal']['overlay'] . ' }' : '';

		echo isset($value['h_effect6']['normal']['bdrcolor']) ? 
		$basicbannerscls.' .h-effect.effect-6 figcaption::before { '. $value['h_effect6']['normal']['bdrcolor'] . ' }' : '';

		echo isset($value['h_effect6']['normal']['title']) ? 
		$basicbannerscls.' .h-effect.effect-6 .h3 { '. $value['h_effect6']['normal']['title'] . ' }' : '';

		echo isset($value['h_effect6']['normal']['description']) ? 
		$basicbannerscls.' .h-effect.effect-6 p { '. $value['h_effect6']['normal']['description'] . ' }' : '';

		echo isset($value['h_effect6']['normal']['img_opacity']) ? 
		$basicbannerscls.' .h-effect.effect-6 img { '. $value['h_effect6']['normal']['img_opacity'] . ' }' : '';

		echo isset($value['h_effect6']['normal']['scale']) ? 
		$basicbannerscls.' .h-effect.effect-6 img { transform: scale('. $value['h_effect6']['normal']['scale'] . '); 
		-webkit-transform: scale('. $value['h_effect6']['normal']['scale'] . '); }' : '';

		// Hover
		echo isset($value['h_effect6']['hover']['background']) ? 
		$basicbannerscls.' .h-effect.effect-6:hover { '. $value['h_effect6']['hover']['background'] . ' }' : '';

		echo isset($value['h_effect6']['hover']['overlay']) ? 
		$basicbannerscls.' .h-effect.effect-6:hover figcaption { '. $value['h_effect6']['hover']['overlay'] . ' }' : '';

		echo isset($value['h_effect6']['hover']['bdrcolor']) ? 
		$basicbannerscls.' .h-effect.effect-6:hover figcaption::before { '. $value['h_effect6']['hover']['bdrcolor'] . ' }' : '';

		echo isset($value['h_effect6']['hover']['title']) ? 
		$basicbannerscls.' .h-effect.effect-6:hover .h3 { '. $value['h_effect6']['hover']['title'] . ' }' : '';

		echo isset($value['h_effect6']['hover']['description']) ? 
		$basicbannerscls.' .h-effect.effect-6:hover p { '. $value['h_effect6']['hover']['description'] . ' }' : '';

		echo isset($value['h_effect6']['hover']['img_opacity']) ? 
		$basicbannerscls.' .h-effect.effect-6:hover img { '. $value['h_effect6']['hover']['img_opacity'] . ' }' : '';

		echo isset($value['h_effect6']['hover']['scale']) ? 
		$basicbannerscls.' .h-effect.effect-6:hover img { transform: scale('. $value['h_effect6']['hover']['scale'] . '); 
		-webkit-transform: scale('. $value['h_effect6']['hover']['scale'] . '); }' : '';

	}
}
