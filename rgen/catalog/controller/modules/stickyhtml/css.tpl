<?php
if (isset($stickyhtmls)) {
	foreach ($stickyhtmls as $key => $value) {
		
		$keyparts = explode('.', $key);
		$stickyhtmlscls = '.stickyhtml-'.$keyparts[1];

		/* Large screens
		------------------------*/
		if (isset($value['d'])) {
			fn_stickyhtmls($value['d'], $stickyhtmlscls);
		}
		
		/* Tablet and Mobile
		------------------------*/
		if ($settings['responsive_status']) {
			echo '@media only screen and (min-width: 768px) and (max-width: 979px) {';
			if (isset($value['t'])) {
				fn_stickyhtmls($value['t'], $stickyhtmlscls);
			}
			echo '}';
		}
	}
}
