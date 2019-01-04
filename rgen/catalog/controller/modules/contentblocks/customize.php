<?php
$contentblocks = $this->rgen->storage->get('modtheme_data', 'rgen_contentblocks');
if ($this->chk($contentblocks)) {
	foreach ($contentblocks as $k => $v) {
		if ($this->chk($v)) {
			$contentblock = $v;

			if ($v['status']) {
				$data['contentblocks'][$k]['dots']['wrp']          = $factory->node($contentblock, 'dots/wrp', 1);
				$data['contentblocks'][$k]['dots']['normal']       = $factory->node($contentblock, 'dots/normal', 1);
				$data['contentblocks'][$k]['dots']['active']       = $factory->node($contentblock, 'dots/active', 1);
				
				$data['contentblocks'][$k]['arrows']['wrp']        = $factory->node($contentblock, 'arrows/wrp', 1);
				$data['contentblocks'][$k]['arrows']['arrow_line'] = $factory->node($contentblock, 'arrows/arrow_line', 1);
				$data['contentblocks'][$k]['arrows']['arrow']      = $factory->node($contentblock, 'arrows/arrow', 1, 0, 'css_normal');
				$data['contentblocks'][$k]['arrows']['arrow_h']    = $factory->node($contentblock, 'arrows/arrow', 1, 0, 'css_hover');

				$screen_k = array('d', 't', 'm');
				$blockstyles = array(
					'ctn_block1', 
					'ctn_block2', 
					'ctn_block3', 
					'ctn_block4',
					'ctn_block_small1',
					'ctn_block_small2'
				);
				foreach ($screen_k as $screen_v) {
					$data['contentblocks'][$k][$screen_v]['main']                = $factory->node($contentblock, $screen_v.'/main', 1);
					$data['contentblocks'][$k][$screen_v]['main_bg']             = $this->cssimgpath($factory->node($contentblock, $screen_v.'/main_bg', 1));
					$data['contentblocks'][$k][$screen_v]['mod_wrp']             = $factory->node($contentblock, $screen_v.'/mod_wrp', 1);
					$data['contentblocks'][$k][$screen_v]['mod_content']         = $factory->node($contentblock, $screen_v.'/mod_content', 1);
					$data['contentblocks'][$k][$screen_v]['mod_hd']              = $factory->node($contentblock, $screen_v.'/mod_hd', 1);
					$data['contentblocks'][$k][$screen_v]['mod_sub_hd']          = $factory->node($contentblock, $screen_v.'/mod_sub_hd', 1);
					
					$data['contentblocks'][$k][$screen_v]['t_html']              = $factory->node($contentblock, $screen_v.'/t_html', 1);
					$data['contentblocks'][$k][$screen_v]['b_html']              = $factory->node($contentblock, $screen_v.'/b_html', 1);
					$data['contentblocks'][$k][$screen_v]['l_html']              = $factory->node($contentblock, $screen_v.'/l_html', 1);
					$data['contentblocks'][$k][$screen_v]['r_html']              = $factory->node($contentblock, $screen_v.'/r_html', 1);
					
					$data['contentblocks'][$k][$screen_v]['rw']                  = $factory->node($contentblock, $screen_v.'/rw', 1);
					$data['contentblocks'][$k][$screen_v]['l_cl']                = $factory->node($contentblock, $screen_v.'/l_cl', 1);
					$data['contentblocks'][$k][$screen_v]['m_cl']                = $factory->node($contentblock, $screen_v.'/m_cl', 1);
					$data['contentblocks'][$k][$screen_v]['r_cl']                = $factory->node($contentblock, $screen_v.'/r_cl', 1);
					
					$data['contentblocks'][$k][$screen_v]['outer_rw']            = $factory->node($contentblock, $screen_v.'/outer_rw/rw', 1);
					$data['contentblocks'][$k][$screen_v]['outer_rw_first']      = $factory->node($contentblock, $screen_v.'/outer_rw/first_rw', 1);
					$data['contentblocks'][$k][$screen_v]['outer_rw_last']       = $factory->node($contentblock, $screen_v.'/outer_rw/last_rw', 1);
					$data['contentblocks'][$k][$screen_v]['outer_rw_cl']         = $factory->node($contentblock, $screen_v.'/outer_rw/cl', 1);
					$data['contentblocks'][$k][$screen_v]['outer_rw_cl_first']   = $factory->node($contentblock, $screen_v.'/outer_rw/first_cl', 1);
					$data['contentblocks'][$k][$screen_v]['outer_rw_cl_last']    = $factory->node($contentblock, $screen_v.'/outer_rw/last_cl', 1);
					
					$data['contentblocks'][$k][$screen_v]['content_rw']          = $factory->node($contentblock, $screen_v.'/content_rw/rw', 1);
					$data['contentblocks'][$k][$screen_v]['content_rw_cl']       = $factory->node($contentblock, $screen_v.'/content_rw/cl', 1);
					$data['contentblocks'][$k][$screen_v]['content_rw_cl_first'] = $factory->node($contentblock, $screen_v.'/content_rw/first_cl', 1);
					$data['contentblocks'][$k][$screen_v]['content_rw_cl_last']  = $factory->node($contentblock, $screen_v.'/content_rw/last_cl', 1);

					foreach ($blockstyles as $blockstyle) {
						$blockstyle_data = $factory->node($contentblock, $screen_v.'/'.$blockstyle, 0, 0);

						if ($blockstyle_data) {
							$data['contentblocks'][$k][$screen_v][$blockstyle]['main']['normal'] = $factory->node($blockstyle_data, 'setting/main/normal', 1);
							$data['contentblocks'][$k][$screen_v][$blockstyle]['main']['hover']  = $factory->node($blockstyle_data, 'setting/main/hover', 1);

							$data['contentblocks'][$k][$screen_v][$blockstyle]['inner_wrp']['normal'] = $factory->node($blockstyle_data, 'setting/inner_wrp/normal', 1);
							$data['contentblocks'][$k][$screen_v][$blockstyle]['inner_wrp']['hover']  = $factory->node($blockstyle_data, 'setting/inner_wrp/hover', 1);

							$data['contentblocks'][$k][$screen_v][$blockstyle]['figure']['normal'] = $factory->node($blockstyle_data, 'setting/figure/normal', 1);
							$data['contentblocks'][$k][$screen_v][$blockstyle]['figure']['hover']  = $factory->node($blockstyle_data, 'setting/figure/hover', 1);

							$data['contentblocks'][$k][$screen_v][$blockstyle]['text_wrp']['normal'] = $factory->node($blockstyle_data, 'setting/text_wrp/normal', 1);
							$data['contentblocks'][$k][$screen_v][$blockstyle]['text_wrp']['hover']  = $factory->node($blockstyle_data, 'setting/text_wrp/hover', 1);

							$data['contentblocks'][$k][$screen_v][$blockstyle]['name']['normal'] = $factory->node($blockstyle_data, 'setting/name/normal', 1);
							$data['contentblocks'][$k][$screen_v][$blockstyle]['name']['hover']  = $factory->node($blockstyle_data, 'setting/name/hover', 1);

							$data['contentblocks'][$k][$screen_v][$blockstyle]['text']['normal'] = $factory->node($blockstyle_data, 'setting/text/normal', 1);
							$data['contentblocks'][$k][$screen_v][$blockstyle]['text']['hover']  = $factory->node($blockstyle_data, 'setting/text/hover', 1);

							$data['contentblocks'][$k][$screen_v][$blockstyle]['btn_wrp']['normal'] = $factory->node($blockstyle_data, 'setting/btn_wrp/normal', 1);
							$data['contentblocks'][$k][$screen_v][$blockstyle]['btn_wrp']['hover']  = $factory->node($blockstyle_data, 'setting/btn_wrp/hover', 1);

							$data['contentblocks'][$k][$screen_v][$blockstyle]['btn']['normal'] = $factory->node($blockstyle_data, 'setting/btn', 1, 0, 'css_normal');
							$data['contentblocks'][$k][$screen_v][$blockstyle]['btn']['hover']  = $factory->node($blockstyle_data, 'setting/btn', 1, 0, 'css_hover');

							$data['contentblocks'][$k][$screen_v][$blockstyle]['link']['normal'] = $factory->node($blockstyle_data, 'setting/link', 1, 0, 'css_normal');
							$data['contentblocks'][$k][$screen_v][$blockstyle]['link']['hover']  = $factory->node($blockstyle_data, 'setting/link', 1, 0, 'css_hover');
						}
					}

				}
			}
		}
	}
}