<?php
class ControllerRgenPrdpgtabs extends Controller {
	public function index($setting) {
		$data = array();

		$factory = $this->rgen->factory;

		$part = explode('.', $setting);	
		
		if (isset($part)) {
			$module_settings      = $this->rgen->storage->get('modules_data', $part[0].'_set');
			$module_settings      = $module_settings[$part[1]]['data'][0];	
			
			$module               = $this->rgen->storage->get('modules_data', $part[0]);
			//$module_common        = $module[$part[2]]['common'];
			$module_data          = $factory->node($module, $part[2].'/data', 0, 0);
			$module_key           = 'prdpgtabs';
			
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
			if (isset($module_data) && $this->chk($module_data)) {
				$data['modules'] = array();
				foreach ($module_data as $key => $value) {
					if ($value['status']) {
						$data['modules']['data'][] = array(
							'tab_id'      => $factory->uid(),
							'title'       => $this->lngdata($this->rgen->factory->node($value, 'item_data/content/title', 0,0)),
							'description' => $this->lngdata($this->rgen->factory->node($value, 'item_data/content/description', 0,0)),
						);
					}
				}
			}
		}

		/* Render
		------------------------*/
		if ($data['settings']['prd_page'] == 'selected') {
			if (in_array($current_id, $id_list)) {
				return $data;
			}	
		}else {
			return $data;
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