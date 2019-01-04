<?php
class ControllerRgenBasicslideshow extends Controller {
	public function index($setting) {

		$data         = array();
		$factory      = $this->rgen->factory;
		$rgenSettings = $this->rgen->rgenSettings->st_data;
		$module_key   = 'basicslideshow';

		require(FILE_CACHING);

		/* Assets
		------------------------*/
		$this->rgen->assets->setJs("rgen/lib/SudoSlider/jquery.properload.js");
		$this->rgen->assets->setJs("rgen/lib/SudoSlider/jquery.sudoSlider.min.js");

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
				if (isset($module_data) && $this->chk($module_data)) {
					$data['module'] = array();
					$data['module']['config'] = $module_common;
					foreach ($module_data as $key => $value) {
						if ($value['status']) {
							$data['module']['data'][] = array(
								'slide' => $this->imgresize($value['item_data']['slide'], $data['settings']['w'], $data['settings']['h']),
								'title' => $this->lngdata($value['item_data']['title']),
								'url'   => $value['item_data']['url'],
								'win'   => $value['item_data']['win'] ? ' target="_blank"' : null
							);
						}
					}
				}

				// Load beside slideshow position modules
				$data['pos_sidess'] = $this->load->controller('common/rgen-positions/besideslides');

				require(FILE_MODULE_RENDER);
				return $output;
			}
		} else {
			return $factory->render($cache_file);
		}
	}

	/* Helper functions
	------------------------*/
	private function img($val){
		return str_replace("../image/","image/",$val);
	}
	private function chk($val){
		return $this->rgen->factory->checkdata($val);
	}
	private function chkstr($val, $str){
		return $this->rgen->factory->checkstr($val, $str);
	}
	private function lngdata($val) {
		$lng = $this->rgen->storage->get('language', 'language');
		return $this->rgen->factory->lngdata($val, $lng);
	}
	private function imgresize($val, $w, $h) {
		$this->load->model('tool/image');
		return $this->rgen->factory->imgresize($val, $w, $h, $this->model_tool_image);
	}


}