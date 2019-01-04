<?php
class ControllerRgenBannergrids extends Controller {
	public function index($setting) {

		$data         = array();
		$factory      = $this->rgen->factory;
		$rgenSettings = $this->rgen->rgenSettings->st_data;
		$module_key   = 'bannergrids';

		require(FILE_CACHING);

		/* Assets
		------------------------*/
		$this->rgen->assets->setCss("catalog/view/theme/".DIR_THEME."/stylesheet/hover-effects.css");

		$this->rgen->assets->setJs("rgen/lib/minimalist-responsive-grids/jquery.responsivegrid.js");
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
			return $factory->render($cache_file);
		}
	}

	/* Block content functions
	------------------------*/
	private function columnData($arr)
	{
		$tmp = array();
		if (isset($arr) && sizeof($arr) > 0 && is_array($arr)) {
			foreach ($arr as $key => $value) {
				if ($value['status']) {
					$tmp[] = array(
						'node_type'     => $value['node_type'],
						'col_size'      => $this->rgen->factory->node($value, 'item_data/column/classGroup', 0,0),
						'content_view'  => $this->rgen->factory->node($value, 'item_data/content_view', 0,0),
						'content_items' => $this->itemsData($value['items'], $this->rgen->factory->node($value, 'item_data/content_view', 0,0))
					);
				}		
			}
		}
		return $tmp;
	}
	private function itemsData($arr, $content_view)
	{
		$tmp = array();
		if (isset($arr) && sizeof($arr) > 0 && is_array($arr)) {
			foreach ($arr as $key => $value) {
				if ($value['status']) {
					$w    = $this->rgen->factory->node($value, 'item_data/setting/w', 0,0);
					$h    = $this->rgen->factory->node($value, 'item_data/setting/h', 0,0);
					$gt   = $this->rgen->factory->node($content_view, 'gt', 0,0);
					$type = $this->rgen->factory->node($value, 'item_data/setting/type', 0,0);
					
					$tmp[] = array(
						'node_type'          => $value['node_type'],
						
						'title_status'       => $this->rgen->factory->node($value, 'item_data/setting/title_status', 0,0),
						'title'              => $this->lngdata($this->rgen->factory->node($value, 'item_data/content/title', 0,0)),
						
						'description_status' => $this->rgen->factory->node($value, 'item_data/setting/description_status', 0,0),
						'description'        => $this->lngdata($this->rgen->factory->node($value, 'item_data/content/description', 0,0)),
						
						//'btn_text'           => $this->lngdata($this->rgen->factory->node($value, 'item_data/content/btn_text', 0,0)),
						'type'    => $type,
						'images'  => $type == 'slider' ? 
									 $this->imageData($this->rgen->factory->node($value, 'item_data/setting/slide_images', 0,0), $w, $h, $gt, $type) :
									 $this->imageData($this->rgen->factory->node($value, 'item_data/setting/bnr_image', 0,0), $w, $h, $gt, $type),
						'setting'     => $this->rgen->factory->node($value, 'item_data/setting', 0,0)
					);
				}
			}
		}
		return $tmp;
	}

	private function imageData($arr, $w, $h, $gt, $type){
		$tmp = array();
		if (isset($arr) && sizeof($arr) > 0 && is_array($arr)) {
			if ($type == 'slider') {
				foreach ($arr as $key => $value) {
					$img   = $this->rgen->factory->node($value, 'img', 0,0);
					$img_w = ($w*107)-$gt;
					$img_h = ($h*107)-$gt;
					$tmp[] = array(
						'img'     => $this->imgresize($img, "slider", $img_h, 'fill'),
						'img_alt' => $this->lngdata($this->rgen->factory->node($value, 'alt', 0,0)),
						'url'     => $value['url'],
						'win'     => $value['win'] ? ' target="_blank"' : null
					);
				}
			}

			if ($type == 'normal') {
				$img   = $this->rgen->factory->node($arr, 'img', 0,0);
				$img_w = ($w*107)-$gt;
				$img_h = ($h*107)-$gt;
				$tmp = array(
					'img'     => $this->imgresize($img, $img_w, $img_h, 'fill'),
					'img_alt' => $this->lngdata($this->rgen->factory->node($arr, 'alt', 0,0)),
					'url'     => $arr['url'],
					'win'     => $arr['win'] ? ' target="_blank"' : null
				);
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
	/*private function imgresize($val, $w, $h) {
		$this->load->model('tool/image');
		return $this->rgen->factory->imgresize($val, $w, $h, $this->model_tool_image);
	}*/

	private function imgresize($val, $w, $h, $resize_type = '') {
		$this->load->model('tool/image');
		return $this->rgen->factory->imgresize($val, $w, $h, $this->model_tool_image, $resize_type);
	}

}