<?php
class ControllerRgenBasicbanners extends Controller {
	public function index($setting) {

		$data         = array();
		$factory      = $this->rgen->factory;
		$rgenSettings = $this->rgen->rgenSettings->st_data;
		$module_key   = 'basicbanners';

		require(FILE_CACHING);

		/* Assets
		------------------------*/
		$this->rgen->assets->setCss("catalog/view/theme/".DIR_THEME."/stylesheet/hover-effects.css");

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
					$data['modules'] = array();
					$data['modules']['config'] = $module_common;
					foreach ($module_data as $key => $value) {
						if ($value['status']) {
							$data['modules']['data'][] = array(
								'img'    => $this->imgresize($value['item_data']['banner']['img'], $data['settings']['w'], $data['settings']['h'], 'fill'),
								'title'  => $this->lngdata($value['item_data']['banner']['title']),
								'url'    => $value['item_data']['banner']['url'],
								'win'    => $value['item_data']['banner']['win'] ? ' target="_blank"' : null,
								'h_icon' => $this->icon($value['item_data']['hover']['icon']),
								'cp_title'  => $this->lngdata($value['item_data']['hover']['title']),
								'cp_text'   => $this->lngdata($value['item_data']['hover']['html'])
							);
						}
						//html_entity_decode(, ENT_QUOTES, 'UTF-8')
					}
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
	private function icon($arr) {
		$tmp = array();
		if (isset($arr['status']) && $arr['status']) {
			if ($arr['type'] == 'ico') {
				$tmp = array(
					'type'  => $arr['type'],
					'icon'  => $arr['icon'],
					'css'  => $arr['css']
				);
			} else {
				$tmp = array(
					'type'  => $arr['type'],
					'icon'  => $this->rgen->factory->imgpath($arr['image']),
					'css'  => $arr['css']
				);
			}
			return $tmp;
		} else {
			return false;
		}
	}
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
	private function imgresize($val, $w, $h, $resize_type = '') {
		$this->load->model('tool/image');
		return $this->rgen->factory->imgresize($val, $w, $h, $this->model_tool_image, $resize_type);
	}


}