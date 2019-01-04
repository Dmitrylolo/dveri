<?php
$prdblocks = $this->rgen->storage->get('theme_data', 'rgen_prdblocks');

/* Product box 1 */
if (isset($prdblocks['global_prdblocks'])) {
	if ($factory::has($prdblocks['global_prdblocks'], 'prd1')) {
		$prd1 = $prdblocks['global_prdblocks']['prd1'];
		if (isset($prd1['status']) && $prd1['status']) {
			$data['prd1']['status']      = $prd1['status'];
			$data['prd1']['cart_ico']    = $this->cssimgpath($factory->getnode($prd1, 'cart_ico'));
			$data['prd1']['wish_ico']    = $this->cssimgpath($factory->getnode($prd1, 'wish_ico'));
			$data['prd1']['compare_ico'] = $this->cssimgpath($factory->getnode($prd1, 'compare_ico'));
			
			$data['prd1']['offer_img']   = $this->cssimgpath($factory->getnode($prd1['offer_img'], 'img'));
			$data['prd1']['offer_img']  .= $this->cssprop($prd1['offer_img']['tag_w'], 'w');
			$data['prd1']['offer_img']  .= $this->cssprop($prd1['offer_img']['tag_h'], 'h');
			
			$data['prd1']['offer_dis']   = $this->cssimgpath($factory->getnode($prd1, 'offer_discount'));
			$data['prd1']['offer_text']  = $this->cssimgpath($factory->getnode($prd1['offer_text'], 'box'));

			// Grid view
			if ($factory::has($prdblocks['global_prdblocks']['prd1'], 'grid')) {
				$grid_prd1_style = $prdblocks['global_prdblocks']['prd1']['grid']['style'];
				if (isset($grid_prd1_style['status']) && $grid_prd1_style['status']) {
					foreach ($grid_prd1_style['css_data'] as $key => $value) {
						$data['prd1']['grid'][$key] = $value;
					}
					if (isset($grid_prd1_style['prd']['cart_btn']['font_color']['hover'])) {
						$data['prd1']['grid']['ico_color'] = $this->cssprop($grid_prd1_style['prd']['cart_btn']['font_color']['hover'], 'color');	
					}
				}
			}

			// List view
			if ($factory::has($prdblocks['global_prdblocks']['prd1'], 'list')) {
				$list_prd1_style = $prdblocks['global_prdblocks']['prd1']['list']['style'];
				if (isset($list_prd1_style['status']) && $list_prd1_style['status']) {
					foreach ($list_prd1_style['css_data'] as $key => $value) {
						$data['prd1']['list'][$key] = $value;
					}
					if (isset($list_prd1_style['prd']['cart_btn']['font_color']['hover'])) {
						$data['prd1']['list']['ico_color'] = $this->cssprop($list_prd1_style['prd']['cart_btn']['font_color']['hover'], 'color');	
					}
				}
			}

			// Normal module view
			if ($factory::has($prdblocks['global_prdblocks']['prd1'], 'normal')) {
				$normal_prd1_style = $prdblocks['global_prdblocks']['prd1']['normal']['style'];
				if (isset($normal_prd1_style['status']) && $normal_prd1_style['status']) {
					foreach ($normal_prd1_style['css_data'] as $key => $value) {
						$data['prd1']['normal'][$key] = $value;
					}
					if (isset($normal_prd1_style['prd']['cart_btn']['font_color']['hover'])) {
						$data['prd1']['normal']['ico_color'] = $this->cssprop($normal_prd1_style['prd']['cart_btn']['font_color']['hover'], 'color');
					}
				}
			}
		}
	}

	if ($factory::has($prdblocks['global_prdblocks'], 'prd2')) {
		$prd2 = $prdblocks['global_prdblocks']['prd2'];

		if (isset($prd2['status']) && $prd2['status']) {
			$data['prd2']['status']      = $prd2['status'];
			$data['prd2']['cart_ico']    = $this->cssimgpath($factory->getnode($prd2, 'cart_ico'));
			$data['prd2']['wish_ico']    = $this->cssimgpath($factory->getnode($prd2, 'wish_ico'));
			$data['prd2']['compare_ico'] = $this->cssimgpath($factory->getnode($prd2, 'compare_ico'));
			$data['prd2']['more_ico'] = $this->cssimgpath($factory->getnode($prd2, 'more_ico'));
			
			$data['prd2']['offer_img']   = $this->cssimgpath($factory->getnode($prd2['offer_img'], 'img'));
			$data['prd2']['offer_img']  .= $this->cssprop($prd2['offer_img']['tag_w'], 'w');
			$data['prd2']['offer_img']  .= $this->cssprop($prd2['offer_img']['tag_h'], 'h');
			
			$data['prd2']['offer_dis']   = $this->cssimgpath($factory->getnode($prd2, 'offer_discount'));
			$data['prd2']['offer_text']  = $this->cssimgpath($factory->getnode($prd2['offer_text'], 'box'));

			// Grid view
			if ($factory::has($prdblocks['global_prdblocks']['prd2'], 'grid')) {
				$grid_prd2_style = $prdblocks['global_prdblocks']['prd2']['grid']['style'];
				if (isset($grid_prd2_style['status']) && $grid_prd2_style['status']) {
					foreach ($grid_prd2_style['css_data'] as $key => $value) {
						$data['prd2']['grid'][$key] = $value;
					}
				}
			}

			// List view
			if ($factory::has($prdblocks['global_prdblocks']['prd2'], 'list')) {
				$list_prd2_style = $prdblocks['global_prdblocks']['prd2']['list']['style'];
				if (isset($list_prd2_style['status']) && $list_prd2_style['status']) {
					foreach ($list_prd2_style['css_data'] as $key => $value) {
						$data['prd2']['list'][$key] = $value;
					}
				}
			}

			// Normal module view
			if ($factory::has($prdblocks['global_prdblocks']['prd2'], 'normal')) {
				$normal_prd2_style = $prdblocks['global_prdblocks']['prd2']['normal']['style'];
				if (isset($normal_prd2_style['status']) && $normal_prd2_style['status']) {
					foreach ($normal_prd2_style['css_data'] as $key => $value) {
						$data['prd2']['normal'][$key] = $value;
					}
				}
			}
		}
	}

	if ($factory::has($prdblocks['global_prdblocks'], 'prd3')) {
		$prd3 = $factory->node($prdblocks, 'global_prdblocks/prd3', 0,0);

		if (isset($prd3['status']) && $prd3['status']) {
			$data['prd3']['status']      = $prd3['status'];
			$data['prd3']['cart_ico']    = $this->cssimgpath($factory->node($prd3, 'cart_ico', 1)); 
			$data['prd3']['wish_ico']    = $this->cssimgpath($factory->node($prd3, 'wish_ico', 1));
			$data['prd3']['compare_ico'] = $this->cssimgpath($factory->node($prd3, 'compare_ico', 1));
			
			$data['prd3']['offer_img']   = $this->cssimgpath($factory->node($prd3, 'offer_img/img', 1));
			$data['prd3']['offer_img']  .= $factory->node($prd3, 'offer_img/tag_w', 0, 'w');
			$data['prd3']['offer_img']  .= $factory->node($prd3, 'offer_img/tag_h', 0, 'h');
			
			$data['prd3']['offer_dis']   = $this->cssimgpath($factory->node($prd3, 'offer_discount', 1));
			$data['prd3']['offer_text']  = $this->cssimgpath($factory->node($prd3, 'offer_text/box', 1));

			// Grid view
			if ($factory::has($prd3, 'grid')) {
				$grid_prd3_style = $factory->node($prd3, 'grid/style', 0,0);
				if (isset($grid_prd3_style['status']) && $grid_prd3_style['status']) {
					foreach ($grid_prd3_style['css_data'] as $key => $value) {
						$data['prd3']['grid'][$key] = $value;
					}
				}
			}

			// List view
			if ($factory::has($prd3, 'list')) {
				$list_prd3_style = $factory->node($prd3, 'list/style', 0,0);
				if (isset($list_prd3_style['status']) && $list_prd3_style['status']) {
					foreach ($list_prd3_style['css_data'] as $key => $value) {
						$data['prd3']['list'][$key] = $value;
					}
				}
			}

			// Normal module view
			if ($factory::has($prd3, 'normal')) {
				$normal_prd3_style = $factory->node($prd3, 'normal/style', 0,0);
				if (isset($normal_prd3_style['status']) && $normal_prd3_style['status']) {
					foreach ($normal_prd3_style['css_data'] as $key => $value) {
						$data['prd3']['normal'][$key] = $value;
					}
				}
			}
		}
	}

	if ($factory::has($prdblocks['global_prdblocks'], 'prd4')) {
		$prd4 = $factory->node($prdblocks, 'global_prdblocks/prd4', 0,0);

		if (isset($prd4['status']) && $prd4['status']) {
			$data['prd4']['status']      = $prd4['status'];
			$data['prd4']['quickview_ico'] = $this->cssimgpath($factory->node($prd4, 'quickview_ico', 1));
			
			$data['prd4']['offer_img']   = $this->cssimgpath($factory->node($prd4, 'offer_img/img', 1));
			$data['prd4']['offer_img']  .= $factory->node($prd4, 'offer_img/tag_w', 0, 'w');
			$data['prd4']['offer_img']  .= $factory->node($prd4, 'offer_img/tag_h', 0, 'h');
			
			$data['prd4']['offer_dis']   = $this->cssimgpath($factory->node($prd4, 'offer_discount', 1));
			$data['prd4']['offer_text']  = $this->cssimgpath($factory->node($prd4, 'offer_text/box', 1));

			// Grid view
			if ($factory::has($prd4, 'grid')) {
				$grid_prd4_style = $factory->node($prd4, 'grid/style', 0,0);
				if (isset($grid_prd4_style['status']) && $grid_prd4_style['status']) {
					foreach ($grid_prd4_style['css_data'] as $key => $value) {
						$data['prd4']['grid'][$key] = $value;
					}
				}
			}

			// List view
			if ($factory::has($prd4, 'list')) {
				$list_prd4_style = $factory->node($prd4, 'list/style', 0,0);
				if (isset($list_prd4_style['status']) && $list_prd4_style['status']) {
					foreach ($list_prd4_style['css_data'] as $key => $value) {
						$data['prd4']['list'][$key] = $value;
					}
				}
			}

			// Normal module view
			if ($factory::has($prd4, 'normal')) {
				$normal_prd4_style = $factory->node($prd4, 'normal/style', 0,0);
				if (isset($normal_prd4_style['status']) && $normal_prd4_style['status']) {
					foreach ($normal_prd4_style['css_data'] as $key => $value) {
						$data['prd4']['normal'][$key] = $value;
					}
				}
			}
		}
	}

}
if (isset($prdblocks['global_smallprdblocks'])) {
	if ($factory::has($prdblocks['global_smallprdblocks'], 'smallprd1')) {
		$smallprd1 = $prdblocks['global_smallprdblocks']['smallprd1'];
		if (isset($smallprd1['status']) && $smallprd1['status']) {
			foreach ($smallprd1['css_data'] as $key => $value) {
				$data['smallprd1'][$key] = $value;
			}
		}
	}
	if ($factory::has($prdblocks['global_smallprdblocks'], 'smallprd2')) {
		$smallprd2 = $prdblocks['global_smallprdblocks']['smallprd2'];
		if (isset($smallprd2['status']) && $smallprd2['status']) {
			foreach ($smallprd2['css_data'] as $key => $value) {
				$data['smallprd2'][$key] = $value;
			}
		}
	}
}