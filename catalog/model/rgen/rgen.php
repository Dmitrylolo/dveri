<?php 

class ModelRGenRGen extends Model {

	public $tbl_theme 			= 'rgen_theme';
	public $tbl_theme_storage	= 'rgen_theme_storage';
	public $tbl_module 			= 'rgen_modules';
	public $tbl_module_customize = 'rgen_modules_customize';
	public $tbl_settings 		= 'rgen_settings';

	public function getTheme($group, $store_id = 0) {
		$data = array();
		$query = $this->db->query(
			"SELECT * FROM " . DB_PREFIX . $this->tbl_theme . " WHERE 
			`store_id`	= '" . (int)$store_id . "' AND 
			`group`		= '" . $this->db->escape($group) . "'
		");
		foreach ($query->rows as $key => $value) {
			$data[$value['section']][$value['key']] = json_decode($value['value']);
		}
		return $this->rgen->factory->objToArray($data);
	}

	public function getModtheme($group, $store_id = 0) {
		$data = array();
		$query = $this->db->query(
			"SELECT * FROM " . DB_PREFIX . $this->tbl_module_customize . " WHERE 
			`store_id`	= '" . (int)$store_id . "' AND 
			`group`		= '" . $this->db->escape($group) . "'
		");
		foreach ($query->rows as $key => $value) {
			$data[$value['section']][$value['key']] = json_decode($value['value']);
		}
		return $this->rgen->factory->objToArray($data);
	}

	public function getModules($group, $store_id = 0) {
		$data = array();
		$query = $this->db->query(
			"SELECT * FROM " . DB_PREFIX . $this->tbl_module . " WHERE 
			`store_id`	= '" . (int)$store_id . "' AND 
			`group`		= '" . $this->db->escape($group) . "'
		");
		foreach ($query->rows as $key => $value) {
			$data[$value['section']][$value['key']] = json_decode($value['value']);
		}
		return $this->rgen->factory->objToArray($data);
	}

	public function getSettings($group, $store_id = 0) {
		$data = array();
		$query = $this->db->query(
			"SELECT * FROM " . DB_PREFIX . $this->tbl_settings . " WHERE 
			`store_id`	= '" . (int)$store_id . "' AND 
			`group`		= '" . $this->db->escape($group) . "'
		");
		foreach ($query->rows as $key => $value) {
			$data[$value['section']][$value['key']] = json_decode($value['value']);
		}
		return $this->rgen->factory->objToArray($data);
	}

	public function getDate($id) {
		if ($this->customer->isLogged()) {
			$cust_group_id = $this->customer->getGroupId();
		} else {
			$cust_group_id = $this->config->get('config_customer_group_id');
		}
		$query = $this->db->query(
			"SELECT date_end FROM " . DB_PREFIX . "product_special 
				WHERE product_id = '" . (int)$id . "'
				AND customer_group_id = '" . $cust_group_id . "'
				ORDER BY priority ASC LIMIT 1;");
		if (isset($query->row['date_end']) && $query->row['date_end'] != '0000-00-00') {
			return date('D M d Y H:i:s O', strtotime($query->row['date_end']));
		} else {
			return false;
		}
	}

	public function prdCategorylink($id) {
		$this->load->model('catalog/category');
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_to_category WHERE product_id = '" . (int)$id . "';");
		if (isset($query->rows)) {
			foreach ($query->rows as $key => $value) {
				$data[] = $this->model_catalog_category->getCategory((int)$value['category_id']);
			}
			return $data;
		} else {
			return false;
		}
	}

}
?>