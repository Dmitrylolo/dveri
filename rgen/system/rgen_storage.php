<?php 
class storage {
	private $theme_data;
	private $modtheme_data;
	private $module_data;
	private $settings_data;
	private $language_data;
	private $fonts;
	private $language;

	public function __construct() {
		//$this->fonts = $this->storage[];
		//echo "<pre>".print_r($this->language,true)."</pre>";
	}
	public function set($var, $v) {
		$this->{$var} = $v;
	}
	public function get($key, $val) {
		if (factory::checkdata($this->{$key})) {
			if (array_key_exists($val, $this->{$key})) {
				return factory::checkdata($this->{$key}[$val]) ? $this->{$key}[$val] : null;
			}
		}
	}

	public function getfull($key) {
		if (factory::checkdata($this->{$key})) {
			return factory::checkdata($this->{$key}) ? $this->{$key} : null;
		}
	}

}?>