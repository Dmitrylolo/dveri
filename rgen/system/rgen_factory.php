<?php 
require_once(DIR_SYSTEM . '../rgen/lib/Mobile-Detect-2.8.5/Mobile_Detect.php');

class factory {
	public $request;
	public $device;
	public function __construct($registry) {
		$this->request = $registry->get('request');
		$detectDevice = new Mobile_Detect();
		if($detectDevice->isMobile()) {
			if ($detectDevice->isTablet()) {
				$this->device = 't';
			} else {
				$this->device = 'm';
			}
		} else {
			$this->device = 'd';
		}

	}

	public static function uid($length = 6) {
		$characters = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
		$randomString = '';
		for ($i = 0; $i < $length; $i++) {
			$randomString .= $characters[rand(0, strlen($characters) - 1)];
		}
		return 'rgen'.$randomString;
	}

	public function objToArray($obj, &$arr=array()){
		if(!is_object($obj) && !is_array($obj)){
			$arr = $obj;
			return $arr;
		}
		foreach ($obj as $key => $value){
			if (!empty($value)){
				$arr[$key] = array();
				$this->objToArray($value, $arr[$key]);
			} else {
				$arr[$key] = $value;
			}
		}
		return $arr;
	}

	public function getkeypath($arr, $lookup) {
		if (array_key_exists($lookup, $arr)) {
			return array($lookup);
		} else {
			foreach ($arr as $key => $subarr) {
				if (is_array($subarr)) {
					$ret = $this->getkeypath($subarr, $lookup);
					if ($ret) {
						$ret[] = $key;
						return $ret;
					}
				}
			}
		}
		return null;
	}

	function ArrayGetPath($data, $path, &$result){
		$found = true;
		$path = explode("/", $path);
		for ($x=0; ($x < count($path) and $found); $x++){
			$key = $path[$x];
			if (isset($data[$key])){
				$data = $data[$key];
			}        
			else { $found = false; }
		}
		$result = $data;
		return $found;
	}

	public static function has($arr, $val) {
		return __::has($arr, $val) && $val != '' && !empty($val) && sizeof($arr) > 0;
	}

	public static function isEmpty($o) {
		if (__::isEmpty($o) && sizeof($o) == 0) {
			return true;
		}else {
			return false;
		}
	}

	public static function checkdata($val){
		if ((sizeof($val) > 0) && $val != '' && !empty($val)) {
			return true;
		}else{
			return false;
		}
	}
	public static function checkstr($val, $str){
		if (strpos($val, $str) !== false) {
			return true;
		}else{
			return false;
		}
	}

	public function imgpath($img) {
		if (strpos($img,"no_image") == false) {
			$tmp = str_replace('../image/', 'image/', $img);
			return $tmp;
		}else{
			return false;
		}
	}

	public function imgresize($val, $w, $h, $process, $resize_type = '') {
		if ($val) {
			$img_w     = $w ? $w : 200;
			$img_h     = $h ? $h : 200;
			$imgSource = isset($val) && $val!='' ? str_replace('../image/', '', $val) : 'no_image.jpg';
			
			if (file_exists(DIR_IMAGE.$imgSource)) {
				list($width_orig, $height_orig) = getimagesize(DIR_IMAGE.$imgSource);
			} else {
				$imgSource = 'no_image.jpg';
				list($width_orig, $height_orig) = getimagesize(DIR_IMAGE.$imgSource);
			}

			if ($resize_type === 'fill') {
				$img_ratio = (float)$img_w / $img_h;
				$orig_img_ratio = (float)$width_orig / $height_orig;
				if ($img_ratio > $orig_img_ratio) {
					$resize_type = 'w';
				} else {
					$resize_type = 'h';
				}
			} else {
				$resize_type = '';
			}
			//echo "<pre>".print_r($width_orig,true)."</pre>";
			//$image = $process->resize($imgSource, $img_w, $img_h, $width_orig < $height_orig ? 'w' : 'h');
			$image = $process->resize($imgSource, $img_w, $img_h, $resize_type);
			
			return $image;
		}
	}

	public function getimgcss($val){
		if (isset($val) && $val != '' && !empty($val)) {
			if (gettype($val) == 'array') {
				if ($this->imgpath($val['image']) != false && $val['status']) {
					$tmp  = 'background-image: url('.$this->imgpath($val['image']).');';
					$tmp .= isset($val['css']) && $val['css'] != '' && !empty($val['css']) ? $val['css'] : '';
					return $tmp;
				}
			} else {
				if ($this->imgpath($val->image) != false && $val->status) {
					$tmp  = 'background-image: url('.$this->imgpath($val->image).');';
					$tmp .= isset($val->css) && $val->css != '' && !empty($val->css) ? $val->css : '';
					return $tmp;
				}
			}
		} else {
			return false;
		}
	}

	public function getnode($arr, $key, $node='css'){
		if (__::has($arr, $key)) {
			if (isset($arr[$key]) && sizeof($arr[$key]) > 0) {
				if (isset($arr[$key]['status']) && $arr[$key]['status']) {
					$tmp = isset($arr[$key][$node]) ? $arr[$key][$node] : '';
					return $tmp;
				}/*else{
					return false;
				}*/
			}
		}/* else { return false; }*/
	}

