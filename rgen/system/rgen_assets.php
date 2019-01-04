<?php 
require_once(DIR_SYSTEM . '../rgen/lib/minify/src/Minify.php');
require_once(DIR_SYSTEM . '../rgen/lib/minify/src/CSS.php');
require_once(DIR_SYSTEM . '../rgen/lib/minify/src/JS.php');
require_once(DIR_SYSTEM . '../rgen/lib/minify/src/Exception.php');
require_once(DIR_SYSTEM . '../rgen/lib/minify/src/Converter.php');

use MatthiasMullie\Minify;

class assets {
	public $cssFiles = array();
	public $jsFiles = array();

	public $css_minFiles = array();
	public $js_minFiles = array();

	public $admin_cssFiles = array();
	public $admin_jsFiles = array();
	
	public function __construct($registry) {

		$url_arg = "?ver=" . rand(1, 9999);

		//$assets_data = json_decode(file_get_contents(DIR_SYSTEM.'../rgen/system/assets_data.json'));
		$assets_data = json_decode(file_get_contents(FILE_FRONT_ASSETS));
		foreach ($assets_data->css as $key => $value) {
			$this->cssFiles[md5($value)] = $value;
		}
		foreach ($assets_data->js as $key => $value) {
			$this->jsFiles[md5($value)] = $value;
		}

		$admin_assets_data = json_decode(file_get_contents(FILE_ADMIN_ASSETS));
		foreach ($admin_assets_data->css as $key => $value) {
			$this->admin_cssFiles[$key] = !factory::checkstr($value, 'fonts.googleapis.com/') ? $value : $value;
		}
		foreach ($admin_assets_data->js as $key => $value) {
			$this->admin_jsFiles[$key] = $value;
		}
	}
	
	public function setCss($v){
		if ($v != 'catalog/view/javascript/jquery/owl-carousel/owl.carousel.css') {
			$this->cssFiles[md5($v)] = $v;
		}
	}
	public function setJs($v){
		if ($v != 'catalog/view/javascript/jquery/owl-carousel/owl.carousel.min.js') {
			$this->jsFiles[md5($v)] = $v;
		}
	}
	public function js(){

	}
	public function css(){

	}

	public function cssMinify($cssList, $inlineCSS = '', $fileKey = ''){
		$cssMinifier = new Minify\CSS();

		if (sizeof($cssList) > 0) {

			// All CSS files
			foreach ($cssList as $key => $value) {
				if (factory::checkstr($value, 'fonts.googleapis.com/')) {
					$this->css_minFiles[md5($value)] = $value;
				} else {
					$cssMinifier->add($value);
				}
			}

			// In-line CSS minify
			$cssMinifier->add($inlineCSS);
			
			$minifiedPath = DIR_SYSTEM.'../'.DIR_MINIFY_CSS.$fileKey.'.css';
			if (!file_exists($minifiedPath)) {
				$cssMinifier->minify($minifiedPath);
			}

			$cssfilePath = DIR_MINIFY_CSS.$fileKey.'.css';
			$this->css_minFiles[md5($cssfilePath)] = $cssfilePath;
		}

		return $this->css_minFiles;
	}

	public function jsMinify($jsList, $fileKey = ''){
		$jsMinifier = new Minify\JS();

		if (sizeof($jsList) > 0) {

			// All CSS files
			foreach ($jsList as $key => $value) {
				$jsMinifier->add($value);
			}

			$minifiedPath = DIR_SYSTEM.'../'.DIR_MINIFY_JS.$fileKey.'.js';
			if (!file_exists($minifiedPath)) {
				$jsMinifier->minify($minifiedPath);
			}

			$jsfilePath = DIR_MINIFY_JS.$fileKey.'.js';
			$this->js_minFiles[md5($jsfilePath)] = $jsfilePath;
		}

		return $this->js_minFiles;
	}

	public function gfonts($val){
		if (factory::checkdata($val)) {
			$fonts = $val;
			$f = '';
			$s = '';
			foreach ($fonts as $key => $value) {
				if (isset($value['family']) && $value['family'] != '') {
					$f[md5($value['family'])] = $value['family'];
				}
				if (isset($value['subset']) && $value['subset'] != '') {
					$s[md5($value['subset'])] = $value['subset'];
				}
			}
			$f_url 	= !factory::isEmpty($f) && $f != '' ? join($f, '|') : '';
			$s_url 	= !factory::isEmpty($s) && $s != '' ? '&subset='.join($s, ',') : '';
			$gfont_url = $f_url != '' && $s_url != '' ? "@import url('//fonts.googleapis.com/css?family=".$f_url.$s_url."');" : '';
			return $gfont_url;
		} else {
			return false;
		}
	}
}?>