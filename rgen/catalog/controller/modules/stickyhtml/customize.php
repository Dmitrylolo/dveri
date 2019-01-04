<?php
$stickyhtmls = $this->rgen->storage->get('modtheme_data', 'rgen_stickyhtml');
if ($this->chk($stickyhtmls)) {
	foreach ($stickyhtmls as $k => $v) {
		if ($this->chk($v)) {
			$stickyhtml = $v;

			if ($v['status']) {
				$screen_k = array('d', 't');
				foreach ($screen_k as $screen_v) {
					$data['stickyhtmls'][$k][$screen_v]['main']        = $factory->node($stickyhtml, $screen_v.'/main', 1);
					$data['stickyhtmls'][$k][$screen_v]['mod_wrp']     = $factory->node($stickyhtml, $screen_v.'/mod_wrp', 1);
					$data['stickyhtmls'][$k][$screen_v]['mod_content'] = $factory->node($stickyhtml, $screen_v.'/mod_content', 1);
					
					$data['stickyhtmls'][$k][$screen_v]['mod_hd']      = $factory->node($stickyhtml, $screen_v.'/mod_hd', 1);
					$data['stickyhtmls'][$k][$screen_v]['content']     = $factory->node($stickyhtml, $screen_v.'/content', 1);
					$data['stickyhtmls'][$k][$screen_v]['icon']        = $factory->node($stickyhtml, $screen_v.'/icon/block', 1);
					$data['stickyhtmls'][$k][$screen_v]['icon']       .= 'top:'.$factory->node($stickyhtml, $screen_v.'/icon/top', 0,0).'px';
				}
			}
		}
	}
}