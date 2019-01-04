<?php 
class ControllerRgenSearch extends Controller {
	public function index() {

		if (isset($this->request->get['search'])) {
			$data['search'] = $this->request->get['search'];
		} else {
			$data['search'] = '';
		}

		// Search data
		$params = array(
			'filter_name'         => $data['search'],
			'sort'                => 'p.sort_order',
			'order'               => 'ASC',
			'start'               => 0,
			'limit'               => 5
		);
	
		$this->load->model('catalog/product');
		
		$results = $this->model_catalog_product->getProducts($params);

		// Search products
		$searchData = array();
		$img_w = 100;
		$img_h = 100;
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

				$searchData[] = array(
					'product_id'  => $result['product_id'],
					'thumb'       => $image,
					'name'        => $result['name'],
					'price'       => $price,
					'special'     => $special,
					'href'        => html_entity_decode($this->url->link('product/product', 'product_id=' . $result['product_id']), ENT_QUOTES, 'UTF-8')
				);
			}
		}
		$searchData;
		$this->response->setOutput(json_encode($searchData));

	}

	private function imgresize($val, $w, $h) {
		$this->load->model('tool/image');
		return $this->rgen->factory->imgresize($val, $w, $h, $this->model_tool_image);
	}
}