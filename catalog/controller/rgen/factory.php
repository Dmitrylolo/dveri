<?php 
class ControllerRgenFactory extends Controller {
	public function index() {
		$storage = $this->rgen->storage;
		
		$this->load->model('rgen/rgen');
		
		$data['rgen_theme']    = $this->model_rgen_rgen->getTheme('rgen_theme');
		$data['rgen_modules']  = $this->model_rgen_rgen->getModules('rgen_module');
		$data['rgen_modtheme'] = $this->model_rgen_rgen->getModtheme('rgen_modtheme');
		$data['rgen_settings'] = $this->model_rgen_rgen->getSettings('rgen_settings');
		
		$storage->set("theme_data"    , $data['rgen_theme']);
		$storage->set("modules_data"  , $data['rgen_modules']);
		$storage->set("modtheme_data" , $data['rgen_modtheme']);
		$storage->set("settings_data" , $data['rgen_settings']);

		// Languages
		$this->load->model('localisation/language');
		$lng = array();
		$results = $this->model_localisation_language->getLanguages();
		foreach ($results as $result) {
			if ($result['status']) {
				$lng['language'][] = array(
					'language'  => $result['name'],
					'id'  		=> $result['language_id'],
					'code'  	=> $result['code'],
					'image' 	=> $result['image']
				);
			}
		}
		$storage->set("language", $lng);

		// Language data
		$this->load->language('rgen/rgen');
		$text_strings = array(
				'text_home',
				'text_tax',
				'button_cart',
				'button_wishlist',
				'button_compare',
				'button_more',
				'prd_option_tab',
				'text_category',
				'day',
				'hour',
				'min',
				'sec'
		);
		foreach ($text_strings as $text) {
			$language_data[$text] = $this->language->get($text);
		}
		$storage->set("language_data", $language_data);
		
		/*
		$data['text_tax'] 			= $this->language->get('text_tax');
		$data['button_cart'] 		= $this->language->get('button_cart');
		$data['button_wishlist'] 	= $this->language->get('button_wishlist');
		$data['button_compare'] 	= $this->language->get('button_compare');
		$data['button_more'] 		= $this->language->get('button_more');*/
		

	}
}