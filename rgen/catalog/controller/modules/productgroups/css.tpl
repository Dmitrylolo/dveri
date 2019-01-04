<?php
if (isset($productgroups)) {
	foreach ($productgroups as $key => $value) {
		
		$keyparts = explode('.', $key);
		$productgroupscls = '.productgroups-'.$keyparts[1];

		/* Large screens
		------------------------*/
		if (isset($value['d'])) {
			productgroups($value['d'], $productgroupscls);
		}
		
		/* Tablet and Mobile
		------------------------*/
		if ($settings['responsive_status']) {
			echo '@media only screen and (min-width: 768px) and (max-width: 979px) {';
			if (isset($value['t'])) {
				productgroups($value['t'], $productgroupscls);
			}
			echo '}';

			echo '@media only screen and (min-width: 200px) and (max-width: 767px) {';
			if (isset($value['m'])) {
				productgroups($value['m'], $productgroupscls);
			}
			echo '}';
		}

		/* Counter
		------------------------*/
		echo isset($value['counter']) ? 
		$productgroupscls.' .countdown li { '. $value['counter'] . ' }' : '';

		/* Dots
		------------------------*/
		echo isset($value['dots']['wrp']) ? 
		$productgroupscls.' .owl-dots { '. $value['dots']['wrp'] . ' }' : '';

		echo isset($value['dots']['normal']) ? 
		$productgroupscls.' .owl-dots .owl-dot span { '. $value['dots']['normal'] . ' }' : '';

		echo isset($value['dots']['active']) ? 
		$productgroupscls.' .owl-dots .owl-dot.active span { '. $value['dots']['active'] . ' }' : '';

		/* Arrows
		------------------------*/
		echo isset($value['arrows']['wrp']) ? 
		$productgroupscls.' .owl-nav { '. $value['arrows']['wrp'] . ' }' : '';

		echo isset($value['arrows']['arrow_line']) ? 
		$productgroupscls.' .ctrl-b .owl-nav:after { '. $value['arrows']['arrow_line'] . ' }' : '';

		echo isset($value['arrows']['arrow']) ? 
		$productgroupscls.' .owl-nav > div { '. $value['arrows']['arrow'] . ' }' : '';

		echo isset($value['arrows']['arrow_h']) ? 
		$productgroupscls.' .owl-nav > div:hover { '. $value['arrows']['arrow_h'] . ' }' : '';
		
	}
}