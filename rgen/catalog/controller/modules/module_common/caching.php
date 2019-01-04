<?php 

$data['default_checks']['store_id'] = $this->config->get('config_store_id');
$data['default_checks']['settings'] = $setting;
$data['default_checks']['language'] = $this->config->get('config_language_id');
$data['default_checks']['currency'] = $this->currency->getCode();

if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
	$data['default_checks']['price'] = 'y';
} else {
	$data['default_checks']['price'] = 'n';
}

if ($this->config->get('config_tax')) {
	$data['default_checks']['tax'] = 'y';
} else {
	$data['default_checks']['tax'] = 'n';
}

if ($this->config->get('config_review_status')) {
	$data['default_checks']['rating'] = 'y';
} else {
	$data['default_checks']['rating'] = 'n';
}

// Create directory
$dir = DIR_MODULE_CACHE.$module_key;
if (!is_dir($dir)) {
	mkdir($dir, 0777, true);
}

$cache_file = $dir.'/'.md5(implode('', $factory->flatten($data['default_checks']))).'.tpl';

$tpl        = DIR_FRONT_MODULE . $module_key . '.tpl';