<?php
if (isset($revslider)) {
	foreach ($revslider as $key => $value) {
		
		$keyparts = explode('.', $key);
		$revslider_cls = '.revslider-'.$keyparts[1];

		/* Large screens
		------------------------*/
		if (isset($value['d'])) {
			revslider($value['d'], $revslider_cls);
		}
		
		/* Tablet and Mobile
		------------------------*/
		if ($settings['responsive_status']) {
			echo '@media only screen and (min-width: 768px) and (max-width: 979px) {';
			if (isset($value['t'])) {
				revslider($value['t'], $revslider_cls);
			}
			echo '}';

			echo '@media only screen and (min-width: 200px) and (max-width: 767px) {';
			if (isset($value['m'])) {
				revslider($value['m'], $revslider_cls);
			}
			echo '}';
		}
		
	}
}
