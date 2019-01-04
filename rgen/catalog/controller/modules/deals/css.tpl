<?php
if (isset($deals)) {
	foreach ($deals as $key => $value) {
		
		$keyparts = explode('.', $key);
		$deals_cls = '.deals-'.$keyparts[1];

		/* Large screens
		------------------------*/
		if (isset($value['d'])) {
			deal($value['d'], $deals_cls);
		}
		
		/* Tablet and Mobile
		------------------------*/
		if ($settings['responsive_status']) {
			echo '@media only screen and (min-width: 768px) and (max-width: 979px) {';
			if (isset($value['t'])) {
				deal($value['t'], $deals_cls);
			}
			echo '}';

			echo '@media only screen and (min-width: 200px) and (max-width: 767px) {';
			if (isset($value['m'])) {
				deal($value['m'], $deals_cls);
			}
			echo '}';
		}
	}
}
