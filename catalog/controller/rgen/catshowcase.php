<?php
class ControllerRgenCatshowcase extends Controller {
	public function index($setting) {

		$data         = array();
		$factory      = $this->rgen->factory;
		$rgenSettings = $this->rgen->rgenSettings->st_data;
		$module_key   = 'catshowcase';

		require(FILE_CACHING);

		/* Assets
		------------------------*/
		/*$this->rgen->assets->setCss("catalog/view/theme/".DIR_THEME."/stylesheet/hover-effects.css");*/

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
				//echo "<pre>".print_r($data['modules'],true)."</pre>";

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
						
						'title_status'  => $this->rgen->factory->node($value, 'item_data/content_view/title/status', 0,0), 
						'title'         => $this->lngdata($this->rgen->factory->node($value, 'item_data/content_view/title/text', 0,0)), 
						'title_css'     => $this->rgen->factory->node($value, 'item_data/content_view/title/block', 1), 
						'cssclass'      => $this->rgen->factory->node($value, 'item_data/content_view/cssclass', 0,0), 

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
					$parent_data = array(
						'id'               => $this->rgen->factory->node($value, 'item_data/setting/category/id', 0,0),
						'img'              => $this->rgen->factory->node($value, 'item_data/setting/custom_img', 0,0),
						'img_w'            => $this->rgen->factory->node($value, 'item_data/setting/image_w', 0,0),
						'img_h'            => $this->rgen->factory->node($value, 'item_data/setting/image_h', 0,0),
						'resize_type'      => $this->rgen->factory->node($value, 'item_data/setting/resize_type', 0,0),
						'text_limit'       => $this->rgen->factory->node($value, 'item_data/setting/description_limit', 0,0),
						
						'image_type'       => $this->rgen->factory->node($value, 'item_data/setting/img_type', 0,0),
						'image'            => $this->rgen->factory->node($value, 'item_data/setting/custom_img', 0,0),
						
						'title_type'       => $this->rgen->factory->node($value, 'item_data/setting/title', 0,0),
						'title'            => $this->lngdata($this->rgen->factory->node($value, 'item_data/content/title', 0,0)),
						
						'description_type' => $this->rgen->factory->node($value, 'item_data/setting/description', 0,0),
						'description'      => $this->lngdata($this->rgen->factory->node($value, 'item_data/content/description', 0,0)),
						
						'button'           => $this->lngdata($this->rgen->factory->node($value, 'item_data/content/btn_text', 0,0)),
						
						'sub_image_w'      => $this->rgen->factory->node($value, 'item_data/setting/sub_image_w', 0,0),
						'sub_image_h'      => $this->rgen->factory->node($value, 'item_data/setting/sub_image_h', 0,0),
						'sub_limit'        => $this->rgen->factory->node($value, 'item_data/setting/sub_limit', 0,0)
						
					);
					$parent_category = $this->categories($parent_data);
					
					$tmp[] = array(
						'node_type'          => $value['node_type'],
						'category_data'      => $this->categories($parent_data),
						'title_status'       => $this->rgen->factory->node($value, 'item_data/setting/title_status', 0,0),
						'description_status' => $this->rgen->factory->node($value, 'item_data/setting/description_status', 0,0),
						'button_status'      => $this->rgen->factory->node($value, 'item_data/setting/button_status', 0,0),
						'btn_style'          => $this->rgen->factory->node($value, 'item_data/setting/btn_style', 0,0),
						'cssclass'           => $this->rgen->factory->node($value, 'item_data/setting/cssclass', 0,0),
						'sub_limit'          => $this->rgen->factory->node($value, 'item_data/setting/sub_limit', 0,0),
						'sub_status'         => $this->rgen->factory->node($value, 'item_data/setting/sub_status', 0,0)
					);
				}
			}
		}
		return $tmp;
	}

	/* Category generator
	------------------------*/
	private function categories($data) {
		$this->load->model('catalog/category');
		$this->load->model('tool/image');
		$category = $this->model_catalog_category->getCategory((int)$data['id']);

		$tmp = array();
		
		if (isset($category['status'])) {
			
			$sub_cat_data = array(
				'id' => (int)$data['id'],
				'image_w'      => $data['sub_image_w'],
				'image_h'      => $data['sub_image_h'],
				'limit'        => $data['sub_limit']
			);

			if ($category['status']) {
				$imgscr = $category['image'] ? $category['image'] : 'no_image.jpg';
				$image = $data['image_type'] == 'default' ? $this->imgresize($imgscr, $data['img_w'], $data['img_h'], $data['resize_type']) : $this->imgresize($data['image'], $data['img_w'], $data['img_h'], $data['resize_type']);
				$tmp = array(
					'status'         => $category['status'],
					'sort_order'     => $category['sort_order'],
					'category_id'    => $category['category_id'],
					'title'          => $data['title_type'] == 'default' ? html_entity_decode($category['name'], ENT_QUOTES, 'UTF-8') : html_entity_decode($data['title'][$this->config->get('config_language_id')], ENT_QUOTES, 'UTF-8'),
					'description'    => $data['description_type'] == 'default' ? utf8_substr(strip_tags(html_entity_decode($category['description'], ENT_QUOTES, 'UTF-8')), 0, (int)$data['text_limit']) . '..' : html_entity_decode($data['description'][$this->config->get('config_language_id')], ENT_QUOTES, 'UTF-8'),
					'image'          => $image,
					'image_w'        => $data['img_w'],
					'image_h'        => $data['img_h'],
					'url'            => $this->url->link('product/category', 'path=' . $data['id']),
					'button'         => html_entity_decode($data['button'][$this->config->get('config_language_id')], ENT_QUOTES, 'UTF-8'),
					'sub_categories' => $this->subcategories($sub_cat_data)
				);
			}
		}
		
		return $tmp;
	}
	private function subcategories($data) {
		$this->load->model('catalog/category');
		$this->load->model('tool/image');
		$catlist = array_slice($this->model_catalog_category->getCategories((int)$data['id']), 0, ($data['limit']));
		$tmp = array();
		if (isset($catlist)) {
			foreach ($catlist as $key => $category) {
				if (isset($category['status']) && $category['status']) {

					$imgscr = $category['image'] ? $category['image'] : 'no_image.jpg';
					$image = $this->imgresize($imgscr, $data['image_w'], $data['image_h']);

					$sub_cat_data = array(
						'id'      => (int)$category['category_id'],
						'image_w' => $data['image_w'],
						'image_h' => $data['image_h'],
						'limit'   => $data['limit']
					);

					$tmp[$key] = array(
						'status'         => $category['status'],
						'sort_order'     => $category['sort_order'],
						'category_id'    => $category['category_id'],
						'title'          => $category['name'],
						'image'          => $image,
						'image_w'        => $data['image_w'],
						'image_h'        => $data['image_h'],
						'url'            => $this->url->link('product/category', 'path=' . (int)$data['id'] . '_' . $category['category_id']),
						'sub_categories' => $this->subcategories($sub_cat_data)
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