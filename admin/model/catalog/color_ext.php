<?php

class ModelCatalogColorExt extends Model {

	protected $count = 0;



	public function getColors($data = array()) {

		if (isset($data['columns'])) {

			$columns = $data['columns'];

		} else {

			$columns = array('name', 'sort_order');

		}



		$sql = "SELECT SQL_CALC_FOUND_ROWS o.*, od.*";



		if (in_array("color_value", $columns)) {

			$sql .= ", GROUP_CONCAT(ov.color_value_id ORDER BY ov.sort_order SEPARATOR '_') AS color_value_ids, GROUP_CONCAT(ovd.name ORDER BY ov.sort_order SEPARATOR '<br/>') AS color_value_names";

		}



		$sql .= " FROM `" . DB_PREFIX . "color` o LEFT JOIN " . DB_PREFIX . "color_description od ON (o.color_id = od.color_id AND od.language_id = '" . (int)$this->config->get('config_language_id') . "')";



		if (in_array("color_value", $columns)) {

			$sql .= " LEFT JOIN " . DB_PREFIX . "color_value ov ON (o.color_id = ov.color_id) LEFT JOIN " . DB_PREFIX . "color_value_description ovd ON (ov.color_value_id = ovd.color_value_id AND ovd.language_id = '" . (int)$this->config->get('config_language_id') . "')";

		}



		$where = array();



		$int_colors = array(

			'id'    => 'o.color_id',

		);



		foreach ($int_colors as $key => $value) {

			if (isset($data["filter_$key"]) && !is_null($data["filter_$key"])) {

				$where[] = "$value = '" . (int)$data["filter_$key"] . "'";

			}

		}



		$exact_filters = array(

			'type'      => 'o.type',

		);



		foreach ($exact_filters as $key => $value) {

			if (isset($data["filter_$key"]) && !is_null($data["filter_$key"])) {

				$where[] = "$value = '" . $this->db->escape($data["filter_$key"]) . "'";

			}

		}



		$int_interval_colors = array(

			'sort_order'    => 'o.sort_order',

		);



		foreach ($int_interval_colors as $key => $value) {

			if (isset($data["filter_$key"]) && !is_null($data["filter_$key"])) {

				if ($this->config->get('aqe_interval_color')) {

					$where[] = $this->colorInterval($data["filter_$key"], $value);

				} else {

					$where[] = "$value = '" . (int)$data["filter_$key"] . "'";

				}

			}

		}



		$anywhere_colors = array(

			'name'      => 'od.name',

		);



		foreach ($anywhere_colors as $key => $value) {

			if (!empty($data["filter_$key"])) {

				if ($this->config->get('aqe_match_anywhere')) {

					$where[] = "$value LIKE '%" . $this->db->escape($data["filter_$key"]) . "%'";

				} else {

					$where[] = "$value LIKE '" . $this->db->escape($data["filter_$key"]) . "%'";

				}

			}

		}



		if ($where) {

			$sql .= " WHERE " . implode($where, " AND ");

		}



		$sql .= " GROUP BY o.color_id";



		$having = array();



		$anywhere_colors = array(

			'color_value' => 'color_value_names',

		);



		foreach ($anywhere_colors as $key => $value) {

			if (!empty($data["filter_$key"])) {

				if ($this->config->get('aqe_match_anywhere')) {

					$having[] = "$value LIKE '%" . $this->db->escape($data["filter_$key"]) . "%'";

				} else {

					$having[] = "$value LIKE '" . $this->db->escape($data["filter_$key"]) . "%'";

				}

			}

		}



		if ($having) {

			$sql .= " HAVING " . implode($having, " AND ");

		}



		$sort_data = array(

			'od.name',

			'o.color_id',

			'o.type',

			'o.sort_order',

		);



		if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {

			$sql .= " ORDER BY " . $data['sort'];

		} else {

			$sql .= " ORDER BY od.name";

		}



		if (isset($data['order']) && ($data['order'] == 'DESC')) {

			$sql .= " DESC";

		} else {

			$sql .= " ASC";

		}



		if (isset($data['start']) || isset($data['limit'])) {

			if ($data['start'] < 0) {

				$data['start'] = 0;

			}



			if ($data['limit'] < 1) {

				$data['limit'] = 20;

			}



			$sql .= " LIMIT " . (int)$data['start'] . "," . (int)$data['limit'];

		}



		$query = $this->db->query($sql);



		$count = $this->db->query("SELECT FOUND_ROWS() AS count");

		$this->count = ($count->num_rows) ? (int)$count->row['count'] : 0;



		return $query->rows;

	}



