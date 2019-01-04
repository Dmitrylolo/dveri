<?php
$catshowcases = $this->rgen->storage->get('modtheme_data', 'rgen_catshowcase');
if ($this->chk($catshowcases)) {
	foreach ($catshowcases as $k => $v) {
		if ($this->chk($v)) {
			$catshowcase = $v;

			if ($v['status']) {
				$screen_k = array('d', 't', 'm');
				$blockstyles = array(
					'ct_box1', 
					'ct_box2', 
					'ct_box3', 
					'ct_box4'
				);
				foreach ($screen_k as $screen_v) {
					$data['catshowcases'][$k][$screen_v]['main']                = $factory->node($catshowcase, $screen_v.'/main', 1);
					$data['catshowcases'][$k][$screen_v]['main_bg']             = $this->cssimgpath($factory->node($catshowcase, $screen_v.'/main_bg', 1));
					$data['catshowcases'][$k][$screen_v]['mod_wrp']             = $factory->node($catshowcase, $screen_v.'/mod_wrp', 1);
					$data['catshowcases'][$k][$screen_v]['mod_content']         = $factory->node($catshowcase, $screen_v.'/mod_content', 1);
					$data['catshowcases'][$k][$screen_v]['mod_hd']              = $factory->node($catshowcase, $screen_v.'/mod_hd', 1);
					$data['catshowcases'][$k][$screen_v]['mod_sub_hd']          = $factory->node($catshowcase, $screen_v.'/mod_sub_hd', 1);
					
					$data['catshowcases'][$k][$screen_v]['t_html']              = $factory->node($catshowcase, $screen_v.'/t_html', 1);
					$data['catshowcases'][$k][$screen_v]['b_html']              = $factory->node($catshowcase, $screen_v.'/b_html', 1);
					$data['catshowcases'][$k][$screen_v]['l_html']              = $factory->node($catshowcase, $screen_v.'/l_html', 1);
					$data['catshowcases'][$k][$screen_v]['r_html']              = $factory->node($catshowcase, $screen_v.'/r_html', 1);
					
					$data['catshowcases'][$k][$screen_v]['rw']                  = $factory->node($catshowcase, $screen_v.'/rw', 1);
					$data['catshowcases'][$k][$screen_v]['l_cl']                = $factory->node($catshowcase, $screen_v.'/l_cl', 1);
					$data['catshowcases'][$k][$screen_v]['m_cl']                = $factory->node($catshowcase, $screen_v.'/m_cl', 1);
					$data['catshowcases'][$k][$screen_v]['r_cl']                = $factory->node($catshowcase, $screen_v.'/r_cl', 1);
					
					$data['catshowcases'][$k][$screen_v]['outer_rw']            = $factory->node($catshowcase, $screen_v.'/outer_rw/rw', 1);
					$data['catshowcases'][$k][$screen_v]['outer_rw_first']      = $factory->node($catshowcase, $screen_v.'/outer_rw/first_rw', 1);
					$data['catshowcases'][$k][$screen_v]['outer_rw_last']       = $factory->node($catshowcase, $screen_v.'/outer_rw/last_rw', 1);
					$data['catshowcases'][$k][$screen_v]['outer_rw_cl']         = $factory->node($catshowcase, $screen_v.'/outer_rw/cl', 1);
					$data['catshowcases'][$k][$screen_v]['outer_rw_cl_first']   = $factory->node($catshowcase, $screen_v.'/outer_rw/first_cl', 1);
					$data['catshowcases'][$k][$screen_v]['outer_rw_cl_last']    = $factory->node($catshowcase, $screen_v.'/outer_rw/last_cl', 1);
					
					foreach ($blockstyles as $blockstyle) {
						$blockstyle_data = $factory->node($catshowcase, $screen_v.'/'.$blockstyle, 0, 0);

						if ($blockstyle_data) {
							
							if ($blockstyle != 'ct_box3') {
								$data['catshowcases'][$k][$screen_v][$blockstyle]['normal']['main']         = $factory->node($blockstyle_data, 'common/main/normal', 1);
								$data['catshowcases'][$k][$screen_v][$blockstyle]['normal']['main_ct']      = $factory->node($blockstyle_data, 'common/main_ct/normal', 1);
								$data['catshowcases'][$k][$screen_v][$blockstyle]['normal']['img']          = $factory->node($blockstyle_data, 'common/img/normal', 1);
								$data['catshowcases'][$k][$screen_v][$blockstyle]['normal']['img_overlay']  = $factory->node($blockstyle_data, 'common/img_overlay', 1);
								$data['catshowcases'][$k][$screen_v][$blockstyle]['normal']['info']         = $factory->node($blockstyle_data, 'common/info/normal', 1);
								$data['catshowcases'][$k][$screen_v][$blockstyle]['normal']['name']         = $factory->node($blockstyle_data, 'common/name/normal', 1);
								$data['catshowcases'][$k][$screen_v][$blockstyle]['normal']['text']         = $factory->node($blockstyle_data, 'common/text/normal', 1);
								$data['catshowcases'][$k][$screen_v][$blockstyle]['normal']['sub_ct']       = $factory->node($blockstyle_data, 'common/sub_ct', 1);
								$data['catshowcases'][$k][$screen_v][$blockstyle]['normal']['sub_ct_items'] = $factory->node($blockstyle_data, 'common/sub_ct_items', 1, 0, 'css_normal');
								$data['catshowcases'][$k][$screen_v][$blockstyle]['normal']['btn_wrp']      = $factory->node($blockstyle_data, 'common/btn_wrp/normal', 1);
								$data['catshowcases'][$k][$screen_v][$blockstyle]['normal']['btn']          = $factory->node($blockstyle_data, 'common/btn', 1, 0, 'css_normal');
								$data['catshowcases'][$k][$screen_v][$blockstyle]['normal']['link']         = $factory->node($blockstyle_data, 'common/link', 1, 0, 'css_normal');
								
								$data['catshowcases'][$k][$screen_v][$blockstyle]['hover']['main']          = $factory->node($blockstyle_data, 'common/main/hover', 1);
								$data['catshowcases'][$k][$screen_v][$blockstyle]['hover']['main_ct']       = $factory->node($blockstyle_data, 'common/main_ct/hover', 1);
								$data['catshowcases'][$k][$screen_v][$blockstyle]['hover']['img']           = $factory->node($blockstyle_data, 'common/img/hover', 1);
								$data['catshowcases'][$k][$screen_v][$blockstyle]['hover']['info']          = $factory->node($blockstyle_data, 'common/info/hover', 1);
								$data['catshowcases'][$k][$screen_v][$blockstyle]['hover']['name']          = $factory->node($blockstyle_data, 'common/name/hover', 1);
								$data['catshowcases'][$k][$screen_v][$blockstyle]['hover']['text']          = $factory->node($blockstyle_data, 'common/text/hover', 1);
								$data['catshowcases'][$k][$screen_v][$blockstyle]['hover']['sub_ct_items']  = $factory->node($blockstyle_data, 'common/sub_ct_items/hover', 1);
								$data['catshowcases'][$k][$screen_v][$blockstyle]['hover']['btn_wrp']       = $factory->node($blockstyle_data, 'common/btn_wrp/hover', 1);
								$data['catshowcases'][$k][$screen_v][$blockstyle]['hover']['sub_ct_items'] = $factory->node($blockstyle_data, 'common/sub_ct_items', 1, 0, 'css_hover');
								$data['catshowcases'][$k][$screen_v][$blockstyle]['hover']['btn']           = $factory->node($blockstyle_data, 'common/btn', 1, 0, 'css_hover');
								$data['catshowcases'][$k][$screen_v][$blockstyle]['hover']['link']          = $factory->node($blockstyle_data, 'common/link', 1, 0, 'css_hover');

							} else {
								$data['catshowcases'][$k][$screen_v][$blockstyle]['info']           = $factory->node($blockstyle_data, 'info', 1);
								$data['catshowcases'][$k][$screen_v][$blockstyle]['name']           = $factory->node($blockstyle_data, 'name', 1);
								$data['catshowcases'][$k][$screen_v][$blockstyle]['text']           = $factory->node($blockstyle_data, 'text', 1);
								$data['catshowcases'][$k][$screen_v][$blockstyle]['sub_ct']         = $factory->node($blockstyle_data, 'sub_ct', 1);
								$data['catshowcases'][$k][$screen_v][$blockstyle]['sub_ct_items']   = $factory->node($blockstyle_data, 'sub_ct_items', 1, 0, 'css_normal');
								$data['catshowcases'][$k][$screen_v][$blockstyle]['sub_ct_items_h'] = $factory->node($blockstyle_data, 'sub_ct_items', 1, 0, 'css_hover');
								
								$data['catshowcases'][$k][$screen_v][$blockstyle]['btn_wrp']        = $factory->node($blockstyle_data, 'btn_wrp', 1);
								
								$data['catshowcases'][$k][$screen_v][$blockstyle]['btn']            = $factory->node($blockstyle_data, 'btn', 1, 0, 'css_normal');
								$data['catshowcases'][$k][$screen_v][$blockstyle]['btn_h']          = $factory->node($blockstyle_data, 'btn', 1, 0, 'css_hover');
								$data['catshowcases'][$k][$screen_v][$blockstyle]['link']           = $factory->node($blockstyle_data, 'link', 1, 0, 'css_normal');
								$data['catshowcases'][$k][$screen_v][$blockstyle]['link_h']         = $factory->node($blockstyle_data, 'link', 1, 0, 'css_hover');
							}
						}
					}
				}
			}
		}
	}
	//echo "<pre>".print_r($data['catshowcases'],true)."</pre>";
}