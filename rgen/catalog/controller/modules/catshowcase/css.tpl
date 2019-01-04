<?php
if (isset($catshowcases)) {
	foreach ($catshowcases as $key => $value) {
		
		$keyparts = explode('.', $key);
		$catshowcase_cls = '.catshowcase-'.$keyparts[1];

		/* Large screens
		------------------------*/
		if (isset($value['d'])) {
			catshowcase($value['d'], $catshowcase_cls);
		}
		
		/* Tablet and Mobile
		------------------------*/
		if ($settings['responsive_status']) {
			echo '@media only screen and (min-width: 768px) and (max-width: 979px) {';
			if (isset($value['t'])) {
				catshowcase($value['t'], $catshowcase_cls);
			}
			echo '}';

			echo '@media only screen and (min-width: 200px) and (max-width: 767px) {';
			if (isset($value['m'])) {
				catshowcase($value['m'], $catshowcase_cls);
			}
			echo '}';
		}
	}
}
