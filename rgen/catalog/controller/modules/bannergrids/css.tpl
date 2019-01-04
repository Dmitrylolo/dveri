<?php
if (isset($bannergrids)) {
	foreach ($bannergrids as $key => $value) {
		
		$keyparts = explode('.', $key);
		$bannergrids_cls = '.bannergrids-'.$keyparts[1];

		/* Large screens
		------------------------*/
		if (isset($value['d'])) {
			bannergrids($value['d'], $bannergrids_cls);
		}
		
		/* Tablet and Mobile
		------------------------*/
		if ($settings['responsive_status']) {
			echo '@media only screen and (min-width: 768px) and (max-width: 979px) {';
			if (isset($value['t'])) {
				bannergrids($value['t'], $bannergrids_cls);
			}
			echo '}';

			echo '@media only screen and (min-width: 200px) and (max-width: 767px) {';
			if (isset($value['m'])) {
				bannergrids($value['m'], $bannergrids_cls);
			}
			echo '}';
		}
	}
}
