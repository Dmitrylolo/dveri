<?php
if (isset($prdpghtmls)) {
	foreach ($prdpghtmls as $key => $value) {
		
		$keyparts = explode('.', $key);
		$prdpghtmlscls = '.prdpghtml-'.$keyparts[1];

		/* Large screens
		------------------------*/
		if (isset($value['d'])) {
			fn_prdpghtmls($value['d'], $prdpghtmlscls);
		}
		
		/* Tablet and Mobile
		------------------------*/
		if ($settings['responsive_status']) {
			echo '@media only screen and (min-width: 768px) and (max-width: 979px) {';
			if (isset($value['t'])) {
				fn_prdpghtmls($value['t'], $prdpghtmlscls);
			}
			echo '}';

			echo '@media only screen and (min-width: 200px) and (max-width: 767px) {';
			if (isset($value['m'])) {
				fn_prdpghtmls($value['m'], $prdpghtmlscls);
			}
			echo '}';
		}
	}
}
