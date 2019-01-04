<?php 

class ModelRGenRGen extends Model {

	public $tbl_theme            = 'rgen_theme';
	public $tbl_theme_storage    = 'rgen_theme_storage';
	public $tbl_module           = 'rgen_modules';
	public $tbl_module_customize = 'rgen_modules_customize';
	public $tbl_settings         = 'rgen_settings';
	public $tbl_revslider        = 'revslider_sliders';

	public function install() {
		$sql = 'CREATE TABLE IF NOT EXISTS`' . DB_PREFIX . 'rgen_theme` (
			`id` int(11) NOT NULL AUTO_INCREMENT,
			`store_id` int(11) NOT NULL,
			`group` varchar(64) NOT NULL,
			`section` varchar(64) NOT NULL,
			`key` varchar(64) NOT NULL,
			`value` mediumtext NOT NULL,
			PRIMARY KEY (`id`)
		)ENGINE=MyISAM DEFAULT CHARSET=utf8;';
		$this->db->query($sql);

		$this->modCustomizeTbl();

		/*$sql = 'CREATE TABLE IF NOT EXISTS`' . DB_PREFIX . 'rgen_theme_storage` (
			`id` int(11) NOT NULL AUTO_INCREMENT,
			`store_id` int(11) NOT NULL,
			`group` varchar(64) NOT NULL,
			`section` varchar(64) NOT NULL,
			`key` varchar(64) NOT NULL,
			`value` mediumtext NOT NULL,
			PRIMARY KEY (`id`)
		)ENGINE=MyISAM DEFAULT CHARSET=utf8;';
		$this->db->query($sql);*/

