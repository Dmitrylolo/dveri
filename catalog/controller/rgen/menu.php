<?php
class ControllerRgenMenu extends Controller {
	public function index($setting) {

		$data         = array();
		$factory      = $this->rgen->factory;
		$rgenSettings = $this->rgen->rgenSettings->st_data;
		$module_key   = 'menu';

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

				/* Construct menu
				------------------------*/
				if (isset($module_data) && $this->chk($module_data)) {
					$data['menu'] = array();
					foreach ($module_data as $key => $value) {
						$item_data = $value['item_data'];

						if ($value['status']) {
							$data['menu'][$item_data['node'].'_'.$key] = array(
								'item_title'         => $this->lngdata($value['item_data']['title']),
								'item_url'           => $item_data['url'],
								'item_icon'          => $this->icon($item_data['icon']),
								'item_icon_position' => isset($item_data['icon_position']) ? $item_data['icon_position'] : 'l',
								'item_icon_style'    => $this->rgen->factory->node($item_data, 'icon_block', 1),
								//'item_icon'        => $item_data['icon'],
								'item_class'         => $item_data['css_class'],
								'label_data'         => $this->label($item_data['label']),
								'submenu_type'       => $item_data['submenu_type'],
								'submenu_size'       => $item_data['submenu_size'],
								'submenu'            => $this->chk($value['items']) ? $this->submenu($value['items'], $data['lng']) : array()
							);
						}
					}

					foreach ($data['menu'] as $a => $v) {
						if ($v['submenu_type'] == 'fly') {
							$i = 1;
							foreach ($v['submenu'] as $b => $sub) {
								if (isset($sub['nested_item'])) {
									$data['menu'][$a]['submenu'][$b]['navfly'] = $this->navfly_factory($sub['nested_item'], $sub['item_type'], $data['lng']);
								}
								$i++; 
							}
						}
						if ($v['submenu_type'] == 'mega') {
							$i = 1;
							if (isset($v['submenu'])) {
							foreach ($v['submenu'] as $b => $row) {
								if (isset($row['nested_item'])) {
								foreach ($row['nested_item'] as $c => $col) {
									if (isset($col['nested_item'])) {
									foreach ($col['nested_item'] as $d => $item) {
										if (isset($item['nested_item'])) {
										foreach ($item['nested_item'] as $e => $level_0) {
											if (isset($level_0['nested_item'])) {
												// Main 	   > 	 row 	  > 	  col 		> 		item 	    > 	  level_0 	   >  nav fly
												$data['menu'][$a]['submenu'][$b]['nested_item'][$c]['nested_item'][$d]['nested_item'][$e]['navfly'] = $this->navfly_factory($level_0['nested_item'], $level_0['item_type'], $data['lng']);
											}
										}}
									}}
								}}
							}}
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

	/* Helper functions
	------------------------*/
	private function icon($arr) {
		$tmp = array();
		if ($arr['status']) {
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
	private function label($arr) {
		$tmp = array();
		if ($arr['status']) {
			//echo "<pre>".print_r($this->rgen->factory->imgpath($arr['image']),true)."</pre>";
			$tmp = array(
				'status'    => $arr['status'],
				'type'      => $arr['type'],
				'text'      => $arr['text'],
				'image'     => $this->rgen->factory->imgpath($arr['image']),
				'img_w'     => isset($arr['img_w']) ? 'width:'.$arr['img_w'].'px;' : null,
				'css'       =>  'background-color: '.$arr['background'].';'. 
								'color: '.$arr['text_color'].';' . 
								'font-size: '.$arr['text_size'].';' . 
								$this->rgen->factory->node($arr, 'block', 1),
				'top'       => isset($arr['top']) ? 'top: '.$arr['top'].'px;' : null,
				'left'      => isset($arr['left']) ? 'left: '.$arr['left'].'px;' : null,
				'arrowcss'  => 'color: '.$arr['background'].';',
				'css_class' => $arr['css_class']
			);
			return $tmp;
		} else {
			return false;
		}
	}
	private function img($val){
		$tmp = $val;
		return $this->rgen->factory->getimgcss($tmp);
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


	/* Sub-menu generator
	------------------------*/
	private function submenu($arr, $l){
		$sub = array();
		foreach ($arr as $k => $v) {
			if (isset($v) && $v['status']) {
				$subitem_data = $v['item_data'];

				if ($subitem_data['node'] == 'item') {
					switch ($subitem_data['item_type']) {
						case 'normal':
							$sub[$subitem_data['node'].'_'.$k]['status']      = $v['status'];
							$sub[$subitem_data['node'].'_'.$k]['node']        = $subitem_data['node'];
							$sub[$subitem_data['node'].'_'.$k]['item_type']   = isset($subitem_data['item_type']) ? $subitem_data['item_type'] : $subitem_data['node'];
							$sub[$subitem_data['node'].'_'.$k]['item_data']   = $this->submenu_process($subitem_data, $l);
							$sub[$subitem_data['node'].'_'.$k]['nested_item'] = $this->chk($v['items']) ? $this->submenu($v['items'], $l) : null;
							break;

						case 'cat':
							$sub[$subitem_data['node'].'_'.$k]['status']      = $v['status'];
							$sub[$subitem_data['node'].'_'.$k]['node']        = $subitem_data['node'];
							$sub[$subitem_data['node'].'_'.$k]['item_type']   = isset($subitem_data['item_type']) ? $subitem_data['item_type'] : $subitem_data['node'];
							$sub[$subitem_data['node'].'_'.$k]['item_data']   = $this->submenu_process($subitem_data, $l);
							$sub[$subitem_data['node'].'_'.$k]['nested_item'] = $this->subcategories($subitem_data['sub_item']['category']['id'], $subitem_data['node'], $subitem_data['item_type'], $subitem_data['sub_item']['image_w'], $subitem_data['sub_item']['image_h']);
							break;

						case 'prd':
							$sub[$subitem_data['node'].'_'.$k]['status']      = $v['status'];
							$sub[$subitem_data['node'].'_'.$k]['node']        = $subitem_data['node'];
							$sub[$subitem_data['node'].'_'.$k]['item_type']   = isset($subitem_data['item_type']) ? $subitem_data['item_type'] : $subitem_data['node'];
							$sub[$subitem_data['node'].'_'.$k]['item_data']   = $this->submenu_process($subitem_data, $l);
							$sub[$subitem_data['node'].'_'.$k]['nested_item'] = array();
							break;

						case 'brand':
							$sub[$subitem_data['node'].'_'.$k]['status']      = $v['status'];
							$sub[$subitem_data['node'].'_'.$k]['node']        = $subitem_data['node'];
							$sub[$subitem_data['node'].'_'.$k]['item_type']   = isset($subitem_data['item_type']) ? $subitem_data['item_type'] : $subitem_data['node'];
							$sub[$subitem_data['node'].'_'.$k]['item_data']   = $this->submenu_process($subitem_data, $l);
							$sub[$subitem_data['node'].'_'.$k]['nested_item'] = array();
							break;

						case 'bannerimg':
							$sub[$subitem_data['node'].'_'.$k]['status']      = $v['status'];
							$sub[$subitem_data['node'].'_'.$k]['node']        = $subitem_data['node'];
							$sub[$subitem_data['node'].'_'.$k]['item_type']   = isset($subitem_data['item_type']) ? $subitem_data['item_type'] : $subitem_data['node'];
							$sub[$subitem_data['node'].'_'.$k]['item_data']   = $this->submenu_process($subitem_data, $l);
							$sub[$subitem_data['node'].'_'.$k]['nested_item'] = array();
							break;

						case 'infobox':
							$sub[$subitem_data['node'].'_'.$k]['status']      = $v['status'];
							$sub[$subitem_data['node'].'_'.$k]['node']        = $subitem_data['node'];
							$sub[$subitem_data['node'].'_'.$k]['item_type']   = isset($subitem_data['item_type']) ? $subitem_data['item_type'] : $subitem_data['node'];
							$sub[$subitem_data['node'].'_'.$k]['item_data']   = $this->submenu_process($subitem_data, $l);
							$sub[$subitem_data['node'].'_'.$k]['nested_item'] = array();
							break;

						case 'customhtml':
							$sub[$subitem_data['node'].'_'.$k]['status']      = $v['status'];
							$sub[$subitem_data['node'].'_'.$k]['node']        = $subitem_data['node'];
							$sub[$subitem_data['node'].'_'.$k]['item_type']   = isset($subitem_data['item_type']) ? $subitem_data['item_type'] : $subitem_data['node'];
							$sub[$subitem_data['node'].'_'.$k]['item_data']   = $this->submenu_process($subitem_data, $l);
							$sub[$subitem_data['node'].'_'.$k]['nested_item'] = array();
							break;
					}
				}

				if ($subitem_data['node'] == 'row') {
					$sub[$subitem_data['node'].'_'.$k]['status']      = $v['status'];
					$sub[$subitem_data['node'].'_'.$k]['node']        = $subitem_data['node'];
					$sub[$subitem_data['node'].'_'.$k]['item_type']   = isset($subitem_data['item_type']) ? $subitem_data['item_type'] : $subitem_data['node'];
					$sub[$subitem_data['node'].'_'.$k]['item_data']   = $this->submenu_process($subitem_data, $l);
					$sub[$subitem_data['node'].'_'.$k]['nested_item'] = $this->chk($v['items']) ? $this->submenu($v['items'], $l) : null;
				}

				if ($subitem_data['node'] == 'col') {
					$sub[$subitem_data['node'].'_'.$k]['status']      = $v['status'];
					$sub[$subitem_data['node'].'_'.$k]['node']        = $subitem_data['node'];
					$sub[$subitem_data['node'].'_'.$k]['item_type']   = isset($subitem_data['item_type']) ? $subitem_data['item_type'] : $subitem_data['node'];
					$sub[$subitem_data['node'].'_'.$k]['item_data']   = $this->submenu_process($subitem_data, $l);
					$sub[$subitem_data['node'].'_'.$k]['nested_item'] = $this->chk($v['items']) ? $this->submenu($v['items'], $l) : null;
				}
				
			}
		}
		//echo "<pre>".print_r($sub,true)."</pre>";
		return $sub;
	}

	private function submenu_process($arr, $l) {
		$tmp = array();
		if ($arr['node'] == 'row') {
			$tmp = array(
				'node'     => $arr['node'],
				'gutter'   => $arr['gutter'],
				'margin_b' => $arr['margin_b']
			);
		}
		if ($arr['node'] == 'col') {
			$tmp = array(
				'node'     => $arr['node'],
				'col_size' => $arr['classGroup'],
				'border'   => sizeof($arr['border']) > 0 && $arr['border']['status'] ? $arr['border']['css'] : null
			);
		}
		if ($arr['node'] == 'item') {
			if ($arr['item_type'] == 'normal') {
				$item = $arr['sub_item'];
				$tmp = array(
					'title' => $this->lngdata($item['title']),
					'url'   => $item['url'],
					'open'  => $item['win'],
					'style' => isset($item['style']) ? $item['style'] : 1,
					'css'   => $this->rgen->factory->node($item, 'css', 1)
				);
			}
			if ($arr['item_type'] == 'cat') {
				$item                 = $arr['sub_item'];
				$tmp                  = $this->categories($item['category']['id'], $item['image_w'], $item['image_h']);
				$tmp['grid_settings'] = isset($item['grid_settings']['classGroup']) ? 'rw '.$item['grid_settings']['classGroup'] : null;
				$tmp['style']         = isset($item['style']) ? $item['style'] : 1;
				$tmp['max_sub']       = $item['max_sub'];
				
			}
			if ($arr['item_type'] == 'prd') {
				$item = $arr['sub_item'];
				$tmp = array(
					'grid_settings' => isset($item['grid_settings']['classGroup']) ? 'rw '.$item['grid_settings']['classGroup'] : null,
					'products'      => $this->products($item['products'], $item['image_w'], $item['image_h']),
					'style'         => isset($item['style']) ? $item['style'] : 1
				);
			}
			if ($arr['item_type'] == 'brand') {
				$item = $arr['sub_item'];
				$tmp = array(
					'grid_settings' => isset($item['grid_settings']['classGroup']) ? 'rw '.$item['grid_settings']['classGroup'] : null,
					'brands'        => $this->brands($item['brands'], $item['image_w'], $item['image_h']),
					'style'         => isset($item['style']) ? $item['style'] : 1
				);
			}

			if ($arr['item_type'] == 'bannerimg') {
				$item = $arr['sub_item'];
				$tmp = array(
					'title_status' => isset($item['title_status']) ? $item['title_status'] : true,
					'title'        => $this->lngdata($item['title']),
					'url'          => $item['url'],
					'open'         => $item['win'],
					'style'        => isset($item['style']) ? $item['style'] : 1,
					'image'        => $this->imgresize($item['image'], $item['image_w'], $item['image_h']),
					'margin_b'     => $item['margin_b']
				);
			}

			if ($arr['item_type'] == 'infobox') {
				$item = $arr['sub_item'];
				$tmp = array(
					'title_status'       => isset($item['title_status']) ? $item['title_status'] : true,
					'description_status' => isset($item['description_status']) ? $item['description_status'] : true,
					'image_status'       => isset($item['image_status']) ? $item['image_status'] : true,
					'btn_status'         => isset($item['btn_status']) ? $item['btn_status'] : true,
					
					'title'              => $this->lngdata($item['title']),
					'description'        => $this->lngdata($item['description']),
					'button'             => $this->lngdata($item['button']),
					'url'                => $item['url'],
					'open'               => $item['win'],
					'style'              => isset($item['style']) ? $item['style'] : 1,
					'image'              => $this->imgresize($item['image'], $item['image_w'], $item['image_h']),
					'margin_b'           => $item['margin_b'],
					'align'              => $item['align']
				);
			}

			if ($arr['item_type'] == 'customhtml') {
				$item = $arr['sub_item'];
				$tmp = array(
					'html'     => $this->lngdata($item['html']),
					'margin_b' => $item['margin_b'],
					'css'      => $this->rgen->factory->node($item, 'css', 1)
				);
			}
		}
		return $tmp;
	}

	/* Fly out navigation factory
	------------------------*/
	private function navfly_factory($arr, $type, $l) {
		if (isset($arr)) {
			$tmp        = array();
			$navflydata = $this->navfly_dom($arr, $l);
			$tmp        = isset($navflydata) ? implode($this->rgen->factory->flatten($navflydata)) : null;
			return $tmp;
		}
	}

	private function navfly_dom($arr, $l) {
		if (isset($arr) && sizeof($arr) > 0) {
			$htm[] = '<ul class="nav-fly">';
			foreach ($arr as $value) {
				
				switch ($value['item_type']) {
					case 'normal':
						$htm[] = '<li>';
						$htm[] = '<a href="'.$value['item_data']['url'].'">'.$value['item_data']['title'][$l].'</a>';
						if (isset($value['nested_item'])) {
							$htm[] = $this->navfly_dom($value['nested_item'], $l);
						}
						$htm[] = '</li>';
						break;

					case 'cat':
						$htm[] = '<li>';
						$htm[] = '<a href="'.$value['item_data']['url'].'">'.$value['item_data']['title'].'</a>';
						if (isset($value['nested_item'])) {
							$htm[] = $this->navfly_dom($value['nested_item'], $l);
						}
						$htm[] = '</li>';
						break;

					case 'prd':
						foreach ($value['item_data']['products'] as $product) {
							$htm[] = '<li>';
							$prd  = '<div class="flyout-prd">'.
										'<div class="image">'.
											'<a href="'.$product['href'].'">'.
											'<img src="'.$product['thumb'].'" alt="'.$product['name'].'" title="'.$product['name'].'" class="img-responsive" />'.
											'</a>'.
										'</div>'.
										'<div class="info-wrp">'.
											'<a href="'.$product['href'].'">'.$product['name'].'</a>';
											if ($product['price']) {
							$prd .=			'<div class="price">';
												if (!$product['special']) {
							$prd .=				'<span class="price-new">'.$product['price'].'</span>';
												} else {
							$prd .=				'<span class="price-new">'.$product['special'].'</span>';
							$prd .=				'<span class="price-old">'.$product['price'].'</span>';
												}
							$prd .=			'</div>';
											}
							$prd .=		'</div>';
							$prd .= '</div>';
							$htm[] = $prd;
							$htm[] = '</li>';
						}
						break;

					case 'brand':
						foreach ($value['item_data']['brands'] as $brand) {
							$htm[] = '<li>';
							$brn   = '<div class="flyout-brand">'.
										'<a href="'.$brand['url'].'">'.
										'<img src="'.$brand['image'].'" alt="'.$brand['name'].'" title="'.$brand['name'].'" class="img-responsive" />'.
										'<span>'.$brand['name'].'</span>'.
										'</a>'.
									 '</div>';
							$htm[] = $brn;
							$htm[] = '</li>';
						}
						break;
				}
				
			}
			$htm[] = '</ul>';
			return $htm;
		}
	}

	

	/* Category generator
	------------------------*/
	private function categories($id, $w, $h) {
		$this->load->model('catalog/category');
		$this->load->model('tool/image');
		$category = $this->model_catalog_category->getCategory((int)$id);
		$tmp = array();
		if (isset($category['status'])) {
			if ($category['status']) {
				$imgscr = $category['image'] ? $category['image'] : 'no_image.jpg';
				$image = $this->imgresize($imgscr, $w, $h);

				$tmp = array(
					'status'		=> $category['status'],
					'sort_order'	=> $category['sort_order'],
					'category_id'	=> $category['category_id'],
					'title'			=> $category['name'],
					'image'			=> $image,
					'url'			=> $this->url->link('product/category', 'path=' . $id)
				);
			}
		}
		return $tmp;
	}
	private function subcategories($id, $node, $type, $w, $h) {
		$this->load->model('catalog/category');
		$this->load->model('tool/image');
		$catlist = $this->model_catalog_category->getCategories((int)$id);
		$tmp = array();
		$i = 0;
		if (isset($catlist) && sizeof($catlist) > 0) {
			foreach ($catlist as $key => $category) {
				if ($category['status']) {

					$imgscr = $category['image'] ? $category['image'] : 'no_image.jpg';
					$image = $this->imgresize($imgscr, $w, $h);

					$tmp[$node.'_'.$key] = array(
						'status'    => $category['status'],
						'node'      => $node,
						'item_type' => $type,
						'item_data' => array(
							'status'      => $category['status'],
							'sort_order'  => $category['sort_order'],
							'category_id' => $category['category_id'],
							'title'       => $category['name'],
							'image'       => $image,
							'url'         => $this->url->link('product/category', 'path=' . $id . '_' . $category['category_id'])
						),
						'nested_item' => $this->subcategories((int)$category['category_id'], $node, $type, $w, $h)
					);
				}

				$i++;
			}
		}
		return $tmp;
	}

	/* Products generator
	------------------------*/
	private function products($arr, $w, $h) {
		$this->load->model('catalog/product');
		$this->load->model('tool/image');
		$tmp = array();
		if ((isset($arr)) && (sizeof($arr) > 0)) {
			foreach ($arr as $key => $value) {
				if (isset($value['id'])) {
					$id = $value['id'];
					$product = $this->model_catalog_product->getProduct((int)$id);
					$img_w = $w ? $w : 200;
					$img_h = $h ? $h : 200;
					

					if (isset($product['status']) && $product['status']) {

						$image = $this->imgresize($product['image'], $w, $h);

						if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
							$price = $this->currency->format($this->tax->calculate($product['price'], $product['tax_class_id'], $this->config->get('config_tax')));
						} else {
							$price = false;
						}

						if ((float)$product['special']) {
							$special = $this->currency->format($this->tax->calculate($product['special'], $product['tax_class_id'], $this->config->get('config_tax')));
						} else {
							$special = false;
						}

						if ($this->config->get('config_tax')) {
							$tax = $this->currency->format((float)$product['special'] ? $product['special'] : $product['price']);
						} else {
							$tax = false;
						}

						if ($this->config->get('config_review_status')) {
							$rating = $product['rating'];
						} else {
							$rating = false;
						}

						$tmp[] = array(
							'product_id'  => $product['product_id'],
							'thumb'       => $image,
							'name'        => $product['name'],
							'description' => utf8_substr(strip_tags(html_entity_decode($product['description'], ENT_QUOTES, 'UTF-8')), 0, $this->config->get('config_product_description_length')) . '..',
							'price'       => $price,
							'special'     => $special,
							'tax'         => $tax,
							'rating'      => $rating,
							'href'        => $this->url->link('product/product', 'product_id=' . $product['product_id'])
						);
					}
				}
			}	
		}

		return $tmp;
	}

	/* Brands generator
	------------------------*/
	private function brands($arr, $w, $h) {
		$this->load->model('catalog/manufacturer');
		$this->load->model('tool/image');
		$tmp = array();
		if ((isset($arr)) && (sizeof($arr) > 0)) {
			foreach ($arr as $key => $value) {
				if (isset($value['id'])) {
					$id = $value['id'];

					$brand = $this->model_catalog_manufacturer->getManufacturer((int)$id);

					if (isset($brand['name']) && sizeof($brand) > 0) {
						$image = $this->imgresize($brand['image'], $w, $h);

						$tmp[] = array(
							'manufacturer_id' => $brand['manufacturer_id'],
							'name'            => $brand['name'],
							'image'           => $image,
							'url'             => $this->url->link('product/manufacturer/info', 'manufacturer_id=' . $brand['manufacturer_id']),
						);
					}
				}
			}	
		}

		return $tmp;
	}
}