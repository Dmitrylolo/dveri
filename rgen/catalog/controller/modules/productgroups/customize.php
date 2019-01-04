<?php
$productgroups = $this->rgen->storage->get('modtheme_data', 'rgen_productgroups');
if ($this->chk($productgroups)) {
	foreach ($productgroups as $k => $v) {
		if ($this->chk($v)) {
			$productgroup = $v;

			if ($v['status']) {
				$data['productgroups'][$k]['counter']              = $factory->node($productgroup, 'counter', 1);

				$data['productgroups'][$k]['dots']['wrp']          = $factory->node($productgroup, 'dots/wrp', 1);
				$data['productgroups'][$k]['dots']['normal']       = $factory->node($productgroup, 'dots/normal', 1);
				$data['productgroups'][$k]['dots']['active']       = $factory->node($productgroup, 'dots/active', 1);
				
				$data['productgroups'][$k]['arrows']['wrp']        = $factory->node($productgroup, 'arrows/wrp', 1);
				$data['productgroups'][$k]['arrows']['arrow_line'] = $factory->node($productgroup, 'arrows/arrow_line', 1);
				$data['productgroups'][$k]['arrows']['arrow']      = $factory->node($productgroup, 'arrows/arrow', 1, 0, 'css_normal');
				$data['productgroups'][$k]['arrows']['arrow_h']    = $factory->node($productgroup, 'arrows/arrow', 1, 0, 'css_hover');

				$screen_k = array('d', 't', 'm');
				$prdstyles = array(
					'prd_block1', 
					'prd_block2', 
					'prd_block3', 
					'prd_small1', 
					'prd_small2'
				);
				foreach ($screen_k as $screen_v) {
					$data['productgroups'][$k][$screen_v]['main']        = $factory->node($productgroup, $screen_v.'/main', 1);
					$data['productgroups'][$k][$screen_v]['main_bg']     = $this->cssimgpath($factory->node($productgroup, $screen_v.'/main_bg', 1));
					$data['productgroups'][$k][$screen_v]['mod_wrp']     = $factory->node($productgroup, $screen_v.'/mod_wrp', 1);
					$data['productgroups'][$k][$screen_v]['mod_content'] = $factory->node($productgroup, $screen_v.'/mod_content', 1);
					$data['productgroups'][$k][$screen_v]['mod_hd']      = $factory->node($productgroup, $screen_v.'/mod_hd', 1);
					$data['productgroups'][$k][$screen_v]['mod_sub_hd']  = $factory->node($productgroup, $screen_v.'/mod_sub_hd', 1);
					
					$data['productgroups'][$k][$screen_v]['t_html']      = $factory->node($productgroup, $screen_v.'/t_html', 1);
					$data['productgroups'][$k][$screen_v]['b_html']      = $factory->node($productgroup, $screen_v.'/b_html', 1);
					$data['productgroups'][$k][$screen_v]['l_html']      = $factory->node($productgroup, $screen_v.'/l_html', 1);
					$data['productgroups'][$k][$screen_v]['r_html']      = $factory->node($productgroup, $screen_v.'/r_html', 1);
					
					$data['productgroups'][$k][$screen_v]['rw']          = $factory->node($productgroup, $screen_v.'/rw', 1);
					$data['productgroups'][$k][$screen_v]['l_cl']        = $factory->node($productgroup, $screen_v.'/l_cl', 1);
					$data['productgroups'][$k][$screen_v]['m_cl']        = $factory->node($productgroup, $screen_v.'/m_cl', 1);
					$data['productgroups'][$k][$screen_v]['r_cl']        = $factory->node($productgroup, $screen_v.'/r_cl', 1);

					foreach ($prdstyles as $prdstyle) {
						$prdstyle_data = $factory->node($productgroup, $screen_v.'/'.$prdstyle, 1, 0, 'css_data');
						if ($prdstyle_data) {
							foreach ($prdstyle_data as $prd_k => $prd_v) {
								$data['productgroups'][$k][$screen_v][$prdstyle][$prd_k] = $prd_v;
							}
						}
					}

					$data['productgroups'][$k][$screen_v]['tab1']['container']     = $factory->node($productgroup, $screen_v.'/tab1/tab_container', 1);
					$data['productgroups'][$k][$screen_v]['tab1']['panel']         = $factory->node($productgroup, $screen_v.'/tab1/tab_panel', 1);
					$data['productgroups'][$k][$screen_v]['tab1']['item']          = $factory->node($productgroup, $screen_v.'/tab1/tab_item', 1);
					$data['productgroups'][$k][$screen_v]['tab1']['item_active']   = $factory->node($productgroup, $screen_v.'/tab1/tab_item_active', 1);
					$data['productgroups'][$k][$screen_v]['tab1']['item_a']        = $factory->node($productgroup, $screen_v.'/tab1/tab_item_a', 1);
					$data['productgroups'][$k][$screen_v]['tab1']['item_active_a'] = $factory->node($productgroup, $screen_v.'/tab1/tab_item_active_a', 1);
					$data['productgroups'][$k][$screen_v]['tab1']['pane_wrp']      = $factory->node($productgroup, $screen_v.'/tab1/tab_pane_wrp', 1);
					//$data['productgroups'][$k][$screen_v]['tab1']['tab_pane']      = $factory->node($productgroup, $screen_v.'/tab1/tab_tab_pane', 1);
					$data['productgroups'][$k][$screen_v]['tab1']['pane_active']   = $factory->node($productgroup, $screen_v.'/tab1/tab_pane_active', 1);
				}
			}
		}
	}
}