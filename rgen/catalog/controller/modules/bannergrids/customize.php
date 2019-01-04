<?php
$bannergrids = $this->rgen->storage->get('modtheme_data', 'rgen_bannergrids');
if ($this->chk($bannergrids)) {
	foreach ($bannergrids as $k => $v) {
		if ($this->chk($v)) {
			$bannergrid = $v;

			if ($v['status']) {
				$screen_k = array('d', 't', 'm');
				$blockstyles = array(
					'no_effect', 
					'h_effect1', 
					'h_effect2', 
					'h_effect3', 
					'h_effect4', 
					'h_effect5', 
					'h_effect6'
				);
				foreach ($screen_k as $screen_v) {
					$data['bannergrids'][$k][$screen_v]['main']                = $factory->node($bannergrid, $screen_v.'/main', 1);
					$data['bannergrids'][$k][$screen_v]['main_bg']             = $this->cssimgpath($factory->node($bannergrid, $screen_v.'/main_bg', 1));
					$data['bannergrids'][$k][$screen_v]['mod_wrp']             = $factory->node($bannergrid, $screen_v.'/mod_wrp', 1);
					$data['bannergrids'][$k][$screen_v]['mod_content']         = $factory->node($bannergrid, $screen_v.'/mod_content', 1);
					$data['bannergrids'][$k][$screen_v]['mod_hd']              = $factory->node($bannergrid, $screen_v.'/mod_hd', 1);
					$data['bannergrids'][$k][$screen_v]['mod_sub_hd']          = $factory->node($bannergrid, $screen_v.'/mod_sub_hd', 1);
					
					$data['bannergrids'][$k][$screen_v]['t_html']              = $factory->node($bannergrid, $screen_v.'/t_html', 1);
					$data['bannergrids'][$k][$screen_v]['b_html']              = $factory->node($bannergrid, $screen_v.'/b_html', 1);
					$data['bannergrids'][$k][$screen_v]['l_html']              = $factory->node($bannergrid, $screen_v.'/l_html', 1);
					$data['bannergrids'][$k][$screen_v]['r_html']              = $factory->node($bannergrid, $screen_v.'/r_html', 1);
					
					$data['bannergrids'][$k][$screen_v]['rw']                  = $factory->node($bannergrid, $screen_v.'/rw', 1);
					$data['bannergrids'][$k][$screen_v]['l_cl']                = $factory->node($bannergrid, $screen_v.'/l_cl', 1);
					$data['bannergrids'][$k][$screen_v]['m_cl']                = $factory->node($bannergrid, $screen_v.'/m_cl', 1);
					$data['bannergrids'][$k][$screen_v]['r_cl']                = $factory->node($bannergrid, $screen_v.'/r_cl', 1);
					
					$data['bannergrids'][$k][$screen_v]['outer_rw']            = $factory->node($bannergrid, $screen_v.'/outer_rw/rw', 1);
					$data['bannergrids'][$k][$screen_v]['outer_rw_first']      = $factory->node($bannergrid, $screen_v.'/outer_rw/first_rw', 1);
					$data['bannergrids'][$k][$screen_v]['outer_rw_last']       = $factory->node($bannergrid, $screen_v.'/outer_rw/last_rw', 1);
					$data['bannergrids'][$k][$screen_v]['outer_rw_cl']         = $factory->node($bannergrid, $screen_v.'/outer_rw/cl', 1);
					$data['bannergrids'][$k][$screen_v]['outer_rw_cl_first']   = $factory->node($bannergrid, $screen_v.'/outer_rw/first_cl', 1);
					$data['bannergrids'][$k][$screen_v]['outer_rw_cl_last']    = $factory->node($bannergrid, $screen_v.'/outer_rw/last_cl', 1);
					
					foreach ($blockstyles as $blockstyle) {
						$blockstyle_data = $factory->node($bannergrid, $screen_v.'/'.$blockstyle, 0, 0);

						if ($blockstyle_data) {
							
							if ($blockstyle != 'no_effect') {
								$data['bannergrids'][$k][$screen_v][$blockstyle]['normal']['background']  = $factory->node($blockstyle_data, 'normal/common/background', 0, 'bgcolor');
								$data['bannergrids'][$k][$screen_v][$blockstyle]['normal']['overlay']     = $factory->node($blockstyle_data, 'normal/common/overlay', 0, 'bgcolor');
								$data['bannergrids'][$k][$screen_v][$blockstyle]['normal']['bdrcolor']    = $factory->node($blockstyle_data, 'normal/bdrcolor', 0, 'bdrcolor');
								$data['bannergrids'][$k][$screen_v][$blockstyle]['normal']['title']       = $factory->node($blockstyle_data, 'normal/common/title', 1);
								$data['bannergrids'][$k][$screen_v][$blockstyle]['normal']['description'] = $factory->node($blockstyle_data, 'normal/common/description', 1);
								$data['bannergrids'][$k][$screen_v][$blockstyle]['normal']['img_opacity'] = $factory->node($blockstyle_data, 'normal/common/img_opacity', 0, 'opacity');
								$data['bannergrids'][$k][$screen_v][$blockstyle]['normal']['scale']       = $factory->node($blockstyle_data, 'normal/common/scale', 0, 0);

								$data['bannergrids'][$k][$screen_v][$blockstyle]['hover']['background']  = $factory->node($blockstyle_data, 'hover/common/background', 0, 'bgcolor');
								$data['bannergrids'][$k][$screen_v][$blockstyle]['hover']['overlay']     = $factory->node($blockstyle_data, 'hover/common/overlay', 0, 'bgcolor');
								$data['bannergrids'][$k][$screen_v][$blockstyle]['hover']['bdrcolor']    = $factory->node($blockstyle_data, 'hover/bdrcolor', 0, 'bdrcolor');
								$data['bannergrids'][$k][$screen_v][$blockstyle]['hover']['title']       = $factory->node($blockstyle_data, 'hover/common/title', 1);
								$data['bannergrids'][$k][$screen_v][$blockstyle]['hover']['description'] = $factory->node($blockstyle_data, 'hover/common/description', 1);
								$data['bannergrids'][$k][$screen_v][$blockstyle]['hover']['img_opacity'] = $factory->node($blockstyle_data, 'hover/common/img_opacity', 0, 'opacity');
								$data['bannergrids'][$k][$screen_v][$blockstyle]['hover']['scale']       = $factory->node($blockstyle_data, 'hover/common/scale', 0, 0);

								if ($blockstyle == 'h_effect5') {
								$data['bannergrids'][$k][$screen_v][$blockstyle]['normal']['bdrcolor']    = $factory->node($blockstyle_data, 'normal/bdrcolor', 0, 'bgcolor');
								$data['bannergrids'][$k][$screen_v][$blockstyle]['hover']['bdrcolor']    = $factory->node($blockstyle_data, 'hover/bdrcolor', 0, 'bgcolor');
								}
								
							} else {
								$data['bannergrids'][$k][$screen_v][$blockstyle]['block']       = $factory->node($blockstyle_data, 'block', 1, 0, 'css_normal');
								$data['bannergrids'][$k][$screen_v][$blockstyle]['block_h']     = $factory->node($blockstyle_data, 'block', 1, 0, 'css_hover');
								
								$data['bannergrids'][$k][$screen_v][$blockstyle]['img']         = $factory->node($blockstyle_data, 'img', 1, 0, 'css_normal');
								$data['bannergrids'][$k][$screen_v][$blockstyle]['img_h']       = $factory->node($blockstyle_data, 'img', 1, 0, 'css_hover');
							}
						}
					}
				}
			}
		}
	}
}