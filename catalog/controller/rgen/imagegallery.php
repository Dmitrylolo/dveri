<?php
class ControllerRgenImagegallery extends Controller {
	public function index($setting) {
		
		$data         = array();
		$factory      = $this->rgen->factory;
		$rgenSettings = $this->rgen->rgenSettings->st_data;
		$module_key   = 'imagegallery';

		require(FILE_CACHING);

		/* Assets
		------------------------*/
		$this->rgen->assets->setCss("rgen/lib/PhotoSwipe/photoswipe.css");
		$this->rgen->assets->setCss("rgen/lib/PhotoSwipe/default-skin/default-skin.css");
		$this->rgen->assets->setJs("rgen/lib/minimalist-responsive-grids/jquery.responsivegrid.js");
		$this->rgen->assets->setJs("rgen/lib/PhotoSwipe/photoswipe.min.js");
		$this->rgen->assets->setJs("rgen/lib/PhotoSwipe/photoswipe-ui-default.min.js");

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
					$gt          = $this->rgen->factory->node($content_view, 'gt', 0,0);
					$type        = $this->rgen->factory->node($content_view, 'view', 0,0);
					$resize_type = $this->rgen->factory->node($content_view, 'resize_type', 0,0);
					$base_size   = $this->rgen->factory->node($content_view, 'base_size', 0,0);
					$zoom_icon   = $this->icon($this->rgen->factory->node($content_view, 'zoon_icon', 0,0));
					$url_icon    = $this->icon($this->rgen->factory->node($content_view, 'url_icon', 0,0));

					if ($type == 'masonry') {
						$w = $this->rgen->factory->node($value, 'item_data/setting/w', 0,0);
						$h = $this->rgen->factory->node($value, 'item_data/setting/h', 0,0);
					} else {
						$w = $this->rgen->factory->node($content_view, 'image_w', 0,0);
						$h = $this->rgen->factory->node($content_view, 'image_h', 0,0);
					}

					$tmp[] = array(
						'node_type'          => $value['node_type'],
						'type'               => $type,
						'title_status'       => $this->rgen->factory->node($value, 'item_data/setting/title_status', 0,0),
						'title'              => $this->lngdata($this->rgen->factory->node($value, 'item_data/content/title', 0,0)),
						'description'        => $this->lngdata($this->rgen->factory->node($value, 'item_data/content/description', 0,0)),
						'description_status' => $this->rgen->factory->node($value, 'item_data/setting/description_status', 0,0),
						
						'zoom_icon'          => $zoom_icon != '' ? $zoom_icon : array('type' => 'ico', 'icon' => 'fa fa-plus', 'css'  => ''),
						'url_icon'           => $url_icon != '' ? $url_icon : array('type' => 'ico', 'icon' => 'fa fa-link', 'css'  => ''),
						'image'              => $this->imageData($this->rgen->factory->node($value, 'item_data/setting/image', 0,0), $w, $h, $gt, $type, $resize_type, $base_size),
						'setting'            => $this->rgen->factory->node($value, 'item_data/setting', 0,0)
					);
				}
			}
		}
		return $tmp;
	}

	private function imageData($arr, $w, $h, $gt, $type, $resize_type = '', $base_size = 97){
		$tmp = array();
		if (isset($arr) && sizeof($arr) > 0 && is_array($arr)) {

			if ($type == 'masonry') {
				$img_w = ($w*$base_size)-$gt;
				$img_h = ($h*$base_size)-$gt;
				$resize_type = 'fill';
			} else {
				$img_w = $w;
				$img_h = $h;
			}
			
			$img    = $this->rgen->factory->node($arr, 'img', 0,0);
			$imgurl = DIR_IMAGE.str_replace('../image/', '', $img);
			list($width_orig, $height_orig) = getimagesize($imgurl);
			$tmp = array(
				'img'     => $this->img($img),
				'size'    => $width_orig.'x'.$height_orig,
				'thumb'   => $this->imgresize($img, $img_w, $img_h, $resize_type),
				'img_alt' => $this->lngdata($this->rgen->factory->node($arr, 'alt', 0,0)),
				'url'     => $arr['url'],
				'win'     => $arr['win'] ? ' target="_blank"' : null
			);
			
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
	private function imgresize($val, $w, $h, $resize_type = '') {
		$this->load->model('tool/image');
		return $this->rgen->factory->imgresize($val, $w, $h, $this->model_tool_image, $resize_type);
	}


}