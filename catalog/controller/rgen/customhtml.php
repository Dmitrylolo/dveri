<?php
class ControllerRgenCustomhtml extends Controller {
	public function index($setting) {

		$data         = array();
		$factory      = $this->rgen->factory;
		$rgenSettings = $this->rgen->rgenSettings->st_data;
		$module_key   = 'customhtml';

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
				
				/* Construct module
				------------------------*/
				if (isset($module_common) && $this->chk($module_common)) {
					$data['modules'] = array();
					$data['modules'] = $module_common;
				}

				require(FILE_MODULE_RENDER);
				return $output;
			}

		} else {
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