<?php 
class rgen_config {
	public $config;
	public $request;
	public function __construct($registry) {
		$this->request = $registry->get('request');
	}
	public function getPath($key) {
		return DIR_SYSTEM . self::$front_config[$key];
	}
	public function setConfig($k, $v){
		$this->config[$k] = $v;
	}
	
}?>