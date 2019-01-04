<?php
class ControllerRgenStickyhtml extends Controller {
	public function index($setting) {

		$data         = array();
		$factory      = $this->rgen->factory;
		$rgenSettings = $this->rgen->rgenSettings->st_data;
		$module_key   = 'stickyhtml';

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
					$data['modules'] = array(
						'title_status' => $module_common['title_status'],
						'title'        => $this->lngdata($module_common['title']),
						
						'html_status'  => $module_common['html_status'],
						'html'         => $this->lngdata($module_common['html']),
						
						'icon'         => $this->icon($module_common['icon']),
						
						'position'     => $module_common['position'],
						
						'css'          => $module_common['position'] == 'l' ? 
										  'left:-'. $module_common['w'] . 'px;' : 
										  'right:-'. $module_common['w'] . 'px;',

						'top'          => 'top:'. $module_common['top'] . 'px;',
						'w'            => 'width:'. $module_common['w'] . 'px;',
						'cssclass'     => ' '.$module_common['cssclass']
					);
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
		$tmp = array(
			'type' => 'ico',
			'icon' => 'fa fa-info',
			'css'  => ''
		);
		if (isset($arr['status']) && $arr['status']) {
			if ($arr['type'] == 'ico') {
				$tmp = array(
					'type' => $arr['type'],
					'icon' => $arr['icon'],
					'css'  => $arr['css']
				);
			} else {
				$tmp = array(
					'type' => $arr['type'],
					'icon' => $this->rgen->factory->imgpath($arr['image']),
					'css'  => $arr['css']
				);
			}
			return $tmp;
		} else {
			return $tmp;
		}
	}
	private function chk($val){
		return $this->rgen->factory->checkdata($val);
	}
	private function lngdata($val) {
		$lng = $this->rgen->storage->get('language', 'language');
		return $this->rgen->factory->lngdata($val, $lng);
	}


}