	public function getTotalColors() {

		return $this->count;

	}



	public function getColorValues($data = array()) {

		$sql = "SELECT * FROM " . DB_PREFIX . "color_value ov LEFT JOIN " . DB_PREFIX . "color_value_description ovd ON (ov.color_value_id = ovd.color_value_id) WHERE ovd.language_id = '" . (int)$this->config->get('config_language_id') . "'";



		if (!empty($data['filter_name'])) {

			$sql .= " AND ovd.name LIKE '" . $this->db->escape($data['filter_name']) . "%'";

		}



		$sort_data = array(

			'ovd.name',

			'ov.sort_order'

		);



		if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {

			$sql .= " ORDER BY " . $data['sort'];

		} else {

			$sql .= " ORDER BY ovd.name";

		}



		if (isset($data['order']) && ($data['order'] == 'DESC')) {

			$sql .= " DESC";

		} else {

			$sql .= " ASC";

		}



		if (isset($data['start']) || isset($data['limit'])) {

			if ($data['start'] < 0) {

				$data['start'] = 0;

			}



			if ($data['limit'] < 1) {

				$data['limit'] = 20;

			}



			$sql .= " LIMIT " . (int)$data['start'] . "," . (int)$data['limit'];

		}



		$query = $this->db->query($sql);



		return $query->rows;

	}



	public function quickEditColor($color_id, $column, $value, $lang_id=null, $data=null) {

		$editable = array('sort_order', 'type');

		$result = false;

		if (in_array($column, $editable)) {

			if ($column == "type") {

				$result = $this->db->query("UPDATE `" . DB_PREFIX . "color` SET " . $column . " = '" . $this->db->escape($value) . "' WHERE color_id = '" . (int)$color_id . "'");



				if (!in_array($value, array('select', 'radio', 'checkbox', 'image'))) {

					$this->db->query("DELETE FROM " . DB_PREFIX . "color_value WHERE color_id = '" . (int)$color_id . "'");

					$this->db->query("DELETE FROM " . DB_PREFIX . "color_value_description WHERE color_id = '" . (int)$color_id . "'");

				}

			} else {

				$result = $this->db->query("UPDATE `" . DB_PREFIX . "color` SET " . $column . " = '" . (int)$value . "' WHERE color_id = '" . (int)$color_id . "'");

			}

		} else if (in_array($column, array('name'))) {

			if (isset($data['value']) && is_array($data['value'])) {

				foreach ((array)$data['value'] as $language_id => $value) {

					$this->db->query("UPDATE " . DB_PREFIX . "color_description SET name = '" . $this->db->escape($value) . "' WHERE color_id = '" . (int)$color_id . "' AND language_id = '" . (int)$language_id . "'");

				}

				$result = 1;

			} else if ($value) {

				$result = $this->db->query("UPDATE " . DB_PREFIX . "color_description SET name = '" . $this->db->escape($value) . "' WHERE color_id = '" . (int)$color_id . "' AND language_id = '" . (int)$lang_id . "'");

				$result = 1;

			} else {

				$result = 0;

			}

		} else if (in_array($column, array('color_value', 'color_values'))) {

			$this->db->query("DELETE FROM " . DB_PREFIX . "color_value WHERE color_id = '" . (int)$color_id . "'");

			$this->db->query("DELETE FROM " . DB_PREFIX . "color_value_description WHERE color_id = '" . (int)$color_id . "'");



			if (isset($data['color_value'])) {

				foreach ($data['color_value'] as $color_value) {

					if ($color_value['color_value_id']) {

						$this->db->query("INSERT INTO " . DB_PREFIX . "color_value SET color_value_id = '" . (int)$color_value['color_value_id'] . "', color_id = '" . (int)$color_id . "', image = '" . $this->db->escape(html_entity_decode($color_value['image'], ENT_QUOTES, 'UTF-8')) . "', sort_order = '" . (int)$color_value['sort_order'] . "'");

					} else {

						$this->db->query("INSERT INTO " . DB_PREFIX . "color_value SET color_id = '" . (int)$color_id . "', image = '" . $this->db->escape(html_entity_decode($color_value['image'], ENT_QUOTES, 'UTF-8')) . "', sort_order = '" . (int)$color_value['sort_order'] . "'");

					}



					$color_value_id = $this->db->getLastId();



					foreach ($color_value['color_value_description'] as $language_id => $color_value_description) {

						$this->db->query("INSERT INTO " . DB_PREFIX . "color_value_description SET color_value_id = '" . (int)$color_value_id . "', language_id = '" . (int)$language_id . "', color_id = '" . (int)$color_id . "', name = '" . $this->db->escape($color_value_description['name']) . "'");

					}

				}

			}

			$result = 1;

		}



		return $result;

	}



