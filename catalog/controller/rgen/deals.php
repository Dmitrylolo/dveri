<?php
class ControllerRgenDeals extends Controller {
	public function index($setting) {

		$data         = array();
		$factory      = $this->rgen->factory;
		$rgenSettings = $this->rgen->rgenSettings->st_data;
		$module_key   = 'deals';

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
					$config_data = array(
						'prd_id'           => $this->rgen->factory->node($value, 'item_data/setting/products/id', 0,0),

						'resize_type'      => $this->rgen->factory->node($content_view, 'image_size/resize_type', 0,0),
						'img'              => $this->rgen->factory->node($value, 'item_data/setting/custom_img', 0,0),
						'img_w'            => $this->rgen->factory->node($content_view, 'image_size/main_w', 0,0),
						'img_h'            => $this->rgen->factory->node($content_view, 'image_size/main_h', 0,0),
						
						'sub_image_status' => $this->rgen->factory->node($value, 'item_data/setting/sub_image_status', 0,0),
						'sub_image_w'      => $this->rgen->factory->node($content_view, 'image_size/sub_w', 0,0),
						'sub_image_h'      => $this->rgen->factory->node($content_view, 'image_size/sub_h', 0,0),
						
						'image_type'       => $this->rgen->factory->node($value, 'item_data/setting/img_type', 0,0),
						'image'            => $this->rgen->factory->node($value, 'item_data/setting/custom_img', 0,0),
						
						'title_type'       => $this->rgen->factory->node($value, 'item_data/setting/title', 0,0),
						'title'            => $this->lngdata($this->rgen->factory->node($value, 'item_data/content/title', 0,0)),
						
						'text_limit'       => $this->rgen->factory->node($value, 'item_data/setting/description_limit', 0,0),
						'description_type' => $this->rgen->factory->node($value, 'item_data/setting/description', 0,0),
						'description'      => $this->lngdata($this->rgen->factory->node($value, 'item_data/content/description', 0,0)),
						
						'button'           => $this->lngdata($this->rgen->factory->node($value, 'item_data/content/btn_text', 0,0))
					);

					
					$tmp[] = array(
						'node_type'          => $value['node_type'],
						
						'img_position'       => $this->rgen->factory->node($value, 'item_data/setting/img_position', 0,0),

						'cat_status'         => $this->rgen->factory->node($value, 'item_data/setting/cat_status', 0,0),
						'rating_status'      => $this->rgen->factory->node($value, 'item_data/setting/rating_status', 0,0),
						'description_status' => $this->rgen->factory->node($value, 'item_data/setting/description_status', 0,0),
						'cart_status'        => $this->rgen->factory->node($value, 'item_data/setting/cart_status', 0,0),
						'wishlist_status'    => $this->rgen->factory->node($value, 'item_data/setting/wishlist_status', 0,0),
						'compare_status'     => $this->rgen->factory->node($value, 'item_data/setting/compare_status', 0,0),
						
						'btn_text'           => $this->rgen->factory->node($value, 'item_data/content/btn_text', 0,0) ? 
											    $this->lngdata($this->rgen->factory->node($value, 'item_data/content/btn_text', 0,0)) : false,

						'cssclass'           => $this->rgen->factory->node($value, 'item_data/setting/cssclass', 0,0),
						'sub_image_status'   => $this->rgen->factory->node($value, 'item_data/setting/sub_image_status', 0,0),
						'product_data'       => $this->getProducts($config_data)
					);
				}
			}
		}
		return $tmp;
	}

	/* Product functions
	------------------------*/
	private function getProducts($config_data) {
		$this->load->model('catalog/product');
		$tmp = array();
		if (isset($config_data['prd_id'])) {
			$result = $this->model_catalog_product->getProduct($config_data['prd_id']);

			if (isset($result)) {
				if ($result['status']) {
					return $this->products($result, $config_data);
				} else {
					return false;	
				}
			} else {
				return false;
			}
		}
	}

	private function products($result, $config_data) {
		$this->load->model('rgen/rgen');
		$tmp = array();

		$imgscr = $result['image'] ? $result['image'] : 'no_image.jpg';
		$image  = $config_data['image_type'] == 'default' ? $imgscr : $config_data['image'];
		$spacer = $this->imgresize('spacer.png', $config_data['img_w'], $config_data['img_h']);

		$th_images = array();
		$th_data = $this->model_catalog_product->getProductImages($result['product_id']);
		if ($th_data) {
			$i = 0;
			foreach ($th_data as $th) {
				if ($i < 3) {
					$th_images[] = array(
						'img' => $this->imgresize($th['image'], $config_data['img_w'], $config_data['img_h'], $config_data['resize_type']),
						'th'  => $this->imgresize($th['image'], $config_data['sub_image_w'], $config_data['sub_image_h'], $config_data['resize_type']),
					);
				}
			$i++; }
		}

		$main_img = array(
			'img' => $this->imgresize($image, $config_data['img_w'], $config_data['img_h'], $config_data['resize_type']),
			'th'  => $this->imgresize($image, $config_data['sub_image_w'], $config_data['sub_image_h'], $config_data['resize_type']),
		);
		array_unshift($th_images, $main_img);
		
		$name = $config_data['title_type'] == 'default' ? 
				html_entity_decode($result['name'], ENT_QUOTES, 'UTF-8') : 
				html_entity_decode($config_data['title'][$this->config->get('config_language_id')], ENT_QUOTES, 'UTF-8');

		$description = $config_data['description_type'] == 'default' ? 
					   utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, $config_data['text_limit']) . '..' :
					   html_entity_decode($config_data['description'][$this->config->get('config_language_id')], ENT_QUOTES, 'UTF-8');

		if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
			$price = $this->currency->format($this->tax->calculate($result['price'], $result['tax_class_id'], $this->config->get('config_tax')));
		} else {
			$price = false;
		}

		if ((float)$result['special']) {
			$special = $this->currency->format($this->tax->calculate($result['special'], $result['tax_class_id'], $this->config->get('config_tax')));
		} else {
			$special = false;
		}

		if ($this->config->get('config_tax')) {
			$tax = $this->currency->format((float)$result['special'] ? $result['special'] : $result['price']);
		} else {
			$tax = false;
		}

		if ($this->config->get('config_review_status')) {
			$rating = $result['rating'];
		} else {
			$rating = false;
		}

		$cat_data = $this->model_rgen_rgen->prdCategorylink($result['product_id']);
		$cat_info = array();
		if ($cat_data) {
			foreach ($cat_data as $key => $value) {
				if ($value['status']) {
					$cat_info[] = array(
						'name' => $value['name'],
						'url'  => $this->url->link('product/category', 'path=' . $value['category_id'])
					);
				}
			}
		}

		$tmp = array(
			'product_id'  => $result['product_id'],
			'spacer'      => $spacer,
			'image'       => $this->imgresize($image, $config_data['img_w'], $config_data['img_h'], $config_data['resize_type']),
			'th_image'    => $th_images,
			'name'        => $name,
			'description' => $description,
			'price'       => $price,
			'special'     => $special,
			'tax'         => $tax,
			'rating'      => $rating,
			'href'        => $this->url->link('product/product', 'product_id=' . $result['product_id']),
			'end_date'    => $this->model_rgen_rgen->getDate($result['product_id']),
			'cat_info'    => $cat_info
		);

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