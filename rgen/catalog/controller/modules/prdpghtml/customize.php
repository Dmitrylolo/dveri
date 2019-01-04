<?php
$prdpghtmls = $this->rgen->storage->get('modtheme_data', 'rgen_prdpghtml');
if ($this->chk($prdpghtmls)) {
	foreach ($prdpghtmls as $k => $v) {
		if ($this->chk($v)) {
			$prdpghtml = $v;

			if ($v['status']) {
				$screen_k = array('d', 't', 'm');
				foreach ($screen_k as $screen_v) {
					$data['prdpghtmls'][$k][$screen_v]['main']        = $factory->node($prdpghtml, $screen_v.'/main', 1);
					$data['prdpghtmls'][$k][$screen_v]['mod_wrp']     = $factory->node($prdpghtml, $screen_v.'/mod_wrp', 1);
					$data['prdpghtmls'][$k][$screen_v]['mod_content'] = $factory->node($prdpghtml, $screen_v.'/mod_content', 1);
					$data['prdpghtmls'][$k][$screen_v]['mod_hd']      = $factory->node($prdpghtml, $screen_v.'/mod_hd', 1);
					
					$data['prdpghtmls'][$k][$screen_v]['t_html']      = $factory->node($prdpghtml, $screen_v.'/t_html', 1);
					$data['prdpghtmls'][$k][$screen_v]['b_html']      = $factory->node($prdpghtml, $screen_v.'/b_html', 1);
					$data['prdpghtmls'][$k][$screen_v]['l_html']      = $factory->node($prdpghtml, $screen_v.'/l_html', 1);
					$data['prdpghtmls'][$k][$screen_v]['m_html']      = $factory->node($prdpghtml, $screen_v.'/m_html', 1);
					$data['prdpghtmls'][$k][$screen_v]['r_html']      = $factory->node($prdpghtml, $screen_v.'/r_html', 1);
					
					$data['prdpghtmls'][$k][$screen_v]['rw']          = $factory->node($prdpghtml, $screen_v.'/rw', 1);
					$data['prdpghtmls'][$k][$screen_v]['l_cl']        = $factory->node($prdpghtml, $screen_v.'/l_cl', 1);
					$data['prdpghtmls'][$k][$screen_v]['m_cl']        = $factory->node($prdpghtml, $screen_v.'/m_cl', 1);
					$data['prdpghtmls'][$k][$screen_v]['r_cl']        = $factory->node($prdpghtml, $screen_v.'/r_cl', 1);
				}
			}
		}
	}
}