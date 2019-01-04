<?php
if (isset($gridmanager)) {
	foreach ($gridmanager as $key => $value) {
		
		$keyparts = explode('.', $key);
		$gridmanager_cls = '.gridmanager-'.$keyparts[1];

		/* Large screens
		------------------------*/
		if (isset($value['d'])) {
			gridmanager($value['d'], $gridmanager_cls);
		}
		
		/* Tablet and Mobile
		------------------------*/
		if ($settings['responsive_status']) {
			echo '@media only screen and (min-width: 768px) and (max-width: 979px) {';
			if (isset($value['t'])) {
				gridmanager($value['t'], $gridmanager_cls);
			}
			echo '}';

			echo '@media only screen and (min-width: 200px) and (max-width: 767px) {';
			if (isset($value['m'])) {
				gridmanager($value['m'], $gridmanager_cls);
			}
			echo '}';
		}

	}
}