		$sql = 'CREATE TABLE IF NOT EXISTS`' . DB_PREFIX . 'rgen_modules` (
			`id` int(11) NOT NULL AUTO_INCREMENT,
			`store_id` int(11) NOT NULL,
			`group` varchar(64) NOT NULL,
			`section` varchar(64) NOT NULL,
			`key` varchar(64) NOT NULL,
			`value` mediumtext NOT NULL,
			PRIMARY KEY (`id`)
		)ENGINE=MyISAM DEFAULT CHARSET=utf8;';
		$this->db->query($sql);

		$sql = 'CREATE TABLE IF NOT EXISTS`' . DB_PREFIX . 'rgen_settings` (
			`id` int(11) NOT NULL AUTO_INCREMENT,
			`store_id` int(11) NOT NULL,
			`group` varchar(64) NOT NULL,
			`section` varchar(64) NOT NULL,
			`key` varchar(64) NOT NULL,
			`value` mediumtext NOT NULL,
			PRIMARY KEY (`id`)
		)ENGINE=MyISAM DEFAULT CHARSET=utf8;';
		$this->db->query($sql);
	}
	
	public function uninstall() {
		$this->db->query("DROP TABLE IF EXISTS `" . DB_PREFIX . $this->tbl_theme . "`");
		//$this->db->query("DROP TABLE IF EXISTS `" . DB_PREFIX . $this->tbl_theme_storage . "`");
		$this->db->query("DROP TABLE IF EXISTS `" . DB_PREFIX . $this->tbl_module . "`");
		$this->db->query("DROP TABLE IF EXISTS `" . DB_PREFIX . $this->tbl_module_customize . "`");
		$this->db->query("DROP TABLE IF EXISTS `" . DB_PREFIX . $this->tbl_settings . "`");
		$this->db->query("DELETE FROM " . DB_PREFIX . "layout_module WHERE `code` LIKE '%rgen%'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "setting WHERE `code` LIKE '%rgen%'");
	}

	public function modCustomizeTbl() {
		$sql = 'CREATE TABLE IF NOT EXISTS`' . DB_PREFIX . 'rgen_modules_customize` (
			`id` int(11) NOT NULL AUTO_INCREMENT,
			`store_id` int(11) NOT NULL,
			`group` varchar(64) NOT NULL,
			`section` varchar(64) NOT NULL,
			`key` varchar(64) NOT NULL,
			`value` mediumtext NOT NULL,
			PRIMARY KEY (`id`)
		)ENGINE=MyISAM DEFAULT CHARSET=utf8;';
		$this->db->query($sql);
	}

	/* THEME FUNCTIONS
	=====================================*/


	/* 
	MODULE FUNCTIONS
	--------------------------------------
	Add
	Edit
	Remove
	EditSection
	EditKey
	Getkey
	=====================================*/
	public function modEditsection($group, $section, $value, $store_id = 0) {
		$this->db->query(
			"DELETE FROM " . DB_PREFIX . $this->tbl_module . " WHERE 
			`store_id`	= '" . (int)$store_id . "' AND 
			`group`		= '" . $this->db->escape($group) . "' AND 
			`section`		= '" . $this->db->escape($section) . "'
		");

		//echo "<pre>".print_r($value,true)."</pre>";
		foreach ($value as $k => $v) {
			$this->db->query(
				"INSERT INTO " . DB_PREFIX . $this->tbl_module . " SET 
				`store_id`	= '" . (int)$store_id . "',
				`group`		= '" . $this->db->escape($group) . "', 
				`section`	= '" . $this->db->escape($section) . "', 
				`key`		= '" . $this->db->escape($k) . "', 
				`value`		= '" . $this->db->escape(json_encode($v)) . "'
			");
		}
	}

	public function modEditkey($group, $section, $key, $value, $store_id = 0) {
		$this->db->query(
			"DELETE FROM " . DB_PREFIX . $this->tbl_module . " WHERE 
			`store_id`	= '" . (int)$store_id . "' AND 
			`group`		= '" . $this->db->escape($group) . "' AND 
			`section`	= '" . $this->db->escape($section) . "' AND 
			`key`		= '" . $this->db->escape($key) . "'
		");
		$this->db->query(
			"INSERT INTO " . DB_PREFIX . $this->tbl_module . " SET 
			`store_id`	= '" . (int)$store_id . "',
			`group`		= '" . $this->db->escape($group) . "', 
			`section`	= '" . $this->db->escape($section) . "', 
			`key`		= '" . $this->db->escape($key) . "', 
			`value`		= '" . $this->db->escape(json_encode($value)) . "'
		");
	}

	public function modRemovekey($group, $section, $key, $store_id = 0) {
		$this->db->query(
			"DELETE FROM " . DB_PREFIX . $this->tbl_module . " WHERE 
			`store_id`	= '" . (int)$store_id . "' AND 
			`group`		= '" . $this->db->escape($group) . "' AND 
			`section`	= '" . $this->db->escape($section) . "' AND 
			`key`		= '" . $this->db->escape($key) . "'
		");
		$this->db->query(
			"DELETE FROM " . DB_PREFIX . $this->tbl_module . " WHERE 
			`store_id`	= '" . $store_id . "' AND 
			`section`	= '" . $section . "_set' AND 
			`value`	LIKE '%" . $key . "%'
		");
		$this->db->query(
			"DELETE FROM " . DB_PREFIX . $this->tbl_theme . " WHERE `key` LIKE '%" . $key . "%'
		");

		$this->db->query(
			"DELETE FROM " . DB_PREFIX . $this->tbl_module_customize . " WHERE `key` LIKE '%" . $key . "%'
		");

		// section = rgen_menu 
		$this->db->query(
			"DELETE FROM " . DB_PREFIX . "layout_module WHERE `code` LIKE '%" . $key . "%'
		");
		$this->db->query(
			"DELETE FROM " . DB_PREFIX . "setting WHERE `key` LIKE '%" . $key . "%'
		");
		
	}

	public function modAssign($group, $section, $key, $value, $store_id = 0) {
		
		// section = rgen_menu 
		$layout_code = $this->db->escape($section . '.' . $key . '.' . $value['module_id']);
		$setting_key = $this->db->escape($section . '_R.' . $key . '.' . $value['module_id']);

		$this->db->query(
			"DELETE FROM " . DB_PREFIX . "layout_module WHERE 
			`code`	LIKE '%" . $this->db->escape($section . '.' . $key) . "%'
		");
		//`code`		= '" . $layout_code . "' AND 
		$this->db->query(
			"DELETE FROM " . DB_PREFIX . "setting WHERE 
			`key`	LIKE '%" . $this->db->escape($section . '_R.' . $key) . "%' AND
			`code`		= '" . $section . "'
		");
		//`key`		= '" . $setting_key . "' AND 

		$this->db->query(
			"INSERT INTO " . DB_PREFIX . "layout_module SET 
			`layout_id`	= '" . $value['layout_id'] . "',
			`code`		= '" . $layout_code . "', 
			`position`	= '" . $this->db->escape($value['position']) . "', 
			`sort_order`= '" . (int)$value['sort_order'] . "'
		");

		$this->db->query(
			"INSERT INTO " . DB_PREFIX . "setting SET 
			`code`		= '" . $this->db->escape($section) . "',
			`key`		= '" . $setting_key . "', 
			`value`		= '" . $this->db->escape($value['status']) . "', 
			`serialized`= '0'
		");
	}

	public function modGetsection($group, $section) {
		$data = array();
		if ($section != 'oc_mods') {
			$query = $this->db->query(
				"SELECT * FROM " . DB_PREFIX . $this->tbl_module . " WHERE 
				`group`		= '" . $this->db->escape($group) . "' AND
				`section`	= '" . $this->db->escape($section) . "'
			");
			//echo "<pre>".print_r($query->rows,true)."</pre>";
			foreach ($query->rows as $result) {
				if (isset($result['value'])) {
					$data[$result['key']] = json_decode($result['value']);
				}
			}
			$newdata = isset($data) && $data != null ? $data : '';
			return $newdata;
		} else {
			$query = $this->db->query(
				"SELECT * FROM " . DB_PREFIX . "module WHERE 
				`code`		= '" . $this->db->escape($group) . "'
			");
			foreach ($query->rows as $result) {
				if (isset($result)) {
					$data[] = array(
						'code' => $result['code'],
						'module_id' => $result['module_id'],
						'name' => $result['name'],
						'setting' => unserialize($result['setting'])
					);
				}
			}
			$newdata = isset($data) && $data != null ? $data : '';
			return $newdata;
		}
	}

	public function modGetkey($group, $key) {
		$data = array();
		$query = $this->db->query(
			"SELECT * FROM " . DB_PREFIX . $this->tbl_module . " WHERE 
			`group`		= '" . $this->db->escape($group) . "' AND
			`key`		= '" . $this->db->escape($key) . "'
		");
		//echo "<pre>".print_r($query->rows,true)."</pre>";
		foreach ($query->rows as $result) {
			if (isset($result['value'])) {
				$data = json_decode($result['value']);
			}
		}
		$newdata = isset($data) && $data != null ? $data : '';
		return $newdata;
	}

	public function modGetrevsliders() {

		$data = array();
		$checkslidertbl = $this->registry->get('db')->query("SHOW TABLES LIKE '".DB_PREFIX . $this->tbl_revslider."'")->num_rows > 0 ? true : false;
		if ($checkslidertbl) {
			$query = $this->db->query("SELECT * FROM " . DB_PREFIX . $this->tbl_revslider);
			foreach ($query->rows as $result) {
				if (isset($result)) {
					$data[$result['id']] = array(
						'title' => $result['title'],
						'alias' => $result['alias'],
						'id' => $result['id'],
						'params' => json_decode($result['params'])
					);
				}
			}
		}
		
		$newdata = isset($data) && $data != null ? $data : '';
		return $newdata;
	}

	public function modGetallmodules($group) {
		$data = array();
		$query = $this->db->query(
			"SELECT * FROM `" . DB_PREFIX . $this->tbl_module . "` WHERE 
			`group` = '".$group."' AND 
			`section` NOT LIKE '%_set%';
		");
		
		foreach ($query->rows as $result) {
			if (isset($result)) {
				$data[$result['section']][$result['key']] = array(
					'id'       => $result['id'],
					'store_id' => $result['store_id'],
					'group'    => $result['group'],
					'section'  => $result['section'],
					'key'      => $result['key'],
					'value'    => json_decode($result['value'])
				);
			}
		}

		$newdata = isset($data) && $data != null ? $data : '';
		return $newdata;
	}

	/*-----------------*/

	public function modthemeEditkey($group, $section, $key, $value, $store_id = 0) {
		$this->db->query(
			"DELETE FROM " . DB_PREFIX . $this->tbl_module_customize . " WHERE 
			`store_id`	= '" . (int)$store_id . "' AND 
			`group`		= '" . $this->db->escape($group) . "' AND 
			`section`	= '" . $this->db->escape($section) . "' AND 
			`key`		= '" . $this->db->escape($key) . "'
		");

		$this->db->query(
			"INSERT INTO " . DB_PREFIX . $this->tbl_module_customize . " SET 
			`store_id`	= '" . (int)$store_id . "',
			`group`		= '" . $this->db->escape($group) . "', 
			`section`	= '" . $this->db->escape($section) . "', 
			`key`		= '" . $this->db->escape($key) . "', 
			`value`		= '" . $this->db->escape(json_encode($value)) . "'
		");

		$tmpKey = explode('.', $key);
		$this->db->query(
			"DELETE FROM " . DB_PREFIX . $this->tbl_theme . " WHERE `key` LIKE '%" . $tmpKey[1] . "%'
		");
	}
	public function modthemeSavefonts($group, $section, $value, $store_id = 0) {
		if (is_array($value)) {
			foreach ($value as $k => $v) {
				$this->db->query(
					"DELETE FROM " . DB_PREFIX . $this->tbl_module_customize . " WHERE 
					`store_id`	= '" . (int)$store_id . "' AND 
					`group`		= '" . $this->db->escape($group) . "' AND 
					`section`	= '" . $this->db->escape($section) . "' AND 
					`key`		= '" . $this->db->escape($k) . "'
				");

				$this->db->query(
					"INSERT INTO " . DB_PREFIX . $this->tbl_module_customize . " SET 
					`store_id`	= '" . (int)$store_id . "',
					`group`		= '" . $this->db->escape($group) . "', 
					`section`	= '" . $this->db->escape($section) . "', 
					`key`		= '" . $this->db->escape($k) . "', 
					`value`		= '" . $this->db->escape(json_encode($v)) . "'
				");	
			}
		}
		
	}
	public function modthemeGetsection($group, $section) {
		$data = array();
		$query = $this->db->query(
			"SELECT * FROM " . DB_PREFIX . $this->tbl_module_customize . " WHERE 
			`group`		= '" . $this->db->escape($group) . "' AND
			`section`		= '" . $this->db->escape($section) . "'
		");
		//echo "<pre>".print_r($query->rows,true)."</pre>";
		foreach ($query->rows as $result) {
			if (isset($result['value'])) {
				$data[$result['key']] = json_decode($result['value']);
			}
		}
		$newdata = isset($data) && $data != null ? $data : '';
		return $newdata;
	}
	public function modthemeGetkey($group, $key) {
		$data = array();
		$query = $this->db->query(
			"SELECT * FROM " . DB_PREFIX . $this->tbl_module_customize . " WHERE 
			`group`		= '" . $this->db->escape($group) . "' AND
			`key`		= '" . $this->db->escape($key) . "'
		");
		//echo "<pre>".print_r($query->rows,true)."</pre>";
		foreach ($query->rows as $result) {
			if (isset($result['value'])) {
				$data = json_decode($result['value']);
			}
		}
		$newdata = isset($data) && $data != null ? $data : '';
		return $newdata;
	}
	public function modthemeRemovekey($group, $key) {
		$this->db->query(
			"DELETE FROM " . DB_PREFIX . $this->tbl_module_customize . " WHERE 
			`group`		= '" . $this->db->escape($group) . "' AND 
			`key`		= '" . $this->db->escape($key) . "'".
			"DELETE FROM " . DB_PREFIX . $this->tbl_settings . " WHERE 
			`group`		= '" . $this->db->escape($group) . "' AND 
			`key`		= '" . $this->db->escape($key) . "'"
		);
	}

	
	/* 
	THEME STORAGE FUNCTIONS
	--------------------------------------
	storageNewtheme
	=====================================*/
	public function storageNewtheme($theme_id, $group_theme, $group_setting, $store_id = 0) {
		$query_theme = $this->db->query(
			"SELECT * FROM " . DB_PREFIX . $this->tbl_theme . " WHERE 
			`store_id`	= '" . (int)$store_id . "' AND 
			`group`		= '" . $this->db->escape($group_theme) . "'
		");

		foreach ($query_theme->rows as $result) {
			if (isset($result)) {
				$data['theme'][] = array(
					"store_id"	=> (int)$store_id,
					"group"		=> $result['group'], 
					"section"	=> $result['section'], 
					"key"		=> $result['key'], 
					"value"		=> json_decode($result['value'])
				);
			}
		}

		$query_setting = $this->db->query(
			"SELECT * FROM " . DB_PREFIX . $this->tbl_settings . " WHERE 
			`store_id`	= '" . (int)$store_id . "' AND 
			`group`		= '" . $this->db->escape($group_setting) . "'
		");
		foreach ($query_setting->rows as $result) {
			if (isset($result)) {
				$data['setting'][] = array(
					"store_id"	=> (int)$store_id,
					"group"		=> $result['group'], 
					"section"	=> $result['section'], 
					"key"		=> $result['key'], 
					"value"		=> json_decode($result['value'])
				);
			}
		}

		$newdata = isset($data) && $data != null ? $data : '';
		return $newdata;
	}

	public function storageLoadtheme($data, $store_id = 0) {
		if (isset($data) && sizeof($data) > 0 && $data != '') {
			foreach ($data as $key => $value) {
				switch ($key) {
					case 'theme':
						$this->loadthemedata($this->tbl_theme, $value, $store_id);
						break;
					
					case 'setting':
						$this->loadthemedata($this->tbl_settings, $value, $store_id);
						break;
				}
			}	
		} else {
			$this->db->query("TRUNCATE TABLE `" . DB_PREFIX . $this->tbl_theme . "`;");
			$this->db->query("TRUNCATE TABLE `" . DB_PREFIX . $this->tbl_settings . "`;");
		}
		
	}
	public function loadthemedata($table, $data, $store_id) {
		foreach ($data as $k => $v) {
			$themedata = $this->db->query(
				"SELECT * FROM " . DB_PREFIX . $table . " WHERE 
				`store_id`	= '" . (int)$store_id . "' AND 
				`key`		= '" . $this->db->escape($v['key']) . "'
			");

			if (sizeof($themedata->rows) > 0) {
				$this->db->query(
					"UPDATE " . DB_PREFIX . $table . " SET 
					`value`		= '" . $this->db->escape(json_encode($v['value'])) . "' WHERE 
					`store_id`	= '" . (int)$store_id . "' AND 
					`section`	= '" . $this->db->escape($v['section']) . "' AND 
					`key`		= '" . $this->db->escape($v['key']) . "' 
				");
			} else {
				$this->db->query(
					"INSERT INTO " . DB_PREFIX . $table . " SET 
					`store_id`	= '" . (int)$store_id . "',
					`group`		= '" . $this->db->escape($v['group']) . "', 
					`section`	= '" . $this->db->escape($v['section']) . "', 
					`key`		= '" . $this->db->escape($v['key']) . "', 
					`value`		= '" . $this->db->escape(json_encode($v['value'])) . "'
				");
			}
		}
	}


	/* 
	THEME FUNCTIONS
	--------------------------------------
	Add
	Edit
	Remove
	EditSection
	EditKey
	Getkey
	=====================================*/
	public function themeEditsection($group, $section, $value, $store_id = 0) {
		$this->db->query(
			"DELETE FROM " . DB_PREFIX . $this->tbl_theme . " WHERE 
			`store_id`	= '" . (int)$store_id . "' AND 
			`group`		= '" . $this->db->escape($group) . "' AND 
			`section`		= '" . $this->db->escape($section) . "'
		");

		//echo "<pre>".print_r($value,true)."</pre>";
		foreach ($value as $k => $v) {
			$this->db->query(
				"INSERT INTO " . DB_PREFIX . $this->tbl_theme . " SET 
				`store_id`	= '" . (int)$store_id . "',
				`group`		= '" . $this->db->escape($group) . "', 
				`section`	= '" . $this->db->escape($section) . "', 
				`key`		= '" . $this->db->escape($k) . "', 
				`value`		= '" . $this->db->escape(json_encode($v)) . "'
			");
		}
	}
	public function themeEditkey($group, $section, $key, $value, $store_id = 0) {
		$this->db->query(
			"DELETE FROM " . DB_PREFIX . $this->tbl_theme . " WHERE 
			`store_id`	= '" . (int)$store_id . "' AND 
			`group`		= '" . $this->db->escape($group) . "' AND 
			`section`	= '" . $this->db->escape($section) . "' AND 
			`key`		= '" . $this->db->escape($key) . "'
		");

		$this->db->query(
			"INSERT INTO " . DB_PREFIX . $this->tbl_theme . " SET 
			`store_id`	= '" . (int)$store_id . "',
			`group`		= '" . $this->db->escape($group) . "', 
			`section`	= '" . $this->db->escape($section) . "', 
			`key`		= '" . $this->db->escape($key) . "', 
			`value`		= '" . $this->db->escape(json_encode($value)) . "'
		");
	}
	public function themeSavefonts($group, $section, $value, $store_id = 0) {
		if (is_array($value)) {
			foreach ($value as $k => $v) {
				$this->db->query(
					"DELETE FROM " . DB_PREFIX . $this->tbl_theme . " WHERE 
					`store_id`	= '" . (int)$store_id . "' AND 
					`group`		= '" . $this->db->escape($group) . "' AND 
					`section`	= '" . $this->db->escape($section) . "' AND 
					`key`		= '" . $this->db->escape($k) . "'
				");

				$this->db->query(
					"INSERT INTO " . DB_PREFIX . $this->tbl_theme . " SET 
					`store_id`	= '" . (int)$store_id . "',
					`group`		= '" . $this->db->escape($group) . "', 
					`section`	= '" . $this->db->escape($section) . "', 
					`key`		= '" . $this->db->escape($k) . "', 
					`value`		= '" . $this->db->escape(json_encode($v)) . "'
				");	
			}
		}
		
	}
	public function themeGetsection($group, $section) {
		$data = array();
		$query = $this->db->query(
			"SELECT * FROM " . DB_PREFIX . $this->tbl_theme . " WHERE 
			`group`		= '" . $this->db->escape($group) . "' AND
			`section`		= '" . $this->db->escape($section) . "'
		");
		//echo "<pre>".print_r($query->rows,true)."</pre>";
		foreach ($query->rows as $result) {
			if (isset($result['value'])) {
				$data[$result['key']] = json_decode($result['value']);
			}
		}
		$newdata = isset($data) && $data != null ? $data : '';
		return $newdata;
	}
	public function themeGetkey($group, $key) {
		$data = array();
		$query = $this->db->query(
			"SELECT * FROM " . DB_PREFIX . $this->tbl_theme . " WHERE 
			`group`		= '" . $this->db->escape($group) . "' AND
			`key`		= '" . $this->db->escape($key) . "'
		");
		//echo "<pre>".print_r($query->rows,true)."</pre>";
		foreach ($query->rows as $result) {
			if (isset($result['value'])) {
				$data = json_decode($result['value']);
			}
		}
		$newdata = isset($data) && $data != null ? $data : '';
		return $newdata;
	}
	public function themeRemovekey($group, $key) {
		$this->db->query(
			"DELETE FROM " . DB_PREFIX . $this->tbl_theme . " WHERE 
			`group`		= '" . $this->db->escape($group) . "' AND 
			`key`		= '" . $this->db->escape($key) . "'".
			"DELETE FROM " . DB_PREFIX . $this->tbl_settings . " WHERE 
			`group`		= '" . $this->db->escape($group) . "' AND 
			`key`		= '" . $this->db->escape($key) . "'"
		);
	}

	



	/* 
	SETTINGS FUNCTIONS
	--------------------------------------
	Add
	Edit
	Remove
	Getgroup
	Getkey
	=====================================*/
	public function settingsAdd($group, $key, $value, $store_id = 0) {
		$this->db->query(
			"INSERT INTO " . DB_PREFIX . $this->tbl_settings . " SET 
			`store_id`	= '" . (int)$store_id . "',
			`group`		= '" . $this->db->escape($group) . "', 
			`key`		= '" . $this->db->escape($key) . "', 
			`value`		= '" . $this->db->escape(json_encode($value)) . "'
		");
	}

	public function settingsEdit($group, $key, $value, $store_id = 0) {
		$this->db->query(
			"DELETE FROM " . DB_PREFIX . $this->tbl_settings . " WHERE 
			`store_id`	= '" . (int)$store_id . "' AND 
			`group`		= '" . $this->db->escape($group) . "'
		");

		$this->db->query(
			"INSERT INTO " . DB_PREFIX . $this->tbl_settings . " SET 
			`store_id`	= '" . (int)$store_id . "',
			`group`		= '" . $this->db->escape($group) . "', 
			`key`		= '" . $this->db->escape($key) . "', 
			`value`		= '" . $this->db->escape(json_encode($value)) . "'
		");
	}

	public function settingsGetgroup($group) {
		$data = array();
		$query = $this->db->query(
			"SELECT * FROM " . DB_PREFIX . $this->tbl_settings . " WHERE 
			`group`		= '" . $this->db->escape($group) . "'
		");

		foreach ($query->rows as $key => $result) {
			if (isset($result['value'])) {
				$data[] = json_decode($result['value']);
			}
		}
		//echo "<pre>".print_r($data,true)."</pre>";
		$newdata = isset($data) && $data != null ? $data : '';
		return $newdata;
	}

	public function settingsGetkey($group, $key) {
		$data = array();
		$query = $this->db->query(
			"SELECT * FROM " . DB_PREFIX . $this->tbl_settings . " WHERE 
			`group`		= '" . $this->db->escape($group) . "' AND
			`key`		= '" . $this->db->escape($key) . "'
		");
		foreach ($query->rows as $result) {
			if (isset($result['value'])) {
				$data = json_decode($result['value']);
			}
		}
		$newdata = isset($data) && $data != null ? $data : '';
		return $newdata;
	}

	public function settingsSave($group, $section, $value, $store_id = 0) {
		if (is_array($value)) {
			foreach ($value as $k => $v) {
				$this->db->query(
					"DELETE FROM " . DB_PREFIX . $this->tbl_settings . " WHERE 
					`store_id`	= '" . (int)$store_id . "' AND 
					`group`		= '" . $this->db->escape($group) . "' AND 
					`section`	= '" . $this->db->escape($section) . "' AND 
					`key`		= '" . $this->db->escape($k) . "'
				");

				$this->db->query(
					"INSERT INTO " . DB_PREFIX . $this->tbl_settings . " SET 
					`store_id`	= '" . (int)$store_id . "',
					`group`		= '" . $this->db->escape($group) . "', 
					`section`	= '" . $this->db->escape($section) . "', 
					`key`		= '" . $this->db->escape($k) . "', 
					`value`		= '" . $this->db->escape(json_encode($v)) . "'
				");	
			}
		}
	}



	/* 
	BACKUP RESTORE
	=====================================*/
	public function backup($type, $mod_name) {
		
		switch ($type) {
			case 'module':
				$table         = DB_PREFIX.'rgen_modules';
				$table_theme   = DB_PREFIX.'rgen_modules_customize';
				$table_layout  = DB_PREFIX.'layout_module';
				$table_setting = DB_PREFIX.'setting';

				/*======================*/
				$output  = '';
				
				$output .= "-- ------------------------------------" . "\n";
				$output .= "-- " . "\n";
				$output .= "-- Module - " . $mod_name . "\n";
				$output .= "-- " . "\n";
				$output .= "-- ------------------------------------" . "\n\n";

				/*======================*/
				// Module data
				$query      = $this->db->query("SELECT * FROM `" .$table. "` WHERE `section` LIKE '%".$mod_name."%'");
				$field_keys = array('store_id', 'group', 'section', 'key', 'value');
				$output .= "DELETE FROM `" .$table. "` WHERE `section` LIKE '%" .$mod_name. "%';" . "\n\n";

				if (sizeof($query->rows) > 0) {
					foreach ($query->rows as $row_value) {
						$output .= $this->dbProcess($row_value, $field_keys, $table);
					}
				}

				/*======================*/
				// Theme data
				$query      = $this->db->query("SELECT * FROM `" .$table_theme. "` WHERE `key` LIKE '%".$mod_name."%'");
				$field_keys = array('store_id', 'group', 'section', 'key', 'value');
				$output .= "\n\n"."DELETE FROM `" .$table_theme. "` WHERE `key` LIKE '%" .$mod_name. "%';" . "\n\n";

				if (sizeof($query->rows) > 0) {
					foreach ($query->rows as $row_value) {
						$output .= $this->dbProcess($row_value, $field_keys, $table_theme);
					}
				}

				/*======================*/
				// Layout data
				$query      = $this->db->query("SELECT * FROM `" .$table_layout. "` WHERE `code` LIKE '%".$mod_name."%'");
				$field_keys = array('layout_id', 'code', 'position', 'sort_order');
				$output .= "\n\n"."DELETE FROM `" .$table_layout. "` WHERE `code` LIKE '%" .$mod_name. "%';" . "\n\n";

				if (isset($query->rows) && sizeof($query->rows) > 0) {
					foreach ($query->rows as $row_value) {
						$output .= $this->dbProcess($row_value, $field_keys, $table_layout);
					}
				}

				/*======================*/
				// Settings data
				$query = $this->db->query("SELECT * FROM `" .$table_setting. "` WHERE `code` LIKE '%".$mod_name."%'");
				$field_keys = array('store_id', 'code', 'key', 'value', 'serialized');
				$output .= "\n\n"."DELETE FROM `" .$table_setting. "` WHERE `code` LIKE '%" .$mod_name. "%';" . "\n\n";

				if (isset($query->rows) && sizeof($query->rows) > 0) {
					foreach ($query->rows as $row_value) {
						$output .= $this->dbProcess($row_value, $field_keys, $table_setting);
					}
				}
				
				return $output;
				break;

			case 'theme':
				$table         = DB_PREFIX.'rgen_theme';
				$table_setting = DB_PREFIX.'rgen_settings';

				$output  = '';
				
				$output .= "-- ------------------------------------" . "\n";
				$output .= "-- " . "\n";
				$output .= "-- R.Gen theme setting" . "\n";
				$output .= "-- " . "\n";
				$output .= "-- ------------------------------------" . "\n\n";

				$query = $this->db->query("SELECT * FROM " . $table . " WHERE `group` = 'rgen_theme'");
				$field_keys = array('store_id', 'group', 'section', 'key', 'value');
				$output .= 'TRUNCATE TABLE `' . $table . '`;' . "\n\n";

				if (sizeof($query->rows) > 0) {
					foreach ($query->rows as $row_value) {
						$output .= $this->dbProcess($row_value, $field_keys, $table);
					}
				}

				$query = $this->db->query("SELECT * FROM " . $table_setting . " WHERE `group` = 'rgen_settings'");
				$field_keys = array('store_id', 'group', 'section', 'key', 'value');
				$output .= "\n\n".'TRUNCATE TABLE `' . $table_setting . '`;' . "\n\n";
				
				if (sizeof($query->rows) > 0) {
					foreach ($query->rows as $row_value) {
						$output .= $this->dbProcess($row_value, $field_keys, $table_setting);
					}
				}

				return $output;
				break;
		}
	}

	private function dbProcess($dbData, $field_keys, $table){
		$output = '';
		$fields = '';
		$values = '';

		foreach ($field_keys as $field_val) {
			$fields .= '`' . $field_val . '`, ';
			
			$value = $dbData[$field_val];

			$value = str_replace(array("\x00", "\x0a", "\x0d", "\x1a"), array('\0', '\n', '\r', '\Z'), $value);
			$value = str_replace(array("\n", "\r", "\t"), array('\n', '\r', '\t'), $value);
			$value = str_replace('\\', '\\\\',	$value);
			$value = str_replace('\'', '\\\'',	$value);
			$value = str_replace('\\\n', '\n',	$value);
			$value = str_replace('\\\r', '\r',	$value);
			$value = str_replace('\\\t', '\t',	$value);
			if (in_array($table, array(
				DB_PREFIX . 'rgen_modules',
				DB_PREFIX . 'rgen_theme',
				DB_PREFIX . 'rgen_settings'
			))) {
				$value = str_replace('\n', '\\\n', $value);
				$value = str_replace('\r', '\\\r', $value);
				$value = str_replace('\t', '\\\t', $value);
			}

			$values .= '\'' . $value . '\', ';
		}

		$output .= 'INSERT INTO `' . $table . '` (' . preg_replace('/, $/', '', $fields) . ') VALUES (' . preg_replace('/, $/', '', $values) . ');' . "\n";

		return $output;
	}

	public function restore($sql) {
		foreach (explode(";\n", $sql) as $sql) {
			$sql = trim($sql);

			$dblist = array(
				'rgen_modules',
				'rgen_modules_customize',
				'layout_module',
				'setting',
				'rgen_theme',
				'rgen_settings'
			);
			if ($sql) {
				foreach ($dblist as $dbname) {
					if ($this->rgen->factory->checkstr($sql, '`'.DB_PREFIX.$dbname.'`')) {
						$this->db->query($sql);
					}
					if ($this->rgen->factory->checkstr($sql, '`'.$dbname.'`')) {
						$newSql = str_replace('`'.$dbname.'`', '`'.DB_PREFIX.$dbname.'`', $sql);
						$this->db->query($newSql);
					}	
				}
			}
		}
		$this->cache->delete('*');
	}

	


}?>