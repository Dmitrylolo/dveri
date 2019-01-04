<?php
if (isset($contentblocks)) {
	foreach ($contentblocks as $key => $value) {
		
		$keyparts = explode('.', $key);
		$contentblocks_cls = '.contentblocks-'.$keyparts[1];

		/* Large screens
		------------------------*/
		if (isset($value['d'])) {
			contentblocks($value['d'], $contentblocks_cls);
		}
		
		/* Tablet and Mobile
		------------------------*/
		if ($settings['responsive_status']) {
			echo '@media only screen and (min-width: 768px) and (max-width: 979px) {';
			if (isset($value['t'])) {
				contentblocks($value['t'], $contentblocks_cls);
			}
			echo '}';

			echo '@media only screen and (min-width: 200px) and (max-width: 767px) {';
			if (isset($value['m'])) {
				contentblocks($value['m'], $contentblocks_cls);
			}
			echo '}';
		}


		/* Dots
		------------------------*/
		echo isset($value['dots']['wrp']) ? 
		$contentblocks_cls.' .owl-dots { '. $value['dots']['wrp'] . ' }' : '';

		echo isset($value['dots']['normal']) ? 
		$contentblocks_cls.' .owl-dots .owl-dot span { '. $value['dots']['normal'] . ' }' : '';

		echo isset($value['dots']['active']) ? 
		$contentblocks_cls.' .owl-dots .owl-dot.active span { '. $value['dots']['active'] . ' }' : '';

		/* Arrows
		------------------------*/
		echo isset($value['arrows']['wrp']) ? 
		$contentblocks_cls.' .owl-nav { '. $value['arrows']['wrp'] . ' }' : '';

		echo isset($value['arrows']['arrow_line']) ? 
		$contentblocks_cls.' .ctrl-b .owl-nav:after { '. $value['arrows']['arrow_line'] . ' }' : '';

		echo isset($value['arrows']['arrow']) ? 
		$contentblocks_cls.' .owl-nav > div { '. $value['arrows']['arrow'] . ' }' : '';

		echo isset($value['arrows']['arrow_h']) ? 
		$contentblocks_cls.' .owl-nav > div:hover { '. $value['arrows']['arrow_h'] . ' }' : '';
		
	}
}
