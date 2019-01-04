<?php
$deals = $this->rgen->storage->get('modtheme_data', 'rgen_deals');
if ($this->chk($deals)) {
	foreach ($deals as $k => $v) {
		if ($this->chk($v)) {
			$deal = $v;

			if ($v['status']) {
				$screen_k = array('d', 't', 'm');
				$blockstyles = array(
					'box1', 
					'box2', 
					'box3'
				);
				foreach ($screen_k as $screen_v) {
					$data['deals'][$k][$screen_v]['main']                = $factory->node($deal, $screen_v.'/main', 1);
					$data['deals'][$k][$screen_v]['main_bg']             = $this->cssimgpath($factory->node($deal, $screen_v.'/main_bg', 1));
					$data['deals'][$k][$screen_v]['mod_wrp']             = $factory->node($deal, $screen_v.'/mod_wrp', 1);
					$data['deals'][$k][$screen_v]['mod_content']         = $factory->node($deal, $screen_v.'/mod_content', 1);
					$data['deals'][$k][$screen_v]['mod_hd']              = $factory->node($deal, $screen_v.'/mod_hd', 1);
					$data['deals'][$k][$screen_v]['mod_sub_hd']          = $factory->node($deal, $screen_v.'/mod_sub_hd', 1);
					
					$data['deals'][$k][$screen_v]['t_html']              = $factory->node($deal, $screen_v.'/t_html', 1);
					$data['deals'][$k][$screen_v]['b_html']              = $factory->node($deal, $screen_v.'/b_html', 1);
					$data['deals'][$k][$screen_v]['l_html']              = $factory->node($deal, $screen_v.'/l_html', 1);
					$data['deals'][$k][$screen_v]['r_html']              = $factory->node($deal, $screen_v.'/r_html', 1);
					
					$data['deals'][$k][$screen_v]['rw']                  = $factory->node($deal, $screen_v.'/rw', 1);
					$data['deals'][$k][$screen_v]['l_cl']                = $factory->node($deal, $screen_v.'/l_cl', 1);
					$data['deals'][$k][$screen_v]['m_cl']                = $factory->node($deal, $screen_v.'/m_cl', 1);
					$data['deals'][$k][$screen_v]['r_cl']                = $factory->node($deal, $screen_v.'/r_cl', 1);
					
					$data['deals'][$k][$screen_v]['outer_rw']            = $factory->node($deal, $screen_v.'/outer_rw/rw', 1);
					$data['deals'][$k][$screen_v]['outer_rw_first']      = $factory->node($deal, $screen_v.'/outer_rw/first_rw', 1);
					$data['deals'][$k][$screen_v]['outer_rw_last']       = $factory->node($deal, $screen_v.'/outer_rw/last_rw', 1);
					$data['deals'][$k][$screen_v]['outer_rw_cl']         = $factory->node($deal, $screen_v.'/outer_rw/cl', 1);
					$data['deals'][$k][$screen_v]['outer_rw_cl_first']   = $factory->node($deal, $screen_v.'/outer_rw/first_cl', 1);
					$data['deals'][$k][$screen_v]['outer_rw_cl_last']    = $factory->node($deal, $screen_v.'/outer_rw/last_cl', 1);
					
					foreach ($blockstyles as $blockstyle) {
						$blockstyle_data = $factory->node($deal, $screen_v.'/'.$blockstyle, 0, 0);

						if ($blockstyle_data) {
							$data['deals'][$k][$screen_v][$blockstyle]['main_wrp']          = $factory->node($blockstyle_data, 'common/main_wrp', 1);
							$data['deals'][$k][$screen_v][$blockstyle]['overlay']           = $factory->node($blockstyle_data, 'common/overlay', 1, 'bgcolor');
							$data['deals'][$k][$screen_v][$blockstyle]['img_wrp']           = $factory->node($blockstyle_data, 'common/img_wrp', 1);
							$data['deals'][$k][$screen_v][$blockstyle]['th_wrp']            = $factory->node($blockstyle_data, 'common/th_wrp', 1);
							$data['deals'][$k][$screen_v][$blockstyle]['th_img']            = $factory->node($blockstyle_data, 'common/th_img', 1);
							$data['deals'][$k][$screen_v][$blockstyle]['info_wrp']          = $factory->node($blockstyle_data, 'common/info_wrp', 1);
							$data['deals'][$k][$screen_v][$blockstyle]['name_wrp']          = $factory->node($blockstyle_data, 'common/name_wrp', 1);
							$data['deals'][$k][$screen_v][$blockstyle]['name']              = $factory->node($blockstyle_data, 'common/name', 1);
							$data['deals'][$k][$screen_v][$blockstyle]['cat_wrp']           = $factory->node($blockstyle_data, 'common/cat_wrp', 1);
							$data['deals'][$k][$screen_v][$blockstyle]['cat_links']         = $factory->node($blockstyle_data, 'common/cat_links', 1, 0, 'css_normal');
							$data['deals'][$k][$screen_v][$blockstyle]['cat_links_h']       = $factory->node($blockstyle_data, 'common/cat_links', 1, 0, 'css_hover');

							$data['deals'][$k][$screen_v][$blockstyle]['price_wrp']         = $factory->node($blockstyle_data, 'common/price/wrp', 1);
							$data['deals'][$k][$screen_v][$blockstyle]['price_box']         = $factory->node($blockstyle_data, 'common/price/box', 1);
							$data['deals'][$k][$screen_v][$blockstyle]['price_p_new']       = $factory->node($blockstyle_data, 'common/price/p_new', 1);
							$data['deals'][$k][$screen_v][$blockstyle]['price_p_old']       = $factory->node($blockstyle_data, 'common/price/p_old', 1);
							$data['deals'][$k][$screen_v][$blockstyle]['tag']               = $factory->node($blockstyle_data, 'common/price/tag', 1);
							$data['deals'][$k][$screen_v][$blockstyle]['review_wrp']        = $factory->node($blockstyle_data, 'common/price/review_wrp', 1);
							$data['deals'][$k][$screen_v][$blockstyle]['star']              = $factory->node($blockstyle_data, 'common/price/star', 0, 'color');
							$data['deals'][$k][$screen_v][$blockstyle]['star_active']       = $factory->node($blockstyle_data, 'common/price/star_active', 0, 'color');
							
							$data['deals'][$k][$screen_v][$blockstyle]['countdown_out_wrp'] = $factory->node($blockstyle_data, 'common/countdown/out_wrp', 1);
							$data['deals'][$k][$screen_v][$blockstyle]['countdown_in_wrp']  = $factory->node($blockstyle_data, 'common/countdown/in_wrp', 1);
							$data['deals'][$k][$screen_v][$blockstyle]['countdown_box']     = $factory->node($blockstyle_data, 'common/countdown/box', 1);
							$data['deals'][$k][$screen_v][$blockstyle]['countdown_count']   = $factory->node($blockstyle_data, 'common/countdown/count', 1);
							$data['deals'][$k][$screen_v][$blockstyle]['countdown_label']   = $factory->node($blockstyle_data, 'common/countdown/label', 1);
							
							$data['deals'][$k][$screen_v][$blockstyle]['description']       = $factory->node($blockstyle_data, 'common/description', 1);
							$data['deals'][$k][$screen_v][$blockstyle]['btn_wrp']           = $factory->node($blockstyle_data, 'common/btn_wrp', 1);
							
							$data['deals'][$k][$screen_v][$blockstyle]['btn']               = $factory->node($blockstyle_data, 'common/btn', 1, 0, 'css_normal');
							$data['deals'][$k][$screen_v][$blockstyle]['btn_h']             = $factory->node($blockstyle_data, 'common/btn', 1, 0, 'css_hover');
							
							$data['deals'][$k][$screen_v][$blockstyle]['links']             = $factory->node($blockstyle_data, 'common/links/wrp', 1);
							$data['deals'][$k][$screen_v][$blockstyle]['link']              = $factory->node($blockstyle_data, 'common/links/normal', 0, 'color');
							$data['deals'][$k][$screen_v][$blockstyle]['link_h']            = $factory->node($blockstyle_data, 'common/links/hover', 0, 'color');
						}
					}
				}
			}
		}
	}
}