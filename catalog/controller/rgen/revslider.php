<?php
class ControllerRgenRevslider extends Controller {
	public function index($setting) {
		
		$data         = array();
		$factory      = $this->rgen->factory;
		$rgenSettings = $this->rgen->rgenSettings->st_data;
		$module_key   = 'revslider';

		require(FILE_CACHING);
		
		/* Get module data
		------------------------*/
		if ($rgenSettings['cache_'.$module_key] == false || $rgenSettings['cache_'.$module_key] && !file_exists($cache_file)) {
			if ($factory->node($setting, 'module_type', 0,0) == 'gridmanager') {
				$part = explode('.', $factory->node($setting, 'setting_key', 0,0));
			}else{
				$part = explode('.', $setting);	
			}

			if (isset($part)) {
				require(FILE_MODULE_COMMON);

				$data['slider_size']  = $this->rgen->factory->node($data['settings'], 'slider_size', 0,0) != '' ? $this->rgen->factory->node($data['settings'], 'slider_size', 0,0) : 'normal';
				$data['slider_type']  = $this->rgen->factory->node($data['settings'], 'slider_data/params/slider_type', 0,0);

				/* Construct module
				------------------------*/
				if (isset($module_common) && $this->chk($module_common)) {
					$data['modules'] = array();
					$data['modules']['config'] = $module_common;
					//$data['modules'] = $module_common;
				}

				/* Construct slider
				------------------------*/
				if ($this->chk($data['settings']['slider_id'])) {
					$rev_setting = array(
						'slider_id'     => $data['settings']['slider_id'],
						'revslider_key' => 'rgentheme-revo'
					);
					$data['mod_revslider'] = $this->load->controller('module/revslideroutput', $rev_setting);
				}

				require(FILE_MODULE_RENDER);
				return $output;
			}
		} else {
			$this->rgen->assets->setJs('system/config/revslider/rs-plugin/js/jquery.themepunch.tools.min.js');
			$this->rgen->assets->setJs('system/config/revslider/rs-plugin/js/jquery.themepunch.revolution.min.js');

			$this->rgen->assets->setCss('system/config/revslider/rs-plugin/css/settings.css');
			$this->rgen->assets->setCss('system/config/revslider/rs-plugin/css/static-captions.css');
			$this->rgen->assets->setCss('system/config/revslider/rs-plugin/css/dynamic-captions.css');
			$this->rgen->assets->setCss('system/config/revslider/rs-plugin/css/captions.css');

			return $factory->render($cache_file);
		}
	}

	/* Helper functions
	------------------------*/
	private function chk($val){
		return $this->rgen->factory->checkdata($val);
	}
	private function lngdata($val) {
		$lng = $this->rgen->storage->get('language', 'language');
		return $this->rgen->factory->lngdata($val, $lng);
	}


}