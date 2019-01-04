<?php
class ControllerRgenGridmanager extends Controller {
	public function index($setting) {
		
		$data         = array();
		$factory      = $this->rgen->factory;
		$rgenSettings = $this->rgen->rgenSettings->st_data;
		$module_key   = 'gridmanager';

		require(FILE_CACHING);

		$part = explode('.', $setting);

		/* Get module data
		------------------------*/
		if ($rgenSettings['cache_'.$module_key] == false || $rgenSettings['cache_'.$module_key] && !file_exists($cache_file)) {

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
								'node_type' => $value['node_type'],
								'row'       => $value['item_data'],
								'columns'   => $this->columnData($value['items'])
							);
						}
					}
				}

				require(FILE_MODULE_RENDER);
				return $output;
			}
		} else {
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
								'node_type' => $value['node_type'],
								'row'       => $value['item_data'],
								'columns'   => $this->columnData($value['items'])
							);
						}
					}
				}
			}

			return $factory->render($cache_file);
		}
	}

	/* Block content functions
	------------------------*/
	private function columnData($arr){
		$tmp = array();
		if (isset($arr) && sizeof($arr) > 0 && is_array($arr)) {
			foreach ($arr as $key => $value) {
				if ($value['status']) {
					//echo "<pre>".print_r($value,true)."</pre>";
					$tmp[] = array(
						'node_type'     => $value['node_type'],
						'col_size'      => $this->rgen->factory->node($value, 'item_data/column/classGroup', 0,0),
						'col_class'     => $this->rgen->factory->node($value, 'item_data/customize/cssclass', 0,0) != '' ? ' '.$this->rgen->factory->node($value, 'item_data/customize/cssclass', 0,0) : null,
						'col_style'     => $this->rgen->factory->node($value, 'item_data/customize/block', 1),
						'col_bg'        => $this->img($this->rgen->factory->node($value, 'item_data/customize/bg_img', 1)),
						'content_items' => $this->itemsData($value['items'])
					);
				}		
			}
		}
		return $tmp;
	}
	private function itemsData($arr)
	{
		//$this->load->controller('module/revslideroutput', $rev_setting);
		$tmp = array();
		if (isset($arr) && sizeof($arr) > 0 && is_array($arr)) {
			foreach ($arr as $key => $value) {
				if ($value['status']) {
					$tmp[] = array(
						'node_type' => $this->rgen->factory->node($value, 'item_data/setting/block_type', 0,0),
						'cssclass' => $this->rgen->factory->node($value, 'item_data/setting/cssclass', 0,0),
						'html'      => $this->lngdata($this->rgen->factory->node($value, 'item_data/setting/html', 0,0)),
						'mod_data'  => $this->moduledata($this->rgen->factory->node($value, 'item_data/setting', 0,0))
					);
				}
			}
		}
		return $tmp;
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
	private function moduledata($val) {
		$mod_name                   = $this->rgen->factory->node($val, 'mod_data/section', 0,0);
		$mod_id                     = $this->rgen->factory->node($val, 'mod_data/key', 0,0);
		
		$mod                        = str_replace("rgen_","",$mod_name);
		$mod_setting                = $this->rgen->factory->node($val, 'mod_setting', 0,0);
		$mod_setting['module_id']   = $mod_id;
		$mod_setting['module_type'] = 'gridmanager';
		$mod_setting['setting_key'] = $mod_name.'.gridmanager.'.$mod_id;

		$mod_output = $this->load->controller('rgen/'.$mod, $mod_setting);

		return $mod_output;
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
	private function imgresize($val, $w, $h) {
		$this->load->model('tool/image');
		return $this->rgen->factory->imgresize($val, $w, $h, $this->model_tool_image);
	}


}