<?php
class ControllerRgenPrdpghtml extends Controller {
	public function index($setting) {
		
		$data = array();
		$factory = $this->rgen->factory;

		/* Get module data
		------------------------*/
		$part = explode('.', $setting);

		if (isset($part)) {
			$module_settings      = $this->rgen->storage->get('modules_data', $part[0].'_set');
			$module_settings      = $module_settings[$part[1]]['data'][0];	
			
			$module               = $this->rgen->storage->get('modules_data', $part[0]);
			$module_common        = $factory->node($module, $part[2].'/common', 0, 0);
			$module_data          = $factory->node($module, $part[2].'/data', 0, 0);
			$module_key           = 'prdpghtml';
			
			$data['lng']          = $this->config->get('config_language_id');
			$data['module_name']  = 'rgen-'.$module_key;
			$data['module_id']    = $part[1];
			$data['module_class'] = ' '.$module_key.'-'.$part[2];
			$data['settings']     = $module_settings;

			$current_id = $this->request->get['product_id'];
			$id_list    = array();
			if (isset($data['settings']['products']) && sizeof($data['settings']['products']) > 0) {
				foreach ($data['settings']['products'] as $key => $value) {
					$id_list[] = $value['id'];
				}	
			}

			/* Construct module
			------------------------*/
			if (isset($module_common) && $this->chk($module_common)) {
				$data['modules'] = array();
				$data['modules'] = $module_common;
			}
		}

		/* Render
		------------------------*/
		if ($data['settings']['prd_page'] == 'selected') {
			if (in_array($current_id, $id_list)) {
				if (file_exists(DIR_TEMPLATE . DIR_FRONT_MODULE . $module_key . '.tpl')) {
					return $this->load->view(DIR_FRONT_MODULE . $module_key . '.tpl', $data);
				}
			}	
		}else {
			if (file_exists(DIR_TEMPLATE . DIR_FRONT_MODULE . $module_key . '.tpl')) {
				return $this->load->view(DIR_FRONT_MODULE . $module_key . '.tpl', $data);
			}
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