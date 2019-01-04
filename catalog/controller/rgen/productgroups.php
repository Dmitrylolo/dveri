<?php
class ControllerRgenProductgroups extends Controller {
	public function index($setting) {

		$data         = array();
		$factory      = $this->rgen->factory;
		$rgenSettings = $this->rgen->rgenSettings->st_data;
		$module_key   = 'productgroups';

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
				if (isset($module_data) && $this->chk($module_data)) {
					$data['modules'] = array();
					$data['modules']['config'] = $module_common;
					foreach ($module_data as $key => $value) {
						if ($value['status']) {
							$data['modules']['data'][] = array(
								'type'         => $value['node_type'],
								'title_status' => $value['item_data']['content']['title_status'],
								'title'        => $this->lngdata($value['item_data']['content']['title']),
								'prd_style'    => $value['item_data']['setting']['prd_style'],
								'prd_view'     => $value['item_data']['setting']['prd_view'],
								'prd_limit'    => $value['item_data']['setting']['prd_limit'],
								'grids'        => isset($value['item_data']['setting']['grids']['classGroup']) ? ' '.$value['item_data']['setting']['grids']['classGroup'] : ' eq4 d-eq4 t-eq4 mxl-eq2 msm-eq2 mxs-eq1 gt10 mb10',
								'carousel'     => $value['item_data']['setting']['carousel'],
								'cssclass'     => $value['item_data']['setting']['cssclass'],
								'h_counter'    => $factory->node($value, 'item_data/setting/h_counter', 0,0),
								'products'     => $this->getProducts($value['node_type'], $value['item_data']['setting'])
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

	/* Product functions
	------------------------*/
	private function getProducts($type, $arr) {
		$this->load->model('catalog/product');
		$tmp = array();

		switch ($type) {
			case 'special':
				$filter_data = array(
					'sort'  => 'pd.name',
					'order' => 'ASC',
					'start' => 0,
					'limit' => $arr['prd_limit']
				);
				$results = $this->model_catalog_product->getProductSpecials($filter_data);

				$img_w = isset($arr['image_w']) ? $arr['image_w'] : 250;
				$img_h = isset($arr['image_h']) ? $arr['image_h'] : 250;

				return $this->products($results, $img_w, $img_h, $arr);
				break;

			case 'latest':
				$filter_data = array(
					'sort'  => 'p.date_added',
					'order' => 'DESC',
					'start' => 0,
					'limit' => $arr['prd_limit']
				);
				$results = $this->model_catalog_product->getProducts($filter_data);
				
				$img_w = isset($arr['image_w']) ? $arr['image_w'] : 250;
				$img_h = isset($arr['image_h']) ? $arr['image_h'] : 250;

				return $this->products($results, $img_w, $img_h, $arr);
				break;

			case 'best':

				$results = $this->model_catalog_product->getBestSellerProducts($arr['prd_limit']);
				
				$img_w = isset($arr['image_w']) ? $arr['image_w'] : 250;
				$img_h = isset($arr['image_h']) ? $arr['image_h'] : 250;

				return $this->products($results, $img_w, $img_h, $arr);
				break;

			case 'category':
				if (isset($arr['category']['id'])) {
					$filter_data = array(
						'filter_category_id' => $arr['category']['id'],
						'filter_filter'      => '',
						'sort'               => 'p.sort_order',
						'order'              => 'ASC',
						'start'              => 0,
						'limit'              => $arr['prd_limit']
					);

					$results = $this->model_catalog_product->getProducts($filter_data);
					
					$img_w = isset($arr['image_w']) ? $arr['image_w'] : 250;
					$img_h = isset($arr['image_h']) ? $arr['image_h'] : 250;

					return $this->products($results, $img_w, $img_h, $arr);
				}
				break;

			case 'brand':
				if (isset($arr['brand']['id'])) {
					$filter_data = array(
						'filter_manufacturer_id' => $arr['brand']['id'],
						'sort'                   => 'p.sort_order',
						'order'                  => 'ASC',
						'start'                  => 0,
						'limit'                  => $arr['prd_limit']
					);

					$results = $this->model_catalog_product->getProducts($filter_data);
					
					$img_w = isset($arr['image_w']) ? $arr['image_w'] : 250;
					$img_h = isset($arr['image_h']) ? $arr['image_h'] : 250;

					return $this->products($results, $img_w, $img_h, $arr);
				}
				break;

			case 'custom':
				if (isset($arr['products']) && sizeof($arr['products']) > 0) {
					foreach ($arr['products'] as $key => $value) {
						$results[] = $this->model_catalog_product->getProduct($value['id']);
					}
					$img_w = isset($arr['image_w']) ? $arr['image_w'] : 250;
					$img_h = isset($arr['image_h']) ? $arr['image_h'] : 250;

					return $this->products($results, $img_w, $img_h, $arr);
				}
				break;
		}
	}

	private function products($results, $img_w, $img_h, $arr) {
		$this->load->model('rgen/rgen');

		$tmp = array();
		if (isset($results) && sizeof($results) > 0) {
			foreach ($results as $result) {
				$image = $this->imgresize($result['image'], $img_w, $img_h);

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

				$tmp[] = array(
					'product_id'  => $result['product_id'],
					'thumb'       => $image,
					'name'        => $result['name'],
					'description' => utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, $this->config->get('config_product_description_length')) . '..',
					'price'       => $price,
					'special'     => $special,
					'tax'         => $tax,
					'rating'      => $rating,
					'href'        => $this->url->link('product/product', 'product_id=' . $result['product_id']),
					'end_date'    => $this->rgen->factory->node($arr, 'counter', 0,0) ? $this->model_rgen_rgen->getDate($result['product_id']) : false
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
	private function imgresize($val, $w, $h) {
		$this->load->model('tool/image');
		return $this->rgen->factory->imgresize($val, $w, $h, $this->model_tool_image);
	}


}