	/* Node functions
	------------------------*/
	public function node($arr, $path, $status=1, $css=0, $node='css'){
		
		// Get css or other node value with status check
		if ($this->ArrayGetPath($arr, $path, $result) != null && $node!=='' && $status===1 && $css===0) {
			if ($status) {
				if (isset($result['status']) && $result['status']) {
					$tmp = isset($result[$node]) ? $result[$node] : '';
					return $tmp;
				}
			}
		} 

		// Get direct node value with out status check
		elseif ($this->ArrayGetPath($arr, $path, $result) != null && $status===0 && $css===0) {
			$tmp = isset($result) ? $result : '';
			return $result;
		} 

		// Get css property with out status check
		elseif ($this->ArrayGetPath($arr, $path, $result) != null && $css!==0) {
			switch ($css) {
				case 'bgcolor':
					return !empty($result) ? 'background-color: '.$result.';' : '';
					break;
				case 'bgcolor_imp':
					return !empty($result) ? 'background-color: '.$result.' !important;' : '';
					break;
				case 'color':
					return !empty($result) ? 'color: '.$result.';' : '';
					break;
				case 'color_imp':
					return !empty($result) ? 'color: '.$result.' !important;' : '';
					break;
				case 'bdrcolor':
					return !empty($result) ? 'border-color: '.$result.';' : '';
					break;
				case 'margin_t':
					return !empty($result) ? 'margin-top: '.$result.'px; ' : '';
					break;
				case 'margin_b':
					return !empty($result) ? 'margin-bottom: '.$result.'px; ' : '';
					break;
				case 'fsize':
					return !empty($result) ? 'font-size: '.$result.'; ' : '';
					break;
				case 'w':
					return !empty($result) ? 'width: '.$result.'px; ' : '';
					break;
				case 'h':
					return !empty($result) ? 'height: '.$result.'px; ' : '';
					break;
				case 'min_h':
					return !empty($result) ? 'min-height: '.$result.'px; ' : '';
					break;
				case 'opacity':
					return !empty($result) ? 'opacity: '.$result.'; ' : '';
					break;
			}
		} 

		// Return false if nothing found
		else { 
			return false;
		}
	}

	public function scrollItems($arr) {
		$tmp  = '0: { items:';
		$tmp .= isset($arr['w200']) ? $arr['w200'] : 1;
		$tmp .= ' },';

		$tmp .= '200: { items:';
		$tmp .= isset($arr['w200']) ? $arr['w200'] : 1;
		$tmp .= ' },';

		$tmp .= '300: { items:';
		$tmp .= isset($arr['w300']) ? $arr['w300'] : 2;
		$tmp .= ' },';

		$tmp .= '400: { items:';
		$tmp .= isset($arr['w400']) ? $arr['w400'] : 2;
		$tmp .= ' },';

		$tmp .= '500: { items:';
		$tmp .= isset($arr['w500']) ? $arr['w500'] : 3;
		$tmp .= ' },';

		$tmp .= '600: { items:';
		$tmp .= isset($arr['w600']) ? $arr['w600'] : 3;
		$tmp .= ' },';

		$tmp .= '700: { items:';
		$tmp .= isset($arr['w700']) ? $arr['w700'] : 3;
		$tmp .= ' },';

		$tmp .= '800: { items:';
		$tmp .= isset($arr['w800']) ? $arr['w800'] : 4;
		$tmp .= ' },';

		$tmp .= '900: { items:';
		$tmp .= isset($arr['w900']) ? $arr['w900'] : 4;
		$tmp .= ' },';

		$tmp .= '1000: { items:';
		$tmp .= isset($arr['w1000']) ? $arr['w1000'] : 5;
		$tmp .= ' },';

		$tmp .= '1100: { items:';
		$tmp .= isset($arr['w1100']) ? $arr['w1100'] : 5;
		$tmp .= ' }';

		return $tmp;
	}
	

	public function lngdata($val, $lng) {
		if (gettype($val) == 'array') {
			$tmp = $val;
		} elseif(gettype($val) == 'object') {
			$tmp = get_object_vars($val);
		}

		if (isset($tmp) && sizeof($tmp) > 0) {
			foreach ($lng as $key => $value) {
				if (isset($tmp[$value['id']])) {
					$tmp[$value['id']] = $tmp[$value['id']] != '' ? $tmp[$value['id']] : $value['code']." - No data";
				} else {
					$tmp[$value['id']] = $value['code']." - No data";
				}
			}
			return $tmp;
		} else {
			foreach ($lng as $key => $value) {
				$tmp[$value['id']] = $value['code']." - No data";
			}
			return $tmp;
		}
	}

	public function flatten($array) {
		$arrayValues = array();

		foreach ($array as $value) {
			if (is_scalar($value) OR is_resource($value)) {
				 $arrayValues[] = $value;
			} elseif (is_array($value)) {
				 $arrayValues = array_merge($arrayValues, $this->flatten($value));
			}
		}

		return $arrayValues;
	}

	public function discount($normal, $special){
		$price1 = $normal;
		$price2 = $special;

		$oldPrice = preg_replace( '#\D*?(\d+(\.\d+)?)\D*#', '$1', $price1);
		$newPrice = preg_replace( '#\D*?(\d+(\.\d+)?)\D*#', '$1', $price2);

		$diff = $oldPrice - $newPrice;
		
		$discountCal = 100 * $diff / $oldPrice;
		return $discount = round($discountCal, 1) . '%';
	}

	public function caching($cachefile, $data, $tpl, $loader) {
		$fp = fopen($cachefile, 'w');
		fwrite($fp, $loader->view($tpl, $data));
		fclose($fp);
	}

	public function render($filepath) {
		$file = $filepath;
		$output = '';
		if (file_exists($file)) {
			ob_start();
			require($file);
			$output = ob_get_contents();
			ob_end_clean();
		}
		return $output;
	}
	

	/*public function route($registry){
		$getRoute = isset($this->request->get['route']) ? $this->request->get['route'] : 'common/home';
		return $getRoute;
	}*/
}?>