	public function colorInterval($color, $field, $date=false) {

		if ($date) {

			if (preg_match('/^(!=|<>)\s*(\d{2,4}-\d{1,2}-\d{1,2})$/', html_entity_decode(trim($color)), $matches) && count($matches) == 3) {

				return "DATE($field) <> DATE('" . $matches[2] . "')";

			} else if (preg_match('/^(\d{2,4}-\d{1,2}-\d{1,2})\s*(<|<=)\s*(\d{2,4}-\d{1,2}-\d{1,2})$/', html_entity_decode(trim($color)), $matches) && count($matches) == 4 && strtotime($matches[1]) <= strtotime($matches[3])) {

				return "DATE('" . $matches[1] . "') ${matches[2]} DATE($field) AND DATE($field) ${matches[2]} DATE('" . $matches[3] . "')";

			} else if (preg_match('/^(\d{2,4}-\d{1,2}-\d{1,2})\s*(>|>=)\s*(\d{2,4}-\d{1,2}-\d{1,2})$/', html_entity_decode(trim($color)), $matches) && count($matches) == 4 && strtotime($matches[1]) >= strtotime($matches[3])) {

				return "DATE('" . $matches[1] . "') ${matches[2]} DATE($field) AND DATE($field) ${matches[2]} DATE('" . $matches[3] . "')";

			} else if (preg_match('/^(<|<=|>|>=)\s*(\d{2,4}-\d{1,2}-\d{1,2})$/', html_entity_decode(trim($color)), $matches) && count($matches) == 3) {

				return "DATE($field) ${matches[1]} DATE('" . $matches[2] . "')";

			} else if (preg_match('/^(\d{2,4}-\d{1,2}-\d{1,2})\s*(>|>=|<|<=)$/', html_entity_decode(trim($color)), $matches) && count($matches) == 3) {

				return "DATE('" . $matches[1] . "') ${matches[2]} DATE($field)";

			} else {

				return "DATE(${field}) = DATE('${color}')";

			}

		} else {

			if (preg_match('/^(!=|<>)\s*(-?\d+\.?\d*)$/', html_entity_decode(trim(str_replace(",", ".", $color))), $matches) && count($matches) == 3) {

				return "$field <> '" . (float)$matches[2] . "'";

			} else if (preg_match('/^(-?\d+\.?\d*)\s*(<|<=)\s*(-?\d+\.?\d*)$/', html_entity_decode(trim(str_replace(",", ".", $color))), $matches) && count($matches) == 4 && (float)$matches[1] <= (float)$matches[3]) {

				return "'" . (float)$matches[1] . "' ${matches[2]} $field AND $field ${matches[2]} '" . (float)$matches[3] . "'";

			} else if (preg_match('/^(-?\d+\.?\d*)\s*(>|>=)\s*(-?\d+\.?\d*)$/', html_entity_decode(trim(str_replace(",", ".", $color))), $matches) && count($matches) == 4 && (float)$matches[1] >= (float)$matches[3]) {

				return "'" . (float)$matches[1] . "' ${matches[2]} $field AND $field ${matches[2]} '" . (float)$matches[3] . "'";

			} else if (preg_match('/^(<|<=|>|>=)\s*(-?\d+\.?\d*)$/', html_entity_decode(trim(str_replace(",", ".", $color))), $matches) && count($matches) == 3) {

				return "$field ${matches[1]} '" . (float)$matches[2] . "'";

			} else if (preg_match('/^(-?\d+\.?\d*)\s*(>|>=|<|<=)$/', html_entity_decode(trim(str_replace(",", ".", $color))), $matches) && count($matches) == 3) {

				return "'" . (float)$matches[1] . "' ${matches[2]} $field";

			} else {

				return $field . " = '" . $this->db->escape($color) . "'";

			}

		}

	}

}

