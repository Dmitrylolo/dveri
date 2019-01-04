<?php
if (isset($imagegallery)) {
	foreach ($imagegallery as $key => $value) {
		
		$keyparts = explode('.', $key);
		$imagegallery_cls = '.imagegallery-'.$keyparts[1];

		/* Large screens
		------------------------*/
		if (isset($value['d'])) {
			imagegallery($value['d'], $imagegallery_cls);
		}
		
		/* Tablet and Mobile
		------------------------*/
		if ($settings['responsive_status']) {
			echo '@media only screen and (min-width: 768px) and (max-width: 979px) {';
			if (isset($value['t'])) {
				imagegallery($value['t'], $imagegallery_cls);
			}
			echo '}';

			echo '@media only screen and (min-width: 200px) and (max-width: 767px) {';
			if (isset($value['m'])) {
				imagegallery($value['m'], $imagegallery_cls);
			}
			echo '}';
		}
	}
}
