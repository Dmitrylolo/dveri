<?php
$basicbanners = $this->rgen->storage->get('modtheme_data', 'rgen_basicbanners');
if ($this->chk($basicbanners)) {

	foreach ($basicbanners as $k => $v) {
		if ($this->chk($v)) {
			$bnr = $v;
			if ($v['status']) {
				$data['basicbanners'][$k]['container']                = $factory->getnode($bnr, 'container');
				$data['basicbanners'][$k]['wrapper']                  = $factory->getnode($bnr, 'wrapper');
				$data['basicbanners'][$k]['mod_hd']                   = $factory->getnode($bnr, 'mod_hd');
				$data['basicbanners'][$k]['mod_customhtml']           = $factory->getnode($bnr, 'mod_customhtml');
				$data['basicbanners'][$k]['content_wrp']              = $factory->getnode($bnr, 'content_wrp');
				$data['basicbanners'][$k]['items']                    = $factory->node($bnr, 'items', 1);
				
				$data['basicbanners'][$k]['h_effect1']['background']  = $this->cssprop($bnr['h_effect1']['background'], 'bgcolor');
				$data['basicbanners'][$k]['h_effect1']['overlay']     = $this->cssprop($bnr['h_effect1']['overlay'], 'bgcolor');
				$data['basicbanners'][$k]['h_effect1']['title']       = $factory->getnode($bnr['h_effect1'], 'title');
				$data['basicbanners'][$k]['h_effect1']['description'] = $factory->getnode($bnr['h_effect1'], 'description');
				$data['basicbanners'][$k]['h_effect1']['img_opacity'] = $factory->node($bnr, 'h_effect1/img_opacity', 1, 'opacity');
				$data['basicbanners'][$k]['h_effect1']['img_scale']   = $factory->node($bnr, 'h_effect1/img_scale/normal', 0, 0);
				$data['basicbanners'][$k]['h_effect1']['img_scale_h'] = $factory->node($bnr, 'h_effect1/img_scale/hover', 0, 0);
				
				$data['basicbanners'][$k]['h_effect2']['background']  = $this->cssprop($bnr['h_effect2']['background'], 'bgcolor');
				$data['basicbanners'][$k]['h_effect2']['overlay']     = $this->cssprop($bnr['h_effect2']['overlay'], 'bgcolor');
				$data['basicbanners'][$k]['h_effect2']['title']       = $factory->getnode($bnr['h_effect2'], 'title');
				$data['basicbanners'][$k]['h_effect2']['description'] = $factory->getnode($bnr['h_effect2'], 'description');
				$data['basicbanners'][$k]['h_effect2']['img_opacity'] = $factory->node($bnr, 'h_effect2/img_opacity', 1, 'opacity');
				$data['basicbanners'][$k]['h_effect2']['img_scale']   = $factory->node($bnr, 'h_effect2/img_scale/normal', 0, 0);
				$data['basicbanners'][$k]['h_effect2']['img_scale_h'] = $factory->node($bnr, 'h_effect2/img_scale/hover', 0, 0);
				
				$data['basicbanners'][$k]['h_effect3']['background']  = $this->cssprop($bnr['h_effect3']['background'], 'bgcolor');
				$data['basicbanners'][$k]['h_effect3']['overlay']     = $this->cssprop($bnr['h_effect3']['overlay'], 'bgcolor');
				$data['basicbanners'][$k]['h_effect3']['bdrcolor']    = $this->cssprop($bnr['h_effect3']['bdrcolor'], 'bdrcolor');
				$data['basicbanners'][$k]['h_effect3']['title']       = $factory->getnode($bnr['h_effect3'], 'title');
				$data['basicbanners'][$k]['h_effect3']['description'] = $factory->getnode($bnr['h_effect3'], 'description');
				$data['basicbanners'][$k]['h_effect3']['img_opacity'] = $factory->node($bnr, 'h_effect3/img_opacity', 1, 'opacity');
				$data['basicbanners'][$k]['h_effect3']['img_scale']   = $factory->node($bnr, 'h_effect3/img_scale/normal', 0, 0);
				$data['basicbanners'][$k]['h_effect3']['img_scale_h'] = $factory->node($bnr, 'h_effect3/img_scale/hover', 0, 0);
				
				$data['basicbanners'][$k]['h_effect4']['background']  = $this->cssprop($bnr['h_effect4']['background'], 'bgcolor');
				$data['basicbanners'][$k]['h_effect4']['overlay']     = $this->cssprop($bnr['h_effect4']['overlay'], 'bgcolor');
				$data['basicbanners'][$k]['h_effect4']['title']       = $factory->getnode($bnr['h_effect4'], 'title');
				$data['basicbanners'][$k]['h_effect4']['description'] = $factory->getnode($bnr['h_effect4'], 'description');
				$data['basicbanners'][$k]['h_effect4']['img_opacity'] = $factory->node($bnr, 'h_effect4/img_opacity', 1, 'opacity');
				$data['basicbanners'][$k]['h_effect4']['img_scale']   = $factory->node($bnr, 'h_effect4/img_scale/normal', 0, 0);
				$data['basicbanners'][$k]['h_effect4']['img_scale_h'] = $factory->node($bnr, 'h_effect4/img_scale/hover', 0, 0);
				
				$data['basicbanners'][$k]['h_effect5']['background']  = $this->cssprop($bnr['h_effect5']['background'], 'bgcolor');
				$data['basicbanners'][$k]['h_effect5']['overlay']     = $this->cssprop($bnr['h_effect5']['overlay'], 'bgcolor');
				$data['basicbanners'][$k]['h_effect5']['bdrcolor']    = $this->cssprop($bnr['h_effect5']['bdrcolor'], 'bgcolor');
				$data['basicbanners'][$k]['h_effect5']['title']       = $factory->getnode($bnr['h_effect5'], 'title');
				$data['basicbanners'][$k]['h_effect5']['description'] = $factory->getnode($bnr['h_effect5'], 'description');
				$data['basicbanners'][$k]['h_effect5']['img_opacity'] = $factory->node($bnr, 'h_effect5/img_opacity', 1, 'opacity');
				$data['basicbanners'][$k]['h_effect5']['img_scale']   = $factory->node($bnr, 'h_effect5/img_scale/normal', 0, 0);
				$data['basicbanners'][$k]['h_effect5']['img_scale_h'] = $factory->node($bnr, 'h_effect5/img_scale/hover', 0, 0);
				
				$data['basicbanners'][$k]['h_effect6']['background']  = $this->cssprop($bnr['h_effect6']['background'], 'bgcolor');
				$data['basicbanners'][$k]['h_effect6']['overlay']     = $this->cssprop($bnr['h_effect6']['overlay'], 'bgcolor');
				$data['basicbanners'][$k]['h_effect6']['bdrcolor']    = $this->cssprop($bnr['h_effect6']['bdrcolor'], 'bdrcolor');
				$data['basicbanners'][$k]['h_effect6']['title']       = $factory->getnode($bnr['h_effect6'], 'title');
				$data['basicbanners'][$k]['h_effect6']['description'] = $factory->getnode($bnr['h_effect6'], 'description');
				$data['basicbanners'][$k]['h_effect6']['img_opacity'] = $factory->node($bnr, 'h_effect6/img_opacity', 1, 'opacity');
				$data['basicbanners'][$k]['h_effect6']['img_scale']   = $factory->node($bnr, 'h_effect6/img_scale/normal', 0, 0);
				$data['basicbanners'][$k]['h_effect6']['img_scale_h'] = $factory->node($bnr, 'h_effect6/img_scale/hover', 0, 0);

				// No effect
				$data['basicbanners'][$k]['no_effect']['block']       = $factory->node($bnr, 'block', 1, 0, 'css_normal');
				$data['basicbanners'][$k]['no_effect']['block_h']     = $factory->node($bnr, 'block', 1, 0, 'css_hover');
				$data['basicbanners'][$k]['no_effect']['img']         = $factory->node($bnr, 'img', 1, 0, 'css_normal');
				$data['basicbanners'][$k]['no_effect']['img_h']       = $factory->node($bnr, 'img', 1, 0, 'css_hover');

				// Effect 1
				$data['basicbanners'][$k]['h_effect1']['normal']['background']  = $factory->node($bnr, 'h_effect1/normal/common/background', 1, 'bgcolor');
				$data['basicbanners'][$k]['h_effect1']['normal']['overlay']     = $factory->node($bnr, 'h_effect1/normal/common/overlay', 1, 'bgcolor');
				$data['basicbanners'][$k]['h_effect1']['normal']['title']       = $factory->node($bnr, 'h_effect1/normal/common/title', 1);
				$data['basicbanners'][$k]['h_effect1']['normal']['description'] = $factory->node($bnr, 'h_effect1/normal/common/description', 1);
				$data['basicbanners'][$k]['h_effect1']['normal']['img_opacity'] = $factory->node($bnr, 'h_effect1/normal/common/img_opacity', 1, 'opacity');
				$data['basicbanners'][$k]['h_effect1']['normal']['scale']       = $factory->node($bnr, 'h_effect1/normal/common/scale', 0, 0);

				$data['basicbanners'][$k]['h_effect1']['hover']['background']  = $factory->node($bnr, 'h_effect1/hover/common/background', 1, 'bgcolor');
				$data['basicbanners'][$k]['h_effect1']['hover']['overlay']     = $factory->node($bnr, 'h_effect1/hover/common/overlay', 1, 'bgcolor');
				$data['basicbanners'][$k]['h_effect1']['hover']['title']       = $factory->node($bnr, 'h_effect1/hover/common/title', 1);
				$data['basicbanners'][$k]['h_effect1']['hover']['description'] = $factory->node($bnr, 'h_effect1/hover/common/description', 1);
				$data['basicbanners'][$k]['h_effect1']['hover']['img_opacity'] = $factory->node($bnr, 'h_effect1/hover/common/img_opacity', 1, 'opacity');
				$data['basicbanners'][$k]['h_effect1']['hover']['scale']       = $factory->node($bnr, 'h_effect1/hover/common/scale', 0, 0);

				// Effect 2
				$data['basicbanners'][$k]['h_effect2']['normal']['background']  = $factory->node($bnr, 'h_effect2/normal/common/background', 1, 'bgcolor');
				$data['basicbanners'][$k]['h_effect2']['normal']['overlay']     = $factory->node($bnr, 'h_effect2/normal/common/overlay', 1, 'bgcolor');
				$data['basicbanners'][$k]['h_effect2']['normal']['title']       = $factory->node($bnr, 'h_effect2/normal/common/title', 1);
				$data['basicbanners'][$k]['h_effect2']['normal']['description'] = $factory->node($bnr, 'h_effect2/normal/common/description', 1);
				$data['basicbanners'][$k]['h_effect2']['normal']['img_opacity'] = $factory->node($bnr, 'h_effect2/normal/common/img_opacity', 1, 'opacity');
				$data['basicbanners'][$k]['h_effect2']['normal']['scale']       = $factory->node($bnr, 'h_effect2/normal/common/scale', 0, 0);

				$data['basicbanners'][$k]['h_effect2']['hover']['background']  = $factory->node($bnr, 'h_effect2/hover/common/background', 1, 'bgcolor');
				$data['basicbanners'][$k]['h_effect2']['hover']['overlay']     = $factory->node($bnr, 'h_effect2/hover/common/overlay', 1, 'bgcolor');
				$data['basicbanners'][$k]['h_effect2']['hover']['title']       = $factory->node($bnr, 'h_effect2/hover/common/title', 1);
				$data['basicbanners'][$k]['h_effect2']['hover']['description'] = $factory->node($bnr, 'h_effect2/hover/common/description', 1);
				$data['basicbanners'][$k]['h_effect2']['hover']['img_opacity'] = $factory->node($bnr, 'h_effect2/hover/common/img_opacity', 1, 'opacity');
				$data['basicbanners'][$k]['h_effect2']['hover']['scale']       = $factory->node($bnr, 'h_effect2/hover/common/scale', 0, 0);

				// Effect 3
				$data['basicbanners'][$k]['h_effect3']['normal']['background']  = $factory->node($bnr, 'h_effect3/normal/common/background', 1, 'bgcolor');
				$data['basicbanners'][$k]['h_effect3']['normal']['overlay']     = $factory->node($bnr, 'h_effect3/normal/common/overlay', 1, 'bgcolor');
				$data['basicbanners'][$k]['h_effect3']['normal']['title']       = $factory->node($bnr, 'h_effect3/normal/common/title', 1);
				$data['basicbanners'][$k]['h_effect3']['normal']['description'] = $factory->node($bnr, 'h_effect3/normal/common/description', 1);
				$data['basicbanners'][$k]['h_effect3']['normal']['img_opacity'] = $factory->node($bnr, 'h_effect3/normal/common/img_opacity', 1, 'opacity');
				$data['basicbanners'][$k]['h_effect3']['normal']['scale']       = $factory->node($bnr, 'h_effect3/normal/common/scale', 0, 0);

				$data['basicbanners'][$k]['h_effect3']['hover']['background']  = $factory->node($bnr, 'h_effect3/hover/common/background', 1, 'bgcolor');
				$data['basicbanners'][$k]['h_effect3']['hover']['overlay']     = $factory->node($bnr, 'h_effect3/hover/common/overlay', 1, 'bgcolor');
				$data['basicbanners'][$k]['h_effect3']['hover']['bdrcolor']    = $factory->node($bnr, 'h_effect3/hover/bdrcolor', 1, 'bdrcolor');
				$data['basicbanners'][$k]['h_effect3']['hover']['title']       = $factory->node($bnr, 'h_effect3/hover/common/title', 1);
				$data['basicbanners'][$k]['h_effect3']['hover']['description'] = $factory->node($bnr, 'h_effect3/hover/common/description', 1);
				$data['basicbanners'][$k]['h_effect3']['hover']['img_opacity'] = $factory->node($bnr, 'h_effect3/hover/common/img_opacity', 1, 'opacity');
				$data['basicbanners'][$k]['h_effect3']['hover']['scale']       = $factory->node($bnr, 'h_effect3/hover/common/scale', 0, 0);

				// Effect 4
				$data['basicbanners'][$k]['h_effect4']['normal']['background']  = $factory->node($bnr, 'h_effect4/normal/common/background', 1, 'bgcolor');
				$data['basicbanners'][$k]['h_effect4']['normal']['overlay']     = $factory->node($bnr, 'h_effect4/normal/common/overlay', 1, 'bgcolor');
				$data['basicbanners'][$k]['h_effect4']['normal']['title']       = $factory->node($bnr, 'h_effect4/normal/common/title', 1);
				$data['basicbanners'][$k]['h_effect4']['normal']['description'] = $factory->node($bnr, 'h_effect4/normal/common/description', 1);
				$data['basicbanners'][$k]['h_effect4']['normal']['img_opacity'] = $factory->node($bnr, 'h_effect4/normal/common/img_opacity', 1, 'opacity');
				$data['basicbanners'][$k]['h_effect4']['normal']['scale']       = $factory->node($bnr, 'h_effect4/normal/common/scale', 0, 0);

				$data['basicbanners'][$k]['h_effect4']['hover']['background']  = $factory->node($bnr, 'h_effect4/hover/common/background', 1, 'bgcolor');
				$data['basicbanners'][$k]['h_effect4']['hover']['overlay']     = $factory->node($bnr, 'h_effect4/hover/common/overlay', 1, 'bgcolor');
				$data['basicbanners'][$k]['h_effect4']['hover']['title']       = $factory->node($bnr, 'h_effect4/hover/common/title', 1);
				$data['basicbanners'][$k]['h_effect4']['hover']['description'] = $factory->node($bnr, 'h_effect4/hover/common/description', 1);
				$data['basicbanners'][$k]['h_effect4']['hover']['img_opacity'] = $factory->node($bnr, 'h_effect4/hover/common/img_opacity', 1, 'opacity');
				$data['basicbanners'][$k]['h_effect4']['hover']['scale']       = $factory->node($bnr, 'h_effect4/hover/common/scale', 0, 0);

				// Effect 5
				$data['basicbanners'][$k]['h_effect5']['normal']['background']  = $factory->node($bnr, 'h_effect5/normal/common/background', 1, 'bgcolor');
				$data['basicbanners'][$k]['h_effect5']['normal']['overlay']     = $factory->node($bnr, 'h_effect5/normal/common/overlay', 1, 'bgcolor');
				$data['basicbanners'][$k]['h_effect5']['normal']['bdrcolor']    = $factory->node($bnr, 'h_effect5/normal/bdrcolor', 1, 'bgcolor');
				$data['basicbanners'][$k]['h_effect5']['normal']['title']       = $factory->node($bnr, 'h_effect5/normal/common/title', 1);
				$data['basicbanners'][$k]['h_effect5']['normal']['description'] = $factory->node($bnr, 'h_effect5/normal/common/description', 1);
				$data['basicbanners'][$k]['h_effect5']['normal']['img_opacity'] = $factory->node($bnr, 'h_effect5/normal/common/img_opacity', 1, 'opacity');
				$data['basicbanners'][$k]['h_effect5']['normal']['scale']       = $factory->node($bnr, 'h_effect5/normal/common/scale', 0, 0);

				$data['basicbanners'][$k]['h_effect5']['hover']['background']  = $factory->node($bnr, 'h_effect5/hover/common/background', 1, 'bgcolor');
				$data['basicbanners'][$k]['h_effect5']['hover']['overlay']     = $factory->node($bnr, 'h_effect5/hover/common/overlay', 1, 'bgcolor');
				$data['basicbanners'][$k]['h_effect5']['hover']['bdrcolor']    = $factory->node($bnr, 'h_effect5/hover/bdrcolor', 1, 'bgcolor');
				$data['basicbanners'][$k]['h_effect5']['hover']['title']       = $factory->node($bnr, 'h_effect5/hover/common/title', 1);
				$data['basicbanners'][$k]['h_effect5']['hover']['description'] = $factory->node($bnr, 'h_effect5/hover/common/description', 1);
				$data['basicbanners'][$k]['h_effect5']['hover']['img_opacity'] = $factory->node($bnr, 'h_effect5/hover/common/img_opacity', 1, 'opacity');
				$data['basicbanners'][$k]['h_effect5']['hover']['scale']       = $factory->node($bnr, 'h_effect5/hover/common/scale', 0, 0);

				// Effect 6
				$data['basicbanners'][$k]['h_effect6']['normal']['background']  = $factory->node($bnr, 'h_effect6/normal/common/background', 1, 'bgcolor');
				$data['basicbanners'][$k]['h_effect6']['normal']['overlay']     = $factory->node($bnr, 'h_effect6/normal/common/overlay', 1, 'bgcolor');
				$data['basicbanners'][$k]['h_effect6']['normal']['title']       = $factory->node($bnr, 'h_effect6/normal/common/title', 1);
				$data['basicbanners'][$k]['h_effect6']['normal']['description'] = $factory->node($bnr, 'h_effect6/normal/common/description', 1);
				$data['basicbanners'][$k]['h_effect6']['normal']['img_opacity'] = $factory->node($bnr, 'h_effect6/normal/common/img_opacity', 1, 'opacity');
				$data['basicbanners'][$k]['h_effect6']['normal']['scale']       = $factory->node($bnr, 'h_effect6/normal/common/scale', 0, 0);

				$data['basicbanners'][$k]['h_effect6']['hover']['background']  = $factory->node($bnr, 'h_effect6/hover/common/background', 1, 'bgcolor');
				$data['basicbanners'][$k]['h_effect6']['hover']['overlay']     = $factory->node($bnr, 'h_effect6/hover/common/overlay', 1, 'bgcolor');
				$data['basicbanners'][$k]['h_effect6']['hover']['bdrcolor']    = $factory->node($bnr, 'h_effect6/hover/bdrcolor', 1, 'bdrcolor');
				$data['basicbanners'][$k]['h_effect6']['hover']['title']       = $factory->node($bnr, 'h_effect6/hover/common/title', 1);
				$data['basicbanners'][$k]['h_effect6']['hover']['description'] = $factory->node($bnr, 'h_effect6/hover/common/description', 1);
				$data['basicbanners'][$k]['h_effect6']['hover']['img_opacity'] = $factory->node($bnr, 'h_effect6/hover/common/img_opacity', 1, 'opacity');
				$data['basicbanners'][$k]['h_effect6']['hover']['scale']       = $factory->node($bnr, 'h_effect6/hover/common/scale', 0, 0);

			}
		}
	}
}